package com.xukea.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xukea.framework.base.BaseRestSpringController;

/**
 * 插件平台Controller
 * 
 * @author 石头
 *
 */
@Controller
@RequestMapping("/main")
public class MainController extends BaseRestSpringController<Object, Long>{
	
	/** 首页 */
	@Override
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Object obj) {
		ModelAndView result = new ModelAndView();
		result.setViewName("/main/index");
		return result;
	}

	/**
	 * 系统设置主界面
	 */
	@RequestMapping(value="/setting")
	public String getPageSetting(){
		return "redirect:/main/setting/index";
	}

	/**
	 * 系统设置主界面
	 */
	@RequestMapping(value="/setting/index")
	public String getPageSettingIndex(){
		return "/main/setting/index";
	}
	
	/**
	 * 系统基础设置
	 */
	@RequestMapping(value="/setting/basic")
	public String getPageSettingBasic(){
		return "/main/setting/basic";
	}
	
	/**
	 * 邮箱设置
	 */
	@RequestMapping(value="/setting/email")
	public String getPageSettingEmail(){
		return "/main/setting/email";
	}
}

