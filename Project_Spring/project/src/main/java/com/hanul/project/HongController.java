package com.hanul.project;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hong.ClassListVO;
import hong.HongService;
import hong.TestDetailVO;
import hong.TestVO;

@Controller
public class HongController {
	
	@Autowired private HongService service;	
	private String teacher_id = "admin";	
	
	// 홈화면 연결
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
				
		// 사이드메뉴에 반목록 가져오기
		List<ClassListVO> list = null;	
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("teacher_id", teacher_id);		
		return "index";
	}
	
	
	// 반별 테스트 목록 가죠오기
	@RequestMapping("test_list.ho")
	public String test_list(Model model, int class_id, String class_name, String dis) {
					
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);

		// 클래스 이름 뜨게 하기
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		
		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		//선택한 반 이름 뜨게 하기
		
		return "hong/test_list";	
	}
	
	// 테스트 추가하기 (vo에 저장되어 있는 class_id 사용)
	@RequestMapping("test_insert.ho")
	public String test_insert(TestVO vo) {
		
		//vo 에 저장되어 있으므로 사용하기만 하면 됨 			
		// 테스트 추가하는 메소드 
		service.test_insert(vo);

		
		return "redirect:test_list.ho?class_id="+vo.getClass_id();	
	}
	
	
	// 테스트 삭제하기 (vo 를 사용하지 않기 떄문에 test_id 따로 넣어줘서 사용)
	@RequestMapping("test_delete.ho")
	public String test_delete(int test_id, int class_id) {
		
		service.test_delete(test_id);		
		
		return "redirect:test_list.ho?class_id="+class_id;
	}
	
	// 테스트 수정할수 있는 페이지 요청하기
	@RequestMapping("test_modify.ho")
	public String test_modify(Model model, int test_id, int class_id, String class_name, String test_name) {
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);

		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것

		// 수정 선택한 테스트의 아이디를 가져옴
		model.addAttribute("test_id", test_id);	// 클래스 이름 가져오게 수정할 것

		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		return "hong/test_modify";
	}
	
	// 테스트 수정 요청 보내기
	@RequestMapping("test_update.ho")
	public String test_update(Model model, TestVO vo, int class_id, int test_id, String class_name, String test_name, String test_date) {
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);	

		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것	
			
		service.test_update(vo);	
	
		return "redirect:test_list.ho?class_id="+class_id;
	}
	
	
	
	
	// 테스트 상세 화면 불러오기 ////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping("test_detail.ho")
	public String test_detail(Model model, int test_id, String test_name, String class_name) {
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);	

		
		model.addAttribute("test_name", test_name);	
		model.addAttribute("class_name", class_name);	
		
		List<TestDetailVO> test_detail_list = null; 		
		
		test_detail_list = service.test_detail(test_id);
		model.addAttribute("test_detail_list", test_detail_list);	
		System.out.println(test_detail_list.size());
		
		return "hong/test_detail";
	}
	
	
	
	
	
	
	
}
