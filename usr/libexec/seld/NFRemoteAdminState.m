@implementation NFRemoteAdminState

- (NFRemoteAdminState)initWithIdentifier:(id)a3 sourceURL:(id)a4 retryDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NFRemoteAdminState *v11;
  NSString *v12;
  NSString *serverIdentifier;
  NSDate *v14;
  NSDate *retryAfter;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NFRemoteAdminState;
  v11 = -[NFRemoteAdminState init](&v17, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    serverIdentifier = v11->_serverIdentifier;
    v11->_serverIdentifier = v12;

    objc_storeStrong((id *)&v11->_sourceUrl, a4);
    v14 = (NSDate *)objc_msgSend(v10, "copy");
    retryAfter = v11->_retryAfter;
    v11->_retryAfter = v14;

    v11->_retryCount = 0;
  }

  return v11;
}

- (void)save
{
  id v2;
  id v3;

  v2 = sub_100033D5C();
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  sub_10003617C(v3);

}

- (void)updateNextRetryInterval:(id)a3
{
  NFRemoteAdminState *v4;
  void *v5;
  id v6;
  NSDate *v7;
  NSDate *retryAfter;
  _QWORD *v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v9)
  {
    v4->_retryCount = v9[1];
    v5 = (void *)v9[2];
  }
  else
  {
    v5 = 0;
    v4->_retryCount = 0;
  }
  v6 = v5;
  v7 = (NSDate *)objc_msgSend(v6, "copy");
  retryAfter = v4->_retryAfter;
  v4->_retryAfter = v7;

  objc_sync_exit(v4);
}

- (void)refreshRetryInterval
{
  uint64_t v2;
  NSDate *retryAfter;
  NFRemoteAdminState *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_hasPendingConnection)
  {
    obj->_retryCount = 0;
    v2 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    retryAfter = obj->_retryAfter;
    obj->_retryAfter = (NSDate *)v2;

    obj->_hasPendingConnection = 0;
    -[NFRemoteAdminState save](obj, "save");
  }
  objc_sync_exit(obj);

}

- (void)setPendingImmediateRetry:(BOOL)a3
{
  NFRemoteAdminState *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_hasPendingConnection = a3;
  objc_sync_exit(obj);

}

- (BOOL)pendingImmediateRetry
{
  NFRemoteAdminState *v2;
  BOOL hasPendingConnection;

  v2 = self;
  objc_sync_enter(v2);
  hasPendingConnection = v2->_hasPendingConnection;
  objc_sync_exit(v2);

  return hasPendingConnection;
}

- (void)clearRetryInterval
{
  NSDate *retryAfter;
  NFRemoteAdminState *obj;

  obj = self;
  objc_sync_enter(obj);
  retryAfter = obj->_retryAfter;
  obj->_retryCount = 0;
  obj->_retryAfter = 0;

  objc_sync_exit(obj);
}

- (NFRemoteAdminStateRetryInterval)retryInterval
{
  NFRemoteAdminStateRetryInterval *v3;
  NFRemoteAdminState *v4;
  const char *v5;

  v3 = objc_alloc_init(NFRemoteAdminStateRetryInterval);
  v4 = self;
  objc_sync_enter(v4);
  if (v3)
  {
    v3->_delayValueIndex = v4->_retryCount;
    objc_setProperty_nonatomic_copy(v3, v5, v4->_retryAfter, 16);
  }
  objc_sync_exit(v4);

  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState serverIdentifier](self, "serverIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState retryInterval](self, "retryInterval"));
  v6 = (void *)v5;
  if (v5)
    v7 = *(void **)(v5 + 16);
  else
    v7 = 0;
  v8 = v7;
  v9 = "N";
  if (-[NFRemoteAdminState pendingImmediateRetry](self, "pendingImmediateRetry"))
    v10 = "Y";
  else
    v10 = "N";
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState unsentScriptResponse](self, "unsentScriptResponse"));
  if (objc_msgSend(v11, "count"))
    v9 = "Y";
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NFRemoteAdminState sourceUrl](self, "sourceUrl"));
  v13 = objc_msgSend(v3, "initWithFormat:", CFSTR("{ServerId: %@, retryInterval: %@, immediate: %s, unsent: %s, sourceURL: %@"), v4, v8, v10, v9, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFRemoteAdminState)initWithCoder:(id)a3
{
  id v4;
  NFRemoteAdminState *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *serverIdentifier;
  id v14;
  void *v15;
  uint64_t v16;
  NSDictionary *unsentScriptResponse;
  id v18;
  id v19;
  uint64_t v20;
  NSDate *retryAfter;
  id v22;
  uint64_t v23;
  NSString *sourceUrl;
  id v25;
  uint64_t v26;
  NSDictionary *httpHeaderInfo;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSDictionary *APNConnectionRequesterFirst;
  uint64_t v39;
  NSDictionary *APNConnectionRequesterLatest;
  void *v42;
  id v43;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)NFRemoteAdminState;
  v5 = -[NFRemoteAdminState init](&v44, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)NSSet);
    v7 = objc_opt_class(NSDictionary);
    v8 = objc_opt_class(NSArray);
    v9 = objc_opt_class(NSData);
    v10 = objc_opt_class(NSNumber);
    v43 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, objc_opt_class(NSString), 0);
    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("serverIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    serverIdentifier = v5->_serverIdentifier;
    v5->_serverIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("hasPendingConnection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v5->_hasPendingConnection = objc_msgSend(v15, "BOOLValue");
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v43, CFSTR("unsentScriptResponse")));
    unsentScriptResponse = v5->_unsentScriptResponse;
    v5->_unsentScriptResponse = (NSDictionary *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("retryCount"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v5->_retryCount = (unint64_t)objc_msgSend(v42, "unsignedIntegerValue");
    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("retryAfter"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    retryAfter = v5->_retryAfter;
    v5->_retryAfter = (NSDate *)v20;

    v22 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("sourceUrl"));
    v23 = objc_claimAutoreleasedReturnValue(v22);
    sourceUrl = v5->_sourceUrl;
    v5->_sourceUrl = (NSString *)v23;

    v25 = +[NFNSCheckedDecoder coder:decodeDictOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeDictOfClass:forKey:", v4, objc_opt_class(NSString), CFSTR("httpHeaderInfo"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    httpHeaderInfo = v5->_httpHeaderInfo;
    v5->_httpHeaderInfo = (NSDictionary *)v26;

    v28 = objc_alloc((Class)NSSet);
    v29 = objc_opt_class(NSDictionary);
    v30 = objc_opt_class(NSArray);
    v31 = objc_opt_class(NSString);
    v32 = objc_opt_class(NSNumber);
    v33 = objc_opt_class(NSData);
    v34 = objc_opt_class(NSDate);
    v35 = objc_opt_class(NSDateFormatter);
    v36 = objc_msgSend(v28, "initWithObjects:", v29, v30, v31, v32, v33, v34, v35, objc_opt_class(NSLocale), 0);
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("APNFirstRequester")));
    APNConnectionRequesterFirst = v5->_APNConnectionRequesterFirst;
    v5->_APNConnectionRequesterFirst = (NSDictionary *)v37;

    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("APNLastRequester")));
    APNConnectionRequesterLatest = v5->_APNConnectionRequesterLatest;
    v5->_APNConnectionRequesterLatest = (NSDictionary *)v39;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *serverIdentifier;
  void *v5;
  void *v6;
  id v7;

  serverIdentifier = self->_serverIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", serverIdentifier, CFSTR("serverIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_hasPendingConnection));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("hasPendingConnection"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_unsentScriptResponse, CFSTR("unsentScriptResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_retryCount));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("retryCount"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_retryAfter, CFSTR("retryAfter"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_sourceUrl, CFSTR("sourceUrl"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_httpHeaderInfo, CFSTR("httpHeaderInfo"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_APNConnectionRequesterFirst, CFSTR("APNFirstRequester"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_APNConnectionRequesterLatest, CFSTR("APNLastRequester"));

}

- (NSString)serverIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)unsentScriptResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUnsentScriptResponse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)sourceUrl
{
  return self->_sourceUrl;
}

- (void)setSourceUrl:(id)a3
{
  objc_storeStrong((id *)&self->_sourceUrl, a3);
}

- (NSDictionary)httpHeaderInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHttpHeaderInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSDictionary)APNConnectionRequesterFirst
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAPNConnectionRequesterFirst:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSDictionary)APNConnectionRequesterLatest
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAPNConnectionRequesterLatest:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSDictionary)initialClientRequestInfo
{
  return self->_initialClientRequestInfo;
}

- (void)setInitialClientRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_initialClientRequestInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialClientRequestInfo, 0);
  objc_storeStrong((id *)&self->_APNConnectionRequesterLatest, 0);
  objc_storeStrong((id *)&self->_APNConnectionRequesterFirst, 0);
  objc_storeStrong((id *)&self->_httpHeaderInfo, 0);
  objc_storeStrong((id *)&self->_sourceUrl, 0);
  objc_storeStrong((id *)&self->_unsentScriptResponse, 0);
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_retryAfter, 0);
}

@end
