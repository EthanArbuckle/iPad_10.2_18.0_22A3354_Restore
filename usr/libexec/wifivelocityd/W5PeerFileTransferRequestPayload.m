@implementation W5PeerFileTransferRequestPayload

+ (id)payloadFromDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v5)), "initWithRequest:", v4);

  return v6;
}

- (W5PeerFileTransferRequestPayload)initWithRequest:(id)a3
{
  id v4;
  W5PeerFileTransferRequestPayload *v5;
  NSNumber *v6;
  id v7;
  void *v8;
  NSURL *v9;
  NSURL *remotePath;
  void *v11;
  uint64_t v12;
  NSSet *v13;
  void *v14;
  void *v15;
  id v16;
  int64_t type;
  uint64_t v18;
  NSString *targetID;
  uint64_t v20;
  NSObject *p_super;
  uint64_t v23;
  const char *v24;
  int v25;
  id v26;
  objc_super v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)W5PeerFileTransferRequestPayload;
  v5 = -[W5PeerFileTransferRequestPayload init](&v27, "init");
  if (!v5)
    goto LABEL_11;
  v6 = (NSNumber *)objc_msgSend(v4, "objectForKey:", CFSTR("version"));
  v5->_version = v6;
  if (!v6
    || (v7 = objc_alloc((Class)NSURL),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("url"))),
        v9 = (NSURL *)objc_msgSend(v7, "initWithString:", v8),
        remotePath = v5->_remotePath,
        v5->_remotePath = v9,
        remotePath,
        v8,
        !v5->_remotePath))
  {
LABEL_11:
    v16 = 0;
    v11 = 0;
    goto LABEL_12;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("type")));
  v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(NSNumber, v12), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v26 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v14, v11, &v26));
  v16 = v26;
  v5->_type = (int64_t)objc_msgSend(v15, "integerValue");

  type = v5->_type;
  if (type == 1)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("targetID")));
    targetID = v5->_targetID;
    v5->_targetID = (NSString *)v18;

    if (v5->_targetID)
    {
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("publicKey")));
      p_super = &v5->_publicKey->super;
      v5->_publicKey = (NSData *)v20;
LABEL_9:

      goto LABEL_10;
    }
LABEL_12:

    v23 = sub_10008F56C();
    p_super = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 136315650;
      v29 = "-[W5PeerFileTransferRequestPayload initWithRequest:]";
      v30 = 2080;
      v31 = "W5PeerFileTransferRequestPayload.m";
      v32 = 1024;
      v33 = 53;
      LODWORD(v24) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, p_super, 0, "[wifivelocity] %s (%s:%u) init error some objects were not found in request", (const char *)&v28, v24, v25);
    }
    v5 = 0;
    goto LABEL_9;
  }
  if (!type)
    goto LABEL_12;
LABEL_10:

  return v5;
}

- (id)encode
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v17;
  id v18;
  int v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload version](self, "version"));

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload version](self, "version")),
        objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version")),
        v5,
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload remotePath](self, "remotePath")),
        v4,
        v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload remotePath](self, "remotePath"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("url"));

    if (-[W5PeerFileTransferRequestPayload type](self, "type"))
    {
      v8 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", -[W5PeerFileTransferRequestPayload type](self, "type"));
      v20 = 0;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v20));
      v9 = v20;

      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));
      if ((id)-[W5PeerFileTransferRequestPayload type](self, "type") == (id)1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload targetID](self, "targetID"));

        if (!v10)
          goto LABEL_12;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload targetID](self, "targetID"));
        objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("targetID"));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload publicKey](self, "publicKey"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[W5PeerFileTransferRequestPayload publicKey](self, "publicKey"));
        objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("publicKey"));

      }
      v14 = sub_10008F56C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315906;
        v22 = "-[W5PeerFileTransferRequestPayload encode]";
        v23 = 2080;
        v24 = "W5PeerFileTransferRequestPayload.m";
        v25 = 1024;
        v26 = 85;
        v27 = 2114;
        v28 = v3;
        v19 = 38;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Payload: %{public}@", &v21, v19);
      }

    }
    else
    {
      v9 = 0;
      v4 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_12:
  if (!objc_msgSend(v3, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: empty payload"), "-[W5PeerFileTransferRequestPayload encode]"));
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

- (NSString)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(id)a3
{
  objc_storeStrong((id *)&self->_targetID, a3);
}

- (NSURL)remotePath
{
  return self->_remotePath;
}

- (void)setRemotePath:(id)a3
{
  objc_storeStrong((id *)&self->_remotePath, a3);
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_storeStrong((id *)&self->_publicKey, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_remotePath, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
}

@end
