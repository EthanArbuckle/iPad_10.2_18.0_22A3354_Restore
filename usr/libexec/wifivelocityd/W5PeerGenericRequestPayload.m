@implementation W5PeerGenericRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (id)__allowedClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[10];

  v12[0] = objc_opt_class(NSArray, a2);
  v12[1] = objc_opt_class(NSDictionary, v2);
  v12[2] = objc_opt_class(NSNumber, v3);
  v12[3] = objc_opt_class(NSString, v4);
  v12[4] = objc_opt_class(NSData, v5);
  v12[5] = objc_opt_class(NSDate, v6);
  v12[6] = objc_opt_class(NSError, v7);
  v12[7] = objc_opt_class(W5Event, v8);
  v12[8] = objc_opt_class(W5Peer, v9);
  v12[9] = objc_opt_class(W5DiagnosticsMode, v10);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 10));
}

- (W5PeerGenericRequestPayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerGenericRequestPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSDictionary *info;
  uint64_t v12;
  NSObject *v13;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  int v18;
  id v19;
  objc_super v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)W5PeerGenericRequestPayload;
  v5 = -[W5PeerGenericRequestPayload init](&v20, "init");
  if (!v5)
  {
    v10 = 0;
    v6 = 0;
LABEL_10:

    v15 = sub_10008F56C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315650;
      v22 = "-[W5PeerGenericRequestPayload initWithRequest:]";
      v23 = 2080;
      v24 = "W5PeerGenericRequestPayload.m";
      v25 = 1024;
      v26 = 42;
      LODWORD(v17) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v16, 0, "[wifivelocity] %s (%s:%u) init error!", (const char *)&v21, v17, v18);
    }

    v5 = 0;
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("payload")));
  if (!v6)
  {
    v10 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestPayload __allowedClasses](v5, "__allowedClasses"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
  v19 = 0;
  v9 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v8, v6, &v19));
  v10 = v19;
  info = v5->_info;
  v5->_info = (NSDictionary *)v9;

  if (!v5->_info)
  {
    v12 = sub_10008F56C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315906;
      v22 = "-[W5PeerGenericRequestPayload initWithRequest:]";
      v23 = 2080;
      v24 = "W5PeerGenericRequestPayload.m";
      v25 = 1024;
      v26 = 34;
      v27 = 2114;
      v28 = v10;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) FAILED to unarchive generic request payload, return error (%{public}@)", &v21, 38);
    }

    goto LABEL_10;
  }
LABEL_8:

  return v5;
}

- (id)encode
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestPayload info](self, "info"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericRequestPayload info](self, "info"));
    v12 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12));
    v6 = v12;

    if (v4)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("payload"));
    }
    else
    {
      v8 = sub_10008F56C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = "-[W5PeerGenericRequestPayload encode]";
        v15 = 2080;
        v16 = "W5PeerGenericRequestPayload.m";
        v17 = 1024;
        v18 = 54;
        v19 = 2114;
        v20 = v6;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) FAILED to archive generic request payload, return error (%{public}@)", &v13, 38);
      }

      v4 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerGenericRequestPayload encode]"));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v10, 0));

    objc_exception_throw(v11);
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

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
