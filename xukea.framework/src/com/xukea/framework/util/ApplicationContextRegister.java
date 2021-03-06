package com.xukea.framework.util;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 注册 Spring 的 applicationContext 
 * 
 * @author  FishBoy
 * @version 1.0
 * @date    2012-01-05
 */
public class ApplicationContextRegister implements ApplicationContextAware {

	private Logger log = Logger.getLogger(getClass());
	 
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		ContextUtil.setApplicationContext(applicationContext);
		log.debug("ApplicationContext registed");
	}
}
