package com.ims.shiro.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.web.filter.authc.BasicHttpAuthenticationFilter;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ims.common.util.IMSUtil;
import com.ims.common.util.JsonUtil;
import com.ims.common.util.R;
import com.ims.shiro.Realm.TokenRealm;
import com.ims.system.constant.SystemCons;

/**
 * 
 * 类名:com.toonan.shiro.filter.TokenFilter
 * 描述:token校验器
 * 编写者:陈骑元
 * 创建时间:2019年1月2日 下午7:50:57
 * 修改说明:
 */
public class TokenFilter extends BasicHttpAuthenticationFilter {
	
	// 登录标识

    /**
     * 检测用户是否登录
     * 检测header里面是否包含Authorization字段即可
     *
     * @param request
     * @param response
     * @return
     */
    @Override
    protected boolean isLoginAttempt(ServletRequest request, ServletResponse response) {
    	
        HttpServletRequest req = (HttpServletRequest) request;
        String token = req.getParameter(SystemCons.TOKEN_PARAM);
        return IMSUtil.isNotEmpty(token);
    }

    @Override
    protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest req = (HttpServletRequest) request;
        String authorization = req.getParameter(SystemCons.TOKEN_PARAM);

        TokenRealm token = new  TokenRealm(authorization);

        getSubject(request, response).login(token);

        return true;
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {
    	 if (this.isLoginAttempt(request, response)) {
              try {
                  // 进行Shiro的登录UserRealm
                  this.executeLogin(request, response);
                  return true;
              } catch (Exception e) {
                  // 认证出现异常，传递错误信息msg
                  String msg = e.getMessage();
                  // 获取应用异常(该Cause是导致抛出此throwable(异常)的throwable(异常))
                  Throwable throwable = e.getCause();
                  if (throwable != null && throwable instanceof AuthenticationException) {
                      // 该异常为JWT的AccessToken认证失败(Token或者密钥不正确)
                      msg = "Token或者密钥不正确(" + throwable.getMessage() + ")";
                  } 
                  
                
                  // 直接返回Response信息
                  this.response401(request, response, msg);
                  return false;
              }
          }
    	 this.response401(request, response, "token秘钥为空");
          return false;
    }

    /**
     * 对跨域提供支持
     *
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @Override
    protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        httpServletResponse.setHeader("Access-control-Allow-Origin", httpServletRequest.getHeader("Origin"));
        httpServletResponse.setHeader("Access-Control-Allow-Methods", "GET,POST,OPTIONS,PUT,DELETE");
        httpServletResponse.setHeader("Access-Control-Allow-Headers", httpServletRequest.getHeader("Access-Control-Request-Headers"));
        // 跨域时会首先发送一个option请求，这里我们给option请求直接返回正常状态
        if (httpServletRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            httpServletResponse.setStatus(HttpStatus.OK.value());
            return false;
        }
        return super.preHandle(request, response);
    }

    /**
     * 无需转发，直接返回Response信息
     */
    private void response401(ServletRequest req, ServletResponse resp, String msg) {
    	HttpServletRequest  httpServletRequest = (HttpServletRequest) req;
    	HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
    	if ("XMLHttpRequest".equalsIgnoreCase( httpServletRequest.getHeader("X-Requested-With")) ||  httpServletRequest.getParameter("ajax") != null) {
    		   httpServletResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
   	        httpServletResponse.setCharacterEncoding("UTF-8");
   	        httpServletResponse.setContentType("application/json; charset=utf-8");
   	        PrintWriter out = null;
   	        try {
   	            out = httpServletResponse.getWriter();
   	            R r=R.error("无权访问(Unauthorized):" + msg);
   	            String data = JsonUtil.toJson(r);
   	            out.append(data);
   	        } catch (IOException e) {
   	           
   	            throw new RuntimeException("直接返回Response信息出现IOException异常:" + e.getMessage());
   	        } finally {
   	            if (out != null) {
   	                out.close();
   	            }
   	        }	
    	}else{
    		try {
				httpServletRequest.getRequestDispatcher("401").forward(httpServletRequest,httpServletResponse);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
    	     
    	}
      
    }

}
