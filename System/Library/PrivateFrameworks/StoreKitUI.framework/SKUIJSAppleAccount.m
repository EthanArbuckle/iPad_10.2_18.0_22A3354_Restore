@implementation SKUIJSAppleAccount

- (SKUIJSAppleAccount)initWithACAccount:(id)a3
{
  id v5;
  SKUIJSAppleAccount *v6;
  SKUIJSAppleAccount *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIJSAppleAccount initWithACAccount:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIJSAppleAccount;
  v6 = -[SKUIJSAppleAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (NSString)accountDescription
{
  return -[ACAccount accountDescription](self->_account, "accountDescription");
}

- (NSString)DSID
{
  return (NSString *)-[ACAccount aa_personID](self->_account, "aa_personID");
}

- (NSString)identifier
{
  return -[ACAccount identifier](self->_account, "identifier");
}

- (NSString)username
{
  return -[ACAccount username](self->_account, "username");
}

- (ACAccount)nativeAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativeAccount, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)initWithACAccount:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIJSAppleAccount initWithACAccount:]";
}

@end
