//表单验证
$(function() {
	common.showMessage($("#message").val());
	$("#mainForm").validate({
		rules : {
			"title" : "required",
			"link" : "required",
			"weight" : {
				required : true,
				digits : true,
				maxlength : 5
			}
		},
		//校验失败的提示信息
		messages : {
			"title" : "请输入标题！"
		}
	});
});

function modify() {
	$("#mainForm").submit();
}

function goback() {
	location.href = $('#basePath').val() + '/ad';
}