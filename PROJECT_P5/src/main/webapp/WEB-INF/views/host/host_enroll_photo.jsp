<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
 <script>
//이미지 정보들을 담을 배열   

var sel_files = [];   



$(document).ready(function() {   

    $("#picture").on("change", handleImgFileSelect);   

});    



function fileUploadAction() {   

    console.log("fileUploadAction");   

    $("#picture").trigger('click');   

}   



function handleImgFileSelect(e) {   

    // 이미지 정보들을 초기화   

    sel_files = [];   

/*     $(".imgs_wrap").empty();   */ 



    var files = e.target.files;   

    var filesArr = Array.prototype.slice.call(files);   

    var index = 0;   

      

    filesArr.forEach(function(f) {   

        if(!f.type.match("image.*")) {   

            alert("확장자는 이미지 확장자만 가능합니다.");   

            return;   

        }   



        sel_files.push(f);   



        var reader = new FileReader();   



        reader.onload = function(e) {   

            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove' width=\"150px\" ></a>";   

              

            $(".imgs_wrap").append(html);   

            index++;   

        }   

        reader.readAsDataURL(f);   

    });   

}   



function deleteImageAction(index) {   

    console.log("index : "+index);   

    console.log("sel length : "+sel_files.length);   



    sel_files.splice(index, 1);   



    var img_id = "#img_id_"+index;   

    $(img_id).remove();    

}   



function fileUploadAction() {   

    console.log("fileUploadAction");   

    $("#picture").trigger('click');   

}   



function submitAction() {   

    console.log("업로드 파일 갯수 : "+sel_files.length);   

    var data = new FormData();   



    for(var i=0, len=sel_files.length; i<len; i++) {   

        var name = "image_"+i;   

        data.append(name, sel_files[i]);   

    }   

    data.append("image_count", sel_files.length);   

    if(sel_files.length < 1) {   

        alert("한개이상의 파일을 선택해주세요.");   

        return;   

    }              

    var xhr = new XMLHttpRequest();   

    xhr.open("POST","./register4.jsp");   

    xhr.onload = function(e) {   

        if(this.status == 200) {   

            console.log("Result : "+e.currentTarget.responseText);   

        }   

    }   

    xhr.send(data);   

}
</script>
 </head>
<body>
<form action="" >
               
               <div class="upload_List_Block">
                  
                  <div class="upload_List_Title">사진</div>
                  
                  <div class="upload_List_Input">
                     <div class="input_wrap">
                        <div class="imgs_wrap">
                           <img id="img" />
                        </div>
                        <a href="javascript:" onclick="fileUploadAction();" class="my_button"></a>  
                        <input type="file" id="picture" multiple="multiple"/>
                     </div>
                  </div>
               </div>
               <input type="submit" value="다음" />
               </form>
               <a href="host_enroll_facilities.jsp">이전</a>
               <a href="host_enroll_description.jsp">다음</a>
</body>

</html>