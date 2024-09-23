@implementation ICQUIStorageUsedController

- (ICQUIStorageUsedController)initWithAppBundleID:(id)a3 account:(id)a4 navigationController:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICQUIStorageUsedController *v12;
  ICQUIStorageUsedController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICQUIStorageUsedController;
  v12 = -[ICQUIStorageUsedController init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a4);
    objc_storeStrong((id *)&v13->_appBundleID, a3);
    objc_storeStrong((id *)&v13->_navigationController, a5);
  }

  return v13;
}

- (void)beginLoading
{
  -[ICQUIStorageUsedController beginLoadingForSpecifier:](self, "beginLoadingForSpecifier:", 0);
}

- (void)beginLoadingForSpecifier:(id)a3
{
  id v5;
  void *v6;
  NSString *appBundleID;
  id v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_activeSpecifier, a3);
  -[ICQUIStorageUsedController _startSpinnerInSpecifier:](self, "_startSpinnerInSpecifier:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC72A8]), "initWithAccount:", self->_account);
  appBundleID = self->_appBundleID;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke;
  v9[3] = &unk_24E3F4638;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "fetchStorageByApp:completion:", appBundleID, v9);

}

void __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(*(id *)(a1 + 32), "_stopSpinnerInSpecifier:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Fetch app storage finished with success.", buf, 2u);
    }

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_19;
    v17[3] = &unk_24E3F34D8;
    v15 = v5;
    v16 = *(_QWORD *)(a1 + 32);
    v18 = v15;
    v19 = v16;
    dispatch_async(MEMORY[0x24BDAC9B8], v17);

  }
}

void __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_19(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ruiURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v3, "ruiURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_beginRUIFlowWithURL:");
  }
  else
  {
    objc_msgSend(v3, "liftUIURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_beginLiftUIFlowWithURL:");
  }

}

- (void)_beginRUIFlowWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  ICQPreferencesRemoteUIDelegate *v6;
  ICQPreferencesRemoteUIDelegate *ruiDelegate;
  uint8_t v8[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Initiating RUI flow.", v8, 2u);
  }

  v6 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:]([ICQPreferencesRemoteUIDelegate alloc], "initWithNavigationController:initialAction:account:", self->_navigationController, 0, self->_account);
  ruiDelegate = self->_ruiDelegate;
  self->_ruiDelegate = v6;

  -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_ruiDelegate, "setDelegate:", self);
  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:](self->_ruiDelegate, "loadURL:postBody:", v4, 0);

}

- (void)_beginLiftUIFlowWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  ICQUIPreferencesLiftUIDelegate *v6;
  ICQUIPreferencesLiftUIDelegate *liftUIDelegate;
  uint8_t v8[16];

  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Initiating LiftUI flow.", v8, 2u);
  }

  v6 = -[ICQUIPreferencesLiftUIDelegate initWithNavigationController:account:]([ICQUIPreferencesLiftUIDelegate alloc], "initWithNavigationController:account:", self->_navigationController, self->_account);
  liftUIDelegate = self->_liftUIDelegate;
  self->_liftUIDelegate = v6;

  -[ICQUIPreferencesLiftUIDelegate loadURL:](self->_liftUIDelegate, "loadURL:", v4);
  -[ICQUIStorageUsedController _stopSpinnerInSpecifier:](self, "_stopSpinnerInSpecifier:", self->_activeSpecifier);
}

- (void)loadStarted:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Storage used VC loading started.", v4, 2u);
  }

}

- (void)loadFinished:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Storage used VC load finished with success.", v5, 2u);
  }

  -[ICQUIStorageUsedController _stopSpinnerInSpecifier:](self, "_stopSpinnerInSpecifier:", self->_activeSpecifier);
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICQUIStorageUsedController loadFailed:withError:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  -[ICQUIStorageUsedController _stopSpinnerInSpecifier:](self, "_stopSpinnerInSpecifier:", self->_activeSpecifier);
}

- (void)_startSpinnerInSpecifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setColor:", v4);

    objc_msgSend(v3, "startAnimating");
    objc_msgSend(v5, "setAccessoryView:", v3);

  }
}

- (void)_stopSpinnerInSpecifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v5, "propertyForKey:", *MEMORY[0x24BE759A0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessoryView:", v4);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_liftUIDelegate, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

void __55__ICQUIStorageUsedController_beginLoadingForSpecifier___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Fetch app storage failed with error %@", a5, a6, a7, a8, 2u);
}

- (void)loadFailed:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a2, a3, "Storage used VC load failed with error: %@", a5, a6, a7, a8, 2u);
}

@end
