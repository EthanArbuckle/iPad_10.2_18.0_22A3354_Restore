@implementation FMDRequestAckWipe

- (FMDRequestAckWipe)initWithProvider:(id)a3 wipeCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  FMDRequestAckWipe *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckWipe;
  v14 = -[FMDRequest initWithAccount:](&v16, "initWithAccount:", v13);

  if (v14)
  {
    -[FMDRequestAckWipe setProvider:](v14, "setProvider:", v10);
    -[FMDRequestAckWipe setWipeCommand:](v14, "setWipeCommand:", v11);
    -[FMDRequestAckWipe setAckURL:](v14, "setAckURL:", v12);
    -[FMDRequestAckWipe setCmdStatusCode:](v14, "setCmdStatusCode:", a5);
  }

  return v14;
}

- (id)requestUrl
{
  return -[FMDRequestAckWipe ackURL](self, "ackURL");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  FMDActingRequestDecorator *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckWipe;
  v3 = -[FMDRequest requestBody](&v14, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckWipe provider](self, "provider"));
  if (v5)
  {
    v6 = objc_alloc_init(FMDActingRequestDecorator);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDActingRequestDecorator standardDeviceContext](v6, "standardDeviceContext"));

    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceContext"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ServerDeviceInfo sharedInstance](ServerDeviceInfo, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "deviceInfoForAccount:", v9));
    objc_msgSend(v4, "fm_safelyMapKey:toObject:", CFSTR("deviceInfo"), v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDRequestAckWipe cmdStatusCode](self, "cmdStatusCode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("statusCode"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckWipe wipeCommand](self, "wipeCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("cmdContext"));

  return v4;
}

- (BOOL)canReplace:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v9 = objc_opt_class(self, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckWipe wipeCommand](self, "wipeCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "wipeCommand"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("id")));
      v14 = objc_msgSend(v11, "isEqualToString:", v13);

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)cmdStatusCode
{
  return self->_cmdStatusCode;
}

- (void)setCmdStatusCode:(int64_t)a3
{
  self->_cmdStatusCode = a3;
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSDictionary)wipeCommand
{
  return self->_wipeCommand;
}

- (void)setWipeCommand:(id)a3
{
  objc_storeStrong((id *)&self->_wipeCommand, a3);
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
  objc_storeStrong((id *)&self->_ackURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_wipeCommand, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
