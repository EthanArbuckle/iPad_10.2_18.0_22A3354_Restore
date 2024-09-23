@implementation W5PeerDebugRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDebugRequestPayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerDebugRequestPayload *v5;
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
  NSObject *v16;
  W5DebugConfiguration *configuration;
  uint64_t v18;
  NSObject *v19;
  W5PeerDebugRequestPayload *v20;
  uint64_t v22;
  uint64_t v23;
  int v24;
  id v25;
  objc_super v26;
  int v27;
  id v28;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)W5PeerDebugRequestPayload;
  v5 = -[W5PeerDebugRequestPayload init](&v26, "init");
  if (!v5
    || (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) == 0)
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")))) == 0)
  {

    v22 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      v24 = 2;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] init error!", &v27, v24);
    }
    v8 = 0;
    v10 = 0;
    v5 = 0;
    goto LABEL_9;
  }
  v8 = v7;
  v5->_requestType = (unint64_t)objc_msgSend(v7, "integerValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("config")));
  if (v10)
  {
    v11 = objc_opt_class(W5DebugConfiguration, v9);
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(W5DiagnosticsMode, v12), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v25 = 0;
    v15 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v10, &v25));
    v16 = v25;
    configuration = v5->_configuration;
    v5->_configuration = (W5DebugConfiguration *)v15;

    if (v16)
    {
      v18 = sub_10008F56C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138543362;
        v28 = v4;
        LODWORD(v23) = 12;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v19, 0, "[wifivelocity] failed to decode configuration from raw payload='%{public}@'", &v27, v23);
      }

    }
LABEL_9:

  }
  v20 = v5;

  return v20;
}

- (id)encode
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v14;
  id v15;
  id v16;
  int v17;
  id v18;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload version](self, "version"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload version](self, "version"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    if (-[W5PeerDebugRequestPayload requestType](self, "requestType"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[W5PeerDebugRequestPayload requestType](self, "requestType")));
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("type"));

      if ((id)-[W5PeerDebugRequestPayload requestType](self, "requestType") == (id)2)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload configuration](self, "configuration"));

        if (v7)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDebugRequestPayload configuration](self, "configuration"));
          v16 = 0;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v16));
          v10 = v16;

          if (v10 || !v9)
          {
            v11 = sub_10008F56C();
            v12 = objc_claimAutoreleasedReturnValue(v11);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              v17 = 138543362;
              v18 = v10;
              _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] failed to encode configuration with error='%{public}@'", &v17, 12);
            }

          }
          else
          {
            objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("config"));
          }

        }
      }
    }
  }
  if (!objc_msgSend(v3, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerDebugRequestPayload encode]"));
    v15 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v14, 0));

    objc_exception_throw(v15);
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

- (W5DebugConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
