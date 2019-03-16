package org.imooc.dto;

import org.imooc.constant.ApiCodeEnum;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

//ajax不能直接接受到枚举常量，能拿到Java对象的属性，因此使用这个类对其进行包装一下
@JsonInclude(Include.NON_NULL)
public class ApiCodeDto {

	private Integer errno;

	private String msg;

	private String token;

	private String code;

	public ApiCodeDto() {

	}

	public ApiCodeDto(Integer errno, String code) {
		this.errno = errno;
		this.code = code;
	}

	public ApiCodeDto(ApiCodeEnum apiCodeEnum) {
		this.errno = apiCodeEnum.getErrno();
		this.msg = apiCodeEnum.getMsg();
	}

	public Integer getErrno() {
		return errno;
	}

	public void setErrno(Integer errno) {
		this.errno = errno;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
