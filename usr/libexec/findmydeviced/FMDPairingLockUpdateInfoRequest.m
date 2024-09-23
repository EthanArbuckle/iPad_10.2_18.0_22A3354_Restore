@implementation FMDPairingLockUpdateInfoRequest

- (FMDPairingLockUpdateInfoRequest)initWithAccount:(id)a3 updateRequestInfo:(id)a4
{
  id v6;
  id v7;
  FMDPairingLockUpdateInfoRequest *v8;
  uint64_t v9;
  NSString *baseURL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FMDPairingLockUpdateInfoRequest;
  v8 = -[FMDRequest initWithAccount:](&v12, "initWithAccount:", v6);
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryPairingURL"));
    baseURL = v8->_baseURL;
    v8->_baseURL = (NSString *)v9;

    objc_storeStrong((id *)&v8->_updateRequestInfo, a4);
  }

  return v8;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDPairingLockUpdateInfoRequest;
  v2 = -[FMDRequest requestHeaders](&v4, "requestHeaders");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)requestUrl
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/type5/pairinglock/updatePairingInfo"), v2));

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
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FMDPairingLockUpdateInfoRequest;
  v3 = -[FMDRequest requestBody](&v14, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoRequest updateRequestInfo](self, "updateRequestInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingCheckToken"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("pairingCheckToken"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoRequest updateRequestInfo](self, "updateRequestInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lostModePubKey"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("lostModePubKey"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoRequest updateRequestInfo](self, "updateRequestInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userPrivateKey"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("userPrivateKey"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingLockUpdateInfoRequest updateRequestInfo](self, "updateRequestInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "timeStamp"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("timestamp"), v12);

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

- (FMDPairingLockUpdateRequestInfo)updateRequestInfo
{
  return self->_updateRequestInfo;
}

- (void)setUpdateRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_updateRequestInfo, a3);
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
  objc_storeStrong((id *)&self->_updateRequestInfo, 0);
}

@end
