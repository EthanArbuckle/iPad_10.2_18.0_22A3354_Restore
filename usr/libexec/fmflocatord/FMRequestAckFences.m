@implementation FMRequestAckFences

- (void)deinitializeRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRequestAckFences;
  -[FMRequest deinitializeRequest](&v3, "deinitializeRequest");
  -[FMRequestAckFences setFencesCommand:](self, "setFencesCommand:", 0);
  -[FMRequestAckFences setAckURL:](self, "setAckURL:", 0);
}

- (FMRequestAckFences)initWithProvider:(id)a3 fencesCommand:(id)a4 ackURL:(id)a5
{
  id v8;
  id v9;
  FMRequestAckFences *v10;
  FMRequestAckFences *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)FMRequestAckFences;
  v10 = -[FMRequest initWithProvider:](&v13, "initWithProvider:", a3);
  v11 = v10;
  if (v10)
  {
    -[FMRequestAckFences setFencesCommand:](v10, "setFencesCommand:", v8);
    -[FMRequestAckFences setAckURL:](v11, "setAckURL:", v9);
  }

  return v11;
}

- (id)requestUrl
{
  return -[FMRequestAckFences ackURL](self, "ackURL");
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)FMRequestAckFences;
  v3 = -[FMRequest requestBody](&v11, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardDeviceContext"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullDeviceInfo"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("deviceInfo"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("OK"), CFSTR("statusMessage"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_10005AF20, CFSTR("statusCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckFences fencesCommand](self, "fencesCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("cmdContext"));

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
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestAckFences fencesCommand](self, "fencesCommand"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("id")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fencesCommand"));
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

- (NSDictionary)fencesCommand
{
  return self->_fencesCommand;
}

- (void)setFencesCommand:(id)a3
{
  objc_storeStrong((id *)&self->_fencesCommand, a3);
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
  objc_storeStrong((id *)&self->_fencesCommand, 0);
}

@end
