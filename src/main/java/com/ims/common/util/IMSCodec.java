package com.ims.common.util;

import java.io.IOException;
import java.security.Key;
import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import org.apache.commons.codec.binary.Base64;

import com.ims.common.constant.IMSCons;

/**
 * 
 * 类描述：加解密  <p>DES对称加密算法、MD5加密算法
 * 创建人：陈骑元
 * 创建时间：2016-6-1 上午01:31:54
 * 修改人：蓝枫 
 * 修改时间：2016-6-1 上午01:31:54
 * 修改备注： 
 * @version
 */
public class IMSCodec {
	
	//创建Base64对象,用于加密和解密;
	private final static Base64 base64 = new Base64(); 
	
	//加密时采用的编码方式;
	private final static String encoding = "UTF-8";
	
	/**
	 * MD5算法加密
	 * 
	 * @param strSrc
	 *            明文
	 * @return 返回密文
	 */
	public static String encryptBasedMd5(String strSrc) {
		String outString = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] outByte = md5.digest(strSrc.getBytes("UTF-8"));
			outString = outByte.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return outString;
	}
	/**
	* 先用des算法加密，在用base64编码后返回
	* 
	* @param str 需要加密的字符串
	* @param sKey 加密密钥
	* @return    经过加密的字符串
	*/
	public static String encrypt(String str) {
	  
		return encrypt(str,IMSCons.PASSWORD_KEY);
	}
	/**
	* 先用des算法加密，在用base64编码后返回
	* 
	* @param str 需要加密的字符串
	* @param sKey 加密密钥
	* @return    经过加密的字符串
	*/
	public static String encrypt(String str, String sKey) {
	   // 声明加密后的结果字符串变量
	   String result = str;
	   if (str != null && str.length() > 0 && sKey != null && sKey.length() >= 8) {
	    try { 
	     //调用DES 加密数组的 encrypt方法，返回加密后的byte数组;
	     byte[] encodeByte = encryptBasedDes(str.getBytes(encoding),sKey);
	     // 调用base64的编码方法，返回加密后的字符串;
	     result = base64.encodeToString(encodeByte).trim();
	    } catch (Exception e) {
	     e.printStackTrace();
	    }
	   }else {
		throw new RuntimeException("加密密钥不能为空且不能小于8位。");
	}
	   return result;
	}
	
	/**
	 * 
	 * 简要说明：解密
	 * 编写者：陈骑元
	 * 创建时间：2018年12月19日 上午11:50:04
	 * @param 说明
	 * @return 说明
	 */
	public static String decrypt(String str){
		
		return decrypt(str,IMSCons.PASSWORD_KEY);
	}
	/**
	* 先用base64解码，再用des解密后返回
	* 
	* @param str 需要解密的字符串
	* @param sKey 解密密钥
	* @return   经过解密的字符串
	*/
	public static String decrypt(String str, String sKey) {
	   String result = str;
	   if (str != null && str.length() > 0 && sKey != null && sKey.length() >= 8) {
	    try {  
	     // 用base64进行编码，返回byte数组
	     byte[] encodeByte = base64.decode(str);    
	     // 调用DES 解密数组的decrypte方法，返回解密后的数组;
	     byte[] decoder = decryptBasedDes(encodeByte,sKey);
	     // 对解密后的数组转化成字符串
	     result = new String(decoder, encoding).trim();    
	    } catch (Exception e) {

            return "";
	    }
	   }
	   return result;
	}
	
	/**
	* 先用DES算法对byte[]数组加密
	* @param byteSource 需要加密的数据
	* @param sKey    加密密钥
	* @return      经过加密的数据
	* @throws Exception
	*/
	private static byte[] encryptBasedDes(byte[] byteSource, String sKey)
	    throws Exception { 
	   try {
	    // 声明加密模式;
	    int mode = Cipher.ENCRYPT_MODE;
	    // 创建密码工厂对象;
	    SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
	    // 把字符串格式的密钥转成字节数组;
	    byte[] keyData = sKey.getBytes();
	    // 以密钥数组为参数，创建密码规则
	    DESKeySpec keySpec = new DESKeySpec(keyData);
	    // 以密码规则为参数，用密码工厂生成密码
	    Key key = keyFactory.generateSecret(keySpec);
	    // 创建密码对象
	    Cipher cipher = Cipher.getInstance("DES");
	    // 以加密模式和密码为参数对密码对象 进行初始化
	    cipher.init(mode, key);
	    // 完成最终加密
	    byte[] result = cipher.doFinal(byteSource);  
	    // 返回加密后的数组
	    return result;
	   } catch (Exception e) {
	    throw e;
	   } 
	}

	/**
	* 先用DES算法对byte[]数组解密
	* @param byteSource 需要解密的数据
	* @param sKey    解密密钥
	* @return     经过解密的数据
	* @throws Exception
	*/
	private static byte[] decryptBasedDes(byte[] byteSource, String sKey)
	    throws Exception {  
	   try {
	    // 声明解密模式;
	    int mode = Cipher.DECRYPT_MODE;
	    // 创建密码工厂对象;
	    SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
	    // 把字符串格式的密钥转成字节数组;
	    byte[] keyData = sKey.getBytes();
	    // 以密钥数组为参数，创建密码规则
	    DESKeySpec keySpec = new DESKeySpec(keyData);
	    // 以密码规则为参数，用密码工厂生成密码
	    Key key = keyFactory.generateSecret(keySpec);
	    // 创建密码对象
	    Cipher cipher = Cipher.getInstance("DES");
	    // 以加密模式和密码为参数对密码对象 进行初始化
	    cipher.init(mode, key);
	    // 完成最终解密
	    byte[] result = cipher.doFinal(byteSource);  
	    // 返回解密后的数组
	    return result;
	   } catch (Exception e) {
	    throw e;
	   } 
	}
	
	/**
	* 测试加密算法
	* 
	* @param args
	* @throws IOException 
	*/
	public static void main(String[] args) throws IOException {
		 System.out.print(IMSCodec.encrypt("root"));
	}

}
