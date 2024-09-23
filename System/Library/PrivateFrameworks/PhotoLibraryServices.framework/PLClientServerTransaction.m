@implementation PLClientServerTransaction

+ (unint64_t)scopeValuesFromScopes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_scopeValuesByScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 |= objc_msgSend(v12, "unsignedLongLongValue");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_scopeValuesByScope
{
  pl_dispatch_once();
  return (id)_scopeValuesByScope__valueByScope;
}

- (PLClientServerTransaction)initWithPathManager:(id)a3
{
  id v5;
  PLClientServerTransaction *v6;
  PLClientServerTransaction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLClientServerTransaction;
  v6 = -[PLClientServerTransaction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_pathManager, a3);

  return v7;
}

void __97__PLClientServerTransaction_beginServerTransactionWithToken_changeScopes_pathManager_identifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  char v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(*(id *)(a1 + 72), "_serverTransactionForPathManager:isNew:identifier:", *(_QWORD *)(a1 + 32), &v11, *(_QWORD *)(a1 + 80));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (v11)
  {
    v5 = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), 145, 438);
    if ((v5 & 0x80000000) != 0)
    {
      PLClientServerTransactionsGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 88));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *__error();
        *(_DWORD *)buf = 138412802;
        v13 = v8;
        v14 = 2112;
        v15 = v9;
        v16 = 1024;
        v17 = v10;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "%@ Failed to open %@: %d", buf, 0x1Cu);

      }
    }
    else
    {
      v6 = v5;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setTransactionToken:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setFileDescriptor:", v6);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "setPath:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_enqueueChangeScopes:", *(_QWORD *)(a1 + 56));
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "_enqueueChangeScopes:", *(_QWORD *)(a1 + 56));
    unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"));
  }
}

- (NSString)transactionToken
{
  return self->_transactionToken;
}

- (void)setTransactionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_changeScopes, 0);
  objc_storeStrong((id *)&self->_transactionToken, 0);
}

+ (id)serverTransactionQueue
{
  pl_dispatch_once();
  return (id)serverTransactionQueue_sQueue;
}

+ (id)beginServerTransactionWithToken:(id)a3 changeScopes:(id)a4 pathManager:(id)a5 identifier:(const char *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((PLIsAssetsd() & 1) != 0)
  {
    if (v12)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLClientServerTransaction.m"), 595, CFSTR("%@ can only be called from assetsd"), v27);

  if (!v12)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing pathManager in clientServerTransaction call with token %@, scopes %@"), v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLSimulateCrash();

  }
LABEL_4:
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__87150;
  v32 = __Block_byref_object_dispose__87151;
  v33 = 0;
  objc_msgSend(v12, "privateCacheDirectoryWithSubType:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serverTransactionQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v12;
  v18 = v15;
  v19 = v10;
  v20 = v11;
  pl_dispatch_sync();

  PLClientServerTransactionsGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v29[5];
    *(_DWORD *)buf = 138412802;
    v35 = v22;
    v36 = 2112;
    v37 = v19;
    v38 = 2112;
    v39 = v23;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "%@ : %@ -> %@", buf, 0x20u);

  }
  v24 = (id)v29[5];

  _Block_object_dispose(&v28, 8);
  return v24;
}

+ (id)beginClientTransactionWithChangeScopes:(id)a3 pathManager:(id)a4 identifier:(const char *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  _PLClientTransaction *v19;
  NSObject *v20;
  _PLClientTransaction *v21;
  _PLClientTransaction *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v28;
  void *v29;
  int v30;
  id v31;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  _PLClientTransaction *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing pathManager in clientServerTransaction call with token %@, scopes %@"), v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PLSimulateCrash();

  }
  +[_PLClientTransaction _fdResourceSemaphore](_PLClientTransaction, "_fdResourceSemaphore");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(a1, "_filePathForTransactionWithToken:pathManager:", v11, v9);
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 2705, 438);
  if ((v16 & 0x80000000) == 0)
    goto LABEL_14;
  v31 = v8;
  objc_msgSend(v9, "privateCacheDirectoryWithSubType:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v33 = 0;
    v18 = objc_msgSend(MEMORY[0x1E0D73208], "createDirectoryAtPath:error:", v17, &v33);
    v19 = (_PLClientTransaction *)v33;
    if ((v18 & 1) != 0)
      goto LABEL_13;
  }
  else
  {
    v19 = 0;
  }
  PLClientServerTransactionsGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v35 = v17;
    v36 = 2112;
    v37 = v19;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Unable to create directory: %@, reason: %@", buf, 0x16u);
  }

LABEL_13:
  v21 = (_PLClientTransaction *)objc_retainAutorelease(v15);
  v16 = open((const char *)-[_PLClientTransaction fileSystemRepresentation](v21, "fileSystemRepresentation"), 2705, 438);

  v8 = v31;
  if ((v16 & 0x80000000) == 0)
  {
LABEL_14:
    v22 = -[_PLClientTransaction initWithPathManager:identifier:]([_PLClientTransaction alloc], "initWithPathManager:identifier:", v9, a5);
    -[PLClientServerTransaction setTransactionToken:](v22, "setTransactionToken:", v11);
    -[_PLClientTransaction setFileDescriptor:](v22, "setFileDescriptor:", v16);
    -[_PLClientTransaction setPath:](v22, "setPath:", v15);
    -[_PLClientTransaction addChangeScopes:](v22, "addChangeScopes:", v8);
    -[_PLClientTransaction setFdResourceSemaphore:](v22, "setFdResourceSemaphore:", v14);
    goto LABEL_15;
  }
  PLClientServerTransactionsGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *__error();
    *(_DWORD *)buf = 138412802;
    v35 = v29;
    v36 = 2112;
    v37 = v21;
    v38 = 1024;
    v39 = v30;
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "%@ Failed to open transaction %@: %d", buf, 0x1Cu);

  }
  if (v14)
    dispatch_semaphore_signal(v14);
  v22 = 0;
LABEL_15:
  if ((PLIsAssetsd() & 1) != 0 || PLIsSuppressingLogsForUnitTesting())
  {
    PLClientServerTransactionsGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v24;
      v36 = 2112;
      v37 = v22;
      v25 = v23;
      v26 = OS_LOG_TYPE_DEBUG;
LABEL_21:
      _os_log_impl(&dword_199541000, v25, v26, "%@ : %@", buf, 0x16u);

    }
  }
  else
  {
    PLClientServerTransactionsGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v35 = v24;
      v36 = 2112;
      v37 = v22;
      v25 = v23;
      v26 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_21;
    }
  }

  return v22;
}

+ (id)_serverTransactionForPathManager:(id)a3 isNew:(BOOL *)a4 identifier:(const char *)a5
{
  id v9;
  NSObject *v10;
  void *v11;
  _PLServerTransaction *v12;
  void *v14;

  v9 = a3;
  +[PLClientServerTransaction serverTransactionQueue](PLClientServerTransaction, "serverTransactionQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLClientServerTransaction.m"), 456, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outIsNew"));

  }
  if (_serverTransactionForPathManager_isNew_identifier__onceToken != -1)
    dispatch_once(&_serverTransactionForPathManager_isNew_identifier__onceToken, &__block_literal_global_138_87168);
  objc_msgSend(v9, "photosDatabasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath, "objectForKey:", v11);
  v12 = (_PLServerTransaction *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = -[_PLServerTransaction initWithPathManager:identifier:]([_PLServerTransaction alloc], "initWithPathManager:identifier:", v9, a5);
    objc_msgSend((id)_serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath, "setObject:forKey:", v12, v11);
    *a4 = 1;
  }

  return v12;
}

+ (id)_filePathForTransactionWithToken:(id)a3 pathManager:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "privateCacheDirectoryWithSubType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)stillAlive
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  PLClientServerTransaction *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLClientServerTransactionsGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "%@ : %@", (uint8_t *)&v6, 0x16u);

  }
}

- (BOOL)isClientTransaction
{
  return 0;
}

- (NSSet)changeScopes
{
  return self->_changeScopes;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

+ (id)scopesFromScopeValues:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_scopeValuesByScope");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "unsignedLongLongValue") & ~a3) == 0)
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)beginServerTransactionWithClientTransactionFromXPCDictionary:(id)a3 pathManager:(id)a4 identifier:(const char *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a3;
  +[PLClientServerTransaction _transactionTokenFromXPCDictionary:](PLClientServerTransaction, "_transactionTokenFromXPCDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLClientServerTransaction _changeScopesFromXPCDictionary:](PLClientServerTransaction, "_changeScopesFromXPCDictionary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v10, v11, v8, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_recoveryHistoryFilePathForPathManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "photoDirectoryWithType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("recoveryhistory"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)_recordRecoveryAttemptForPathManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_recoveryHistoryFilePathForPathManager:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithContentsOfFile:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);
  if ((unint64_t)objc_msgSend(v4, "count") >= 0xB)
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
  objc_msgSend(v4, "writeToFile:atomically:", v8, 0);
  v6 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "changeFileOwnerToMobileAtPath:error:usingFileManager:", v8, 0, v7);

  if ((v6 & 1) == 0)
    NSLog(CFSTR("ClientServerTransaction: Unable to set file owner: %@, reason: %@"), v8, 0);

}

+ (BOOL)_hasExcessiveRecoveryAttemptsForPathManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_recoveryHistoryFilePathForPathManager:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 0xA)
  {
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToArray:", v5) & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceDate:", v8);
      v11 = v10;
      v6 = v10 < 600.0;
      if (v10 < 600.0)
      {
        PLClientServerTransactionsGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v14 = 134218240;
          v15 = objc_msgSend(v5, "count");
          v16 = 2048;
          v17 = v11;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "found excessive recovery attempts (count: %lu within: %g seconds)", (uint8_t *)&v14, 0x16u);
        }

      }
    }
    else
    {
      PLClientServerTransactionsGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "detected out of order recovery attempt, ignoring history for now.", (uint8_t *)&v14, 2u);
      }
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_archiveRecoveryHistoryForPathManager:(id)a3 error:(id *)a4
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
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "_recoveryHistoryFilePathForPathManager:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("archivedrecoveryhistory-%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "photoDirectoryWithType:", 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  PLClientServerTransactionsGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "archiving recovery history file to: %@...", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v16 = objc_msgSend(v15, "moveItemAtPath:toPath:error:", v6, v13, &v20);
  v17 = v20;
  v18 = v17;
  if (a4 && (v16 & 1) == 0)
    *a4 = objc_retainAutorelease(v17);

  return v16;
}

+ (void)_checkForAndHandleExcessiveRecoveryAttemptsForPathManager:(id)a3 sqliteErrorHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  char v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (objc_msgSend(a1, "_hasExcessiveRecoveryAttemptsForPathManager:", v6))
  {
    v12 = 0;
    v8 = objc_msgSend(a1, "_archiveRecoveryHistoryForPathManager:error:", v6, &v12);
    v9 = v12;
    PLClientServerTransactionsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if ((v8 & 1) != 0)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "triggering full rebuild due to excessive recovery attempts.", buf, 2u);
      }

      objc_msgSend(v6, "setSqliteErrorForRebuildReason:allowsExit:", 11, 1);
      v7[2](v7);
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "unable to full rebuild after excessive recovery attempts due to inability to archive history file: %@", buf, 0xCu);
      }

    }
  }

}

+ (id)_allTransactionPathsForPathManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "privateCacheDirectoryWithSubType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x19AEC1554]();
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v12);
        if (v14)
        {
          objc_msgSend(v3, "stringByAppendingPathComponent:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  return v6;
}

+ (unint64_t)_readScopeValuesFromFileDescriptor:(int)a3
{
  unint64_t __buf;

  __buf = 0;
  if (pread(a3, &__buf, 8uLL, 0) == 8)
    return __buf;
  else
    return 0xFFFFFFFFLL;
}

+ (BOOL)_isOutstandingTransactionAtPath:(id)a3 getScopeValues:(unint64_t *)a4
{
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v6 = objc_retainAutorelease(a3);
  v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 164, 438);
  if ((v7 & 0x80000000) == 0)
  {
    if (a4)
      *a4 = objc_msgSend(a1, "_readScopeValuesFromFileDescriptor:", v7);
    flock(v7, 8);
    v8 = v7;
    goto LABEL_8;
  }
  if (a4)
  {
    v9 = open((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 132, 438);
    if ((v9 & 0x80000000) == 0)
    {
      v8 = v9;
      *a4 = objc_msgSend(a1, "_readScopeValuesFromFileDescriptor:", v9);
LABEL_8:
      close(v8);
    }
  }

  return (int)v7 >= 0;
}

+ (id)_outstandingTransactionScopesByPathForPathManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *context;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)MEMORY[0x19AEC1554]();
  v16 = v4;
  objc_msgSend(a1, "_allTransactionPathsForPathManager:", v4);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x19AEC1554]();
        v17 = 0;
        if (objc_msgSend(a1, "_isOutstandingTransactionAtPath:getScopeValues:", v11, &v17))
        {
          +[PLClientServerTransaction scopesFromScopeValues:](PLClientServerTransaction, "scopesFromScopeValues:", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, v11);

        }
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_autoreleasePoolPop(context);
  return v5;
}

+ (id)handleOutstandingTransactionsForPathManager:(id)a3 sqliteErrorHandler:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  dispatch_source_t v14;
  dispatch_time_t v15;
  NSObject *v16;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[3];
  int v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLClientServerTransaction.m"), 805, CFSTR("%@ can only be called from assetsd"), v19);

  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sharedUtilityQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v13);

  v20 = v9;
  v22 = v10;
  v23 = v11;
  v21 = v14;
  pl_dispatch_source_set_event_handler();
  v15 = dispatch_time(0, 3000000000);
  dispatch_source_set_timer(v21, v15, 0xB2D05E00uLL, 0x989680uLL);
  dispatch_resume(v21);
  v16 = v21;

  _Block_object_dispose(v24, 8);
  return v16;
}

+ (void)cancelOutstandingTransactionHandlerTimer:(id)a3
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sharedUtilityQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PLClientServerTransaction_cancelOutstandingTransactionHandlerTimer___block_invoke;
    block[3] = &unk_1E3677AA0;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

+ (void)_cleanupAllTransactionsScopesByPath:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  __int128 v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412546;
    v14 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x1E0D73208], "fileManager", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        v11 = objc_msgSend(v10, "removeItemAtPath:error:", v9, &v15);
        v12 = v15;

        if ((v11 & 1) == 0)
        {
          PLClientServerTransactionsGetLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            v21 = v9;
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to remove transaction path %@ : %@", buf, 0x16u);
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v6);
  }

}

+ (id)_transactionTokenFromXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *string;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4
    && MEMORY[0x19AEC2100](v4) == MEMORY[0x1E0C812F8]
    && (string = xpc_dictionary_get_string(v5, "PLClientServerTransactionXPCKey")) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  PLClientServerTransactionsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v8;
    v13 = 2048;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v11, 0x20u);

  }
  return v6;
}

+ (id)_changeScopesFromXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x19AEC2100](v4) == MEMORY[0x1E0C812F8])
  {
    +[PLClientServerTransaction scopesFromScopeValues:](PLClientServerTransaction, "scopesFromScopeValues:", xpc_dictionary_get_uint64(v5, "PLClientServerTransactionScopesXPCKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  PLClientServerTransactionsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v10, 0x20u);

  }
  return v6;
}

+ (id)_libraryURLFromXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x19AEC2100](v4) == MEMORY[0x1E0C812F8])
  {
    PLURLFromXPCDictionary();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  PLClientServerTransactionsGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v8;
    v12 = 2048;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v10, 0x20u);

  }
  return v6;
}

+ (void)addTransaction:(id)a3 toXPCDictionary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLClientServerTransactionsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = v9;
    v19 = 2048;
    v20 = v7;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(v6, "transactionToken");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v7)
  {
    if (v10)
    {
      v12 = MEMORY[0x19AEC2100](v7);
      v13 = MEMORY[0x1E0C812F8];
      if (v12 == MEMORY[0x1E0C812F8])
      {
        xpc_dictionary_set_string(v7, "PLClientServerTransactionXPCKey", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
        objc_msgSend(v6, "changeScopes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && MEMORY[0x19AEC2100](v7) == v13)
          xpc_dictionary_set_uint64(v7, "PLClientServerTransactionScopesXPCKey", +[PLClientServerTransaction scopeValuesFromScopes:](PLClientServerTransaction, "scopeValuesFromScopes:", v14));
        objc_msgSend(v6, "pathManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "libraryURL");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 && MEMORY[0x19AEC2100](v7) == v13)
          PLXPCDictionarySetURL();

      }
    }
  }

}

+ (void)addTransaction:(id)a3 toUserInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLClientServerTransactionsGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v6;
    v14 = 2048;
    v15 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "%@ : %@ -> %p", (uint8_t *)&v10, 0x20u);

  }
  if (v6)
    objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("PLClientServerTransactionUserInfoKey"));

}

+ (void)removeTransactionFromUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLClientServerTransactionsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ : %p", (uint8_t *)&v7, 0x16u);

  }
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("PLClientServerTransactionUserInfoKey"));

}

+ (id)transactionFromUserInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("PLClientServerTransactionUserInfoKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLClientServerTransactionsGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412802;
    v10 = v7;
    v11 = 2048;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%@ : %p -> %@", (uint8_t *)&v9, 0x20u);

  }
  return v5;
}

+ (id)descriptionOfTransactionScopes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "substringFromIndex:", 18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)descriptionOfAllTransactionFilesForPathManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_allTransactionPathsForPathManager:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v25 = v4;
    objc_msgSend(v4, "privateCacheDirectoryWithSubType:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "count");
    v9 = objc_msgSend(v5, "count");
    v10 = CFSTR("s");
    if (v9 == 1)
      v10 = &stru_1E36789C0;
    v24 = (void *)v7;
    objc_msgSend(v6, "appendFormat:", CFSTR("Found %d transaction file%@ in %@\n"), v8, v10, v7);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v27 = 0;
          v16 = objc_msgSend(a1, "_isOutstandingTransactionAtPath:getScopeValues:", v15, &v27);
          +[PLClientServerTransaction scopesFromScopeValues:](PLClientServerTransaction, "scopesFromScopeValues:", v27);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "lastPathComponent");
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v16)
            v20 = CFSTR("%@ [outstanding]:\n");
          else
            v20 = CFSTR("%@ [active]:\n");
          objc_msgSend(v6, "appendFormat:", v20, v18);

          objc_msgSend(v17, "allObjects");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "descriptionOfTransactionScopes:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendFormat:", CFSTR("\t{%@}\n"), v22);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }

    v4 = v25;
  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR("No transaction files found\n"));
  }

  return v6;
}

void __70__PLClientServerTransaction_cancelOutstandingTransactionHandlerTimer___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __100__PLClientServerTransaction_handleOutstandingTransactionsForPathManager_sqliteErrorHandler_handler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (+[PLPhotoLibrary areOpportunisticTasksDisabled](PLPhotoLibrary, "areOpportunisticTasksDisabled"))
  {
    HIDWORD(v2) = -858993459 * *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) + 429496728;
    LODWORD(v2) = HIDWORD(v2);
    if ((v2 >> 1) <= 0x19999998)
    {
      PLClientServerTransactionsGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = 1717986919 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = (v4 >> 34) + ((unint64_t)v4 >> 63);
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "delaying check for outstandingTransactions while opportunistic tasks are disabled [%d]", buf, 8u);
      }

      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "+[PLClientServerTransaction handleOutstandingTransactionsForPathManager:sqliteErrorHandler:handler:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 72), "_outstandingTransactionScopesByPathForPathManager:", *(_QWORD *)(a1 + 32));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLClientServerTransactionsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "scopes by path: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("DisableCrashRecovery"));

    if (v9)
    {
      PLClientServerTransactionsGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = CFSTR("DisableCrashRecovery");
        v29 = 2112;
        v30 = v6;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "%@ set: Ignoring all outsatnding scopes by path: %@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 72), "_cleanupAllTransactionsScopesByPath:", v6);
    }
    else if (-[__CFString count](v6, "count"))
    {
      PLClientServerTransactionsGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = -[__CFString count](v6, "count");
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "handling %d outstanding transactions...", buf, 8u);
      }

      objc_msgSend(*(id *)(a1 + 72), "_recordRecoveryAttemptForPathManager:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 72), "_checkForAndHandleExcessiveRecoveryAttemptsForPathManager:sqliteErrorHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v14 = v6;
      v15 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            -[__CFString objectForKey:](v14, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString unionSet:](v13, "unionSet:", v19);

          }
          v16 = -[__CFString countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

      PLClientServerTransactionsGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v13;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "outstandingTransactions scopes: %@", buf, 0xCu);
      }

      if (*(_QWORD *)(a1 + 56))
      {
        v21 = (void *)MEMORY[0x19AEC1554]();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        objc_autoreleasePoolPop(v21);
      }
      objc_msgSend(*(id *)(a1 + 72), "_cleanupAllTransactionsScopesByPath:", v14, (_QWORD)v22);

    }
    objc_msgSend(v5, "stillAlive");
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));

  }
}

void __48__PLClientServerTransaction__scopeValuesByScope__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];
  _QWORD v3[14];

  v3[13] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("PLTransactionScopeMomentGeneration");
  v2[1] = CFSTR("PLTransactionScopeCloudFeed");
  v3[0] = &unk_1E37608D8;
  v3[1] = &unk_1E37608F0;
  v2[2] = CFSTR("PLTransactionScopeSearchIndex");
  v2[3] = CFSTR("PLTransactionScopeAlbumCounts");
  v3[2] = &unk_1E3760908;
  v3[3] = &unk_1E3760920;
  v2[4] = CFSTR("PLTransactionScopeImportSessionCounts");
  v2[5] = CFSTR("PLTransactionScopeDuplicateAnalysis");
  v3[4] = &unk_1E3760938;
  v3[5] = &unk_1E3760950;
  v2[6] = CFSTR("PLTransactionScopeFilePersistence");
  v2[7] = CFSTR("PLTransactionScopeFileIngestion");
  v3[6] = &unk_1E3760968;
  v3[7] = &unk_1E3760980;
  v2[8] = CFSTR("PLTransactionScopePlaceholderDownload");
  v2[9] = CFSTR("PLTransactionScopeLockedResources");
  v3[8] = &unk_1E3760998;
  v3[9] = &unk_1E37609B0;
  v2[10] = CFSTR("PLTransactionScopeSocialGroupAssetPersonEdges");
  v2[11] = CFSTR("PLTransactionScopeSocialGroupAssetContainment");
  v3[10] = &unk_1E37609C8;
  v3[11] = &unk_1E37609E0;
  v2[12] = CFSTR("PLTransactionScopeSocialGroupDeduplication");
  v3[12] = &unk_1E37609F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scopeValuesByScope__valueByScope;
  _scopeValuesByScope__valueByScope = v0;

}

void __79__PLClientServerTransaction__serverTransactionForPathManager_isNew_identifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath;
  _serverTransactionForPathManager_isNew_identifier__sServerTransactionsByLibraryPath = v0;

}

void __51__PLClientServerTransaction_serverTransactionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("PLClientServerTransactions", 0);
  v1 = (void *)serverTransactionQueue_sQueue;
  serverTransactionQueue_sQueue = (uint64_t)v0;

}

@end
