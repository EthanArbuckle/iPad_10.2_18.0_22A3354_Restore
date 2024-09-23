@implementation VSAccountAuthentication

- (VSAccountAuthentication)init
{
  VSAccountAuthentication *v2;
  VSOptional *v3;
  VSOptional *authenticationToken;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSAccountAuthentication;
  v2 = -[VSAccountAuthentication init](&v6, sel_init);
  if (v2)
  {
    v3 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    authenticationToken = v2->_authenticationToken;
    v2->_authenticationToken = v3;

    v2->_synchronizable = 1;
  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[VSAccountAuthentication username](self, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("username"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[VSAccountAuthentication authenticationToken](self, "authenticationToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ = %@"), CFSTR("authenticationToken"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v9);

  v10 = (void *)MEMORY[0x24BDD17C8];
  v15.receiver = self;
  v15.super_class = (Class)VSAccountAuthentication;
  -[VSAccountAuthentication description](&v15, sel_description);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %@>"), v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (VSOptional)authenticationToken
{
  return self->_authenticationToken;
}

- (void)setAuthenticationToken:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationToken, a3);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isSynchronizable
{
  return self->_synchronizable;
}

- (void)setSynchronizable:(BOOL)a3
{
  self->_synchronizable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_authenticationToken, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end
