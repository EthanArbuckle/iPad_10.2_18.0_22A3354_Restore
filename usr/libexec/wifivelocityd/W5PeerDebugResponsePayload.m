@implementation W5PeerDebugResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDebugResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerDebugResponsePayload *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  uint64_t v15;
  id v16;
  W5DebugConfiguration *configuration;
  W5DebugConfiguration *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  id v32;
  objc_super v33;
  int v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)W5PeerDebugResponsePayload;
  v5 = -[W5PeerDebugResponsePayload init](&v33, "init");
  if (!v5
    || (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) == 0))
  {
    v8 = 0;
    goto LABEL_13;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("status")));
  v8 = v7;
  if (!v7)
  {
LABEL_13:
    v16 = 0;
    v10 = 0;
    goto LABEL_15;
  }
  v5->_status = (int64_t)objc_msgSend(v7, "integerValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("config")));
  if (!v10)
  {
    v16 = 0;
    goto LABEL_15;
  }
  v11 = objc_opt_class(W5DebugConfiguration, v9);
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(W5DiagnosticsMode, v12), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v32 = 0;
  v15 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v10, &v32));
  v16 = v32;
  configuration = v5->_configuration;
  v5->_configuration = (W5DebugConfiguration *)v15;

  v18 = v5->_configuration;
  if (!v18)
  {
LABEL_15:

    v30 = sub_10008F56C();
    v26 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 136315906;
      v35 = "-[W5PeerDebugResponsePayload initWithRequest:]";
      v36 = 2080;
      v37 = "W5PeerDebugResponsePayload.m";
      v38 = 1024;
      v39 = 63;
      v40 = 2114;
      v41 = v16;
      LODWORD(v31) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) init error, decoding errror='%{public}@'", &v34, v31);
    }
    v5 = 0;
    goto LABEL_10;
  }
  v19 = objc_claimAutoreleasedReturnValue(-[W5DebugConfiguration diagnosticsMode](v18, "diagnosticsMode"));
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[W5DebugConfiguration diagnosticsMode](v5->_configuration, "diagnosticsMode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uuid"));

    if (!v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[W5DebugConfiguration diagnosticsMode](v5->_configuration, "diagnosticsMode"));
      objc_msgSend(v24, "setUuid:", v23);

      v25 = sub_10008F56C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload configuration](v5, "configuration"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "diagnosticsMode"));
        v34 = 136315906;
        v35 = "-[W5PeerDebugResponsePayload initWithRequest:]";
        v36 = 2080;
        v37 = "W5PeerDebugResponsePayload.m";
        v38 = 1024;
        v39 = 56;
        v40 = 2114;
        v41 = v28;
        LODWORD(v31) = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v26, 0, "[wifivelocity] %s (%s:%u) generating UUID for diagnosticsMode='%{public}@'", &v34, v31);

      }
LABEL_10:

    }
  }

  return v5;
}

- (id)encode
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v14;
  id v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload version](self, "version"));

  if (!v4)
    goto LABEL_16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload version](self, "version"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  if (!-[W5PeerDebugResponsePayload status](self, "status"))
  {
    v8 = 0;
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerDebugResponsePayload status](self, "status")));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("status"));

  v4 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload configuration](self, "configuration"));
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugResponsePayload configuration](self, "configuration"));
    v16 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v16));
    v4 = v16;

    if (!v4 && v8)
    {
      objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("config"));
LABEL_7:
      v4 = 0;
      goto LABEL_11;
    }
    v9 = sub_10008F56C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = "-[W5PeerDebugResponsePayload encode]";
      v19 = 2080;
      v20 = "W5PeerDebugResponsePayload.m";
      v21 = 1024;
      v22 = 87;
      v23 = 2114;
      v24 = v4;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'", &v17, 38);
    }

  }
  else
  {
LABEL_16:
    v8 = 0;
  }
LABEL_11:
  if (!objc_msgSend(v3, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerDebugResponsePayload encode]"));
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

    objc_exception_throw(v15);
  }
  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;
  v12 = v11;

  return v12;
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

- (W5DebugConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
