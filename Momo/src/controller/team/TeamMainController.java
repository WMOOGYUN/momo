package controller.team;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Study;
import dto.Teammate;
import dto.UserStudy;
import service.team.TeamService;
import service.team.TeamServiceImpl;


@WebServlet("/team/main")
public class TeamMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TeamService tServ = new TeamServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(true);
		int u_no = (int) session.getAttribute("u_no");
		
		int study_no = Integer.parseInt(req.getParameter("study_no"));
		Study study = tServ.getStudy(study_no);
		List<Teammate> teammate = tServ.getTeammate(study_no);
		
		req.setAttribute("study", study);
		req.setAttribute("teammate", teammate);

		req.getRequestDispatcher("/view/team/teamMain.jsp").forward(req, resp);
	}
}
