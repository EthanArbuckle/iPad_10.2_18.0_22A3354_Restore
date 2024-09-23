@implementation ICPrivacyInfo

- (BOOL)privacyAcknowledgementRequiredForMedia
{
  return -[ICPrivacyInfo privacyAcknowledgementRequiredForMusic](self, "privacyAcknowledgementRequiredForMusic")
      && -[ICPrivacyInfo privacyAcknowledgementRequiredForIdentifier:](self, "privacyAcknowledgementRequiredForIdentifier:", CFSTR("TV"))&& -[ICPrivacyInfo privacyAcknowledgementRequiredForIdentifier:](self, "privacyAcknowledgementRequiredForIdentifier:", CFSTR("Books"));
}

+ (ICPrivacyInfo)sharedPrivacyInfo
{
  void *v2;
  void *v3;

  +[ICUserIdentity autoupdatingActiveAccount](ICUserIdentity, "autoupdatingActiveAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:](ICPrivacyInfo, "sharedPrivacyInfoForUserIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICPrivacyInfo *)v3;
}

+ (id)sharedPrivacyInfoForUserIdentity:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  ICPrivacyInfo *v6;
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "ICPrivacyInfo: nil identity passed into sharedPrivacyInfoForUserIdentity!", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D4D030], "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE48], CFSTR("Bug"), CFSTR("ICPRivacyInfo"), CFSTR("nil identity passed into sharedPrivacyInfoForUserIdentity"), &stru_1E4391778, 0, 0);
    +[ICUserIdentity autoupdatingActiveAccount](ICUserIdentity, "autoupdatingActiveAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (sharedPrivacyInfoForUserIdentity__sOnceToken != -1)
    dispatch_once(&sharedPrivacyInfoForUserIdentity__sOnceToken, &__block_literal_global_22925);
  os_unfair_lock_lock((os_unfair_lock_t)&sharedPrivacyInfoForUserIdentity__sSharedPrivacyInfoLock);
  objc_msgSend((id)sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount, "objectForKey:", v4);
  v6 = (ICPrivacyInfo *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[ICPrivacyInfo initWithIdentity:]([ICPrivacyInfo alloc], "initWithIdentity:", v4);
    objc_msgSend((id)sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount, "setObject:forKey:", v6, v4);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedPrivacyInfoForUserIdentity__sSharedPrivacyInfoLock);

  return v6;
}

- (BOOL)privacyAcknowledgementRequiredForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  const __CFString *v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch(ICSystemApplicationTypeForBundleIdentifier(v4))
    {
      case -1:
      case 0:
        break;
      case 1:
        v8 = CFSTR("TV");
        goto LABEL_9;
      case 2:
        v8 = CFSTR("Books");
        goto LABEL_9;
      case 3:
        v8 = CFSTR("Podcasts");
        goto LABEL_9;
      case 4:
        v8 = CFSTR("AppStore");
LABEL_9:
        v6 = -[ICPrivacyInfo privacyAcknowledgementRequiredForIdentifier:](self, "privacyAcknowledgementRequiredForIdentifier:", v8);
        goto LABEL_10;
      default:
        v7 = 0;
        goto LABEL_11;
    }
  }
  v6 = -[ICPrivacyInfo privacyAcknowledgementRequiredForMusic](self, "privacyAcknowledgementRequiredForMusic");
LABEL_10:
  v7 = v6;
LABEL_11:

  return v7;
}

- (BOOL)privacyAcknowledgementRequiredForMusic
{
  return -[ICPrivacyInfo privacyAcknowledgementRequiredForIdentifier:](self, "privacyAcknowledgementRequiredForIdentifier:", CFSTR("Music"));
}

- (BOOL)privacyAcknowledgementRequiredForIdentifier:(id)a3
{
  ICPrivacyInfo *v3;
  os_unfair_lock_s *p_lock;
  id v5;

  v3 = self;
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  LOBYTE(v3) = -[ICPrivacyInfo _privacyAcknowledgementRequiredForIdentifier:](v3, "_privacyAcknowledgementRequiredForIdentifier:", v5);

  os_unfair_lock_unlock(p_lock);
  return (char)v3;
}

- (BOOL)_privacyAcknowledgementRequiredForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *cache;
  void *v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_cache, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
    }
    else
    {
      v7 = -[ICPrivacyInfo _queryPrivacyAcknowledgementRequiredForIdentifier:](self, "_queryPrivacyAcknowledgementRequiredForIdentifier:", v4);
      cache = self->_cache;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](cache, "setObject:forKey:", v9, v4);

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (ICPrivacyInfo)initWithIdentity:(id)a3
{
  id v5;
  ICPrivacyInfo *v6;
  ICPrivacyInfo *v7;
  uint64_t v8;
  NSMutableDictionary *cache;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICPrivacyInfo;
  v6 = -[ICPrivacyInfo init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userIdentity, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 5);
    v8 = objc_claimAutoreleasedReturnValue();
    cache = v7->_cache;
    v7->_cache = (NSMutableDictionary *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__handleUserIdentityStoreDidChangeNotification_, CFSTR("ICUserIdentityStoreDidChangeNotification"), 0);

  }
  return v7;
}

- (BOOL)_queryPrivacyAcknowledgementRequiredForIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  int v16;
  ICPrivacyInfo *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Music"))
    && (+[ICDefaults standardDefaults](ICDefaults, "standardDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isPrivacyAcknowledgementDisabledForMusic"),
        v5,
        v6))
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring privacy acknowledgement for %{public}@ because -[ICDefaults isPrivacyAcknowledgementDisabledForMusic] returned YES.", (uint8_t *)&v16, 0x16u);
    }
    LOBYTE(v8) = 0;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Music"))
         && (+[ICDefaults standardDefaults](ICDefaults, "standardDefaults"),
             v9 = (void *)objc_claimAutoreleasedReturnValue(),
             v10 = objc_msgSend(v9, "shouldForcePrivacyAcknowledgementRequiredForMusic"),
             v9,
             v10))
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v4;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Forcing privacy acknowledgement needed for %{public}@ because -[ICDefaults shouldForcePrivacyAcknowledgementRequiredForMusic] returned YES.", (uint8_t *)&v16, 0x16u);
    }
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_onboardingKitPrivacyIdentifierForPrivacyIdentifier:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[ICPrivacyInfo _accountForPrivacyInfo](self, "_accountForPrivacyInfo");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543874;
        v17 = self;
        v18 = 2114;
        v19 = v4;
        v20 = 2114;
        v21 = v11;
        _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Checking if privacy acknowledgement required for %{public}@ using account %{public}@.", (uint8_t *)&v16, 0x20u);
      }

      if (v11)
        v13 = objc_msgSend(MEMORY[0x1E0CFD9C0], "acknowledgementNeededForPrivacyIdentifier:account:", v7, v11);
      else
        v13 = objc_msgSend(MEMORY[0x1E0CFD9C0], "acknowledgementNeededForPrivacyIdentifier:", v7);
      v8 = v13;

    }
    else
    {
      v8 = 0;
    }
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138544130;
      v17 = self;
      v18 = 2114;
      v19 = v4;
      v20 = 2114;
      v21 = v7;
      v22 = 1024;
      v23 = v8;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Privacy acknowledgement required for %{public}@ (%{public}@)? %{BOOL}u.", (uint8_t *)&v16, 0x26u);
    }

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p: [%@]>"), objc_opt_class(), self, self->_userIdentity);
}

void __50__ICPrivacyInfo_sharedPrivacyInfoForUserIdentity___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount;
  sharedPrivacyInfoForUserIdentity__sPrivacyInfoPerAccount = v0;

  sharedPrivacyInfoForUserIdentity__sSharedPrivacyInfoLock = 0;
}

- (id)beginObservingPrivacyAcknowledgementForIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *observers;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  ICPrivacyInfo *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = (void *)objc_msgSend(v7, "copy");
  v11 = (void *)MEMORY[0x1A1AFA8D0]();
  objc_msgSend(v9, "setObject:forKey:", v11, v8);

  observers = self->_observers;
  if (!observers)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = self->_observers;
    self->_observers = v13;

    observers = self->_observers;
  }
  -[NSMutableDictionary setObject:forKey:](observers, "setObject:forKey:", v9, v6);
  if (objc_msgSend(v9, "count") == 1)
  {
    -[ICPrivacyInfo _privacyAcknowledgementRequiredForIdentifier:](self, "_privacyAcknowledgementRequiredForIdentifier:", v6);
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning to observe privacy acknowledgement for %{public}@.", (uint8_t *)&v18, 0x16u);
    }

  }
  v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543874;
    v19 = self;
    v20 = 2114;
    v21 = v6;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Registered new observer of privacy acknowledgement for %{public}@ with token: %{public}@.", (uint8_t *)&v18, 0x20u);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v8;
}

- (ICPrivacyInfo)init
{
  void *v3;
  ICPrivacyInfo *v4;

  +[ICUserIdentity autoupdatingActiveAccount](ICUserIdentity, "autoupdatingActiveAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICPrivacyInfo initWithIdentity:](self, "initWithIdentity:", v3);

  return v4;
}

- (BOOL)preflightDisclosureRequiredForMusic
{
  void *v3;

  ICBundleIdentifierForSystemApplicationType(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ICPrivacyInfo preflightDisclosureRequiredForBundleIdentifier:](self, "preflightDisclosureRequiredForBundleIdentifier:", v3);

  return (char)self;
}

- (BOOL)preflightDisclosureRequiredForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  os_unfair_lock_s *p_lock;
  PDCPreflightManager *preflightManager;
  void *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  PDCPreflightManager **p_preflightManager;
  PDCPreflightManager *v15;
  char v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);
  objc_msgSend(v5, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");

  if ((v7 & 1) != 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    preflightManager = self->_preflightManager;
    if (!preflightManager)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v10 = (void *)getPDCPreflightManagerClass_softClass;
      v22 = getPDCPreflightManagerClass_softClass;
      if (!getPDCPreflightManagerClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getPDCPreflightManagerClass_block_invoke;
        v24 = &unk_1E4391138;
        v25 = &v19;
        __getPDCPreflightManagerClass_block_invoke((uint64_t)buf);
        v10 = (void *)v20[3];
      }
      v11 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v19, 8);
      v12 = [v11 alloc];
      v13 = objc_msgSend(v12, "initWithTargetQueue:", 0, v19);
      v15 = self->_preflightManager;
      p_preflightManager = &self->_preflightManager;
      *p_preflightManager = (PDCPreflightManager *)v13;

      preflightManager = *p_preflightManager;
    }
    v16 = -[PDCPreflightManager requiresPreflightForApplicationRecord:](preflightManager, "requiresPreflightForApplicationRecord:", v5);
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_ERROR, "%{public}@ Invalid [LSApplicationRecord applicationState] for bundleID: %{public}@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

- (void)acknowledgePrivacyPolicyForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  void (**v22)(id, _QWORD, uint64_t);
  uint8_t buf[4];
  ICPrivacyInfo *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, uint64_t))a4;
  objc_msgSend((id)objc_opt_class(), "_onboardingKitPrivacyIdentifierForPrivacyIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v7)
      goto LABEL_15;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7002, 0);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v18 = (void *)v17;
    v7[2](v7, 0, v17);

    goto LABEL_15;
  }
  +[ICSecurityInfo sharedSecurityInfo](ICSecurityInfo, "sharedSecurityInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDeviceUnlocked");

  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v8;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Acknowledging privacy policy for %{public}@ (%{public}@)...", buf, 0x20u);
    }

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Music")))
    {
      +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldForcePrivacyAcknowledgementRequiredForMusic:", 0);

    }
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9C0]), "initWithPrivacyIdentifier:", v8);
    -[ICPrivacyInfo _accountForPrivacyInfo](self, "_accountForPrivacyInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccount:", v15);

    objc_msgSend(v14, "acknowledgePrivacy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__ICPrivacyInfo_acknowledgePrivacyPolicyForIdentifier_completionHandler___block_invoke;
    v19[3] = &unk_1E438E350;
    v19[4] = self;
    v20 = v6;
    v21 = v8;
    v22 = v7;
    objc_msgSend(v16, "addFinishBlock:", v19);

    goto LABEL_15;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    v24 = self;
    v25 = 2114;
    v26 = v6;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to acknowledge privacy policy for %{public}@ (%{public}@) because device is locked", buf, 0x20u);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7006, CFSTR("Acknowledging privacy policy requires the device to be unlocked"));
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_15:

}

- (void)endObservingPrivacyAcknowledgementForIdentifier:(id)a3 withToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSMutableDictionary *observers;
  int v12;
  ICPrivacyInfo *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_observers, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v7);
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543874;
    v13 = self;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Removed observer of privacy acknowledgement for %{public}@ with token: %{public}@.", (uint8_t *)&v12, 0x20u);
  }

  if (!objc_msgSend(v8, "count"))
  {
    -[NSMutableDictionary removeObjectForKey:](self->_observers, "removeObjectForKey:", v6);
    v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = self;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopped observing privacy acknowledgement for %{public}@.", (uint8_t *)&v12, 0x16u);
    }

    if (!-[NSMutableDictionary count](self->_observers, "count"))
    {
      observers = self->_observers;
      self->_observers = 0;

    }
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateForPrivacyAcknowledgementChanged
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *observers;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  ICPrivacyInfo *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__22861;
  v20 = __Block_byref_object_dispose__22862;
  v21 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_cache, "copy");
  -[NSMutableDictionary removeAllObjects](self->_cache, "removeAllObjects");
  v5 = MEMORY[0x1E0C809B0];
  observers = self->_observers;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke;
  v13[3] = &unk_1E438D998;
  v13[4] = self;
  v7 = v4;
  v14 = v7;
  v15 = &v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observers, "enumerateKeysAndObjectsUsingBlock:", v13);
  if (objc_msgSend((id)v17[5], "count"))
    v8 = (void *)-[NSMutableDictionary copy](self->_cache, "copy");
  else
    v8 = 0;

  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend((id)v17[5], "count"))
  {
    v9 = (void *)v17[5];
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_2;
    v10[3] = &unk_1E438D9E8;
    v11 = v8;
    v12 = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  _Block_object_dispose(&v16, 8);

}

- (id)_accountForPrivacyInfo
{
  void *v3;
  ICUserIdentity *userIdentity;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  ICUserIdentity *v10;
  id v12;
  id v13;
  uint8_t buf[4];
  ICPrivacyInfo *v15;
  __int16 v16;
  ICUserIdentity *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  userIdentity = self->_userIdentity;
  v13 = 0;
  objc_msgSend(v3, "DSIDForUserIdentity:outError:", userIdentity, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v8, "storeAccountForDSID:error:", v5, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;

    if (!v6)
      goto LABEL_7;
  }
  v9 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = self->_userIdentity;
    *(_DWORD *)buf = 138543874;
    v15 = self;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v6;
    _os_log_impl(&dword_1A03E3000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to load account for identity %{public}@. err = %{public}@.", buf, 0x20u);
  }

LABEL_7:
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

void __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_privacyAcknowledgementRequiredForIdentifier:", v14);
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v14);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v14);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

LABEL_7:
    goto LABEL_8;
  }
  v8 = v7;
  v9 = objc_msgSend(v6, "isEqual:", v7);

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    v6 = (id)objc_msgSend(v5, "copy");
    objc_msgSend(v10, "setObject:forKey:", v6, v14);
    goto LABEL_7;
  }
LABEL_8:

}

void __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  _QWORD v11[5];
  id v12;
  char v13;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_3;
  v11[3] = &unk_1E438D9C0;
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v5;
  v13 = v9;
  v10 = v5;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __56__ICPrivacyInfo__updateForPrivacyAcknowledgementChanged__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(unsigned __int8 *)(a1 + 48);
    v11 = 138544130;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v5;
    v17 = 1024;
    v18 = v10;
    _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Invoking observation handler for %{public}@ with token %{public}@. isPrivacyAcknowledgementRequired = %{BOOL}u.", (uint8_t *)&v11, 0x26u);
  }

  (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __73__ICPrivacyInfo_acknowledgePrivacyPolicyForIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v18 = 138544386;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    v24 = 1024;
    v25 = a2;
    v26 = 2114;
    v27 = v5;
    v10 = "%{public}@: Failed to acknowledge privacy policy for %{public}@ (%{public}@). didSucceed = %{BOOL}u, error = %{public}@.";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 48;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v18 = 138543618;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v10 = "%{public}@: Successfully completed privacy policy acknowledgement for %{public}@.";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 22;
  }
  _os_log_impl(&dword_1A03E3000, v11, v12, v10, (uint8_t *)&v18, v13);
LABEL_8:

  objc_msgSend(*(id *)(a1 + 32), "_updateForPrivacyAcknowledgementChanged");
  v17 = *(_QWORD *)(a1 + 56);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, a2, v5);

}

+ (id)_onboardingKitPrivacyIdentifierForPrivacyIdentifier:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id result;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Music")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("TV")))
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v4 = (id *)getOBPrivacyTVAppIdentifierSymbolLoc_ptr;
      v18 = getOBPrivacyTVAppIdentifierSymbolLoc_ptr;
      if (!getOBPrivacyTVAppIdentifierSymbolLoc_ptr)
      {
        v8 = OnBoardingKitLibrary();
        v4 = (id *)dlsym(v8, "OBPrivacyTVAppIdentifier");
        v16[3] = (uint64_t)v4;
        getOBPrivacyTVAppIdentifierSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v15, 8);
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyTVAppIdentifier(void)");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ICPrivacyInfo.m"), 47, CFSTR("%s"), dlerror());
        goto LABEL_34;
      }
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Books")))
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v4 = (id *)getOBPrivacyiBooksIdentifierSymbolLoc_ptr;
      v18 = getOBPrivacyiBooksIdentifierSymbolLoc_ptr;
      if (!getOBPrivacyiBooksIdentifierSymbolLoc_ptr)
      {
        v9 = OnBoardingKitLibrary();
        v4 = (id *)dlsym(v9, "OBPrivacyiBooksIdentifier");
        v16[3] = (uint64_t)v4;
        getOBPrivacyiBooksIdentifierSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v15, 8);
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyiBooksIdentifier(void)");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ICPrivacyInfo.m"), 48, CFSTR("%s"), dlerror());
        goto LABEL_34;
      }
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Podcasts")))
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v4 = (id *)getOBPrivacyPodcastsIdentifierSymbolLoc_ptr;
      v18 = getOBPrivacyPodcastsIdentifierSymbolLoc_ptr;
      if (!getOBPrivacyPodcastsIdentifierSymbolLoc_ptr)
      {
        v10 = OnBoardingKitLibrary();
        v4 = (id *)dlsym(v10, "OBPrivacyPodcastsIdentifier");
        v16[3] = (uint64_t)v4;
        getOBPrivacyPodcastsIdentifierSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v15, 8);
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyPodcastsIdentifier(void)");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ICPrivacyInfo.m"), 49, CFSTR("%s"), dlerror());
        goto LABEL_34;
      }
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("AppStore")))
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("FitnessPlus")))
        {
          getOBPrivacyFitnessPlusIdentifier();
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v3, "isEqualToString:", CFSTR("ImproveFitnessPlus")))
          {
            v13 = 0;
            goto LABEL_27;
          }
          getOBPrivacyImproveFitnessPlusIdentifier();
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
LABEL_26:
        v13 = v12;
LABEL_27:

        return v13;
      }
      v15 = 0;
      v16 = &v15;
      v17 = 0x2020000000;
      v4 = (id *)getOBPrivacyAppStoreIdentifierSymbolLoc_ptr;
      v18 = getOBPrivacyAppStoreIdentifierSymbolLoc_ptr;
      if (!getOBPrivacyAppStoreIdentifierSymbolLoc_ptr)
      {
        v11 = OnBoardingKitLibrary();
        v4 = (id *)dlsym(v11, "OBPrivacyAppStoreIdentifier");
        v16[3] = (uint64_t)v4;
        getOBPrivacyAppStoreIdentifierSymbolLoc_ptr = (uint64_t)v4;
      }
      _Block_object_dispose(&v15, 8);
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyAppStoreIdentifier(void)");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ICPrivacyInfo.m"), 50, CFSTR("%s"), dlerror());
        goto LABEL_34;
      }
    }
LABEL_25:
    v12 = *v4;
    goto LABEL_26;
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v4 = (id *)getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr;
  v18 = getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr;
  if (!getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr)
  {
    v5 = OnBoardingKitLibrary();
    v4 = (id *)dlsym(v5, "OBPrivacyAppleMusicIdentifier");
    v16[3] = (uint64_t)v4;
    getOBPrivacyAppleMusicIdentifierSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v15, 8);
  if (v4)
    goto LABEL_25;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getOBPrivacyAppleMusicIdentifier(void)");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("ICPrivacyInfo.m"), 46, CFSTR("%s"), dlerror());
LABEL_34:

  __break(1u);
  return result;
}

@end
