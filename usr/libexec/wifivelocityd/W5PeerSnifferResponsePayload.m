@implementation W5PeerSnifferResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerSnifferResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerSnifferResponsePayload *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSDictionary *filePaths;
  uint64_t v20;
  NSObject *p_super;
  W5PeerSnifferResponsePayload *v22;
  uint64_t v24;
  id v25;
  objc_super v26;
  int v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)W5PeerSnifferResponsePayload;
  v5 = -[W5PeerSnifferResponsePayload init](&v26, "init");
  if (v5
    && (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) != 0)
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("status")))) != 0)
  {
    v8 = v7;
    v5->_status = (int64_t)objc_msgSend(v7, "integerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("paths")));
    if (v10)
    {
      v11 = objc_opt_class(NSDictionary, v9);
      v13 = objc_opt_class(W5WiFiChannel, v12);
      v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v13, objc_opt_class(NSURL, v14), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v25 = 0;
      v17 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v16, v10, &v25));
      v18 = v25;
      filePaths = v5->_filePaths;
      v5->_filePaths = (NSDictionary *)v17;

    }
    else
    {
      v18 = 0;
    }
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("uuid")));
    p_super = &v5->_uuid->super;
    v5->_uuid = (NSUUID *)v20;
  }
  else
  {

    v24 = sub_10008F56C();
    p_super = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 136315906;
      v28 = "-[W5PeerSnifferResponsePayload initWithRequest:]";
      v29 = 2080;
      v30 = "W5PeerSnifferResponsePayload.m";
      v31 = 1024;
      v32 = 55;
      v33 = 2114;
      v34 = 0;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) Init Error (error='%{public}@'", &v27, 38);
    }
    v10 = 0;
    v18 = 0;
    v8 = 0;
    v5 = 0;
  }

  v22 = v5;
  return v22;
}

- (id)encode
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload version](self, "version"));

  if (!v4)
    goto LABEL_16;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload version](self, "version"));
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

  if (!-[W5PeerSnifferResponsePayload status](self, "status"))
  {
    v4 = 0;
LABEL_16:
    v8 = 0;
    goto LABEL_13;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerSnifferResponsePayload status](self, "status")));
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("status"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload filePaths](self, "filePaths"));
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload filePaths](self, "filePaths"));
    v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v16));
    v8 = v16;

    if (!v4 || v8)
    {
      v9 = sub_10008F56C();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = "-[W5PeerSnifferResponsePayload encode]";
        v19 = 2080;
        v20 = "W5PeerSnifferResponsePayload.m";
        v21 = 1024;
        v22 = 82;
        v23 = 2114;
        v24 = v8;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v10, 0, "[wifivelocity] %s (%s:%u) Failed to encode channels with error='%{public}@'", &v17, 38);
      }

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("paths"));
    }
  }
  else
  {
    v8 = 0;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload uuid](self, "uuid"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerSnifferResponsePayload uuid](self, "uuid"));
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("uuid"));

  }
LABEL_13:
  if (!objc_msgSend(v3, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerSnifferResponsePayload encode]"));
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

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSDictionary)filePaths
{
  return self->_filePaths;
}

- (void)setFilePaths:(id)a3
{
  objc_storeStrong((id *)&self->_filePaths, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_filePaths, 0);
}

@end
