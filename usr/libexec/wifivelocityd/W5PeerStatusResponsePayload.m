@implementation W5PeerStatusResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerStatusResponsePayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerStatusResponsePayload *v5;
  NSNumber *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  id v14;
  W5Status *peerStatus;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSSet *v20;
  void *v21;
  uint64_t v22;
  id v23;
  W5Status *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v29;
  id v30;
  id v31;
  objc_super v32;
  int v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)W5PeerStatusResponsePayload;
  v5 = -[W5PeerStatusResponsePayload init](&v32, "init");
  if (v5
    && (v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version")),
        (v5->_version = v6) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("status")));
    v8 = v7;
    if (v7)
      v5->_status = (int64_t)objc_msgSend(v7, "integerValue");
    v29 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("peerStatus")));
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Status, v10), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v31 = 0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v12, v9, &v31));
    v14 = v31;
    peerStatus = v5->_peerStatus;
    v5->_peerStatus = (W5Status *)v13;

    v16 = v5->_peerStatus != 0;
  }
  else
  {
    v29 = 0;
    v14 = 0;
    v9 = 0;
    v16 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_1000E3A08));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", &off_1000E3A08));

    v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(W5Status, v19), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v30 = v14;
    v22 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v21, v18, &v30));
    v23 = v30;

    v24 = v5->_peerStatus;
    v5->_peerStatus = (W5Status *)v22;

    if (v5->_peerStatus)
    {
      v5->_version = (NSNumber *)&off_1000E3A08;
      v5->_status = 1;
      v25 = v29;
      goto LABEL_14;
    }
  }
  else
  {
    v23 = v14;
    v18 = v9;
  }
  v25 = v29;
  if (!v16)
  {

    v26 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 136315906;
      v34 = "-[W5PeerStatusResponsePayload initWithRequest:]";
      v35 = 2080;
      v36 = "W5PeerStatusResponsePayload.m";
      v37 = 1024;
      v38 = 66;
      v39 = 2114;
      v40 = v23;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) init error (error='%{public}@'", &v33, 38);
    }

    v5 = 0;
  }
LABEL_14:

  return v5;
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
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  void *v32;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload version](self, "version"));
    v7 = -[W5PeerStatusResponsePayload status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload peerStatus](self, "peerStatus"));
    v21 = 136316418;
    v22 = "-[W5PeerStatusResponsePayload encode]";
    v23 = 2080;
    v24 = "W5PeerStatusResponsePayload.m";
    v25 = 1024;
    v26 = 77;
    v27 = 2114;
    v28 = v6;
    v29 = 2048;
    v30 = v7;
    v31 = 2114;
    v32 = v8;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) version='%{public}@', status=%ld, status='%{public}@'", &v21, 58);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload version](self, "version"));

  if (!v9)
    goto LABEL_15;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload version](self, "version"));
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("version"));

  if (!-[W5PeerStatusResponsePayload status](self, "status"))
  {
    v9 = 0;
    goto LABEL_15;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerStatusResponsePayload status](self, "status")));
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("status"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload peerStatus](self, "peerStatus"));
  if (!v9)
  {
LABEL_15:
    v13 = 0;
    goto LABEL_12;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerStatusResponsePayload peerStatus](self, "peerStatus"));
  v20 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v20));
  v13 = v20;

  if (!v9 || v13)
  {
    v14 = sub_10008F56C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315906;
      v22 = "-[W5PeerStatusResponsePayload encode]";
      v23 = 2080;
      v24 = "W5PeerStatusResponsePayload.m";
      v25 = 1024;
      v26 = 94;
      v27 = 2114;
      v28 = v13;
      LODWORD(v19) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) failed to encode status with error='%{public}@'", &v21, v19);
    }

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("peerStatus"));
    objc_msgSend(v3, "setObject:forKey:", v9, self->_version);
  }
LABEL_12:
  if (!objc_msgSend(v3, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerStatusResponsePayload encode]"));
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v17, 0));

    objc_exception_throw(v18);
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

- (W5Status)peerStatus
{
  return self->_peerStatus;
}

- (void)setPeerStatus:(id)a3
{
  objc_storeStrong((id *)&self->_peerStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerStatus, 0);
}

@end
