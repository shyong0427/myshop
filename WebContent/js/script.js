function zipCheck() {
	url = "zipcheck.jsp?check=y";
	window.open(url, "post", "toolbar=no, width=350, height=300, top=200, left=300, status=yes, scrollbars=yes, menubar=no");
}

function idCheck() {
	if(regForm.id.value === "") {
		alert('아이디를 입력하세요.');
		regForm.id.focus();
	} else {
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "id", "toolbar=no, width=300, height=150, top=200, left=300, status=yes, scrollbars=yes, menubar=no");
	}
}

function inputCheck() {
	//입력 자료 검사 후 추가 처리
	if(regForm.id.value === "") {
		alert("아이디를 입력하세요.");
		regForm.id.focus();
		return;
	}
	
	if(regForm.passwd.value === "") {
		alert("비밀번호를 입력하세요.");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.passwd.value !== regForm.repasswd.value) {
		alert("비밀번호를 확인하세요.");
		regForm.passwd.focus();
		return;
	}
	
	if(regForm.name.value === "") {
		alert("이름을 입력하세요.");
		regForm.name.focus();
		return;
	}
	
	if(regForm.email.value === "") {
		alert("이메일을 입력하세요.");
		regForm.email.focus();
		return;
	}
	
	//정규 표현식으로 이메일 검사
	var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
	
	if(!regForm.email.value.match(regExp)) {
		alert("이메일을 정확히 입력하세요.");
		regForm.email.focus();
		return;
	}

	if(regForm.phone.value === "") {
		alert("전화번호를 입력하세요.");
		regForm.phone.focus();
		return;
	}
	
// 나머지 생략
	
	regForm.submit();
}

//로그인 후 개인정보 수정
function memberUpdate() {
	// 입력자료 검사 생략
	document.updateForm.submit();
}

function memberUpdateCancel() {
//	history.back();
	location.href="../guest/guest_index.jsp";
}

function memberDelete() {
	alert("회원탈퇴는 불가능합니다.");
}

function memberUpdate(id) {
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

function memberUpdateAdmin() {
	document.updateFormAdmin.submit();
}

function memberUpdateCancelAdmin() {
	location.href = "membermanager.jsp";
}

// 관리자 상품처리, 고객이용가능
function productDetail(no) {
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function productUpdate(no) {
	document.updateFrm.no.value = no;
	document.updateFrm.submit();
}

function productDelete(no) {
	if(confirm("정말 삭제할까요?")){
		document.delFrm.no.value = no;
		document.delFrm.submit();
	} 
}

// 카트 처리
function cartUpdate(form) {
	form.flag.value = "update";
	form.submit();
}

function cartDelete(form) {
	form.flag.value = "del";
	form.submit();	
}

// 관리자 주문처리
function orderDetail(no) {
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function orderUpdate(form) {
	document.detailFrm.flag.value = "update";
	document.detailFrm.submit();
}

function orderDelete(form) {
	document.detailFrm.flag.value = "delete";
	document.detailFrm.submit();
}