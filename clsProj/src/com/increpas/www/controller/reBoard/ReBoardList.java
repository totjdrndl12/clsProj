package com.increpas.www.controller.reBoard;

import javax.servlet.http.*;
import java.util.*;

import com.increpas.www.controller.*;
import com.increpas.www.dao.*;
import com.increpas.www.vo.*;

public class ReBoardList implements ClsController {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/reBoard/reBoard.jsp";
		// 받아야할 데이터는 없으므로 데이터베이스작업을 한다.
		ReBoardDAO rDAO = new ReBoardDAO();
		ArrayList<ReBoardVO> list = rDAO.getAllList();
		
		// 뷰에 데이터 심고
		req.setAttribute("LIST", list);
		return view;
	}

}
