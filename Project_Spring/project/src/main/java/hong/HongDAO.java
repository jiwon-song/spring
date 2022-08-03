package hong;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class HongDAO {

	@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<ClassListVO> class_list() {
		return sql.selectList("hong.mapper.classlist");
	}

	public List<TestVO> test_list(int class_id) {
		if(class_id==0) {
			return sql.selectList("hong.mapper.testlistall", class_id);						
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

}
