@implementation PSAccountEnumerator

void __45__PSAccountEnumerator__visibleAccountTypeIDs__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0C8F140], *MEMORY[0x1E0C8F058], *MEMORY[0x1E0C8F060], *MEMORY[0x1E0C8F0D0], *MEMORY[0x1E0C8F118], *MEMORY[0x1E0C8F080], *MEMORY[0x1E0C8F0B8], *MEMORY[0x1E0C8F100], *MEMORY[0x1E0C8F0A8], *MEMORY[0x1E0C8F160], *MEMORY[0x1E0C8F028], *MEMORY[0x1E0C8F030], *MEMORY[0x1E0C8F020], *MEMORY[0x1E0C8F018], *MEMORY[0x1E0C8F128], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_2_na_once_object_6;
  _block_invoke_2_na_once_object_6 = v0;

}

void __72__PSAccountEnumerator__reloadAccountStoreStateIsInitialLoad_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAccountStoreDidUpdateIsInitialLoad:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_handleAccountStoreDidUpdateIsInitialLoad:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PKLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]";
    _os_log_impl(&dword_1A3819000, v7, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v8 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(v8, "flatMap:", &__block_literal_global_18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSAccountEnumerator _monitoredAccountStore](self, "_monitoredAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v8, "completionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerWithCompletion:", v11);
  }
  else
  {
    objc_msgSend(v10, "monitoredAccounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishWithResult:", v11);
  }

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2;
  v14[3] = &unk_1E4A68730;
  objc_copyWeak(&v16, (id *)buf);
  v12 = v6;
  v15 = v12;
  v13 = (id)objc_msgSend(v9, "addCompletionBlock:", v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
  __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke();

}

void __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (ACMonitoredAccountStore)_monitoredAccountStore
{
  return self->__monitoredAccountStore;
}

id __39__PSAccountEnumerator_sharedEnumerator__block_invoke()
{
  if (_block_invoke_na_once_token_5 != -1)
    dispatch_once(&_block_invoke_na_once_token_5, &__block_literal_global_9);
  return (id)_block_invoke_na_once_object_5;
}

void __39__PSAccountEnumerator_sharedEnumerator__block_invoke_2()
{
  PSAccountEnumerator *v0;
  void *v1;

  v0 = objc_alloc_init(PSAccountEnumerator);
  v1 = (void *)_block_invoke_na_once_object_5;
  _block_invoke_na_once_object_5 = (uint64_t)v0;

}

- (PSAccountEnumerator)init
{
  NSObject *v3;
  PSAccountEnumerator *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accountUpdateQueue;
  id v7;
  void *v8;
  uint64_t v9;
  ACMonitoredAccountStore *monitoredAccountStore;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[PSAccountEnumerator init]";
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  v12.receiver = self;
  v12.super_class = (Class)PSAccountEnumerator;
  v4 = -[PSAccountEnumerator init](&v12, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.preferences-framework.PSAccountEnumerator", 0);
    accountUpdateQueue = v4->__accountUpdateQueue;
    v4->__accountUpdateQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(MEMORY[0x1E0C8F2D8]);
    objc_msgSend((id)objc_opt_class(), "_visibleAccountTypeIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithAccountTypes:delegate:", v8, v4);
    monitoredAccountStore = v4->__monitoredAccountStore;
    v4->__monitoredAccountStore = (ACMonitoredAccountStore *)v9;

    -[PSAccountEnumerator _reloadAccountStoreStateIsInitialLoad:completion:](v4, "_reloadAccountStoreStateIsInitialLoad:completion:", 1, &__block_literal_global_3_0);
  }
  __27__PSAccountEnumerator_init__block_invoke();
  return v4;
}

id __45__PSAccountEnumerator__visibleAccountTypeIDs__block_invoke()
{
  if (_block_invoke_2_na_once_token_6 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_6, &__block_literal_global_12_1);
  return (id)_block_invoke_2_na_once_object_6;
}

void __27__PSAccountEnumerator_init__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator init]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)_reloadAccountStoreStateIsInitialLoad:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  -[PSAccountEnumerator _accountUpdateQueue](self, "_accountUpdateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PSAccountEnumerator__reloadAccountStoreStateIsInitialLoad_completion___block_invoke;
  v9[3] = &unk_1E4A686E8;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (OS_dispatch_queue)_accountUpdateQueue
{
  return self->__accountUpdateQueue;
}

void __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PKLogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2_cold_1((uint64_t)v6, v9);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315394;
      v12 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]_block_invoke";
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1A3819000, v9, OS_LOG_TYPE_DEFAULT, "%s: New visible account count %{public}@.", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(WeakRetained, "setVisibleAccountCount:", objc_msgSend(v5, "integerValue"));
  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

void __27__PSAccountEnumerator_init__block_invoke_2()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator init]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: Initial account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)setVisibleAccountCount:(int64_t)a3
{
  self->_visibleAccountCount = a3;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[PSAccountEnumerator dealloc]";
    _os_log_impl(&dword_1A3819000, v3, OS_LOG_TYPE_DEFAULT, "%s: start.", buf, 0xCu);
  }

  -[PSAccountEnumerator _monitoredAccountStore](self, "_monitoredAccountStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeDelegate:", self);

  __30__PSAccountEnumerator_dealloc__block_invoke();
  v5.receiver = self;
  v5.super_class = (Class)PSAccountEnumerator;
  -[PSAccountEnumerator dealloc](&v5, sel_dealloc);
}

void __30__PSAccountEnumerator_dealloc__block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator dealloc]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

id __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v8, "isVisible"))
        {
          objc_msgSend(v8, "parentAccount");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v9)
            ++v5;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v10 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "futureWithResult:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)accountWasAdded:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PSAccountEnumerator accountWasAdded:]";
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "%s: start.", (uint8_t *)&v6, 0xCu);
  }

  -[PSAccountEnumerator _reloadAccountStoreStateIsInitialLoad:completion:](self, "_reloadAccountStoreStateIsInitialLoad:completion:", 0, &__block_literal_global_23);
  __39__PSAccountEnumerator_accountWasAdded___block_invoke();

}

void __39__PSAccountEnumerator_accountWasAdded___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator accountWasAdded:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

void __39__PSAccountEnumerator_accountWasAdded___block_invoke_22()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator accountWasAdded:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: Account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)accountWasRemoved:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PSAccountEnumerator accountWasRemoved:]";
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "%s: start.", (uint8_t *)&v6, 0xCu);
  }

  -[PSAccountEnumerator _reloadAccountStoreStateIsInitialLoad:completion:](self, "_reloadAccountStoreStateIsInitialLoad:completion:", 0, &__block_literal_global_26_0);
  __41__PSAccountEnumerator_accountWasRemoved___block_invoke();

}

void __41__PSAccountEnumerator_accountWasRemoved___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator accountWasRemoved:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

void __41__PSAccountEnumerator_accountWasRemoved___block_invoke_25()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator accountWasRemoved:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: Account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (void)accountWasModified:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PSAccountEnumerator accountWasModified:]";
    _os_log_impl(&dword_1A3819000, v5, OS_LOG_TYPE_DEFAULT, "%s: start.", (uint8_t *)&v6, 0xCu);
  }

  -[PSAccountEnumerator _reloadAccountStoreStateIsInitialLoad:completion:](self, "_reloadAccountStoreStateIsInitialLoad:completion:", 0, &__block_literal_global_29_0);
  __42__PSAccountEnumerator_accountWasModified___block_invoke();

}

void __42__PSAccountEnumerator_accountWasModified___block_invoke()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator accountWasModified:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: complete.", (uint8_t *)&v1, 0xCu);
  }

}

void __42__PSAccountEnumerator_accountWasModified___block_invoke_28()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  PKLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "-[PSAccountEnumerator accountWasModified:]_block_invoke";
    _os_log_impl(&dword_1A3819000, v0, OS_LOG_TYPE_DEFAULT, "%s: Account store state reload complete.", (uint8_t *)&v1, 0xCu);
  }

}

- (int64_t)visibleAccountCount
{
  return self->_visibleAccountCount;
}

- (void)set_accountUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->__accountUpdateQueue, a3);
}

- (void)set_monitoredAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->__monitoredAccountStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__monitoredAccountStore, 0);
  objc_storeStrong((id *)&self->__accountUpdateQueue, 0);
}

void __76__PSAccountEnumerator__handleAccountStoreDidUpdateIsInitialLoad_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[PSAccountEnumerator _handleAccountStoreDidUpdateIsInitialLoad:completion:]_block_invoke_2";
  v4 = 2114;
  v5 = a1;
  _os_log_error_impl(&dword_1A3819000, a2, OS_LOG_TYPE_ERROR, "%s: Error occurred while reloading account store state %{public}@.", (uint8_t *)&v2, 0x16u);
}

@end
