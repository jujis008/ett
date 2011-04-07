/**
 * @(#)ObjectDontExistException.java.java 
 *
 * create by chen at 2008-6-28
 *
 * Copyright 2008 fivemen,Inc. All rights reserved.
 *
 * fivemen proprietary/confidential.Use is subject to license terms
 */
package com.ett.common.exception;


/**
 * @author chen
 * 用户没有权限异常
 */
public class NoRightException extends BusinessException {
	/**
	 * @param message 异常信息
	 */
	public NoRightException(String message)
	{
		super(message);
	}
	
	/**
	 * @param ex 异常对象
	 */
	public NoRightException(Throwable ex)
	{
		super(ex);
	}
	
	/**
	 * @param message 异常信息
	 * @param cause 异常籄1�7
	 */
	public NoRightException(String message, Throwable cause) 
	{
	        super(message, cause);
	}
	
	 /**
	 * 无参构�1�7�函敄1�7
	 */
	public NoRightException() 
	 {
			super();
	}

}
