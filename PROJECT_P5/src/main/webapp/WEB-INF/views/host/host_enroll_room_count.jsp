<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
</head>
<body>
	<form action="">
		최대 숙박인원 <br><input type="text" name="maximumStay" class="maximum-stay" disabled value="1"/>
		<button id="maximum-increase-quantity">▲</button>
		<button id="maximum-decrease-quantity">▼</button><br>

		방 갯수를 입력해볼까요? <br><input type="text"name="roomCount"class="room-count" disabled value="1"/>
		<button id="count-increase-quantity">▲</button>
		<button id="count-decrease-quantity">▼</button><br>
		게스트가 사용할 수 있는 침대가 몇 개 인가요?<br> <input type="text"name="bedCount"class="bed-count" disabled value="0"/>
		<button id="bed-increase-quantity">▲</button>
		<button id="bed-decrease-quantity">▼</button><br>
		게스트가 사용할 수 있는 욕실은요?<br>
		<input type="text"name="bathroomCount"name="bathroomCount"class="bathroom-count" disabled value="1"/>
		<button id="bathroom-increase-quantity">▲</button>
		<button id="bathroom-decrease-quantity">▼</button>
		<!--index.jsp랑 똑같음  침대개수는 0이 낮은값 나머지는 1이 낮은값 그이상을줄일수 없음 -->
		<script>
		/*최대 숙박인원  */
			$(function() {
				$('#maximum-decrease-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.maximum-stay').val();
					var num = parseInt(stat, 10);
					num--;
					if (num <= 0) {
						/* 	alert("더이상 줄일수 없습니다") */
						num = 1;

					}
					$('.maximum-stay').val(num);
				});
				$('#maximum-increase-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.maximum-stay').val();
					var num = parseInt(stat, 10);
					num++;

					$('.maximum-stay').val(num);
				});
			});
		
		/*방갯수  */
			$(function() {
				$('#count-decrease-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.room-count').val();
					var num = parseInt(stat, 10);
					num--;
					if (num <= 0) {
						/* 	alert("더이상 줄일수 없습니다") */
						num = 1;

					}
					$('.room-count').val(num);
				});
				$('#count-increase-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.room-count').val();
					var num = parseInt(stat, 10);
					num++;

					$('.room-count').val(num);
				});
			});
		/*게스트가 사용할 침대개수  */
				$(function() {
				$('#bed-decrease-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.bed-count').val();
					var num = parseInt(stat, 10);
					num--;
					if (num < 0) {
						/* 	alert("더이상 줄일수 없습니다") */
						num = 0;

					}
					$('.bed-count').val(num);
				});
				$('#bed-increase-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.bed-count').val();
					var num = parseInt(stat, 10);
					num++;

					$('.bed-count').val(num);
				});
			});
		/*욕실  */
				$(function() {
				$('#bathroom-decrease-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.bathroom-count').val();
					var num = parseInt(stat, 10);
					num--;
					if (num <=0) {
						/* 	alert("더이상 줄일수 없습니다") */
						num = 1;

					}
					$('.bathroom-count').val(num);
				});
				$('#bathroom-increase-quantity').click(function(e) {
					e.preventDefault();
					var stat = $('.bathroom-count').val();
					var num = parseInt(stat, 10);
					num++;

					$('.bathroom-count').val(num);
				});
			});
		</script>
		<input type="submit" value="다음" />
	</form>
	<!--페이지 넘어가기(임시방안)  -->
<a href="host_enroll_room_type.jsp">이전</a>
<a href="host_enroll_address.jsp">다음</a>
</body>
</html>