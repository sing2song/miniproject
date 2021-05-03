<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- 메인컨텐츠 시작 -->
<div id="mainContent_wrap">	
	<div id="order_search_wrap" style="width: 1200px; margin: 0 auto;">
		<div id="order_search_title" style="margin-bottom: 20px;">
			<h1 id="orderManager" style="font-weight:normal; display:inline-block;cursor:pointer;">주문관리</h1>
			
		</div>
		
		
		
		<form name="orderList_actionForm">
		<div id="orderSeach_list" align="left" style="margin-top: 50px;">
			<div id="order_selectDiv">
				<input type="button" id="selDelete" value="선택 삭제" onclick="selectDelete()"/>
			</div>
			
			<table id="orderList_table" border="1" style="width: 100%; border: 1px solid #d9dadc; border-spacing: 0; line-height: 1.5;">
				<tr>
					<th style="width: 3%;">
						<input type="checkbox" id="check_all" style="cursor:pointer;">
					</th>	
					<th style="width: 10%;">주문일</th>
					<th style="width: 9%;">주문번호</th>
					<th style="width: 25%;">상품이름</th>
					<th style="width: 9%;">주문자</th>
					<th style="width: 8%;">결제금액</th>
					<th style="width: 8%;">주문상태</th>
					<th style="width: 8%;">취소처리</th>
				</tr>
				<c:forEach var="orderDTO" items="${list}" varStatus="status">
					<tr class="orderList_tr">
						<td align="center">
							<input type="checkbox" value="${orderDTO.orderCode }" name="check" class="check" style="cursor : pointer;">
						</td>
						<td align="center">${orderDTO.orderDate }</td>
						<td align="center" class="productDetail" id="orderCode" style="cursor : pointer;">${orderDTO.orderCode }</td>
						<td align="center" style="text-align:center; cursor :pointer;" class="productDetail order_product"+${status.index } id="${orderDTO.orderCode }">
							<span>${orderDTO.productName }<br></span>
							<button class="pDetail_button tbl_button" id="${orderDTO.orderCode }" type="button">상세보기</button>
						</td>
						<td align="center" style="padding: 0px 5px;">${orderDTO.userName }</td>
						<td align="right" id="totalPayment_td" style="padding-right: 5px;">${orderDTO.discountPrice }원</td>
						<td align="center">주문접수<br><span class="whoCancel" id="whoCancel"+${orderDTO.orderCode }></span></td>
						<td align="center"><button class="cancel_button tbl_button" id="cancel_button"+${orderDTO.orderCode } type="button" style="display: none;">처리</button></td>
						
					</tr> 
				</c:forEach>
				
			</table>
			<br>
			
		</div>
		</form>
				
		<!-- 선택 갱신 시 확인&취소 / Modal -->
	    <div id="open_changeConfirmModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">주문상태 갱신</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">선택된 주문의 주문상태를 갱신하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="changeConfirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="changeConfirmClose_Modal" style="float:right;">
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>
		</div>
		
  		<!--End Modal-->
		 <!-- 선택 삭제 시 확인&취소 / Modal -->
	    <div id="open_deleteConfirmModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
          		<p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">주문삭제</span></b></span></p>
				<p style="text-align: center; line-height: 1.5;"><br>	<span style="color: red;">정말  삭제 하시겠습니까?</span></p>
   				<p><br /></p>

				<div class="modalDiv" id="deleteConfirmOK_Modal" style="display: inline-block;">
					<span class="pop_bt" style="font-size: 13pt; " >
       					  확인
    				</span>
				</div>
				
				<div  class="modalDiv" id="deleteConfirmClose_Modal" style="float:right;">				
					<span class="pop_bt" style="font-size: 13pt;" >
               			 취소
            		</span>
        		</div>
			</div>
		</div>
  		<!--End Modal-->
  		
		<!-- 체크박스 선택 X / Modal -->
		<div id="open_nonCheckModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">	
				<p style="text-align: center;"><span style="font-size: 14pt;"><b><span id="noneCheck_modal" style="font-size: 24pt;"></span></b></span></p>
                <p id="stateNoneSelect" style="text-align: center; line-height: 1.5; color: red;"><br />항목을 선택해 주세요</p>
                <p><br /></p>
            	<div class="close_Modal" style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;">
               		<span class="pop_bt" style="font-size: 13pt;" >
                   	 	 닫기
                	</span>
            	</div>
     		</div>
		</div>
    	 <!--End Modal-->
		
	</div><!-- search_wrap -->
	
</div><!-- 메인컨텐츠 끝 -->


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

/* 숫자탭 컴마 추가 */
function addComma(num) {
 var regexp = /\B(?=(\d{3})+(?!\d))/g;
 return num.toString().replace(regexp, ',');
}


//orderState/erState에 따른 변화
function changeByState(orderState,whoCancel,erState,orderCode){
	//주문취소인 경우
	if(orderState == 0){
		//버튼변경
		$('#cancel_button'+orderCode).text('상세');
		$('#cancel_button'+orderCode).addClass('cancel_detail');
		
		$('#cancel_button'+orderCode).css('background-color','powderblue').hover(function(){
			 $(this).css('background-color','#f8585b')}, function(){
			 $(this).css('background-color','powderblue')		 
		});
		
		$('#cancel_button'+orderCode).removeClass('cancel_button');
		
		//누가 주문취소를 했는지
		if(whoCancel == 0){
			$('#whoCancel'+orderCode).text('<주문자>').css('font-size','12px');
		}
		else if(whoCancel == 1){
			$('#whoCancel'+orderCode).text('<관리자>').css('font-size','12px');
		}
	}
	//배송완료 or 주문완료인 경우
	else if(orderState == 4 || orderState == 5){
		$('.cancel_button').hide();
	}	
	//교환/환불 버튼
	if(erState == null){
		$('#erDetail'+orderCode).hide();
	}
	else{
		$('#erDetail'+orderCode).show();
	}
}



//제품상세페이지로 이동
$(document).on('click','.pDetail_button', function(){
	var orderCode = $(this).attr('id');
	location.href="/miniproject/admin/orderView?orderCode="+orderCode;
});

//취소처리버튼 클릭 : 취소신청
$(document).on('click','.cancel_button',function(){
	var orderCode = $(this).attr('id');
	var orderCode = orderCode.substring(13);
	location.href='/miniproject/admin/orderCancelRegisterForm?orderCode='+orderCode;
});

//취소상세버튼 클릭 : 취소처리확인
$(document).on('click','.cancel_detail',function(){
	var orderCode = $(this).attr('id').substring(13);
	location.href='/miniproject/admin/orderCancelDetail?orderCode='+orderCode;
});


//체크박스 전체 선택
$('#check_all').click(function(){
	if($('#check_all').is(':checked'))
		$('.check').prop('checked', true);
	else
		$('.check').prop('checked', false);
});

/* 모달선택 창 닫기 */
$('#changeConfirmClose_Modal').click(function(){
	$('#open_changeConfirmModal').hide();
});

/* 모달삭제 창 닫기 */
$('#deleteConfirmClose_Modal').click(function(){
	$('#open_deleteConfirmModal').hide();
});

$('.close_Modal').click(function(){
	$('#open_nonCheckModal').hide();
	$('#open_deleteSuccessModal').hide();
});

//기간 설정 버튼
var today = new Date();
var year = today.getFullYear();
var month = today.getMonth()+1;
var day = today.getDate();

//선택삭제
function selectDelete(){
	var count = $('.check:checked').length;
	
	if(count==0){
		$('#noneCheck_modal').html('주문내역 삭제');
		$('#open_nonCheckModal').show();
	}else{
		$('#open_deleteConfirmModal').show();
		$("#deleteConfirmOK_Modal").off().on('click', function(){
			document.orderList_actionForm.method='post';
			document.orderList_actionForm.action='/miniproject/admin/selectedOrderDelete';
			document.orderList_actionForm.submit();
		});
	}
}
</script>
</html>