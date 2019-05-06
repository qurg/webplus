package com.ims.common.web;


import org.springframework.beans.factory.annotation.Autowired;

import com.ims.common.constant.IMSCons;
import com.ims.common.matatype.Dto;
import com.ims.common.util.IMSUtil;
import com.ims.system.constant.SystemCons;
import com.ims.system.model.User;
import com.ims.system.util.CacheCxt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 * 类名:com.ims.common.web.BaseController
 * 描述:基础控制类
 * 编写者:陈骑元
 * 创建时间:2018年4月6日 下午11:15:54
 * 修改说明:
 */
public class BaseController {
    @Autowired
    protected  HttpServletRequest request;
    @Autowired
    protected HttpServletResponse response;
    
    protected org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(this.getClass());
   
    /**
     * 
     * 简要说明：获取token用户
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:46:39
     * @param 说明
     * @return 说明
     */
    public  User getTokenUser(HttpServletRequest httpRequest){
    	String token=httpRequest.getParameter(SystemCons.TOKEN_PARAM);
    	return getTokenUser(token);
    }
    /**
     * 
     * 简要说明：获取token用户
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:46:39
     * @param 说明
     * @return 说明
     */
    public  User getTokenUser(Dto pDto){
    	String token=pDto.getString(SystemCons.TOKEN_PARAM);
    	return getTokenUser(token);
    }
    /**
     * 
     * 简要说明：获取token用户
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:46:39
     * @param 说明
     * @return 说明
     */
    public  User getTokenUser(){
    	String token=request.getParameter(SystemCons.TOKEN_PARAM);
    	
    	return getTokenUser(token);
    }
    /**
     * 
     * 简要说明：返回token
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:45:03
     * @param 说明
     * @return 说明
     */
    public  User getTokenUser(String token){
    	User user=null;
    	if(IMSUtil.isNotEmpty(token)){
    		user=CacheCxt.getUserToken(token);
    	}
        return user;
    }
    /**
     * 
     * 简要说明：获取token用户编号
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:51:26
     * @param 说明
     * @return 说明
     */
    public String getTokenUserId(){
    	String token=request.getParameter(SystemCons.TOKEN_PARAM);
    	return getTokenUserId(token);
    }
    
    
    /**
     * 
     * 简要说明：获取token用户编号
     * 编写者：陈骑元
     * 创建时间：2018年12月22日 下午2:49:22
     * @param 说明
     * @return 说明
     */
    public String getTokenUserId(String token){
    	User user=getTokenUser(token);
    	if(IMSUtil.isNotEmpty(user)){
    		
    		return user.getUserId();
    	}
    	return "";
    }
   /**
    * 
    * 简要说明：返回token
    * 编写者：陈骑元
    * 创建时间：2018年12月24日 下午9:24:25
    * @param 说明
    * @return 说明
    */
   public String getToken(){
	   
   	String token=request.getParameter(SystemCons.TOKEN_PARAM);
   	
   	return token;
   }
   


}
