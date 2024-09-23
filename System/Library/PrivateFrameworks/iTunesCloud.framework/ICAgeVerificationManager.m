@implementation ICAgeVerificationManager

- (BOOL)_bagHasValidKeys:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v13;
  ICAgeVerificationManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "numberForBagKey:", CFSTR("isExplicitContentAgeVerificationRequired"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(v5, "addObject:", CFSTR("isExplicitContentAgeVerificationRequired"));
  objc_msgSend(v4, "stringForBagKey:", CFSTR("ExplicitContentBadgeTreatment"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v5, "addObject:", CFSTR("ExplicitContentBadgeTreatment"));
  objc_msgSend(v4, "urlForBagKey:", CFSTR("korAgeVerificationUrl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v5, "addObject:", CFSTR("korAgeVerificationUrl"));
  v9 = objc_msgSend(v5, "count");
  if (v9)
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134218242;
      v14 = self;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Bag key(s) missing for age verification: %{public}@ - Age Verification not required.", (uint8_t *)&v13, 0x16u);
    }

  }
  return v9 == 0;
}

void __42__ICAgeVerificationManager_defaultManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICAgeVerificationManager _init]([ICAgeVerificationManager alloc], "_init");
  v1 = (void *)defaultManager___sharedManager;
  defaultManager___sharedManager = (uint64_t)v0;

}

- (id)_init
{
  ICAgeVerificationManager *v2;
  ICAgeVerificationManager *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *calloutQueue;
  NSMutableDictionary *v6;
  NSMutableDictionary *ageVerificationStateInternal;
  void *v8;
  int v9;
  NSObject *v10;
  __int16 v12[8];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ICAgeVerificationManager;
  v2 = -[ICAgeVerificationManager init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_create("com.apple.iTunesCloud.ICAgeVerificationManager.concurrentCallout", MEMORY[0x1E0C80D50]);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ageVerificationStateInternal = v3->_ageVerificationStateInternal;
    v3->_ageVerificationStateInternal = v6;

    -[ICAgeVerificationManager _updateAgeVerificationStateAndSendNotification:completion:](v3, "_updateAgeVerificationStateAndSendNotification:completion:", 1, 0);
    -[ICAgeVerificationManager _registerForNotifications](v3, "_registerForNotifications");
    +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInternalBuild");

    if (v9)
    {
      if ((objc_msgSend(MEMORY[0x1E0D4D070], "hasEntitlement:inGroup:", CFSTR("apple"), CFSTR("keychain-access-groups")) & 1) == 0)
      {
        v10 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          v12[0] = 0;
          _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_FAULT, "ICAgeVerificationManager - Missing critical entitlement for age verification: \"apple\" - \"keychain-access-groups\", (uint8_t *)v12, 2u);
        }

      }
    }
  }
  return v3;
}

- (void)_updateAgeVerificationStateAndSendNotification:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAgeVerificationManager _updateAgeVerificationStateForUserIdentity:sendNotification:completion:](self, "_updateAgeVerificationStateForUserIdentity:sendNotification:completion:", v7, v4, v6);

}

- (void)_updateAgeVerificationStateForUserIdentity:(id)a3 sendNotification:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke;
  v12[3] = &unk_1E4389BD0;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[ICAgeVerificationManager _runAgeVerificationForUserIdentity:completion:](self, "_runAgeVerificationForUserIdentity:completion:", v11, v12);

}

- (void)_runAgeVerificationForUserIdentity:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  ICStoreRequestContext *v18;
  uint64_t v19;
  id v20;
  ICStoreRequestContext *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  void (**v26)(id, void *);
  SEL v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint8_t buf[4];
  ICAgeVerificationManager *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v9, "getPropertiesForUserIdentity:error:", v7, &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;

  if (v11)
  {
    v12 = *MEMORY[0x1E0CB2938];
    v37[0] = *MEMORY[0x1E0CB3388];
    v37[1] = v12;
    v38[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error retrieving properties for account %@ during age verification - Age Verification not required."), v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7400, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v32 = self;
      v33 = 2114;
      v34 = v7;
      v35 = 2114;
      v36 = v11;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "ICAgeVerificationManager %p - Error retrieving properties for account %{public}@ during age verification: %{public}@ - Age Verification not required.", buf, 0x20u);
    }

    +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:withError:](ICAgeVerificationState, "ageVerificationStateNotRequiredForUserIdentity:withError:", v7, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v17);

  }
  else
  {
    v18 = [ICStoreRequestContext alloc];
    v19 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke;
    v28[3] = &unk_1E4390188;
    v20 = v7;
    v29 = v20;
    v21 = -[ICStoreRequestContext initWithBlock:](v18, "initWithBlock:", v28);
    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke_2;
    v23[3] = &unk_1E4389BF8;
    v23[4] = self;
    v26 = v8;
    v24 = v20;
    v27 = a2;
    v25 = v10;
    objc_msgSend(v22, "getBagForRequestContext:withCompletionHandler:", v21, v23);

    v14 = v29;
  }

}

- (void)_registerForNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__userIdentityStoreDidChange_, CFSTR("ICUserIdentityStoreDidChangeNotification"), 0);

}

void __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  char v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  double v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  ICAgeVerifier *v47;
  ICAgeVerificationState *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  _QWORD v57[2];
  _QWORD v58[3];

  v58[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = *MEMORY[0x1E0CB2938];
    v57[0] = *MEMORY[0x1E0CB3388];
    v57[1] = v8;
    v58[0] = v6;
    v58[1] = CFSTR("ICAgeVerificationManager - Error retrieving bag during age verification");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7200, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v54 = v12;
      v55 = 2114;
      v56 = (uint64_t)v7;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "ICAgeVerificationManager %p - Error retrieving bag during age verification: %{public}@ - Age Verification not required.", buf, 0x16u);
    }

    v13 = *(_QWORD *)(a1 + 56);
    +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:withError:](ICAgeVerificationState, "ageVerificationStateNotRequiredForUserIdentity:withError:", *(_QWORD *)(a1 + 40), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v14);

    goto LABEL_42;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_bagHasValidKeys:", v5) & 1) != 0)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("ICAgeVerificationManager.m"), 191, CFSTR("Bag should never be nil when no error was provided"));

    }
    objc_msgSend(v5, "stringForBagKey:", CFSTR("ExplicitContentBadgeTreatment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v15 && !objc_msgSend(v15, "caseInsensitiveCompare:", CFSTR("korea")))
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v54 = v20;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Using 19 treatment for explicit content.", buf, 0xCu);
      }

      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v5, "urlForBagKey:", CFSTR("korAgeVerificationUrl"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 48))
    {
      if ((objc_msgSend(v5, "BOOLValueForBagKey:", CFSTR("isExplicitContentAgeVerificationRequired")) & 1) != 0
        || (+[ICDefaults standardDefaults](ICDefaults, "standardDefaults"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v21, "shouldRunAgeVerification"),
            v21,
            (v22 & 1) != 0))
      {
        v23 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          v54 = v24;
          _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Performing age verification", buf, 0xCu);
        }

        +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "shouldRunAgeVerification"))
        {
          objc_msgSend(v25, "ageVerificationExpirationDate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(v26, "copy");

          v28 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v27, "timeIntervalSince1970");
            *(_DWORD *)buf = 138543618;
            v54 = v29;
            v55 = 2048;
            v56 = (uint64_t)v30;
            _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_INFO, "%{public}@ - Expiration date provided from ICDefaults: %{time_t}zd", buf, 0x16u);
          }
        }
        else
        {
          v51 = v16;
          +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "DSID");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 0;
          objc_msgSend(v37, "storeAccountForDSID:error:", v38, &v52);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v52;

          if (v39)
          {
            objc_msgSend(v39, "ic_ageVerificationExpirationDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              v50 = *(_QWORD *)(a1 + 32);
              objc_msgSend(v27, "timeIntervalSince1970");
              *(_DWORD *)buf = 138543618;
              v54 = v50;
              v55 = 2048;
              v56 = (uint64_t)v41;
              _os_log_impl(&dword_1A03E3000, v40, OS_LOG_TYPE_INFO, "%{public}@ - Expiration date provided from ACAccount: %{time_t}zd", buf, 0x16u);
            }
          }
          else
          {
            _ICLogCategoryAgeVerification();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v44 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              v54 = v44;
              v55 = 2114;
              v56 = (uint64_t)v28;
              _os_log_impl(&dword_1A03E3000, v40, OS_LOG_TYPE_ERROR, "%{public}@ - Failed to fetch ageVerificationExpirationDate from ACAccount. error=%{public}@", buf, 0x16u);
            }
            v27 = 0;
          }

          v16 = v51;
        }

        if (!v27)
        {
          v45 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v46 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543362;
            v54 = v46;
            _os_log_impl(&dword_1A03E3000, v45, OS_LOG_TYPE_ERROR, "%{public}@ - AgeVerificationExpiration is nil. Defaulting to expired date.", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -1.0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v47 = -[ICAgeVerifier initWithExpirationDate:]([ICAgeVerifier alloc], "initWithExpirationDate:", v27);
        v48 = -[ICAgeVerificationState initWithUserIdentity:ageVerifier:treatment:verificationURL:]([ICAgeVerificationState alloc], "initWithUserIdentity:ageVerifier:treatment:verificationURL:", *(_QWORD *)(a1 + 40), v47, v16, v10);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

        goto LABEL_41;
      }
      v31 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v42 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 134217984;
        v54 = v42;
        v34 = "ICAgeVerificationManager %p - Age Verification not required.";
        v35 = v31;
        v36 = 12;
        goto LABEL_30;
      }
    }
    else
    {
      v31 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = *(_QWORD *)(a1 + 32);
        v33 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218242;
        v54 = v32;
        v55 = 2114;
        v56 = v33;
        v34 = "ICAgeVerificationManager %p - There are no properties for account %{public}@ - Age Verification not required.";
        v35 = v31;
        v36 = 22;
LABEL_30:
        _os_log_impl(&dword_1A03E3000, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
      }
    }

    v43 = *(_QWORD *)(a1 + 56);
    +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:withTreatment:verificationURL:](ICAgeVerificationState, "ageVerificationStateNotRequiredForUserIdentity:withTreatment:verificationURL:", *(_QWORD *)(a1 + 40), v16, v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v43 + 16))(v43, v27);
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  v17 = *(_QWORD *)(a1 + 56);
  +[ICAgeVerificationState ageVerificationStateNotRequiredForUserIdentity:](ICAgeVerificationState, "ageVerificationStateNotRequiredForUserIdentity:", *(_QWORD *)(a1 + 40));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

LABEL_43:
}

void __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  char v22;
  char v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    v25 = v5;
    v26 = 2114;
    v27 = v3;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_INFO, "ICAgeVerificationManager %p - Obtained new age verification state: %{public}@", buf, 0x16u);
  }

  v6 = *(id *)(a1 + 40);
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "DSIDForUserIdentity:outError:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("NoDSID");
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "ageVerificationStateInternal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v3, "isEqual:", v14) ^ 1;

  objc_msgSend(*(id *)(a1 + 32), "ageVerificationStateInternal");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v3, v12);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(v3, "saveToUserDefaults");
  objc_msgSend(*(id *)(a1 + 32), "calloutQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke_15;
  v19[3] = &unk_1E4389BA8;
  v22 = v15;
  v23 = *(_BYTE *)(a1 + 56);
  v19[4] = *(_QWORD *)(a1 + 32);
  v21 = *(id *)(a1 + 48);

  v20 = v3;
  v18 = v3;
  dispatch_async(v17, v19);

}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (NSMutableDictionary)ageVerificationStateInternal
{
  return self->_ageVerificationStateInternal;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

+ (ICAgeVerificationManager)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_2094);
  return (ICAgeVerificationManager *)(id)defaultManager___sharedManager;
}

void __74__ICAgeVerificationManager__runAgeVerificationForUserIdentity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "setAllowsExpiredBags:", 1);
  objc_msgSend(v3, "setIdentity:", *(_QWORD *)(a1 + 32));
  +[ICClientInfo defaultInfo](ICClientInfo, "defaultInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientInfo:", v4);

  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentityStore:", v5);

}

- (ICAgeVerificationState)ageVerificationState
{
  void *v3;
  void *v4;

  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAgeVerificationManager ageVerificationStateForUserIdentity:](self, "ageVerificationStateForUserIdentity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAgeVerificationState *)v4;
}

- (id)ageVerificationStateForUserIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  ICAgeVerificationManager *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DSIDForUserIdentity:outError:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = CFSTR("NoDSID");
  if (v7)
    v9 = (__CFString *)v7;
  v10 = v9;

  os_unfair_lock_lock(&self->_lock);
  -[ICAgeVerificationManager ageVerificationStateInternal](self, "ageVerificationStateInternal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v12)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_INFO, "ICAgeVerificationManager %p - ageVerificationStateForUserIdentity - Retrieving state [In-memory cache] - State=%@", (uint8_t *)&v16, 0x16u);
    }

  }
  else
  {
    +[ICAgeVerificationState cachedStateForDSID:](ICAgeVerificationState, "cachedStateForDSID:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 134218242;
      v17 = self;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_INFO, "ICAgeVerificationManager %p - ageVerificationStateForUserIdentity - Retrieving state [Disk cache] - Kicking off refresh - State=%@", (uint8_t *)&v16, 0x16u);
    }

    -[ICAgeVerificationManager _updateAgeVerificationStateForUserIdentity:sendNotification:completion:](self, "_updateAgeVerificationStateForUserIdentity:sendNotification:completion:", v4, 1, 0);
  }

  return v12;
}

- (void)getAgeVerificationStateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[ICUserIdentity activeAccount](ICUserIdentity, "activeAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAgeVerificationManager getAgeVerificationStateForUserIdentity:completion:](self, "getAgeVerificationStateForUserIdentity:completion:", v5, v4);

}

- (void)getAgeVerificationStateForUserIdentity:(id)a3 completion:(id)a4
{
  -[ICAgeVerificationManager _updateAgeVerificationStateForUserIdentity:sendNotification:completion:](self, "_updateAgeVerificationStateForUserIdentity:sendNotification:completion:", a3, 0, a4);
}

- (void)_userIdentityStoreDidChange:(id)a3
{
  NSObject *v4;
  int v5;
  ICAgeVerificationManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.amp.iTunesCloud", "AgeVerification");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "ICAgeVerificationManager %p - Received ICUserIdentityStoreDidChangeNotification - Refreshing state for active user", (uint8_t *)&v5, 0xCu);
  }

  -[ICAgeVerificationManager _updateAgeVerificationStateAndSendNotification:completion:](self, "_updateAgeVerificationStateAndSendNotification:completion:", 1, 0);
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (void)setAgeVerificationStateInternal:(id)a3
{
  objc_storeStrong((id *)&self->_ageVerificationStateInternal, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ageVerificationStateInternal, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

uint64_t __99__ICAgeVerificationManager__updateAgeVerificationStateForUserIdentity_sendNotification_completion___block_invoke_15(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(a1 + 57))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICAgeVerificationStateDidChangeNotification"), *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

@end
