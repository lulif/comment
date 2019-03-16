package org.imooc.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.imooc.bean.Ad;
import org.imooc.dao.AdDao;
import org.imooc.dto.AdDto;
import org.imooc.service.AdService;
import org.imooc.util.FileUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class AdServiceImpl implements AdService {

	@Autowired
	private AdDao adDao;

	//spring读取properties文件
	@Value("${adImage.savePath}")
	private String adImageSavePath;

	@Value("${adImage.url}")
	private String adImageUrl;

	@Override
	// TODO 可以改成获取失败详细原因
	public boolean add(AdDto adDto) {
		Ad ad = new Ad();
		ad.setTitle(adDto.getTitle());
		ad.setLink(adDto.getLink());
		ad.setWeight(adDto.getWeight());
		if (adDto.getImgFile() != null && adDto.getImgFile().getSize() > 0) {
			//加一个时间戳 防止重名
			String fileName = System.currentTimeMillis() + "_" + adDto.getImgFile().getOriginalFilename();
			File file = new File(adImageSavePath + fileName);
			//获取文件夹，判断文件夹是否存在
			File fileFolder = new File(adImageSavePath);
			if (!fileFolder.exists()) {
				fileFolder.mkdirs();
			}
			//保存文件到file
			try {
				//transferTo()表示将东西转移到一个文件夹
				adDto.getImgFile().transferTo(file);
				ad.setImgFileName(fileName);
				adDao.insert(ad);
				return true;
			} catch (IllegalStateException | IOException e) {
				// TODO 需要添加日志
				return false;
			}
		} else {
			return false;
		}
	}

	public List<AdDto> searchByPage(AdDto adDto) {
		List<AdDto> result = new ArrayList<AdDto>();
		Ad condition = new Ad();
		//Spring提供 的bean拷贝,属性名相同就把值复制过去
		//省去ad.setXXX(adDto.getXXX());
		BeanUtils.copyProperties(adDto, condition);
		
		List<Ad> adList = adDao.selectByPage(condition);
		for (Ad ad : adList) {
			AdDto adDtoTemp = new AdDto();
			result.add(adDtoTemp);
			adDtoTemp.setImg(adImageUrl + ad.getImgFileName());
			BeanUtils.copyProperties(ad,adDtoTemp);
		}
		return result;
	}

	@Override
	public AdDto getById(Long id) {
		AdDto result = new AdDto();
		Ad ad = adDao.selectById(id);
		BeanUtils.copyProperties(ad, result);
		result.setImg(adImageUrl + ad.getImgFileName());
		return result;
	}

	@Override
	public boolean modify(AdDto adDto) {
		Ad ad = new Ad();
		BeanUtils.copyProperties(adDto, ad);
		String fileName = null;
		if (adDto.getImgFile() != null && adDto.getImgFile().getSize() > 0) {
			try {
				//FileUtil做一些对于文件的操作
				fileName = FileUtil.save(adDto.getImgFile(), adImageSavePath);
				ad.setImgFileName(fileName);
			} catch (IllegalStateException | IOException e) {
				// TODO 需要添加日志
				return false;
			}
		}
		int updateCount = adDao.update(ad);
		if (updateCount != 1) {
			return false;
		}
		if (fileName != null) {
			return FileUtil.delete(adImageSavePath + adDto.getImgFileName());
		}
		return true;
	}
	
	@Override
	public boolean remove(Long id) {
		Ad ad = adDao.selectById(id);
		int deleteRows = adDao.delete(id);
		FileUtil.delete(adImageSavePath + ad.getImgFileName());
		return deleteRows == 1;
	}
}
