@implementation VUIFamilyInviteManager

- (VUIFamilyInviteManager)init
{
  VUIFamilyInviteManager *v2;
  ACAccountStore *v3;
  ACAccountStore *store;
  id v5;
  void *v6;
  uint64_t v7;
  AIDAAccountManager *accountManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIFamilyInviteManager;
  v2 = -[VUIFamilyInviteManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    store = v2->_store;
    v2->_store = v3;

    v5 = objc_alloc(MEMORY[0x1E0CFCF50]);
    -[VUIFamilyInviteManager store](v2, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithAccountStore:", v6);
    accountManager = v2->_accountManager;
    v2->_accountManager = (AIDAAccountManager *)v7;

    -[AIDAAccountManager setDelegate:](v2->_accountManager, "setDelegate:", v2);
  }
  return v2;
}

- (void)presentFamilySetupScreenIfEligible:(id)a3 checkEligibility:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD aBlock[4];
  id v17;

  v4 = a4;
  v6 = a3;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke;
  aBlock[3] = &unk_1E9F98DF0;
  v8 = v6;
  v17 = v8;
  v9 = _Block_copy(aBlock);
  v10 = v9;
  if (v4)
  {
    v11 = objc_alloc(MEMORY[0x1E0D20EE8]);
    -[VUIFamilyInviteManager accountManager](self, "accountManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithAccountManager:", v12);

    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_34;
    v14[3] = &unk_1E9F9C990;
    v15 = v10;
    objc_msgSend(v13, "requestFamilyEligibilityWithCompletion:", v14);

  }
  else
  {
    (*((void (**)(void *))v9 + 2))(v9);
  }

}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_2;
  block[3] = &unk_1E9F98DF0;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = objc_alloc(MEMORY[0x1E0D20ED8]);
  v3 = (void *)objc_msgSend(v2, "initWithEventType:", *MEMORY[0x1E0D20ED0]);
  objc_msgSend(v3, "setClientName:", CFSTR("AppleTV"));
  v4 = *(void **)(a1 + 32);
  if (v4 && objc_msgSend(v4, "count"))
    objc_msgSend(v3, "setAdditionalParameters:", *(_QWORD *)(a1 + 32));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = objc_alloc_init(MEMORY[0x1E0D20EE0]);
  +[VUIApplicationRouter currentNavigationController](VUIApplicationRouter, "currentNavigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appWindow");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rootViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend((id)v11[5], "setPresenter:", v5);
  v8 = (void *)v11[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_24;
  v9[3] = &unk_1E9F9C968;
  v9[4] = &v10;
  objc_msgSend(v8, "performOperationWithContext:completion:", v3, v9);

  _Block_object_dispose(&v10, 8);
}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_24(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  VUIDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    if (v5)
    {
      objc_msgSend(v5, "description");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = CFSTR("no error");
    }
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::FACircleStateController completion -- success: %@ -- error: %@", (uint8_t *)&v11, 0x16u);
    if (v5)

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __78__VUIFamilyInviteManager_presentFamilySetupScreenIfEligible_checkEligibility___block_invoke_34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a2, "eligibilityStatus");
  VUIDefaultLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 == 1)
  {
    if (v8)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::presentFamilySetupScreenIfEligible eligible for family.  Presenting Family Setup Screen", (uint8_t *)&v10, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v8)
    {
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1D96EE000, v7, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::presentFamilySetupScreenIfEligible not eligible for family -- error: %@", (uint8_t *)&v10, 0xCu);

    }
  }

}

- (void)presentFamilySetupScreenWithBuyParams:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[8];
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    +[VUIActionCommerceTransaction extractSalableAdamIDFromBuyParams:](VUIActionCommerceTransaction, "extractSalableAdamIDFromBuyParams:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");

    if (v5)
    {
      v8 = CFSTR("salableAdamId");
      v9[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v6 = objc_claimAutoreleasedReturnValue();
      -[VUIFamilyInviteManager presentFamilySetupScreenIfEligible:checkEligibility:](self, "presentFamilySetupScreenIfEligible:checkEligibility:", v6, 1);
    }
    else
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D96EE000, v6, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::Failed to find salableAdamId from buyparams. Not presenting family setup screen.", v7, 2u);
      }
    }

  }
  else
  {
    VUIDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D96EE000, v5, OS_LOG_TYPE_DEFAULT, "VUIFamilyInviteManager::Missing buyparams. Not presenting family setup screen.", v7, 2u);
    }
  }

}

- (id)accountsForAccountManager:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CFCF18]);
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end
