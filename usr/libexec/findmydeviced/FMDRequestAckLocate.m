@implementation FMDRequestAckLocate

- (FMDRequestAckLocate)initWithAccount:(id)a3 locateCommand:(id)a4 ackURL:(id)a5 cmdStatusCode:(int64_t)a6 cmdStatusMessage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  FMDRequestAckLocate *v16;
  FMDRequestAckLocate *v17;
  objc_super v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)FMDRequestAckLocate;
  v16 = -[FMDRequest initWithAccount:](&v19, "initWithAccount:", v12);
  v17 = v16;
  if (v16)
  {
    -[FMDRequestAckLocate setAccount:](v16, "setAccount:", v12);
    -[FMDRequestAckLocate setLocateCommand:](v17, "setLocateCommand:", v13);
    -[FMDRequestAckLocate setAckURL:](v17, "setAckURL:", v14);
    -[FMDRequestAckLocate setCmdStatusCode:](v17, "setCmdStatusCode:", a6);
    -[FMDRequestAckLocate setCmdStatusMsg:](v17, "setCmdStatusMsg:", v15);
  }

  return v17;
}

- (id)requestUrl
{
  return -[FMDRequestAckLocate ackURL](self, "ackURL");
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)FMDRequestAckLocate;
  v3 = -[FMDRequest requestBody](&v20, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMDRequestAckLocate cmdStatusCode](self, "cmdStatusCode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("statusCode"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate cmdStatusMsg](self, "cmdStatusMsg"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate cmdStatusMsg](self, "cmdStatusMsg"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("statusMessage"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate locateCommand](self, "locateCommand"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("id")));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("id"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate locateCommand](self, "locateCommand"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("enqueueTimestamp")));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("enqueueTimestamp"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate locateCommand](self, "locateCommand"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("responseTimeStamp")));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("responseTimeStamp"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate locateCommand](self, "locateCommand"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cmd")));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("cmd"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate locateCommand](self, "locateCommand"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));
  objc_msgSend(v8, "fm_safelyMapKey:toObject:", CFSTR("desiredAccuracy"), v18);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("cmdContext"));
  return v4;
}

- (BOOL)canRequestBeRetriedNow
{
  return 0;
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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckLocate locateCommand](self, "locateCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locateCommand"));
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

- (NSDictionary)locateCommand
{
  return self->_locateCommand;
}

- (void)setLocateCommand:(id)a3
{
  objc_storeStrong((id *)&self->_locateCommand, a3);
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

- (NSString)cmdStatusMsg
{
  return self->_cmdStatusMsg;
}

- (void)setCmdStatusMsg:(id)a3
{
  objc_storeStrong((id *)&self->_cmdStatusMsg, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmdStatusMsg, 0);
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_locateCommand, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
