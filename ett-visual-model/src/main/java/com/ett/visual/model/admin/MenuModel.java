package com.ett.visual.model.admin;


import com.smartken.toyz4j.model.impl.BaseModel;


public class MenuModel extends BaseModel {

	 public static enum F { 
		  Menuid,Menuurl,Menutext,Menuimg,Ordernum,Isparent,Parentid,JavaUrl,IconCls  
		 } 

		private Integer Menuid;         //MENUID  NUMBER 38
		private String Menuurl;         //MENUURL  VARCHAR2 200
		private String Menutext;         //MENUTEXT  VARCHAR2 200
		private String Menuimg;         //MENUIMG  VARCHAR2 100
		private Integer Ordernum;         //ORDERNUM  NUMBER 38
		private Integer Isparent;         //ISPARENT  NUMBER 38
		private Integer Parentid;         //PARENTID  NUMBER 38
		private String JavaUrl;         //JAVA_URL  VARCHAR2 500
		private String IconCls;         //ICON_CLS  VARCHAR2 100
		public Integer getMenuid() {
			return Menuid;
		}
		public void setMenuid(Integer menuid) {
			Menuid = menuid;
		}
		public String getMenuurl() {
			return Menuurl;
		}
		public void setMenuurl(String menuurl) {
			Menuurl = menuurl;
		}
		public String getMenutext() {
			return Menutext;
		}
		public void setMenutext(String menutext) {
			Menutext = menutext;
		}
		public String getMenuimg() {
			return Menuimg;
		}
		public void setMenuimg(String menuimg) {
			Menuimg = menuimg;
		}
		public Integer getOrdernum() {
			return Ordernum;
		}
		public void setOrdernum(Integer ordernum) {
			Ordernum = ordernum;
		}
		public Integer getIsparent() {
			return Isparent;
		}
		public void setIsparent(Integer isparent) {
			Isparent = isparent;
		}
		public Integer getParentid() {
			return Parentid;
		}
		public void setParentid(Integer parentid) {
			Parentid = parentid;
		}
		public String getJavaUrl() {
			return JavaUrl;
		}
		public void setJavaUrl(String javaUrl) {
			JavaUrl = javaUrl;
		}
		public String getIconCls() {
			return IconCls;
		}
		public void setIconCls(String iconCls) {
			IconCls = iconCls;
		}
		@Override
		public Object getPk() {
			// TODO Auto-generated method stub
			return this.Menuid;
		}
		@Override
		public void setPk(Object pk) {
			// TODO Auto-generated method stub
			
		}
		
		
		
	
}
