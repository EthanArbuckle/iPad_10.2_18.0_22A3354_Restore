@implementation APDataAdaptor

+ (id)dispatchQueue
{
  if (qword_100268798 != -1)
    dispatch_once(&qword_100268798, &stru_1002130A8);
  return (id)qword_100268790;
}

+ (NSString)identifier
{
  return (NSString *)&stru_100219118;
}

- (BOOL)allowEmptyParameters
{
  return 0;
}

- (void)runWithParametersSync:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  dispatch_time_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *, void *);
  void *v22;
  NSObject *v23;
  id v24;
  NSErrorUserInfoKey v25;
  void *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v6 = a3;
  v7 = a4;
  v8 = APLogForCategory(46);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v28 = (id)objc_opt_class(self);
    v29 = 2114;
    v30 = v6;
    v10 = v28;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Running data source %{public}@ synchronously with parameters %{public}@", buf, 0x16u);

  }
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_10008ABD0;
  v22 = &unk_1002130D0;
  v11 = dispatch_semaphore_create(0);
  v23 = v11;
  v12 = v7;
  v24 = v12;
  -[APDataAdaptor runWithParameters:handler:](self, "runWithParameters:handler:", v6, &v19);
  v13 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v11, v13))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor identifier](self, "identifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@' timed out (parameters %@)"), v14, v15, v19, v20, v21, v22, v23));

    v25 = NSLocalizedDescriptionKey;
    v26 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5205, v17));

    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v18);
  }

}

- (void)runWithParameters:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  unsigned __int8 v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = APLogForCategory(46);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v15 = (id)objc_opt_class(self);
    v16 = 2114;
    v17 = v6;
    v10 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Running data source %{public}@ with parameters %{public}@", buf, 0x16u);

  }
  -[APDataAdaptor setParameters:](self, "setParameters:", v6);
  v13 = 0;
  v11 = -[APDataAdaptor _validateParameters:](self, "_validateParameters:", &v13);
  v12 = v13;
  if ((v11 & 1) != 0)
    -[APDataAdaptor _run:](self, "_run:", v7);
  else
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v12);

}

- (BOOL)addData:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v11;
  void *v12;

  v4 = APLogForCategory(46);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "DataAdaptor %@ does not support addition.", (uint8_t *)&v11, 0xCu);

  }
  return 0;
}

- (void)clearAllData
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = APLogForCategory(46);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = (objc_class *)objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "DataAdaptor %@ does not support deletion.", (uint8_t *)&v9, 0xCu);

  }
}

- (void)clearDataWithPredicate:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;

  v4 = APLogForCategory(46);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "DataAdaptor %@ does not support deletion.", (uint8_t *)&v10, 0xCu);

  }
}

- (BOOL)_checkClassType:(id)a3 name:(id)a4 expectedClass:(Class)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  NSErrorUserInfoKey v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  if (v10 && (objc_opt_isKindOfClass(v10, a5) & 1) == 0)
  {
    if (a6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor identifier](self, "identifier"));
      v13 = NSStringFromClass(a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: parameter '%@' must be of type %@."), v12, v11, v14));

      v18 = NSLocalizedDescriptionKey;
      v19 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5201, v16));

      LOBYTE(a6) = 0;
    }
  }
  else
  {
    LOBYTE(a6) = 1;
  }

  return (char)a6;
}

- (BOOL)_requireClassType:(id)a3 name:(id)a4 expectedClass:(Class)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSErrorUserInfoKey v16;
  void *v17;

  v10 = a3;
  v11 = a4;
  if (v10)
  {
    LOBYTE(a6) = -[APDataAdaptor _checkClassType:name:expectedClass:error:](self, "_checkClassType:name:expectedClass:error:", v10, v11, a5, a6);
  }
  else if (a6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor identifier](self, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: missing required parameter '%@'."), v12, v11));

    v16 = NSLocalizedDescriptionKey;
    v17 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5202, v14));

    LOBYTE(a6) = 0;
  }

  return (char)a6;
}

- (void)_run:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSErrorUserInfoKey v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor identifier](self, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@' does not override _run method."), v5));

  v9 = NSLocalizedDescriptionKey;
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5206, v7));

  (*((void (**)(id, _QWORD, _QWORD, void *))v4 + 2))(v4, 0, 0, v8);
}

- (BOOL)_validateParameters:(id *)a3
{
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  NSErrorUserInfoKey v11;
  void *v12;

  if (-[APDataAdaptor allowEmptyParameters](self, "allowEmptyParameters"))
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor parameters](self, "parameters"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptor identifier](self, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor '%@' requires at least one parameter"), v8));

  if (a3)
  {
    v11 = NSLocalizedDescriptionKey;
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5202, v10));

  }
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
