package org.imooc.dao.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.imooc.bean.BaseBean;
import org.imooc.bean.Page;

@Intercepts(value = {
		@Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class}) })
public class PageInterceptor implements Interceptor {

	public Object intercept(Invocation arg0) throws Throwable {
		StatementHandler statementHandler = (StatementHandler) arg0.getTarget();
		MetaObject metaObject = MetaObject.forObject(statementHandler, SystemMetaObject.DEFAULT_OBJECT_FACTORY,
				SystemMetaObject.DEFAULT_OBJECT_WRAPPER_FACTORY, new DefaultReflectorFactory());
		MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
		String id = mappedStatement.getId();
		if (id.endsWith("ByPage")) {
			BoundSql boundSql = statementHandler.getBoundSql();
			String sql = boundSql.getSql();
			String countSql = "select count(*) from(" + sql + ")t";
			Connection conn = (Connection) arg0.getArgs()[0];
			PreparedStatement statement = conn.prepareStatement(countSql);
			ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
			parameterHandler.setParameters(statement);
			ResultSet rs = statement.executeQuery();
			// 从BaseBean包含page，其他的bean继承BaseBean，能直接从BaseBean里面获取page对象
			// 封装一个基础类，共通的都继承这个基础类
			BaseBean bean = (BaseBean) boundSql.getParameterObject();
			Page page = bean.getPage();
			if (rs.next()) {
				page.setTotalNumber(rs.getInt(1));
			}
			String pageSql = sql + " limit " + (page.getCurrentPage() - 1) * page.getPageNumber() + ","
					+ page.getPageNumber();
			metaObject.setValue("delegate.boundSql.sql", pageSql);
		}
		return arg0.proceed();
	}

	public Object plugin(Object arg0) {
		return Plugin.wrap(arg0, this);
	}

	public void setProperties(Properties arg0) {

	}

}