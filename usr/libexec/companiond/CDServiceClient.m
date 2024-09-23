@implementation CDServiceClient

- (CDServiceClient)initWithAuditToken:(id)a3
{
  id v4;
  CDServiceClient *v5;
  BSAuditToken *v6;
  BSAuditToken *auditToken;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDServiceClient;
  v5 = -[CDServiceClient init](&v9, "init");
  if (v5)
  {
    v6 = (BSAuditToken *)objc_msgSend(v4, "copy");
    auditToken = v5->_auditToken;
    v5->_auditToken = v6;

  }
  return v5;
}

- (CDServiceClient)initWithConnection:(id)a3
{
  void *v4;
  CDServiceClient *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BSAuditToken tokenFromNSXPCConnection:](BSAuditToken, "tokenFromNSXPCConnection:", a3));
  v5 = -[CDServiceClient initWithAuditToken:](self, "initWithAuditToken:", v4);

  return v5;
}

+ (CDServiceClient)currentClient
{
  void *v2;
  CDServiceClient *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  if (v2)
    v3 = -[CDServiceClient initWithConnection:]([CDServiceClient alloc], "initWithConnection:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[BSAuditToken bundleID](self->_auditToken, "bundleID");
}

- (BOOL)hasDaemonStatusEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.daemon-status"));
}

- (BOOL)hasStorePurchaseEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.store-purchase"));
}

- (BOOL)hasAppSignInOverrideBundleIdentifierEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.app-sign-in.override-bundle-identifier"));
}

- (BOOL)hasAMSDelegatePurchaseEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.ams-delegate-purchase"));
}

- (BOOL)hasSystemAuthenticationEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.system-service"));
}

- (BOOL)hasRestrictedAccessEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.restricted-access"));
}

- (BOOL)hasStoreAuthenticationEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.store-authentication"));
}

- (BOOL)hasDedicatedCameraEntitlement
{
  return -[BSAuditToken hasEntitlement:](self->_auditToken, "hasEntitlement:", CFSTR("com.apple.companion-authentication.dedicated-camera"));
}

- (BOOL)shouldReceiveDeviceEvents
{
  if (-[CDServiceClient hasStorePurchaseEntitlement](self, "hasStorePurchaseEntitlement"))
    return 1;
  else
    return -[CDServiceClient hasSystemAuthenticationEntitlement](self, "hasSystemAuthenticationEntitlement");
}

- (BSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
}

@end
