package hong;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HongService {
	
	@Autowired private HongDAO dao;
	
	public List<ClassListVO> class_list() {
		return dao.class_list();		
	}

	public List<TestVO> test_list(int class_id) {	
		return dao.test_list(class_id);
	}

	
	

}
