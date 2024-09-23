@implementation ICMonitoredAccountStore

uint64_t __55__ICMonitoredAccountStore_activeStoreAccountWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

- (id)allStoreAccountsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[ICMonitoredAccountStore _registerAndLoadAccountsIfNecessary](self, "_registerAndLoadAccountsIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
    if (a3)
LABEL_3:
      *a3 = objc_retainAutorelease(v5);
  }
  else
  {
    -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v14, "ic_isITunesAccount", (_QWORD)v15))
            objc_msgSend(v6, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (a3)
      goto LABEL_3;
  }

  return v6;
}

- (id)_registerAndLoadAccountsIfNecessary
{
  os_unfair_lock_s *p_lock;
  ACMonitoredAccountStore *accountStore;
  void *v5;
  void *v7;
  ACMonitoredAccountStore *v8;
  ACMonitoredAccountStore *v9;
  NSObject *v10;
  NSObject *v11;
  ACMonitoredAccountStore *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  ICMonitoredAccountStore *v29;
  os_unfair_lock_s *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  ICMonitoredAccountStore *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_canAccessAccountStore") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7013, CFSTR("Client is not entitled to access account store"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  accountStore = self->_accountStore;
  if (accountStore)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *MEMORY[0x1E0C8F170]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_canAccessAppleAccounts"))
      objc_msgSend(v7, "addObject:", *MEMORY[0x1E0C8F030]);
    v8 = (ACMonitoredAccountStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2D8]), "initWithAccountTypes:delegate:", v7, self);
    v9 = self->_accountStore;
    self->_accountStore = v8;

    if (self->_accountStore)
    {
      v5 = 0;
    }
    else
    {
      v10 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = self;
        _os_log_impl(&dword_1A03E3000, v10, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create insance of account store", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:debugDescription:", CFSTR("ICError"), -7407, CFSTR("Failed to create insance of account store"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    accountStore = self->_accountStore;
    if (!accountStore)
      goto LABEL_38;
  }
  -[ACMonitoredAccountStore monitoredAccounts](accountStore, "monitoredAccounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "count"))
    goto LABEL_37;
  v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v39 = self;
    _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Registering for account monitoring", buf, 0xCu);
  }

  v12 = self->_accountStore;
  v37 = v5;
  -[ACMonitoredAccountStore registerSynchronouslyWithError:](v12, "registerSynchronouslyWithError:", &v37);
  v13 = v37;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -7407, v13, CFSTR("Failed to register with account store"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  v29 = self;
  v30 = &self->_lock;
  -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v14, "count"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v14;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  if (!v15)
  {
    v31 = 0;
    goto LABEL_33;
  }
  v16 = v15;
  v31 = 0;
  v17 = *(_QWORD *)v34;
  v18 = *MEMORY[0x1E0C8F030];
  v19 = *MEMORY[0x1E0CFAAE8];
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v34 != v17)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      if (objc_msgSend(v21, "ic_isITunesAccount"))
      {
        objc_msgSend(v21, "ic_description");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v22);
LABEL_28:

        continue;
      }
      objc_msgSend(v21, "accountType");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v18);

      if (v25 && objc_msgSend(v21, "aa_isAccountClass:", v19))
      {
        objc_msgSend(v21, "ic_description");
        v22 = v31;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
  }
  while (v16);
LABEL_33:

  v26 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
  self = v29;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 138544130;
    v39 = v29;
    v40 = 2048;
    v41 = v27;
    v42 = 2114;
    v43 = v13;
    v44 = 2114;
    v45 = v31;
    _os_log_impl(&dword_1A03E3000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ Initially loaded %lu iTunes accounts %{public}@. primaryICloudAccount = %{public}@", buf, 0x2Au);
  }

  v5 = 0;
  p_lock = v30;
LABEL_36:

LABEL_37:
LABEL_38:
  if (v5)
  {
    v28 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      v40 = 2114;
      v41 = (uint64_t)v5;
      _os_log_impl(&dword_1A03E3000, v28, OS_LOG_TYPE_ERROR, "%{public}@ Failed to register for account monitoring. err=%{public}@", buf, 0x16u);
    }

  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

+ (ICMonitoredAccountStore)sharedAccountStore
{
  if (sharedAccountStore_sOnceToken != -1)
    dispatch_once(&sharedAccountStore_sOnceToken, &__block_literal_global_2176);
  return (ICMonitoredAccountStore *)(id)sharedAccountStore_sSharedAccountStore;
}

- (id)localStoreAccountWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](self, "allStoreAccountsWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = 0;
  if (!v5)
  {
    objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v5);
LABEL_4:

  return v6;
}

uint64_t __54__ICMonitoredAccountStore_localStoreAccountWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ic_isLocalAccount");
}

uint64_t __53__ICMonitoredAccountStore_storeAccountForDSID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ic_DSID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 32))
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isEqual:");

  return v5;
}

- (id)storeAccountForDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v13 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](self, "allStoreAccountsWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = 0;
  if (!v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__ICMonitoredAccountStore_storeAccountForDSID_error___block_invoke;
    v11[3] = &unk_1E4389C40;
    v12 = v6;
    objc_msgSend(v7, "msv_firstWhere:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v9;
}

- (id)activeStoreAccountWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;

  v8 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](self, "allStoreAccountsWithError:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = 0;
  if (!v5)
  {
    objc_msgSend(v4, "msv_firstWhere:", &__block_literal_global_5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v5);
LABEL_4:

  return v6;
}

uint64_t __56__ICMonitoredAccountStore_primaryAppleAccountWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aa_isAccountClass:", *MEMORY[0x1E0CFAAE8]);
}

uint64_t __44__ICMonitoredAccountStore_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (id)primaryAppleAccountWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v8;

  -[ICMonitoredAccountStore _registerAndLoadAccountsIfNecessary](self, "_registerAndLoadAccountsIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[ACMonitoredAccountStore monitoredAccounts](self->_accountStore, "monitoredAccounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "msv_firstWhere:", &__block_literal_global_7_2167);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v5);
LABEL_4:

  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__ICMonitoredAccountStore_registerObserver___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__ICMonitoredAccountStore_sharedAccountStore__block_invoke()
{
  ICMonitoredAccountStore *v0;
  void *v1;

  v0 = objc_alloc_init(ICMonitoredAccountStore);
  v1 = (void *)sharedAccountStore_sSharedAccountStore;
  sharedAccountStore_sSharedAccountStore = (uint64_t)v0;

}

- (ICMonitoredAccountStore)init
{
  ICMonitoredAccountStore *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSHashTable *observers;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICMonitoredAccountStore;
  v2 = -[ICMonitoredAccountStore init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.iTunesCloud.ICMonitoredAccountStore.observerCallbackQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    v8 = -[ICMonitoredAccountStore _registerAndLoadAccountsIfNecessary](v2, "_registerAndLoadAccountsIfNecessary");
  }
  return v2;
}

uint64_t __60__ICMonitoredAccountStore_storeAccountWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == v3)
    v4 = 1;
  else
    v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (id)storeAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v13 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](self, "allStoreAccountsWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = 0;
  if (!v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__ICMonitoredAccountStore_storeAccountWithIdentifier_error___block_invoke;
    v11[3] = &unk_1E4389C40;
    v12 = v6;
    objc_msgSend(v7, "msv_firstWhere:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v9;
}

- (id)acAccountStore
{
  id v3;

  v3 = -[ICMonitoredAccountStore _registerAndLoadAccountsIfNecessary](self, "_registerAndLoadAccountsIfNecessary");
  return self->_accountStore;
}

- (id)storeAccountForHomeUserIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v13 = 0;
  -[ICMonitoredAccountStore allStoreAccountsWithError:](self, "allStoreAccountsWithError:", &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = 0;
  if (!v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__ICMonitoredAccountStore_storeAccountForHomeUserIdentifier_error___block_invoke;
    v11[3] = &unk_1E4389C40;
    v12 = v6;
    objc_msgSend(v7, "msv_firstWhere:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v8);
LABEL_4:

  return v9;
}

- (id)storeAccountTypeWithError:(id *)a3
{
  id v5;
  ACAccountType *v6;
  ACMonitoredAccountStore *accountStore;
  ACAccountType *v9;
  ACAccountType *cachedStoreAccountType;
  id v11;

  if (!self->_cachedStoreAccountType)
  {
    accountStore = self->_accountStore;
    v11 = 0;
    -[ACMonitoredAccountStore ic_storeAccountTypeWithError:](accountStore, "ic_storeAccountTypeWithError:", &v11);
    v9 = (ACAccountType *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    cachedStoreAccountType = self->_cachedStoreAccountType;
    self->_cachedStoreAccountType = v9;

    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = 0;
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(v5);
LABEL_4:
  v6 = self->_cachedStoreAccountType;

  return v6;
}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  ACMonitoredAccountStore *accountStore;
  id v10;

  v6 = a3;
  -[ICMonitoredAccountStore _registerAndLoadAccountsIfNecessary](self, "_registerAndLoadAccountsIfNecessary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    accountStore = self->_accountStore;
    v10 = 0;
    -[ACMonitoredAccountStore saveVerifiedAccount:error:](accountStore, "saveVerifiedAccount:error:", v6, &v10);
    v7 = v10;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a4)
LABEL_3:
    *a4 = objc_retainAutorelease(v7);
LABEL_4:

  return v7 == 0;
}

- (void)accountWasAdded:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ICMonitoredAccountStore_accountWasAdded___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)accountWasModified:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__ICMonitoredAccountStore_accountWasModified___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__ICMonitoredAccountStore_accountWasRemoved___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)accountCredentialChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__ICMonitoredAccountStore_accountCredentialChanged___block_invoke;
  v7[3] = &unk_1E4391110;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedStoreAccountType, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

void __52__ICMonitoredAccountStore_accountCredentialChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ic_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for credentials update for account: %{public}@", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "monitoredAccountStore:didChangeCredentialsForAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __45__ICMonitoredAccountStore_accountWasRemoved___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ic_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for removed account: %{public}@", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "monitoredAccountStore:didRemoveAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __46__ICMonitoredAccountStore_accountWasModified___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ic_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for updated account: %{public}@", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "monitoredAccountStore:didUpdateAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

void __43__ICMonitoredAccountStore_accountWasAdded___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "ic_description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v3;
    v18 = 2114;
    v19 = v4;
    _os_log_impl(&dword_1A03E3000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ Handling notification for added account: %{public}@", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "monitoredAccountStore:didAddAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

uint64_t __67__ICMonitoredAccountStore_storeAccountForHomeUserIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ic_homeUserIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

@end
