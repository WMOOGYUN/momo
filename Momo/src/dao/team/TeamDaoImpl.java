package dao.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Achive;
import dto.AchivePeople;
import dto.FileUpload;
import dto.Study;
import dto.StudyBoard;
import dto.Teammate;
import dto.UserStudy;
import util.DBConn;
import util.Paging;

public class TeamDaoImpl implements TeamDao{

	private Connection conn = DBConn.getConnection();
	
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	// yn begin -----------------------------------

	@Override
	public List selectTeammate(int study_no) {
		String sql="";
		sql+="SELECT T.u_no, U.u_name, T.study_no, S.study_name, T.ts_statecode, A.ts_statename";
		sql+=" FROM studyteamstate T";
		sql+=" JOIN users U";
		sql+=" ON U.u_no=T.u_no";
		sql+=" JOIN study S";
		sql+=" ON S.study_no=T.study_no";
		sql+=" JOIN applystate A";
		sql+=" ON A.ts_statecode";
		sql+=" WHERE T.study_no=? AND T.ts_statecode=2 AND T.ss_yesno='n'";
		sql+=" ORDER BY U.u_name";
		
		List<Teammate> tList = new ArrayList<>();
		
		try {
			//sql 수행
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, study_no);
					
			rs = ps.executeQuery();
				
			//결과처리
			while(rs.next()){
				Teammate tm = new Teammate();
				
				tm.setStudy_no(rs.getInt("study_no"));
				tm.setStudy_name(rs.getString("study_name"));
				tm.setU_no(rs.getInt("u_no"));
				tm.setU_name(rs.getString("u_name"));
				
				tList.add(tm);
			
			}

				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				//--- 자원 해제 ---
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
				//-----------------
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return tList;
			
	}

	@Override
	public Study selectStudy(int study_no) {
		String sql = "";
		sql += "SELECT S.study_no, S.st_code, S.study_name, S.study_region, S.study_details, S.study_period,";
		sql += " S.u_no, U.u_name, C.st_cate, C.st_subcate";		
		sql += " FROM study S";
		sql += " JOIN users U";
		sql += " ON U.u_no = S.u_no";
		sql += " JOIN studycate C";
		sql += " ON C.st_code=S.st_code";
		sql += " WHERE S.study_no=?";

		// study媛앹껜
		Study study = new Study();

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, study_no);

			rs = ps.executeQuery();

			while (rs.next()) {
				study.setStudy_no(rs.getInt("study_no"));
				study.setSt_code(rs.getInt("st_code"));
				study.setStudy_name(rs.getString("study_name"));
				study.setStudy_region(rs.getString("study_region"));
				study.setStudy_details(rs.getString("study_details"));
				study.setStudy_period(rs.getString("study_period"));
				study.setU_no(rs.getInt("u_no"));
				study.setU_name(rs.getString("u_name"));
				study.setSt_cate(rs.getString("st_cate"));
				study.setSt_subcate(rs.getString("st_subcate"));

			}
		} catch (SQLException e) {
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e) {
			}
		}
		return study;
		}
	
	// yn end -----------------------------------
	
}		

