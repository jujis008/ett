package com.ett.drv.mapper.admin;

import java.lang.reflect.Array;
import java.util.ArrayList;


import com.smartken.kia.core.model.IMapper;


public interface IMenuMapper<T> extends IMapper<T> {

	
	public ArrayList selectInToken(ArrayList<String> lListToken);
}
