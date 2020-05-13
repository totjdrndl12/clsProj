package com.increpas.www.dao;

/**
 * 이 클래스는 댓글게시판 관련 데이터베이스 작업을 처리할 클래스
 * @author	전은석
 * @since	2020.05.13
 * @version	v.1.0.0
 * 
 */
import java.sql.*;
import java.util.*;

import com.increpas.www.DB.*;
import com.increpas.www.sql.*;
import com.increpas.www.vo.*;

public class ReBoardDAO {
	WebDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	ReBoardSQL rSQL;
	
	public ReBoardDAO() {
		// 할일
		// 1. 데이터베이스 준비
		db = new WebDBCP();
		// 2. 질의명령 사용할 준비
		rSQL = new ReBoardSQL();
	}
	
	// 댓글 리스트조회 전담 처리함수
	public ArrayList<ReBoardVO> getAllList(){
		ArrayList<ReBoardVO> list = new ArrayList<ReBoardVO>();
		// 할일
		// 1. 커넥션 얻어오고
		con = db.getCon();
		// 2. 질의명령가져오고
		String sql = rSQL.getSQL(rSQL.SEL_LIST);
		// 3. 스테이트먼트가져오고
		stmt = db.getSTMT(con);
		try {
			// 4. 질의명령 보내고 결과받고
			rs = stmt.executeQuery(sql);
			// 5. 결과에서 데이터 꺼내서 VO에 담고
			// 몇개를 꺼내야될지 모르므로 반복해서 꺼낸다.
			while(rs.next()) {
				ReBoardVO rVO = new ReBoardVO();
				rVO.setReno(rs.getInt("reno"));
				rVO.setMno(rs.getInt("mno"));
				rVO.setId(rs.getString("id"));
				rVO.setAvatar(rs.getString("avatar"));
				rVO.setBody(rs.getString("body"));
				rVO.setBody(); // 줄바꿈기호처리
				rVO.setReDate(rs.getDate("redate"));
				rVO.setReTime(rs.getTime("redate"));
				rVO.setsDate(); // 원하는 형식의 데이트 변환
				rVO.setStep(rs.getInt("step"));
				// 6. VO 리스트에 담고
				list.add(rVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		// 7. 리스트 내보내고
		return list;
	}

}
