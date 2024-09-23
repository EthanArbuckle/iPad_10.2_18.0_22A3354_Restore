@implementation W5PeerGenericResponsePayload

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
  _QWORD v11[9];

  v11[0] = objc_opt_class(NSArray, a2);
  v11[1] = objc_opt_class(NSDictionary, v2);
  v11[2] = objc_opt_class(NSNumber, v3);
  v11[3] = objc_opt_class(NSString, v4);
  v11[4] = objc_opt_class(NSData, v5);
  v11[5] = objc_opt_class(NSDate, v6);
  v11[6] = objc_opt_class(NSError, v7);
  v11[7] = objc_opt_class(W5Event, v8);
  v11[8] = objc_opt_class(W5Peer, v9);
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 9));
}

- (W5PeerGenericResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerGenericResponsePayload *v5;
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
  v20.super_class = (Class)W5PeerGenericResponsePayload;
  v5 = -[W5PeerGenericResponsePayload init](&v20, "init");
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
      v22 = "-[W5PeerGenericResponsePayload initWithRequest:]";
      v23 = 2080;
      v24 = "W5PeerGenericResponsePayload.m";
      v25 = 1024;
      v26 = 43;
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericResponsePayload __allowedClasses](v5, "__allowedClasses"));
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
      v22 = "-[W5PeerGenericResponsePayload initWithRequest:]";
      v23 = 2080;
      v24 = "W5PeerGenericResponsePayload.m";
      v25 = 1024;
      v26 = 35;
      v27 = 2114;
      v28 = v10;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v13, 0, "[wifivelocity] %s (%s:%u) FAILED to unarchive generic response payload, return error (%{public}@)", &v21, 38);
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
  NSObject *v6;
  id v7;
  uint64_t v9;
  int v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericResponsePayload info](self, "info"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerGenericResponsePayload info](self, "info"));
    v11 = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v11));
    v7 = v11;

    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("payload"));
    }
    else
    {
      v9 = sub_10008F56C();
      v6 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = "-[W5PeerGenericResponsePayload encode]";
        v14 = 2080;
        v15 = "W5PeerGenericResponsePayload.m";
        v16 = 1024;
        v17 = 55;
        v18 = 2114;
        v19 = v7;
        v10 = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) FAILED to archive generic response payload, return error (%{public}@)", &v12, v10);
      }
    }

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

- (NSDictionary)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
