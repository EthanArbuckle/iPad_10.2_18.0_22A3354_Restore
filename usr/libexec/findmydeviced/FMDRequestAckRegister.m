@implementation FMDRequestAckRegister

- (FMDRequestAckRegister)initWithAccount:(id)a3 registerCommand:(id)a4 ackURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  FMDRequestAckRegister *v11;
  FMDRequestAckRegister *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FMDRequestAckRegister;
  v11 = -[FMDRequest initWithAccount:](&v14, "initWithAccount:", v8);
  v12 = v11;
  if (v11)
  {
    -[FMDRequestAckRegister setAccount:](v11, "setAccount:", v8);
    -[FMDRequestAckRegister setRegisterCommand:](v12, "setRegisterCommand:", v9);
    -[FMDRequestAckRegister setAckURL:](v12, "setAckURL:", v10);
  }

  return v12;
}

- (id)requestUrl
{
  return -[FMDRequestAckRegister ackURL](self, "ackURL");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FMDRequestAckRegister;
  v3 = -[FMDRequest requestBody](&v7, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002D7FC0, CFSTR("statusCode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckRegister registerCommand](self, "registerCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("cmdContext"));

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckRegister registerCommand](self, "registerCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "registerCommand"));
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

- (NSDictionary)registerCommand
{
  return self->_registerCommand;
}

- (void)setRegisterCommand:(id)a3
{
  objc_storeStrong((id *)&self->_registerCommand, a3);
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
  objc_storeStrong((id *)&self->_registerCommand, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
