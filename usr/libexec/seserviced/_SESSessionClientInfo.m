@implementation _SESSessionClientInfo

+ (id)withConnection:(id)a3
{
  id v3;
  _SESSessionClientInfo *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *clientName;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  v4 = objc_opt_new(_SESSessionClientInfo);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", &off_100322F38));
  v7 = (NSString *)objc_msgSend(v6, "copy");
  clientName = v4->_clientName;
  v4->_clientName = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.seserviced.session.acwg")));
  v4->_acwgSessionEntitlement = v9 != 0;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.seserviced.session.dck")));
  v4->_dckSessionEntitlement = v10 != 0;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.developer.carkey.session")));
  v4->_rkeSessionEntitlement = v11 != 0;

  return v4;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)acwgSessionEntitlement
{
  return self->_acwgSessionEntitlement;
}

- (BOOL)dckSessionEntitlement
{
  return self->_dckSessionEntitlement;
}

- (BOOL)rkeSessionEntitlement
{
  return self->_rkeSessionEntitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
