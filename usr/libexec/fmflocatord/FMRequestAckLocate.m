@implementation FMRequestAckLocate

- (void)deinitializeRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRequestAckLocate;
  -[FMRequest deinitializeRequest](&v3, "deinitializeRequest");
  -[FMRequestAckLocate setLocateCommand:](self, "setLocateCommand:", 0);
  -[FMRequestAckLocate setAckURL:](self, "setAckURL:", 0);
  -[FMRequestAckLocate setCmdStatusMsg:](self, "setCmdStatusMsg:", 0);
}

- (FMRequestAckLocate)initWithProvider:(id)a3 locateCommand:(id)a4 ackURL:(id)a5 cmdStatusCode:(int64_t)a6 cmdStatusMessage:(id)a7
{
  id v12;
  id v13;
  id v14;
  FMRequestAckLocate *v15;
  FMRequestAckLocate *v16;
  objc_super v18;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)FMRequestAckLocate;
  v15 = -[FMRequest initWithProvider:](&v18, "initWithProvider:", a3);
  v16 = v15;
  if (v15)
  {
    -[FMRequestAckLocate setLocateCommand:](v15, "setLocateCommand:", v12);
    -[FMRequestAckLocate setAckURL:](v16, "setAckURL:", v13);
    -[FMRequestAckLocate setCmdStatusCode:](v16, "setCmdStatusCode:", a6);
    -[FMRequestAckLocate setCmdStatusMsg:](v16, "setCmdStatusMsg:", v14);
  }

  return v16;
}

- (id)requestUrl
{
  return -[FMRequestAckLocate ackURL](self, "ackURL");
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)FMRequestAckLocate;
  v3 = -[FMRequest requestBody](&v26, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardDeviceContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("id")));
  objc_msgSend(v6, "fm_safelyMapKey:toObject:", CFSTR("cmdId"), v8);

  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationDeviceInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("deviceInfo"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[FMRequestAckLocate cmdStatusCode](self, "cmdStatusCode")));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("statusCode"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate cmdStatusMsg](self, "cmdStatusMsg"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate cmdStatusMsg](self, "cmdStatusMsg"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("statusMessage"));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("id")));
  objc_msgSend(v14, "fm_safelyMapKey:toObject:", CFSTR("id"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("enqueueTimestamp")));
  objc_msgSend(v14, "fm_safelyMapKey:toObject:", CFSTR("enqueueTimestamp"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("responseTimeStamp")));
  objc_msgSend(v14, "fm_safelyMapKey:toObject:", CFSTR("responseTimeStamp"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("cmd")));
  objc_msgSend(v14, "fm_safelyMapKey:toObject:", CFSTR("cmd"), v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("desiredAccuracy")));
  objc_msgSend(v14, "fm_safelyMapKey:toObject:", CFSTR("desiredAccuracy"), v24);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("cmdContext"));
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
  unsigned __int8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v9 = objc_opt_class(self, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest delegate](self, "delegate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
      if (v10 == v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckLocate locateCommand](self, "locateCommand"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("id")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locateCommand"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("id")));
        v12 = objc_msgSend(v14, "isEqualToString:", v16);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
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
}

@end
