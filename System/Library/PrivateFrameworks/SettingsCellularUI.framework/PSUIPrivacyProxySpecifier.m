@implementation PSUIPrivacyProxySpecifier

- (PSUIPrivacyProxySpecifier)initWithDataCache:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  PSUIPrivacyProxySpecifier *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PRIVACYPROXY"), &stru_24D5028C8, CFSTR("Cellular"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PSUIPrivacyProxySpecifier;
  v11 = -[PSUIPrivacyProxySpecifier initWithName:target:set:get:detail:cell:edit:](&v13, sel_initWithName_target_set_get_detail_cell_edit_, v10, self, sel_setPrivacyProxyEnabled_, sel_isPrivacyProxyEnabled, 0, 6, 0);

  if (v11)
  {
    objc_storeStrong((id *)&v11->_dataCache, a3);
    objc_storeStrong((id *)&v11->_context, a4);
    -[PSUIPrivacyProxySpecifier setProperty:forKey:](v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  }

  return v11;
}

- (void)setPrivacyProxyEnabled:(id)a3
{
  -[PSUICoreTelephonyDataCache setPrivacyProxy:enabled:](self->_dataCache, "setPrivacyProxy:enabled:", self->_context, objc_msgSend(a3, "BOOLValue"));
}

- (id)isPrivacyProxyEnabled
{
  _BOOL8 v2;

  v2 = -[PSUICoreTelephonyDataCache isPrivacyProxyEnabled:](self->_dataCache, "isPrivacyProxyEnabled:", self->_context);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v2);
}

- (id)groupSpecifier
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("PrivacyProxy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSUICoreTelephonyDataCache isUserSubscribedToPrivacyProxy:](self->_dataCache, "isUserSubscribedToPrivacyProxy:", self->_context);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("PRIVACYPROXY_FOOTER_SUBSCRIBED");
  else
    v7 = CFSTR("PRIVACYPROXY_FOOTER_UNSUBSCRIBED");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24D5028C8, CFSTR("Cellular"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

  return v3;
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
  objc_storeStrong((id *)&self->_dataCache, a3);
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
}

@end
