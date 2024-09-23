@implementation APMetricEnvironment

- (id)findInternalContentDataById:(id)a3
{
  void *v3;
  APContentDataInternal *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContentData findById:](APManagedContentData, "findById:", a3));
  if (v3)
    v4 = -[APContentDataInternal initWithContentDataProvider:]([APContentDataInternal alloc], "initWithContentDataProvider:", v3);
  else
    v4 = 0;

  return v4;
}

- (APContentDataInternal)internalContent
{
  return self->_internalContent;
}

- (void)setInternalContent:(id)a3
{
  objc_storeStrong((id *)&self->_internalContent, a3);
}

- (APContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (APClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (APIDAccount_Private)idAccount
{
  return self->_idAccount;
}

- (void)setIdAccount:(id)a3
{
  objc_storeStrong((id *)&self->_idAccount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idAccount, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_internalContent, 0);
}

@end
