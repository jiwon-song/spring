package hong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HongDAO {

	@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<ClassListVO> class_list(String teacher_id) {
		return sql.selectList("hong.mapper.classlist", teacher_id);
	}

	public List<TestVO> test_list(int class_id, String teacher_id) {
		if(class_id==0) {
			return sql.selectList("hong.mapper.testlistall", teacher_id);						
		}else {
			return sql.selectList("hong.mapper.testlist", class_id);			
		}
			
	}

	// 테스트 추가하기
	public void test_insert(TestVO vo) {
		sql.insert("hong.mapper.testinsert", vo);
	}

	public void test_delete(int test_id) {
		sql.delete("hong.mapper.testdelete", test_id);		
	}


	public void test_update(TestVO vo) {
		sql.update("hong.mapper.testupdate", vo);
		
	}

	public List<TestDetailVO> test_detail(int test_id) {
		return sql.selectList("hong.mapper.testdetail", test_id);		
	}

}
