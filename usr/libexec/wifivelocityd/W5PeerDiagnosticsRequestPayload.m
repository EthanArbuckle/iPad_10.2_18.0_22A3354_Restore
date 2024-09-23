@implementation W5PeerDiagnosticsRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerDiagnosticsRequestPayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerDiagnosticsRequestPayload *v5;
  NSNumber *v6;
  void *v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSDictionary *configuration;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSSet *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSArray *tests;
  uint64_t v23;
  void *v24;
  NSUUID *v25;
  NSObject *p_super;
  W5PeerDiagnosticsRequestPayload *v27;
  uint64_t v29;
  uint64_t v30;
  id v31;
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
  v33.super_class = (Class)W5PeerDiagnosticsRequestPayload;
  v5 = -[W5PeerDiagnosticsRequestPayload init](&v33, "init");
  if (v5
    && (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("configuration")));
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSDictionary, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v32 = 0;
    v11 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v10, v7, &v32));
    v12 = v32;
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("tests")));
    v16 = objc_opt_class(NSArray, v15);
    v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(W5DiagnosticsTestRequest, v17), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v31 = v12;
    v20 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v19, v14, &v31));
    v21 = v31;

    tests = v5->_tests;
    v5->_tests = (NSArray *)v20;

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("uuid")));
    if (v23)
    {
      v24 = (void *)v23;
      v25 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v23);
      p_super = &v5->_uuid->super;
      v5->_uuid = v25;
      goto LABEL_5;
    }
  }
  else
  {
    v7 = 0;
    v21 = 0;
    v14 = 0;
  }

  v29 = sub_10008F56C();
  p_super = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 136315906;
    v35 = "-[W5PeerDiagnosticsRequestPayload initWithRequest:]";
    v36 = 2080;
    v37 = "W5PeerDiagnosticsRequestPayload.m";
    v38 = 1024;
    v39 = 54;
    v40 = 2114;
    v41 = v21;
    LODWORD(v30) = 38;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@'", &v34, v30);
  }
  v24 = 0;
  v5 = 0;
LABEL_5:

  v27 = v5;
  return v27;
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload version](self, "version"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload version](self, "version"));
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload configuration](self, "configuration"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload configuration](self, "configuration"));
      v28 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v28));
      v4 = v28;

      if (!v8)
      {
        v9 = sub_10008F56C();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136315906;
          v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          v31 = 2080;
          v32 = "W5PeerDiagnosticsRequestPayload.m";
          v33 = 1024;
          v34 = 72;
          v35 = 2114;
          v36 = v4;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode configuration with error='%{public}@'", &v29, 38);
        }
LABEL_20:
        v15 = 0;
        v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v27 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v27));
      v4 = v27;

      if (!v8)
      {
        v21 = sub_10008F56C();
        v10 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136315906;
          v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          v31 = 2080;
          v32 = "W5PeerDiagnosticsRequestPayload.m";
          v33 = 1024;
          v34 = 77;
          v35 = 2114;
          v36 = v4;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode NULL configuration with error='%{public}@'", &v29, 38);
        }
        goto LABEL_20;
      }
    }
    v12 = v4;
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("configuration"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload tests](self, "tests"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload tests](self, "tests"));
      v26 = v4;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v26));
      v4 = v26;

      if (!v15)
      {
        v16 = sub_10008F56C();
        v10 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136315906;
          v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          v31 = 2080;
          v32 = "W5PeerDiagnosticsRequestPayload.m";
          v33 = 1024;
          v34 = 85;
          v35 = 2114;
          v36 = v4;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode tests with error='%{public}@'", &v29, 38);
        }
LABEL_23:
        v15 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v25 = v4;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v25));
      v4 = v25;

      if (!v15)
      {
        v22 = sub_10008F56C();
        v10 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 136315906;
          v30 = "-[W5PeerDiagnosticsRequestPayload encode]";
          v31 = 2080;
          v32 = "W5PeerDiagnosticsRequestPayload.m";
          v33 = 1024;
          v34 = 90;
          v35 = 2114;
          v36 = v4;
          _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) failed to encode NULL tests with error='%{public}@'", &v29, 38);
        }
        goto LABEL_23;
      }
    }
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("tests"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload uuid](self, "uuid"));

    if (!v18)
      goto LABEL_15;
    v10 = objc_claimAutoreleasedReturnValue(-[W5PeerDiagnosticsRequestPayload uuid](self, "uuid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject UUIDString](v10, "UUIDString"));
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("uuid"));

    goto LABEL_14;
  }
  v15 = 0;
  v8 = 0;
LABEL_15:
  if (!objc_msgSend(v3, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerDiagnosticsRequestPayload encode]"));
    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

    objc_exception_throw(v24);
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

- (NSArray)tests
{
  return self->_tests;
}

- (void)setTests:(id)a3
{
  objc_storeStrong((id *)&self->_tests, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSDictionary)configuration
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
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tests, 0);
}

@end
