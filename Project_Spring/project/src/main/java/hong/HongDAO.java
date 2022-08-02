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
		return sql.selectList("hong.mapper.testlist", class_id);
	}

}
