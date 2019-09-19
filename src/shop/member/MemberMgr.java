package shop.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberMgr {	// DAO
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	public MemberMgr() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
		} catch (Exception e) {
				System.out.println("MemberMgr err : " + e);
		}
	}

	//우편번호 검색
	public ArrayList<ZipcodeBean> zipcodeRead(String area3) {
		System.out.println(area3);
		ArrayList<ZipcodeBean> list = new ArrayList<ZipcodeBean>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from ziptab where area3 like ? ";
//			String sql = "select * from ziptab where area3 like " + area3 + "'%'";  - 해킹위험
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, area3 + "%");
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				System.out.println(rs.getString("zipcode"));
				ZipcodeBean bean = new ZipcodeBean();
				bean.setZipcode(rs.getString("zipcode"));
				bean.setArea1(rs.getString("area1"));
				bean.setArea2(rs.getString("area2"));
				bean.setArea3(rs.getString("area3"));
				bean.setArea4(rs.getString("area4"));
				
				list.add(bean);
			}
		} catch (Exception e) {
			System.out.println("zipcodeRead err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return list;
	}
	
	public boolean chkId(String id) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
		
			String sql = "select id from member where id = ? ";
//			String sql = "select count(*) from member where id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			b = rs.next();
		} catch (Exception e) {
			System.out.println("chkId err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return b;
	}
	
	public boolean memberInsert(MemberBean bean) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = "insert into member values(?, ?, ?, ?, ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPasswd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getEmail());
			pstmt.setString(5, bean.getPhone());
			pstmt.setString(6, bean.getZipcode());
			pstmt.setString(7, bean.getAddress());
			pstmt.setString(8, bean.getJob());
			
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberInsert err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return b;
	}
	
	public boolean loginChk(String id, String passwd) {

		boolean b = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from member where id = ? and passwd = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			
			b = rs.next();
		} catch (Exception e) {
			System.out.println("loginChk err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return b;
	}
	
	public MemberDto getMember(String id) {
		MemberDto dto = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from member where id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDto();
				
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddress(rs.getString("address"));
				dto.setJob(rs.getString("job"));
			}	
		} catch (Exception e) {
			System.out.println("getMember err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		
		return dto;
	}
	
	public boolean memberUpdate(MemberBean bean, String id) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = "update member set passwd=?, name=?, email=?, phone=?, zipcode=?, address=?, job=? where id=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getPasswd());
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getZipcode());
			pstmt.setString(6, bean.getAddress());
			pstmt.setString(7, bean.getJob());
			pstmt.setString(8, id);
			
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("memberUpdate err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return b;
	}
	
	public boolean adminloginCheck(String adminid, String adminpasswd) {
		boolean b = false;
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from admin where admin_id = ? and admin_passwd = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminid);
			pstmt.setString(2, adminpasswd);
			
			rs = pstmt.executeQuery();
			
			b = rs.next();			
		} catch (Exception e) {
			System.out.println("adminloginCheck err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return b;
	}
	
	public ArrayList<MemberDto> getMemberAll() {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select * from member ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				
				dto.setId(rs.getString("id"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getMemberAll err : " + e);
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return list;
	}
}