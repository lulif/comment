package org.imooc.dto;

import org.imooc.bean.Ad;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

//由于DTO中的大多数据是返回给页面的，所以要加@JsonInclude
//Include.NON_NULL表示如果json里的数据为空就不上传
@JsonInclude(Include.NON_NULL)
public class AdDto extends Ad{
    private String img;
    //SpringMVC提供 表单提交上来的文件	
    private MultipartFile imgFile;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public MultipartFile getImgFile() {
        return imgFile;
    }

    public void setImgFile(MultipartFile imgFile) {
        this.imgFile = imgFile;
    }
    
    
}
