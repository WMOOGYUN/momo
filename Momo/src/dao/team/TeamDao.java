package dao.team;

import java.util.List;

import dto.Achive;
import dto.AchivePeople;
import dto.FileUpload;
import dto.Study;
import dto.StudyBoard;
import dto.SubAchive;
import dto.UserStudy;
import util.Paging;

public interface TeamDao {

	// yn begin -----------------------------------
	
	//팀원 조회
	public List selectTeammate(int study_no);
	
	//스터디 정보 조회
	public Study selectStudy(int study_no);
	
	// yn end -----------------------------------
	
	
	
}

