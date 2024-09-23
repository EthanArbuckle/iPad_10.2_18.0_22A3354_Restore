@implementation FMDPairingLockRegisterRequest

- (FMDPairingLockRegisterRequest)initWithAccount:(id)a3 registerRequestInfo:(id)a4
{
  id v6;
  id v7;
  FMDPairingLockRegisterRequest *v8;
  uint64_t v9;
  NSString *baseURL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDPairingLockRegisterRequest;
  v8 = -[FMDRequest initWithAccount:](&v12, "initWithAccount:", v6);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryPairingURL"));
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSString *)v9;

    objc_storeStrong((id *)&v8->_registerRequestInfo, a4);
  }

  return v8;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDPairingLockRegisterRequest;
  v2 = -[FMDRequest requestHeaders](&v4, "requestHeaders");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)requestUrl
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/type5/pairinglock/register"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  return v4;
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)FMDPairingLockRegisterRequest;
  v3 = -[FMDRequest requestBody](&v10, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterRequest registerRequestInfo](self, "registerRequestInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serialNumber"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("serialNumber"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockRegisterRequest registerRequestInfo](self, "registerRequestInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryType"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("accessoryType"), v8);

  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("specVersion"), CFSTR("1.0.0"));
  return v4;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (FMDPairingLockRegisterRequestInfo)registerRequestInfo
{
  return self->_registerRequestInfo;
}

- (void)setRegisterRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_registerRequestInfo, a3);
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_registerRequestInfo, 0);
}

@end
