@implementation MSDDemoUnitServer

- (MSDDemoUnitServer)init
{
  MSDDemoUnitServer *v2;
  MSDFMHSession *v3;
  MSDDemoUnitServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDDemoUnitServer;
  v2 = -[MSDDemoUnitServer init](&v6, "init");
  if (v2)
  {
    v3 = -[MSDSession initWithCellularAccess:]([MSDFMHSession alloc], "initWithCellularAccess:", 1);
    -[MSDServer setSession:](v2, "setSession:", v3);

    -[MSDDemoUnitServer setHmacKey:](v2, "setHmacKey:", CFSTR("5ff0cc558c0b18b1563e6f53591cf2ee7d18f0cc66c1b76696885f10b42b9b2df1"));
    v4 = v2;
  }

  return v2;
}

- (void)findMyHub:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "logicSync");
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getUrl"));
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, v5, 1, 3);

}

- (void)checkIn:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getUrl"));
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, v5, 1, 3);

}

- (void)markAsNotDemo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getUrl"));
  -[MSDServer sendRequest:toEndpoint:postData:maxRetry:](self, "sendRequest:toEndpoint:postData:maxRetry:", v4, v5, 1, 3);

}

- (void)storeSearch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getUrl"));
  -[MSDServer sendQueryForRequest:toPath:maxRetry:](self, "sendQueryForRequest:toPath:maxRetry:", v4, v5, 3);

}

- (id)taskInfoFromCommandRequest:(id)a3
{
  id v4;
  MSDFMHSessionTaskInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MSDFMHSessionTaskInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "server"));
  -[MSDHubSessionTaskInfo setServer:](v5, "setServer:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "port"));
  -[MSDHubSessionTaskInfo setPort:](v5, "setPort:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDDemoUnitServer hmacKey](self, "hmacKey"));
  -[MSDHubSessionTaskInfo setHmacKey:](v5, "setHmacKey:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceUDID"));
  -[MSDHubSessionTaskInfo setDeviceUDID:](v5, "setDeviceUDID:", v9);

  -[MSDFMHSessionTaskInfo setUseBAAAuthentication:](v5, "setUseBAAAuthentication:", objc_msgSend(v4, "useBAAAuthentication"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "urlOverride"));

  -[MSDFMHSessionTaskInfo setFmhURLOverride:](v5, "setFmhURLOverride:", v10);
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
