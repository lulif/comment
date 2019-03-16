$(function() {
	common.showMessage($("#message").val());
    // 验证信息
	$("#mainForm").validate({
		rules:{
			"name" : {
				required : true
			},
			"password" : {
				required : true
			}
		}
	});
	
	// 单击登录
	$("#submit_login").click(function () {
		if($("#password").val()) {
			//提交MD5码 $.md5使用jquery的插件
			$("#password_md5").val($.md5($("#password").val()));
		}
		$("#mainForm").submit();
    })
});