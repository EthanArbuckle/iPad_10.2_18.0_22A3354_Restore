@implementation ICUserIdentityStoreACAccountBackend

- (id)activeAccountDSIDWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  void *v9;
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v11 = 0;
  -[ICMonitoredAccountStore activeStoreAccountWithError:](monitoredAccountStore, "activeStoreAccountWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  objc_msgSend(v7, "ic_DSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (id)identityPropertiesForDSID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  ICMonitoredAccountStore *monitoredAccountStore;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v14;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v14 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v7, &v14);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (unint64_t)v14;
  if (v10 | v9)
  {
    v11 = (void *)v10;
    if (v9)
    {
      -[ICUserIdentityStoreACAccountBackend _userIdentityPropertiesForAccount:](self, "_userIdentityPropertiesForAccount:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
LABEL_6:
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v12;
}

- (id)_userIdentityPropertiesForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableDictionary *identityPropertiesCache;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_identityPropertiesCache, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[ICUserIdentityStoreACAccountBackend _newUserIdentityPropertiesForAccount:](self, "_newUserIdentityPropertiesForAccount:", v4);
    identityPropertiesCache = self->_identityPropertiesCache;
    if (!identityPropertiesCache)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
      v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      v9 = self->_identityPropertiesCache;
      self->_identityPropertiesCache = v8;

      identityPropertiesCache = self->_identityPropertiesCache;
    }
    -[NSMutableDictionary setObject:forKey:](identityPropertiesCache, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (id)_newUserIdentityPropertiesForAccount:(id)a3
{
  id v3;
  ICMutableUserIdentityProperties *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;

  v3 = a3;
  v4 = objc_alloc_init(ICMutableUserIdentityProperties);
  objc_msgSend(v3, "ic_altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setAlternateDSID:](v4, "setAlternateDSID:", v5);

  objc_msgSend(v3, "ic_DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setDSID:](v4, "setDSID:", v6);

  objc_msgSend(v3, "ic_firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setFirstName:](v4, "setFirstName:", v7);

  objc_msgSend(v3, "ic_lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setLastName:](v4, "setLastName:", v8);

  -[ICMutableUserIdentityProperties setManagedAppleID:](v4, "setManagedAppleID:", objc_msgSend(v3, "ic_isManagedAppleID"));
  -[ICMutableUserIdentityProperties setSandboxed:](v4, "setSandboxed:", objc_msgSend(v3, "ic_isSandboxed"));
  objc_msgSend(v3, "ic_storefront");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setStorefrontIdentifier:](v4, "setStorefrontIdentifier:", v9);

  -[ICMutableUserIdentityProperties setSubscriptionStatusEnabled:](v4, "setSubscriptionStatusEnabled:", objc_msgSend(v3, "ic_isSubscriptionStatusEnabled"));
  objc_msgSend(v3, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setUsername:](v4, "setUsername:", v10);

  objc_msgSend(v3, "ic_ageVerificationExpirationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setAgeVerificationExpirationDate:](v4, "setAgeVerificationExpirationDate:", v11);

  objc_msgSend(v3, "ic_mergeWithCloudLibraryPreference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setMergeToCloudLibraryPreference:](v4, "setMergeToCloudLibraryPreference:", v12);

  objc_msgSend(v3, "ic_homeUserIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setHomeUserIdentifiers:](v4, "setHomeUserIdentifiers:", v13);

  objc_msgSend(v3, "ic_cloudLibraryStateReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setCloudLibraryStateReason:](v4, "setCloudLibraryStateReason:", v14);

  objc_msgSend(v3, "ic_privateListeningEnabled");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setPrivateListeningEnabled:](v4, "setPrivateListeningEnabled:", v15);

  -[ICMutableUserIdentityProperties setActiveLocker:](v4, "setActiveLocker:", objc_msgSend(v3, "ic_isActiveLockerAccount"));
  -[ICMutableUserIdentityProperties setActive:](v4, "setActive:", objc_msgSend(v3, "isActive"));
  objc_msgSend(v3, "ic_privateListeningEnabledForHomeUsers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setPrivateListeningEnabledForHomeUsers:](v4, "setPrivateListeningEnabledForHomeUsers:", v16);

  objc_msgSend(v3, "ic_privacyAcknowledgementVersions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMutableUserIdentityProperties setPrivacyAcknowledgementVersions:](v4, "setPrivacyAcknowledgementVersions:", v17);

  -[ICMutableUserIdentityProperties setU18MinorAccount:](v4, "setU18MinorAccount:", objc_msgSend(v3, "ic_isU18MinorAccount"));
  objc_msgSend(v3, "accountType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v20)
  {
    -[ICMutableUserIdentityProperties setCloudBackupEnabled:](v4, "setCloudBackupEnabled:", objc_msgSend(v3, "ic_isCloudBackupEnabled"));
    objc_msgSend(v3, "aa_personID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICMutableUserIdentityProperties setICloudPersonID:](v4, "setICloudPersonID:", v21);

  }
  v22 = (void *)-[ICMutableUserIdentityProperties copy](v4, "copy");

  return v22;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)activeLockerAccountDSIDWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  void *v9;
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v11 = 0;
  -[ICMonitoredAccountStore activeStoreAccountWithError:](monitoredAccountStore, "activeStoreAccountWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = 0;
  if (objc_msgSend(v7, "ic_isActiveLockerAccount"))
  {
    objc_msgSend(v7, "ic_DSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (id)localStoreAccountPropertiesWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  id v9;
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v11 = 0;
  -[ICMonitoredAccountStore localStoreAccountWithError:](monitoredAccountStore, "localStoreAccountWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  if (v7)
    v9 = -[ICUserIdentityStoreACAccountBackend _newLocalStoreAccountPropertiesFromAccount:](self, "_newLocalStoreAccountPropertiesFromAccount:", v7);
  else
    v9 = 0;
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (id)_newLocalStoreAccountPropertiesFromAccount:(id)a3
{
  id v3;
  ICMutableLocalStoreAccountProperties *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(ICMutableLocalStoreAccountProperties);
  objc_msgSend(v3, "ic_storefront");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E4391778;
  -[ICMutableLocalStoreAccountProperties setStorefrontIdentifier:](v4, "setStorefrontIdentifier:", v6);

  v7 = (void *)-[ICMutableLocalStoreAccountProperties copy](v4, "copy");
  return v7;
}

- (id)allManageableStoreAccountDSIDsWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v23 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](monitoredAccountStore, "allStoreAccountsWithError:", &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  v9 = 0;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "ic_isManageable", (_QWORD)v19))
          {
            objc_msgSend(v15, "ic_DSID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

  }
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v17 = (void *)objc_msgSend(v9, "copy", (_QWORD)v19);

  return v17;
}

- (void)synchronize
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ICUserIdentityStoreACAccountBackend _synchronize](self, "_synchronize");
  os_unfair_lock_unlock(p_lock);
}

- (void)_synchronize
{
  NSObject *v3;
  NSMutableDictionary *identityPropertiesCache;
  NSNumber *activeAccountDSID;
  ACAccount *primaryICloudAccount;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v8;
  id v9;
  NSNumber *v10;
  NSNumber *v11;
  ICMonitoredAccountStore *v12;
  ACAccount *v13;
  id v14;
  ACAccount *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  ICUserIdentityStoreACAccountBackend *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = self;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Synchronizing with account store", buf, 0xCu);
  }

  identityPropertiesCache = self->_identityPropertiesCache;
  self->_identityPropertiesCache = 0;

  activeAccountDSID = self->_activeAccountDSID;
  self->_activeAccountDSID = 0;

  primaryICloudAccount = self->_primaryICloudAccount;
  self->_primaryICloudAccount = 0;

  monitoredAccountStore = self->_monitoredAccountStore;
  v18 = 0;
  -[ICMonitoredAccountStore activeStoreAccountWithError:](monitoredAccountStore, "activeStoreAccountWithError:", &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v9)
  {
    v10 = (NSNumber *)os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_1A03E3000, &v10->super.super, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize active account, error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v8, "ic_DSID");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v10 = self->_activeAccountDSID;
    self->_activeAccountDSID = v11;
  }

  v12 = self->_monitoredAccountStore;
  v17 = v9;
  -[ICMonitoredAccountStore primaryAppleAccountWithError:](v12, "primaryAppleAccountWithError:", &v17);
  v13 = (ACAccount *)objc_claimAutoreleasedReturnValue();
  v14 = v17;

  v15 = self->_primaryICloudAccount;
  self->_primaryICloudAccount = v13;

  if (v14)
  {
    v16 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v14;
      _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize primary apple account, error=%{public}@", buf, 0x16u);
    }

  }
}

- (id)identityPropertiesForPrimaryICloudAccountWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v12;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v12 = 0;
  -[ICMonitoredAccountStore primaryAppleAccountWithError:](monitoredAccountStore, "primaryAppleAccountWithError:", &v12);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (unint64_t)v12;
  if (v8 | v7)
  {
    v9 = (void *)v8;
    if (v7)
    {
      -[ICUserIdentityStoreACAccountBackend _userIdentityPropertiesForAccount:](self, "_userIdentityPropertiesForAccount:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = 0;
LABEL_6:
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return v10;
}

- (ICUserIdentityStoreACAccountBackend)init
{
  ICUserIdentityStoreACAccountBackend *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *callbackQueue;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accountStoreDelegateQueue;
  uint64_t v9;
  ICMonitoredAccountStore *monitoredAccountStore;
  ICMonitoredAccountStore *v11;
  void *v12;
  NSNumber *v13;
  NSObject *p_super;
  uint64_t v15;
  ICMonitoredAccountStore *v16;
  uint64_t v17;
  NSNumber *v18;
  ACAccount *primaryICloudAccount;
  NSObject *v20;
  NSObject *v21;
  NSNumber *activeAccountDSID;
  ACAccount *v23;
  NSNumber *v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  ICUserIdentityStoreACAccountBackend *v29;
  __int16 v30;
  NSNumber *v31;
  __int16 v32;
  ACAccount *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)ICUserIdentityStoreACAccountBackend;
  v2 = -[ICUserIdentityStoreACAccountBackend init](&v27, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStoreACAccountBackend.callbackQueue", v3);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.iTunesCloud.ICUserIdentityStoreACAccountBackend.accountStoreDelegateQueue", v6);
    accountStoreDelegateQueue = v2->_accountStoreDelegateQueue;
    v2->_accountStoreDelegateQueue = (OS_dispatch_queue *)v7;

    v2->_lock._os_unfair_lock_opaque = 0;
    +[ICMonitoredAccountStore sharedAccountStore](ICMonitoredAccountStore, "sharedAccountStore");
    v9 = objc_claimAutoreleasedReturnValue();
    monitoredAccountStore = v2->_monitoredAccountStore;
    v2->_monitoredAccountStore = (ICMonitoredAccountStore *)v9;

    v11 = v2->_monitoredAccountStore;
    v26 = 0;
    -[ICMonitoredAccountStore activeStoreAccountWithError:](v11, "activeStoreAccountWithError:", &v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSNumber *)v26;
    if (v13)
    {
      p_super = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v2;
        v30 = 2114;
        v31 = v13;
        _os_log_impl(&dword_1A03E3000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize active account, error=%{public}@", buf, 0x16u);
      }
    }
    else
    {
      objc_msgSend(v12, "ic_DSID");
      v15 = objc_claimAutoreleasedReturnValue();
      p_super = &v2->_activeAccountDSID->super.super;
      v2->_activeAccountDSID = (NSNumber *)v15;
    }

    v16 = v2->_monitoredAccountStore;
    v25 = v13;
    -[ICMonitoredAccountStore primaryAppleAccountWithError:](v16, "primaryAppleAccountWithError:", &v25);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v25;

    primaryICloudAccount = v2->_primaryICloudAccount;
    v2->_primaryICloudAccount = (ACAccount *)v17;

    if (v18)
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v29 = v2;
        v30 = 2114;
        v31 = v18;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to initialize primary apple account, error=%{public}@", buf, 0x16u);
      }

    }
    v21 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v2->_primaryICloudAccount;
      activeAccountDSID = v2->_activeAccountDSID;
      *(_DWORD *)buf = 138543874;
      v29 = v2;
      v30 = 2114;
      v31 = activeAccountDSID;
      v32 = 2114;
      v33 = v23;
      _os_log_impl(&dword_1A03E3000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Initialized with active account DSID %{public}@, primaryAppleAccount %{public}@", buf, 0x20u);
    }

    -[ICMonitoredAccountStore registerObserver:](v2->_monitoredAccountStore, "registerObserver:", v2);
  }
  return v2;
}

- (BOOL)updateActiveAccountDSID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  ICMonitoredAccountStore *monitoredAccountStore;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v14;
  id v15;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v15 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v7, &v15);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t)v15;
  if (!(v10 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  if (!v10)
  {
    -[ICMonitoredAccountStore acAccountStore](self->_monitoredAccountStore, "acAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v12 = objc_msgSend(v11, "ic_setActiveStoreAccount:error:", v9, &v14);
    v10 = (uint64_t)v14;

    if (v12)
      -[ICUserIdentityStoreACAccountBackend _synchronize](self, "_synchronize");
  }
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10);

  return v10 == 0;
}

- (BOOL)updateActiveLockerAccountDSID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v15;
  id v16;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v16 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v7, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v16;
  v11 = v10;
  if (v7 && !v10 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!v11)
  {
    -[ICMonitoredAccountStore acAccountStore](self->_monitoredAccountStore, "acAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13 = objc_msgSend(v12, "ic_setActiveLockerAccount:error:", v9, &v15);
    v11 = v15;

    if (v13)
      -[ICUserIdentityStoreACAccountBackend _synchronize](self, "_synchronize");
  }
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v11 == 0;
}

- (BOOL)disableLockerAccountDSID:(id)a3 error:(id *)a4
{
  id v7;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  ICUserIdentityStoreACAccountBackend *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICUserIdentityStoreACAccountBackend.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountDSID != nil"));

  }
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v19 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v7, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_13;
    goto LABEL_11;
  }
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    ICCreateLoggableValueForDSID(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = self;
    v22 = 2112;
    v23 = v13;
    v24 = 2114;
    v25 = v11;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Could not load store account for accountDSID=%@, error=%{public}@", buf, 0x20u);

  }
  if (!v11)
  {
LABEL_11:
    -[ICMonitoredAccountStore acAccountStore](self->_monitoredAccountStore, "acAccountStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v15 = objc_msgSend(v14, "ic_disableActiveLockerAccount:error:", v9, &v18);
    v11 = v18;

    if (v15)
      -[ICUserIdentityStoreACAccountBackend _synchronize](self, "_synchronize");
  }
LABEL_13:
  os_unfair_lock_unlock(&self->_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v11 == 0;
}

- (void)removeIdentityForDSID:(id)a3 completion:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v10;
  id v11;
  NSObject *callbackQueue;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;

  v6 = a4;
  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v23 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v8, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v23;
  if (v11)
  {
    if (v6)
    {
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke;
      block[3] = &unk_1E4390EF8;
      v22 = v6;
      v21 = v11;
      dispatch_async(callbackQueue, block);

      v13 = v22;
LABEL_8:

    }
  }
  else
  {
    if (v10)
    {
      -[ICMonitoredAccountStore acAccountStore](self->_monitoredAccountStore, "acAccountStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_3;
      v16[3] = &unk_1E43908A8;
      v16[4] = self;
      v17 = v6;
      objc_msgSend(v14, "removeAccount:withCompletionHandler:", v10, v16);

      v13 = v17;
      goto LABEL_8;
    }
    if (v6)
    {
      v15 = self->_callbackQueue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_2;
      v18[3] = &unk_1E4390D18;
      v19 = v6;
      dispatch_async(v15, v18);
      v13 = v19;
      goto LABEL_8;
    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (BOOL)replaceIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  ICMonitoredAccountStore *monitoredAccountStore;
  uint64_t v12;
  uint64_t v13;
  ICMonitoredAccountStore *v14;
  NSMutableDictionary *identityPropertiesCache;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v8 = a3;
  p_lock = &self->_lock;
  v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v20 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v10, &v20);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (uint64_t)v20;
  if (!(v13 | v12))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  if (!v13)
  {
    -[ICUserIdentityStoreACAccountBackend _applyIdentityProperties:toAccount:](self, "_applyIdentityProperties:toAccount:", v8, v12);
    v14 = self->_monitoredAccountStore;
    v19 = 0;
    -[ICMonitoredAccountStore saveAccount:error:](v14, "saveAccount:error:", v12, &v19);
    v13 = (uint64_t)v19;
    if (!v13)
    {
      identityPropertiesCache = self->_identityPropertiesCache;
      v16 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend((id)v12, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](identityPropertiesCache, "setObject:forKey:", v16, v17);

      v13 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a5)
    *a5 = objc_retainAutorelease((id)v13);

  return v13 == 0;
}

- (BOOL)setIdentityProperties:(id)a3 forDSID:(id)a4 error:(id *)a5
{
  id v8;
  os_unfair_lock_s *p_lock;
  id v10;
  ICMonitoredAccountStore *monitoredAccountStore;
  uint64_t v12;
  uint64_t v13;
  ICMonitoredAccountStore *v14;
  NSMutableDictionary *identityPropertiesCache;
  void *v16;
  void *v17;
  id v19;
  id v20;

  v8 = a3;
  p_lock = &self->_lock;
  v10 = a4;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v20 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v10, &v20);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = (uint64_t)v20;
  if (!(v13 | v12))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  if (!v13)
  {
    -[ICUserIdentityStoreACAccountBackend _applyIdentityProperties:toAccount:](self, "_applyIdentityProperties:toAccount:", v8, v12);
    v14 = self->_monitoredAccountStore;
    v19 = 0;
    -[ICMonitoredAccountStore saveAccount:error:](v14, "saveAccount:error:", v12, &v19);
    v13 = (uint64_t)v19;
    if (!v13)
    {
      identityPropertiesCache = self->_identityPropertiesCache;
      v16 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend((id)v12, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](identityPropertiesCache, "setObject:forKey:", v16, v17);

      v13 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (a5)
    *a5 = objc_retainAutorelease((id)v13);

  return v13 == 0;
}

- (id)verificationContextForDSID:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  ICMonitoredAccountStore *monitoredAccountStore;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v15 = 0;
  -[ICMonitoredAccountStore storeAccountForDSID:error:](monitoredAccountStore, "storeAccountForDSID:error:", v7, &v15);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (uint64_t)v15;
  if (!(v10 | v9))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7401, 0);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    -[ICMonitoredAccountStore acAccountStore](self->_monitoredAccountStore, "acAccountStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICUserVerificationContext contextWithACAccount:accountStore:](ICUserVerificationContext, "contextWithACAccount:accountStore:", v9, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICUserIdentityStoreACAccountBackend _userIdentityPropertiesForAccount:](self, "_userIdentityPropertiesForAccount:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIdentityProperties:", v13);

  }
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10);

  return v11;
}

- (id)verificationContextForAccountEstablishmentWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v13 = 0;
  -[ICMonitoredAccountStore storeAccountTypeWithError:](monitoredAccountStore, "storeAccountTypeWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = 0;
  if (!v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F298]), "initWithAccountType:", v7);
    -[ICMonitoredAccountStore acAccountStore](self->_monitoredAccountStore, "acAccountStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICUserVerificationContext contextWithACAccount:accountStore:](ICUserVerificationContext, "contextWithACAccount:accountStore:", v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (BOOL)setLocalStoreAccountProperties:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v9;
  id v10;
  ICMonitoredAccountStore *v11;
  id v12;
  id v14;
  id v15;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v15 = 0;
  -[ICMonitoredAccountStore localStoreAccountWithError:](monitoredAccountStore, "localStoreAccountWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    -[ICUserIdentityStoreACAccountBackend _applyLocalStoreAccountProperties:toAccount:](self, "_applyLocalStoreAccountProperties:toAccount:", v6, v9);
    v11 = self->_monitoredAccountStore;
    v14 = v10;
    -[ICMonitoredAccountStore saveAccount:error:](v11, "saveAccount:error:", v9, &v14);
    v12 = v14;

    v10 = v12;
  }
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v10 == 0;
}

- (id)allStoreAccountDSIDsWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v21;
  id *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v27 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](monitoredAccountStore, "allStoreAccountsWithError:", &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = 0;
  if (!v8)
  {
    v22 = a3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v21 = v7;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v15, "ic_DSID", v21);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedLongLongValue");

          if (v17)
          {
            objc_msgSend(v15, "ic_DSID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v12);
    }

    v7 = v21;
    a3 = v22;
  }
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);
  v19 = (void *)objc_msgSend(v9, "copy", v21);

  return v19;
}

- (id)allStoreAccountsWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  void *v9;
  id v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v11 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](monitoredAccountStore, "allStoreAccountsWithError:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = (void *)objc_msgSend(v7, "copy");

  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (id)localStoreAccountWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v19 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](monitoredAccountStore, "allStoreAccountsWithError:", &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = 0;
  if (!v8)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v7;
    v9 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v10);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "ic_isLocalAccount", (_QWORD)v15))
          {
            v9 = v13;
            goto LABEL_12;
          }
        }
        v9 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  os_unfair_lock_unlock(p_lock);
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v9;
}

- (id)storeAccountForDSID:(id)a3 error:(id *)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  ICMonitoredAccountStore *monitoredAccountStore;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v22;
  id *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  monitoredAccountStore = self->_monitoredAccountStore;
  v28 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](monitoredAccountStore, "allStoreAccountsWithError:", &v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v28;
  v11 = 0;
  if (!v10)
  {
    v23 = a4;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v25;
      v22 = v9;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v17, "ic_DSID", v22);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18 == v6)
          {

LABEL_14:
            v11 = v17;
            v9 = v22;
            goto LABEL_15;
          }
          v19 = v18;
          v20 = objc_msgSend(v18, "isEqual:", v6);

          if (v20)
            goto LABEL_14;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        v11 = 0;
        v9 = v22;
        if (v14)
          continue;
        break;
      }
    }
    else
    {
      v11 = 0;
    }
LABEL_15:

    a4 = v23;
  }
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  return v11;
}

- (void)monitoredAccountStore:(id)a3 didAddAccount:(id)a4
{
  id v5;
  NSObject *accountStoreDelegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didAddAccount___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);

}

- (void)monitoredAccountStore:(id)a3 didUpdateAccount:(id)a4
{
  id v5;
  NSObject *accountStoreDelegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didUpdateAccount___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);

}

- (void)monitoredAccountStore:(id)a3 didRemoveAccount:(id)a4
{
  id v5;
  NSObject *accountStoreDelegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didRemoveAccount___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);

}

- (void)monitoredAccountStore:(id)a3 didChangeCredentialsForAccount:(id)a4
{
  id v5;
  NSObject *accountStoreDelegateQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  accountStoreDelegateQueue = self->_accountStoreDelegateQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didChangeCredentialsForAccount___block_invoke;
  v8[3] = &unk_1E4391110;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(accountStoreDelegateQueue, v8);

}

- (void)_notifyDelegateOfBackendChange
{
  id WeakRetained;
  NSObject *callbackQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  ICUserIdentityStoreACAccountBackend *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  callbackQueue = self->_callbackQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ICUserIdentityStoreACAccountBackend__notifyDelegateOfBackendChange__block_invoke;
  v6[3] = &unk_1E4391110;
  v7 = WeakRetained;
  v8 = self;
  v5 = WeakRetained;
  dispatch_async(callbackQueue, v6);

}

- (void)_applyIdentityProperties:(id)a3 toAccount:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a4;
  v5 = a3;
  objc_msgSend(v5, "alternateDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setAltDSID:", v6);

  objc_msgSend(v5, "DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setDSID:", v7);

  objc_msgSend(v5, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setFirstName:", v8);

  objc_msgSend(v5, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setLastName:", v9);

  objc_msgSend(v16, "ic_setManagedAppleID:", objc_msgSend(v5, "isManagedAppleID"));
  objc_msgSend(v16, "ic_setSandboxed:", objc_msgSend(v5, "isSandboxed"));
  objc_msgSend(v5, "storefrontIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setStorefront:", v10);

  objc_msgSend(v16, "ic_setSubscriptionStatusEnabled:", objc_msgSend(v5, "isSubscriptionStatusEnabled"));
  objc_msgSend(v5, "username");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUsername:", v11);

  objc_msgSend(v5, "mergeToCloudLibraryPreference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setMergeWithCloudLibraryPreference:", v12);

  objc_msgSend(v5, "cloudLibraryStateReason");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setCloudLibraryStateReason:", v13);

  objc_msgSend(v5, "privateListeningEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "ic_setPrivateListeningEnabled:", v14);

  v15 = objc_msgSend(v5, "isActiveLocker");
  objc_msgSend(v16, "ic_setActiveLockerAccount:", v15);

}

- (void)_applyLocalStoreAccountProperties:(id)a3 toAccount:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  objc_msgSend(a3, "storefrontIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_setStorefront:", v6);

}

- (ICUserIdentityStoreBackendDelegate)delegate
{
  return (ICUserIdentityStoreBackendDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountStoreDelegateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_activeAccountDSID, 0);
  objc_storeStrong((id *)&self->_primaryICloudAccount, 0);
  objc_storeStrong((id *)&self->_identityPropertiesCache, 0);
  objc_storeStrong((id *)&self->_monitoredAccountStore, 0);
}

uint64_t __69__ICUserIdentityStoreACAccountBackend__notifyDelegateOfBackendChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "userIdentityStoreBackendDidChange:", *(_QWORD *)(a1 + 40));
}

void __92__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didChangeCredentialsForAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      ICCreateLoggableValueForDSID(*(void **)(*(_QWORD *)(a1 + 32) + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v3;
      v18 = 2114;
      v19 = v4;
      v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling credentials-changed notification for iTunes account %{public}@. _activeAccountDSID=%@", (uint8_t *)&v16, 0x20u);

    }
    if ((objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) != 0
      || (+[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "supportsMultipleITunesAccounts"),
          v6,
          (v7 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfBackendChange");
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "accountType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    if (v10)
    {
      v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "ic_description");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ic_description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543874;
        v17 = v12;
        v18 = 2114;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling credentials-changed notification for Apple account %{public}@. _primaryICloudAccount=%@", (uint8_t *)&v16, 0x20u);

      }
      if (objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8])
        && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
      {
        objc_msgSend(0, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v15);
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));

      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
}

void __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didRemoveAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  if (!objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    objc_msgSend(*(id *)(a1 + 40), "accountType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0C8F030]);

    if (v19)
    {
      v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "ic_description");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ic_description");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543874;
        v38 = v21;
        v39 = 2114;
        v40 = v22;
        v41 = 2112;
        v42 = v23;
        _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-removed notification for Apple account %{public}@. _primaryICloudAccount=%@", (uint8_t *)&v37, 0x20u);

      }
      if ((objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]) & 1) == 0)
      {
        v24 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        v25 = *(id *)(a1 + 40);
        v26 = v24;
        if (v25 == v26)
        {

        }
        else
        {
          v27 = v26;
          v28 = objc_msgSend(v25, "isEqual:", v26);

          if (!v28)
            goto LABEL_16;
        }
      }
      v29 = 0;
      v33 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v33 + 24);
      *(_QWORD *)(v33 + 24) = 0;
      goto LABEL_25;
    }
LABEL_16:
    v29 = 0;
    goto LABEL_26;
  }
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ic_description");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    ICCreateLoggableValueForDSID(*(void **)(*(_QWORD *)(a1 + 32) + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 138543874;
    v38 = v3;
    v39 = 2114;
    v40 = v4;
    v41 = 2112;
    v42 = v5;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-removed notification for iTunes account %{public}@. _activeAccountDSID=%@", (uint8_t *)&v37, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) != 0)
    goto LABEL_18;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v8 = v6;
  v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_18;
  }
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqual:", v9);

  if (v11)
  {
LABEL_18:
    v30 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(a1 + 32);
      v37 = 138543362;
      v38 = v31;
      _os_log_impl(&dword_1A03E3000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ The active account was removed", (uint8_t *)&v37, 0xCu);
    }

    v32 = *(_QWORD *)(a1 + 32);
    v14 = *(NSObject **)(v32 + 32);
    *(_QWORD *)(v32 + 32) = 0;
    goto LABEL_21;
  }
  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "supportsMultipleITunesAccounts");

  v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (v15)
    {
      v36 = *(_QWORD *)(a1 + 32);
      v37 = 138543618;
      v38 = v36;
      v39 = 2112;
      v40 = v8;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring removal of account %@", (uint8_t *)&v37, 0x16u);
    }
    v29 = 0;
    goto LABEL_22;
  }
  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v37 = 138543618;
    v38 = v16;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ A non-active account was removed of account %@", (uint8_t *)&v37, 0x16u);
  }
LABEL_21:
  v29 = 1;
LABEL_22:

LABEL_25:
LABEL_26:
  v34 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeObjectForKey:", v35);

  if (v29)
    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfBackendChange");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
}

void __78__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didUpdateAccount___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  uint64_t v40;
  id v41;
  void *v42;
  int v43;
  _BOOL4 v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  id v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  id v61;
  char v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  id v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      ICCreateLoggableValueForDSID(*(void **)(*(_QWORD *)(a1 + 32) + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v4;
      v77 = 2114;
      v78 = v5;
      v79 = 2112;
      v80 = v6;
      _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-updated notification for iTunes account %{public}@. _activeAccountDSID=%@", buf, 0x20u);

    }
    if (!objc_msgSend(v2, "unsignedLongLongValue")
      && !objc_msgSend(*(id *)(a1 + 40), "ic_isLocalAccount"))
    {
      v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v48 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v76 = v48;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring change to account with no DSID", buf, 0xCu);
      }
LABEL_58:
      v26 = 0;
LABEL_59:

      goto LABEL_66;
    }
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) != 0)
    {
LABEL_9:
      if (objc_msgSend(*(id *)(a1 + 40), "isActive"))
      {
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
        v14 = v2;
        v15 = v13;
        if (v14 == v15)
        {

        }
        else
        {
          v16 = v15;
          v17 = objc_msgSend(v14, "isEqual:", v15);

          if ((v17 & 1) == 0)
          {
            v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              v19 = *(_QWORD *)(a1 + 32);
              ICCreateLoggableValueForDSID(*(void **)(v19 + 32));
              v20 = (id)objc_claimAutoreleasedReturnValue();
              ICCreateLoggableValueForDSID(v14);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v76 = v19;
              v77 = 2112;
              v78 = v20;
              v79 = 2112;
              v80 = v21;
              _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected active iTunes account changing from %@ --> %@", buf, 0x20u);

            }
            v22 = *(_QWORD *)(a1 + 32);
            v23 = *(_QWORD *)(v22 + 32);
            if (v23)
            {
              v24 = *(void **)(v22 + 8);
              v74 = 0;
              objc_msgSend(v24, "storeAccountForDSID:error:", v23, &v74);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = v74;
              if (v25)
              {
                v27 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
                objc_msgSend(v25, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "removeObjectForKey:", v28);

              }
              v22 = *(_QWORD *)(a1 + 32);
            }
            else
            {
              v26 = 0;
            }
            objc_msgSend(*(id *)(v22 + 16), "removeObjectForKey:", v7);
            v71 = *(_QWORD *)(a1 + 32);
            v72 = v14;
            v56 = *(id *)(v71 + 32);
            *(_QWORD *)(v71 + 32) = v72;
            goto LABEL_65;
          }
        }
      }
      if ((objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 40), "ic_isLocalAccount") & 1) != 0
        || (+[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo"),
            v57 = (void *)objc_claimAutoreleasedReturnValue(),
            v58 = objc_msgSend(v57, "supportsMultipleITunesAccounts"),
            v57,
            v58))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", v7);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v7);
        objc_msgSend(*(id *)(a1 + 32), "_userIdentityPropertiesForAccount:", *(_QWORD *)(a1 + 40));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v59;
        v61 = v60;
        if (v56 == v61)
        {

        }
        else
        {
          v62 = objc_msgSend(v56, "isEqual:", v61);

          if ((v62 & 1) == 0)
          {
            v63 = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              v64 = *(_QWORD *)(a1 + 32);
              ICCreateLoggableValueForDSID(v2);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v76 = v64;
              v77 = 2112;
              v78 = v65;
              _os_log_impl(&dword_1A03E3000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected properties change for account %@", buf, 0x16u);

            }
            v26 = 0;
            goto LABEL_65;
          }
        }
        v66 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          v67 = *(_QWORD *)(a1 + 32);
          ICCreateLoggableValueForDSID(v2);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v67;
          v77 = 2112;
          v78 = v68;
          _os_log_impl(&dword_1A03E3000, v66, OS_LOG_TYPE_DEFAULT, "%{public}@ Account %@ changed but properties remain the same - ignoring", buf, 0x16u);

        }
      }
      else
      {
        v69 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          v70 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v76 = v70;
          _os_log_impl(&dword_1A03E3000, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring change to account", buf, 0xCu);
        }

      }
      goto LABEL_58;
    }
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v9 = v2;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if (!v12)
        goto LABEL_9;
    }
    v52 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v53 = *(_QWORD *)(a1 + 32);
      ICCreateLoggableValueForDSID(*(void **)(v53 + 32));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v53;
      v77 = 2112;
      v78 = v54;
      _os_log_impl(&dword_1A03E3000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected active iTunes account changing from %@ --> nil", buf, 0x16u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v7);
    v26 = 0;
LABEL_44:
    v55 = *(_QWORD *)(a1 + 32);
    v56 = *(id *)(v55 + 32);
    *(_QWORD *)(v55 + 32) = 0;
LABEL_65:

    objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfBackendChange");
    goto LABEL_66;
  }
  if (!v2)
    goto LABEL_21;
  v29 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v30 = v2;
  v31 = v29;
  if (v30 == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = objc_msgSend(v30, "isEqual:", v31);

    if (!v33)
    {
LABEL_21:
      v26 = 0;
      goto LABEL_24;
    }
  }
  v34 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v73 = 0;
  objc_msgSend(v34, "storeAccountForDSID:error:", v30, &v73);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v73;

  if (!v35)
  {
    v49 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = *(_QWORD *)(a1 + 32);
      ICCreateLoggableValueForDSID(*(void **)(v50 + 32));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v50;
      v77 = 2112;
      v78 = v51;
      _os_log_impl(&dword_1A03E3000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected active iTunes account is no longer an iTunes account at all. Active iTunes account changing from %@ --> nil", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v7);
    goto LABEL_44;
  }
LABEL_24:
  objc_msgSend(*(id *)(a1 + 40), "accountType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "identifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v38)
  {
    v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      v41 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ic_description");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v76 = v40;
      v77 = 2114;
      v78 = v41;
      v79 = 2112;
      v80 = v42;
      _os_log_impl(&dword_1A03E3000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-updated notification for Apple account %{public}@. _primaryICloudAccount=%@", buf, 0x20u);

    }
    v43 = objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v44 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v43)
    {
      if (v44)
      {
        v45 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v76 = v45;
        _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Detected change to primary apple account", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v7);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    }
    else if (v44)
    {
      v46 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v76 = v46;
      v77 = 2114;
      v78 = v47;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Ignoring change to non-primary apple account %{public}@", buf, 0x16u);

    }
    goto LABEL_59;
  }
LABEL_66:

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
}

void __75__ICUserIdentityStoreACAccountBackend_monitoredAccountStore_didAddAccount___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  if (objc_msgSend(*(id *)(a1 + 40), "ic_isITunesAccount"))
  {
    v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      ICCreateLoggableValueForDSID(*(void **)(*(_QWORD *)(a1 + 32) + 32));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v3;
      v22 = 2114;
      v23 = v4;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-added notification for iTunes account %{public}@. _activeAccountDSID=%@", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "ic_DSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "unsignedLongLongValue")
      || (objc_msgSend(*(id *)(a1 + 40), "isActive") & 1) == 0
      && (+[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "supportsMultipleITunesAccounts"),
          v7,
          !v8))
    {

      goto LABEL_19;
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isActive"))
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v6);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);
    goto LABEL_17;
  }
  objc_msgSend(*(id *)(a1 + 40), "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F030]);

  if (v13)
  {
    v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "ic_description");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "ic_description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v15;
      v22 = 2114;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_1A03E3000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling account-added notification for Apple account %{public}@. _primaryICloudAccount=%@", (uint8_t *)&v20, 0x20u);

    }
    if (objc_msgSend(*(id *)(a1 + 40), "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v6);
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(id *)(a1 + 40);
      v10 = *(void **)(v18 + 24);
      *(_QWORD *)(v18 + 24) = v19;
LABEL_17:

      objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateOfBackendChange");
    }
  }
LABEL_19:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
}

uint64_t __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(a1 + 32), "_synchronize");
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_4;
    block[3] = &unk_1E4390B70;
    v10 = v6;
    v11 = a2;
    v9 = v5;
    dispatch_async(v7, block);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));

}

uint64_t __72__ICUserIdentityStoreACAccountBackend_removeIdentityForDSID_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
