@implementation FMDRequestAckDataUpdate

- (FMDRequestAckDataUpdate)initWithAccount:(id)a3 dataUpdateCommand:(id)a4 ackURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDRequestAckDataUpdate *v11;
  FMDRequestAckDataUpdate *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckDataUpdate;
  v11 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v8);
  v12 = v11;
  if (v11)
  {
    -[FMDRequestAckDataUpdate setAccount:](v11, "setAccount:", v8);
    -[FMDRequestAckDataUpdate setDataUpdateCommand:](v12, "setDataUpdateCommand:", v9);
    -[FMDRequestAckDataUpdate setAckURL:](v12, "setAckURL:", v10);
  }

  return v12;
}

- (id)requestUrl
{
  return -[FMDRequestAckDataUpdate ackURL](self, "ackURL");
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FMDRequestAckDataUpdate;
  v3 = -[FMDRequest requestBody](&v13, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDServiceProvider activeServiceProvider](FMDServiceProvider, "activeServiceProvider"));
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
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002D8230, CFSTR("statusCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckDataUpdate dataUpdateCommand](self, "dataUpdateCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("cmdContext"));

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckDataUpdate dataUpdateCommand](self, "dataUpdateCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataUpdateCommand"));
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

- (FMDAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (NSDictionary)dataUpdateCommand
{
  return self->_dataUpdateCommand;
}

- (void)setDataUpdateCommand:(id)a3
{
  objc_storeStrong((id *)&self->_dataUpdateCommand, a3);
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
  objc_storeStrong((id *)&self->_dataUpdateCommand, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
