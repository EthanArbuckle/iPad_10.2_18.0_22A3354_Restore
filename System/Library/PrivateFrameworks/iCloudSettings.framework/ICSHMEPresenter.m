@implementation ICSHMEPresenter

- (ICSHMEPresenter)initWithAccountManager:(id)a3
{
  id v5;
  ICSHMEPresenter *v6;
  ICSHMEPresenter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSHMEPresenter;
  v6 = -[ICSHMEPresenter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (void)showHMEWithPresenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  ICSMatterhornUpsellHook *v10;
  ICSPrivateEmailUpdateCacheHook *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  AAUIGrandSlamRemoteUIPresenter *v18;
  AAUIGrandSlamRemoteUIPresenter *privateEmailPresenter;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICSHMEPresenter delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didStartLoadingWithView:", 1);

  objc_msgSend(MEMORY[0x24BE0ADF0], "bagForAltDSID:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateEmailManageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  objc_msgSend(v8, "setURL:", v7);
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
  LogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ICSHMEPresenter showHMEWithPresenter:].cold.1((uint64_t)v8, v9);

  v10 = objc_alloc_init(ICSMatterhornUpsellHook);
  v11 = objc_alloc_init(ICSPrivateEmailUpdateCacheHook);
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BE04D00]);
  objc_msgSend(v13, "aa_altDSID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithAltDSID:upgradeContext:", v15, *MEMORY[0x24BE0AC50]);

  v20[0] = v10;
  v20[1] = v11;
  v20[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (AAUIGrandSlamRemoteUIPresenter *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D18]), "initWithAccountManager:presenter:hooks:", self->_accountManager, v4, v17);

  privateEmailPresenter = self->_privateEmailPresenter;
  self->_privateEmailPresenter = v18;

  -[AAUIGrandSlamRemoteUIPresenter setDelegate:](self->_privateEmailPresenter, "setDelegate:", self);
  -[AAUIGrandSlamRemoteUIPresenter loadRequest:](self->_privateEmailPresenter, "loadRequest:", v8);

}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v5 = a4;
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICSHMEPresenter remoteUIRequestComplete:error:].cold.1((uint64_t)v5, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "private email specifier provider success", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ICSHMEPresenter_remoteUIRequestComplete_error___block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __49__ICSHMEPresenter_remoteUIRequestComplete_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didStopLoadingWithView:", 1);

}

- (ICSCloudHomeViewDelegate)delegate
{
  return (ICSCloudHomeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_privateEmailPresenter, 0);
}

- (void)showHMEWithPresenter:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_DEBUG, "Private email specifier tapped, url %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIRequestComplete:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "private email specifier failed with error %@", (uint8_t *)&v2, 0xCu);
}

@end
