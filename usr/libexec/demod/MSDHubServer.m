@implementation MSDHubServer

- (MSDHubServer)initWithCellularAccess:(BOOL)a3
{
  _BOOL8 v3;
  MSDHubServer *v4;
  MSDHubSession *v5;
  MSDHubServer *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSDHubServer;
  v4 = -[MSDHubServer init](&v8, "init");
  if (v4)
  {
    v5 = -[MSDSession initWithCellularAccess:]([MSDHubSession alloc], "initWithCellularAccess:", v3);
    -[MSDServer setSession:](v4, "setSession:", v5);

    -[MSDHubServer setHmacKey:](v4, "setHmacKey:", CFSTR("hLw5ZITZVjvdLVwAaitNnOsFhl3rDVAtRmKXQuYfxGSJ0n65eotJ569TOz97xmD3s6"));
    v6 = v4;
  }

  return v4;
}

- (void)closeConnection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
  objc_msgSend(v2, "invalidate");

}

- (void)enroll:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer enroll:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDHubServer setHmacKey:](self, "setHmacKey:", CFSTR("hLw5ZITZVjvdLVwAaitNnOsFhl3rDVAtRmKXQuYfxGSJ0n65eotJ569TOz97xmD3s6"));
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/Register"), 1, 2);

}

- (void)isEnrolled:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer isEnrolled:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/AuthCheck"), 0, 2);
}

- (void)unenroll:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer unenroll:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/Unregister"), 1, 2);
}

- (void)downloadManifest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer downloadManifest:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendQueryForRequest:toPath:maxRetry:](self, "sendQueryForRequest:toPath:maxRetry:", v4, CFSTR("/GetManifest"), 2);
}

- (void)downloadIPACachingHub:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer downloadIPACachingHub:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendQueryForRequest:toPath:maxRetry:](self, "sendQueryForRequest:toPath:maxRetry:", v4, CFSTR("/GetIPA"), 2);
}

- (void)downloadIPAPreCachingHub:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer downloadIPAPreCachingHub:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/DownloadIPA"), 1, 3);
}

- (void)getFileDownloadCredential:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer getFileDownloadCredential:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendQueryForRequest:toPath:maxRetry:](self, "sendQueryForRequest:toPath:maxRetry:", v4, CFSTR("/GetFileDownloadCredentials"), 3);
}

- (void)getAccountSettings:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer getAccountSettings:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/GetAccountSettings"), 1, 2);
}

- (void)reportError:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer reportError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/Error"), 1, 3);
}

- (void)reportDone:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer reportDone:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/Done"), 1, 3);
}

- (void)ping:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer ping:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/Ping"), 1, 2);
}

- (void)ack:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHubServer ack:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v7, 0xCu);
  }

  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, CFSTR("/Ack"), 1, 2);
}

- (void)handleKVStore:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[MSDHubServer handleKVStore:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is called", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getEndpoint"));
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, v7, objc_msgSend(v4, "isPost"), 2);

}

- (id)taskInfoFromCommandRequest:(id)a3
{
  id v4;
  MSDHubSessionTaskInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MSDHubSessionTaskInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "server"));
  -[MSDHubSessionTaskInfo setServer:](v5, "setServer:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "port"));
  -[MSDHubSessionTaskInfo setPort:](v5, "setPort:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "savePath"));
  -[MSDSessionTaskInfo setSavePath:](v5, "setSavePath:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHubServer hmacKey](self, "hmacKey"));
  -[MSDHubSessionTaskInfo setHmacKey:](v5, "setHmacKey:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceUDID"));
  -[MSDHubSessionTaskInfo setDeviceUDID:](v5, "setDeviceUDID:", v10);

  return v5;
}

- (NSString)hmacKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHmacKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hmacKey, 0);
}

@end
