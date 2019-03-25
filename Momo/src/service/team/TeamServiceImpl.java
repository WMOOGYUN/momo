package service.team;

import java.util.List;
import dao.team.TeamDao;
import dao.team.TeamDaoImpl;
import dto.Study;

public class TeamServiceImpl implements TeamService {
	
	private TeamDao teamDao = new TeamDaoImpl();

	// yn begin -----------------------------------

	@Override
	public List getTeammate(int study_no) {
		return teamDao.selectTeammate(study_no);
	}

	@Override
	public Study getStudy(int study_no) {
		return teamDao.selectStudy(study_no);
	}
	
	// yn end -----------------------------------
}
