package common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Template{
	
	public static SqlSession getSqlSession() {
		SqlSession session = null;
		
		InputStream stream;
		
		try {
			stream = Resources.getResourceAsStream("/mybatis-config.xml");
			
			session = new SqlSessionFactoryBuilder().build(stream).openSession(false);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return session;
	}
}
