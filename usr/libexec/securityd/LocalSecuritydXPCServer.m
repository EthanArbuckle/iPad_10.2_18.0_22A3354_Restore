@implementation LocalSecuritydXPCServer

- (LocalSecuritydXPCServer)initWithSecurityClient:(SecurityClient *)a3 fakeEntitlements:(id)a4
{
  id v6;
  LocalSecuritydXPCServer *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *fakeEntitlements;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LocalSecuritydXPCServer;
  v7 = -[SecuritydXPCServer initWithSecurityClient:](&v11, "initWithSecurityClient:", a3);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    fakeEntitlements = v7->_fakeEntitlements;
    v7->_fakeEntitlements = v8;

  }
  return v7;
}

- (BOOL)clientHasBooleanEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSecuritydXPCServer fakeEntitlements](self, "fakeEntitlements"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSecuritydXPCServer fakeEntitlements](self, "fakeEntitlements"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));
    v8 = objc_msgSend(v7, "isEqual:", &__kCFBooleanTrue);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)fakeEntitlements
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFakeEntitlements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeEntitlements, 0);
}

@end
