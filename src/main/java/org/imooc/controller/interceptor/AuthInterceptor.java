package org.imooc.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.imooc.util.CommonUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthInterceptor implements HandlerInterceptor {

	/**
	 * 鍦ㄨ繘鍏andler鏂规硶鎵ц涔嬪墠鎵ц鏈柟娉�
	 * 
	 * @return true:鎵ц涓嬩竴涓嫤鎴櫒锛岀洿鍒版墍鏈夋嫤鎴櫒閮芥墽琛屽畬锛屽啀鎵ц琚嫤鎴殑Controller
	 *         false:浠庡綋鍓嶇殑鎷︽埅鍣ㄥ線鍥炴墽琛屾墍鏈夋嫤鎴櫒鐨刟fterCompletion(),鍐嶉��鍑烘嫤鎴櫒閾�
	 */
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if (CommonUtil.contains(request.getSession(), request.getServletPath(), request.getMethod())) {
			return true;
		}
		// 閽堝ajax璇锋眰澶勭悊
		if (request.getHeader("x-requested-with") != null) {
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
			response.setHeader("url", basePath + "/login/noAuth");
		} else {
			request.getRequestDispatcher("/login/noAuth").forward(request, response);
		}
		return false;
	}

	/**
	 * 鍦ㄨ繘鍏andler鏂规硶涔嬪悗锛岃繑鍥濵odelAndView涔嬪墠鎵ц
	 */
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	/**
	 * 鍦℉andler鏂规硶鎵ц瀹屼箣鍚庢墽琛�
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)throws Exception {
		// TODO Auto-generated method stub

	}

}