<%@ tag language="java" pageEncoding="UTF-8" %>
<!-- 自定义标签的属性，表示外面创建来的参数 -->
<%@ attribute type="org.imooc.bean.Page" name="page" required="true" %>
<%@ attribute type="String" name="jsMethodName" required="true" %>

<!-- 封装功能要的JS -->
<script type="text/javascript">
	function transCurrentPage(currentPage) {
		var rule = /^[0-9]*[1-9][0-9]*$/;
		if(!rule.test(currentPage)) {
			currentPage = 1;
		}		
		//交回控制主权(降低耦合度)，从外界传入一个方法名，我在这个里面调用它,
		//而不是像$("#mainForm").submit();这样直接获取外面的东西
		eval("${jsMethodName}(currentPage)");
	}
</script>
<!-- 要封装的JSP -->
<div class="page fix">
	<a href="javascript:transCurrentPage('1');" class="first">首页</a>
	<a href="javascript:transCurrentPage('${page.currentPage - 1}');" class="pre">上一页</a>
	当前第<span>${page.currentPage}/${page.totalPage}</span>页
	<a href="javascript:transCurrentPage('${page.currentPage + 1}');" class="next">下一页</a>
	<a href="javascript:transCurrentPage('${page.totalPage}');" class="last">末页</a>
	跳至 &nbsp;<input id="currentPageText" value="1" class="allInput w28" type="text"/>&nbsp;页 &nbsp;
	<a href="javascript:transCurrentPage($('#currentPageText').val());" class="go">GO</a>
</div>