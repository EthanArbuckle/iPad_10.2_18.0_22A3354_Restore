@implementation ICSViewBuilder

+ (id)buildBackupViewControllerWithAccount:(id)a3
{
  id v3;
  ICSBackupViewController *v4;

  v3 = a3;
  v4 = -[ICSBackupViewController initWithAccount:]([ICSBackupViewController alloc], "initWithAccount:", v3);

  return v4;
}

+ (id)buildViewControllerWithAccountManager:(id)a3 dataclass:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  ICSKeychainSyncViewController *v12;
  void *v13;
  void *v14;

  v5 = a4;
  if ((id)*MEMORY[0x24BDB3E30] == v5)
  {
    v11 = a3;
    v12 = -[ICSKeychainSyncViewController initWithAccountManager:]([ICSKeychainSyncViewController alloc], "initWithAccountManager:", v11);
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE75590];
    v7 = a3;
    objc_msgSend(v7, "accounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BE06080];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v5, v10, 0, 0, 0, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("icloudAccountManager"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75AC0]);
    v12 = objc_alloc_init(ICSDataclassDetailViewController);
    -[ICSKeychainSyncViewController setSpecifier:](v12, "setSpecifier:", v11);
    -[ICSKeychainSyncViewController setAccountManager:](v12, "setAccountManager:", v7);
    objc_msgSend(v7, "accounts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSKeychainSyncViewController setAccount:](v12, "setAccount:", v14);

  }
  return v12;
}

+ (Class)iCloudHomeViewControllerClassLegacy
{
  return (Class)objc_opt_class();
}

@end
