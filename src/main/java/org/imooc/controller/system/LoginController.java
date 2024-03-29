package org.imooc.controller.system;

import javax.servlet.http.HttpSession;

import org.imooc.constant.PageCodeEnum;
import org.imooc.constant.SessionKeyConst;
import org.imooc.dto.GroupDto;
import org.imooc.dto.UserDto;
import org.imooc.service.GroupService;
import org.imooc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * 登录相关
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private HttpSession session;

	/**
	 * 登录页面
	 */
	@RequestMapping
	public String index() {
		return "/system/login";
	}

	/**
	 * 处理session超时
	 */
	@RequestMapping("/sessionTimeout")
	public String sessionTimeout(Model model) {
		model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.SESSION_TIMEOUT);
		return "/system/error";
	}
	
	/**
	 * 没有权限访问
	 */
	@RequestMapping("/noAuth")
	public String noAuth(Model model) {
		model.addAttribute(PageCodeEnum.KEY, PageCodeEnum.NO_AUTH);
		//session设置为失效
		session.invalidate();
		return "/system/error";
	}

	/**
	 * 验证用户名/密码是否正确 验证通过跳转至后台管理首页，验证失败，返回至登录页。
	 * RedirectAttributes解决重定向时，向页面传递的参数，利用httpSession
	 */
	@RequestMapping("/validate")
	public String validate(UserDto userDto, RedirectAttributes attr) {
		if (userService.validate(userDto)) {
			session.setAttribute(SessionKeyConst.USER_INFO, userDto);
			GroupDto groupDto = groupService.getByIdWithMenuAction(userDto.getGroupId());
			session.setAttribute(SessionKeyConst.MENU_INFO,groupDto.getMenuDtoList());
			session.setAttribute(SessionKeyConst.ACTION_INFO, groupDto.getActionDtoList());
			return "redirect:/index";
		}
		//重定向带参数，但可以隐藏参数；session中，session在跳到页面后马上移除对象
		attr.addFlashAttribute(PageCodeEnum.KEY, PageCodeEnum.LOGIN_FAIL);
		return "redirect:/login";
	}
}