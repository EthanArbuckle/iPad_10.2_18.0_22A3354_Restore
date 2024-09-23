@implementation KmlEntitlementChecker

- (id)copyWithZone:(_NSZone *)a3
{
  KmlEntitlementChecker *v5;
  NSString *v6;
  NSString *clientName;

  v5 = -[KmlEntitlementChecker init](+[KmlEntitlementChecker allocWithZone:](KmlEntitlementChecker, "allocWithZone:"), "init");
  if (v5)
  {
    v6 = (NSString *)-[NSString copyWithZone:](self->_clientName, "copyWithZone:", a3);
    clientName = v5->_clientName;
    v5->_clientName = v6;

    v5->_xpcAccess = self->_xpcAccess;
    v5->_allowBackGroundClient = self->_allowBackGroundClient;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
