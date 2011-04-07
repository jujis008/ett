/**
 * @(#)MD5Encrypt.java.java 
 *
 * create by chen at 2008-7-24
 *
 * Copyright 2008 fivemen,Inc. All rights reserved.
 *
 * fivemen proprietary/confidential.Use is subject to license terms
 */
package com.ett.common.security;

import java.security.MessageDigest;



/**
 * @author chen
 *
 */
public class MD5Encrypt implements IEncrypt {

	//protected  final Log log = LogFactory.getLog(MD5Encrypt.class);
	private static final char hexDigits[] = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

	/* (non-Javadoc)
	 * @see fivemen.security.IEncrypt#decrypt(java.lang.String)
	 */
	public String encrypt(String str) throws Exception {

		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			log.info("MD5摘要长度：" + md.getDigestLength());
            byte[] b = md.digest(str.getBytes());
            return byteToHexString(b);
		} catch (Exception e) {
			throw e;
		}
	}
	
	 /** *//**
     * 把byte[]数组转换成十六进制字符串表示形式
     * @param tmp    要转换的byte[]
     * @return 十六进制字符串表示形式
     */
    private static String byteToHexString(byte[] tmp) {
        String s;
        // 用字节表示就是 16 个字节
        char str[] = new char[16 * 2]; // 每个字节用 16 进制表示的话，使用两个字符，
        // 所以表示成 16 进制需要 32 个字符
        int k = 0; // 表示转换结果中对应的字符位置
        for (int i = 0; i < 16; i++) { // 从第一个字节开始，对 MD5 的每一个字节
            // 转换成 16 进制字符的转换
            byte byte0 = tmp[i]; // 取第 i 个字节
            str[k++] = hexDigits[byte0 >>> 4 & 0xf]; // 取字节中高 4 位的数字转换, 
            // >>> 为逻辑右移，将符号位一起右移
            str[k++] = hexDigits[byte0 & 0xf]; // 取字节中低 4 位的数字转换
        }
        s = new String(str); // 换后的结果转换为字符串
        return s;
    }

	/* (non-Javadoc)
	 * @see fivemen.security.IEncrypt#encrypt(java.lang.String)
	 */
	public String decrypt(String str) throws Exception {
		throw new Exception("can't use this method!");
	}

}
