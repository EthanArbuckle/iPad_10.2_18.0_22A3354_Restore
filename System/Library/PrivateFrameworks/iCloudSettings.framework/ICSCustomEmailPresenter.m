@implementation ICSCustomEmailPresenter

- (ICSCustomEmailPresenter)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6;
  id v7;
  ICSCustomEmailPresenter *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  NSObject *customEmailSpecifierProvider;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ICSCustomEmailPresenter;
  v8 = -[ICSCustomEmailPresenter init](&v15, sel_init);
  if (v8)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICSCustomEmailPresenter initWithAccountManager:presenter:].cold.2(v6, v9);

    objc_msgSend(MEMORY[0x24BDD1488], "ics_loadBundle:atPath:", CFSTR("MailAccountSettings.bundle"), CFSTR("System/Library/PreferenceBundles/AccountSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = NSClassFromString(CFSTR("BYODSpecifierProvider"));
    if (-[objc_class conformsToProtocol:](v11, "conformsToProtocol:", &unk_2579C6E98))
    {
      v12 = objc_msgSend([v11 alloc], "initWithAccountManager:presenter:", v6, v7);
      customEmailSpecifierProvider = v8->_customEmailSpecifierProvider;
      v8->_customEmailSpecifierProvider = (AAUISpecifierProvider *)v12;
    }
    else
    {
      LogSubsystem();
      customEmailSpecifierProvider = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(customEmailSpecifierProvider, OS_LOG_TYPE_ERROR))
        -[ICSCustomEmailPresenter initWithAccountManager:presenter:].cold.1((uint64_t)v10, customEmailSpecifierProvider);
    }

  }
  return v8;
}

- (void)showCustomEmailDomainView
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("BYOD_HANDLE_URL_NOTIFICATION"), 0, MEMORY[0x24BDBD1B8]);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customEmailSpecifierProvider, 0);
}

- (void)initWithAccountManager:(uint64_t)a1 presenter:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
}

- (void)initWithAccountManager:(void *)a1 presenter:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "accounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_DEBUG, "AccountManager: %@, account: %@", (uint8_t *)&v6, 0x16u);

}

@end
