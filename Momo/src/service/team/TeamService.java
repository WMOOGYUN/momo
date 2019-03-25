package service.team;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Achive;
import dto.AchivePeople;
import dto.Study;
import dto.UserStudy;
import util.Paging;

public interface TeamService {

	// yn begin -----------------------------------
	
	// 팀원정보 가져오기
	public List getTeammate(int study_no);
	
	// 스터디 정보 가져오기
	public Study getStudy(int study_no);
	
	// yn end -----------------------------------
	
}
