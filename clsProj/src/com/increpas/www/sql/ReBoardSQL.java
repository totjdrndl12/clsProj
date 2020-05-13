package com.increpas.www.sql;

public class ReBoardSQL {
	public final int SEL_LIST = 1001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_LIST:
			buff.append("SELECT ");
			buff.append("    rno, reno, remno mno, id, savename avatar, rebody body, reupno upno, redate, step ");
			buff.append("FROM ");
			buff.append("	(SELECT  ");
			buff.append("    	ROWNUM RNO, R.* ");
			buff.append("	FROM ");
			buff.append("		(SELECT  ");
			buff.append("    		RENO, REMNO, REBODY, REUPNO, REDATE, LEVEL step ");
			buff.append("		FROM ");
			buff.append("    		reboard ");
			buff.append("		WHERE ");
			buff.append("   		isshow = 'Y' ");
			buff.append("		START WITH ");
			buff.append("    		REUPNO IS NULL ");
			buff.append("		CONNECT BY ");
			buff.append("    		PRIOR RENO = reupno) R ");
			buff.append("	), member m, avatar a ");
			buff.append("WHERE ");
			buff.append("	remno = mno ");
			buff.append("	AND m.ano = a.ano ");
			break;
		}
		
		return buff.toString();
	}
}
