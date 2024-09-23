@implementation PPBundleIdAllowancePolicy

- (BOOL)bundleIdentifierIsAllowedForSearchableItems:(id)a3
{
  id v4;
  _PASLock *allowancePolicyLock;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__816;
  v18 = __Block_byref_object_dispose__817;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__816;
  v12 = __Block_byref_object_dispose__817;
  v13 = 0;
  allowancePolicyLock = self->_allowancePolicyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForSearchableItems___block_invoke;
  v7[3] = &unk_1E7E15270;
  v7[4] = &v14;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](allowancePolicyLock, "runWithLockAcquired:", v7);
  LOBYTE(self) = -[PPBundleIdAllowancePolicy bundleIdentifierIsAllowed:blocklist:allowlist:](self, "bundleIdentifierIsAllowed:blocklist:allowlist:", v4, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (BOOL)bundleIdentifierIsAllowed:(id)a3 blocklist:(id)a4 allowlist:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  char v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v8, "count") && !objc_msgSend(v9, "count"))
  {
    v12 = 1;
    goto LABEL_10;
  }
  if (!objc_msgSend(v8, "count"))
    goto LABEL_7;
  v10 = objc_msgSend(v9, "count");
  v11 = objc_msgSend(v8, "containsObject:", v7);
  if (!v10)
  {
    v12 = v11 ^ 1;
    goto LABEL_10;
  }
  if ((v11 & 1) != 0)
    v12 = 0;
  else
LABEL_7:
    v12 = objc_msgSend(v9, "containsObject:", v7);
LABEL_10:

  return v12;
}

+ (id)defaultPolicy
{
  if (defaultPolicy__pasOnceToken2 != -1)
    dispatch_once(&defaultPolicy__pasOnceToken2, &__block_literal_global_847);
  return (id)defaultPolicy__pasExprOnceResult;
}

void __73__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForSearchableItems___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2[3]);
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4[4]);

}

- (id)init_
{
  PPBundleIdAllowancePolicy *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _PASLock *allowancePolicyLock;
  void *v7;
  uint64_t v8;
  TRINotificationToken *trialToken;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PPBundleIdAllowancePolicy;
  v2 = -[PPBundleIdAllowancePolicy init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    allowancePolicyLock = v2->_allowancePolicyLock;
    v2->_allowancePolicyLock = (_PASLock *)v5;

    -[PPBundleIdAllowancePolicy _loadAssetData](v2, "_loadAssetData");
    location = 0;
    objc_initWeak(&location, v2);
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __34__PPBundleIdAllowancePolicy_init___block_invoke;
    v11[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"), v11);
    v8 = objc_claimAutoreleasedReturnValue();
    trialToken = v2->_trialToken;
    v2->_trialToken = (TRINotificationToken *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeUpdateHandlerForToken:", self->_trialToken);

  v4.receiver = self;
  v4.super_class = (Class)PPBundleIdAllowancePolicy;
  -[PPBundleIdAllowancePolicy dealloc](&v4, sel_dealloc);
}

- (PPBundleIdAllowancePolicy)initWithNotificationBlocklist:(id)a3 notificationAllowlist:(id)a4 searchableItemBlocklist:(id)a5 searchableItemAllowlist:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PPBundleIdAllowancePolicy *v14;
  id v15;
  void *v16;
  uint64_t v17;
  _PASLock *allowancePolicyLock;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PPBundleIdAllowancePolicy;
  v14 = -[PPBundleIdAllowancePolicy init](&v20, sel_init);
  if (v14)
  {
    v15 = objc_alloc(MEMORY[0x1E0D815F0]);
    v16 = (void *)objc_opt_new();
    v17 = objc_msgSend(v15, "initWithGuardedData:", v16);
    allowancePolicyLock = v14->_allowancePolicyLock;
    v14->_allowancePolicyLock = (_PASLock *)v17;

    -[PPBundleIdAllowancePolicy _setGuardedDataWithNotificationBlocklist:notificationAllowlist:searchableItemBlocklist:searchableItemAllowlist:](v14, "_setGuardedDataWithNotificationBlocklist:notificationAllowlist:searchableItemBlocklist:searchableItemAllowlist:", v10, v11, v12, v13);
  }

  return v14;
}

- (void)_loadAssetData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PPBundleIdAllowancePolicy _readAssetData:](self, "_readAssetData:", CFSTR("allowancePolicy.plist"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("notificationBlocklist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("notificationAllowlist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("searchableItemBlocklist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("searchableItemAllowlist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPBundleIdAllowancePolicy _setGuardedDataWithNotificationBlocklist:notificationAllowlist:searchableItemBlocklist:searchableItemAllowlist:](self, "_setGuardedDataWithNotificationBlocklist:notificationAllowlist:searchableItemBlocklist:searchableItemAllowlist:", v3, v4, v5, v6);

}

- (id)_readAssetData:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  _QWORD v26[4];
  uint8_t buf[4];
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "plistForFactorName:namespaceName:", CFSTR("allowancePolicy.plist"), CFSTR("PERSONALIZATION_PORTRAIT_GLOBAL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    pp_default_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C392E000, v5, OS_LOG_TYPE_FAULT, "PPBundleIdAllowancePolicy: no allowance policy found.", buf, 2u);
    }

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationBlocklist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("notificationBlocklist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("notificationBlocklist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationAllowlist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("notificationAllowlist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("notificationAllowlist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchableItemBlocklist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("searchableItemBlocklist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("searchableItemBlocklist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("searchableItemAllowlist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("searchableItemAllowlist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Param key not found: %@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = CFSTR("searchableItemAllowlist");
    _os_log_fault_impl(&dword_1C392E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Wrong value type for param key: %@", buf, 0xCu);
  }
  v25[0] = CFSTR("notificationBlocklist");
  v10 = objc_alloc(MEMORY[0x1E0C99E60]);
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v6)
    v12 = v6;
  else
    v12 = (void *)MEMORY[0x1E0C9AA60];
  v13 = (void *)objc_msgSend(v10, "initWithArray:", v12, v25[0]);
  v26[0] = v13;
  v25[1] = CFSTR("notificationAllowlist");
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  if (v7)
    v15 = v7;
  else
    v15 = v11;
  v16 = (void *)objc_msgSend(v14, "initWithArray:", v15);
  v26[1] = v16;
  v25[2] = CFSTR("searchableItemBlocklist");
  v17 = objc_alloc(MEMORY[0x1E0C99E60]);
  if (v8)
    v18 = v8;
  else
    v18 = v11;
  v19 = (void *)objc_msgSend(v17, "initWithArray:", v18);
  v26[2] = v19;
  v25[3] = CFSTR("searchableItemAllowlist");
  v20 = objc_alloc(MEMORY[0x1E0C99E60]);
  if (v9)
    v21 = v9;
  else
    v21 = v11;
  v22 = (void *)objc_msgSend(v20, "initWithArray:", v21);
  v26[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (void)_setGuardedDataWithNotificationBlocklist:(id)a3 notificationAllowlist:(id)a4 searchableItemBlocklist:(id)a5 searchableItemAllowlist:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _PASLock *allowancePolicyLock;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  allowancePolicyLock = self->_allowancePolicyLock;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __140__PPBundleIdAllowancePolicy__setGuardedDataWithNotificationBlocklist_notificationAllowlist_searchableItemBlocklist_searchableItemAllowlist___block_invoke;
  v19[3] = &unk_1E7E15208;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  -[_PASLock runWithLockAcquired:](allowancePolicyLock, "runWithLockAcquired:", v19);

}

- (void)_resetGuardedData
{
  -[_PASLock runWithLockAcquired:](self->_allowancePolicyLock, "runWithLockAcquired:", &__block_literal_global_28);
}

- (BOOL)bundleIdentifierIsAllowedForNotifications:(id)a3
{
  id v4;
  _PASLock *allowancePolicyLock;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__816;
  v18 = __Block_byref_object_dispose__817;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__816;
  v12 = __Block_byref_object_dispose__817;
  v13 = 0;
  allowancePolicyLock = self->_allowancePolicyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForNotifications___block_invoke;
  v7[3] = &unk_1E7E15270;
  v7[4] = &v14;
  v7[5] = &v8;
  -[_PASLock runWithLockAcquired:](allowancePolicyLock, "runWithLockAcquired:", v7);
  LOBYTE(self) = -[PPBundleIdAllowancePolicy bundleIdentifierIsAllowed:blocklist:allowlist:](self, "bundleIdentifierIsAllowed:blocklist:allowlist:", v4, v15[5], v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_allowancePolicyLock, 0);
}

void __71__PPBundleIdAllowancePolicy_bundleIdentifierIsAllowedForNotifications___block_invoke(uint64_t a1, id *a2)
{
  id *v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2[1]);
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4[2]);

}

void __46__PPBundleIdAllowancePolicy__resetGuardedData__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v2 = a2;
  v3 = objc_opt_new();
  v4 = (void *)v2[1];
  v2[1] = v3;

  v5 = objc_opt_new();
  v6 = (void *)v2[2];
  v2[2] = v5;

  v7 = objc_opt_new();
  v8 = (void *)v2[3];
  v2[3] = v7;

  v9 = objc_opt_new();
  v10 = (id)v2[4];
  v2[4] = v9;

}

void __140__PPBundleIdAllowancePolicy__setGuardedDataWithNotificationBlocklist_notificationAllowlist_searchableItemBlocklist_searchableItemAllowlist___block_invoke(id *a1, id *a2)
{
  id *v4;

  objc_storeStrong(a2 + 1, a1[4]);
  v4 = a2;
  objc_storeStrong(v4 + 2, a1[5]);
  objc_storeStrong(v4 + 3, a1[6]);
  objc_storeStrong(v4 + 4, a1[7]);

}

void __34__PPBundleIdAllowancePolicy_init___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadAssetData");

}

void __42__PPBundleIdAllowancePolicy_defaultPolicy__block_invoke()
{
  void *v0;
  PPBundleIdAllowancePolicy *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = -[PPBundleIdAllowancePolicy init]([PPBundleIdAllowancePolicy alloc], "init");
  v2 = (void *)defaultPolicy__pasExprOnceResult;
  defaultPolicy__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

@end
