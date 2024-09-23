@implementation SSAccountStore

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v2 = a2;
  v3 = iTunesStoreAccountTypePromise_accountTypeQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_4;
  block[3] = &unk_1E47B8790;
  v6 = v2;
  v4 = v2;
  dispatch_sync(v3, block);

}

- (SSAccount)activeAccount
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[SSAccountStore accounts](self, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_ss_firstObjectPassingTest:", &__block_literal_global_129);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (!v6)
    goto LABEL_11;
  v8 = (void *)objc_opt_class();
  v9 = v8;
  objc_msgSend(v3, "hashedDescription");
  v20 = 138543618;
  v21 = v8;
  v22 = 2114;
  v23 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v20, v19);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
LABEL_11:

  }
  v17 = (void *)objc_msgSend(v3, "copy");

  return (SSAccount *)v17;
}

- (NSArray)accounts
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  int v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  int v54;
  NSObject *v55;
  int v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  void *v70;
  void *v71;
  int v72;
  int v73;
  NSObject *v74;
  int v75;
  void *v76;
  id v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  _BYTE *v86;
  uint64_t v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  id v93;
  _QWORD block[5];
  _BYTE v95[128];
  _BYTE v96[24];
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  -[SSAccountStore _cachedAccounts](self, "_cachedAccounts");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      v7 &= 2u;
    if (v7)
    {
      *(_DWORD *)v96 = 138543362;
      *(_QWORD *)&v96[4] = objc_opt_class();
      v9 = *(id *)&v96[4];
      LODWORD(v87) = 12;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, v96, v87);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        free(v10);
        SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

      }
    }
    else
    {

    }
    return (NSArray *)v3;
  }
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v5, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    v19 &= 2u;
  if (v19)
  {
    v21 = (void *)objc_opt_class();
    *(_DWORD *)v96 = 138543362;
    *(_QWORD *)&v96[4] = v21;
    v22 = v21;
    LODWORD(v87) = 12;
    v85 = v96;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, v96, v87);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog(v5, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v24);

    }
  }
  else
  {

  }
  if (!objc_msgSend((id)objc_opt_class(), "unitTestModeEnabled"))
  {
    -[SSAccountStore backingAccountStore](self, "backingAccountStore");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "_ss_accountTypeWithIdentifier:error:", *MEMORY[0x1E0C8F170], 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    -[SSAccountStore backingAccountStore](self, "backingAccountStore");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v50, "accountsWithAccountType:options:error:", v49, 1, &v93);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v93;

    if (v51)
      goto LABEL_55;
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v52)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v53 = objc_msgSend(v52, "shouldLog", v85);
    if (objc_msgSend(v52, "shouldLogToDisk"))
      v54 = v53 | 2;
    else
      v54 = v53;
    objc_msgSend(v52, "OSLogObject");
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      v56 = v54;
    else
      v56 = v54 & 2;
    if (v56)
    {
      v57 = (void *)objc_opt_class();
      *(_DWORD *)v96 = 138543618;
      *(_QWORD *)&v96[4] = v57;
      *(_WORD *)&v96[12] = 2114;
      *(_QWORD *)&v96[14] = v88;
      v58 = v57;
      LODWORD(v87) = 22;
      v85 = v96;
      v59 = (void *)_os_log_send_and_compose_impl();

      if (!v59)
      {
LABEL_54:

LABEL_55:
        objc_msgSend(v51, "_ss_map:", &__block_literal_global_8, v85);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
        if (v67)
        {
          v68 = *(_QWORD *)v90;
          do
          {
            for (i = 0; i != v67; ++i)
            {
              if (*(_QWORD *)v90 != v68)
                objc_enumerationMutation(v66);
              v70 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
              if (objc_msgSend(v70, "hasBrokenDSID"))
                -[SSAccountStore repairAccountWithBrokenDSID:](self, "repairAccountWithBrokenDSID:", v70);
            }
            v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
          }
          while (v67);
        }
        +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v71)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v72 = objc_msgSend(v71, "shouldLog");
        if (objc_msgSend(v71, "shouldLogToDisk"))
          v73 = v72 | 2;
        else
          v73 = v72;
        objc_msgSend(v71, "OSLogObject");
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          v75 = v73;
        else
          v75 = v73 & 2;
        if (v75)
        {
          v76 = (void *)objc_opt_class();
          *(_DWORD *)v96 = 138543362;
          *(_QWORD *)&v96[4] = v76;
          v77 = v76;
          LODWORD(v87) = 12;
          v78 = (void *)_os_log_send_and_compose_impl();

          if (!v78)
          {
LABEL_76:

            -[SSAccountStore _setCachedAccounts:](self, "_setCachedAccounts:", v66);
            v3 = v66;

            return (NSArray *)v3;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v78, 4, v96, v87);
          v74 = objc_claimAutoreleasedReturnValue();
          free(v78);
          SSFileLog(v71, CFSTR("%@"), v79, v80, v81, v82, v83, v84, (uint64_t)v74);
        }

        goto LABEL_76;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v59, 4, v96, v87);
      v55 = objc_claimAutoreleasedReturnValue();
      free(v59);
      SSFileLog(v52, CFSTR("%@"), v60, v61, v62, v63, v64, v65, (uint64_t)v55);
    }

    goto LABEL_54;
  }
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v32 = objc_msgSend(v31, "shouldLog", v85);
  if (objc_msgSend(v31, "shouldLogToDisk"))
    v33 = v32 | 2;
  else
    v33 = v32;
  objc_msgSend(v31, "OSLogObject");
  v34 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    v33 &= 2u;
  if (!v33)
    goto LABEL_36;
  v35 = (void *)objc_opt_class();
  *(_DWORD *)v96 = 138543362;
  *(_QWORD *)&v96[4] = v35;
  v36 = v35;
  LODWORD(v87) = 12;
  v86 = v96;
  v37 = (void *)_os_log_send_and_compose_impl();

  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, v96, v87);
    v34 = objc_claimAutoreleasedReturnValue();
    free(v37);
    SSFileLog(v31, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v34);
LABEL_36:

  }
  *(_QWORD *)v96 = 0;
  *(_QWORD *)&v96[8] = v96;
  *(_QWORD *)&v96[16] = 0x3032000000;
  v97 = __Block_byref_object_copy__19;
  v98 = __Block_byref_object_dispose__19;
  v99 = 0;
  objc_msgSend((id)objc_opt_class(), "_unitTestAccountsAccessQueue");
  v44 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SSAccountStore_accounts__block_invoke;
  block[3] = &unk_1E47B8A28;
  block[4] = v96;
  dispatch_sync(v44, block);

  if (*(_QWORD *)(*(_QWORD *)&v96[8] + 40))
    v45 = *(_QWORD *)(*(_QWORD *)&v96[8] + 40);
  else
    v45 = MEMORY[0x1E0C9AA60];
  -[SSAccountStore _setCachedAccounts:](self, "_setCachedAccounts:", v45, v86);
  v46 = *(id *)(*(_QWORD *)&v96[8] + 40);
  _Block_object_dispose(v96, 8);

  return (NSArray *)v46;
}

- (ACAccountStore)backingAccountStore
{
  return self->_backingAccountStore;
}

- (id)_cachedAccounts
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  -[SSAccountStore accountsCacheAccessQueue](self, "accountsCacheAccessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SSAccountStore__cachedAccounts__block_invoke;
  v6[3] = &unk_1E47B8718;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (OS_dispatch_queue)accountsCacheAccessQueue
{
  return self->_accountsCacheAccessQueue;
}

uint64_t __31__SSAccountStore_activeAccount__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isActive");
}

- (void)_setCachedAccounts:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[SSAccountStore accountsCacheAccessQueue](self, "accountsCacheAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSAccountStore__setCachedAccounts___block_invoke;
  block[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__SSAccountStore_localAccount__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  SSAccount *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v3);

  objc_msgSend(v2, "finishWithResult:", v4);
}

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_4(uint64_t a1)
{
  objc_storeStrong((id *)&iTunesStoreAccountTypePromise_sAccountType, *(id *)(a1 + 32));
}

uint64_t __37__SSAccountStore_unitTestModeEnabled__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = sUnitTestModeEnabled;
  return result;
}

void __37__SSAccountStore__setCachedAccounts___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(WeakRetained, "setAccountsCache:", v2);

}

- (void)setAccountsCache:(id)a3
{
  objc_storeStrong((id *)&self->_accountsCache, a3);
}

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (iTunesStoreAccountTypePromise_sAccountType)
  {
    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

void __33__SSAccountStore__cachedAccounts__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isInProcessCacheDisabled") & 1) != 0)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v3 = objc_msgSend(v2, "shouldLog");
    if (objc_msgSend(v2, "shouldLogToDisk"))
      v4 = v3 | 2;
    else
      v4 = v3;
    objc_msgSend(v2, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      v4 &= 2u;
    if (v4)
    {
      v19 = 138543362;
      v20 = (id)objc_opt_class();
      v6 = v20;
      LODWORD(v17) = 12;
      v7 = (void *)_os_log_send_and_compose_impl();

      if (!v7)
      {
LABEL_13:

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v19, v17);
      v5 = objc_claimAutoreleasedReturnValue();
      free(v7);
      SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    }

    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "accountsCache");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v18, "copy");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (BOOL)isInProcessCacheDisabled
{
  return self->_inProcessCacheDisabled;
}

- (NSArray)accountsCache
{
  return self->_accountsCache;
}

- (id)iTunesStoreAccountType
{
  void *v2;
  void *v3;

  -[SSAccountStore iTunesStoreAccountTypePromise](self, "iTunesStoreAccountTypePromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)defaultStore
{
  SSAccountStore *v2;
  void *v3;

  pthread_mutex_lock(&__DefaultStoreLock);
  if (!__DefaultStore)
  {
    v2 = objc_alloc_init(SSAccountStore);
    v3 = (void *)__DefaultStore;
    __DefaultStore = (uint64_t)v2;

  }
  pthread_mutex_unlock(&__DefaultStoreLock);
  return (id)__DefaultStore;
}

- (SSPromise)localAccount
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[SSAccountStore iTunesStoreAccountTypePromise](self, "iTunesStoreAccountTypePromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__SSAccountStore_localAccount__block_invoke;
  v6[3] = &unk_1E47BB1A8;
  v6[4] = self;
  objc_msgSend(v3, "thenWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SSPromise *)v4;
}

- (id)iTunesStoreAccountTypePromise
{
  void *v3;
  SSPromise *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__19;
  v15 = __Block_byref_object_dispose__19;
  v16 = 0;
  if (iTunesStoreAccountTypePromise_onceToken != -1)
    dispatch_once(&iTunesStoreAccountTypePromise_onceToken, &__block_literal_global_135);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke_2;
  block[3] = &unk_1E47B8A28;
  block[4] = &v11;
  dispatch_sync((dispatch_queue_t)iTunesStoreAccountTypePromise_accountTypeQueue, block);
  v3 = (void *)v12[5];
  if (!v3)
  {
    v4 = objc_alloc_init(SSPromise);
    v5 = (void *)v12[5];
    v12[5] = (uint64_t)v4;

    objc_msgSend((id)v12[5], "addSuccessBlock:", &__block_literal_global_138);
    -[SSAccountStore backingAccountStore](self, "backingAccountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v12[5], "completionHandlerAdapter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountTypeWithIdentifier:completion:", *MEMORY[0x1E0C8F170], v7);

    v3 = (void *)v12[5];
  }
  v8 = v3;
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (SSAccountStore)init
{
  SSAccountStore *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accountsCacheAccessQueue;
  uint64_t v7;
  ACAccountStore *backingAccountStore;
  dispatch_queue_t v9;
  OS_dispatch_queue *fetchAccountsQueue;
  dispatch_queue_t v11;
  OS_dispatch_queue *metricsQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *notificationQueue;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SSAccountStore;
  v2 = -[SSAccountStore init](&v16, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AccountsChanged, CFSTR("com.apple.itunesstored.accountschanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AccountsChangedInternal, CFSTR("com.apple.itunesstored.accountschanged.internal"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__ActiveAccountChanged, CFSTR("com.apple.StoreServices.SSAccountStore.activeaccountchanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, CFSTR("com.apple.StoreServices.authbegin"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, CFSTR("com.apple.StoreServices.authfail"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, CFSTR("com.apple.StoreServices.authfinish"), 0, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__AuthenticationStateChanged, CFSTR("com.apple.StoreServices.authsubmit"), 0, CFNotificationSuspensionBehaviorCoalesce);
    v4 = MEMORY[0x1E0C80D50];
    v5 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.accountsCache", MEMORY[0x1E0C80D50]);
    accountsCacheAccessQueue = v2->_accountsCacheAccessQueue;
    v2->_accountsCacheAccessQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v7 = objc_claimAutoreleasedReturnValue();
    backingAccountStore = v2->_backingAccountStore;
    v2->_backingAccountStore = (ACAccountStore *)v7;

    v9 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.fetchAccounts", v4);
    fetchAccountsQueue = v2->_fetchAccountsQueue;
    v2->_fetchAccountsQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.metricsQueue", 0);
    metricsQueue = v2->_metricsQueue;
    v2->_metricsQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.notificationQueue", 0);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v13;

  }
  return v2;
}

SSPromise *__30__SSAccountStore_localAccount__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  SSPromise *v6;
  uint64_t v7;
  SSPromise *v8;
  SSPromise *v9;
  SSPromise *v10;
  SSPromise *v11;
  _QWORD v13[4];
  SSPromise *v14;
  _QWORD v15[4];
  SSPromise *v16;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "backingAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_localiTunesAccountForAccountType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(SSPromise);
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __30__SSAccountStore_localAccount__block_invoke_2;
  v15[3] = &unk_1E47BB180;
  v8 = v6;
  v16 = v8;
  objc_msgSend(v5, "addSuccessBlock:", v15);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __30__SSAccountStore_localAccount__block_invoke_3;
  v13[3] = &unk_1E47B9F78;
  v9 = v8;
  v14 = v9;
  objc_msgSend(v5, "addErrorBlock:", v13);
  v10 = v14;
  v11 = v9;

  return v11;
}

void __47__SSAccountStore_iTunesStoreAccountTypePromise__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.sAccountType", 0);
  v1 = (void *)iTunesStoreAccountTypePromise_accountTypeQueue;
  iTunesStoreAccountTypePromise_accountTypeQueue = (uint64_t)v0;

}

void __46__SSAccountStore__unitTestAccountsAccessQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.unitTestAccountsAccessQueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)_unitTestAccountsAccessQueue_sUnitTestAccountsAccessQueue;
  _unitTestAccountsAccessQueue_sUnitTestAccountsAccessQueue = (uint64_t)v0;

}

+ (BOOL)unitTestModeEnabled
{
  NSObject *v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(a1, "_unitTestAccountsAccessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSAccountStore_unitTestModeEnabled__block_invoke;
  block[3] = &unk_1E47B8A28;
  block[4] = &v5;
  dispatch_sync(v2, block);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

+ (id)_unitTestAccountsAccessQueue
{
  if (_unitTestAccountsAccessQueue_onceToken != -1)
    dispatch_once(&_unitTestAccountsAccessQueue_onceToken, &__block_literal_global_185);
  return (id)_unitTestAccountsAccessQueue_sUnitTestAccountsAccessQueue;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.accountschanged"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.accountschanged.internal"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.SSAccountStore.activeaccountchanged"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.authbegin"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.authfail"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.authfinish"), 0);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.StoreServices.authsubmit"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SSAccountStore;
  -[SSAccountStore dealloc](&v4, sel_dealloc);
}

- (SSKeyValueStore)keyValueStore
{
  SSAccountStore *v2;
  SSKeyValueStore *v3;
  SSKeyValueStore *keyValueStore;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_keyValueStore)
  {
    v3 = objc_alloc_init(SSKeyValueStore);
    keyValueStore = v2->_keyValueStore;
    v2->_keyValueStore = v3;

  }
  objc_sync_exit(v2);

  return v2->_keyValueStore;
}

+ (double)tokenExpirationInterval
{
  return 900.0;
}

void __26__SSAccountStore_accounts__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend((id)sUnitTestAccounts, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

SSAccount *__26__SSAccountStore_accounts__block_invoke_124(uint64_t a1, void *a2)
{
  id v2;
  SSAccount *v3;

  v2 = a2;
  v3 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v2);

  return v3;
}

- (SSPromise)accountsPromise
{
  SSPromise *v3;
  NSObject *v4;
  SSPromise *v5;
  _QWORD block[4];
  SSPromise *v8;
  id v9;
  id location;

  v3 = objc_alloc_init(SSPromise);
  objc_initWeak(&location, self);
  -[SSAccountStore fetchAccountsQueue](self, "fetchAccountsQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SSAccountStore_accountsPromise__block_invoke;
  block[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v9, &location);
  v5 = v3;
  v8 = v5;
  dispatch_async(v4, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v5;
}

void __33__SSAccountStore_accountsPromise__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "finishWithResult:error:", v2, 0);
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:error:", 0, v4);

  }
}

- (id)accountWithAccountName:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSAccountStore accounts](self, "accounts");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "accountName", (_QWORD)v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if (v13)
      {
        v14 = v11;

        v8 = v14;
        if (!objc_msgSend(v14, "accountScope"))
          break;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v14 = v8;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  v15 = (void *)objc_msgSend(v14, "copy");
  return v15;
}

- (id)accountWithAccountName:(id)a3 scope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SSAccount *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_iTunesAccountWithUsername:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v8);
    else
      v9 = 0;

  }
  else
  {
    -[SSAccountStore accounts](self, "accounts");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "accountName", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v6))
          {
            v16 = objc_msgSend(v14, "accountScope");

            if (v16 == a4)
            {
              v11 = v14;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
LABEL_15:

    v9 = (SSAccount *)objc_msgSend(v11, "copy");
  }

  return v9;
}

- (id)accountWithAltDSID:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SSAccountStore accounts](self, "accounts");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "altDSID", (_QWORD)v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v4);

      if (v13)
      {
        v14 = v11;

        v8 = v14;
        if (!objc_msgSend(v14, "accountScope"))
          break;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v14 = v8;
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v14 = 0;
  }

  v15 = (void *)objc_msgSend(v14, "copy");
  return v15;
}

- (id)accountWithAltDSID:(id)a3 scope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SSAccount *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_iTunesAccountWithAltDSID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v8);
    else
      v9 = 0;

  }
  else
  {
    -[SSAccountStore accounts](self, "accounts");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "altDSID", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", v6))
          {
            v16 = objc_msgSend(v14, "accountScope");

            if (v16 == a4)
            {
              v11 = v14;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
LABEL_15:

    v9 = (SSAccount *)objc_msgSend(v11, "copy");
  }

  return v9;
}

- (id)accountWithAltDSID:(id)a3 uniqueIdentifier:(id)a4 accountName:(id)a5
{
  return -[SSAccountStore accountWithAltDSID:uniqueIdentifier:accountName:scope:](self, "accountWithAltDSID:uniqueIdentifier:accountName:scope:", a3, a4, a5, 0);
}

- (id)accountWithAltDSID:(id)a3 uniqueIdentifier:(id)a4 accountName:(id)a5 scope:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (a3 || v10 || v11)
  {
    -[SSAccountStore accountWithAltDSID:scope:](self, "accountWithAltDSID:scope:", a3, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      -[SSAccountStore accountWithUniqueIdentifier:scope:](self, "accountWithUniqueIdentifier:scope:", v10, a6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        -[SSAccountStore accountWithAccountName:scope:](self, "accountWithAccountName:scope:", v12, a6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)accountWithUniqueIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[SSAccountStore accounts](self, "accounts");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v18;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(v11, "uniqueIdentifier", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToNumber:", v4);

        if (v13)
        {
          v14 = v11;

          v8 = v14;
          if (!objc_msgSend(v14, "accountScope"))
            break;
        }
        if (v7 == ++v10)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          v14 = v8;
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }
    else
    {
      v14 = 0;
    }

    v15 = (void *)objc_msgSend(v14, "copy");
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)accountWithUniqueIdentifier:(id)a3 scope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  SSAccount *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_iTunesAccountWithDSID:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v8);
    else
      v9 = 0;

  }
  else
  {
    -[SSAccountStore accounts](self, "accounts");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uniqueIdentifier", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqual:", v6))
          {
            v16 = objc_msgSend(v14, "accountScope");

            if (v16 == a4)
            {
              v11 = v14;
              goto LABEL_15;
            }
          }
          else
          {

          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }
LABEL_15:

    v9 = (SSAccount *)objc_msgSend(v11, "copy");
  }

  return v9;
}

- (SSAccount)localiTunesAccount
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SSAccountStore accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "backingAccount");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "ams_isLocalAccount");

        if ((v8 & 1) != 0)
        {
          v3 = (void *)objc_msgSend(v6, "copy");
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (SSAccount *)v3;
}

- (SSAccount)activeSandboxAccount
{
  void *v2;
  void *v3;
  SSAccount *v4;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v3);
  else
    v4 = 0;

  return v4;
}

- (SSAccount)activeLockerAccount
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SSAccountStore activeAccount](self, "activeAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isActiveLockerAccount"))
    v3 = (void *)objc_msgSend(v2, "copy");
  else
    v3 = 0;
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    v6 &= 2u;
  if (!v6)
    goto LABEL_14;
  v8 = (void *)objc_opt_class();
  v9 = v8;
  objc_msgSend(v3, "hashedDescription");
  v19 = 138543618;
  v20 = v8;
  v21 = 2114;
  v22 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v19, v18);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
LABEL_14:

  }
  return (SSAccount *)v3;
}

- (BOOL)isExpired
{
  return objc_msgSend((id)objc_opt_class(), "isExpired");
}

- (void)resetLocalAccount
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  id v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    v35 = 138543362;
    v36 = (id)objc_opt_class();
    v7 = v36;
    LODWORD(v33) = 12;
    v32 = &v35;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (!v8)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, &v35, v33);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog(v3, CFSTR("%@"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
  }

LABEL_12:
  -[SSAccountStore localAccount](self, "localAccount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resultWithError:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setStoreFrontIdentifier:", 0);
  v34 = 0;
  v17 = -[SSAccountStore saveAccount:verifyCredentials:error:](self, "saveAccount:verifyCredentials:error:", v16, 0, &v34);
  v18 = v34;
  if (!v17)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v19, "shouldLog", v32);
    if (objc_msgSend(v19, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v19, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      v21 &= 2u;
    if (v21)
    {
      v23 = (void *)objc_opt_class();
      v35 = 138543618;
      v36 = v23;
      v37 = 2114;
      v38 = v18;
      v24 = v23;
      LODWORD(v33) = 22;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (!v25)
      {
LABEL_24:

        goto LABEL_25;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v35, v33);
      v22 = objc_claimAutoreleasedReturnValue();
      free(v25);
      SSFileLog(v19, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v22);
    }

    goto LABEL_24;
  }
LABEL_25:

}

+ (BOOL)URLResponseAllowsSilentAuthentication:(id)a3
{
  id v3;
  char isKindOfClass;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "itunes_allHeaderFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("X-Apple-Allow-Auth-Types"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "containsObject:", CFSTR("silent"));

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;

  v7 = a5;
  v8 = a6;
  objc_msgSend(v8, "clientInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "setClientInfo:", v9);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "objectForKey:", CFSTR("metricsAuthenticationAttempts"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("metricsAuthenticationAttempts"));
    }
  }
  else
  {
    v10 = 0;
  }
  v11 = v7;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v12, "setObject:forKey:", CFSTR("authenticate"), CFSTR("targetId"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), (uint64_t)(v15 * 1000.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v16, CFSTR("responseTime"));
  if (v11)
  {
    objc_msgSend(v12, "setObject:forKey:", CFSTR("failure"), CFSTR("result"));
    v17 = objc_msgSend(v11, "code");
    v18 = CFSTR("unknown");
    if (v17 == -7006)
      v18 = CFSTR("invalidCredentials");
    if (v17 == -7010)
      v18 = CFSTR("badServerResponse");
    if (v17 == -7028)
      v19 = CFSTR("maxNumberOfAttemptsReached");
    else
      v19 = v18;
    v20 = CFSTR("reason");
  }
  else
  {
    v19 = CFSTR("success");
    v20 = CFSTR("result");
  }
  objc_msgSend(v12, "setObject:forKey:", v19, v20);

  if (v12)
    objc_msgSend(v10, "addObject:", v12);

  return v11 == 0;
}

+ (BOOL)areAccountStoreChangedNotificationsDisabled
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AccountsChangedNotificationsSuppressionStarted"), CFSTR("com.apple.itunesstored"));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v7 = v5 - v6;

    v8 = v7 <= 60.0 && v7 >= 0.0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearCachedAccounts
{
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD block[4];
  id v19;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (v5)
  {
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_opt_class();
    v7 = *(id *)((char *)location + 4);
    LODWORD(v17) = 12;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 4, location, v17);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      free(v8);
      SSFileLog(v3, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);

    }
  }
  else
  {

  }
  objc_initWeak(location, self);
  -[SSAccountStore accountsCacheAccessQueue](self, "accountsCacheAccessQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSAccountStore_clearCachedAccounts__block_invoke;
  block[3] = &unk_1E47BA068;
  objc_copyWeak(&v19, location);
  dispatch_barrier_async(v16, block);

  objc_destroyWeak(&v19);
  objc_destroyWeak(location);
}

void __37__SSAccountStore_clearCachedAccounts__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAccountsCache:", 0);

}

+ (id)existingDefaultStore
{
  id v2;

  pthread_mutex_lock(&__DefaultStoreLock);
  v2 = (id)__DefaultStore;
  pthread_mutex_unlock(&__DefaultStoreLock);
  return v2;
}

- (BOOL)repairAccountWithBrokenDSID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  int v42;
  NSObject *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  NSObject *v64;
  int v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  int v77;
  void *v78;
  NSObject *v79;
  id v80;
  void *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v91;
  int v92;
  int v93;
  NSObject *v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  int v106;
  int v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  int *v118;
  int *v119;
  uint64_t v120;
  NSObject *v121;
  void *v122;
  void *v123;
  id v124;
  int v125;
  void *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  NSObject *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SSAccountStore.m"), 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  if ((objc_msgSend(v5, "isLocalAccount") & 1) == 0 && objc_msgSend(v5, "hasBrokenDSID"))
  {
    SSGenerateLogCorrelationString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend(v5, "hashedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = 138543874;
      v126 = v11;
      v127 = 2114;
      v128 = v6;
      v129 = 2114;
      v130 = v13;
      LODWORD(v120) = 32;
      v118 = &v125;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v125, v120);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v7, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v10);
    }

LABEL_16:
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = objc_msgSend(v21, "shouldLog", v118);
    if (objc_msgSend(v21, "shouldLogToDisk"))
      v23 = v22 | 2;
    else
      v23 = v22;
    objc_msgSend(v21, "OSLogObject");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      v23 &= 2u;
    if (v23)
    {
      v25 = (void *)objc_opt_class();
      v125 = 138543618;
      v126 = v25;
      v127 = 2114;
      v128 = v6;
      v26 = v25;
      LODWORD(v120) = 22;
      v119 = &v125;
      v27 = (void *)_os_log_send_and_compose_impl();

      if (!v27)
        goto LABEL_27;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v125, v120);
      v24 = objc_claimAutoreleasedReturnValue();
      free(v27);
      SSFileLog(v21, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v24);
    }

LABEL_27:
    -[SSAccountStore backingAccountStore](self, "backingAccountStore");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingAccount");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_ss_IDMSAccountForAccount:error:", v35, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "_ss_DSID");
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
LABEL_28:
      v38 = (void *)v37;
      goto LABEL_44;
    }
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v40)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = objc_msgSend(v40, "shouldLog", v119);
    if (objc_msgSend(v40, "shouldLogToDisk"))
      v42 = v41 | 2;
    else
      v42 = v41;
    objc_msgSend(v40, "OSLogObject");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      v44 = v42;
    else
      v44 = v42 & 2;
    if (v44)
    {
      v45 = (void *)objc_opt_class();
      v125 = 138543618;
      v126 = v45;
      v127 = 2114;
      v128 = v6;
      v46 = v45;
      LODWORD(v120) = 22;
      v119 = &v125;
      v47 = (void *)_os_log_send_and_compose_impl();

      if (!v47)
        goto LABEL_42;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v47, 4, &v125, v120);
      v43 = objc_claimAutoreleasedReturnValue();
      free(v47);
      SSFileLog(v40, CFSTR("%@"), v48, v49, v50, v51, v52, v53, (uint64_t)v43);
    }

LABEL_42:
    -[SSAccountStore backingAccountStore](self, "backingAccountStore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingAccount");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "_ss_iCloudAccountForAccount:error:", v55, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "_ss_DSID");
    v57 = objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      v38 = (void *)v57;
      v36 = v56;
LABEL_44:
      objc_msgSend(v5, "setUniqueIdentifier:", v38, v119);
      v124 = 0;
      v39 = -[SSAccountStore saveAccount:verifyCredentials:error:](self, "saveAccount:verifyCredentials:error:", v5, 0, &v124);
      v58 = v124;
      +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      v59 = objc_claimAutoreleasedReturnValue();
      v60 = (void *)v59;
      v123 = v36;
      if (v39)
      {
        v61 = v6;
        if (!v59)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v62 = objc_msgSend(v60, "shouldLog");
        if (objc_msgSend(v60, "shouldLogToDisk"))
          v63 = v62 | 2;
        else
          v63 = v62;
        objc_msgSend(v60, "OSLogObject");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          v65 = v63;
        else
          v65 = v63 & 2;
        if (v65)
        {
          v121 = v58;
          v66 = (void *)objc_opt_class();
          v67 = v66;
          objc_msgSend(v5, "hashedDescription");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = 138543874;
          v126 = v66;
          v127 = 2114;
          v128 = v61;
          v129 = 2114;
          v130 = v68;
          LODWORD(v120) = 32;
          v69 = (void *)_os_log_send_and_compose_impl();

          if (!v69)
          {
            v6 = v61;
            v58 = v121;
            goto LABEL_69;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v69, 4, &v125, v120);
          v64 = objc_claimAutoreleasedReturnValue();
          free(v69);
          SSFileLog(v60, CFSTR("%@"), v70, v71, v72, v73, v74, v75, (uint64_t)v64);
          v6 = v61;
          v58 = v121;
        }
        else
        {
          v6 = v61;
        }
      }
      else
      {
        v122 = v6;
        if (!v59)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v76 = objc_msgSend(v60, "shouldLog");
        if (objc_msgSend(v60, "shouldLogToDisk"))
          v76 |= 2u;
        objc_msgSend(v60, "OSLogObject");
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
          v77 = v76;
        else
          v77 = v76 & 2;
        if (v77)
        {
          v78 = (void *)objc_opt_class();
          v79 = v58;
          v80 = v78;
          objc_msgSend(v5, "hashedDescription");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v125 = 138544130;
          v126 = v78;
          v127 = 2114;
          v128 = v122;
          v129 = 2114;
          v130 = v81;
          v131 = 2114;
          v82 = v79;
          v132 = v79;
          LODWORD(v120) = 42;
          v83 = (void *)_os_log_send_and_compose_impl();

          if (!v83)
          {
            v6 = v122;
            v58 = v82;
            goto LABEL_69;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v83, 4, &v125, v120);
          v64 = objc_claimAutoreleasedReturnValue();
          free(v83);
          SSFileLog(v60, CFSTR("%@"), v84, v85, v86, v87, v88, v89, (uint64_t)v64);
          v6 = v122;
          v58 = v82;
        }
        else
        {
          v6 = v122;
        }
      }

LABEL_69:
      v36 = v123;
      goto LABEL_70;
    }
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v91)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v92 = objc_msgSend(v91, "shouldLog", v119);
    if (objc_msgSend(v91, "shouldLogToDisk"))
      v93 = v92 | 2;
    else
      v93 = v92;
    objc_msgSend(v91, "OSLogObject");
    v94 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      v93 &= 2u;
    if (v93)
    {
      v95 = (void *)objc_opt_class();
      v125 = 138543618;
      v126 = v95;
      v127 = 2114;
      v128 = v6;
      v96 = v95;
      LODWORD(v120) = 22;
      v119 = &v125;
      v97 = (void *)_os_log_send_and_compose_impl();

      if (!v97)
        goto LABEL_84;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v97, 4, &v125, v120);
      v94 = objc_claimAutoreleasedReturnValue();
      free(v97);
      SSFileLog(v91, CFSTR("%@"), v98, v99, v100, v101, v102, v103, (uint64_t)v94);
    }

LABEL_84:
    -[SSAccountStore backingAccountStore](self, "backingAccountStore");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingAccount");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "_ss_appleAuthenticationAccountForAccount:error:", v105, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "_ss_DSID");
    v37 = objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v38)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v106 = objc_msgSend(v38, "shouldLog", v119);
      if (objc_msgSend(v38, "shouldLogToDisk"))
        v107 = v106 | 2;
      else
        v107 = v106;
      objc_msgSend(v38, "OSLogObject");
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        v39 = v107;
      else
        v39 = v107 & 2;
      if (v39)
      {
        v108 = (void *)objc_opt_class();
        v125 = 138543618;
        v126 = v108;
        v127 = 2114;
        v128 = v6;
        v109 = v108;
        LODWORD(v120) = 22;
        v110 = (void *)_os_log_send_and_compose_impl();

        if (!v110)
        {
          LOBYTE(v39) = 0;
          goto LABEL_71;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v110, 4, &v125, v120);
        v58 = objc_claimAutoreleasedReturnValue();
        free(v110);
        SSFileLog(v38, CFSTR("%@"), v111, v112, v113, v114, v115, v116, (uint64_t)v58);
        LOBYTE(v39) = 0;
      }
LABEL_70:

LABEL_71:
      goto LABEL_72;
    }
    goto LABEL_28;
  }
  LOBYTE(v39) = 1;
LABEL_72:

  return v39;
}

+ (void)resetExpiration
{
  objc_msgSend(a1, "resetExpirationForTokenType:", 0);
}

+ (void)resetExpirationForTokenType:(int64_t)a3
{
  const __CFString *v3;

  if (a3 == 1)
    v3 = (const __CFString *)objc_msgSend(CFSTR("LastAuthTime"), "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("InAppPurchase"));
  else
    v3 = CFSTR("LastAuthTime");
  CFPreferencesSetAppValue(v3, (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("com.apple.itunesstored"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
}

- (id)accountWithUniqueIdentifier:(id)a3 reloadIfNecessary:(BOOL)a4
{
  void *v4;
  void *v5;

  -[SSAccountStore accountWithUniqueIdentifier:](self, "accountWithUniqueIdentifier:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)getDefaultAccountNameUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SSAccountStore keyValueStore](self, "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SSAccountStore_getDefaultAccountNameUsingBlock___block_invoke;
  v7[3] = &unk_1E47BB158;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getValueForDomain:key:usingBlock:", CFSTR("com.apple.itunesstored"), CFSTR("DefaultAccountName"), v7);

}

uint64_t __50__SSAccountStore_getDefaultAccountNameUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)isAuthenticationActive
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("AuthenticationStarted"), CFSTR("com.apple.itunesstored"));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v5 = v4;
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v7 = v5 - v6;

    v8 = v7 <= 600.0 && v7 >= 0.0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isExpired
{
  return objc_msgSend(a1, "isExpiredForTokenType:", 0);
}

+ (BOOL)isExpiredForTokenType:(int64_t)a3
{
  const __CFString *v5;
  void *v6;
  double Current;
  double v8;
  double v9;
  double v10;
  BOOL v11;

  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
  if (a3 == 1)
    v5 = (const __CFString *)objc_msgSend(CFSTR("LastAuthTime"), "stringByAppendingFormat:", CFSTR("-%@"), CFSTR("InAppPurchase"));
  else
    v5 = CFSTR("LastAuthTime");
  v6 = (void *)CFPreferencesCopyAppValue(v5, CFSTR("com.apple.itunesstored"));
  if (v6)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v9 = v8;
    objc_msgSend(a1, "tokenExpirationInterval");
    v11 = Current > v9 + v10;
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (SSAccount)demoAccount
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SSAccountStore accounts](self, "accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "backingAccount");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "ams_isDemoAccount");

        if ((v8 & 1) != 0)
        {
          v3 = (void *)objc_msgSend(v6, "copy");
          goto LABEL_11;
        }
      }
      v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (SSAccount *)v3;
}

uint64_t __30__SSAccountStore_localAccount__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

+ (BOOL)migrateToAccountsFramework
{
  SSKeyValueStore *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  int v40;
  id v41;
  SSKeyValueStore *v42;
  id v43;
  void *v44;
  int v45;
  int v46;
  NSObject *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  NSObject *v65;
  int v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v80;
  int v81;
  NSObject *v82;
  int v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  NSObject *v94;
  int v95;
  void *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  int v106;
  int v107;
  NSObject *v108;
  int v109;
  void *v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _BOOL4 v119;
  void *v120;
  int v121;
  int v122;
  NSObject *v123;
  int v124;
  id v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  int v134;
  int v135;
  NSObject *v136;
  int v137;
  void *v138;
  id v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  id v148;
  uint64_t v149;
  void *v150;
  int v151;
  NSObject *v152;
  int v153;
  void *v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  int v163;
  NSObject *v164;
  int v165;
  void *v166;
  id v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  void *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  int v180;
  NSObject *v181;
  int v182;
  void *v183;
  id v184;
  int v185;
  int v186;
  void *v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  int *v196;
  int *v197;
  int *v198;
  int *v199;
  int *v200;
  int *v201;
  uint64_t v202;
  void *v203;
  char v204;
  void *v205;
  id v206;
  void *v207;
  id obj;
  SSKeyValueStore *v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  _QWORD v215[5];
  _QWORD v216[4];
  id v217;
  id v218;
  id v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  _QWORD block[4];
  id v225;
  int v226;
  id v227;
  __int16 v228;
  uint64_t v229;
  __int16 v230;
  id v231;
  __int16 v232;
  void *v233;
  _BYTE v234[128];
  uint64_t v235;

  v235 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(SSKeyValueStore);
  -[SSKeyValueStore accountDictionaries](v3, "accountDictionaries");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v203, "count"))
  {
    +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v120)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v121 = objc_msgSend(v120, "shouldLog");
    if (objc_msgSend(v120, "shouldLogToDisk"))
      v122 = v121 | 2;
    else
      v122 = v121;
    objc_msgSend(v120, "OSLogObject");
    v123 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
      v124 = v122;
    else
      v124 = v122 & 2;
    if (v124)
    {
      v226 = 138543362;
      v227 = (id)objc_opt_class();
      v125 = v227;
      LODWORD(v202) = 12;
      v126 = (void *)_os_log_send_and_compose_impl();

      if (!v126)
      {
LABEL_120:

        objc_msgSend(a1, "_excludeCopyKVSDatabasePathFromBackups");
        LOBYTE(v119) = 0;
        goto LABEL_184;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v126, 4, &v226, v202);
      v123 = objc_claimAutoreleasedReturnValue();
      free(v126);
      SSFileLog(v120, CFSTR("%@"), v127, v128, v129, v130, v131, v132, (uint64_t)v123);
    }

    goto LABEL_120;
  }
  if (+[SSDevice deviceIsInternalBuild](SSDevice, "deviceIsInternalBuild"))
    objc_msgSend(a1, "_copyKVSDatabaseWithError:", 0);
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (v8)
  {
    v226 = 138543362;
    v227 = (id)objc_opt_class();
    v9 = v227;
    LODWORD(v202) = 12;
    v196 = &v226;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v226, v202);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v4, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v7);
  }

LABEL_16:
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accountsCacheAccessQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SSAccountStore_migrateToAccountsFramework__block_invoke;
  block[3] = &unk_1E47B8790;
  v206 = v17;
  v225 = v206;
  dispatch_sync(v18, block);

  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = objc_msgSend(v19, "shouldLog", v196);
  if (objc_msgSend(v19, "shouldLogToDisk"))
    v21 = v20 | 2;
  else
    v21 = v20;
  objc_msgSend(v19, "OSLogObject");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    v23 = v21;
  else
    v23 = v21 & 2;
  if (!v23)
    goto LABEL_27;
  v24 = (void *)objc_opt_class();
  v25 = v24;
  v26 = objc_msgSend(v203, "count");
  v226 = 138543618;
  v227 = v24;
  v228 = 2048;
  v229 = v26;
  LODWORD(v202) = 22;
  v197 = &v226;
  v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v226, v202);
    v22 = objc_claimAutoreleasedReturnValue();
    free(v27);
    SSFileLog(v19, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v22);
LABEL_27:

  }
  -[SSKeyValueStore iTunesValueForKey:usedDomain:](v3, "iTunesValueForKey:usedDomain:", CFSTR("DSPersonID"), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v34 = 0;
  }
  -[SSKeyValueStore iTunesValueForKey:usedDomain:](v3, "iTunesValueForKey:usedDomain:", CFSTR("ActiveLockerAccountID"), 0, v197);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v35 = 0;
  }
  v222 = 0u;
  v223 = 0u;
  v220 = 0u;
  v221 = 0u;
  v36 = v203;
  v209 = v3;
  v213 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v220, v234, 16);
  v207 = v34;
  if (!v213)
  {

    v119 = 0;
    goto LABEL_123;
  }
  v205 = v35;
  v204 = 0;
  v212 = *(_QWORD *)v221;
  v214 = a1;
  obj = v36;
  do
  {
    for (i = 0; i != v213; ++i)
    {
      if (*(_QWORD *)v221 != v212)
        objc_enumerationMutation(obj);
      v38 = *(_QWORD *)(*((_QWORD *)&v220 + 1) + 8 * i);
      SSGenerateLogCorrelationString();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v219 = 0;
      v40 = objc_msgSend(a1, "_shouldRemoveAccountDictionaryWithoutMigration:reason:", v38, &v219);
      v41 = v219;
      if (v40)
      {
        v210 = v38;
        v42 = v3;
        v43 = v41;
        +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v44)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v45 = objc_msgSend(v44, "shouldLog", v198);
        if (objc_msgSend(v44, "shouldLogToDisk"))
          v46 = v45 | 2;
        else
          v46 = v45;
        objc_msgSend(v44, "OSLogObject");
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          v48 = v46;
        else
          v48 = v46 & 2;
        if (v48)
        {
          v49 = (void *)objc_opt_class();
          v226 = 138543874;
          v227 = v49;
          v228 = 2114;
          v229 = (uint64_t)v39;
          v230 = 2112;
          v50 = v43;
          v231 = v43;
          v51 = v49;
          LODWORD(v202) = 32;
          v198 = &v226;
          v52 = (void *)_os_log_send_and_compose_impl();

          v3 = v42;
          v53 = v210;
          if (v52)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v52, 4, &v226, v202);
            v47 = objc_claimAutoreleasedReturnValue();
            free(v52);
            SSFileLog(v44, CFSTR("%@"), v54, v55, v56, v57, v58, v59, (uint64_t)v47);
            goto LABEL_73;
          }
        }
        else
        {
          v50 = v43;
          v3 = v42;
          v53 = v210;
LABEL_73:

        }
        objc_msgSend(a1, "_removeAccountDictionary:fromKeyValueStore:", v53, v3);
        goto LABEL_92;
      }
      v211 = v41;
      objc_msgSend(v206, "accounts");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_ss_map:", &__block_literal_global_157);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v62)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v63 = objc_msgSend(v62, "shouldLog", v198);
      if (objc_msgSend(v62, "shouldLogToDisk"))
        v64 = v63 | 2;
      else
        v64 = v63;
      objc_msgSend(v62, "OSLogObject");
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        v66 = v64;
      else
        v66 = v64 & 2;
      if (v66)
      {
        v67 = (void *)objc_opt_class();
        v68 = v67;
        objc_msgSend(v214, "_hashedDescriptionFromAccountDictionary:", v38);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v226 = 138544130;
        v227 = v67;
        v3 = v209;
        v228 = 2114;
        v229 = (uint64_t)v39;
        v230 = 2114;
        v231 = v69;
        v232 = 2112;
        v233 = v61;
        LODWORD(v202) = 42;
        v199 = &v226;
        v70 = (void *)_os_log_send_and_compose_impl();

        a1 = v214;
        if (!v70)
          goto LABEL_61;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v70, 4, &v226, v202);
        v65 = objc_claimAutoreleasedReturnValue();
        free(v70);
        SSFileLog(v62, CFSTR("%@"), v71, v72, v73, v74, v75, v76, (uint64_t)v65);
      }

LABEL_61:
      v218 = 0;
      objc_msgSend(a1, "_migrateAccountDictionary:fromKeyValueStore:originalActiveDSID:originalActiveLockerDSID:logKey:error:", v38, v3, v207, v205, v39, &v218);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v218;
      +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = (void *)v79;
      if (!v77)
      {
        if (!v79)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v93 = objc_msgSend(v80, "shouldLog", v199);
        if (objc_msgSend(v80, "shouldLogToDisk"))
          v93 |= 2u;
        objc_msgSend(v80, "OSLogObject");
        v94 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
          v95 = v93;
        else
          v95 = v93 & 2;
        if (v95)
        {
          v96 = (void *)objc_opt_class();
          v226 = 138543874;
          v227 = v96;
          v228 = 2114;
          v229 = (uint64_t)v39;
          v230 = 2112;
          v231 = v78;
          v97 = v96;
          LODWORD(v202) = 32;
          v198 = &v226;
          v98 = (void *)_os_log_send_and_compose_impl();

          v50 = v211;
          if (!v98)
          {
LABEL_90:

            a1 = v214;
            goto LABEL_91;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v98, 4, &v226, v202);
          v94 = objc_claimAutoreleasedReturnValue();
          free(v98);
          SSFileLog(v80, CFSTR("%@"), v99, v100, v101, v102, v103, v104, (uint64_t)v94);
        }
        else
        {
          v50 = v211;
        }

        goto LABEL_90;
      }
      if (!v79)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v81 = objc_msgSend(v80, "shouldLog", v199);
      if (objc_msgSend(v80, "shouldLogToDisk"))
        v81 |= 2u;
      objc_msgSend(v80, "OSLogObject");
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
        v83 = v81;
      else
        v83 = v81 & 2;
      if (!v83)
      {
        v50 = v211;
        goto LABEL_86;
      }
      v84 = (void *)objc_opt_class();
      v226 = 138543618;
      v227 = v84;
      v228 = 2114;
      v229 = (uint64_t)v39;
      v85 = v84;
      LODWORD(v202) = 22;
      v198 = &v226;
      v86 = (void *)_os_log_send_and_compose_impl();

      v50 = v211;
      if (v86)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v86, 4, &v226, v202);
        v82 = objc_claimAutoreleasedReturnValue();
        free(v86);
        SSFileLog(v80, CFSTR("%@"), v87, v88, v89, v90, v91, v92, (uint64_t)v82);
LABEL_86:

      }
      a1 = v214;
      v3 = v209;
      objc_msgSend(v214, "_removeAccountDictionary:fromKeyValueStore:", v38, v209);
      v204 = 1;
LABEL_91:

LABEL_92:
    }
    v213 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v234, 16);
  }
  while (v213);

  if ((v204 & 1) != 0)
  {
    +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v105)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v106 = objc_msgSend(v105, "shouldLog", v198);
    if (objc_msgSend(v105, "shouldLogToDisk"))
      v107 = v106 | 2;
    else
      v107 = v106;
    objc_msgSend(v105, "OSLogObject");
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
      v109 = v107;
    else
      v109 = v107 & 2;
    if (v109)
    {
      v110 = (void *)objc_opt_class();
      v226 = 138543362;
      v227 = v110;
      v111 = v110;
      LODWORD(v202) = 12;
      v198 = &v226;
      v112 = (void *)_os_log_send_and_compose_impl();

      if (v112)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v112, 4, &v226, v202);
        v108 = objc_claimAutoreleasedReturnValue();
        free(v112);
        SSFileLog(v105, CFSTR("%@"), v113, v114, v115, v116, v117, v118, (uint64_t)v108);
        goto LABEL_106;
      }
    }
    else
    {
LABEL_106:

    }
    v35 = v205;
    objc_msgSend(a1, "_cleanupActiveAccountsAfterMigrationWithActiveDSID:activeLockerDSID:", v207, v205);
    v119 = 1;
  }
  else
  {
    v119 = 0;
    v35 = v205;
  }
LABEL_123:
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig", v198);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v133)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v134 = objc_msgSend(v133, "shouldLog");
  if (objc_msgSend(v133, "shouldLogToDisk"))
    v135 = v134 | 2;
  else
    v135 = v134;
  objc_msgSend(v133, "OSLogObject");
  v136 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
    v137 = v135;
  else
    v137 = v135 & 2;
  if (v137)
  {
    v138 = (void *)objc_opt_class();
    v226 = 138543362;
    v227 = v138;
    v139 = v138;
    LODWORD(v202) = 12;
    v200 = &v226;
    v140 = (void *)_os_log_send_and_compose_impl();

    if (v140)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v140, 4, &v226, v202);
      v136 = objc_claimAutoreleasedReturnValue();
      free(v140);
      SSFileLog(v133, CFSTR("%@"), v141, v142, v143, v144, v145, v146, (uint64_t)v136);
      goto LABEL_134;
    }
  }
  else
  {
LABEL_134:

  }
  objc_msgSend(v206, "accountsCacheAccessQueue");
  v147 = objc_claimAutoreleasedReturnValue();
  v216[0] = MEMORY[0x1E0C809B0];
  v216[1] = 3221225472;
  v216[2] = __44__SSAccountStore_migrateToAccountsFramework__block_invoke_158;
  v216[3] = &unk_1E47B8790;
  v148 = v206;
  v217 = v148;
  dispatch_sync(v147, v216);

  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v149 = objc_claimAutoreleasedReturnValue();
  v150 = (void *)v149;
  if (!v119)
  {
    if (!v149)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v163 = objc_msgSend(v150, "shouldLog", v200);
    if (objc_msgSend(v150, "shouldLogToDisk"))
      v163 |= 2u;
    objc_msgSend(v150, "OSLogObject");
    v164 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v164, OS_LOG_TYPE_INFO))
      v165 = v163;
    else
      v165 = v163 & 2;
    if (v165)
    {
      v166 = (void *)objc_opt_class();
      v226 = 138543362;
      v227 = v166;
      v167 = v166;
      LODWORD(v202) = 12;
      v201 = &v226;
      v168 = (void *)_os_log_send_and_compose_impl();

      if (!v168)
      {
LABEL_159:

        goto LABEL_160;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v168, 4, &v226, v202);
      v164 = objc_claimAutoreleasedReturnValue();
      free(v168);
      SSFileLog(v150, CFSTR("%@"), v169, v170, v171, v172, v173, v174, (uint64_t)v164);
    }

    goto LABEL_159;
  }
  if (!v149)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v151 = objc_msgSend(v150, "shouldLog", v200);
  if (objc_msgSend(v150, "shouldLogToDisk"))
    v151 |= 2u;
  objc_msgSend(v150, "OSLogObject");
  v152 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
    v153 = v151;
  else
    v153 = v151 & 2;
  if (v153)
  {
    v154 = (void *)objc_opt_class();
    v226 = 138543362;
    v227 = v154;
    v155 = v154;
    LODWORD(v202) = 12;
    v201 = &v226;
    v156 = (void *)_os_log_send_and_compose_impl();

    if (v156)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v156, 4, &v226, v202);
      v152 = objc_claimAutoreleasedReturnValue();
      free(v156);
      SSFileLog(v150, CFSTR("%@"), v157, v158, v159, v160, v161, v162, (uint64_t)v152);
      goto LABEL_146;
    }
  }
  else
  {
LABEL_146:

  }
  objc_msgSend(a1, "_postAccountsChangedInternalDarwinNotification");
  objc_msgSend(a1, "_postAccountsChangedDarwinNotification");
LABEL_160:
  -[SSKeyValueStore accountDictionaries](v3, "accountDictionaries", v201);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v215[0] = MEMORY[0x1E0C809B0];
  v215[1] = 3221225472;
  v215[2] = __44__SSAccountStore_migrateToAccountsFramework__block_invoke_159;
  v215[3] = &__block_descriptor_40_e32___NSString_16__0__NSDictionary_8l;
  v215[4] = a1;
  objc_msgSend(v175, "_ss_map:", v215);
  v176 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = objc_msgSend(v176, "count");
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v178 = objc_claimAutoreleasedReturnValue();
  v179 = (void *)v178;
  if (v177)
  {
    if (!v178)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v180 = objc_msgSend(v179, "shouldLog");
    if (objc_msgSend(v179, "shouldLogToDisk"))
      v180 |= 2u;
    objc_msgSend(v179, "OSLogObject");
    v181 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
      v182 = v180;
    else
      v182 = v180 & 2;
    if (v182)
    {
      v183 = (void *)objc_opt_class();
      v226 = 138543618;
      v227 = v183;
      v228 = 2112;
      v229 = (uint64_t)v176;
      v184 = v183;
      LODWORD(v202) = 22;
      goto LABEL_179;
    }
LABEL_181:

  }
  else
  {
    if (!v178)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v185 = objc_msgSend(v179, "shouldLog");
    if (objc_msgSend(v179, "shouldLogToDisk"))
      v185 |= 2u;
    objc_msgSend(v179, "OSLogObject");
    v181 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_INFO))
      v186 = v185;
    else
      v186 = v185 & 2;
    if (!v186)
      goto LABEL_181;
    v187 = (void *)objc_opt_class();
    v226 = 138543362;
    v227 = v187;
    v184 = v187;
    LODWORD(v202) = 12;
LABEL_179:
    v188 = (void *)_os_log_send_and_compose_impl();

    if (v188)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v188, 4, &v226, v202);
      v181 = objc_claimAutoreleasedReturnValue();
      free(v188);
      SSFileLog(v179, CFSTR("%@"), v189, v190, v191, v192, v193, v194, (uint64_t)v181);
      v3 = v209;
      goto LABEL_181;
    }
    v3 = v209;
  }

LABEL_184:
  return v119;
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInProcessCacheDisabled:", 1);
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke_155(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hashedDescription");
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke_158(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAccountsCache:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setInProcessCacheDisabled:", 0);
}

uint64_t __44__SSAccountStore_migrateToAccountsFramework__block_invoke_159(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hashedDescriptionFromAccountDictionary:", a2);
}

- (BOOL)removeAccount:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  int v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__19;
  v40 = __Block_byref_object_dispose__19;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v7 = dispatch_semaphore_create(0);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __38__SSAccountStore_removeAccount_error___block_invoke;
  v28[3] = &unk_1E47BB230;
  v30 = &v36;
  v31 = &v32;
  v8 = v7;
  v29 = v8;
  -[SSAccountStore removeAccount:completion:](self, "removeAccount:completion:", v6, v28);
  v9 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v8, v9))
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    v12 = objc_msgSend(v10, "shouldLogToDisk");
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      v11 |= 2u;
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      v15 = (id)objc_opt_class();
      objc_msgSend(v6, "accountName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543618;
      v43 = v15;
      v44 = 2114;
      v45 = v17;
      LODWORD(v27) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v42, v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      free(v18);
      SSFileLog(v10, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v14);
    }

    goto LABEL_12;
  }
LABEL_13:
  if (a4)
    *a4 = objc_retainAutorelease((id)v37[5]);
  v25 = *((_BYTE *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v25;
}

void __38__SSAccountStore_removeAccount_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (void)removeAccount:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  uint64_t v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  void (**v43)(id, uint64_t, _QWORD);
  void *v44;
  int v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      v11 &= 2u;
    if (v11)
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      objc_msgSend(v6, "accountName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v15);
      v45 = 138543618;
      v46 = v13;
      v47 = 2114;
      v48 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v45, v40);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v9, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v12);
    }

LABEL_13:
    v23 = objc_msgSend((id)objc_opt_class(), "unitTestModeEnabled");
    v24 = (void *)objc_opt_class();
    v25 = v24;
    if (v23)
    {
      objc_msgSend(v24, "_removeAccountFromUnitTestStore:", v6);
      __AccountsChangedInternal();
      if ((objc_msgSend((id)objc_opt_class(), "areAccountStoreChangedNotificationsDisabled") & 1) == 0)
        __AccountsChanged();
      if (v7)
        v7[2](v7, 1, 0);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_backingAccountForAccount:", v6);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSAccountStore backingAccountStore](self, "backingAccountStore");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __43__SSAccountStore_removeAccount_completion___block_invoke;
      v41[3] = &unk_1E47BB258;
      v44 = v25;
      v42 = v37;
      v43 = v7;
      v39 = v37;
      objc_msgSend(v38, "removeAccount:withCompletionHandler:", v39, v41);

    }
    goto LABEL_32;
  }
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    v27 = v26 | 2;
  else
    v27 = v26;
  objc_msgSend(v9, "OSLogObject");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    v27 &= 2u;
  if (v27)
  {
    v45 = 138543362;
    v46 = (id)objc_opt_class();
    v29 = v46;
    LODWORD(v40) = 12;
    v30 = (void *)_os_log_send_and_compose_impl();

    if (!v30)
      goto LABEL_29;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v30, 4, &v45, v40);
    v28 = objc_claimAutoreleasedReturnValue();
    free(v30);
    SSFileLog(v9, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v28);
  }

LABEL_29:
  if (v7)
    v7[2](v7, 0, 0);
LABEL_32:

}

void __43__SSAccountStore_removeAccount_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "shouldLog");
    if (objc_msgSend(v6, "shouldLogToDisk"))
      v8 = v7 | 2;
    else
      v8 = v7;
    objc_msgSend(v6, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      v10 = v8;
    else
      v10 = v8 & 2;
    if (v10)
    {
      v11 = (void *)objc_opt_class();
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v14);
      v24 = 138543874;
      v25 = v11;
      v26 = 2114;
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = 2112;
      v29 = v5;
      LODWORD(v23) = 32;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v24, v23);
      v9 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v6, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v9);
    }

    goto LABEL_14;
  }
LABEL_15:
  v22 = *(_QWORD *)(a1 + 40);
  if (v22)
    (*(void (**)(uint64_t, uint64_t, id))(v22 + 16))(v22, a2, v5);

}

- (void)removeAllAccountsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  -[SSAccountStore accounts](self, "accounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke;
  v9[3] = &unk_1E47BB2A8;
  objc_copyWeak(&v12, &location);
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  dispatch_time_t v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD block[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  int v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = dispatch_group_create();
  v4 = dispatch_queue_create("com.apple.StoreServices.SSAccountStore.removeAccountsQueue", MEMORY[0x1E0C80D50]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v30 = a1;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        block[0] = v9;
        block[1] = 3221225472;
        block[2] = __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_2;
        block[3] = &unk_1E47B8768;
        block[4] = WeakRetained;
        block[5] = v11;
        dispatch_group_async(v3, v4, block);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v7);
  }

  v12 = dispatch_time(0, 300000000000);
  if (dispatch_group_wait(v3, v12))
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      v17 = v15;
    else
      v17 = v15 & 2;
    if (v17)
    {
      v18 = (void *)objc_opt_class();
      v19 = *(_QWORD *)(v30 + 32);
      v36 = 138543618;
      v37 = v18;
      v38 = 2112;
      v39 = v19;
      v20 = v18;
      LODWORD(v29) = 22;
      v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v21, 4, &v36, v29);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v21);
      SSFileLog(v13, CFSTR("%@"), v22, v23, v24, v25, v26, v27, (uint64_t)v16);
    }

    goto LABEL_21;
  }
LABEL_22:
  v28 = *(_QWORD *)(v30 + 40);
  if (v28)
    (*(void (**)(void))(v28 + 16))();

}

void __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_semaphore_create(0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_3;
  v24[3] = &unk_1E47BB280;
  v5 = v2;
  v25 = v5;
  objc_msgSend(v3, "removeAccount:completion:", v4, v24);
  v6 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v11 = (void *)objc_opt_class();
      v12 = *(void **)(a1 + 40);
      v13 = v11;
      objc_msgSend(v12, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v11;
      v28 = 2114;
      v29 = v15;
      LODWORD(v23) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v26, v23);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v7, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v10);
    }

    goto LABEL_13;
  }
LABEL_14:

}

intptr_t __50__SSAccountStore_removeAllAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeCookiesForAccount:(id)a3 logKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[SSLogConfig sharedAccountsCookiesConfig](SSLogConfig, "sharedAccountsCookiesConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_11;
  v11 = (void *)objc_opt_class();
  v12 = v11;
  objc_msgSend(v5, "accountName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v13);
  v23 = 138543874;
  v24 = v11;
  v25 = 2114;
  v26 = v6;
  v27 = 2114;
  v28 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = 32;
  v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v23, v22);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog(v7, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v10);
LABEL_11:

  }
  +[SSVCookieStorage sharedStorage](SSVCookieStorage, "sharedStorage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeCookiesWithAccount:", v5);

}

- (void)resetExpiration
{
  objc_msgSend((id)objc_opt_class(), "resetExpiration");
}

- (void)resetExpirationForTokenType:(int64_t)a3
{
  objc_msgSend((id)objc_opt_class(), "resetExpirationForTokenType:", a3);
}

- (void)saveAccount:(id)a3 completion:(id)a4
{
  -[SSAccountStore saveAccount:verifyCredentials:completion:](self, "saveAccount:verifyCredentials:completion:", a3, 1, a4);
}

- (BOOL)saveAccount:(id)a3 error:(id *)a4
{
  return -[SSAccountStore saveAccount:verifyCredentials:error:](self, "saveAccount:verifyCredentials:error:", a3, 1, a4);
}

- (void)saveAccount:(id)a3 verifyCredentials:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v8 = a5;
  -[SSAccountStore _saveAccount:verifyCredentials:](self, "_saveAccount:verifyCredentials:", a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SSAccountStore_saveAccount_verifyCredentials_completion___block_invoke;
  v11[3] = &unk_1E47BB2D0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "addFinishBlock:", v11);

}

void __59__SSAccountStore_saveAccount_verifyCredentials_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v5 = a3;
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, objc_msgSend(a2, "BOOLValue"), v5);

  }
}

- (BOOL)saveAccount:(id)a3 verifyCredentials:(BOOL)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  char v8;

  -[SSAccountStore _saveAccount:verifyCredentials:](self, "_saveAccount:verifyCredentials:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultWithTimeout:error:", a5, 5.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (void)setDefaultAccountName:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[SSAccountStore keyValueStore](self, "keyValueStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__SSAccountStore_setDefaultAccountName_completionBlock___block_invoke;
  v10[3] = &unk_1E47BB2F8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "setValue:forDomain:key:completionBlock:", v7, CFSTR("com.apple.itunesstored"), CFSTR("DefaultAccountName"), v10);

}

uint64_t __56__SSAccountStore_setDefaultAccountName_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)setAuthenticationStartedDate:(id)a3
{
  CFPreferencesSetAppValue(CFSTR("AuthenticationStarted"), a3, CFSTR("com.apple.itunesstored"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
}

- (void)signOutAccount:(id)a3
{
  -[SSAccountStore signOutAccount:completion:](self, "signOutAccount:completion:", a3, 0);
}

- (void)signOutAccount:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SSPromise *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  _BYTE location[12];
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  SSGenerateLogCorrelationString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = objc_msgSend(v8, "shouldLog");
  if (objc_msgSend(v8, "shouldLogToDisk"))
    v9 |= 2u;
  objc_msgSend(v8, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v11 = v9;
  else
    v11 = v9 & 2;
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    v13 = v12;
    objc_msgSend(v6, "accountName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v14);
    *(_DWORD *)location = 138543874;
    *(_QWORD *)&location[4] = v12;
    v44 = 2114;
    v45 = v7;
    v46 = 2114;
    v47 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = 32;
    v15 = (void *)_os_log_send_and_compose_impl();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, location, v32);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v8, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);

    }
  }
  else
  {

  }
  objc_msgSend(v6, "setActive:", 0);
  v23 = objc_alloc_init(SSPromise);
  objc_initWeak((id *)location, self);
  v24 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __44__SSAccountStore_signOutAccount_completion___block_invoke;
  v38[3] = &unk_1E47BB320;
  objc_copyWeak(&v42, (id *)location);
  v25 = v7;
  v39 = v25;
  v26 = v6;
  v40 = v26;
  v27 = v33;
  v41 = v27;
  -[SSPromise addSuccessBlock:](v23, "addSuccessBlock:", v38);
  v34[0] = v24;
  v34[1] = 3221225472;
  v34[2] = __44__SSAccountStore_signOutAccount_completion___block_invoke_168;
  v34[3] = &unk_1E47BB348;
  v34[4] = self;
  v28 = v25;
  v35 = v28;
  v29 = v26;
  v36 = v29;
  v30 = v27;
  v37 = v30;
  -[SSPromise addErrorBlock:](v23, "addErrorBlock:", v34);
  -[SSPromise BOOLCompletionHandlerAdapter](v23, "BOOLCompletionHandlerAdapter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAccountStore saveAccount:verifyCredentials:completion:](self, "saveAccount:verifyCredentials:completion:", v29, 0, v31);

  objc_destroyWeak(&v42);
  objc_destroyWeak((id *)location);

}

void __44__SSAccountStore_signOutAccount_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    v7 = v5;
  else
    v7 = v5 & 2;
  if (v7)
  {
    v8 = (void *)objc_opt_class();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = v8;
    objc_msgSend(v9, "accountName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v12);
    v22 = 138543874;
    v23 = v8;
    v24 = 2114;
    v25 = v10;
    v26 = 2114;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 32;
    v13 = (void *)_os_log_send_and_compose_impl();

    if (!v13)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v13);
    SSFileLog(v3, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v6);
  }

LABEL_13:
  objc_msgSend(WeakRetained, "removeCookiesForAccount:logKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v20 = *(_QWORD *)(a1 + 48);
  if (v20)
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v20 + 16))(v20, 1, 0);

}

void __44__SSAccountStore_signOutAccount_completion___block_invoke_168(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    v8 = v6;
  else
    v8 = v6 & 2;
  if (v8)
  {
    v9 = (void *)objc_opt_class();
    v11 = a1[5];
    v10 = (void *)a1[6];
    v12 = v9;
    objc_msgSend(v10, "accountName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SSHashIfNeeded(v13);
    v23 = 138544130;
    v24 = v9;
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = (id)objc_claimAutoreleasedReturnValue();
    v29 = 2112;
    v30 = v3;
    LODWORD(v22) = 42;
    v14 = (void *)_os_log_send_and_compose_impl();

    if (!v14)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v23, v22);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v14);
    SSFileLog(v4, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v7);
  }

LABEL_13:
  v21 = a1[7];
  if (v21)
    (*(void (**)(uint64_t, _QWORD, id))(v21 + 16))(v21, 0, v3);

}

- (id)updateAccountWithAuthKit:(id)a3 store:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  SSUpdateAccountResponse *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  SSUpdateAccountResponse *v33;
  void *v34;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _BYTE location[12];
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitSkipAuthKitKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v17 = v15;
    else
      v17 = v15 & 2;
    if (v17)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = self;
      v46 = 2114;
      v47 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v36) = 22;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, location, v36);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        free(v18);
        SSFileLog(v13, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v19);

      }
    }
    else
    {

    }
    v33 = [SSUpdateAccountResponse alloc];
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCredentialSource"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:](v33, "initWithUpdatedAccount:credentialSource:", v8, objc_msgSend(v34, "unsignedIntegerValue"));

    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", v26);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SSAccountStoresProxiedDeviceFlagKey"));
    v26 = (SSUpdateAccountResponse *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[SSUpdateAccountResponse BOOLValue](v26, "BOOLValue"))
    {
      v27 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SSAccountStoreAuthKitAllowSilentAuth"));

      v10 = v27;
    }
    -[SSAccountStore _shouldCreateNewAccountForAccount:options:](self, "_shouldCreateNewAccountForAccount:options:", v8, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, self);
    v29 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke;
    v40[3] = &unk_1E47BB370;
    objc_copyWeak(&v44, (id *)location);
    v30 = v10;
    v41 = v30;
    v42 = v8;
    v43 = v9;
    objc_msgSend(v28, "thenWithBlock:", v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v29;
    v37[1] = 3221225472;
    v37[2] = __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke_182;
    v37[3] = &unk_1E47BB398;
    objc_copyWeak(&v39, (id *)location);
    v10 = v30;
    v38 = v10;
    objc_msgSend(v31, "thenWithBlock:", v37);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v44);
    objc_destroyWeak((id *)location);

  }
  return v32;
}

id __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  _QWORD v44[4];
  int v45;
  id v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = objc_msgSend(v4, "integerValue");

  if (v6 == 3)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      v22 &= 2u;
    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v45 = 138543618;
      v46 = WeakRetained;
      v47 = 2114;
      v48 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v43) = 22;
      v24 = (void *)_os_log_send_and_compose_impl();

      if (!v24)
      {
LABEL_26:

        v31 = SSViTunesStoreFramework();
        v32 = objc_alloc((Class)SSVWeakLinkedClassForString(CFSTR("ISCreateAccountOperation"), v31));
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCreateAccountDSIDKey"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCreateAccountQueryParamsKey"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCreateAccountTargetIdentifierKey"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v32, "initWithDSID:additionalQueryParams:targetIdentifier:", v33, v34, v35);

        v36 = SSViTunesStoreFramework();
        objc_msgSend(SSVWeakLinkedClassForString(CFSTR("ISOperationQueue"), v36), "mainQueue");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addOperation:", v18);

        SSError((uint64_t)CFSTR("SSErrorDomain"), 140, 0, (uint64_t)CFSTR("The user opted to create a new account."));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v38);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v45, v43);
      v23 = objc_claimAutoreleasedReturnValue();
      free(v24);
      SSFileLog(v20, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v23);
    }

    goto LABEL_26;
  }
  if (v6 != 2)
  {
    objc_msgSend(WeakRetained, "_updateAccountWithAuthKitViaSilentPETAuth:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v18;
    objc_msgSend(WeakRetained, "_updateAccountWithAuthKitViaSilentPasswordAuth:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v38;
    objc_msgSend(WeakRetained, "_updateAccountWithAuthKitViaSilentAuth:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v39;
    objc_msgSend(WeakRetained, "_updateAccountWithAuthKitViaPromptAuth:store:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSPromise promiseWithAny:](SSPromise, "promiseWithAny:", v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v45 = 138543618;
  v46 = WeakRetained;
  v47 = 2114;
  v48 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v43) = 22;
  v11 = (void *)_os_log_send_and_compose_impl();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4, &v45, v43);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v11);
    SSFileLog(v7, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v10);
LABEL_13:

  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), 140, 0, (uint64_t)CFSTR("The user cancelled the create account dialog."));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:

  return v19;
}

id __57__SSAccountStore_updateAccountWithAuthKit_store_options___block_invoke_182(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SSUpdateAccountResponse *v25;
  void *v26;
  uint64_t v28;
  int v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "updatedAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isActive") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    if (objc_msgSend(v5, "accountScope") == 1)
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStoreForMediaType:", *MEMORY[0x1E0CFD7A8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "ams_activeiTunesAccount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(WeakRetained, "activeAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
    }
    v6 = v8 == 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCanSetActiveAccountKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = objc_msgSend(v10, "BOOLValue");
  if ((v11 & v6) != 1)
  {
    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", v3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = objc_msgSend(v12, "shouldLog");
  if (objc_msgSend(v12, "shouldLogToDisk"))
    v14 = v13 | 2;
  else
    v14 = v13;
  objc_msgSend(v12, "OSLogObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    v14 &= 2u;
  if (!v14)
    goto LABEL_21;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v17);
  v29 = 138543874;
  v30 = WeakRetained;
  v31 = 2114;
  v32 = v16;
  v33 = 2114;
  v34 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v28) = 32;
  v18 = (void *)_os_log_send_and_compose_impl();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v29, v28);
    v15 = objc_claimAutoreleasedReturnValue();
    free(v18);
    SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v15);
LABEL_21:

  }
  objc_msgSend(v5, "setActive:", 1);
  v25 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:]([SSUpdateAccountResponse alloc], "initWithUpdatedAccount:credentialSource:", v5, objc_msgSend(v3, "credentialSource"));
  +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
  return v26;
}

+ (void)setUnitTestModeEnabled:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[4];
  BOOL v6;

  objc_msgSend(a1, "_unitTestAccountsAccessQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SSAccountStore_setUnitTestModeEnabled___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = a3;
  dispatch_barrier_async(v4, block);

}

void __41__SSAccountStore_setUnitTestModeEnabled___block_invoke(uint64_t a1)
{
  int v1;
  id v2;
  void *v3;
  id v4;

  v1 = *(unsigned __int8 *)(a1 + 32);
  if (sUnitTestModeEnabled != v1)
  {
    sUnitTestModeEnabled = *(_BYTE *)(a1 + 32);
    if (v1)
    {
      if (!sUnitTestAccounts)
      {
        v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v3 = (void *)sUnitTestAccounts;
        sUnitTestAccounts = (uint64_t)v2;

      }
    }
    else
    {
      objc_msgSend((id)sUnitTestAccounts, "removeAllObjects");
    }
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearCachedAccounts");

  }
}

+ (void)_addAccountToUnitTestStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_unitTestAccountsAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SSAccountStore__addAccountToUnitTestStore___block_invoke;
  block[3] = &unk_1E47B8790;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, block);

}

void __45__SSAccountStore__addAccountToUnitTestStore___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)sUnitTestAccounts;
  if (!sUnitTestAccounts)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)sUnitTestAccounts;
    sUnitTestAccounts = (uint64_t)v3;

    v2 = (void *)sUnitTestAccounts;
  }
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "backingAccount");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, v6);

}

+ (void)_removeAccountFromUnitTestStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "_unitTestAccountsAccessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__SSAccountStore__removeAccountFromUnitTestStore___block_invoke;
  block[3] = &unk_1E47B8790;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, block);

}

void __50__SSAccountStore__removeAccountFromUnitTestStore___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)sUnitTestAccounts;
  if (!sUnitTestAccounts)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)sUnitTestAccounts;
    sUnitTestAccounts = (uint64_t)v3;

    v2 = (void *)sUnitTestAccounts;
  }
  objc_msgSend(*(id *)(a1 + 32), "backingAccount");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v5);

}

+ (id)_backingAccountForAccount:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "backingAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)_buyParamsForBuyParamsString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("&"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count") == 2)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_copyKVSDatabasePath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[SSKeyValueStoreSchema databasePath](SSKeyValueStoreSchema, "databasePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-copy"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("sqlitedb"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_copyKVSDatabaseWithError:(id *)a3
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  id v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  id v51;
  id *v52;
  void *v53;
  int v54;
  int v55;
  NSObject *v56;
  int v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int *v68;
  uint64_t v69;
  void *v70;
  id v71;
  id v72;
  int v73;
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    v7 &= 2u;
  if (v7)
  {
    v73 = 138543362;
    v74 = (id)objc_opt_class();
    v9 = v74;
    LODWORD(v69) = 12;
    v68 = &v73;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (!v10)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, &v73, v69);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
  }

LABEL_12:
  +[SSKeyValueStoreSchema databasePath](SSKeyValueStoreSchema, "databasePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(a1, "_copyKVSDatabasePath");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "fileExistsAtPath:", v18))
    goto LABEL_38;
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_msgSend(v20, "shouldLog", v68);
  if (objc_msgSend(v20, "shouldLogToDisk"))
    v22 = v21 | 2;
  else
    v22 = v21;
  objc_msgSend(v20, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    v22 &= 2u;
  if (v22)
  {
    v24 = (void *)objc_opt_class();
    v73 = 138543362;
    v74 = v24;
    v25 = v24;
    LODWORD(v69) = 12;
    v68 = &v73;
    v26 = (void *)_os_log_send_and_compose_impl();

    if (!v26)
      goto LABEL_24;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v26, 4, &v73, v69);
    v23 = objc_claimAutoreleasedReturnValue();
    free(v26);
    SSFileLog(v20, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v23);
  }

LABEL_24:
  v72 = 0;
  v33 = objc_msgSend(v19, "removeItemAtPath:error:", v18, &v72);
  v34 = v72;
  if ((v33 & 1) == 0)
  {
    +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v35)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v36 = objc_msgSend(v35, "shouldLog", v68);
    if (objc_msgSend(v35, "shouldLogToDisk"))
      v37 = v36 | 2;
    else
      v37 = v36;
    objc_msgSend(v35, "OSLogObject");
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      v37 &= 2u;
    if (v37)
    {
      v39 = (void *)objc_opt_class();
      v73 = 138543618;
      v74 = v39;
      v75 = 2112;
      v76 = v34;
      v40 = v17;
      v41 = a3;
      v42 = v39;
      LODWORD(v69) = 22;
      v68 = &v73;
      v43 = (void *)_os_log_send_and_compose_impl();

      a3 = v41;
      v17 = v40;

      if (!v43)
      {
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, &v73, v69);
      v38 = objc_claimAutoreleasedReturnValue();
      free(v43);
      SSFileLog(v35, CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v38);
    }

    goto LABEL_36;
  }
LABEL_37:

LABEL_38:
  v71 = 0;
  v50 = objc_msgSend(v19, "copyItemAtPath:toPath:error:", v17, v18, &v71, v68);
  v51 = v71;
  if (v50)
  {
    objc_msgSend(a1, "_excludeCopyKVSDatabasePathFromBackups");
    if (!a3)
      goto LABEL_56;
    goto LABEL_55;
  }
  v70 = v17;
  v52 = a3;
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54 = objc_msgSend(v53, "shouldLog");
  if (objc_msgSend(v53, "shouldLogToDisk"))
    v55 = v54 | 2;
  else
    v55 = v54;
  objc_msgSend(v53, "OSLogObject");
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    v57 = v55;
  else
    v57 = v55 & 2;
  if (v57)
  {
    v58 = (void *)objc_opt_class();
    v73 = 138543618;
    v74 = v58;
    v75 = 2112;
    v76 = v51;
    v59 = v58;
    LODWORD(v69) = 22;
    v60 = (void *)_os_log_send_and_compose_impl();

    a3 = v52;
    v17 = v70;
    if (!v60)
      goto LABEL_54;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v60, 4, &v73, v69);
    v56 = objc_claimAutoreleasedReturnValue();
    free(v60);
    SSFileLog(v53, CFSTR("%@"), v61, v62, v63, v64, v65, v66, (uint64_t)v56);
  }
  else
  {
    a3 = v52;
    v17 = v70;
  }

LABEL_54:
  if (a3)
LABEL_55:
    *a3 = objc_retainAutorelease(v51);
LABEL_56:

  return v50;
}

+ (BOOL)_currentProcessLinksUIKit
{
  return NSClassFromString(CFSTR("UIApplication")) != 0;
}

+ (void)_disableAccountStoreChangedNotifications
{
  CFPreferencesSetAppValue(CFSTR("AccountsChangedNotificationsSuppressionStarted"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0C99D68], "date"), CFSTR("com.apple.itunesstored"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
}

+ (void)_enableAccountStoreChangedNotifications
{
  CFPreferencesSetAppValue(CFSTR("AccountsChangedNotificationsSuppressionStarted"), 0, CFSTR("com.apple.itunesstored"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
}

+ (void)_excludeCopyKVSDatabasePathFromBackups
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "_copyKVSDatabasePath");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (!v5)
    {
LABEL_17:

      goto LABEL_18;
    }
    v7 = *MEMORY[0x1E0C999D8];
    v24 = 0;
    v8 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v7, &v24);
    v9 = v24;
    if ((v8 & 1) != 0)
    {
LABEL_16:

      goto LABEL_17;
    }
    +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v14 = (void *)objc_opt_class();
      v25 = 138543618;
      v26 = v14;
      v27 = 2112;
      v28 = v9;
      v15 = v14;
      LODWORD(v23) = 22;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, &v25, v23);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v16);
      SSFileLog(v10, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v13);
    }

    goto LABEL_15;
  }
LABEL_18:

}

+ (id)_hashedDescriptionFromAccountDictionary:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AltDSID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DSPersonID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("FirstName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LastName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AccountURLBagType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AccountStoreFront"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SSHashIfNeeded(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppleID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  SSHashIfNeeded(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<altDSID = %@ | DSID = %@ | username = %@ | firstName = %@ | lastName = %@ | storefront = %@ | scope = %@>"), v5, v8, v17, v10, v12, v15, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)_isBuddyRunning
{
  return softLinkBYSetupAssistantNeedsToRun();
}

+ (void)_postAccountsChangedInternalDarwinNotification
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  LODWORD(v16) = 138543362;
  *(_QWORD *)((char *)&v16 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v16 + 4);
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15, v16);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.itunesstored.accountschanged.internal"), 0, 0, 1u);
}

+ (void)_postAccountsChangedDarwinNotification
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  LODWORD(v16) = 138543362;
  *(_QWORD *)((char *)&v16 + 4) = objc_opt_class();
  v6 = *(id *)((char *)&v16 + 4);
  LODWORD(v15) = 12;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, &v16, v15, v16);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.itunesstored.accountschanged"), 0, 0, 1u);
}

- (void)_postAccountStoreChangeNotification
{
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];
  int v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SSAccountStore notificationQueue](self, "notificationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = -[NSObject shouldLog](v4, "shouldLog");
    if (-[NSObject shouldLogToDisk](v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    -[NSObject OSLogObject](v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v18 = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = CFSTR("SSAccountStoreChangedNotification");
      v8 = v19;
      LODWORD(v16) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v16);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  -[SSAccountStore notificationQueue](self, "notificationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SSAccountStore__postAccountStoreChangeNotification__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(v4, block);
LABEL_14:

}

void __53__SSAccountStore__postAccountStoreChangeNotification__block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _BYTE *v31;
  uint64_t v32;
  _BYTE v33[22];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = CFPreferencesGetAppBooleanValue(CFSTR("ActiveAccountIsManagedAppleID"), CFSTR("com.apple.itunesstored"), 0) != 0;
  objc_msgSend(*(id *)(a1 + 32), "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isManagedAppleID");

  if (v2 != (_DWORD)v4)
  {
    objc_msgSend((id)objc_opt_class(), "_setActiveAccountIsManagedAppleIDPreference:", v4);
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      v7 &= 2u;
    if (v7)
    {
      *(_DWORD *)v33 = 138543362;
      *(_QWORD *)&v33[4] = objc_opt_class();
      v9 = *(id *)&v33[4];
      LODWORD(v32) = 12;
      v31 = v33;
      v10 = (void *)_os_log_send_and_compose_impl();

      if (!v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, v33, v32, *(_OWORD *)v33);
      v8 = objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

    goto LABEL_13;
  }
LABEL_14:
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig", v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = objc_msgSend(v17, "shouldLog");
  if (objc_msgSend(v17, "shouldLogToDisk"))
    v19 = v18 | 2;
  else
    v19 = v18;
  objc_msgSend(v17, "OSLogObject");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    v19 &= 2u;
  if (!v19)
    goto LABEL_24;
  v21 = (void *)objc_opt_class();
  *(_DWORD *)v33 = 138543618;
  *(_QWORD *)&v33[4] = v21;
  *(_WORD *)&v33[12] = 2114;
  *(_QWORD *)&v33[14] = CFSTR("SSAccountStoreChangedNotification");
  v22 = v21;
  LODWORD(v32) = 22;
  v23 = (void *)_os_log_send_and_compose_impl();

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, v33, v32);
    v20 = objc_claimAutoreleasedReturnValue();
    free(v23);
    SSFileLog(v17, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v20);
LABEL_24:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "postNotificationName:object:", CFSTR("_SSAccountStoreDidChangeNotification"), *(_QWORD *)(a1 + 32));
  objc_msgSend(v30, "postNotificationName:object:", CFSTR("SSAccountStoreChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_postActiveAccountChangedNotification
{
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];
  int v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SSAccountStore notificationQueue](self, "notificationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = -[NSObject shouldLog](v4, "shouldLog");
    if (-[NSObject shouldLogToDisk](v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    -[NSObject OSLogObject](v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v18 = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = CFSTR("SSAccountStoreActiveAccountChangedNotification");
      v8 = v19;
      LODWORD(v16) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v16);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  -[SSAccountStore notificationQueue](self, "notificationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SSAccountStore__postActiveAccountChangedNotification__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(v4, block);
LABEL_14:

}

void __55__SSAccountStore__postActiveAccountChangedNotification__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  *(_DWORD *)v16 = 138543618;
  *(_QWORD *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2114;
  *(_QWORD *)&v16[14] = CFSTR("SSAccountStoreActiveAccountChangedNotification");
  v6 = *(id *)&v16[4];
  LODWORD(v15) = 22;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, v16, v15, *(_OWORD *)v16, *(_QWORD *)&v16[16]);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("SSAccountStoreActiveAccountChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_postAuthenticationActivityNotification
{
  void *v3;
  NSObject *v4;
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];
  int v18;
  id v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SSAccountStore notificationQueue](self, "notificationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = -[NSObject shouldLog](v4, "shouldLog");
    if (-[NSObject shouldLogToDisk](v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    -[NSObject OSLogObject](v4, "OSLogObject");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      v6 &= 2u;
    if (v6)
    {
      v18 = 138543618;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = CFSTR("SSAccountStoreChangedNotification");
      v8 = v19;
      LODWORD(v16) = 22;
      v9 = (void *)_os_log_send_and_compose_impl();

      if (!v9)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v9, 4, &v18, v16);
      v7 = objc_claimAutoreleasedReturnValue();
      free(v9);
      SSFileLog(v4, CFSTR("%@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    }

    goto LABEL_14;
  }
  -[SSAccountStore notificationQueue](self, "notificationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SSAccountStore__postAuthenticationActivityNotification__block_invoke;
  block[3] = &unk_1E47B8790;
  block[4] = self;
  dispatch_async(v4, block);
LABEL_14:

}

void __57__SSAccountStore__postAuthenticationActivityNotification__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = objc_msgSend(v2, "shouldLog");
  if (objc_msgSend(v2, "shouldLogToDisk"))
    v4 = v3 | 2;
  else
    v4 = v3;
  objc_msgSend(v2, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    v4 &= 2u;
  if (!v4)
    goto LABEL_11;
  *(_DWORD *)v16 = 138543618;
  *(_QWORD *)&v16[4] = objc_opt_class();
  *(_WORD *)&v16[12] = 2114;
  *(_QWORD *)&v16[14] = CFSTR("SSAccountStoreAuthenticationActivityNotification");
  v6 = *(id *)&v16[4];
  LODWORD(v15) = 22;
  v7 = (void *)_os_log_send_and_compose_impl();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v7, 4, v16, v15, *(_OWORD *)v16, *(_QWORD *)&v16[16]);
    v5 = objc_claimAutoreleasedReturnValue();
    free(v7);
    SSFileLog(v2, CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v5);
LABEL_11:

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("SSAccountStoreAuthenticationActivityNotification"), *(_QWORD *)(a1 + 32));

}

- (void)_recordAnalyticsForMetricsDialogEvent:(id)a3 withTopic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[4];
  id v24;
  id v25;
  int v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SSAccountStore metricsQueue](self, "metricsQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      v26 = 138543362;
      v27 = (id)objc_opt_class();
      v14 = v27;
      LODWORD(v22) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v26, v22);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v10, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v13);
    }

    goto LABEL_14;
  }
  -[SSAccountStore metricsQueue](self, "metricsQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__SSAccountStore__recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke;
  block[3] = &unk_1E47B8768;
  v24 = v6;
  v25 = v7;
  dispatch_async(v9, block);

  v10 = v24;
LABEL_14:

}

void __66__SSAccountStore__recordAnalyticsForMetricsDialogEvent_withTopic___block_invoke(uint64_t a1)
{
  SSMetricsController *v2;

  v2 = objc_alloc_init(SSMetricsController);
  -[SSMetricsController recordAnalyticsForMetricsDialogEvent:withTopic:](v2, "recordAnalyticsForMetricsDialogEvent:withTopic:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)_refreshAccount:(id)a3
{
  id v3;
  void *v4;
  SSAccount *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_backingAccountForAccount:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "refresh");
  v5 = -[SSAccount initWithBackingAccount:]([SSAccount alloc], "initWithBackingAccount:", v4);

  return v5;
}

- (id)_saveAccountInUnitTestMode:(id)a3 ignoreValidationErrors:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  SEL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v17;
  id v18;
  id v19;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Accounts/Notification/iTunesAccountsNotificationPlugin.bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init((Class)objc_msgSend(v7, "principalClass"));
  if (v8)
  {
    v9 = NSSelectorFromString(CFSTR("_canSaveAccount:withOtherAccounts:store:"));
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTarget:", v8);
    objc_msgSend(v11, "setSelector:", v9);
    objc_msgSend(v6, "backingAccount");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setArgument:atIndex:", &v19, 2);
    -[SSAccountStore accounts](self, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_ss_map:", &__block_literal_global_214);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setArgument:atIndex:", &v18, 3);
    objc_msgSend(v11, "invoke");
    v17 = 0;
    objc_msgSend(v11, "getReturnValue:", &v17);
    if (a4 || v17)
    {
      objc_msgSend((id)objc_opt_class(), "_addAccountToUnitTestStore:", v6);
      __AccountsChangedInternal();
      if ((objc_msgSend((id)objc_opt_class(), "areAccountStoreChangedNotificationsDisabled") & 1) == 0)
        __AccountsChanged();
      +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0C8F1D0], 5, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, (uint64_t)CFSTR("We failed to load the notification plugin."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

uint64_t __68__SSAccountStore__saveAccountInUnitTestMode_ignoreValidationErrors___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "backingAccount");
}

- (id)_saveAccount:(id)a3 verifyCredentials:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  SSPromise *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  int v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  NSObject *v53;
  int v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  int v70;
  NSObject *v71;
  int v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  _BYTE *v87;
  uint64_t v88;
  void *v89;
  _QWORD v90[4];
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  _BYTE location[12];
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  const __CFString *v102;
  uint64_t v103;

  v4 = a4;
  v103 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SSGenerateLogCorrelationString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v6, "isDirty") & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "_backingAccountForAccount:", v6);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v89)
      {
        +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v37)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v38 = objc_msgSend(v37, "shouldLog");
        if (objc_msgSend(v37, "shouldLogToDisk"))
          v38 |= 2u;
        objc_msgSend(v37, "OSLogObject");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          v40 = v38;
        else
          v40 = v38 & 2;
        if (v40)
        {
          v41 = (void *)objc_opt_class();
          v42 = v41;
          objc_msgSend(v6, "hashedDescription");
          *(_DWORD *)location = 138543874;
          *(_QWORD *)&location[4] = v41;
          v97 = 2114;
          v98 = v7;
          v99 = 2114;
          v100 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v88) = 32;
          v43 = (void *)_os_log_send_and_compose_impl();

          if (v43)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, location, v88);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            free(v43);
            SSFileLog(v37, CFSTR("%@"), v45, v46, v47, v48, v49, v50, (uint64_t)v44);

          }
        }
        else
        {

        }
        SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, (uint64_t)CFSTR("The backing account is nil."));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v68);
        v8 = (SSPromise *)objc_claimAutoreleasedReturnValue();

        goto LABEL_67;
      }
      if (objc_msgSend((id)objc_opt_class(), "unitTestModeEnabled"))
      {
        -[SSAccountStore _saveAccountInUnitTestMode:ignoreValidationErrors:](self, "_saveAccountInUnitTestMode:ignoreValidationErrors:", v6, 0);
        v8 = (SSPromise *)objc_claimAutoreleasedReturnValue();
LABEL_67:

        goto LABEL_68;
      }
      +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v51)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v52 = objc_msgSend(v51, "shouldLog");
      if (objc_msgSend(v51, "shouldLogToDisk"))
        v52 |= 2u;
      objc_msgSend(v51, "OSLogObject");
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        v54 = v52;
      else
        v54 = v52 & 2;
      if (v54)
      {
        v55 = (void *)objc_opt_class();
        v56 = v55;
        objc_msgSend(v6, "hashedDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        v59 = CFSTR("NO");
        *(_DWORD *)location = 138544130;
        *(_QWORD *)&location[4] = v55;
        v97 = 2114;
        if (v4)
          v59 = CFSTR("YES");
        v98 = v7;
        v99 = 2114;
        v100 = v57;
        v101 = 2114;
        v102 = v59;
        LODWORD(v88) = 42;
        v87 = location;
        v60 = (void *)_os_log_send_and_compose_impl();

        if (v60)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v60, 4, location, v88);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          free(v60);
          SSFileLog(v51, CFSTR("%@"), v62, v63, v64, v65, v66, v67, (uint64_t)v61);

        }
      }
      else
      {

      }
      +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v69)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v70 = objc_msgSend(v69, "shouldLog", v87);
      if (objc_msgSend(v69, "shouldLogToDisk"))
        v70 |= 2u;
      objc_msgSend(v69, "OSLogObject");
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        v72 = v70;
      else
        v72 = v70 & 2;
      if (v72)
      {
        v73 = (void *)objc_opt_class();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v73;
        v97 = 2114;
        v98 = v7;
        v74 = v73;
        LODWORD(v88) = 22;
        v75 = (void *)_os_log_send_and_compose_impl();

        if (!v75)
        {
LABEL_66:

          -[SSAccountStore clearCachedAccounts](self, "clearCachedAccounts");
          v8 = objc_alloc_init(SSPromise);
          objc_initWeak((id *)location, self);
          v82 = MEMORY[0x1E0C809B0];
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke;
          v93[3] = &unk_1E47BB420;
          objc_copyWeak(&v95, (id *)location);
          v83 = v7;
          v94 = v83;
          -[SSPromise addSuccessBlock:](v8, "addSuccessBlock:", v93);
          v90[0] = v82;
          v90[1] = 3221225472;
          v90[2] = __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke_224;
          v90[3] = &unk_1E47BB448;
          objc_copyWeak(&v92, (id *)location);
          v91 = v83;
          -[SSPromise addErrorBlock:](v8, "addErrorBlock:", v90);
          -[SSAccountStore backingAccountStore](self, "backingAccountStore");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          -[SSPromise BOOLCompletionHandlerAdapter](v8, "BOOLCompletionHandlerAdapter");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "saveAccount:withDataclassActions:doVerify:completion:", v89, 0, v4, v85);

          objc_destroyWeak(&v92);
          objc_destroyWeak(&v95);
          objc_destroyWeak((id *)location);
          goto LABEL_67;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v75, 4, location, v88);
        v71 = objc_claimAutoreleasedReturnValue();
        free(v75);
        SSFileLog(v69, CFSTR("%@"), v76, v77, v78, v79, v80, v81, (uint64_t)v71);
      }

      goto LABEL_66;
    }
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    objc_msgSend(v22, "OSLogObject");
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      v24 &= 2u;
    if (v24)
    {
      v26 = (void *)objc_opt_class();
      v27 = v26;
      objc_msgSend(v6, "hashedDescription");
      *(_DWORD *)location = 138543874;
      *(_QWORD *)&location[4] = v26;
      v97 = 2114;
      v98 = v7;
      v99 = 2114;
      v100 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v88) = 32;
      v28 = (void *)_os_log_send_and_compose_impl();

      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v28, 4, location, v88);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        free(v28);
        SSFileLog(v22, CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v29);

      }
    }
    else
    {

    }
    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAB0]);
    v8 = (SSPromise *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = objc_opt_class();
      v97 = 2114;
      v98 = v7;
      v13 = *(id *)&location[4];
      LODWORD(v88) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, location, v88);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

      }
    }
    else
    {

    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), 137, 0, (uint64_t)CFSTR("The account must be non-nil."));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[SSPromise promiseWithError:](SSPromise, "promiseWithError:", v36);
    v8 = (SSPromise *)objc_claimAutoreleasedReturnValue();

  }
LABEL_68:

  return v8;
}

void __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  objc_msgSend(v3, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    v5 &= 2u;
  if (!v5)
    goto LABEL_11;
  v7 = (void *)objc_opt_class();
  v8 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v18 = 138543618;
  *(_QWORD *)&v18[4] = v7;
  *(_WORD *)&v18[12] = 2114;
  *(_QWORD *)&v18[14] = v8;
  v9 = v7;
  LODWORD(v17) = 22;
  v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, v18, v17, *(_OWORD *)v18, *(_QWORD *)&v18[16], v19);
    v6 = objc_claimAutoreleasedReturnValue();
    free(v10);
    SSFileLog(v3, CFSTR("%@"), v11, v12, v13, v14, v15, v16, (uint64_t)v6);
LABEL_11:

  }
}

void __49__SSAccountStore__saveAccount_verifyCredentials___block_invoke_224(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[24];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = objc_msgSend(v5, "shouldLog");
  if (objc_msgSend(v5, "shouldLogToDisk"))
    v7 = v6 | 2;
  else
    v7 = v6;
  objc_msgSend(v5, "OSLogObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    v7 &= 2u;
  if (!v7)
    goto LABEL_11;
  v9 = (void *)objc_opt_class();
  v10 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)v20 = 138543874;
  *(_QWORD *)&v20[4] = v9;
  *(_WORD *)&v20[12] = 2114;
  *(_QWORD *)&v20[14] = v10;
  *(_WORD *)&v20[22] = 2112;
  v21 = v3;
  v11 = v9;
  LODWORD(v19) = 32;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, v20, v19, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
    v8 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v5, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v8);
LABEL_11:

  }
}

+ (void)_setActiveAccountIsManagedAppleIDPreference:(BOOL)a3
{
  CFPropertyListRef *v3;

  v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v3 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  CFPreferencesSetAppValue(CFSTR("ActiveAccountIsManagedAppleID"), *v3, CFSTR("com.apple.itunesstored"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.itunesstored"));
}

+ (BOOL)_accountDictionaryRepresentsActiveAccount:(id)a3 inKeyValueStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  objc_msgSend(a4, "iTunesValueForKey:usedDomain:", CFSTR("DSPersonID"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DSPersonID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);
  else
    v8 = 0;

  return v8;
}

+ (BOOL)_accountDictionaryRepresentsActiveLockerAccount:(id)a3 inKeyValueStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a3;
  objc_msgSend(a4, "iTunesValueForKey:usedDomain:", CFSTR("ActiveLockerAccountID"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DSPersonID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);
  else
    v8 = 0;

  return v8;
}

+ (void)_cleanupActiveAccountsAfterMigrationWithActiveDSID:(id)a3 activeLockerDSID:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  NSObject *v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  int v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  id v48;
  void *v49;
  int v50;
  NSObject *v51;
  int v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int *v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  id obj;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  int v76;
  void *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  id v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "accounts");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
    if (!v70)
      goto LABEL_55;
    v69 = *(_QWORD *)v73;
    v65 = v5;
    v66 = v6;
    while (1)
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v73 != v69)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        if (v5)
        {
          if (objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "isActive"))
          {
            objc_msgSend(v8, "uniqueIdentifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "isEqualToNumber:", v5);

            if ((v10 & 1) == 0)
            {
              +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v30)
              {
                +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v31 = objc_msgSend(v30, "shouldLog", v63);
              if (objc_msgSend(v30, "shouldLogToDisk"))
                v32 = v31 | 2;
              else
                v32 = v31;
              objc_msgSend(v30, "OSLogObject");
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                v34 = v32;
              else
                v34 = v32 & 2;
              if (v34)
              {
                v35 = (void *)objc_opt_class();
                v36 = v35;
                objc_msgSend(v8, "hashedDescription");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v5, "stringValue");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                SSHashIfNeeded(v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = 138543874;
                v77 = v35;
                v6 = v66;
                v78 = 2114;
                v79 = v37;
                v80 = 2114;
                v81 = v39;
                LODWORD(v64) = 32;
                v63 = &v76;
                v40 = (void *)_os_log_send_and_compose_impl();

                if (v40)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v76, v64);
                  v33 = objc_claimAutoreleasedReturnValue();
                  free(v40);
                  SSFileLog(v30, CFSTR("%@"), v41, v42, v43, v44, v45, v46, (uint64_t)v33);
                  goto LABEL_36;
                }
              }
              else
              {
LABEL_36:

              }
              objc_msgSend(v8, "setActive:", 0);
              v11 = 1;
              v5 = v65;
              if (!v6)
                goto LABEL_38;
              goto LABEL_11;
            }
          }
        }
        v11 = 0;
        if (!v6)
          goto LABEL_38;
LABEL_11:
        if (objc_msgSend(v8, "isActiveLockerAccount", v63))
        {
          objc_msgSend(v8, "uniqueIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToNumber:", v6);

          if ((v13 & 1) == 0)
          {
            +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v15 = objc_msgSend(v14, "shouldLog");
            if (objc_msgSend(v14, "shouldLogToDisk"))
              v15 |= 2u;
            objc_msgSend(v14, "OSLogObject");
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              v17 = v15;
            else
              v17 = v15 & 2;
            if (v17)
            {
              v18 = (void *)objc_opt_class();
              v19 = v18;
              objc_msgSend(v8, "hashedDescription");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v6, "stringValue");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              SSHashIfNeeded(v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = 138543874;
              v77 = v18;
              v78 = 2114;
              v79 = v20;
              v80 = 2114;
              v81 = v22;
              LODWORD(v64) = 32;
              v63 = &v76;
              v23 = (void *)_os_log_send_and_compose_impl();

              v5 = v65;
              if (v23)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v76, v64);
                v16 = objc_claimAutoreleasedReturnValue();
                free(v23);
                SSFileLog(v14, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v16);
                goto LABEL_23;
              }
            }
            else
            {
LABEL_23:

            }
            objc_msgSend(v8, "setActiveLockerAccount:", 0);
            v6 = v66;
            goto LABEL_39;
          }
        }
LABEL_38:
        if (!v11)
          continue;
LABEL_39:
        v71 = 0;
        v47 = objc_msgSend(v68, "saveAccount:verifyCredentials:error:", v8, 0, &v71, v63, v64);
        v48 = v71;
        if ((v47 & 1) == 0)
        {
          +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v49)
          {
            +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v50 = objc_msgSend(v49, "shouldLog");
          if (objc_msgSend(v49, "shouldLogToDisk"))
            v50 |= 2u;
          objc_msgSend(v49, "OSLogObject");
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            v52 = v50;
          else
            v52 = v50 & 2;
          if (v52)
          {
            v53 = (void *)objc_opt_class();
            v54 = v53;
            objc_msgSend(v8, "hashedDescription");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = 138543874;
            v77 = v53;
            v78 = 2114;
            v79 = v55;
            v80 = 2112;
            v81 = v48;
            LODWORD(v64) = 32;
            v63 = &v76;
            v56 = (void *)_os_log_send_and_compose_impl();

            v6 = v66;
            if (v56)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v56, 4, &v76, v64);
              v51 = objc_claimAutoreleasedReturnValue();
              free(v56);
              SSFileLog(v49, CFSTR("%@"), v57, v58, v59, v60, v61, v62, (uint64_t)v51);
              goto LABEL_50;
            }
          }
          else
          {
LABEL_50:

          }
        }

      }
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v82, 16);
      if (!v70)
      {
LABEL_55:

        break;
      }
    }
  }

}

+ (id)_migrateAccountDictionary:(id)a3 fromKeyValueStore:(id)a4 originalActiveDSID:(id)a5 originalActiveLockerDSID:(id)a6 logKey:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  _UNKNOWN **v15;
  uint64_t i;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  SSAccount *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  int v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  int v71;
  NSObject *v72;
  void *v73;
  id v74;
  _BOOL4 v75;
  const __CFString *v76;
  void *v77;
  int v78;
  void *v79;
  id v80;
  _BOOL4 v81;
  const __CFString *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  int v93;
  NSObject *v94;
  void *v95;
  id v96;
  _BOOL4 v97;
  const __CFString *v98;
  void *v99;
  int v100;
  void *v101;
  id v102;
  _BOOL4 v103;
  const __CFString *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  int v112;
  void *v113;
  BOOL v114;
  void *v115;
  int v116;
  NSObject *v117;
  void *v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  int v128;
  NSObject *v129;
  void *v130;
  id v131;
  void *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  NSObject *v142;
  void *v143;
  id v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  NSObject *v153;
  void *v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  SSAccount *v163;
  uint64_t v164;
  void *v165;
  int v166;
  int v167;
  NSObject *v168;
  void *v169;
  id v170;
  int v171;
  int v172;
  void *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  id *v182;
  SSAccount *v183;
  void *v185;
  int v186;
  NSObject *v187;
  void *v188;
  id v189;
  void *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  int *v197;
  int *v198;
  int *v199;
  int *v200;
  int *v201;
  int *v202;
  uint64_t v203;
  id v205;
  uint64_t v206;
  id v207;
  id v208;
  char v209;
  void *v210;
  id v211;
  void *v212;
  void *v213;
  id v214;
  id v215;
  id v216;
  int v217;
  void *v218;
  __int16 v219;
  id v220;
  __int16 v221;
  uint64_t v222;
  uint64_t v223;

  v223 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v205 = a4;
  v208 = a5;
  v207 = a6;
  v215 = a7;
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = a1;
  objc_msgSend(a1, "_disableAccountStoreChangedNotifications");
  v14 = 0;
  v209 = 1;
  v15 = &off_1E47B6000;
  v206 = *MEMORY[0x1E0C8F1D0];
  for (i = 1; ; i = 2)
  {
    v211 = v14;
    objc_msgSend(v15[387], "sharedAccountsMigrationConfig", v197);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(v15[387], "sharedConfig");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18 = objc_msgSend(v17, "shouldLog");
    if (objc_msgSend(v17, "shouldLogToDisk"))
      v19 = v18 | 2;
    else
      v19 = v18;
    objc_msgSend(v17, "OSLogObject");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      v19 &= 2u;
    if (!v19)
      goto LABEL_12;
    v21 = (void *)objc_opt_class();
    v217 = 138543874;
    v218 = v21;
    v219 = 2114;
    v220 = v215;
    v221 = 2048;
    v222 = i;
    v22 = v21;
    LODWORD(v203) = 32;
    v198 = &v217;
    v23 = (void *)_os_log_send_and_compose_impl();

    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v23, 4, &v217, v203);
      v20 = objc_claimAutoreleasedReturnValue();
      free(v23);
      SSFileLog(v17, CFSTR("%@"), v24, v25, v26, v27, v28, v29, (uint64_t)v20);
LABEL_12:

    }
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AltDSID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DSPersonID"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleID"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AccountURLBagType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = SSAccountScopeForString(v33);

    objc_msgSend(v213, "accountWithAltDSID:scope:", v30, v34);
    v35 = (SSAccount *)objc_claimAutoreleasedReturnValue();
    v212 = v32;
    v210 = v31;
    if (v35)
      goto LABEL_32;
    objc_msgSend(v213, "accountWithUniqueIdentifier:scope:", v31, v34);
    v35 = (SSAccount *)objc_claimAutoreleasedReturnValue();
    if (v35)
      goto LABEL_32;
    objc_msgSend(v213, "accountWithAccountName:scope:", v32, v34);
    v35 = (SSAccount *)objc_claimAutoreleasedReturnValue();
    -[SSAccount altDSID](v35, "altDSID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "isEqualToString:", &stru_1E47D72B0))
    {

LABEL_18:
      objc_msgSend(v15[387], "sharedAccountsMigrationConfig", v198);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v40 = objc_msgSend(v39, "shouldLog");
      if (objc_msgSend(v39, "shouldLogToDisk"))
        v40 |= 2u;
      objc_msgSend(v39, "OSLogObject");
      v41 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        v40 &= 2u;
      if (v40)
      {
        v42 = (void *)objc_opt_class();
        v217 = 138543618;
        v218 = v42;
        v219 = 2114;
        v220 = v215;
        v43 = v42;
        LODWORD(v203) = 22;
        v198 = &v217;
        v44 = (void *)_os_log_send_and_compose_impl();

        v32 = v212;
        if (!v44)
        {
LABEL_28:

          goto LABEL_31;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v44, 4, &v217, v203);
        v41 = objc_claimAutoreleasedReturnValue();
        free(v44);
        SSFileLog(v39, CFSTR("%@"), v45, v46, v47, v48, v49, v50, (uint64_t)v41);
      }

      goto LABEL_28;
    }
    -[SSAccount uniqueIdentifier](v35, "uniqueIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "isEqualToNumber:", &unk_1E481E6F0);

    if (v38)
      goto LABEL_18;
    -[SSAccount altDSID](v35, "altDSID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
    {

LABEL_173:
      objc_msgSend(v15[387], "sharedAccountsMigrationConfig", v198);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v185)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v185 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v186 = objc_msgSend(v185, "shouldLog");
      if (objc_msgSend(v185, "shouldLogToDisk"))
        v186 |= 2u;
      objc_msgSend(v185, "OSLogObject");
      v187 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v187, OS_LOG_TYPE_ERROR))
        v186 &= 2u;
      if (v186)
      {
        v188 = (void *)objc_opt_class();
        v217 = 138543618;
        v218 = v188;
        v219 = 2114;
        v220 = v215;
        v189 = v188;
        LODWORD(v203) = 22;
        v190 = (void *)_os_log_send_and_compose_impl();

        if (v190)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v190, 4, &v217, v203);
          v187 = objc_claimAutoreleasedReturnValue();
          free(v190);
          SSFileLog(v185, CFSTR("%@"), v191, v192, v193, v194, v195, v196, (uint64_t)v187);
          goto LABEL_182;
        }
      }
      else
      {
LABEL_182:

      }
      v183 = 0;
      v181 = v205;
      v14 = v211;
      goto LABEL_171;
    }
    -[SSAccount uniqueIdentifier](v35, "uniqueIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
      goto LABEL_173;
LABEL_31:
    if (!v35)
    {
      objc_msgSend(v15[387], "sharedAccountsMigrationConfig");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v127)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v128 = objc_msgSend(v127, "shouldLog", v198);
      if (objc_msgSend(v127, "shouldLogToDisk"))
        v128 |= 2u;
      objc_msgSend(v127, "OSLogObject");
      v129 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
        v128 &= 2u;
      if (v128)
      {
        v130 = (void *)objc_opt_class();
        v217 = 138543618;
        v218 = v130;
        v219 = 2114;
        v220 = v215;
        v131 = v130;
        LODWORD(v203) = 22;
        v202 = &v217;
        v132 = (void *)_os_log_send_and_compose_impl();

        if (!v132)
          goto LABEL_120;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v132, 4, &v217, v203);
        v129 = objc_claimAutoreleasedReturnValue();
        free(v132);
        SSFileLog(v127, CFSTR("%@"), v133, v134, v135, v136, v137, v138, (uint64_t)v129);
      }

LABEL_120:
      v35 = objc_alloc_init(SSAccount);
      +[SSAccount secureTokenForIdentifier:](SSAccount, "secureTokenForIdentifier:", v32);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = objc_msgSend(v53, "length");
      objc_msgSend(v15[387], "sharedAccountsMigrationConfig");
      v140 = objc_claimAutoreleasedReturnValue();
      v56 = v140;
      if (!v139)
      {
        if (!v140)
        {
          objc_msgSend(v15[387], "sharedConfig");
          v56 = objc_claimAutoreleasedReturnValue();
        }
        v152 = -[NSObject shouldLog](v56, "shouldLog", v202);
        if (-[NSObject shouldLogToDisk](v56, "shouldLogToDisk"))
          v152 |= 2u;
        -[NSObject OSLogObject](v56, "OSLogObject");
        v153 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
          v152 &= 2u;
        if (v152)
        {
          v154 = (void *)objc_opt_class();
          v217 = 138543618;
          v218 = v154;
          v219 = 2114;
          v220 = v215;
          v155 = v154;
          LODWORD(v203) = 22;
          v199 = &v217;
          v156 = (void *)_os_log_send_and_compose_impl();

          if (!v156)
            goto LABEL_42;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v156, 4, &v217, v203);
          v153 = objc_claimAutoreleasedReturnValue();
          free(v156);
          SSFileLog(v56, CFSTR("%@"), v157, v158, v159, v160, v161, v162, (uint64_t)v153);
        }

        goto LABEL_42;
      }
      if (!v140)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v56 = objc_claimAutoreleasedReturnValue();
      }
      v141 = -[NSObject shouldLog](v56, "shouldLog", v202);
      if (-[NSObject shouldLogToDisk](v56, "shouldLogToDisk"))
        v141 |= 2u;
      -[NSObject OSLogObject](v56, "OSLogObject");
      v142 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
        v141 &= 2u;
      if (v141)
      {
        v143 = (void *)objc_opt_class();
        v217 = 138543618;
        v218 = v143;
        v219 = 2114;
        v220 = v215;
        v144 = v143;
        LODWORD(v203) = 22;
        v199 = &v217;
        v145 = (void *)_os_log_send_and_compose_impl();

        if (!v145)
        {
LABEL_131:

          -[SSAccount setAuthenticated:](v35, "setAuthenticated:", 1);
          -[SSAccount setSecureToken:](v35, "setSecureToken:", v53);
          goto LABEL_44;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v145, 4, &v217, v203);
        v142 = objc_claimAutoreleasedReturnValue();
        free(v145);
        SSFileLog(v56, CFSTR("%@"), v146, v147, v148, v149, v150, v151, (uint64_t)v142);
      }

      goto LABEL_131;
    }
LABEL_32:
    objc_msgSend(v15[387], "sharedAccountsMigrationConfig", v198);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v53)
    {
      objc_msgSend(v15[387], "sharedConfig");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v54 = objc_msgSend(v53, "shouldLog");
    if (objc_msgSend(v53, "shouldLogToDisk"))
      v55 = v54 | 2;
    else
      v55 = v54;
    objc_msgSend(v53, "OSLogObject");
    v56 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      v55 &= 2u;
    if (!v55)
      goto LABEL_42;
    v57 = (void *)objc_opt_class();
    v58 = v57;
    -[SSAccount hashedDescription](v35, "hashedDescription");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = 138543874;
    v218 = v57;
    v219 = 2114;
    v220 = v215;
    v221 = 2114;
    v222 = (uint64_t)v59;
    LODWORD(v203) = 32;
    v199 = &v217;
    v60 = (void *)_os_log_send_and_compose_impl();

    if (v60)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v60, 4, &v217, v203);
      v56 = objc_claimAutoreleasedReturnValue();
      free(v60);
      SSFileLog(v53, CFSTR("%@"), v61, v62, v63, v64, v65, v66, (uint64_t)v56);
      v15 = &off_1E47B6000;
LABEL_42:

      goto LABEL_44;
    }
    v15 = &off_1E47B6000;
LABEL_44:

    -[SSAccount setLockdownDictionary:](v35, "setLockdownDictionary:", v13);
    -[SSAccount uniqueIdentifier](v35, "uniqueIdentifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v208, "isEqualToNumber:", v67);

    objc_msgSend(v15[387], "sharedAccountsMigrationConfig");
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)v69;
    if ((_DWORD)v68)
    {
      if (!v69)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v71 = objc_msgSend(v70, "shouldLog", v199);
      if (objc_msgSend(v70, "shouldLogToDisk"))
        v71 |= 2u;
      objc_msgSend(v70, "OSLogObject");
      v72 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        v71 &= 2u;
      if (!v71)
        goto LABEL_67;
      v73 = (void *)objc_opt_class();
      v74 = v73;
      v75 = -[SSAccount isActive](v35, "isActive");
      v217 = 138543874;
      v76 = CFSTR("NO");
      if (v75)
        v76 = CFSTR("YES");
      v218 = v73;
      v219 = 2114;
      v220 = v215;
      v221 = 2114;
      v222 = (uint64_t)v76;
      LODWORD(v203) = 32;
      v200 = &v217;
      v77 = (void *)_os_log_send_and_compose_impl();

      if (v77)
        goto LABEL_66;
      v68 = 1;
    }
    else
    {
      if (!v69)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v78 = objc_msgSend(v70, "shouldLog", v199);
      if (objc_msgSend(v70, "shouldLogToDisk"))
        v78 |= 2u;
      objc_msgSend(v70, "OSLogObject");
      v72 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        v78 &= 2u;
      if (!v78)
        goto LABEL_67;
      v79 = (void *)objc_opt_class();
      v80 = v79;
      v81 = -[SSAccount isActive](v35, "isActive");
      v217 = 138543874;
      v82 = CFSTR("NO");
      if (v81)
        v82 = CFSTR("YES");
      v218 = v79;
      v219 = 2114;
      v220 = v215;
      v221 = 2114;
      v222 = (uint64_t)v82;
      LODWORD(v203) = 32;
      v200 = &v217;
      v77 = (void *)_os_log_send_and_compose_impl();

      if (v77)
      {
LABEL_66:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v77, 4, &v217, v203);
        v72 = objc_claimAutoreleasedReturnValue();
        free(v77);
        SSFileLog(v70, CFSTR("%@"), v83, v84, v85, v86, v87, v88, (uint64_t)v72);
        v15 = &off_1E47B6000;
LABEL_67:

        goto LABEL_70;
      }
      v68 = 0;
    }
    v15 = &off_1E47B6000;
LABEL_70:

    -[SSAccount setActive:](v35, "setActive:", v68);
    -[SSAccount uniqueIdentifier](v35, "uniqueIdentifier");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v207, "isEqualToNumber:", v89);

    objc_msgSend(v15[387], "sharedAccountsMigrationConfig");
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v91;
    if ((_DWORD)v90)
    {
      if (!v91)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v93 = objc_msgSend(v92, "shouldLog", v200);
      if (objc_msgSend(v92, "shouldLogToDisk"))
        v93 |= 2u;
      objc_msgSend(v92, "OSLogObject");
      v94 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        v93 &= 2u;
      if (!v93)
        goto LABEL_93;
      v95 = (void *)objc_opt_class();
      v96 = v95;
      v97 = -[SSAccount isActiveLockerAccount](v35, "isActiveLockerAccount");
      v217 = 138543874;
      v98 = CFSTR("NO");
      if (v97)
        v98 = CFSTR("YES");
      v218 = v95;
      v219 = 2114;
      v220 = v215;
      v221 = 2114;
      v222 = (uint64_t)v98;
      LODWORD(v203) = 32;
      v201 = &v217;
      v99 = (void *)_os_log_send_and_compose_impl();

      if (v99)
        goto LABEL_92;
      v90 = 1;
    }
    else
    {
      if (!v91)
      {
        objc_msgSend(v15[387], "sharedConfig");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v100 = objc_msgSend(v92, "shouldLog", v200);
      if (objc_msgSend(v92, "shouldLogToDisk"))
        v100 |= 2u;
      objc_msgSend(v92, "OSLogObject");
      v94 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
        v100 &= 2u;
      if (!v100)
        goto LABEL_93;
      v101 = (void *)objc_opt_class();
      v102 = v101;
      v103 = -[SSAccount isActiveLockerAccount](v35, "isActiveLockerAccount");
      v217 = 138543874;
      v104 = CFSTR("NO");
      if (v103)
        v104 = CFSTR("YES");
      v218 = v101;
      v219 = 2114;
      v220 = v215;
      v221 = 2114;
      v222 = (uint64_t)v104;
      LODWORD(v203) = 32;
      v201 = &v217;
      v99 = (void *)_os_log_send_and_compose_impl();

      if (v99)
      {
LABEL_92:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v99, 4, &v217, v203);
        v94 = objc_claimAutoreleasedReturnValue();
        free(v99);
        SSFileLog(v92, CFSTR("%@"), v105, v106, v107, v108, v109, v110, (uint64_t)v94);
        v15 = &off_1E47B6000;
LABEL_93:

        v111 = v211;
        goto LABEL_96;
      }
      v90 = 0;
    }
    v111 = v211;
    v15 = &off_1E47B6000;
LABEL_96:

    -[SSAccount setActiveLockerAccount:](v35, "setActiveLockerAccount:", v90);
    v216 = v111;
    v112 = objc_msgSend(v213, "saveAccount:verifyCredentials:error:", v35, 0, &v216);
    v14 = v216;

    if ((v112 & 1) != 0)
    {
      v163 = v35;
      goto LABEL_145;
    }
    objc_msgSend(v14, "domain");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v113, "isEqualToString:", v206) & 1) == 0)
      break;
    v114 = objc_msgSend(v14, "code") != 5;

    if (v114 || (v209 & 1) == 0)
      goto LABEL_144;
    objc_msgSend(v15[387], "sharedAccountsMigrationConfig");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v115)
    {
      objc_msgSend(v15[387], "sharedConfig");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v116 = objc_msgSend(v115, "shouldLog", v201);
    if (objc_msgSend(v115, "shouldLogToDisk"))
      v116 |= 2u;
    objc_msgSend(v115, "OSLogObject");
    v117 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      v116 &= 2u;
    if (v116)
    {
      v118 = (void *)objc_opt_class();
      v217 = 138543618;
      v218 = v118;
      v219 = 2114;
      v220 = v215;
      v119 = v118;
      LODWORD(v203) = 22;
      v197 = &v217;
      v120 = (void *)_os_log_send_and_compose_impl();

      if (!v120)
        goto LABEL_109;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v120, 4, &v217, v203);
      v117 = objc_claimAutoreleasedReturnValue();
      free(v120);
      SSFileLog(v115, CFSTR("%@"), v121, v122, v123, v124, v125, v126, (uint64_t)v117);
    }

LABEL_109:
    v209 = 0;
  }

LABEL_144:
  v163 = 0;
LABEL_145:

  objc_msgSend(v214, "_enableAccountStoreChangedNotifications");
  +[SSLogConfig sharedAccountsMigrationConfig](SSLogConfig, "sharedAccountsMigrationConfig");
  v164 = objc_claimAutoreleasedReturnValue();
  v165 = (void *)v164;
  if (v112)
  {
    if (!v164)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v166 = objc_msgSend(v165, "shouldLog", v201);
    if (objc_msgSend(v165, "shouldLogToDisk"))
      v167 = v166 | 2;
    else
      v167 = v166;
    objc_msgSend(v165, "OSLogObject");
    v168 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v168, OS_LOG_TYPE_DEFAULT))
      v167 &= 2u;
    if (v167)
    {
      v169 = (void *)objc_opt_class();
      v217 = 138543618;
      v218 = v169;
      v219 = 2114;
      v220 = v215;
      v170 = v169;
      LODWORD(v203) = 22;
      goto LABEL_164;
    }
LABEL_166:
    v182 = a8;
    v181 = v205;

  }
  else
  {
    if (!v164)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v171 = objc_msgSend(v165, "shouldLog", v201);
    if (objc_msgSend(v165, "shouldLogToDisk"))
      v172 = v171 | 2;
    else
      v172 = v171;
    objc_msgSend(v165, "OSLogObject");
    v168 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
      v172 &= 2u;
    if (!v172)
      goto LABEL_166;
    v173 = (void *)objc_opt_class();
    v217 = 138543874;
    v218 = v173;
    v219 = 2114;
    v220 = v215;
    v221 = 2112;
    v222 = (uint64_t)v14;
    v170 = v173;
    LODWORD(v203) = 32;
LABEL_164:
    v174 = (void *)_os_log_send_and_compose_impl();

    if (v174)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v174, 4, &v217, v203);
      v168 = objc_claimAutoreleasedReturnValue();
      free(v174);
      SSFileLog(v165, CFSTR("%@"), v175, v176, v177, v178, v179, v180, (uint64_t)v168);
      goto LABEL_166;
    }
    v182 = a8;
    v181 = v205;
  }

  if (v182)
    *v182 = objc_retainAutorelease(v14);
  v183 = v163;
LABEL_171:

  return v183;
}

+ (void)_removeAccountDictionary:(id)a3 fromKeyValueStore:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(a1, "_accountDictionaryRepresentsActiveAccount:inKeyValueStore:", v9, v6))
  {
    objc_msgSend(v6, "removeAccountFromDomain:", CFSTR("com.apple.mobile.iTunes.store"));
    objc_msgSend(v6, "removeAccountFromDomain:", CFSTR("com.apple.itunesstored"));
  }
  if (objc_msgSend(a1, "_accountDictionaryRepresentsActiveLockerAccount:inKeyValueStore:", v9, v6))
  {
    objc_msgSend(v6, "setValue:forDomain:key:", 0, CFSTR("com.apple.mobile.iTunes.store"), CFSTR("ActiveLockerAccountID"));
    objc_msgSend(v6, "setValue:forDomain:key:", 0, CFSTR("com.apple.itunesstored"), CFSTR("ActiveLockerAccountID"));
  }
  objc_msgSend(v6, "accountDictionaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "removeObject:", v9);
  if (!objc_msgSend(v8, "count"))
  {

    v8 = 0;
  }
  objc_msgSend(v6, "setValue:forDomain:key:", v8, CFSTR("com.apple.mobile.iTunes.store"), CFSTR("KnownAccounts"));

}

+ (BOOL)_shouldRemoveAccountDictionaryWithoutMigration:(id)a3 reason:(id *)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  BOOL v9;

  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    v7 = CFSTR("it's empty");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AccountSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = CFSTR("it only has an account source");
LABEL_9:
      *a4 = v7;
      v9 = 1;
      goto LABEL_10;
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AppleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v7 = CFSTR("it has no username");
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (id)_convertPasswordToPET:(id)a3 forAccount:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  SSPromise *v21;
  void *v22;
  void *v23;
  void *v24;
  SSPromise *v25;
  id v26;
  SSPromise *v27;
  SSPromise *v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  SSPromise *v33;
  int v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = a4;
  if (SSIsInternalBuild() && (NSStringIsNotPET(v7) & 1) == 0)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      v12 &= 2u;
    if (v12)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v34 = 138543362;
      v35 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v30) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v34, v30);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v10, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    }

    goto LABEL_14;
  }
LABEL_15:
  v21 = objc_alloc_init(SSPromise);
  objc_msgSend((id)objc_opt_class(), "_createAuthenticationController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_createAuthenticationContextForAccount:silentAuthentication:options:", v9, 1, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "_setPassword:", v7);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitPreventPrompt"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setShouldPreventInteractiveAuth:", objc_msgSend(v24, "BOOLValue"));

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __59__SSAccountStore__convertPasswordToPET_forAccount_options___block_invoke;
  v31[3] = &unk_1E47BB470;
  v32 = v8;
  v25 = v21;
  v33 = v25;
  v26 = v8;
  objc_msgSend(v22, "authenticateWithContext:completion:", v23, v31);
  v27 = v33;
  v28 = v25;

  return v28;
}

void __59__SSAccountStore__convertPasswordToPET_forAccount_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v8)
  {
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v12 &= 2u;
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v34 = 138543362;
      v35 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v33) = 12;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_13:

        objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v5);
        goto LABEL_28;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v34, v33);
      v13 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v10, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v13);
    }

    goto LABEL_13;
  }
  if (!v9)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_msgSend(v10, "shouldLog");
  if (objc_msgSend(v10, "shouldLogToDisk"))
    v22 = v21 | 2;
  else
    v22 = v21;
  objc_msgSend(v10, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    v22 &= 2u;
  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    v34 = 138543618;
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v36 = 2114;
    v37 = v6;
    LODWORD(v33) = 22;
    v24 = (void *)_os_log_send_and_compose_impl();

    if (!v24)
      goto LABEL_25;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v34, v33);
    v23 = objc_claimAutoreleasedReturnValue();
    free(v24);
    SSFileLog(v10, CFSTR("%@"), v25, v26, v27, v28, v29, v30, (uint64_t)v23);
  }

LABEL_25:
  v31 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v31, "finishWithError:", v6);
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "finishWithError:", v32);

  }
LABEL_28:

}

+ (id)_createAuthenticationContextForAccount:(id)a3 silentAuthentication:(BOOL)a4 options:(id)a5
{
  _BOOL4 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v50;
  id v51;
  void *v52;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  if (objc_msgSend((id)objc_opt_class(), "_currentProcessLinksUIKit"))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("SSAccountStoreAuthKitPresentingViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pointerValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = SSVUIKitFramework();
      objc_msgSend(SSVWeakLinkedClassForString(CFSTR("UIApplication"), v11), "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "keyWindow");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rootViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "presentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        do
        {
          objc_msgSend(v14, "presentedViewController");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "presentedViewController");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v10;
        }
        while (v16);
        if (!v10)
          goto LABEL_13;
      }
      else
      {
        v10 = v14;
        if (!v14)
          goto LABEL_13;
      }
    }
    v17 = SSVAuthKitUIFramework();
    v18 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("AKAppleIDAuthenticationInAppContext"), v17));
    v19 = SSVUIKitFramework();
    SSVWeakLinkedClassForString(CFSTR("UINavigationController"), v19);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "topViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPresentingViewController:", v20);

      if (v18)
        goto LABEL_14;
    }
    else
    {
      objc_msgSend(v18, "setPresentingViewController:", v10);
      if (v18)
        goto LABEL_14;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_13:
  v18 = objc_alloc_init(MEMORY[0x1E0D00128]);
  objc_msgSend(v18, "_setProxyingForApp:", 1);
LABEL_14:
  objc_msgSend(v7, "accountName");
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "altDSID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v23)
  {
    objc_msgSend(v7, "altDSID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAltDSID:", v24);

  }
  objc_msgSend(v7, "uniqueIdentifier");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(v7, "uniqueIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToNumber:", &unk_1E481E6F0);

    if ((v28 & 1) == 0)
    {
      objc_msgSend(v7, "uniqueIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setDSID:", v30);

    }
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitOKButtonLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDefaultButtonString:", v31);

  objc_msgSend(v18, "setIsUsernameEditable:", v21 == 0);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitPromptTitle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "set_passwordPromptTitle:", v32);

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitReasonKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setReason:", v33);

  objc_msgSend(v18, "setServiceType:", 2);
  objc_msgSend(v18, "setShouldAllowAppleIDCreation:", 0);
  objc_msgSend(v18, "setShouldForceInteractiveAuth:", 1);
  objc_msgSend(v18, "setShouldUpdatePersistentServiceTokens:", 1);
  objc_msgSend(v18, "setUsername:", v21);
  objc_msgSend(v18, "clientInfo");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  if (v34 || (v34 = objc_alloc_init(MEMORY[0x1E0C99E08])) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCreateAccountQueryParamsKey"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("SSAccountStoreAuthKitCreateAccountQueryParamsKey"));
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitUserAgentKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v36, CFSTR("SSAccountStoreAuthKitUserAgentKey"));

  }
  objc_msgSend(v18, "setClientInfo:", v34);
  v52 = (void *)v21;
  if (v6)
  {
    v37 = 1;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitPreventPrompt"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v38, "BOOLValue");

  }
  objc_msgSend(v18, "setShouldPreventInteractiveAuth:", v37);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitProxiedAppBundleIDKey"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "length"))
  {
    objc_msgSend(v18, "_setProxyingForApp:", 1);
    objc_msgSend(v18, "_setProxiedAppBundleID:", v39);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitProxiedAppNameKey"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "length"))
  {
    objc_msgSend(v18, "_setProxyingForApp:", 1);
    objc_msgSend(v18, "_setProxiedAppName:", v40);
  }
  if (v6)
  {
    v51 = v7;
    v41 = (void *)SSVAppleAccountFramework();
    SSVWeakLinkedStringConstantForString("kAASaveOptionCompanionDeviceClientInfoKey", v41);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)SSVAppleAccountFramework();
    SSVWeakLinkedStringConstantForString("kAASaveOptionCompanionDeviceUDIDKey", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)v42;
    objc_msgSend(v8, "objectForKeyedSubscript:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "length") || objc_msgSend(v46, "length"))
    {
      v47 = objc_alloc_init(MEMORY[0x1E0D001D8]);
      objc_msgSend(v47, "setLinkType:", 2);
      objc_msgSend(v47, "setServerFriendlyDescription:", v45);
      objc_msgSend(v47, "setUniqueDeviceIdentifier:", v46);
      if (v47)
      {
        objc_msgSend(v18, "setCompanionDevice:", v47);

      }
    }
    objc_msgSend(v18, "setIsUsernameEditable:", 0);
    objc_msgSend(v18, "setShouldForceInteractiveAuth:", 0);
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F318]);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setServiceIdentifiers:", v48);

    v7 = v51;
  }

  return v18;
}

+ (id)_createAuthenticationController
{
  return objc_alloc_init(MEMORY[0x1E0D00130]);
}

+ (id)_createUpdatedAccount:(id)a3 withAuthenticationResults:(id)a4 options:(id)a5
{
  SSAccount *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  int v36;
  NSObject *v37;
  int v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  int v48;
  NSObject *v49;
  int v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  int v63;
  int v64;
  NSObject *v65;
  int v66;
  void *v67;
  void *v68;
  int v69;
  int v70;
  int v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  int v83;
  int v84;
  NSObject *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  char v100;
  void *v101;
  void *v102;
  int v103;
  int v104;
  NSObject *v105;
  int v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  char v121;
  void *v122;
  void *v123;
  int v124;
  NSObject *v125;
  int v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  int v139;
  NSObject *v140;
  int v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  uint64_t v160;
  void *v161;
  int v162;
  NSObject *v163;
  int v164;
  int v165;
  int v166;
  void *v167;
  void *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  NSObject *v176;
  int v177;
  void *v178;
  void *v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  void *v188;
  char v189;
  void *v190;
  void *v191;
  char v192;
  int *v194;
  int *v195;
  int *v196;
  uint64_t v197;
  id v198;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  int v204;
  void *v205;
  __int16 v206;
  void *v207;
  __int16 v208;
  void *v209;
  __int16 v210;
  void *v211;
  __int16 v212;
  uint64_t v213;
  uint64_t v214;

  v214 = *MEMORY[0x1E0C80C00];
  v7 = (SSAccount *)a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", SSVerifyCredentialsAccountScope);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v199 = objc_msgSend(v13, "integerValue");

  v200 = v10;
  v201 = v11;
  v202 = v12;
  v198 = v8;
  if (!v7)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = objc_msgSend(v14, "shouldLog");
    if (objc_msgSend(v14, "shouldLogToDisk"))
      v16 = v15 | 2;
    else
      v16 = v15;
    objc_msgSend(v14, "OSLogObject");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      v18 = v16;
    else
      v18 = v16 & 2;
    if (v18)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v202);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138544386;
      v205 = v19;
      v206 = 2114;
      v207 = v20;
      v208 = 2114;
      v209 = v22;
      v210 = 2114;
      v211 = v23;
      v212 = 2048;
      v213 = v199;
      LODWORD(v197) = 52;
      v194 = &v204;
      v24 = (void *)_os_log_send_and_compose_impl();

      v10 = v200;
      v11 = v201;

      v12 = v202;
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v24, 4, &v204, v197);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        free(v24);
        SSFileLog(v14, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v25);

      }
    }
    else
    {

    }
    +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "accountWithAltDSID:uniqueIdentifier:accountName:scope:", v10, v11, v12, v199);
    v7 = (SSAccount *)objc_claimAutoreleasedReturnValue();

    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v7)
    {
      v8 = v198;
      if (!v33)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v35 = objc_msgSend(v34, "shouldLog", v194);
      if (objc_msgSend(v34, "shouldLogToDisk"))
        v36 = v35 | 2;
      else
        v36 = v35;
      objc_msgSend(v34, "OSLogObject");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        v38 = v36;
      else
        v38 = v36 & 2;
      if (v38)
      {
        objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = 138543362;
        v205 = v39;
        LODWORD(v197) = 12;
        v194 = &v204;
        v40 = (void *)_os_log_send_and_compose_impl();

        if (!v40)
        {
LABEL_27:

LABEL_65:
          v12 = v202;
          goto LABEL_66;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v40, 4, &v204, v197);
        v37 = objc_claimAutoreleasedReturnValue();
        free(v40);
        SSFileLog(v34, CFSTR("%@"), v41, v42, v43, v44, v45, v46, (uint64_t)v37);
      }

      goto LABEL_27;
    }
    if (!v33)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v47 = objc_msgSend(v34, "shouldLog", v194);
    if (objc_msgSend(v34, "shouldLogToDisk"))
      v48 = v47 | 2;
    else
      v48 = v47;
    objc_msgSend(v34, "OSLogObject");
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      v50 = v48;
    else
      v50 = v48 & 2;
    if (v50)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138543362;
      v205 = v51;
      LODWORD(v197) = 12;
      v195 = &v204;
      v52 = (void *)_os_log_send_and_compose_impl();

      if (!v52)
        goto LABEL_40;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v52, 4, &v204, v197);
      v49 = objc_claimAutoreleasedReturnValue();
      free(v52);
      SSFileLog(v34, CFSTR("%@"), v53, v54, v55, v56, v57, v58, (uint64_t)v49);
    }

LABEL_40:
    v7 = objc_alloc_init(SSAccount);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCanSetActiveAccountKey"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "BOOLValue");

    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = (void *)v61;
    if ((_DWORD)v60)
    {
      if (!v61)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v63 = objc_msgSend(v62, "shouldLog", v195);
      if (objc_msgSend(v62, "shouldLogToDisk"))
        v64 = v63 | 2;
      else
        v64 = v63;
      objc_msgSend(v62, "OSLogObject");
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        v66 = v64;
      else
        v66 = v64 & 2;
      if (!v66)
        goto LABEL_63;
      objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138543362;
      v205 = v67;
      LODWORD(v197) = 12;
      v194 = &v204;
      v68 = (void *)_os_log_send_and_compose_impl();

      if (!v68)
      {
        v60 = 1;
LABEL_64:

        -[SSAccount setActive:](v7, "setActive:", v60);
        -[SSAccount setAccountScope:](v7, "setAccountScope:", v199);
        v8 = v198;
        goto LABEL_65;
      }
    }
    else
    {
      if (!v61)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v69 = objc_msgSend(v62, "shouldLog", v195);
      if (objc_msgSend(v62, "shouldLogToDisk"))
        v70 = v69 | 2;
      else
        v70 = v69;
      objc_msgSend(v62, "OSLogObject");
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
        v71 = v70;
      else
        v71 = v70 & 2;
      if (!v71)
        goto LABEL_63;
      objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138543362;
      v205 = v72;
      LODWORD(v197) = 12;
      v194 = &v204;
      v68 = (void *)_os_log_send_and_compose_impl();

      if (!v68)
      {
        v60 = 0;
        goto LABEL_64;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v68, 4, &v204, v197);
    v65 = objc_claimAutoreleasedReturnValue();
    free(v68);
    SSFileLog(v62, CFSTR("%@"), v73, v74, v75, v76, v77, v78, (uint64_t)v65);
LABEL_63:

    goto LABEL_64;
  }
LABEL_66:
  if (!v10)
    goto LABEL_69;
  -[SSAccount altDSID](v7, "altDSID");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = objc_msgSend(v79, "isEqualToString:", v10);

  if ((v80 & 1) == 0)
  {
    -[SSAccount altDSID](v7, "altDSID");
    v81 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v81)
      goto LABEL_85;
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v82)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v83 = objc_msgSend(v82, "shouldLog", v194);
    if (objc_msgSend(v82, "shouldLogToDisk"))
      v84 = v83 | 2;
    else
      v84 = v83;
    objc_msgSend(v82, "OSLogObject");
    v85 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      v86 = v84;
    else
      v86 = v84 & 2;
    if (v86)
    {
      objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSAccount altDSID](v7, "altDSID");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v200);
      v90 = v8;
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138543874;
      v205 = v87;
      v206 = 2114;
      v207 = v89;
      v208 = 2114;
      v209 = v91;
      LODWORD(v197) = 32;
      v194 = &v204;
      v92 = (void *)_os_log_send_and_compose_impl();

      v8 = v90;
      v10 = v200;
      v11 = v201;

      if (!v92)
      {
LABEL_84:

        v12 = v202;
LABEL_85:
        -[SSAccount setAltDSID:](v7, "setAltDSID:", v10, v194);
        LODWORD(v10) = 1;
        if (!v11)
          goto LABEL_102;
        goto LABEL_86;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v92, 4, &v204, v197);
      v85 = objc_claimAutoreleasedReturnValue();
      free(v92);
      SSFileLog(v82, CFSTR("%@"), v93, v94, v95, v96, v97, v98, (uint64_t)v85);
    }

    goto LABEL_84;
  }
  LODWORD(v10) = 0;
LABEL_69:
  if (!v11)
    goto LABEL_102;
LABEL_86:
  -[SSAccount uniqueIdentifier](v7, "uniqueIdentifier", v194);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v99, "isEqualToNumber:", v11);

  if ((v100 & 1) == 0)
  {
    -[SSAccount uniqueIdentifier](v7, "uniqueIdentifier");
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v101)
    {
LABEL_101:
      -[SSAccount setUniqueIdentifier:](v7, "setUniqueIdentifier:", v11, v194);
      LODWORD(v10) = 1;
      goto LABEL_102;
    }
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v102)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v103 = objc_msgSend(v102, "shouldLog");
    if (objc_msgSend(v102, "shouldLogToDisk"))
      v104 = v103 | 2;
    else
      v104 = v103;
    objc_msgSend(v102, "OSLogObject");
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      v106 = v104;
    else
      v106 = v104 & 2;
    if (v106)
    {
      objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSAccount uniqueIdentifier](v7, "uniqueIdentifier");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "stringValue");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "stringValue");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138543874;
      v205 = v107;
      v206 = 2114;
      v207 = v110;
      v208 = 2114;
      v209 = v112;
      LODWORD(v197) = 32;
      v194 = &v204;
      v113 = (void *)_os_log_send_and_compose_impl();

      v8 = v198;
      v11 = v201;

      if (!v113)
      {
LABEL_100:

        v12 = v202;
        goto LABEL_101;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v113, 4, &v204, v197);
      v105 = objc_claimAutoreleasedReturnValue();
      free(v113);
      SSFileLog(v102, CFSTR("%@"), v114, v115, v116, v117, v118, v119, (uint64_t)v105);
    }

    goto LABEL_100;
  }
LABEL_102:
  if (v12)
  {
    -[SSAccount accountName](v7, "accountName");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = objc_msgSend(v120, "isEqualToString:", v12);

    if ((v121 & 1) == 0)
    {
      -[SSAccount accountName](v7, "accountName");
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v122)
      {
LABEL_119:
        -[SSAccount setAccountName:](v7, "setAccountName:", v12, v194);
        goto LABEL_120;
      }
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v123)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v124 = objc_msgSend(v123, "shouldLog", v194);
      if (objc_msgSend(v123, "shouldLogToDisk"))
        v124 |= 2u;
      objc_msgSend(v123, "OSLogObject");
      v125 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
        v126 = v124;
      else
        v126 = v124 & 2;
      if (v126)
      {
        objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSAccount accountName](v7, "accountName");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        SSHashIfNeeded(v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        SSHashIfNeeded(v202);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = 138543874;
        v205 = v127;
        v206 = 2114;
        v207 = v129;
        v208 = 2114;
        v209 = v130;
        LODWORD(v197) = 32;
        v194 = &v204;
        v131 = (void *)_os_log_send_and_compose_impl();

        if (!v131)
        {
LABEL_118:

          v12 = v202;
          goto LABEL_119;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v131, 4, &v204, v197);
        v125 = objc_claimAutoreleasedReturnValue();
        free(v131);
        SSFileLog(v123, CFSTR("%@"), v132, v133, v134, v135, v136, v137, (uint64_t)v125);
      }

      goto LABEL_118;
    }
  }
  if (!(_DWORD)v10)
    goto LABEL_168;
LABEL_120:
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig", v194);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v138)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v139 = objc_msgSend(v138, "shouldLog");
  if (objc_msgSend(v138, "shouldLogToDisk"))
    v139 |= 2u;
  objc_msgSend(v138, "OSLogObject");
  v140 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
    v141 = v139;
  else
    v141 = v139 & 2;
  if (v141)
  {
    objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    v204 = 138543362;
    v205 = v142;
    LODWORD(v197) = 12;
    v196 = &v204;
    v143 = (void *)_os_log_send_and_compose_impl();

    if (!v143)
      goto LABEL_131;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v143, 4, &v204, v197);
    v140 = objc_claimAutoreleasedReturnValue();
    free(v143);
    SSFileLog(v138, CFSTR("%@"), v144, v145, v146, v147, v148, v149, (uint64_t)v140);
  }

LABEL_131:
  +[SSAccountStore defaultStore](SSAccountStore, "defaultStore");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAccount altDSID](v7, "altDSID");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAccount uniqueIdentifier](v7, "uniqueIdentifier");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSAccount accountName](v7, "accountName");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v150, "accountWithAltDSID:uniqueIdentifier:accountName:scope:", v151, v152, v153, v199);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  if (v154)
  {
    objc_msgSend(v154, "backingAccount");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "identifier");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSAccount backingAccount](v7, "backingAccount");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v157, "identifier");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = objc_msgSend(v156, "isEqualToString:", v158);

    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v160 = objc_claimAutoreleasedReturnValue();
    v161 = (void *)v160;
    if (v159)
    {
      if (!v160)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v161 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v162 = objc_msgSend(v161, "shouldLog", v196);
      if (objc_msgSend(v161, "shouldLogToDisk"))
        v162 |= 2u;
      objc_msgSend(v161, "OSLogObject");
      v163 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
        v164 = v162;
      else
        v164 = v162 & 2;
      if (v164)
        goto LABEL_150;
LABEL_162:
      v8 = v198;
      goto LABEL_163;
    }
    if (!v160)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v161 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v175 = objc_msgSend(v161, "shouldLog", v196);
    if (objc_msgSend(v161, "shouldLogToDisk"))
      v175 |= 2u;
    objc_msgSend(v161, "OSLogObject");
    v176 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
      v177 = v175;
    else
      v177 = v175 & 2;
    if (v177)
    {
      objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "hashedDescription");
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = 138543618;
      v205 = v178;
      v206 = 2114;
      v207 = v179;
      LODWORD(v197) = 22;
      v194 = &v204;
      v180 = (void *)_os_log_send_and_compose_impl();

      v8 = v198;
      if (!v180)
      {
LABEL_166:

        v161 = v7;
        v7 = v154;
        goto LABEL_167;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v180, 4, &v204, v197);
      v176 = objc_claimAutoreleasedReturnValue();
      free(v180);
      SSFileLog(v161, CFSTR("%@"), v181, v182, v183, v184, v185, v186, (uint64_t)v176);
    }
    else
    {
      v8 = v198;
    }

    goto LABEL_166;
  }
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v161)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v165 = objc_msgSend(v161, "shouldLog", v196);
  if (objc_msgSend(v161, "shouldLogToDisk"))
    v165 |= 2u;
  objc_msgSend(v161, "OSLogObject");
  v163 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
    v166 = v165;
  else
    v166 = v165 & 2;
  if (!v166)
    goto LABEL_162;
LABEL_150:
  objc_msgSend(v203, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v204 = 138543362;
  v205 = v167;
  LODWORD(v197) = 12;
  v194 = &v204;
  v168 = (void *)_os_log_send_and_compose_impl();

  v8 = v198;
  if (v168)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v168, 4, &v204, v197);
    v163 = objc_claimAutoreleasedReturnValue();
    free(v168);
    SSFileLog(v161, CFSTR("%@"), v169, v170, v171, v172, v173, v174, (uint64_t)v163);
LABEL_163:

  }
LABEL_167:

  v12 = v202;
LABEL_168:
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0], v194);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  if (v187)
  {
    -[SSAccount passwordEquivalentToken](v7, "passwordEquivalentToken");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = objc_msgSend(v188, "isEqualToString:", v187);

    if ((v189 & 1) == 0)
      -[SSAccount setPasswordEquivalentToken:](v7, "setPasswordEquivalentToken:", v187);
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA8]);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  if (v190)
  {
    -[SSAccount rawPassword](v7, "rawPassword");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = objc_msgSend(v191, "isEqualToString:", v190);

    if ((v192 & 1) == 0)
      -[SSAccount setRawPassword:](v7, "setRawPassword:", v190);
  }

  return v7;
}

- (id)_optionsForProxiedAuthenticationWithVerifyCredentialsOptions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SSAccountStoresProxiedDeviceFlagKey"));
  objc_msgSend(MEMORY[0x1E0D001D8], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLinkType:", 2);
  objc_msgSend(v5, "serializedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      v11 &= 2u;
    if (v11)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v22 = 138543362;
      v23 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v21) = 12;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_14:

        v4 = 0;
        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v13, 4, &v22, v21);
      v12 = objc_claimAutoreleasedReturnValue();
      free(v13);
      SSFileLog(v9, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v12);
    }

    goto LABEL_14;
  }
  v7 = (void *)SSVAppleAccountFramework();
  SSVWeakLinkedStringConstantForString("kAAErrorDetailsProxiedDeviceDataKey", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v8);

LABEL_15:
  return v4;
}

- (id)_passwordEquivalentTokenFromAlternateAccountWithAltDSID:(id)a3 DSID:(id)a4 username:(id)a5
{
  return 0;
}

- (id)_shouldCreateNewAccountForAccount:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  SSPromise *v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  NSObject *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  int v41;
  NSObject *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  NSObject *v53;
  int v54;
  int v55;
  int v56;
  NSObject *v57;
  int v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  SSPromise *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[4];
  SSPromise *v74;
  id v75;
  _BYTE location[12];
  __int16 v77;
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "accountName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v6, "altDSID"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = objc_msgSend(v9, "shouldLog");
    if (objc_msgSend(v9, "shouldLogToDisk"))
      v11 = v10 | 2;
    else
      v11 = v10;
    objc_msgSend(v9, "OSLogObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      v13 = v11;
    else
      v13 = v11 & 2;
    if (v13)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = self;
      v77 = 2114;
      v78 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v72) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, location, v72);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        free(v14);
        SSFileLog(v9, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);

      }
    }
    else
    {

    }
    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", &unk_1E481E708);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v6, "uniqueIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    goto LABEL_4;
  objc_msgSend(v7, "objectForKeyedSubscript:", SSVerifyCredentialsAccountScope);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "integerValue");

  if (v27 == 1)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = objc_msgSend(v28, "shouldLog");
    if (objc_msgSend(v28, "shouldLogToDisk"))
      v30 = v29 | 2;
    else
      v30 = v29;
    objc_msgSend(v28, "OSLogObject");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      v32 = v30;
    else
      v32 = v30 & 2;
    if (!v32)
    {

      goto LABEL_73;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = self;
    v77 = 2114;
    v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (v33)
      goto LABEL_45;
    goto LABEL_73;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCanCreateNewAccountKey"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "BOOLValue");

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitPreventPrompt"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "BOOLValue");

  if (!v35 || v37)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v51 = objc_msgSend(v28, "shouldLog");
    if (objc_msgSend(v28, "shouldLogToDisk"))
      v52 = v51 | 2;
    else
      v52 = v51;
    objc_msgSend(v28, "OSLogObject");
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      v54 = v52;
    else
      v54 = v52 & 2;
    if (!v54)
    {

      goto LABEL_73;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = self;
    v77 = 2114;
    v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (v33)
    {
LABEL_45:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v33, 4, location, v72);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      free(v33);
      SSFileLog(v28, CFSTR("%@"), v45, v46, v47, v48, v49, v50, (uint64_t)v44);

    }
LABEL_73:

    +[SSPromise promiseWithResult:](SSPromise, "promiseWithResult:", &unk_1E481E720);
    v22 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v23 = (SSPromise *)v22;
    goto LABEL_18;
  }
  v38 = objc_msgSend((id)objc_opt_class(), "_isBuddyRunning");
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v39 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v39;
  if (v38)
  {
    if (!v39)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v40 = objc_msgSend(v28, "shouldLog");
    if (objc_msgSend(v28, "shouldLogToDisk"))
      v41 = v40 | 2;
    else
      v41 = v40;
    objc_msgSend(v28, "OSLogObject");
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      v43 = v41;
    else
      v43 = v41 & 2;
    if (!v43)
    {

      goto LABEL_73;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = self;
    v77 = 2114;
    v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    v33 = (void *)_os_log_send_and_compose_impl();

    if (v33)
      goto LABEL_45;
    goto LABEL_73;
  }
  if (!v39)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55 = objc_msgSend(v28, "shouldLog");
  if (objc_msgSend(v28, "shouldLogToDisk"))
    v56 = v55 | 2;
  else
    v56 = v55;
  objc_msgSend(v28, "OSLogObject");
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    v58 = v56;
  else
    v58 = v56 & 2;
  if (v58)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    *(_DWORD *)location = 138543618;
    *(_QWORD *)&location[4] = self;
    v77 = 2114;
    v78 = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v72) = 22;
    v59 = (void *)_os_log_send_and_compose_impl();

    if (v59)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v59, 4, location, v72);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      free(v59);
      SSFileLog(v28, CFSTR("%@"), v61, v62, v63, v64, v65, v66, (uint64_t)v60);

    }
  }
  else
  {

  }
  v67 = objc_alloc_init(SSPromise);
  v68 = SSViTunesStoreFramework();
  v69 = objc_alloc_init((Class)SSVWeakLinkedClassForString(CFSTR("ISCreateAccountPromptOperation"), v68));
  objc_initWeak((id *)location, v69);
  v73[0] = MEMORY[0x1E0C809B0];
  v73[1] = 3221225472;
  v73[2] = __60__SSAccountStore__shouldCreateNewAccountForAccount_options___block_invoke;
  v73[3] = &unk_1E47BA0B8;
  objc_copyWeak(&v75, (id *)location);
  v23 = v67;
  v74 = v23;
  objc_msgSend(v69, "setCompletionBlock:", v73);
  v70 = SSViTunesStoreFramework();
  objc_msgSend(SSVWeakLinkedClassForString(CFSTR("ISOperationQueue"), v70), "mainQueue");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "addOperation:", v69);

  objc_destroyWeak(&v75);
  objc_destroyWeak((id *)location);

LABEL_18:
  return v23;
}

void __60__SSAccountStore__shouldCreateNewAccountForAccount_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(WeakRetained, "responseType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

+ (BOOL)_allowSilentPasswordAuthForAccount:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(a1, "_isBuddyRunning") & 1) != 0)
    goto LABEL_15;
  if (objc_msgSend(v6, "isDemoAccount"))
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = objc_msgSend(v8, "shouldLog");
    if (objc_msgSend(v8, "shouldLogToDisk"))
      v10 = v9 | 2;
    else
      v10 = v9;
    objc_msgSend(v8, "OSLogObject");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      v10 &= 2u;
    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v27 = 138543618;
      v28 = v12;
      v29 = 2114;
      v30 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v26) = 22;
      v14 = (void *)_os_log_send_and_compose_impl();

      if (!v14)
      {
LABEL_14:

LABEL_15:
        v21 = 1;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v14, 4, &v27, v26);
      v11 = objc_claimAutoreleasedReturnValue();
      free(v14);
      SSFileLog(v8, CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v11);
    }

    goto LABEL_14;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitAllowPasswordReuse"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v23, "BOOLValue");

  if (+[SSDevice deviceIsAppleWatch](SSDevice, "deviceIsAppleWatch"))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitAllowPasswordReuse"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
      v21 = objc_msgSend(v24, "BOOLValue");
    else
      v21 = 1;

  }
LABEL_16:

  return v21;
}

- (id)_updateAccountWithAuthKitViaPromptAuth:(id)a3 store:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  SSLazyPromise *v11;
  id v12;
  id v13;
  SSLazyPromise *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = [SSLazyPromise alloc];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke;
  v16[3] = &unk_1E47BB4C0;
  objc_copyWeak(&v19, &location);
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v14 = -[SSLazyPromise initWithBlock:](v11, "initWithBlock:", v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v14;
}

void __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  NSObject *v22;
  int v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  int v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id *v50;
  id *v51;
  void *v52;
  id *v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id from;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (objc_msgSend((id)objc_opt_class(), "_isBuddyRunning"))
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    objc_msgSend(v5, "OSLogObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = v7;
    else
      v9 = v7 & 2;
    if (!v9)
    {

      goto LABEL_49;
    }
    objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 12;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
      goto LABEL_12;
    goto LABEL_49;
  }
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitPreventPrompt"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  if (v19)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v21 = v20 | 2;
    else
      v21 = v20;
    objc_msgSend(v5, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      v23 = v21;
    else
      v23 = v21 & 2;
    if (!v23)
    {

      goto LABEL_49;
    }
    objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
    LODWORD(v57) = 12;
    v10 = (void *)_os_log_send_and_compose_impl();

    if (v10)
    {
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v10, 4, location, v57);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      free(v10);
      SSFileLog(v5, CFSTR("%@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

    }
LABEL_49:

    SSError((uint64_t)CFSTR("SSErrorDomain"), 132, 0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v49);
    goto LABEL_54;
  }
  if (a1[6] || !SSRestrictionsShouldRestrictAccountModification())
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_msgSend(v37, "shouldLog");
    if (objc_msgSend(v37, "shouldLogToDisk"))
      v39 = v38 | 2;
    else
      v39 = v38;
    objc_msgSend(v37, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v39 &= 2u;
    if (v39)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v57) = 12;
      v41 = (void *)_os_log_send_and_compose_impl();

      if (v41)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v41, 4, location, v57);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        free(v41);
        SSFileLog(v37, CFSTR("%@"), v43, v44, v45, v46, v47, v48, (uint64_t)v42);

      }
    }
    else
    {

    }
    objc_msgSend((id)objc_opt_class(), "_createAuthenticationController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = a1 + 6;
    v51 = a1 + 5;
    objc_msgSend((id)objc_opt_class(), "_createAuthenticationContextForAccount:silentAuthentication:options:", a1[6], 0, a1[5]);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = a1[4];
    v53 = a1 + 4;
    objc_msgSend(v49, "setDelegate:", v54);
    objc_initWeak(location, *v53);
    objc_initWeak(&from, v49);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke_251;
    v58[3] = &unk_1E47BB498;
    objc_copyWeak(&v64, location);
    objc_copyWeak(&v65, &from);
    v55 = v52;
    v56 = *v53;
    v59 = v55;
    v60 = v56;
    v61 = *v50;
    v62 = *v51;
    v63 = v3;
    objc_msgSend(v49, "authenticateWithContext:completion:", v55, v58);

    objc_destroyWeak(&v65);
    objc_destroyWeak(&v64);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

  }
  else
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = objc_msgSend(v24, "shouldLog");
    if (objc_msgSend(v24, "shouldLogToDisk"))
      v26 = v25 | 2;
    else
      v26 = v25;
    objc_msgSend(v24, "OSLogObject");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      v28 = v26;
    else
      v28 = v26 & 2;
    if (v28)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v57) = 12;
      v29 = (void *)_os_log_send_and_compose_impl();

      if (v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, location, v57);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        free(v29);
        SSFileLog(v24, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v30);

      }
    }
    else
    {

    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), 107, 0, 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v49);
  }
LABEL_54:

}

void __71__SSAccountStore__updateAccountWithAuthKitViaPromptAuth_store_options___block_invoke_251(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  SSMetricsDialogEvent *v8;
  uint64_t v9;
  __CFString **v10;
  __CFString **v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SSUpdateAccountResponse *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  __CFString *v41;
  void *v42;
  id v43;
  id v44;
  int v45;
  id v46;
  __int16 v47;
  id v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v44 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v7 = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(v7, "setDelegate:", 0);

  v8 = objc_alloc_init(SSMetricsDialogEvent);
  -[SSMetricsDialogEvent setDialogType:](v8, "setDialogType:", CFSTR("SignIn"));
  -[SSMetricsMutableEvent setEventType:](v8, "setEventType:", CFSTR("dialog"));
  objc_msgSend(*(id *)(a1 + 32), "username");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v42, "length");
  v10 = SSMetricsDialogEventIdPassword;
  if (!v9)
    v10 = SSMetricsDialogEventIdUserNamePassword;
  v41 = *v10;
  -[SSMetricsDialogEvent setDialogId:](v8, "setDialogId:");
  if (v5)
  {
    if (objc_msgSend(v5, "code") == -7003)
    {
      -[SSMetricsDialogEvent setActionType:](v8, "setActionType:", CFSTR("cancel"));
      -[SSMetricsDialogEvent setTargetId:](v8, "setTargetId:", CFSTR("Cancel"));
    }
    else
    {
      -[SSMetricsDialogEvent setTargetId:](v8, "setTargetId:", CFSTR("Ok"));
      -[SSMetricsDialogEvent setActionType:](v8, "setActionType:", CFSTR("enterPassword"));
    }
    v11 = SSMetricsDialogEventResultFailure;
  }
  else
  {
    -[SSMetricsDialogEvent setTargetId:](v8, "setTargetId:", CFSTR("Ok"));
    -[SSMetricsDialogEvent setActionType:](v8, "setActionType:", CFSTR("ok"));
    v11 = SSMetricsDialogEventResultSuccess;
  }
  -[SSMetricsDialogEvent setResult:](v8, "setResult:", *v11);
  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "objectForKey:", CFSTR("metricsAuthenticationAttempts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsDialogEvent setUserActions:](v8, "setUserActions:", v13);

  }
  v43 = WeakRetained;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitCreateAccountQueryParamsKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v14;
  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("product"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
    {
      v53 = CFSTR("buyParams");
      v54[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsDialogEvent setDetails:](v8, "setDetails:", v17);

      objc_msgSend(*(id *)(a1 + 40), "_buyParamsForBuyParamsString:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("mtTopic"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
        -[SSMetricsMutableEvent setTopic:](v8, "setTopic:", v19);
    }
    else
    {
      v51 = CFSTR("buyParams");
      v52 = MEMORY[0x1E0C9AA70];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSMetricsDialogEvent setDetails:](v8, "setDetails:", v18);
      v19 = 0;
    }

  }
  else
  {
    v49 = CFSTR("buyParams");
    v50 = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMetricsDialogEvent setDetails:](v8, "setDetails:", v16);
    v19 = 0;
  }

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitUserAgentKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    -[SSMetricsMutableEvent setProperty:forBodyKey:](v8, "setProperty:forBodyKey:", v20, CFSTR("userAgent"));
  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "_recordAnalyticsForMetricsDialogEvent:withTopic:", v8, v19);
  objc_msgSend(v44, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "length"))
  {
    v22 = v43;
    objc_msgSend((id)objc_opt_class(), "_createUpdatedAccount:withAuthenticationResults:options:", *(_QWORD *)(a1 + 48), v44, *(_QWORD *)(a1 + 56));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:]([SSUpdateAccountResponse alloc], "initWithUpdatedAccount:credentialSource:", v23, 1);
    objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", v24);

    goto LABEL_39;
  }
  v39 = v5;
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = objc_msgSend(v25, "shouldLog");
  if (objc_msgSend(v25, "shouldLogToDisk"))
    v27 = v26 | 2;
  else
    v27 = v26;
  objc_msgSend(v25, "OSLogObject");
  v28 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    v27 &= 2u;
  if (!v27)
    goto LABEL_34;
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v45 = 138543618;
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v47 = 2112;
  v48 = v39;
  LODWORD(v38) = 22;
  v29 = (void *)_os_log_send_and_compose_impl();

  if (v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v45, v38);
    v28 = objc_claimAutoreleasedReturnValue();
    free(v29);
    SSFileLog(v25, CFSTR("%@"), v30, v31, v32, v33, v34, v35, (uint64_t)v28);
LABEL_34:

  }
  v36 = *(void **)(a1 + 64);
  v5 = v39;
  if (v39)
  {
    objc_msgSend(*(id *)(a1 + 64), "finishWithError:", v39);
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "finishWithError:", v37);

  }
  v22 = v43;
LABEL_39:

}

- (id)_updateAccountWithAuthKitViaSilentAuth:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  SSLazyPromise *v8;
  id v9;
  id v10;
  SSLazyPromise *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [SSLazyPromise alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke;
  v13[3] = &unk_1E47BB510;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = -[SSLazyPromise initWithBlock:](v8, "initWithBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke(id *a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  int v39;
  NSObject *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  int v51;
  int v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id *v63;
  id v64;
  void *v65;
  int *v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  int v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (a1[4])
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitAllowSilentAuth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (+[SSDevice deviceIsAppleWatch](SSDevice, "deviceIsAppleWatch"))
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitAllowSilentAuth"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
        v7 = objc_msgSend(v8, "BOOLValue");
      else
        v7 = 1;

    }
    if (objc_msgSend((id)objc_opt_class(), "_isBuddyRunning"))
    {
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v25 = objc_msgSend(v24, "shouldLog");
      if (objc_msgSend(v24, "shouldLogToDisk"))
        v26 = v25 | 2;
      else
        v26 = v25;
      objc_msgSend(v24, "OSLogObject");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        v26 &= 2u;
      if (v26)
      {
        objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 138543362;
        v74 = v28;
        LODWORD(v67) = 12;
        v66 = &v73;
        v29 = (void *)_os_log_send_and_compose_impl();

        if (v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v73, v67);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          free(v29);
          SSFileLog(v24, CFSTR("%@"), v31, v32, v33, v34, v35, v36, (uint64_t)v30);

        }
      }
      else
      {

      }
LABEL_45:
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig", v66);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v50)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v51 = objc_msgSend(v50, "shouldLog");
      if (objc_msgSend(v50, "shouldLogToDisk"))
        v52 = v51 | 2;
      else
        v52 = v51;
      objc_msgSend(v50, "OSLogObject");
      v53 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        v52 &= 2u;
      if (v52)
      {
        objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 138543362;
        v74 = v54;
        LODWORD(v67) = 12;
        v55 = (void *)_os_log_send_and_compose_impl();

        if (!v55)
        {
LABEL_56:

          objc_msgSend((id)objc_opt_class(), "_createAuthenticationController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)objc_opt_class();
          v64 = a1[4];
          v63 = a1 + 4;
          objc_msgSend(v62, "_createAuthenticationContextForAccount:silentAuthentication:options:", v64, 1, v63[1]);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke_256;
          v68[3] = &unk_1E47BB4E8;
          objc_copyWeak(&v72, v4);
          v69 = v63[1];
          v70 = *v63;
          v71 = v3;
          objc_msgSend(v23, "authenticateWithContext:completion:", v65, v68);

          objc_destroyWeak(&v72);
          goto LABEL_59;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v55, 4, &v73, v67);
        v53 = objc_claimAutoreleasedReturnValue();
        free(v55);
        SSFileLog(v50, CFSTR("%@"), v56, v57, v58, v59, v60, v61, (uint64_t)v53);
      }

      goto LABEL_56;
    }
    if ((v7 & 1) != 0)
      goto LABEL_45;
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v37)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = objc_msgSend(v37, "shouldLog");
    if (objc_msgSend(v37, "shouldLogToDisk"))
      v39 = v38 | 2;
    else
      v39 = v38;
    objc_msgSend(v37, "OSLogObject");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v41 = v39;
    else
      v41 = v39 & 2;
    if (v41)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v73 = 138543362;
      v74 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = 12;
      v42 = (void *)_os_log_send_and_compose_impl();

      if (v42)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v42, 4, &v73, v67);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        free(v42);
        SSFileLog(v37, CFSTR("%@"), v44, v45, v46, v47, v48, v49, (uint64_t)v43);

      }
    }
    else
    {

    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), 106, 0, (uint64_t)CFSTR("Silent authentication isn't allowed."));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v23);
  }
  else
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v10, "shouldLog");
    if (objc_msgSend(v10, "shouldLogToDisk"))
      v12 = v11 | 2;
    else
      v12 = v11;
    objc_msgSend(v10, "OSLogObject");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      v14 = v12;
    else
      v14 = v12 & 2;
    if (v14)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v73 = 138543362;
      v74 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v67) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v73, v67);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        free(v15);
        SSFileLog(v10, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v16);

      }
    }
    else
    {

    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v23);
  }
LABEL_59:

}

void __65__SSAccountStore__updateAccountWithAuthKitViaSilentAuth_options___block_invoke_256(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  SSUpdateAccountResponse *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9)
  {
    if (!v10)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    objc_msgSend(v11, "OSLogObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      v13 &= 2u;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v36 = 138543362;
      v37 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15)
      {
LABEL_13:

        objc_msgSend((id)objc_opt_class(), "_createUpdatedAccount:withAuthenticationResults:options:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 32));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:]([SSUpdateAccountResponse alloc], "initWithUpdatedAccount:credentialSource:", v22, 3);
        objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v23);

        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v36, v35);
      v14 = objc_claimAutoreleasedReturnValue();
      free(v15);
      SSFileLog(v11, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v14);
    }

    goto LABEL_13;
  }
  if (!v10)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v25 = v24 | 2;
  else
    v25 = v24;
  objc_msgSend(v11, "OSLogObject");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    v25 &= 2u;
  if (!v25)
    goto LABEL_25;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v36 = 138543618;
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 2112;
  v39 = v6;
  LODWORD(v35) = 22;
  v27 = (void *)_os_log_send_and_compose_impl();

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v27, 4, &v36, v35);
    v26 = objc_claimAutoreleasedReturnValue();
    free(v27);
    SSFileLog(v11, CFSTR("%@"), v28, v29, v30, v31, v32, v33, (uint64_t)v26);
LABEL_25:

  }
  v34 = *(void **)(a1 + 48);
  if (v6)
  {
    objc_msgSend(v34, "finishWithError:", v6);
    goto LABEL_28;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "finishWithError:", v22);
LABEL_14:

LABEL_28:
}

- (id)_updateAccountWithAuthKitViaSilentPasswordAuth:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  SSLazyPromise *v8;
  id v9;
  id v10;
  SSLazyPromise *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  SSAccountStore *v16;
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [SSLazyPromise alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke;
  v13[3] = &unk_1E47BB4C0;
  objc_copyWeak(&v17, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = self;
  v11 = -[SSLazyPromise initWithBlock:](v8, "initWithBlock:", v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke(id *a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  NSObject *v48;
  int v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id *v58;
  id v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  int v71;
  id v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (a1[4])
  {
    if ((objc_msgSend((id)objc_opt_class(), "_allowSilentPasswordAuthForAccount:withOptions:", a1[4], a1[5]) & 1) != 0)
    {
      objc_msgSend(a1[4], "rawPassword");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v6)
      {
        if (!v7)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v9 = objc_msgSend(v8, "shouldLog");
        if (objc_msgSend(v8, "shouldLogToDisk"))
          v10 = v9 | 2;
        else
          v10 = v9;
        objc_msgSend(v8, "OSLogObject");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          v10 &= 2u;
        if (v10)
        {
          objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
          v71 = 138543362;
          v72 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v63) = 12;
          v12 = (void *)_os_log_send_and_compose_impl();

          if (v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v71, v63);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            free(v12);
            SSFileLog(v8, CFSTR("%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);

          }
        }
        else
        {

        }
        v59 = a1[4];
        v58 = a1 + 4;
        objc_msgSend(v58[2], "_convertPasswordToPET:forAccount:options:", v6, v59, v58[1]);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = MEMORY[0x1E0C809B0];
        v66[0] = MEMORY[0x1E0C809B0];
        v66[1] = 3221225472;
        v66[2] = __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_259;
        v66[3] = &unk_1E47BB538;
        objc_copyWeak(&v70, v4);
        v67 = *v58;
        v68 = v58[1];
        v62 = v3;
        v69 = v62;
        objc_msgSend(v60, "addSuccessBlock:", v66);
        v64[0] = v61;
        v64[1] = 3221225472;
        v64[2] = __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_2;
        v64[3] = &unk_1E47B9F78;
        v65 = v62;
        objc_msgSend(v60, "addErrorBlock:", v64);

        objc_destroyWeak(&v70);
      }
      else
      {
        if (!v7)
        {
          +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v46 = objc_msgSend(v8, "shouldLog");
        if (objc_msgSend(v8, "shouldLogToDisk"))
          v47 = v46 | 2;
        else
          v47 = v46;
        objc_msgSend(v8, "OSLogObject");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          v49 = v47;
        else
          v49 = v47 & 2;
        if (v49)
        {
          objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
          v71 = 138543362;
          v72 = (id)objc_claimAutoreleasedReturnValue();
          LODWORD(v63) = 12;
          v50 = (void *)_os_log_send_and_compose_impl();

          if (v50)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v50, 4, &v71, v63);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            free(v50);
            SSFileLog(v8, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v51);

          }
        }
        else
        {

        }
        SSError((uint64_t)CFSTR("SSErrorDomain"), 139, 0, 0);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "finishWithError:", v60);
      }

    }
    else
    {
      +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v33)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v34 = objc_msgSend(v33, "shouldLog");
      if (objc_msgSend(v33, "shouldLogToDisk"))
        v35 = v34 | 2;
      else
        v35 = v34;
      objc_msgSend(v33, "OSLogObject");
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        v37 = v35;
      else
        v37 = v35 & 2;
      if (v37)
      {
        objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
        v71 = 138543362;
        v72 = (id)objc_claimAutoreleasedReturnValue();
        LODWORD(v63) = 12;
        v38 = (void *)_os_log_send_and_compose_impl();

        if (v38)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v38, 4, &v71, v63);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          free(v38);
          SSFileLog(v33, CFSTR("%@"), v40, v41, v42, v43, v44, v45, (uint64_t)v39);

        }
      }
      else
      {

      }
      SSError((uint64_t)CFSTR("SSErrorDomain"), 106, 0, (uint64_t)CFSTR("Silent password authentication isn't allowed."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v6);
    }
  }
  else
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = objc_msgSend(v20, "shouldLog");
    if (objc_msgSend(v20, "shouldLogToDisk"))
      v22 = v21 | 2;
    else
      v22 = v21;
    objc_msgSend(v20, "OSLogObject");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      v24 = v22;
    else
      v24 = v22 & 2;
    if (v24)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v71 = 138543362;
      v72 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(v63) = 12;
      v25 = (void *)_os_log_send_and_compose_impl();

      if (v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v71, v63);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        free(v25);
        SSFileLog(v20, CFSTR("%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v26);

      }
    }
    else
    {

    }
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v6);
  }

}

void __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_259(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  SSUpdateAccountResponse *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 56);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend((id)objc_opt_class(), "_createUpdatedAccount:withAuthenticationResults:options:", *(_QWORD *)(a1 + 32), v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:]([SSUpdateAccountResponse alloc], "initWithUpdatedAccount:credentialSource:", v5, 5);
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", v6);

}

void __73__SSAccountStore__updateAccountWithAuthKitViaSilentPasswordAuth_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 100, 0, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishWithError:", v3);

  }
}

- (id)_updateAccountWithAuthKitViaSilentPETAuth:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  SSLazyPromise *v8;
  id v9;
  id v10;
  SSLazyPromise *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = [SSLazyPromise alloc];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__SSAccountStore__updateAccountWithAuthKitViaSilentPETAuth_options___block_invoke;
  v13[3] = &unk_1E47BB510;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v11 = -[SSLazyPromise initWithBlock:](v8, "initWithBlock:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __68__SSAccountStore__updateAccountWithAuthKitViaSilentPETAuth_options___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  SSUpdateAccountResponse *v32;
  void *v33;
  int v34;
  int v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  void *v46;
  int v47;
  int v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  int v61;
  int v62;
  NSObject *v63;
  void *v64;
  int v65;
  int v66;
  NSObject *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  int v80;
  int v81;
  NSObject *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  int v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 *v100;
  uint64_t v101;
  __int128 v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!a1[4])
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = objc_msgSend(v33, "shouldLog");
    if (objc_msgSend(v33, "shouldLogToDisk"))
      v35 = v34 | 2;
    else
      v35 = v34;
    objc_msgSend(v33, "OSLogObject");
    v36 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      v35 &= 2u;
    if (v35)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      LODWORD(v102) = 138543362;
      *(_QWORD *)((char *)&v102 + 4) = objc_claimAutoreleasedReturnValue();
      LODWORD(v101) = 12;
      v37 = (void *)_os_log_send_and_compose_impl();

      if (!v37)
      {
LABEL_42:

        v44 = 100;
LABEL_43:
        v45 = 0;
LABEL_56:
        SSError((uint64_t)CFSTR("SSErrorDomain"), v44, 0, (uint64_t)v45);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "finishWithError:", v6);
        goto LABEL_57;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v37, 4, &v102, v101);
      v36 = objc_claimAutoreleasedReturnValue();
      free(v37);
      SSFileLog(v33, CFSTR("%@"), v38, v39, v40, v41, v42, v43, (uint64_t)v36);
    }

    goto LABEL_42;
  }
  if ((objc_msgSend((id)objc_opt_class(), "_allowSilentPasswordAuthForAccount:withOptions:", a1[4], a1[5]) & 1) == 0)
  {
    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v46)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v47 = objc_msgSend(v46, "shouldLog");
    if (objc_msgSend(v46, "shouldLogToDisk"))
      v48 = v47 | 2;
    else
      v48 = v47;
    objc_msgSend(v46, "OSLogObject");
    v49 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      v48 &= 2u;
    if (v48)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      LODWORD(v102) = 138543362;
      *(_QWORD *)((char *)&v102 + 4) = objc_claimAutoreleasedReturnValue();
      LODWORD(v101) = 12;
      v50 = (void *)_os_log_send_and_compose_impl();

      if (!v50)
      {
LABEL_55:

        v45 = CFSTR("Silent password authentication isn't allowed.");
        v44 = 106;
        goto LABEL_56;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v50, 4, &v102, v101);
      v49 = objc_claimAutoreleasedReturnValue();
      free(v50);
      SSFileLog(v46, CFSTR("%@"), v51, v52, v53, v54, v55, v56, (uint64_t)v49);
    }

    goto LABEL_55;
  }
  objc_msgSend(a1[4], "passwordEquivalentToken");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitPreventSecondaryAccountPETLookup"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "BOOLValue");

    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v59 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v59;
    if (v58)
    {
      if (!v59)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v61 = objc_msgSend(v60, "shouldLog");
      if (objc_msgSend(v60, "shouldLogToDisk"))
        v62 = v61 | 2;
      else
        v62 = v61;
      objc_msgSend(v60, "OSLogObject");
      v63 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        v62 &= 2u;
      if (!v62)
        goto LABEL_103;
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v102) = 138543362;
      *(_QWORD *)((char *)&v102 + 4) = v64;
      LODWORD(v101) = 12;
LABEL_101:
      v93 = (void *)_os_log_send_and_compose_impl();

      if (!v93)
      {
LABEL_104:

        v44 = 139;
        goto LABEL_43;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v93, 4, &v102, v101, v102);
      v63 = objc_claimAutoreleasedReturnValue();
      free(v93);
      SSFileLog(v60, CFSTR("%@"), v94, v95, v96, v97, v98, v99, (uint64_t)v63);
LABEL_103:

      goto LABEL_104;
    }
    if (!v59)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v65 = objc_msgSend(v60, "shouldLog");
    if (objc_msgSend(v60, "shouldLogToDisk"))
      v66 = v65 | 2;
    else
      v66 = v65;
    objc_msgSend(v60, "OSLogObject");
    v67 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      v66 &= 2u;
    if (v66)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v102) = 138543362;
      *(_QWORD *)((char *)&v102 + 4) = v68;
      LODWORD(v101) = 12;
      v100 = &v102;
      v69 = (void *)_os_log_send_and_compose_impl();

      if (!v69)
        goto LABEL_79;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v69, 4, &v102, v101);
      v67 = objc_claimAutoreleasedReturnValue();
      free(v69);
      SSFileLog(v60, CFSTR("%@"), v70, v71, v72, v73, v74, v75, (uint64_t)v67);
    }

LABEL_79:
    objc_msgSend(a1[4], "altDSID");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "uniqueIdentifier");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "accountName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_passwordEquivalentTokenFromAlternateAccountWithAltDSID:DSID:username:", v76, v77, v78);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
    v79 = objc_claimAutoreleasedReturnValue();
    v60 = (void *)v79;
    if (!v6)
    {
      if (!v79)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v91 = objc_msgSend(v60, "shouldLog", v100);
      if (objc_msgSend(v60, "shouldLogToDisk"))
        v92 = v91 | 2;
      else
        v92 = v91;
      objc_msgSend(v60, "OSLogObject");
      v63 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
        v92 &= 2u;
      if (!v92)
        goto LABEL_103;
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v102) = 138543362;
      *(_QWORD *)((char *)&v102 + 4) = v64;
      LODWORD(v101) = 12;
      goto LABEL_101;
    }
    if (!v79)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v80 = objc_msgSend(v60, "shouldLog", v100);
    if (objc_msgSend(v60, "shouldLogToDisk"))
      v81 = v80 | 2;
    else
      v81 = v80;
    objc_msgSend(v60, "OSLogObject");
    v82 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      v81 &= 2u;
    if (v81)
    {
      objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v102) = 138543362;
      *(_QWORD *)((char *)&v102 + 4) = v83;
      LODWORD(v101) = 12;
      v100 = &v102;
      v84 = (void *)_os_log_send_and_compose_impl();

      if (!v84)
      {
LABEL_91:

        objc_msgSend(a1[4], "setPasswordEquivalentToken:", v6);
        v19 = 2;
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v84, 4, &v102, v101);
      v82 = objc_claimAutoreleasedReturnValue();
      free(v84);
      SSFileLog(v60, CFSTR("%@"), v85, v86, v87, v88, v89, v90, (uint64_t)v82);
    }

    goto LABEL_91;
  }
  v6 = (void *)v5;
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (!v9)
    goto LABEL_14;
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v102) = 138543362;
  *(_QWORD *)((char *)&v102 + 4) = v11;
  LODWORD(v101) = 12;
  v100 = &v102;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v102, v101);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
LABEL_14:

  }
  v19 = 4;
LABEL_16:
  if (!SSIsInternalBuild() || !NSStringIsNotPET(v6))
    goto LABEL_30;
  +[SSLogConfig sharedAccountsAuthenticationConfig](SSLogConfig, "sharedAccountsAuthenticationConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = objc_msgSend(v20, "shouldLog", v100);
  if (objc_msgSend(v20, "shouldLogToDisk"))
    v22 = v21 | 2;
  else
    v22 = v21;
  objc_msgSend(v20, "OSLogObject");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    v22 &= 2u;
  if (!v22)
    goto LABEL_28;
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("SSAccountStoreAuthKitLogUUIDKey"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v102) = 138543362;
  *(_QWORD *)((char *)&v102 + 4) = v24;
  LODWORD(v101) = 12;
  v25 = (void *)_os_log_send_and_compose_impl();

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v25, 4, &v102, v101);
    v23 = objc_claimAutoreleasedReturnValue();
    free(v25);
    SSFileLog(v20, CFSTR("%@"), v26, v27, v28, v29, v30, v31, (uint64_t)v23);
LABEL_28:

  }
LABEL_30:
  v32 = -[SSUpdateAccountResponse initWithUpdatedAccount:credentialSource:]([SSUpdateAccountResponse alloc], "initWithUpdatedAccount:credentialSource:", a1[4], v19);
  objc_msgSend(v3, "finishWithResult:", v32);

LABEL_57:
}

- (id)addAccount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = 0;
  if (-[SSAccountStore saveAccount:error:](self, "saveAccount:error:", v4, 0))
  {
    objc_msgSend((id)objc_opt_class(), "_refreshAccount:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (BOOL)isExpiredForTokenType:(int64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "isExpiredForTokenType:", a3);
}

- (void)setAccountCredits:(id)a3 forAccountWithUniqueIdentifier:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[SSAccountStore accountWithUniqueIdentifier:](self, "accountWithUniqueIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setCreditsString:", v8);

}

- (id)setActiveAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v39;
  uint64_t v40;
  id v41;
  int v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v42 = 138543362;
      v43 = (id)objc_opt_class();
      v11 = v43;
      LODWORD(v40) = 12;
      v39 = &v42;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v42, v40);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

LABEL_15:
    -[SSAccountStore activeAccount](self, "activeAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19)
    {
LABEL_30:

      v6 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v19, "setActive:", 0);
    v41 = 0;
    v21 = -[SSAccountStore saveAccount:verifyCredentials:error:](self, "saveAccount:verifyCredentials:error:", v20, 0, &v41);
    v22 = v41;
    if (v21)
    {
LABEL_29:

      goto LABEL_30;
    }
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v23, "shouldLog", v39);
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v25 &= 2u;
    if (v25)
    {
      v27 = (void *)objc_opt_class();
      v28 = v27;
      objc_msgSend(v20, "accountName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543874;
      v43 = v27;
      v44 = 2114;
      v45 = v30;
      v46 = 2112;
      v47 = v22;
      LODWORD(v40) = 32;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v31, 4, &v42, v40);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog(v23, CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v26);
    }

    goto LABEL_28;
  }
  objc_msgSend(v4, "setActive:", 1);
  v6 = 0;
  if (-[SSAccountStore saveAccount:error:](self, "saveAccount:error:", v5, 0))
  {
    objc_msgSend((id)objc_opt_class(), "_refreshAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:

  return v6;
}

- (id)setActiveLockerAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  int v24;
  int v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v39;
  uint64_t v40;
  id v41;
  int v42;
  id v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = objc_msgSend(v7, "shouldLog");
    if (objc_msgSend(v7, "shouldLogToDisk"))
      v9 = v8 | 2;
    else
      v9 = v8;
    objc_msgSend(v7, "OSLogObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      v9 &= 2u;
    if (v9)
    {
      v42 = 138543362;
      v43 = (id)objc_opt_class();
      v11 = v43;
      LODWORD(v40) = 12;
      v39 = &v42;
      v12 = (void *)_os_log_send_and_compose_impl();

      if (!v12)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v12, 4, &v42, v40);
      v10 = objc_claimAutoreleasedReturnValue();
      free(v12);
      SSFileLog(v7, CFSTR("%@"), v13, v14, v15, v16, v17, v18, (uint64_t)v10);
    }

LABEL_15:
    -[SSAccountStore activeLockerAccount](self, "activeLockerAccount");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (!v19)
    {
LABEL_30:

      v6 = 0;
      goto LABEL_31;
    }
    objc_msgSend(v19, "setActiveLockerAccount:", 0);
    v41 = 0;
    v21 = -[SSAccountStore saveAccount:verifyCredentials:error:](self, "saveAccount:verifyCredentials:error:", v20, 0, &v41);
    v22 = v41;
    if (v21)
    {
LABEL_29:

      goto LABEL_30;
    }
    +[SSLogConfig sharedAccountsConfig](SSLogConfig, "sharedAccountsConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = objc_msgSend(v23, "shouldLog", v39);
    if (objc_msgSend(v23, "shouldLogToDisk"))
      v25 = v24 | 2;
    else
      v25 = v24;
    objc_msgSend(v23, "OSLogObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      v25 &= 2u;
    if (v25)
    {
      v27 = (void *)objc_opt_class();
      v28 = v27;
      objc_msgSend(v20, "accountName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      SSHashIfNeeded(v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543874;
      v43 = v27;
      v44 = 2114;
      v45 = v30;
      v46 = 2112;
      v47 = v22;
      LODWORD(v40) = 32;
      v31 = (void *)_os_log_send_and_compose_impl();

      if (!v31)
      {
LABEL_28:

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v31, 4, &v42, v40);
      v26 = objc_claimAutoreleasedReturnValue();
      free(v31);
      SSFileLog(v23, CFSTR("%@"), v32, v33, v34, v35, v36, v37, (uint64_t)v26);
    }

    goto LABEL_28;
  }
  objc_msgSend(v4, "setActiveLockerAccount:", 1);
  v6 = 0;
  if (-[SSAccountStore saveAccount:error:](self, "saveAccount:error:", v5, 0))
  {
    objc_msgSend((id)objc_opt_class(), "_refreshAccount:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:

  return v6;
}

- (void)signOutAllAccounts
{
  -[SSAccountStore signOutAllAccountsWithCompletionBlock:](self, "signOutAllAccountsWithCompletionBlock:", 0);
}

- (void)signOutAllAccountsWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[4];
  void (**v7)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[SSAccountStore activeAccount](self, "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __56__SSAccountStore_signOutAllAccountsWithCompletionBlock___block_invoke;
    v6[3] = &unk_1E47BB560;
    v7 = v4;
    -[SSAccountStore signOutAccount:completion:](self, "signOutAccount:completion:", v5, v6);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

uint64_t __56__SSAccountStore_signOutAllAccountsWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAccountsCacheAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accountsCacheAccessQueue, a3);
}

- (OS_dispatch_queue)fetchAccountsQueue
{
  return self->_fetchAccountsQueue;
}

- (void)setFetchAccountsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fetchAccountsQueue, a3);
}

- (void)setInProcessCacheDisabled:(BOOL)a3
{
  self->_inProcessCacheDisabled = a3;
}

- (void)setKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_keyValueStore, a3);
}

- (OS_dispatch_queue)metricsQueue
{
  return self->_metricsQueue;
}

- (void)setMetricsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_metricsQueue, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAccountStore, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_metricsQueue, 0);
  objc_storeStrong((id *)&self->_keyValueStore, 0);
  objc_storeStrong((id *)&self->_fetchAccountsQueue, 0);
  objc_storeStrong((id *)&self->_accountsCacheAccessQueue, 0);
  objc_storeStrong((id *)&self->_accountsCache, 0);
}

@end
