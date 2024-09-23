@implementation FMDPairingCheckCommandRequest

- (FMDPairingCheckCommandRequest)initWithAccount:(id)a3 pairingCheckRequestInfo:(id)a4
{
  id v6;
  id v7;
  FMDPairingCheckCommandRequest *v8;
  uint64_t v9;
  NSString *baseURL;
  uint64_t v11;
  NSString *v12;
  __CFString *v14;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)FMDPairingCheckCommandRequest;
  v8 = -[FMDRequest initWithAccount:](&v15, "initWithAccount:", 0);
  if (v8)
  {
    if (v6)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryPairingURL"));
      baseURL = v8->_baseURL;
      v8->_baseURL = (NSString *)v9;
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", CFSTR("pairingURL"), kFMDNotBackedUpPrefDomain));
      v12 = v8->_baseURL;
      v8->_baseURL = (NSString *)v11;

      if (v8->_baseURL)
        goto LABEL_6;
      v14 = CFSTR("https://gateway.icloud.com/fmadminws");
      baseURL = v8->_baseURL;
      v8->_baseURL = &v14->isa;
    }

LABEL_6:
    objc_storeStrong((id *)&v8->_pairingCheckRequestInfo, a4);
  }

  return v8;
}

- (id)requestHeaders
{
  NSMutableDictionary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FMDPairingCheckCommandRequest;
  v2 = -[FMDRequest requestHeaders](&v4, "requestHeaders");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)requestUrl
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandRequest baseURL](self, "baseURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/type5/pairingCheckCommand"), v2));

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
  v14.super_class = (Class)FMDPairingCheckCommandRequest;
  v3 = -[FMDRequest requestBody](&v14, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandRequest pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pairingCheckToken"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("pairingCheckToken"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandRequest pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "authNonce"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("authNonce"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandRequest pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accessoryType"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("accessoryType"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDPairingCheckCommandRequest pairingCheckRequestInfo](self, "pairingCheckRequestInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "eraseKeyType"));
  objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("eraseKeyType"), v12);

  return v4;
}

- (unint64_t)type
{
  return 2;
}

- (BOOL)canReplace:(id)a3
{
  return 0;
}

- (FMDPairingCheckCommandRequestInfo)pairingCheckRequestInfo
{
  return self->_pairingCheckRequestInfo;
}

- (void)setPairingCheckRequestInfo:(id)a3
{
  objc_storeStrong((id *)&self->_pairingCheckRequestInfo, a3);
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
  objc_storeStrong((id *)&self->_pairingCheckRequestInfo, 0);
}

@end
