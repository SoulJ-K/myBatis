package member.model.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import member.model.exception.MemberException;
import member.model.vo.Member;

public class MemberDAO {
	
	public Member selectMember(SqlSession session, Member m) throws MemberException {
		
		Member member = null;
		
		member = session.selectOne("memberMapper.loginMember", m);
		//mapper에 있는 sql문을 사용하기 위한 호출문
		//첫번째 매개변수 : mapper에 있는 쿼리문 중 보내고 싶은 쿼리문의 id 값
		//두번째 매개변수 : mapper에 있는 쿼리문에 보내고 싶은 값
		
		System.out.println(member);
		
		if(member == null) {
			session.close();
			throw new MemberException("로그인에 실패하였습니다.");
		}
		return member;
	}

	public void insertMember(SqlSession session, Member m) throws MemberException {
		
		int result = session.insert("memberMapper.insertMember", m);
		
		if(result <= 0) {
			session.rollback();
			session.close();
			
			throw new MemberException("회원가입에 실패하였습니다.");
		}
		
	}


	public void updateMember(SqlSession session, Member m) throws MemberException {
		
		int result = session.update("memberMapper.updateMember", m);
		
		if(result <= 0) {
			session.rollback();
			session.close();
			
			throw new MemberException("회원정보 수정에 실패하였습니다.");
		}
		
	}

	public void updatePwd(SqlSession session, HashMap<String, String> map) throws MemberException {
		
		int result = session.update("memberMapper.updatePwd", map);
		
		if(result <= 0) {
			session.rollback();
			session.close();
			
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
			
		}
		
	}

	public void deleteMember(SqlSession session, String userId) throws MemberException {
		
		int result = session.delete("memberMapper.deleteMember", userId);
		
		if(result <= 0) {
			session.rollback();
			session.close();
			
			throw new MemberException("탈퇴  실패!");
		}
		
	}

}
