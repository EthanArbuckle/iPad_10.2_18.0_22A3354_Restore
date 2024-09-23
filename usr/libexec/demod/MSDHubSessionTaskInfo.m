@implementation MSDHubSessionTaskInfo

- (BOOL)isValid
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MSDHubSessionTaskInfo;
  if (!-[MSDSessionTaskInfo isValid](&v7, "isValid"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo hmacKey](self, "hmacKey"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getRequestForTimeout:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));

  if (!v5)
  {
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_1000BDD20();

    v10 = 0;
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo server](self, "server"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo port](self, "port"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo endpoint](self, "endpoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://%@:%@%@"), v6, v7, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));

  v11 = objc_msgSend(objc_alloc((Class)NSMutableURLRequest), "initWithURL:cachePolicy:timeoutInterval:", v10, 1, a3);
  -[MSDSessionTaskInfo setRequest:](self, "setRequest:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo postData](self, "postData"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("POST"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
    objc_msgSend(v14, "setValue:forHTTPHeaderField:", CFSTR("application/json"), CFSTR("Content-Type"));
  }
  else
  {
    objc_msgSend(v13, "setHTTPMethod:", CFSTR("GET"));
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("13"), CFSTR("X-Protocol-Version"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));
  if (!v16)
  {
    v23 = sub_1000604F0();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_1000BDD20();

    goto LABEL_15;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo deviceUDID](self, "deviceUDID"));
  objc_msgSend(v17, "setValue:forHTTPHeaderField:", v18, CFSTR("X-Apple-OTA-UDID"));

  if (!-[MSDHubSessionTaskInfo addAuthHeader](self, "addAuthHeader"))
  {
LABEL_15:
    v19 = 0;
    goto LABEL_8;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
LABEL_8:

  return v19;
}

- (BOOL)addAuthHeader
{
  void *v3;
  AluminiumAuthenticator *v4;
  void *v5;
  AluminiumAuthenticator *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  BOOL v12;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo hmacKey](self, "hmacKey"));

  if (!v3)
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000BDD4C();
    goto LABEL_10;
  }
  v4 = [AluminiumAuthenticator alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubSessionTaskInfo hmacKey](self, "hmacKey"));
  v6 = -[AluminiumAuthenticator initWithASCIIEncodedKey:](v4, "initWithASCIIEncodedKey:", v5);

  if (!v6)
  {
    v16 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000BDD78();
LABEL_10:
    v6 = 0;
    v11 = 0;
    v7 = 0;
LABEL_13:

    v12 = 0;
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("X-Apple-OTA-UDID"), CFSTR("X-Apple-HMAC-Sent-Timestamp"), CFSTR("Host"), 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo request](self, "request"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDSessionTaskInfo postData](self, "postData"));
  v18 = 0;
  v10 = -[AluminiumAuthenticator addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:](v6, "addAuthenticationHeadersToRequest:includedHeaders:body:algorithm:error:", v8, v7, v9, 0, &v18);
  v11 = v18;

  if ((v10 & 1) == 0)
  {
    v17 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1000BDDA4(v11, v15);
    goto LABEL_13;
  }
  v12 = 1;
LABEL_5:

  return v12;
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)port
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)endpoint
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEndpoint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)hmacKey
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHmacKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_hmacKey, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
