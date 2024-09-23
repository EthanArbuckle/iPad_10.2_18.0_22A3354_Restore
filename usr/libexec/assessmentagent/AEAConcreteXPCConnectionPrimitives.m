@implementation AEAConcreteXPCConnectionPrimitives

- (BOOL)connectionCanPublishAssessmentState:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.developer.automatic-assessment-configuration")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)connectionCanRegisterAsAssessmentSource:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForEntitlement:", CFSTR("com.apple.developer.automatic-assessment-configuration")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)auditTokenForConnection:(id)a3
{
  id v3;
  AEAConcreteAuditToken *v4;
  AEAConcreteAuditToken *v5;
  _OWORD v7[2];

  v3 = a3;
  v4 = [AEAConcreteAuditToken alloc];
  if (v3)
    objc_msgSend(v3, "auditToken");
  else
    memset(v7, 0, sizeof(v7));
  v5 = -[AEAConcreteAuditToken initWithAuditToken:](v4, "initWithAuditToken:", v7);

  return v5;
}

- (id)makeSourceRegisteringListener
{
  id v2;

  v2 = objc_alloc((Class)NSXPCListener);
  return objc_msgSend(v2, "initWithMachServiceName:", AEAssessmentStatePublisherRegisteringMachServiceName);
}

@end
