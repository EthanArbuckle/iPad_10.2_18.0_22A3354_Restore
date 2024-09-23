@implementation AEAConcreteAuditTokenPrimitives

- (id)auditTokenForData:(id)a3
{
  return +[AEAConcreteAuditToken auditTokenWithData:](AEAConcreteAuditToken, "auditTokenWithData:", a3);
}

- (id)makeInvalidAuditToken
{
  return +[AEAConcreteAuditToken invalidAuditToken](AEAConcreteAuditToken, "invalidAuditToken");
}

@end
