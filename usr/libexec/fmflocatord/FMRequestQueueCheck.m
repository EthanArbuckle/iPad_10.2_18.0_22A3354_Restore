@implementation FMRequestQueueCheck

- (void)deinitializeRequest
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FMRequestQueueCheck;
  -[FMRequest deinitializeRequest](&v3, "deinitializeRequest");
  -[FMRequestQueueCheck setServerContext:](self, "setServerContext:", 0);
}

- (FMRequestQueueCheck)initWithProvider:(id)a3 andServerContext:(id)a4
{
  id v6;
  FMRequestQueueCheck *v7;
  FMRequestQueueCheck *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMRequestQueueCheck;
  v7 = -[FMRequest initWithProvider:](&v10, "initWithProvider:", a3);
  v8 = v7;
  if (v7)
    -[FMRequestQueueCheck setServerContext:](v7, "setServerContext:", v6);

  return v8;
}

- (id)requestUrl
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "formattedURLForTemplate:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/qc")));

  return v3;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FMRequestQueueCheck;
  v3 = -[FMRequest requestBody](&v12, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "standardDeviceContext"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("deviceContext"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequest provider](self, "provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullDeviceInfo"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("deviceInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestQueueCheck serverContext](self, "serverContext"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMRequestQueueCheck serverContext](self, "serverContext"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("serverContext"));

  }
  return v4;
}

- (double)maxRetryInterval
{
  return 3600.0;
}

- (int64_t)maxNonNetworkRelatedRetries
{
  return -1;
}

- (int64_t)maxConsecutiveNetworkNotificationRetries
{
  return -1;
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
  BOOL v12;

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
      v12 = v10 == v11;

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

- (NSDictionary)serverContext
{
  return self->_serverContext;
}

- (void)setServerContext:(id)a3
{
  objc_storeStrong((id *)&self->_serverContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverContext, 0);
}

@end
