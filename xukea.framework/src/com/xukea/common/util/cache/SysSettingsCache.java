package com.xukea.common.util.cache;


import java.io.InputStream;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;

import com.xukea.framework.base.BaseCache;
import com.xukea.framework.util.ContextUtil;
import com.xukea.system.settings.model.SysSettings;
import com.xukea.system.settings.service.SysSettingsService;
import com.opensymphony.oscache.base.NeedsRefreshException;


/**
 * 系统设置缓存<br>
 * 使用时请配合Config类使用
 * 
 * @author  FishBoy
 * @version 1.0
 * @date    2012-02-16
 */
public class SysSettingsCache {
	private final Logger log = Logger.getLogger(getClass());
	
	private static String GROUP_NAME     = "settings";
	private static int    REFRESH_PERIOD = 24*60*60;
	private static Object lock = new Object(); 
	private static BaseCache<SysSettings> cache = null;
	private static SysSettingsCache instance = null;
	
	private SysSettingsService sysSettingsService;

	/**
	 * 构造方法，service需在这里手动获取bean
	 */
	private SysSettingsCache(){
		cache = new BaseCache<SysSettings>(GROUP_NAME, REFRESH_PERIOD);
		// Service需要手动加载
		sysSettingsService = ContextUtil.getBean(SysSettingsService.class);
	}
	
	/**
	 * 单例工厂
	 * @return
	 */
	public static SysSettingsCache getInstance() {
		if (instance == null) {
			synchronized( lock ){   
                if (instance == null){   
                    instance = new SysSettingsCache();   
                }   
            }
		}
		return instance;
	}

	/**
	 * 新增缓存<br>
	 * 默认按照code和shortName分别保存
	 * 
	 * @param key
	 * @param value
	 */
	public void put(SysSettings value){
		this.put(value.getName(), value);
	}
	
	/**
	 * 新增缓存
	 * 
	 * @param key
	 * @param value
	 */
	public void put(String key, SysSettings value){
		cache.put(key, value);
	}
	
	/**
	 * 获取缓存
	 * 
	 * @param key
	 * @return
	 */
	public SysSettings get(String key){
		try {
			return cache.get(key);
		} catch (NeedsRefreshException e) {
			this.refresh(); //刷新缓存
			try {
				return cache.get(key);
			} catch (NeedsRefreshException ee) {
				//刷新缓存后，还有异常的话，说明该key对应的数据不存在
				log.error("There is no cache for : "+key);
				return null;
			}
		}
	}
	
	/**
	 * 获取值
	 * @param key
	 * @return
	 */
	public String getValue(String key){
		SysSettings temp = get(key);
		return temp==null ? null : temp.getValue();
	}
	
	/**
	 * 删除
	 * @param key
	 */
	public void remove(String key){
		//获取缓存对象
		SysSettings temp = this.get(key);
		if(temp==null) return;
		//删除缓存
		remove(temp);
	}
	
	/**
	 * 更新缓存
	 * @param obj
	 */
	public void update(SysSettings obj){
		if(obj==null) return;
		
		remove(obj);
		put(obj);
	}
	
	/**
	 * 刷新缓存
	 */
	public void refresh(){
		cache.removeAll(); // 删除所有缓存
		cacheFromFile();   // 缓存Config中的数据
		cacheFromDB();     // 缓存DB中的数据
	}
	
	/**
	 * 删除
	 * @param obj
	 */
	private void remove(SysSettings obj){
		if(obj==null) return;
		cache.remove(obj.getName());
	}

	/**
	 * 从Config中获取数据，并缓存
	 */
	private void cacheFromFile(){
		String configName    = "config/config.properties";
		Properties propertie = new Properties();
		InputStream inputStrem = Thread.currentThread().getContextClassLoader().getResourceAsStream(configName);
//		inputStrem = this.getClass().getClassLoader().getResourceAsStream(configName);
		try {
			propertie.load(inputStrem); //读取config内容
			Enumeration enu = propertie.propertyNames();
			while(enu.hasMoreElements()){
				String key = (String)enu.nextElement();
				String val = propertie.getProperty(key);
				SysSettings temp = new SysSettings();
				temp.setName(key);
				temp.setValue(val);
				this.put(temp);//缓存当前对象
			}
		}catch (Exception e) {
			log.error("Load config file error. File path is "+configName, e);
		}
	}
	
	/**
	 * 从DB中获取数据，并缓存
	 * @param obj
	 */
	private void cacheFromDB(){
		List<SysSettings> list = sysSettingsService.getListByName( null );
		for(SysSettings temp : list){
			this.put(temp); //缓存当前对象
		}
	}
}