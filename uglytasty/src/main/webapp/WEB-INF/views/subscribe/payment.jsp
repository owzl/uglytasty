<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  
  <script src="https://kit.fontawesome.com/f1cf0537bc.js" crossorigin="anonymous"></script>


<style>
    .wrap{
        
        width: 25%;
        height: 2000px;
        margin: 0 auto;
    }
</style>
</head>
<body>
 <jsp:include page="../common/header.jsp"/>
<div class="wrap">

        <div style="padding-top: 50px;">
       
            <span style="font-size: 26px; font-weight: bold;">결제 정보</span>
        </div>
        <div style="height: 24px;"></div>
        <div class="rounded" style="background-color: rgb(255, 246, 238); padding-top: 20px; padding-bottom: 20px; font-size: 16px; font-weight: bold; text-align: center;"><span id="firstDeliveryDate">첫 배송 예정일: </span></div>
        <br>
        <div style="display: flex; justify-content: space-between;">
            <p style="text-align: left; font-size: 16px;">상품 금액</p>
            <p style="text-align: right; font-size: 16px;">25000원</p>
        </div>
        <div style="height: 16px;"></div>
        <div style="display: flex; justify-content: space-between;">
            <p style="text-align: left; font-size: 16px;">배송비</p>
            <p style="text-align: right; font-size: 16px;">3000원</p>
        </div>
        
        <div style="height: 16px;"></div>
        <div style="display: flex; justify-content: space-between; border-top: 1px solid #000;">
            <p style="text-align: left;  font-size: 18px; font-weight: bold;  ">결제 예정 금액</p>
            <p style="text-align: right; font-size: 18px; font-weight: bold; color: #ff6742;">매 회 28000원</p>
        </div>
        <div style="padding-top: 50px;">
          
            <span style="font-size: 26px; font-weight: bold;">결제 수단</span>
        </div>
        <div style="height: 24px;"></div>
        <div class="container">
            <!-- 누르면 각각 card2.png account2.png로 바뀌도록-->
            <div class="row justify-content-center">
                <div id="card-pay" class="col-sm" style=" text-align: center;">
                   <img src="resources/images/card1.PNG">
                </div>
                <div id="account-pay" class="col-sm" style=" text-align: center;">
                    <img src="resources/images/account1.PNG">
                </div>
               
            </div>
        </div>
        <div style="padding-top: 50px;">
            <a href="#" class="button is-rounded is-large is-fullwidth"  style="background-color: rgb(65, 75, 90); color: white; font-weight: bold;" onclick="postFormSubmit()">결제 진행하기</a>
        </div>
    </div>
    
     <form id="postForm" action="" method="post">
    	<input type="hidden" id="boxSize" name="boxSize" value="${boxSize }">
    	<input type="hidden" id="cycle" name="cycle" value="${cycle }">
    	<input type="hidden" id="address" name="address" value="${address }">
    	<input type="hidden" id="detailAddress" name="detailAddress" value="${detailAddress }">
    	<input type="hidden" id="recipient" name="recipient" value="${recipient }">
    	<input type="hidden" id="phone" name="phone" value="${phone }">
    	<input type="hidden" id="hateVegi" name="hateVegi" value="${hateVegi }">
    	<input type="hidden" id="userId" name="userId" value="${loginMember.userId }">
    	
    	
    
    </form>
    
    
    <script>
        function postFormSubmit(){
        	
        	
        	 const boxSizeInput = document.getElementById('boxSize');
        	 const cycleInput = document.getElementById('cycle');
        	 const recipientInput = document.getElementById('recipient');
        	 const phoneInput = document.getElementById('phone');
        	 const addressInput = document.getElementById('address');
        	 const detailAddressInput = document.getElementById('detailAddress');
        	 const hateVegiInput = document.getElementById('hateVegi')
        	 
        	  
             
    		$("#postForm").attr("action", "tossPayment.su").submit();

    		
    	}
        </script>
    
    
    <script>
    $(document).ready(function () {
        $("#card-pay").click(function () {
            $("#card-pay img").attr("src", "resources/images/card2.PNG");
            $("#account-pay img").attr("src", "resources/images/account1.PNG");
        });
        $("#account-pay").click(function () {
            $("#card-pay img").attr("src", "resources/images/card1.PNG");
            $("#account-pay img").attr("src", "resources/images/account2.PNG");
        });
    });
</script>
 <script>
        // Get the current date
        var currentDate = new Date();

        // Calculate the days until the next Friday (0: Sunday, 1: Monday, ..., 6: Saturday)
        var daysUntilFriday = (5 - currentDate.getDay() + 7) % 7;

        // Calculate the date of the next Friday
        var nextFriday = new Date(currentDate);
        nextFriday.setDate(currentDate.getDate() + daysUntilFriday);

        // Display the next Friday's date in Korean format
        var options = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
        var dateOptions = { year: 'numeric', month: '2-digit', day: '2-digit' };
        var formattedDate = nextFriday.toLocaleDateString('ko-KR', options);

        document.getElementById('firstDeliveryDate').textContent += formattedDate;
    </script>

    
</body>
</html>