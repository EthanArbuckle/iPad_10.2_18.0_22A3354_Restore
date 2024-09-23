@implementation ICSSettingsHelper

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v10;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, v6);
  objc_initWeak(&location, v7);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke;
  v11[3] = &unk_251C615E8;
  objc_copyWeak(&v12, (id *)buf);
  objc_copyWeak(&v13, &location);
  objc_msgSend(a1, "repairPrimaryAppleAccountInViewController:completion:", v6, v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __74__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_class *v16;
  void *v17;
  id v18;
  id to;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 32));
  objc_copyWeak(&v18, (id *)(a1 + 40));
  v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    v7 = objc_loadWeakRetained(&v18);
    if (!v7)
      a2 = 0;

    if (a2)
    {
      v8 = MEMORY[0x24BDAC9B8];
      v9 = MEMORY[0x24BDAC9B8];
      dispatch_assert_queue_V2(v8);

      v10 = objc_alloc(MEMORY[0x24BE04CC0]);
      v11 = objc_loadWeakRetained(&v18);
      v12 = (void *)objc_msgSend(v10, "initWithAccountManager:", v11);

      v13 = objc_loadWeakRetained(&to);
      objc_msgSend(v13, "showViewController:sender:", v12, v13);

    }
  }
  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_loadWeakRetained(&to);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_24B4C1000, v14, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);

}

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4 highlightRowIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AAUILogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v13;
    _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);

  }
  objc_initWeak((id *)buf, v8);
  objc_initWeak(&location, v9);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __97__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke;
  v15[3] = &unk_251C61610;
  objc_copyWeak(&v17, (id *)buf);
  objc_copyWeak(&v18, &location);
  v14 = v10;
  v16 = v14;
  objc_msgSend(a1, "repairPrimaryAppleAccountInViewController:completion:", v8, v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __97__ICSSettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  objc_class *v16;
  void *v17;
  id v18;
  id to;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  objc_copyWeak(&v18, (id *)(a1 + 48));
  v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    v7 = objc_loadWeakRetained(&v18);
    if (!v7)
      a2 = 0;

    if (a2)
    {
      v8 = MEMORY[0x24BDAC9B8];
      v9 = MEMORY[0x24BDAC9B8];
      dispatch_assert_queue_V2(v8);

      v10 = objc_alloc(MEMORY[0x24BE04CC0]);
      v11 = objc_loadWeakRetained(&v18);
      v12 = (void *)objc_msgSend(v10, "initWithAccountManager:highlightRowIdentifier:", v11, *(_QWORD *)(a1 + 32));

      v13 = objc_loadWeakRetained(&to);
      objc_msgSend(v13, "showViewController:sender:", v12, v13);

    }
  }
  _AAUILogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_loadWeakRetained(&to);
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_24B4C1000, v14, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);

  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&to);

}

+ (void)repairPrimaryAppleAccountInViewController:(id)a3 completion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BE04CD8];
  v6 = a4;
  v7 = a3;
  v9 = (id)objc_msgSend([v5 alloc], "initWithType:", 2);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D30]), "initWithFlowContext:withPresentingViewController:", v9, v7);

  objc_msgSend(v8, "repairIfPrimaryAppleAccountIsCDP:", v6);
}

+ (id)getWebAccessStatusUpdateHook
{
  return objc_alloc_init(ICSCDPWebAccessStatusUpdateHook);
}

@end
