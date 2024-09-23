@implementation FMDRequestAckIdentity

- (FMDRequestAckIdentity)initWithProvider:(id)a3 identityCommand:(id)a4 commandFailureReason:(unint64_t)a5 ackURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  FMDRequestAckIdentity *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "account"));
  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckIdentity;
  v14 = -[FMDRequest initWithAccount:](&v16, "initWithAccount:", v13);

  if (v14)
  {
    -[FMDRequestAckIdentity setProvider:](v14, "setProvider:", v10);
    -[FMDRequestAckIdentity setIdentityCommand:](v14, "setIdentityCommand:", v11);
    -[FMDRequestAckIdentity setAckURL:](v14, "setAckURL:", v12);
    -[FMDRequestAckIdentity setFailureReason:](v14, "setFailureReason:", a5);
  }

  return v14;
}

- (id)requestUrl
{
  return -[FMDRequestAckIdentity ackURL](self, "ackURL");
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
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)FMDRequestAckIdentity;
  v3 = -[FMDRequest requestBody](&v16, "requestBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckIdentity provider](self, "provider"));
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
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002D80F8, CFSTR("statusCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckIdentity identityCommand](self, "identityCommand"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("cmdContext"));

  if (-[FMDRequestAckIdentity failureReason](self, "failureReason"))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &off_1002D8110, CFSTR("statusCode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[FMDRequestAckIdentity failureReason](self, "failureReason")));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("identityFailureReason"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckIdentity failureDescription](self, "failureDescription"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckIdentity failureDescription](self, "failureDescription"));
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("failureDescription"));

    }
  }

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
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDRequestAckIdentity identityCommand](self, "identityCommand"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identityCommand"));
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

- (NSString)failureDescription
{
  return self->_failureDescription;
}

- (void)setFailureDescription:(id)a3
{
  objc_storeStrong((id *)&self->_failureDescription, a3);
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (NSDictionary)identityCommand
{
  return self->_identityCommand;
}

- (void)setIdentityCommand:(id)a3
{
  objc_storeStrong((id *)&self->_identityCommand, a3);
}

- (NSURL)ackURL
{
  return self->_ackURL;
}

- (void)setAckURL:(id)a3
{
  objc_storeStrong((id *)&self->_ackURL, a3);
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(unint64_t)a3
{
  self->_failureReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackURL, 0);
  objc_storeStrong((id *)&self->_identityCommand, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_failureDescription, 0);
}

@end
