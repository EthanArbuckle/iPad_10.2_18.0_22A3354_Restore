@implementation FMDRequestAckNotify

- (FMDRequestAckNotify)initWithAccount:(id)a3 messageCommand:(id)a4 cmdStatusCode:(int64_t)a5 ackURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  FMDRequestAckNotify *v13;
  FMDRequestAckNotify *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckNotify;
  v13 = -[FMDRequest initWithAccount:](&v16, "initWithAccount:", v10);
  v14 = v13;
  if (v13)
  {
    -[FMDRequestAckNotify setAccount:](v13, "setAccount:", v10);
    -[FMDRequestAckNotify setMessageCommand:](v14, "setMessageCommand:", v11);
    -[FMDRequestAckNotify setCmdStatusCode:](v14, "setCmdStatusCode:", a5);
    -[FMDRequestAckNotify setAckURL:](v14, "setAckURL:", v12);
  }

  return v14;
}

- (id)requestUrl
{
  return -[FMDRequestAckNotify ackURL](self, "ackURL");
}

- (id)requestBody
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FMDRequestAckNotify;
  v3 = -[FMDRequest requestBody](&v8, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDRequestAckNotify cmdStatusCode](self, "cmdStatusCode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("statusCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckNotify messageCommand](self, "messageCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("cmdContext"));

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckNotify messageCommand](self, "messageCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "messageCommand"));
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

- (NSDictionary)messageCommand
{
  return self->_messageCommand;
}

- (void)setMessageCommand:(id)a3
{
  objc_storeStrong((id *)&self->_messageCommand, a3);
}

- (int64_t)cmdStatusCode
{
  return self->_cmdStatusCode;
}

- (void)setCmdStatusCode:(int64_t)a3
{
  self->_cmdStatusCode = a3;
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
  objc_storeStrong((id *)&self->_messageCommand, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
