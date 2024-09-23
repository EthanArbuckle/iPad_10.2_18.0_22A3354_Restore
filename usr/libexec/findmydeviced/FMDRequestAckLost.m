@implementation FMDRequestAckLost

- (FMDRequestAckLost)initWithProvider:(id)a3 lostCommand:(id)a4 cmdStatusCode:(int64_t)a5 locationServicesStateChanged:(BOOL)a6 ackURL:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  FMDRequestAckLost *v16;
  objc_super v18;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "account"));
  v18.receiver = self;
  v18.super_class = (Class)FMDRequestAckLost;
  v16 = -[FMDRequest initWithAccount:](&v18, "initWithAccount:", v15);

  if (v16)
  {
    -[FMDRequestAckLost setProvider:](v16, "setProvider:", v12);
    -[FMDRequestAckLost setLostCommand:](v16, "setLostCommand:", v13);
    -[FMDRequestAckLost setAckURL:](v16, "setAckURL:", v14);
    -[FMDRequestAckLost setCmdStatusCode:](v16, "setCmdStatusCode:", a5);
    -[FMDRequestAckLost setLocationServicesStateChanged:](v16, "setLocationServicesStateChanged:", v8);
  }

  return v16;
}

- (id)requestUrl
{
  return -[FMDRequestAckLost ackURL](self, "ackURL");
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
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FMDRequestAckLost;
  v3 = -[FMDRequest requestBody](&v20, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLost provider](self, "provider"));
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
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDRequestAckLost cmdStatusCode](self, "cmdStatusCode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("statusCode"));

  if (-[FMDRequestAckLost locationServicesStateChanged](self, "locationServicesStateChanged"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FMDRequestAckLost locationServicesStateChanged](self, "locationServicesStateChanged")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("locationsServicesChanged"));

  }
  v13 = -[FMDRequestAckLost cmdStatusCode](self, "cmdStatusCode");
  if (v13 == qword_100304970)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedDescriptionOfCurrentPasscodeConstraints"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("errorMsg"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDSystemConfig sharedInstance](FMDSystemConfig, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentPasscodeConstraintStr"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("passcodeConstraint"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLost lostCommand](self, "lostCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("cmdContext"));

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLost lostCommand](self, "lostCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lostCommand"));
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

- (NSDictionary)lostCommand
{
  return self->_lostCommand;
}

- (void)setLostCommand:(id)a3
{
  objc_storeStrong((id *)&self->_lostCommand, a3);
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

- (BOOL)locationServicesStateChanged
{
  return self->_locationServicesStateChanged;
}

- (void)setLocationServicesStateChanged:(BOOL)a3
{
  self->_locationServicesStateChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_lostCommand, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end
