$(function() {
	common.showMessage($("#message").val());
});

function add() {
	if(check()) {
		$("#mainForm").submit();
	}
}

function check() {
	// TODO 需要添加表单验证
	return true;
}

function goback() {
	//从控制器返回到addList
	location.href = $('#basePath').val() + '/ad';
}