@implementation FMDRequestAckLock

- (FMDRequestAckLock)initWithProvider:(id)a3 lockCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  FMDRequestAckLock *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckLock;
  v14 = -[FMDRequest initWithAccount:](&v16, "initWithAccount:", v13);

  if (v14)
  {
    -[FMDRequestAckLock setProvider:](v14, "setProvider:", v10);
    -[FMDRequestAckLock setLockCommand:](v14, "setLockCommand:", v11);
    -[FMDRequestAckLock setAckURL:](v14, "setAckURL:", v12);
    -[FMDRequestAckLock setCmdStatusCode:](v14, "setCmdStatusCode:", a5);
  }

  return v14;
}

- (id)requestUrl
{
  return -[FMDRequestAckLock ackURL](self, "ackURL");
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
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)FMDRequestAckLock;
  v3 = -[FMDRequest requestBody](&v19, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLock provider](self, "provider"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDRequestAckLock cmdStatusCode](self, "cmdStatusCode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("statusCode"));

  v12 = -[FMDRequestAckLock cmdStatusCode](self, "cmdStatusCode");
  if (v12 == qword_100304970)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescriptionOfCurrentPasscodeConstraints"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("errorMsg"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentPasscodeConstraintStr"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("passcodeConstraint"));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLock lockCommand](self, "lockCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("cmdContext"));

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLock lockCommand](self, "lockCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lockCommand"));
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

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSDictionary)lockCommand
{
  return self->_lockCommand;
}

- (void)setLockCommand:(id)a3
{
  objc_storeStrong((id *)&self->_lockCommand, a3);
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
  objc_storeStrong((id *)&self->_ackURL, a3);
}

- (int64_t)cmdStatusCode
{
  return self->_cmdStatusCode;
}

- (void)setCmdStatusCode:(int64_t)a3
{
  self->_cmdStatusCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_lockCommand, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
