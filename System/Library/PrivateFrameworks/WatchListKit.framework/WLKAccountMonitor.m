@implementation WLKAccountMonitor

void __35__WLKAccountMonitor_sharedInstance__block_invoke()
{
  WLKAccountMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(WLKAccountMonitor);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (WLKAccountMonitor)init
{
  WLKAccountMonitor *v2;
  void *v3;
  uint64_t v4;
  ACAccount *activeAccount;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WLKAccountMonitor;
  v2 = -[WLKAccountMonitor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ams_activeiTunesAccount");
    v4 = objc_claimAutoreleasedReturnValue();
    activeAccount = v2->_activeAccount;
    v2->_activeAccount = (ACAccount *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel__accountStoreDidChange_, *MEMORY[0x1E0C8F1C0], 0);

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_1);
  return (id)sharedInstance___sharedInstance;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WLKAccountMonitor;
  -[WLKAccountMonitor dealloc](&v4, sel_dealloc);
}

- (void)_accountStoreDidChange:(id)a3
{
  void *v4;
  void *v5;
  WLKAccountMonitor *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wlk_stringForKey:", *MEMORY[0x1E0C8F0F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F170]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C8F180]))
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_activeiTunesAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WLKAccountMonitor activeAccount](v6, "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WLKAccountMonitor _shouldNotifyAccountChange:newAccount:](v6, "_shouldNotifyAccountChange:newAccount:", v9, v8);

    if (v10)
    {
      objc_storeStrong((id *)&v6->_activeAccount, v8);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:", CFSTR("WLKAccountMonitorAccountDidChange"), v6);

    }
    -[WLKAccountMonitor activeAccount](v6, "activeAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[WLKAccountMonitor _shouldNotifyStoreFrontChange:newAccount:](v6, "_shouldNotifyStoreFrontChange:newAccount:", v12, v8);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "postNotificationName:object:", CFSTR("WLKAccountMontiorStoreFrontDidChange"), v6);

    }
    objc_sync_exit(v6);

  }
}

- (BOOL)_shouldNotifyAccountChange:(id)a3 newAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  BOOL v11;
  void *v12;
  void *v13;
  char v14;
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && !v6)
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      v9 = "WLKAccountMonitor - User logged out";
      v10 = (uint8_t *)&v18;
LABEL_15:
      _os_log_impl(&dword_1B515A000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v5 && v6)
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 0;
      v9 = "WLKAccountMonitor - User logged in";
      v10 = (uint8_t *)&v17;
      goto LABEL_15;
    }
LABEL_16:

    v11 = 1;
    goto LABEL_17;
  }
  v11 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if ((v14 & 1) == 0)
    {
      WLKSystemLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 0;
        v9 = "WLKAccountMonitor - Account changed";
        v10 = (uint8_t *)&v16;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (BOOL)_shouldNotifyStoreFrontChange:(id)a3 newAccount:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "ams_storefront");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_storefront");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if ((v11 & 1) != 0)
    {
      v8 = 0;
    }
    else
    {
      WLKSystemLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "ams_storefront");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "ams_storefront");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v13;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1B515A000, v12, OS_LOG_TYPE_DEFAULT, "WLKAccountMonitor - Store front changed %@ - %@", (uint8_t *)&v16, 0x16u);

      }
      v8 = 1;
    }
  }

  return v8;
}

- (ACAccount)activeAccount
{
  return self->_activeAccount;
}

- (ACMonitoredAccountStore)monitoredAccountStore
{
  return self->_monitoredAccountStore;
}

- (void)setMonitoredAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
}

@end
