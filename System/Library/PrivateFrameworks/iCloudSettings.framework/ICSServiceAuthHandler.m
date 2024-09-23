@implementation ICSServiceAuthHandler

- (ICSServiceAuthHandler)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICSServiceAuthHandler *v9;
  ICSServiceAuthHandler *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSServiceAuthHandler;
  v9 = -[ICSServiceAuthHandler init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (ICSServiceAuthHandler)initWithAccountManager:(id)a3
{
  return -[ICSServiceAuthHandler initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  AIDAServiceOwnerProtocol *serviceOwnersManager;
  id v4;
  void *v5;
  AIDAServiceOwnerProtocol *v6;
  AIDAServiceOwnerProtocol *v7;

  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    v4 = objc_alloc(MEMORY[0x24BE060E0]);
    -[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (AIDAServiceOwnerProtocol *)objc_msgSend(v4, "initWithAccountStore:", v5);
    v7 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v6;

    serviceOwnersManager = self->_serviceOwnersManager;
  }
  return serviceOwnersManager;
}

- (void)signInAccountForService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  _QWORD aBlock[4];
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke;
  aBlock[3] = &unk_251C614D8;
  v9 = v7;
  v44 = v9;
  v10 = _Block_copy(aBlock);
  v40[0] = v8;
  v40[1] = 3221225472;
  v40[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_3;
  v40[3] = &unk_251C61550;
  v40[4] = self;
  v11 = v6;
  v41 = v11;
  v12 = v10;
  v42 = v12;
  v13 = _Block_copy(v40);
  -[AIDAServiceOwnerProtocol accountForService:](self->_serviceOwnersManager, "accountForService:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[ICSServiceAuthHandler accountMatchesPrimaryAccount:service:](self, "accountMatchesPrimaryAccount:service:", v14, v11);
    LogSubsystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v46 = v11;
        _os_log_impl(&dword_24B4C1000, v16, OS_LOG_TYPE_DEFAULT, "Already signed in to service %@, marking as such...", buf, 0xCu);
      }

      (*((void (**)(id, uint64_t))v12 + 2))(v12, 1);
    }
    else
    {
      v35 = v13;
      v36 = v9;
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v46 = v11;
        _os_log_impl(&dword_24B4C1000, v16, OS_LOG_TYPE_DEFAULT, "User already signed in to service %@, prompting for clarification...", buf, 0xCu);
      }

      AALocalizedStringForServiceType();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SERVICE_SWAP_ACCOUNT_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSServiceAuthHandler account](self, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "username");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "username");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithFormat:", v20, v18, v22, v23);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SERVICE_SWAP_ACCOUNT_ACTION"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v26, v18);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_57;
      v37[3] = &unk_251C61578;
      v9 = v36;
      v38 = v36;
      v39 = v35;
      objc_msgSend(v27, "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v34, 0, v29, v32, v37);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v30, 1, 0);

      v13 = v35;
    }
  }
  else
  {
    (*((void (**)(void *, _QWORD))v13 + 2))(v13, 0);
  }

}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_2;
  v3[3] = &unk_251C60E18;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_3(id *a1, char a2)
{
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = objc_alloc_init(MEMORY[0x24BE0AE28]);
  objc_msgSend(a1[4], "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aa_altDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAltDSID:", v6);

  objc_msgSend(v4, "setIsUsernameEditable:", 0);
  WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
  objc_msgSend(v4, "setPresentingViewController:", WeakRetained);

  v8 = a1[5];
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE06080]) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE060A0]) & 1) != 0)
  {
    v9 = 2;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE06098]) & 1) != 0)
  {
    v9 = 4;
  }
  else if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE06088]) & 1) != 0)
  {
    v9 = 5;
  }
  else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE06090]))
  {
    v9 = 6;
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v4, "setServiceType:", v9);
  objc_msgSend(a1[4], "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsername:", v11);

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1;
  v25 = __Block_byref_object_dispose__1;
  v26 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  v12 = (void *)v22[5];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_31;
  v16[3] = &unk_251C61528;
  v19 = &v21;
  v13 = a1[6];
  v20 = a2;
  v14 = a1[4];
  v15 = a1[5];
  v18 = v13;
  v16[4] = v14;
  v17 = v15;
  objc_msgSend(v12, "authenticateWithContext:completion:", v4, v16);

  _Block_object_dispose(&v21, 8);
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (v6)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_31_cold_1((uint64_t)v6, v9);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x24BE060D0]);
    objc_msgSend(v10, "setAuthenticationResults:", v5);
    objc_msgSend(v10, "setShouldForceOperation:", *(unsigned __int8 *)(a1 + 64));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v10, "setViewController:", WeakRetained);

    v12 = *(void **)(a1 + 40);
    if (v12 == (void *)*MEMORY[0x24BE06090])
    {
      v18 = *(_QWORD *)(a1 + 40);
      v19[0] = &unk_251C83D38;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSignInContexts:", v13);

      v12 = *(void **)(a1 + 40);
    }
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_37;
    v15[3] = &unk_251C61500;
    v16 = v12;
    v17 = *(id *)(a1 + 48);
    objc_msgSend(v14, "signInService:withContext:completion:", v16, v10, v15);

  }
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_37(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Signed in to service %{public}@ with success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

uint64_t __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_57(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  uint64_t (*v6)(void);
  uint8_t v8[16];
  uint8_t buf[16];

  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "User chose not to swap, bailing!", buf, 2u);
    }

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "User opted to swap accounts, on it!", v8, 2u);
    }

    v6 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  return v6();
}

- (void)signOutAccountForService:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  AIDAServiceOwnerProtocol *serviceOwnersManager;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  v8 = objc_alloc(MEMORY[0x24BE04DA0]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  v32 = (id)objc_msgSend(v8, "initWithPresentingViewController:", WeakRetained);

  objc_msgSend((id)v28[5], "setAccountManager:", self->_accountManager);
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke;
  aBlock[3] = &unk_251C615A0;
  v26 = &v27;
  v11 = v7;
  v25 = v11;
  v12 = _Block_copy(aBlock);
  v13 = objc_alloc_init(MEMORY[0x24BE060D0]);
  v14 = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(v13, "setViewController:", v14);

  if ((id)*MEMORY[0x24BE06090] == v6)
  {
    v16 = v28[5];
    v37[0] = *MEMORY[0x24BE06080];
    v37[1] = v6;
    v38[0] = v16;
    v38[1] = &unk_251C83D60;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  }
  else
  {
    v35 = *MEMORY[0x24BE06080];
    v36 = v28[5];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSignOutContexts:", v15);

  LogSubsystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v6;
    _os_log_impl(&dword_24B4C1000, v17, OS_LOG_TYPE_DEFAULT, "Attempting sign out for service: %{public}@", buf, 0xCu);
  }

  serviceOwnersManager = self->_serviceOwnersManager;
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_64;
  v21[3] = &unk_251C61500;
  v19 = v6;
  v22 = v19;
  v20 = v12;
  v23 = v20;
  -[AIDAServiceOwnerProtocol signOutService:withContext:completion:](serviceOwnersManager, "signOutService:withContext:completion:", v19, v13, v21);

  _Block_object_dispose(&v27, 8);
}

void __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_2;
  v6[3] = &unk_251C60E18;
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __61__ICSServiceAuthHandler_signOutAccountForService_completion___block_invoke_64(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = CFSTR("NO");
    v9 = 138543874;
    if (a2)
      v8 = CFSTR("YES");
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Signed out of service: %{public}@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
}

- (BOOL)accountMatchesPrimaryAccount:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[AIDAServiceOwnerProtocol altDSIDForAccount:service:](self->_serviceOwnersManager, "altDSIDForAccount:service:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[ICSServiceAuthHandler account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "aa_altDSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(v11, "isEqualToString:", v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
  }
  else
  {
    -[AIDAServiceOwnerProtocol DSIDForAccount:service:](self->_serviceOwnersManager, "DSIDForAccount:service:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[ICSServiceAuthHandler account](self, "account");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
    if (v10)
    {
      objc_msgSend(v15, "aa_personID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithBool:", objc_msgSend(v12, "isEqualToString:", v10));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v16;
    }
    else
    {
      objc_msgSend(v15, "username");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithBool:", objc_msgSend(v12, "isEqualToString:", v16));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v13 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __60__ICSServiceAuthHandler_signInAccountForService_completion___block_invoke_31_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "AuthKit authentication returned an error: %@", (uint8_t *)&v2, 0xCu);
}

@end
