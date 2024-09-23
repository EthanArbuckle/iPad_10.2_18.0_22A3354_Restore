@implementation ICDelegateAccountStore

- (id)_initWithValidatedOptions:(id)a3
{
  id v4;
  ICDelegateAccountStore *v5;
  NSMutableArray *v6;
  NSMutableArray *connectionPool;
  uint64_t v8;
  ICDelegateAccountStoreOptions *options;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDelegateAccountStore;
  v5 = -[ICDelegateAccountStore init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    connectionPool = v5->_connectionPool;
    v5->_connectionPool = v6;

    v5->_isOpen = 1;
    v5->_lock._os_unfair_lock_opaque = 0;
    v8 = objc_msgSend(v4, "copy");
    options = v5->_options;
    v5->_options = (ICDelegateAccountStoreOptions *)v8;

    objc_storeStrong((id *)&v5->_strongSelf, v5);
  }

  return v5;
}

- (id)initSingleWriterWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  ICSQLiteConnection *v8;
  BOOL v9;
  id v10;
  id *v11;
  id *v12;
  id v14;

  v6 = a3;
  if ((objc_msgSend(v6, "isSingleWriter") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("options not single-writer"));
  __SQLiteOptionsWithAccountStoreOptions(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICSQLiteConnection initWithOptions:]([ICSQLiteConnection alloc], "initWithOptions:", v7);
  v14 = 0;
  v9 = __SetupSingleWriterWithConnection(v8, &v14);
  v10 = v14;
  if (v9)
  {
    v11 = -[ICDelegateAccountStore _initWithValidatedOptions:](self, "_initWithValidatedOptions:", v6);
    if (v11)
    {
      v12 = v11;
      -[ICSQLiteConnection setDelegate:](v8, "setDelegate:", v11);
      objc_msgSend(v12[1], "addObject:", v8);
      goto LABEL_9;
    }
  }
  else
  {

  }
  v12 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v10);
LABEL_9:

  return v12;
}

- (void)close
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *connectionPool;
  ICDelegateAccountStore *strongSelf;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_connectionPool;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "setDelegate:", 0, (_QWORD)v11);
        objc_msgSend(v8, "close");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  connectionPool = self->_connectionPool;
  self->_connectionPool = 0;

  -[ICDelegateAccountStoreXPCWriter invalidate](self->_xpcWriter, "invalidate");
  self->_isOpen = 0;
  strongSelf = self->_strongSelf;
  self->_strongSelf = 0;

}

- (NSString)databasePath
{
  return -[ICDelegateAccountStoreOptions databasePath](self->_options, "databasePath");
}

- (void)readUsingBlock:(id)a3
{
  void *v4;
  ICDelegateAccountStoreReader *v5;
  void (**v6)(id, ICDelegateAccountStoreReader *);

  v6 = (void (**)(id, ICDelegateAccountStoreReader *))a3;
  if (!self->_isOpen)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot use a closed delegate account store: %@"), self);
  -[ICDelegateAccountStore _popConnection](self, "_popConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICDelegateAccountStoreReader initWithConnection:]([ICDelegateAccountStoreReader alloc], "initWithConnection:", v4);
  v6[2](v6, v5);
  -[ICDelegateAccountStoreReader invalidate](v5, "invalidate");

  -[ICDelegateAccountStore _recycleConnection:](self, "_recycleConnection:", v4);
}

- (void)addDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICDelegateAccountStore *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438AC00;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v14);

}

- (void)removeAllTokensWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E438AC28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v6);

}

- (void)removeDelegationUUIDs:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICDelegateAccountStore *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438AC00;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v14);

}

- (void)removeIdentityPropertiesForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICDelegateAccountStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E438AC50;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v10);

}

- (void)removeTokenForUserIdentity:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICDelegateAccountStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke;
  v10[3] = &unk_1E438AC50;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v10);

}

- (void)removeTokensExpiringBeforeDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICDelegateAccountStore *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke;
  v10[3] = &unk_1E438AC50;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v10);

}

- (void)setIdentityProperties:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICDelegateAccountStore *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438AC00;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v14);

}

- (void)setToken:(id)a3 forUserIdentity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  ICDelegateAccountStore *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke;
  v14[3] = &unk_1E438AC00;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[ICDelegateAccountStore _writeUsingBlock:](self, "_writeUsingBlock:", v14);

}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  if (-[ICDelegateAccountStoreOptions isSingleWriter](self->_options, "isSingleWriter", a3))
    return -[ICDelegateAccountStore _resetCorruptionUsingSQL](self, "_resetCorruptionUsingSQL");
  -[ICDelegateAccountStore _resetCorruptionUsingXPC](self, "_resetCorruptionUsingXPC");
  return 0;
}

- (void)_openWithXPCWriter:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  ICDelegateAccountStoreXPCWriter *xpcWriter;
  uint64_t v10;
  ICDelegateAccountStoreXPCWriter *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_xpcWriter, a3);
  objc_initWeak(&location, self);
  xpcWriter = self->_xpcWriter;
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke;
  v15[3] = &unk_1E4391400;
  objc_copyWeak(&v16, &location);
  -[ICDelegateAccountStoreXPCWriter setExternalChangeHandler:](xpcWriter, "setExternalChangeHandler:", v15);
  v11 = self->_xpcWriter;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke_2;
  v13[3] = &unk_1E438AC78;
  v13[4] = self;
  v12 = v8;
  v14 = v12;
  -[ICDelegateAccountStoreXPCWriter openWithCompletionHandler:](v11, "openWithCompletionHandler:", v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (id)_popConnection
{
  os_unfair_lock_s *p_lock;
  ICSQLiteConnection *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSMutableArray count](self->_connectionPool, "count"))
  {
    os_unfair_lock_unlock(p_lock);
LABEL_5:
    __SQLiteOptionsWithAccountStoreOptions(self->_options);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReadOnly:", -[ICDelegateAccountStoreOptions isSingleWriter](self->_options, "isSingleWriter") ^ 1);
    v4 = -[ICSQLiteConnection initWithOptions:]([ICSQLiteConnection alloc], "initWithOptions:", v5);
    -[ICSQLiteConnection setDelegate:](v4, "setDelegate:", self);

    return v4;
  }
  -[NSMutableArray objectAtIndex:](self->_connectionPool, "objectAtIndex:", 0);
  v4 = (ICSQLiteConnection *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_connectionPool, "removeObjectAtIndex:", 0);
  os_unfair_lock_unlock(p_lock);
  if (!v4)
    goto LABEL_5;
  return v4;
}

- (void)_postDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("ICDelegateAccountStoreDidChangeNotification"), self);

}

- (void)_recycleConnection:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ((unint64_t)-[NSMutableArray count](self->_connectionPool, "count") > 2)
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v4, "close");
  }
  else
  {
    -[NSMutableArray addObject:](self->_connectionPool, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (BOOL)_resetCorruptionUsingSQL
{
  void *v3;
  ICSQLiteConnection *v4;
  BOOL v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __SQLiteOptionsWithAccountStoreOptions(self->_options);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICSQLiteConnection initWithOptions:]([ICSQLiteConnection alloc], "initWithOptions:", v3);
  if (!-[ICSQLiteConnection truncate](v4, "truncate"))
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_FAULT, "Could not truncate delegate account store for reset", buf, 2u);
    }
    goto LABEL_9;
  }
  v10 = 0;
  v5 = __SetupSingleWriterWithConnection(v4, &v10);
  v6 = v10;
  if (!v5)
  {
    v8 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_FAULT, "Could not setup delegate account store for reset: %{public}@", buf, 0xCu);
    }

LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  -[ICSQLiteConnection setDelegate:](v4, "setDelegate:", self);
  -[ICDelegateAccountStore _recycleConnection:](self, "_recycleConnection:", v4);
  -[ICDelegateAccountStore _postDidChangeNotification](self, "_postDidChangeNotification");
  v7 = 1;
LABEL_10:

  return v7;
}

- (void)_resetCorruptionUsingXPC
{
  ICDelegateAccountStoreXPCWriter *xpcWriter;
  _QWORD v3[5];

  xpcWriter = self->_xpcWriter;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__ICDelegateAccountStore__resetCorruptionUsingXPC__block_invoke;
  v3[3] = &unk_1E438E718;
  v3[4] = self;
  -[ICDelegateAccountStoreXPCWriter recreateWithCompletionHandler:](xpcWriter, "recreateWithCompletionHandler:", v3);
}

- (void)_writeSQLUsingBlock:(id)a3
{
  void *v4;
  ICDelegateAccountStoreReader *v5;
  ICDelegateAccountStoreSQLWriter *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  ICDelegateAccountStoreSQLWriter *v10;
  id v11;

  v8 = a3;
  -[ICDelegateAccountStore _popConnection](self, "_popConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICDelegateAccountStoreReader initWithConnection:]([ICDelegateAccountStoreReader alloc], "initWithConnection:", v4);
  v6 = -[ICDelegateAccountStoreSQLWriter initWithConnection:]([ICDelegateAccountStoreSQLWriter alloc], "initWithConnection:", v4);
  -[ICDelegateAccountStoreReader lastExpirationPruningDate](v5, "lastExpirationPruningDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__ICDelegateAccountStore__writeSQLUsingBlock___block_invoke;
  v9[3] = &unk_1E438ACA0;
  v9[4] = v7;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v4, "performTransaction:", v9);

  -[ICDelegateAccountStoreReader invalidate](v5, "invalidate");
  -[ICDelegateAccountStoreSQLWriter invalidate](v6, "invalidate");

  -[ICDelegateAccountStore _recycleConnection:](self, "_recycleConnection:", v4);
}

- (void)_writeUsingBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_isOpen)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Cannot use a closed delegate account store: %@"), self);
  if (-[ICDelegateAccountStoreOptions isSingleWriter](self->_options, "isSingleWriter"))
    -[ICDelegateAccountStore _writeSQLUsingBlock:](self, "_writeSQLUsingBlock:", v4);
  else
    -[ICDelegateAccountStore _writeXPCUsingBlock:](self, "_writeXPCUsingBlock:", v4);

}

- (void)_writeXPCUsingBlock:(id)a3
{
  ICDelegateAccountStoreXPCWriter *v4;
  void (**v5)(id, ICDelegateAccountStoreXPCWriter *);

  v5 = (void (**)(id, ICDelegateAccountStoreXPCWriter *))a3;
  v4 = self->_xpcWriter;
  v5[2](v5, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcWriter, 0);
  objc_storeStrong((id *)&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_connectionPool, 0);
}

uint64_t __46__ICDelegateAccountStore__writeSQLUsingBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D68]);
  v3 = v2;
  if (!*(_QWORD *)(a1 + 32) || (objc_msgSend(v2, "timeIntervalSinceDate:"), v4 >= 43200.0))
    objc_msgSend(*(id *)(a1 + 40), "removeTokensExpiringBeforeDate:completionHandler:", v3, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  return 1;
}

void __50__ICDelegateAccountStore__resetCorruptionUsingXPC__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification");
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Delegation");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_FAULT, "Could not recreate delegate account store: %{public}@", (uint8_t *)&v7, 0xCu);
    }

  }
}

void __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_postDidChangeNotification");
    WeakRetained = v2;
  }

}

void __63__ICDelegateAccountStore__openWithXPCWriter_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id *v13;
  id v14;

  v14 = a4;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (a3)
  {
    objc_msgSend(v6, "setDatabasePath:", a3);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(v6, "XPCServiceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8
      && objc_msgSend(v14, "code") == -7003
      && (objc_msgSend(v14, "domain"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ICError")),
          v9,
          v10))
    {
      +[ICDelegateAccountStoreSchema defaultDatabasePath](ICDelegateAccountStoreSchema, "defaultDatabasePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v12 = objc_msgSend(v11, "length");
    v13 = *(id **)(a1 + 32);
    if (v12)
      objc_msgSend(v13[3], "setDatabasePath:", v11);
    else
      objc_msgSend(v13, "close");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

void __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E43908A8;
  v5 = (void *)a1[7];
  v6[4] = a1[6];
  v7 = v5;
  objc_msgSend(a2, "setToken:forUserIdentity:completionHandler:", v3, v4, v6);

}

void __69__ICDelegateAccountStore_setToken_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E43908A8;
  v5 = (void *)a1[7];
  v6[4] = a1[6];
  v7 = v5;
  objc_msgSend(a2, "setIdentityProperties:forUserIdentity:completionHandler:", v3, v4, v6);

}

void __82__ICDelegateAccountStore_setIdentityProperties_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2;
  v4[3] = &unk_1E43908A8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "removeTokensExpiringBeforeDate:completionHandler:", v3, v4);

}

void __75__ICDelegateAccountStore_removeTokensExpiringBeforeDate_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke_2;
  v4[3] = &unk_1E43908A8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "removeTokenForUserIdentity:completionHandler:", v3, v4);

}

void __71__ICDelegateAccountStore_removeTokenForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2;
  v4[3] = &unk_1E43908A8;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(a2, "removeIdentityPropertiesForUserIdentity:completionHandler:", v3, v4);

}

void __84__ICDelegateAccountStore_removeIdentityPropertiesForUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E43908A8;
  v5 = (void *)a1[7];
  v6[4] = a1[6];
  v7 = v5;
  objc_msgSend(a2, "removeDelegationUUIDs:forUserIdentity:completionHandler:", v3, v4, v6);

}

void __82__ICDelegateAccountStore_removeDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E43908A8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "removeAllTokensWithCompletionHandler:", v4);

}

void __63__ICDelegateAccountStore_removeAllTokensWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

void __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2;
  v6[3] = &unk_1E43908A8;
  v5 = (void *)a1[7];
  v6[4] = a1[6];
  v7 = v5;
  objc_msgSend(a2, "addDelegationUUIDs:forUserIdentity:completionHandler:", v3, v4, v6);

}

void __79__ICDelegateAccountStore_addDelegationUUIDs_forUserIdentity_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_postDidChangeNotification", v5);
    v5 = v7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);
    v5 = v7;
  }

}

+ (void)openWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  void *v8;
  id v9;
  ICDelegateAccountStoreXPCWriter *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  if (objc_msgSend(v6, "isSingleWriter"))
  {
    v12 = 0;
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initSingleWriterWithOptions:error:", v6, &v12);
    v9 = v12;
    v7[2](v7, v8, v9);

  }
  else
  {
    v10 = -[ICDelegateAccountStoreXPCWriter initWithAccountStoreOptions:]([ICDelegateAccountStoreXPCWriter alloc], "initWithAccountStoreOptions:", v6);
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithValidatedOptions:", v6);
      objc_msgSend(v11, "_openWithXPCWriter:completionHandler:", v10, v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid XPC options"));
      v7[2](v7, 0, 0);
    }

  }
}

@end
