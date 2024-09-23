@implementation W5PeerFileTransferResponsePayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerFileTransferResponsePayload)initWithRequest:(id)a3
{
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  W5PeerFileTransferResponsePayload *v7;
  NSNumber *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSData *publicKey;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSArray *files;
  uint64_t v22;
  NSError *error;
  NSError *v24;
  NSError *v25;
  uint64_t v26;
  NSObject *v27;
  W5PeerFileTransferResponsePayload *v28;
  uint64_t v30;
  const char *v31;
  int v32;
  id v33;
  objc_super v34;
  int v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  NSError *v42;

  v4 = (NSError *)a3;
  v5 = sub_10008F56C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 136315906;
    v36 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
    v37 = 2080;
    v38 = "W5PeerFileTransferResponsePayload.m";
    v39 = 1024;
    v40 = 30;
    v41 = 2114;
    v42 = v4;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Response Dictionary: %{public}@", &v35, 38);
  }

  v34.receiver = self;
  v34.super_class = (Class)W5PeerFileTransferResponsePayload;
  v7 = -[W5PeerFileTransferResponsePayload init](&v34, "init");
  if (v7
    && (v8 = (NSNumber *)-[NSError objectForKey:](v4, "objectForKey:", CFSTR("version")),
        (v7->_version = v8) != 0)
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", CFSTR("status")))) != 0)
  {
    v10 = v9;
    v7->_status = (int64_t)objc_msgSend(v9, "integerValue");
    v11 = objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", CFSTR("publicKey")));
    publicKey = v7->_publicKey;
    v7->_publicKey = (NSData *)v11;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", CFSTR("files")));
    if (v14)
    {
      v15 = objc_opt_class(NSArray, v13);
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v15, objc_opt_class(NSURL, v16), 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v33 = 0;
      v19 = objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v18, v14, &v33));
      v20 = v33;
      files = v7->_files;
      v7->_files = (NSArray *)v19;

    }
    else
    {
      v20 = 0;
    }
    v22 = objc_claimAutoreleasedReturnValue(-[NSError objectForKey:](v4, "objectForKey:", CFSTR("error")));
    error = v7->_error;
    v7->_error = (NSError *)v22;

    v24 = v7->_error;
    if (!v24)
    {
      v25 = 0;
      goto LABEL_14;
    }
    v25 = v24;
    v26 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 136315906;
      v36 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
      v37 = 2080;
      v38 = "W5PeerFileTransferResponsePayload.m";
      v39 = 1024;
      v40 = 56;
      v41 = 2114;
      v42 = v25;
      LODWORD(v31) = 38;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) initialization failed due to error=(%{public}@)", &v35, v31);
    }
  }
  else
  {

    v30 = sub_10008F56C();
    v27 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v35 = 136315650;
      v36 = "-[W5PeerFileTransferResponsePayload initWithRequest:]";
      v37 = 2080;
      v38 = "W5PeerFileTransferResponsePayload.m";
      v39 = 1024;
      v40 = 64;
      LODWORD(v31) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v27, 0, "[wifivelocity] %s (%s:%u) init error with request dictionary", (const char *)&v35, v31, v32);
    }
    v14 = 0;
    v20 = 0;
    v10 = 0;
    v25 = 0;
    v7 = 0;
  }

LABEL_14:
  v28 = v7;

  return v28;
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
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  id v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = sub_10008F56C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload version](self, "version"));
    v7 = -[W5PeerFileTransferResponsePayload status](self, "status");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload publicKey](self, "publicKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload error](self, "error"));
    v26 = 136316674;
    v27 = "-[W5PeerFileTransferResponsePayload encode]";
    v28 = 2080;
    v29 = "W5PeerFileTransferResponsePayload.m";
    v30 = 1024;
    v31 = 76;
    v32 = 2114;
    v33 = v6;
    v34 = 2048;
    v35 = v7;
    v36 = 2114;
    v37 = v8;
    v38 = 2114;
    v39 = v9;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v5, 0, "[wifivelocity] %s (%s:%u) version='%{public}@', status=%ld, publicKey='%{public}@', error='%{public}@'", &v26, 68);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload version](self, "version"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload version](self, "version"));
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("version"));

    if (-[W5PeerFileTransferResponsePayload status](self, "status"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[W5PeerFileTransferResponsePayload status](self, "status")));
      objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("status"));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload publicKey](self, "publicKey"));
      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload publicKey](self, "publicKey"));
        objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("publicKey"));

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload files](self, "files"));

      if (v10)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload files](self, "files"));
        v25 = 0;
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v25));
        v16 = v25;

        if (!v10 || v16)
        {
          v17 = sub_10008F56C();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v26 = 136315906;
            v27 = "-[W5PeerFileTransferResponsePayload encode]";
            v28 = 2080;
            v29 = "W5PeerFileTransferResponsePayload.m";
            v30 = 1024;
            v31 = 96;
            v32 = 2114;
            v33 = v16;
            LODWORD(v24) = 38;
            _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v18, 0, "[wifivelocity] %s (%s:%u) Failed to encode files with error='%{public}@'", &v26, v24);
          }

        }
        else
        {
          objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("files"));
        }
      }
      else
      {
        v16 = 0;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload error](self, "error"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferResponsePayload error](self, "error"));
        objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("error"));

      }
    }
    else
    {
      v16 = 0;
      v10 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  if (!objc_msgSend(v3, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerFileTransferResponsePayload encode]"));
    v23 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v22, 0));

    objc_exception_throw(v23);
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

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (NSArray)files
{
  return self->_files;
}

- (void)setFiles:(id)a3
{
  objc_storeStrong((id *)&self->_files, a3);
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
  objc_storeStrong((id *)&self->_files, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

@end
