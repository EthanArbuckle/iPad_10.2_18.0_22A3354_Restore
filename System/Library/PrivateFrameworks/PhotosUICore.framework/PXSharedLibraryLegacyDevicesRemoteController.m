@implementation PXSharedLibraryLegacyDevicesRemoteController

- (PXSharedLibraryLegacyDevicesRemoteController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryLegacyDevicesRemoteController+iOS.m"), 53, CFSTR("%s is not available as initializer"), "-[PXSharedLibraryLegacyDevicesRemoteController init]");

  abort();
}

- (id)_init
{
  PXSharedLibraryLegacyDevicesRemoteController *v2;
  void *v3;
  void *v4;
  objc_class *v5;
  uint64_t v6;
  AIDAAccountManager *accountManager;
  uint64_t v8;
  ACAccount *currentAccount;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryLegacyDevicesRemoteController;
  v2 = -[PXSharedLibraryLegacyDevicesRemoteController init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v4 = (void *)getAIDAAccountManagerClass_softClass;
    v16 = getAIDAAccountManagerClass_softClass;
    if (!getAIDAAccountManagerClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getAIDAAccountManagerClass_block_invoke;
      v12[3] = &unk_1E51482E0;
      v12[4] = &v13;
      __getAIDAAccountManagerClass_block_invoke((uint64_t)v12);
      v4 = (void *)v14[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v13, 8);
    v6 = objc_msgSend([v5 alloc], "initWithAccountStore:", v3);
    accountManager = v2->_accountManager;
    v2->_accountManager = (AIDAAccountManager *)v6;

    -[AIDAAccountManager setDelegate:](v2->_accountManager, "setDelegate:", v2);
    objc_msgSend(v3, "cachedPrimaryAppleAccount");
    v8 = objc_claimAutoreleasedReturnValue();
    currentAccount = v2->_currentAccount;
    v2->_currentAccount = (ACAccount *)v8;

  }
  return v2;
}

- (void)beginRemoteUIRequestWithPresenter:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  id v8;
  uint64_t *v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  PXSharedLibraryLegacyDevicesRemoteController *v16;
  id v17;
  id v18;
  char v19;
  id location;
  _QWORD v21[4];
  uint64_t *v22;

  v4 = a3;
  -[PXSharedLibraryLegacyDevicesRemoteController _updateStateOnMainQueue:](self, "_updateStateOnMainQueue:", 1);
  objc_initWeak(&location, self);
  +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulateLegacyDevicesRemoteFailure");

  v7 = MEMORY[0x1E0C809B0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke;
  v15 = &unk_1E511B448;
  v19 = v6;
  objc_copyWeak(&v18, &location);
  v16 = self;
  v8 = v4;
  v17 = v8;
  v9 = &v12;
  objc_msgSend(MEMORY[0x1E0D002A0], "bagForAltDSID:", 0, v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = ___RequestURLForGoldilocksLegacyDevices_block_invoke;
  v21[3] = &unk_1E51414E0;
  v22 = v9;
  v11 = v9;
  objc_msgSend(v10, "urlForKey:completion:", CFSTR("goldilocksIncompatibleDevices"), v21);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[PXSharedLibraryLegacyDevicesRemoteController signalChange:](self, "signalChange:", 1);
  }
}

- (void)_updateStateOnMainQueue:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke;
  v3[3] = &unk_1E5144EB8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
}

- (id)accountsForAccountManager:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  ACAccount *currentAccount;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v5 = (id *)getAIDAServiceTypeCloudSymbolLoc_ptr;
  v17 = getAIDAServiceTypeCloudSymbolLoc_ptr;
  if (!getAIDAServiceTypeCloudSymbolLoc_ptr)
  {
    v6 = AppleIDSSOAuthenticationLibrary();
    v5 = (id *)dlsym(v6, "AIDAServiceTypeCloud");
    v15[3] = (uint64_t)v5;
    getAIDAServiceTypeCloudSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v14, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAIDAServiceTypeCloud(void)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PXSharedLibraryLegacyDevicesRemoteController+iOS.m"), 27, CFSTR("%s"), dlerror(), v14);

    __break(1u);
  }
  currentAccount = self->_currentAccount;
  v18 = *v5;
  v19[0] = currentAccount;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = v18;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSharedLibraryGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = (uint64_t)v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: Request complete: %@\nerror: %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v7, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("statusCode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  if (v11 >= 400)
  {
    PLSharedLibraryGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 134217984;
      v14 = v11;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "PXSharedLibraryLegacyDevicesRemoteController: Request error code %ld", (uint8_t *)&v13, 0xCu);
    }

    if (-[PXSharedLibraryLegacyDevicesRemoteController state](self, "state") != 3)
      -[PXSharedLibraryLegacyDevicesRemoteController _updateStateOnMainQueue:](self, "_updateStateOnMainQueue:", 4);
  }

}

- (void)remoteUIWillLoadRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  -[PXSharedLibraryLegacyDevicesRemoteController _updateStateOnMainQueue:](self, "_updateStateOnMainQueue:", 1);
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("/goldilocks/skip"));

  if (v7)
  {
    PLSharedLibraryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: moving to completed state due to user request", v9, 2u);
    }

    -[PXSharedLibraryLegacyDevicesRemoteController _updateStateOnMainQueue:](self, "_updateStateOnMainQueue:", 3);
  }
}

- (void)remoteUIDidEndFlow:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  PLSharedLibraryGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: moving to completed state due to end of flow", v5, 2u);
  }

  -[PXSharedLibraryLegacyDevicesRemoteController _updateStateOnMainQueue:](self, "_updateStateOnMainQueue:", 3);
}

- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLSharedLibraryGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: Presenting: %{public}@; modal: %d",
      (uint8_t *)&v9,
      0x12u);

  }
  if (!v4)
    -[PXSharedLibraryLegacyDevicesRemoteController _updateStateOnMainQueue:](self, "_updateStateOnMainQueue:", 2);

}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_currentAccount, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

uint64_t __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke_2;
  v3[3] = &unk_1E5144FE8;
  v1 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v1;
  return objc_msgSend(v4, "performChanges:", v3);
}

uint64_t __72__PXSharedLibraryLegacyDevicesRemoteController__updateStateOnMainQueue___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", *(_QWORD *)(a1 + 40));
}

void __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  _BOOL4 v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && !*(_BYTE *)(a1 + 56))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke_26;
    v11[3] = &unk_1E51429B8;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    v13 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

    objc_destroyWeak(&v14);
  }
  else
  {
    PLSharedLibraryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(a1 + 56);
      *(_DWORD *)buf = 67109634;
      v16 = v5 != 0;
      v17 = 1024;
      v18 = v8;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevicesRemoteController: remote immediately unavailable with URL present: %d; simulate fail"
        "ure %d; error = %@",
        buf,
        0x18u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_updateStateOnMainQueue:", 4);

  }
}

void __82__PXSharedLibraryLegacyDevicesRemoteController_beginRemoteUIRequestWithPresenter___block_invoke_26(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v3 = (void *)getAAUIGrandSlamRemoteUIPresenterClass_softClass;
  v13 = getAAUIGrandSlamRemoteUIPresenterClass_softClass;
  if (!getAAUIGrandSlamRemoteUIPresenterClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getAAUIGrandSlamRemoteUIPresenterClass_block_invoke;
    v9[3] = &unk_1E51482E0;
    v9[4] = &v10;
    __getAAUIGrandSlamRemoteUIPresenterClass_block_invoke((uint64_t)v9);
    v3 = (void *)v11[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v10, 8);
  v5 = objc_msgSend([v4 alloc], "initWithAccountManager:presenter:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setDelegate:", WeakRetained);
  v8 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  objc_msgSend(v8, "setURL:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "loadRequest:completion:", v8, 0);

}

+ (id)legacyDevicesRemoteControllerIfEnabledWithSharedLibraryOrPreviewPresent:(BOOL)a3
{
  int v4;
  id v5;

  v4 = _os_feature_enabled_impl();
  v5 = 0;
  if (v4 && !a3)
    v5 = -[PXSharedLibraryLegacyDevicesRemoteController _init]([PXSharedLibraryLegacyDevicesRemoteController alloc], "_init");
  return v5;
}

@end
