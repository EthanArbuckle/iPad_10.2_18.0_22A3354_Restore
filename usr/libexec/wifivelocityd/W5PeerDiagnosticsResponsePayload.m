@implementation W5PeerDiagnosticsResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDiagnosticsResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerDiagnosticsResponsePayload *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSArray *results;
  NSObject *v18;
  W5PeerDiagnosticsResponsePayload *v19;
  uint64_t v21;
  int v22;
  id v23;
  objc_super v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)W5PeerDiagnosticsResponsePayload;
  v5 = -[W5PeerDiagnosticsResponsePayload init](&v24, "init");
  if (!v5
    || (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) == 0))
  {

    v21 = sub_10008F56C();
    v18 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315906;
      v26 = "-[W5PeerDiagnosticsResponsePayload initWithRequest:]";
      v27 = 2080;
      v28 = "W5PeerDiagnosticsResponsePayload.m";
      v29 = 1024;
      v30 = 56;
      v31 = 2114;
      v32 = 0;
      v22 = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@'", &v25, v22);
    }
    v9 = 0;
    v8 = 0;
    v16 = 0;
    v5 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("status")));
  v8 = v7;
  if (v7)
    v5->_status = (int64_t)objc_msgSend(v7, "integerValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testResults")));
  v11 = objc_opt_class(NSArray, v10);
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(W5DiagnosticsTestResult, v12), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v23 = 0;
  v15 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v9, &v23));
  v16 = v23;
  results = v5->_results;
  v5->_results = (NSArray *)v15;

  if (!v5->_results)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("testError")));
    if (v18)
      objc_storeStrong((id *)&v5->_error, v18);
LABEL_8:

  }
  v19 = v5;

  return v19;
}

- (id)encode
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;
  int v20;
  id v21;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload version](self, "version"));
    v7 = -[W5PeerDiagnosticsResponsePayload status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload results](self, "results"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload error](self, "error"));
    v22 = 136316674;
    v23 = "-[W5PeerDiagnosticsResponsePayload encode]";
    v24 = 2080;
    v25 = "W5PeerDiagnosticsResponsePayload.m";
    v26 = 1024;
    v27 = 66;
    v28 = 2114;
    v29 = v6;
    v30 = 2048;
    v31 = v7;
    v32 = 2114;
    v33 = v8;
    v34 = 2114;
    v35 = v9;
    v20 = 68;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) version='%{public}@', status=%ld, status='%{public}@' error='%{public}@'", &v22, v20);

  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload version](self, "version"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload version](self, "version"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

    if (!-[W5PeerDiagnosticsResponsePayload status](self, "status"))
    {
LABEL_9:
      v15 = 0;
      v10 = 0;
      goto LABEL_11;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerDiagnosticsResponsePayload status](self, "status")));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("status"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload results](self, "results"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload results](self, "results"));
      v21 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v21));
      v10 = v21;

      objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("testResults"));
      goto LABEL_11;
    }
    v10 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload error](self, "error"));

    if (v10)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsResponsePayload error](self, "error"));
      objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("testError"));

      goto LABEL_9;
    }
  }
  v15 = 0;
LABEL_11:
  if (!objc_msgSend(v3, "count"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerDiagnosticsResponsePayload encode]"));
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v18, 0));

    objc_exception_throw(v19);
  }

  return v3;
}

- (NSNumber)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  self->_version = (NSNumber *)a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
