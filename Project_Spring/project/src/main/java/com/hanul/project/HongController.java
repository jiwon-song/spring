package com.hanul.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import hong.ClassListVO;
import hong.HongService;
import hong.TestVO;

@Controller
public class HongController {
	
	@Autowired private HongService service;	// 이 부분은 일우꺼로 수정할 것
	

	@RequestMapping("test_list.ho")
	public String test(Model model, int class_id) {
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list();
		model.addAttribute("list", list);

		// 클래스 이름 뜨게 하기
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		
		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id);
		
		model.addAttribute("test_list", test_list);
		
		//선택한 반 이름 뜨게 하기
		
		
		
		return "hong/test_list";	
	}
	
	
	
}
