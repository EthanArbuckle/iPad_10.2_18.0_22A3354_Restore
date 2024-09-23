@implementation BYAppleIDAccountsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_15);
  return (id)sharedManager_instance_1;
}

void __41__BYAppleIDAccountsManager_sharedManager__block_invoke()
{
  BYAppleIDAccountsManager *v0;
  void *v1;

  v0 = objc_alloc_init(BYAppleIDAccountsManager);
  v1 = (void *)sharedManager_instance_1;
  sharedManager_instance_1 = (uint64_t)v0;

}

- (id)initForDelegateBundleIDs:(id)a3
{
  id v4;
  BYAppleIDAccountsManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  AALoginPluginManager *appleIDLoginPluginManager;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BYAppleIDAccountsManager;
  v5 = -[BYAppleIDAccountsManager init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getAALoginPluginManagerClass_softClass;
    v16 = getAALoginPluginManagerClass_softClass;
    if (!getAALoginPluginManagerClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getAALoginPluginManagerClass_block_invoke;
      v12[3] = &unk_1E4E26900;
      v12[4] = &v13;
      __getAALoginPluginManagerClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v7, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    appleIDLoginPluginManager = v5->_appleIDLoginPluginManager;
    v5->_appleIDLoginPluginManager = (AALoginPluginManager *)v8;

    -[AALoginPluginManager restrictToPluginBundleIDs:](v5->_appleIDLoginPluginManager, "restrictToPluginBundleIDs:", v4);
    -[AALoginPluginManager setShouldStashLoginResponse:](v5->_appleIDLoginPluginManager, "setShouldStashLoginResponse:", 1);
  }

  return v5;
}

- (BYAppleIDAccountsManager)init
{
  return (BYAppleIDAccountsManager *)-[BYAppleIDAccountsManager initForDelegateBundleIDs:](self, "initForDelegateBundleIDs:", 0);
}

- (AASetupAssistantService)aaService
{
  AASetupAssistantService *aaService;
  void *v4;
  objc_class *v5;
  AASetupAssistantService *v6;
  AASetupAssistantService *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  aaService = self->_aaService;
  if (!aaService)
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v4 = (void *)getAASetupAssistantServiceClass_softClass;
    v13 = getAASetupAssistantServiceClass_softClass;
    if (!getAASetupAssistantServiceClass_softClass)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __getAASetupAssistantServiceClass_block_invoke;
      v9[3] = &unk_1E4E26900;
      v9[4] = &v10;
      __getAASetupAssistantServiceClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v10, 8);
    v6 = (AASetupAssistantService *)objc_alloc_init(v5);
    v7 = self->_aaService;
    self->_aaService = v6;

    aaService = self->_aaService;
  }
  return aaService;
}

- (void)preloadDefaultLoginParametersWithBundleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke;
  block[3] = &unk_1E4E27798;
  block[4] = self;
  v8 = v4;
  v5 = preloadDefaultLoginParametersWithBundleIDs__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&preloadDefaultLoginParametersWithBundleIDs__onceToken, block);

}

void __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke_2;
  v4[3] = &unk_1E4E27798;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

id __71__BYAppleIDAccountsManager_preloadDefaultLoginParametersWithBundleIDs___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _BYLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A4E92000, v2, OS_LOG_TYPE_DEFAULT, "Preload default login parameters", v4, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "restrictToPluginBundleIDs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setShouldSkipiTunesPlugin:", 0);
  return (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "collectParametersForLoginRequest");
}

- (void)loginDelegateAccountsWithUsername:(id)a3 password:(id)a4 rawPassword:(id)a5 skipiTunes:(BOOL)a6 onlyAppleIDPlugin:(BOOL)a7 completion:(id)a8
{
  _BOOL4 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[16];

  v9 = a7;
  v10 = a6;
  v14 = a5;
  v15 = a8;
  v16 = a4;
  v17 = a3;
  _BYLoggingFacility();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v18, OS_LOG_TYPE_DEFAULT, "Login Delegate Accounts", buf, 2u);
  }

  -[AALoginPluginManager setShouldSkipiTunesPlugin:](self->_appleIDLoginPluginManager, "setShouldSkipiTunesPlugin:", v10);
  if (v9)
    -[AALoginPluginManager restrictToPluginBundleIDs:](self->_appleIDLoginPluginManager, "restrictToPluginBundleIDs:", &unk_1E4E34750);
  kdebug_trace();
  -[AALoginPluginManager collectParametersForLoginRequest](self->_appleIDLoginPluginManager, "collectParametersForLoginRequest");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  kdebug_trace();
  -[BYAppleIDAccountsManager aaService](self, "aaService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAppleID:", v17);

  -[BYAppleIDAccountsManager aaService](self, "aaService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPassword:", v16);

  kdebug_trace();
  -[BYAppleIDAccountsManager aaService](self, "aaService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke;
  v25[3] = &unk_1E4E27900;
  v25[4] = self;
  v26 = v14;
  v27 = v15;
  v23 = v15;
  v24 = v14;
  objc_msgSend(v22, "loginDelegatesWithParameters:completion:", v19, v25);

}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  kdebug_trace();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2;
  block[3] = &unk_1E4E278D8;
  v11 = v6;
  v12 = v5;
  v7 = *(void **)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = _BYIsInternalInstall();
    v5 = *(void **)(a1 + 32);
    if ((v4 & 1) != 0 || !v5)
    {
      v7 = 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v1, objc_msgSend(*(id *)(a1 + 32), "code"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
    }
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Login delgates finished, error = %{public}@", buf, 0xCu);
    if (v7)
    {

    }
  }

  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2_cold_1(a1, v8);

  if (*(_QWORD *)(a1 + 40) && !*(_QWORD *)(a1 + 32))
  {
    kdebug_trace();
    v11 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD **)(a1 + 48);
    v12 = (void *)v10[1];
    objc_msgSend(v10, "aaService");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "aaService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "password");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_21;
    v18[3] = &unk_1E4E26E20;
    v17 = *(_QWORD *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    objc_msgSend(v12, "notifyServicesOfLoginResponse:forAppleID:password:rawPassword:completion:", v11, v14, v16, v17, v18);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 64);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v9 + 16))(v9, 0, 0, *(_QWORD *)(a1 + 32));
  }
}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_21(uint64_t a1, int a2, void *a3)
{
  void *v3;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  kdebug_trace();
  _BYLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v9 = 0;
      v10 = v6;
    }
    else if (v6)
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "domain");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v3, objc_msgSend(v6, "code"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 1;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    *(_DWORD *)buf = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1A4E92000, v7, OS_LOG_TYPE_DEFAULT, "Notify delegates success: %{public}@ error: %{public}@", buf, 0x16u);
    if (v9)
    {

    }
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_26;
  block[3] = &unk_1E4E278B0;
  v12 = *(id *)(a1 + 32);
  v17 = a2;
  v15 = v6;
  v16 = v12;
  v13 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_26(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(result + 16))(result, 1, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  return result;
}

- (void)enableDataClassesForAccount:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  char v16;
  id *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  char v26;
  id *v27;
  void *v28;
  id v29;
  int v30;
  char v31;
  id *v32;
  void *v33;
  id v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  id *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  void *obj;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  uint8_t v79[128];
  _BYTE buf[24];
  void *v81;
  uint64_t *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v5 = a4;
  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__6;
  v72 = __Block_byref_object_dispose__6;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2050000000;
  v6 = (void *)getACAccountStoreClass_softClass_0;
  v77 = getACAccountStoreClass_softClass_0;
  if (!getACAccountStoreClass_softClass_0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getACAccountStoreClass_block_invoke_0;
    v81 = &unk_1E4E26900;
    v82 = &v74;
    __getACAccountStoreClass_block_invoke_0((uint64_t)buf);
    v6 = (void *)v75[3];
  }
  v53 = v5;
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v74, 8);
  v73 = objc_alloc_init(v7);
  v55 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v54, "aa_isPrimaryEmailVerified"))
  {
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v54, "provisionedDataclasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
    if (!v9)
      goto LABEL_46;
    v10 = *(_QWORD *)v65;
    obj = v8;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v65 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v11);
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v13 = (id *)getkAccountDataclassDeviceLocatorSymbolLoc_ptr;
        v81 = (void *)getkAccountDataclassDeviceLocatorSymbolLoc_ptr;
        if (!getkAccountDataclassDeviceLocatorSymbolLoc_ptr)
        {
          v14 = (void *)AccountsLibrary();
          v13 = (id *)dlsym(v14, "kAccountDataclassDeviceLocator");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
          getkAccountDataclassDeviceLocatorSymbolLoc_ptr = (uint64_t)v13;
        }
        _Block_object_dispose(buf, 8);
        if (!v13)
        {
LABEL_66:
          dlerror();
          abort_report_np();
          goto LABEL_68;
        }
        v15 = *v13;
        v16 = objc_msgSend(v12, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v17 = (id *)getkAccountDataclassCloudPhotosSymbolLoc_ptr;
          v81 = (void *)getkAccountDataclassCloudPhotosSymbolLoc_ptr;
          if (!getkAccountDataclassCloudPhotosSymbolLoc_ptr)
          {
            v18 = (void *)AccountsLibrary();
            v17 = (id *)dlsym(v18, "kAccountDataclassCloudPhotos");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v17;
            getkAccountDataclassCloudPhotosSymbolLoc_ptr = (uint64_t)v17;
          }
          _Block_object_dispose(buf, 8);
          if (!v17)
            goto LABEL_66;
          v19 = *v17;
          if ((objc_msgSend(v12, "isEqualToString:", v19) & 1) != 0)
            goto LABEL_22;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v20 = (id *)getkAccountDataclassMediaStreamSymbolLoc_ptr;
          v81 = (void *)getkAccountDataclassMediaStreamSymbolLoc_ptr;
          if (!getkAccountDataclassMediaStreamSymbolLoc_ptr)
          {
            v21 = (void *)AccountsLibrary();
            v20 = (id *)dlsym(v21, "kAccountDataclassMediaStream");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v20;
            getkAccountDataclassMediaStreamSymbolLoc_ptr = (uint64_t)v20;
          }
          _Block_object_dispose(buf, 8);
          if (!v20)
            goto LABEL_66;
          v22 = *v20;
          if (objc_msgSend(v12, "isEqualToString:", v22))
          {

LABEL_22:
            goto LABEL_23;
          }
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v23 = (id *)getkAccountDataclassSharedStreamsSymbolLoc_ptr;
          v81 = (void *)getkAccountDataclassSharedStreamsSymbolLoc_ptr;
          if (!getkAccountDataclassSharedStreamsSymbolLoc_ptr)
          {
            v24 = (void *)AccountsLibrary();
            v23 = (id *)dlsym(v24, "kAccountDataclassSharedStreams");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v23;
            getkAccountDataclassSharedStreamsSymbolLoc_ptr = (uint64_t)v23;
          }
          _Block_object_dispose(buf, 8);
          if (!v23)
            goto LABEL_66;
          v25 = *v23;
          v26 = objc_msgSend(v12, "isEqualToString:", v25);

          if ((v26 & 1) == 0)
          {
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v27 = (id *)getkAccountDataclassMailSymbolLoc_ptr;
            v81 = (void *)getkAccountDataclassMailSymbolLoc_ptr;
            if (!getkAccountDataclassMailSymbolLoc_ptr)
            {
              v28 = (void *)AccountsLibrary();
              v27 = (id *)dlsym(v28, "kAccountDataclassMail");
              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v27;
              getkAccountDataclassMailSymbolLoc_ptr = (uint64_t)v27;
            }
            _Block_object_dispose(buf, 8);
            if (!v27)
              goto LABEL_66;
            v29 = *v27;
            v30 = objc_msgSend(v12, "isEqualToString:", v29);

            if (v30)
            {
              v31 = objc_msgSend(v54, "aa_needsEmailConfiguration");
              goto LABEL_34;
            }
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v32 = (id *)getkAccountDataclassNotesSymbolLoc_ptr;
            v81 = (void *)getkAccountDataclassNotesSymbolLoc_ptr;
            if (!getkAccountDataclassNotesSymbolLoc_ptr)
            {
              v33 = (void *)AccountsLibrary();
              v32 = (id *)dlsym(v33, "kAccountDataclassNotes");
              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v32;
              getkAccountDataclassNotesSymbolLoc_ptr = (uint64_t)v32;
            }
            _Block_object_dispose(buf, 8);
            if (!v32)
              goto LABEL_66;
            v34 = *v32;
            v35 = objc_msgSend(v12, "isEqualToString:", v34);

            if (!v35)
              goto LABEL_43;
            if ((objc_msgSend(v54, "aa_isPrimaryAccount") & 1) != 0
              || (objc_msgSend(v54, "aa_needsEmailConfiguration") & 1) == 0)
            {
              if ((objc_msgSend(v54, "aa_isPrimaryAccount") & 1) != 0)
              {
LABEL_43:
                objc_msgSend(v54, "setEnabled:forDataclass:", 1, v12);
                goto LABEL_23;
              }
              v31 = objc_msgSend(v54, "aa_isManagedAppleID");
LABEL_34:
              if ((v31 & 1) != 0)
                goto LABEL_23;
              goto LABEL_43;
            }
          }
        }
LABEL_23:
        ++v11;
      }
      while (v9 != v11);
      v8 = obj;
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v79, 16);
      v9 = v36;
      if (!v36)
      {
LABEL_46:

        kdebug_trace();
        objc_msgSend((id)v69[5], "dataclassActionsForAccountSave:", v54);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        kdebug_trace();
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        objc_msgSend(v54, "provisionedDataclasses");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
        if (v39)
        {
          v40 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v39; ++i)
            {
              if (*(_QWORD *)v61 != v40)
                objc_enumerationMutation(v38);
              v42 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
              objc_msgSend(v37, "objectForKeyedSubscript:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "count") == 1)
              {
                objc_msgSend(v43, "lastObject");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v44, "type"))
                {
                  _BYLoggingFacility();
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
                  {
                    v46 = objc_msgSend(v44, "type");
                    *(_DWORD *)buf = 134218242;
                    *(_QWORD *)&buf[4] = v46;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v42;
                    _os_log_impl(&dword_1A4E92000, v45, OS_LOG_TYPE_DEFAULT, "Setting action %lu for dataclass %{public}@", buf, 0x16u);
                  }

                  objc_msgSend(v55, "setObject:forKey:", v44, v42);
                }

              }
            }
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v60, v78, 16);
          }
          while (v39);
        }

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v47 = (id *)getkAccountDataclassKeyValueSymbolLoc_ptr;
        v81 = (void *)getkAccountDataclassKeyValueSymbolLoc_ptr;
        if (!getkAccountDataclassKeyValueSymbolLoc_ptr)
        {
          v48 = (void *)AccountsLibrary();
          v47 = (id *)dlsym(v48, "kAccountDataclassKeyValue");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v47;
          getkAccountDataclassKeyValueSymbolLoc_ptr = (uint64_t)v47;
        }
        _Block_object_dispose(buf, 8);
        if (v47)
        {
          v49 = *v47;
          objc_msgSend(v54, "setEnabled:forDataclass:", 1, v49);

          break;
        }
        dlerror();
        abort_report_np();
LABEL_68:
        __break(1u);
      }
    }
  }
  kdebug_trace();
  _BYLoggingFacility();
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v50, OS_LOG_TYPE_DEFAULT, "Saving Account...", buf, 2u);
  }

  v51 = (void *)v69[5];
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke;
  v57[3] = &unk_1E4E27950;
  v52 = v53;
  v58 = v52;
  v59 = &v68;
  objc_msgSend(v51, "saveAccount:withDataclassActions:completion:", v54, v55, v57);

  _Block_object_dispose(&v68, 8);
}

void __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  kdebug_trace();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke_2;
  v9[3] = &unk_1E4E27928;
  v13 = a2;
  v10 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __67__BYAppleIDAccountsManager_enableDataClassesForAccount_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  int v4;
  char v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = _BYIsInternalInstall();
    v6 = *(void **)(a1 + 32);
    if ((v5 & 1) != 0 || !v6)
    {
      v8 = 0;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "domain");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v1, objc_msgSend(*(id *)(a1 + 32), "code"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
    }
    *(_DWORD *)buf = 67109378;
    v12 = v4;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Enable dataclasses for account success = %d, error = %{public}@", buf, 0x12u);
    if (v8)
    {

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

- (void)runPostRestoreRenewCredentialsIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (objc_msgSend(v4, "isAuthenticated"))
    {
      _BYLoggingFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v6 = "Post-restore renew unneccessary: primary account already authenticated";
LABEL_7:
        _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    -[BYAppleIDAccountsManager storedLoginContext](self, "storedLoginContext");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject appleID](v5, "appleID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[NSObject rawPassword](v5, "rawPassword");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

LABEL_12:
        _BYLoggingFacility();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v15 = 3;
          _os_log_impl(&dword_1A4E92000, v11, OS_LOG_TYPE_DEFAULT, "Primary account is not authenticated; attempting %ld renews...",
            buf,
            0xCu);
        }

        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __66__BYAppleIDAccountsManager_runPostRestoreRenewCredentialsIfNeeded__block_invoke;
        v13[3] = &unk_1E4E26958;
        v13[4] = self;
        -[BYAppleIDAccountsManager repeatedlyAttemptPostRestoreRenewForAccount:loginContext:numberOfAttemptsAllowed:completion:](self, "repeatedlyAttemptPostRestoreRenewForAccount:loginContext:numberOfAttemptsAllowed:completion:", v4, v5, 3, v13);
        goto LABEL_18;
      }
      -[NSObject continuationKey](v5, "continuationKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        goto LABEL_12;
    }
    _BYLoggingFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v12, OS_LOG_TYPE_DEFAULT, "Unable to perform post-restore renew: login context has no data", buf, 2u);
    }

    goto LABEL_18;
  }
  _BYLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v6 = "Unable to perform post-restore renew; no primary account!";
    goto LABEL_7;
  }
LABEL_18:

}

uint64_t __66__BYAppleIDAccountsManager_runPostRestoreRenewCredentialsIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearStoredLoginContext");
}

- (void)repeatedlyAttemptPostRestoreRenewForAccount:(id)a3 loginContext:(id)a4 numberOfAttemptsAllowed:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = v12;
  if (a5)
  {
    _BYLoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v14, OS_LOG_TYPE_DEFAULT, "Attempting post-restore renew...", buf, 2u);
    }

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke;
    v15[3] = &unk_1E4E279A0;
    v18 = v13;
    v19 = a5;
    v15[4] = self;
    v16 = v10;
    v17 = v11;
    -[BYAppleIDAccountsManager attemptPostRestoreRenewForAccount:loginContext:allowFollowUp:completion:](self, "attemptPostRestoreRenewForAccount:loginContext:allowFollowUp:completion:", v16, v17, a5 == 1, v15);

  }
  else if (v12)
  {
    (*((void (**)(id))v12 + 2))(v12);
  }

}

void __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  dispatch_time_t v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "isAuthenticated"))
  {
    v10 = *(_QWORD *)(a1 + 64);
    v11 = v10 != 0;
    v12 = v10 - 1;
    if (v11)
      v13 = v12;
    else
      v13 = 0;
    _BYLoggingFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a2 || v5)
    {
      if (!v15)
        goto LABEL_16;
      *(_DWORD *)buf = 134218242;
      v32 = a2;
      v33 = 2112;
      v34 = v5;
      v16 = "Renew failed (%ld): %@";
      v17 = v14;
      v18 = 22;
    }
    else
    {
      if (!v15)
        goto LABEL_16;
      *(_WORD *)buf = 0;
      v16 = "Renew succeeded, but we're not authenticated";
      v17 = v14;
      v18 = 2;
    }
    _os_log_impl(&dword_1A4E92000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_16:

    _BYLoggingFacility();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v13 == 1)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        v21 = "Waiting for retry (1 attempt remaining)...";
        v22 = v19;
        v23 = 2;
LABEL_21:
        _os_log_impl(&dword_1A4E92000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
    else if (v20)
    {
      *(_DWORD *)buf = 134217984;
      v32 = v13;
      v21 = "Waiting for retry (%ld attempts remaining)...";
      v22 = v19;
      v23 = 12;
      goto LABEL_21;
    }

    v24 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke_31;
    block[3] = &unk_1E4E27978;
    v25 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v27 = v25;
    v28 = *(id *)(a1 + 48);
    v30 = v13;
    v29 = *(id *)(a1 + 56);
    dispatch_after(v24, MEMORY[0x1E0C80D38], block);

    goto LABEL_23;
  }
  _BYLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4E92000, v8, OS_LOG_TYPE_DEFAULT, "Account is now authenticated!", buf, 2u);
  }

  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(void))(v9 + 16))();
LABEL_23:

}

uint64_t __120__BYAppleIDAccountsManager_repeatedlyAttemptPostRestoreRenewForAccount_loginContext_numberOfAttemptsAllowed_completion___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "repeatedlyAttemptPostRestoreRenewForAccount:loginContext:numberOfAttemptsAllowed:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)attemptPostRestoreRenewForAccount:(id)a3 loginContext:(id)a4 allowFollowUp:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[8];
  _QWORD v20[2];
  _QWORD v21[3];

  v7 = a5;
  v21[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  objc_msgSend(v10, "rawPassword");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v10, "rawPassword");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_aa_setRawPassword:", v13);

  }
  v14 = *MEMORY[0x1E0C8F330];
  v20[0] = *MEMORY[0x1E0C8F320];
  v20[1] = v14;
  v21[0] = MEMORY[0x1E0C9AAB0];
  v21[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  if (v7)
  {
    _BYLoggingFacility();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1A4E92000, v17, OS_LOG_TYPE_DEFAULT, "Posting a followup for post-restore auth assistance", v19, 2u);
    }

    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AARenewShouldPostFollowUp"));
  }
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "renewCredentialsForAccount:options:completion:", v9, v16, v11);

}

- (void)performSilentICDPUpgrade
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[8];
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v17 = 0;
  v18 = (uint64_t)&v17;
  v19 = 0x2050000000;
  v2 = (void *)getCDPContextClass_softClass;
  v20 = (void *)getCDPContextClass_softClass;
  if (!getCDPContextClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = (uint64_t)__getCDPContextClass_block_invoke;
    v14 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E4E26900;
    v15 = (void (*)(uint64_t))&v17;
    __getCDPContextClass_block_invoke((uint64_t)buf);
    v2 = *(void **)(v18 + 24);
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v3, "contextForPrimaryAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    _BYLoggingFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4E92000, v5, OS_LOG_TYPE_DEFAULT, "Will perform silent ICDP upgrade", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v12 = (uint64_t)buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__6;
    v15 = __Block_byref_object_dispose__6;
    v16 = (id)os_transaction_create();
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v6 = (void *)getCDPStateControllerClass_softClass;
    v25 = getCDPStateControllerClass_softClass;
    v7 = MEMORY[0x1E0C809B0];
    if (!getCDPStateControllerClass_softClass)
    {
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = (uint64_t)__getCDPStateControllerClass_block_invoke;
      v20 = &unk_1E4E26900;
      v21 = &v22;
      __getCDPStateControllerClass_block_invoke((uint64_t)&v17);
      v6 = (void *)v23[3];
    }
    v8 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v22, 8);
    v9 = (void *)objc_msgSend([v8 alloc], "initWithContext:", v4);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __52__BYAppleIDAccountsManager_performSilentICDPUpgrade__block_invoke;
    v10[3] = &unk_1E4E279C8;
    v10[4] = buf;
    objc_msgSend(v9, "handleCloudDataProtectionStateWithCompletion:", v10);

    _Block_object_dispose(buf, 8);
  }

}

void __52__BYAppleIDAccountsManager_performSilentICDPUpgrade__block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  void *v4;
  id v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  _BYLoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((_BYIsInternalInstall() & 1) != 0)
    {
      v10 = 0;
      v11 = v8;
    }
    else if (v8)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "domain");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<Error domain: %@, code %ld>"), v4, objc_msgSend(v8, "code"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v11 = 0;
    }
    *(_DWORD *)buf = 67109634;
    v16 = a2;
    v17 = 1024;
    v18 = a3;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_1A4E92000, v9, OS_LOG_TYPE_DEFAULT, "Did perform silent ICDP upgrade: shouldCompleteSignIn %d cloudDataProtectionEnabled %d error %{public}@", buf, 0x18u);
    if (v10)
    {

    }
  }

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = 0;

}

- (id)storedLoginContext
{
  AAStorableLoginContext *storedLoginContext;
  void *v4;
  AAStorableLoginContext *v5;
  AAStorableLoginContext *v6;

  storedLoginContext = self->_storedLoginContext;
  if (!storedLoginContext)
  {
    objc_msgSend(getAALoginContextTransientStorageClass(), "sharedStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storedContext");
    v5 = (AAStorableLoginContext *)objc_claimAutoreleasedReturnValue();
    v6 = self->_storedLoginContext;
    self->_storedLoginContext = v5;

    storedLoginContext = self->_storedLoginContext;
  }
  return storedLoginContext;
}

- (void)clearStoredLoginContext
{
  NSObject *v3;
  void *v4;
  AAStorableLoginContext *storedLoginContext;
  uint8_t v6[16];

  _BYLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A4E92000, v3, OS_LOG_TYPE_DEFAULT, "Clearing stored login context", v6, 2u);
  }

  objc_msgSend(getAALoginContextTransientStorageClass(), "sharedStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clear");

  storedLoginContext = self->_storedLoginContext;
  self->_storedLoginContext = 0;

}

- (void)setAAService:(id)a3
{
  objc_storeStrong((id *)&self->_aaService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aaService, 0);
  objc_storeStrong((id *)&self->_storedLoginContext, 0);
  objc_storeStrong((id *)&self->_appleIDLoginPluginManager, 0);
}

void __123__BYAppleIDAccountsManager_loginDelegateAccountsWithUsername_password_rawPassword_skipiTunes_onlyAppleIDPlugin_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "statusMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "responseParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl(&dword_1A4E92000, a2, OS_LOG_TYPE_DEBUG, "loginResponse: %@, %@, %@", (uint8_t *)&v7, 0x20u);

}

@end
