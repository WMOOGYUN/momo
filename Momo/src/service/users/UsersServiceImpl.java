package service.users;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.users.UsersDao;
import dao.users.UsersDaoImpl;
import dto.StudyCategory;
import dto.Users;

public class UsersServiceImpl implements UsersService {
	
	private UsersDao uDao = new UsersDaoImpl();
	
	// yn begin -----------------------------------
	
	@Override
	public Users loginGetParam(HttpServletRequest req, HttpServletResponse resp) {
		String u_id = req.getParameter("u_id");
		String u_pw = req.getParameter("u_pw");
		
		Users u = new Users();
		u.setU_id(u_id);
		u.setU_pw(u_pw);
		
		return u;
	}

	@Override
	public boolean login(Users user) {

		return uDao.login(user);
	}

	@Override
	public Users getUserByUid(Users user) {
		
		return uDao.selectUserByUid(user);
	}

	@Override
	public Users getUserByUno(int u_no) {
		return uDao.selectUserByUno(u_no);
	}

	@Override
	public List getFavoritCateByUno(int u_no) {
		return uDao.selectFavoritCateByUno(u_no);
	}

	@Override
	public void changePw(int u_no, String nu_pw) {
		uDao.updatePw(u_no, nu_pw);
	}

	@Override
	public List<StudyCategory> getCateList() {
		return uDao.selectCateList();
	}

	@Override
	public Users updateGetParam(HttpServletRequest request, HttpServletResponse response) {
		
		Users u = new Users();
		
		// 요청파라미터 받기
	
		String eId = request.getParameter("eId");
		String eAddress = request.getParameter("eAddress");
		String email = eId + "@" + eAddress;
				
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1+"-"+phone2+"-"+phone3;
		
		String year =  request.getParameter("birth_year");

		String month = null;
		if(Integer.parseInt(request.getParameter("birth_month"))<10) {
			month = "0"+request.getParameter("birth_month");
		} else {
			month = request.getParameter("birth_month");
		}
		
		
		String day = null;
		if(Integer.parseInt(request.getParameter("birth_day"))<10) {
			day = "0"+request.getParameter("birth_day");
		} else {
			day = request.getParameter("birth_day");
		}

		String birth = year + month + day;
		
//		System.out.println(birth);
//		System.out.println(email);

		// DTO에 요청파라미터 담기

		u.setU_email(email);
		u.setU_phone(phone);
		u.setU_birth(birth);
		
		return u;
	}

	@Override
	public void updateUsers(int u_no, Users user, String[] favoritcate) {
		uDao.updateUsers(u_no, user);
		
		uDao.deleteFavoriteCate(u_no);	
		if( favoritcate != null) {
			for(String favorite : favoritcate) {
					uDao.addFavoriteCate(u_no, favorite);
			}
		} 
	}

	// yn end -----------------------------------

}
