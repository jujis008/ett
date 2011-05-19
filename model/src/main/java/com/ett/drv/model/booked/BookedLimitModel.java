package com.ett.drv.model.booked;

import java.math.BigDecimal;
import java.text.MessageFormat;

import com.smartken.kia.core.model.impl.BaseModel;

public class BookedLimitModel extends BaseModel{

	public static enum F{
		id,weekNum,carType,dayofweek,km,schoolCode,schoolName,dateKsrq,ksccCode,kscc,ksddCode,
		ksdd,total,usedNum,checkedNum,tptotal,tpusedNum,tpcheckedNum,operator
	}
	
	private Integer id;         //ID  NUMBER 38
	private Integer weekNum;         //I_WEEK_NUM  NUMBER 38
	private String carType;         //C_CAR_TYPE  VARCHAR2 30
	private Integer dayofweek;         //I_DAYOFWEEK  NUMBER 38
	private Integer km;         //I_KM  NUMBER 38
	private String schoolCode;         //C_SCHOOL_CODE  VARCHAR2 20
	private String schoolName;         //C_SCHOOL_NAME  VARCHAR2 200
	private String dateKsrq;         //DATE_KSRQ  VARCHAR2 10
	private String ksccCode;         //C_KSCC_CODE  VARCHAR2 20
	private String kscc;         //C_KSCC  VARCHAR2 200
	private String ksddCode;         //C_KSDD_CODE  VARCHAR2 20
	private String ksdd;         //C_KSDD  VARCHAR2 200
	private Integer total;         //I_TOTAL  NUMBER 38
	private Integer usedNum;         //I_USED_NUM  NUMBER 38
	private Integer checkedNum;         //I_CHECKED_NUM  NUMBER 38
	private Integer tptotal;         //I_TPTOTAL  NUMBER 38
	private Integer tpusedNum;         //I_TPUSED_NUM  NUMBER 38
	private Integer tpcheckedNum;         //I_TPCHECKED_NUM  NUMBER 38
	private String operator;         //C_OPERATOR  VARCHAR2 30

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	public Integer getWeekNum() {
		return weekNum;
	}
	public void setWeekNum(Integer weekNum) {
		this.weekNum = weekNum;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	public Integer getDayofweek() {
		return dayofweek;
	}
	public void setDayofweek(Integer dayofweek) {
		this.dayofweek = dayofweek;
	}
	public Integer getKm() {
		return km;
	}
	public void setKm(Integer km) {
		this.km = km;
	}
	public String getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getDateKsrq() {
		return dateKsrq;
	}
	public void setDateKsrq(String dateKsrq) {
		this.dateKsrq = dateKsrq;
	}
	public String getKsccCode() {
		return ksccCode;
	}
	public void setKsccCode(String ksccCode) {
		this.ksccCode = ksccCode;
	}
	public String getKscc() {
		return kscc;
	}
	public void setKscc(String kscc) {
		this.kscc = kscc;
	}
	public String getKsddCode() {
		return ksddCode;
	}
	public void setKsddCode(String ksddCode) {
		this.ksddCode = ksddCode;
	}
	public String getKsdd() {
		return ksdd;
	}
	public void setKsdd(String ksdd) {
		this.ksdd = ksdd;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getUsedNum() {
		return usedNum;
	}
	public void setUsedNum(Integer usedNum) {
		this.usedNum = usedNum;
	}
	public Integer getCheckedNum() {
		return checkedNum;
	}
	public void setCheckedNum(Integer checkedNum) {
		this.checkedNum = checkedNum;
	}
	public Integer getTptotal() {
		return tptotal;
	}
	public void setTptotal(Integer tptotal) {
		this.tptotal = tptotal;
	}
	public Integer getTpusedNum() {
		return tpusedNum;
	}
	public void setTpusedNum(Integer tpusedNum) {
		this.tpusedNum = tpusedNum;
	}
	public Integer getTpcheckedNum() {
		return tpcheckedNum;
	}
	public void setTpcheckedNum(Integer tpcheckedNum) {
		this.tpcheckedNum = tpcheckedNum;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	@Override
	public Object generalPK() throws NullPointerException {
		// TODO Auto-generated method stub
        String key=MessageFormat.format("{0}_{1}_{2}_{3}_{4}_{5}",
        		this.weekNum,  //0
        		this.dayofweek,  //1
        		this.km,   //2
        		this.ksccCode,  //3
        		this.ksddCode,  //4
        		this.schoolCode  //5
        );
        //this.setPk(key);
		return key;
	}

	
	
	
}
