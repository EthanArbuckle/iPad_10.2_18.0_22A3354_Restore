@implementation TRISQLiteCKDatabase

- (TRISQLiteCKDatabase)initWithParentDir:(id)a3 assetCacheDir:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRISQLiteCKDatabase *v11;
  TRISQLiteCKDatabase *v12;
  id *p_parentDir;
  uint64_t v14;
  NSString *assetDir;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v26;
  NSObject *v27;
  uint64_t v28;
  OS_dispatch_queue *opQueue;
  TRISQLiteCKDatabase *v30;
  NSObject *v31;
  NSObject *v32;
  _PASSqliteDatabase *v33;
  NSObject *v34;
  uint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[5];
  id v40;
  objc_super v41;
  uint8_t v42[4];
  uint64_t v43;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentDir"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCacheDir"));

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)TRISQLiteCKDatabase;
  v11 = -[TRISQLiteCKDatabase init](&v41, sel_init);
  v12 = v11;
  if (v11)
  {
    p_parentDir = (id *)&v11->_parentDir;
    objc_storeStrong((id *)&v11->_parentDir, a3);
    objc_storeStrong((id *)&v12->_assetCacheDir, a4);
    objc_msgSend(*p_parentDir, "stringByAppendingPathComponent:", CFSTR("assets"));
    v14 = objc_claimAutoreleasedReturnValue();
    assetDir = v12->_assetDir;
    v12->_assetDir = (NSString *)v14;

    if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
      }

      goto LABEL_31;
    }
    objc_msgSend(*p_parentDir, "stringByAppendingPathComponent:", CFSTR("TRISQLiteCKDatabase.db"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

    if ((v19 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *p_parentDir, 1, 0, 0);

    }
    v21 = (void *)MEMORY[0x1E0D81620];
    v22 = (void *)objc_opt_new();
    v40 = 0;
    objc_msgSend(v21, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", v17, 3, v22, &v40);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v40;
    db = v12->_db;
    v12->_db = (_PASSqliteDatabase *)v23;

    v26 = v12->_db;
    if (v26)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__1;
      v47 = __Block_byref_object_dispose__1;
      v48 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __55__TRISQLiteCKDatabase_initWithParentDir_assetCacheDir___block_invoke;
      v39[3] = &unk_1E932F8A0;
      v39[4] = &buf;
      if ((-[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](v26, "prepAndRunNonDataQueries:onError:", &unk_1E93636C0, v39) & 1) != 0)
      {
        _Block_object_dispose(&buf, 8);

        if ((v19 & 1) == 0)
        {
          TRILogCategory_Server();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v17;
            _os_log_impl(&dword_1D207F000, v27, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
          }

        }
        if (-[TRISQLiteCKDatabase migrateToVersion:](v12, "migrateToVersion:", *MEMORY[0x1E0D817B8]))
        {
          objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.Trial.TRISQLiteCKDatabase.operation", 17);
          v28 = objc_claimAutoreleasedReturnValue();
          opQueue = v12->_opQueue;
          v12->_opQueue = (OS_dispatch_queue *)v28;

          goto LABEL_18;
        }
        TRILogCategory_Server();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "TRISQLiteCKDatabase: migrations failed", (uint8_t *)&buf, 2u);
        }

      }
      else
      {
        TRILogCategory_Server();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v36 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
          *(_DWORD *)v42 = 138543362;
          v43 = v36;
          _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", v42, 0xCu);
        }

        -[_PASSqliteDatabase closePermanently](v12->_db, "closePermanently");
        v33 = v12->_db;
        v12->_db = 0;

        if ((v19 & 1) == 0)
          objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", v17);
        _Block_object_dispose(&buf, 8);

      }
    }
    else
    {
      TRILogCategory_Server();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v24;
        _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
LABEL_31:
    v30 = 0;
    goto LABEL_32;
  }
LABEL_18:
  v30 = v12;
LABEL_32:

  return v30;
}

uint64_t __55__TRISQLiteCKDatabase_initWithParentDir_assetCacheDir___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

- (OS_dispatch_queue)operationQueue
{
  return self->_opQueue;
}

- (void)addOperation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *opQueue;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  id v23;

  v5 = a3;
  -[TRISQLiteCKDatabase container](self, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContainer:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v5;
    opQueue = self->_opQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__TRISQLiteCKDatabase_addOperation___block_invoke;
    block[3] = &unk_1E932F8C8;
    block[4] = self;
    v23 = v8;
    dispatch_async(opQueue, block);
    v10 = v23;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v5;
      v12 = self->_opQueue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __36__TRISQLiteCKDatabase_addOperation___block_invoke_2;
      v20[3] = &unk_1E932F8C8;
      v20[4] = self;
      v21 = v11;
      dispatch_async(v12, v20);
      v10 = v21;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 202, CFSTR("Operation of class %@ is not supported."), v17);

        goto LABEL_8;
      }
      v13 = v5;
      v14 = self->_opQueue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __36__TRISQLiteCKDatabase_addOperation___block_invoke_3;
      v18[3] = &unk_1E932F8C8;
      v18[4] = self;
      v19 = v13;
      dispatch_async(v14, v18);
      v10 = v19;
    }
  }

LABEL_8:
}

uint64_t __36__TRISQLiteCKDatabase_addOperation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processQueryOperation:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__TRISQLiteCKDatabase_addOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processFetchRecordsOperation:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__TRISQLiteCKDatabase_addOperation___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processModifyRecordsOperation:", *(_QWORD *)(a1 + 40));
}

- (void)saveRecordZone:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *opQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  opQueue = self->_opQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__TRISQLiteCKDatabase_saveRecordZone_completionHandler___block_invoke;
  v11[3] = &unk_1E932F8F0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(opQueue, v11);

}

uint64_t __56__TRISQLiteCKDatabase_saveRecordZone_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)deleteRecordZoneWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *opQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  opQueue = self->_opQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__TRISQLiteCKDatabase_deleteRecordZoneWithID_completionHandler___block_invoke;
  v11[3] = &unk_1E932F8F0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(opQueue, v11);

}

uint64_t __64__TRISQLiteCKDatabase_deleteRecordZoneWithID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (void)closePermanently
{
  NSObject *opQueue;
  _QWORD block[5];

  opQueue = self->_opQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__TRISQLiteCKDatabase_closePermanently__block_invoke;
  block[3] = &unk_1E932F918;
  block[4] = self;
  dispatch_sync(opQueue, block);
}

void __39__TRISQLiteCKDatabase_closePermanently__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "closePermanently");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

+ (id)mockContainerWithIdentifier:(id)a3 database:(id)a4
{
  id v5;
  id v6;
  TRISQLiteCKContainer *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TRISQLiteCKContainer initWithContainerIdentifier:database:]([TRISQLiteCKContainer alloc], "initWithContainerIdentifier:database:", v6, v5);

  return v7;
}

- (void)_processQueryOperation:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _PASSqliteDatabase *db;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  void *v30;
  void (**v31)(void);
  _QWORD v32[4];
  id v33;
  TRISQLiteCKDatabase *v34;
  id v35;
  id v36;
  uint64_t *v37;
  SEL v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v5 = a3;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__1;
  v51 = __Block_byref_object_dispose__1;
  v52 = 0;
  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "cursor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "query");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "cursor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "offset");

  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = v11;
  if (!v8)
  {
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, CFSTR("Query operation must specify a query."));
    v22 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v48[5];
    v48[5] = v22;
    goto LABEL_9;
  }
  -[TRISQLiteCKDatabase delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12
    || (-[TRISQLiteCKDatabase delegate](self, "delegate"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "shouldProcessQueryOperation:error:", v5, v48 + 5),
        v13,
        v12,
        (v14 & 1) != 0))
  {
    v15 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke;
    v40[3] = &unk_1E932F940;
    v42 = &v43;
    v16 = v5;
    v41 = v16;
    v17 = (void *)MEMORY[0x1D8232C48](v40);
    v18 = (void *)MEMORY[0x1E0D81630];
    db = self->_db;
    v32[0] = v15;
    v32[1] = 3221225472;
    v32[2] = __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke_2;
    v32[3] = &unk_1E932F968;
    v33 = v8;
    v34 = self;
    v38 = a2;
    v39 = v11;
    v35 = v16;
    v37 = &v47;
    v20 = v17;
    v36 = v20;
    objc_msgSend(v18, "readTransactionWithHandle:failableBlock:", db, v32);

    v21 = v41;
LABEL_9:

    goto LABEL_10;
  }
  if (!v48[5])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 249, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(v5, "queryCompletionBlock");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1D8232A5C]();
    v25 = objc_msgSend(v5, "resultsLimit");
    if (v25 == *MEMORY[0x1E0C94988] || (v26 = objc_msgSend(v5, "resultsLimit") + v11, v26 != v44[3]))
    {
      v27 = 0;
    }
    else
    {
      v27 = (void *)objc_opt_new();
      objc_msgSend(v27, "setQuery:", v8);
      objc_msgSend(v27, "setOffset:", v44[3]);
    }
    objc_msgSend(v5, "queryCompletionBlock");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v28)[2](v28, v27, v48[5]);

    objc_autoreleasePoolPop(v24);
  }
  objc_msgSend(v5, "completionBlock");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v5, "completionBlock");
    v31 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v31[2]();

    objc_autoreleasePoolPop(v30);
  }
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(&v47, 8);
}

void __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(id, id, id, id);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = *(void **)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  objc_msgSend(v6, "recordMatchedBlock");
  v10 = (void (**)(id, id, id, id))objc_claimAutoreleasedReturnValue();
  v10[2](v10, v9, v8, v7);

}

uint64_t __46__TRISQLiteCKDatabase__processQueryOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  void *v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), CFSTR("TRISQLiteCKDatabase.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    v4 = *(void **)(a1 + 32);
  }
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v4, "recordType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sortDescriptors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 80);
  v10 = objc_msgSend(*(id *)(a1 + 48), "resultsLimit");
  objc_msgSend(*(id *)(a1 + 48), "desiredKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v5, "_evalQueryOperationWithRecordType:predicate:sortDescriptors:offset:resultsLimit:desiredKeys:txn:error:recordMatchedBlock:", v6, v7, v8, v9, v10, v11, v3, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40, *(_QWORD *)(a1 + 56));

  v13 = (unsigned __int8 *)MEMORY[0x1E0D81678];
  v14 = (unsigned __int8 *)MEMORY[0x1E0D81680];

  if (v12)
    v15 = v13;
  else
    v15 = v14;
  return *v15;
}

- (BOOL)_evalQueryOperationWithRecordType:(id)a3 predicate:(id)a4 sortDescriptors:(id)a5 offset:(unint64_t)a6 resultsLimit:(unint64_t)a7 desiredKeys:(id)a8 txn:(id)a9 error:(id *)a10 recordMatchedBlock:(id)a11
{
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char **v20;
  uint64_t v21;
  char *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  int v28;
  const char *v29;
  void *v30;
  id v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  id v36;
  BOOL v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  id v46;
  void *v47;
  int v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id obj;
  void *v56;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[5];
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  uint64_t *v73;
  id *v74;
  _QWORD v75[4];
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  _QWORD v81[5];
  _QWORD v82[5];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v64 = a4;
  v63 = a5;
  v65 = a8;
  v61 = a9;
  v62 = a11;
  -[TRISQLiteCKDatabase _allRecordTypes](self, "_allRecordTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v17, "containsObject:", v16);

  if ((a5 & 1) != 0)
  {
    -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v16);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v60)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

    }
    v89 = 0;
    v90 = 0;
    if (-[TRISQLiteCKDatabase _parseDesiredKeys:recordType:unindexedFields:indexedFields:error:](self, "_parseDesiredKeys:recordType:unindexedFields:indexedFields:error:", v65, v16, &v90, &v89, a10))
    {
      if (!v90)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unindexedDesiredKeys"));

      }
      if (!v89)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexedDesiredKeys"));

      }
      v56 = (void *)objc_opt_new();
      v87 = 0;
      v88 = 0;
      if (-[TRISQLiteCKDatabase _translatePredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translatePredicate:forRecordType:toSQLExpr:paramBindings:error:", v64, v16, &v88, &v87, a10))
      {
        if (!v88)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("whereClauseExpr"));

        }
        if (!v87)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("whereClauseBindings"));

        }
        objc_msgSend(v56, "addObjectsFromArray:");
        if (objc_msgSend(v63, "count"))
        {
          v59 = (void *)objc_opt_new();
          v85 = 0u;
          v86 = 0u;
          v83 = 0u;
          v84 = 0u;
          obj = v63;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v84;
            v20 = &selRef__validateNamespaceName_error_;
            while (2)
            {
              v21 = 0;
              v22 = v20[235];
              do
              {
                if (*(_QWORD *)v84 != v19)
                  objc_enumerationMutation(obj);
                v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v21);
                objc_msgSend(v23, "key");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v24 || (v25 = objc_msgSend(v23, "selector") == (_QWORD)v22, v24, !v25))
                {
                  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported sort descriptor: %@"), v23);
                  -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = *a10;
                  *a10 = v39;

                  v37 = 0;
                  v33 = CFSTR(" ORDER BY rowid ASC");
                  goto LABEL_42;
                }
                v26 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v23, "key");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v23, "ascending");
                v29 = "DESC";
                if (v28)
                  v29 = "ASC";
                v30 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("%@ %s"), v27, v29);
                objc_msgSend(v59, "addObject:", v30);

                ++v21;
              }
              while (v18 != v21);
              v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v91, 16);
              v20 = &selRef__validateNamespaceName_error_;
              if (v18)
                continue;
              break;
            }
          }

          v31 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(v59, "componentsJoinedByString:", CFSTR(", "));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (__CFString *)objc_msgSend(v31, "initWithFormat:", CFSTR(" ORDER BY %@"), v32);

        }
        else
        {
          v33 = CFSTR(" ORDER BY rowid ASC");
        }
        v41 = MEMORY[0x1E0C809B0];
        if (*MEMORY[0x1E0C94988] == a7)
        {
          v42 = &stru_1E9336E60;
        }
        else
        {
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke;
          v82[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
          v82[4] = a7;
          v43 = (void *)MEMORY[0x1D8232C48](v82);
          objc_msgSend(v56, "addObject:", v43);

          v42 = CFSTR(" LIMIT ?");
        }
        if (a6)
        {
          v81[0] = v41;
          v81[1] = 3221225472;
          v81[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_2;
          v81[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
          v81[4] = a6;
          v44 = (void *)MEMORY[0x1D8232C48](v81);
          objc_msgSend(v56, "addObject:", v44);

          v45 = CFSTR(" OFFSET ?");
        }
        else
        {
          v45 = &stru_1E9336E60;
        }
        v46 = objc_alloc(MEMORY[0x1E0CB3940]);
        v59 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("SELECT *, trisql_recordId AS trisql_outer_recordId FROM %@ WHERE %@%@%@%@"), v16, v88, v33, v42, v45);
        v77 = 0;
        v78 = &v77;
        v79 = 0x2020000000;
        v80 = 1;
        objc_msgSend(v61, "db");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v75[0] = v41;
        v75[1] = 3221225472;
        v75[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_3;
        v75[3] = &unk_1E932F1F0;
        v76 = v56;
        v67[0] = v41;
        v67[1] = 3221225472;
        v67[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_4;
        v67[3] = &unk_1E932F9B0;
        v67[4] = self;
        v68 = v16;
        v69 = v90;
        v70 = v89;
        v73 = &v77;
        v74 = a10;
        v71 = v61;
        v72 = v62;
        v66[0] = v41;
        v66[1] = 3221225472;
        v66[2] = __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_5;
        v66[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
        v66[4] = a10;
        v48 = objc_msgSend(v47, "prepAndRunQuery:onPrep:onRow:onError:", v59, v75, v67, v66);

        if (v48)
          v37 = *((_BYTE *)v78 + 24) != 0;
        else
          v37 = 0;

        _Block_object_dispose(&v77, 8);
LABEL_42:

      }
      else
      {
        v37 = 0;
      }

    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unrecognized record type: %@"), v16);
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *a10;
    *a10 = v35;

    v37 = 0;
  }

  return v37;
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 32) >= 0x7FFFFFFFFFFFFFFFuLL)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "bindParam:toInt64:", a3, v3);
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 32) >= 0x7FFFFFFFFFFFFFFFuLL)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "bindParam:toInt64:", a3, v3);
}

void __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 += i;
    }
    while (v6);
  }

}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 *v7;

  objc_msgSend(*(id *)(a1 + 32), "_createRecordFromSelectRow:recordType:unindexedDesiredKeys:indexedDesiredKeys:txn:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 72);
    if (v5)
    {
      objc_msgSend(v3, "recordID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v5 + 16))(v5, v6, v4, 0);

    }
    v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  }

  return *v7;
}

uint64_t __144__TRISQLiteCKDatabase__evalQueryOperationWithRecordType_predicate_sortDescriptors_offset_resultsLimit_desiredKeys_txn_error_recordMatchedBlock___block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong(*(id **)(a1 + 32), a2);
  return *MEMORY[0x1E0D81788];
}

- (BOOL)_parseDesiredKeys:(id)a3 recordType:(id)a4 unindexedFields:(id *)a5 indexedFields:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v50;
  id *location;
  id *v52;
  id *v53;
  id v54;
  id v55;
  id obj;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v14);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v58)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 428, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

    if (v13)
      goto LABEL_3;
LABEL_32:
    -[TRISQLiteCKDatabase _keysForFieldsOfRecordType:](self, "_keysForFieldsOfRecordType:", v14);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *a5;
    *a5 = v46;

    if (!*a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 432, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("*unindexedFields"));

    }
    v48 = *a6;
    *a6 = (id)MEMORY[0x1E0C9AA70];

    v38 = 1;
    goto LABEL_35;
  }
  if (!v13)
    goto LABEL_32;
LABEL_3:
  location = a5;
  v52 = a6;
  v53 = a7;
  v54 = v14;
  v57 = (id)objc_opt_new();
  v55 = v13;
  obj = (id)objc_opt_new();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v65;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v65 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1D8232A5C]();
        v63 = xmmword_1D21D9FD0;
        -[TRISQLiteCKDatabase _parseIndexedFieldKey:indexRange:](self, "_parseIndexedFieldKey:indexRange:", v20, &v63);
        v22 = objc_claimAutoreleasedReturnValue();
        if (!v22)
        {
          v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Can't parse indexed field key: %@"), v20);
          -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = *a7;
          *a7 = v40;

          objc_autoreleasePoolPop(v21);
          v38 = 0;
          v14 = v54;
          v13 = v55;
          goto LABEL_30;
        }
        v23 = (void *)v22;
        v24 = v63;
        objc_msgSend(v58, "objectForKeyedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v25)
            objc_msgSend(obj, "addObject:", v23);
        }
        else if (v25)
        {
          objc_msgSend(v57, "objectForKeyedSubscript:", v23);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
            v28 = v26;
          else
            v28 = (id)objc_opt_new();
          v29 = v28;

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v63);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v30);

          objc_msgSend(v57, "setObject:forKeyedSubscript:", v29, v23);
        }

        objc_autoreleasePoolPop(v21);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v17)
        continue;
      break;
    }
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v31 = obj;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  v14 = v54;
  v13 = v55;
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v60;
    while (2)
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v60 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
        objc_msgSend(v57, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("desiredKeys specifies field key %@ simultaneously in both indexed and unindexed form."), v36);
          -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v42);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = *v53;
          *v53 = (id)v43;

          v38 = 0;
          goto LABEL_30;
        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      if (v33)
        continue;
      break;
    }
  }

  objc_storeStrong(location, obj);
  objc_storeStrong(v52, v57);
  v38 = 1;
LABEL_30:

LABEL_35:
  return v38;
}

- (id)_createRecordFromSelectRow:(id)a3 recordType:(id)a4 unindexedDesiredKeys:(id)a5 indexedDesiredKeys:(id)a6 txn:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  const char *v32;
  void *v33;
  objc_class *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t i;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  const char *v55;
  id v56;
  id v57;
  id v58;
  int v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  id v88;
  id v89;
  void *v90;
  id obj;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  id v95;
  TRISQLiteCKDatabase *v97;
  void *v98;
  id v99;
  void *v100;
  void *context;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v95 = a7;
  v97 = self;
  v98 = v14;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v14);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v100)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 492, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

  }
  v90 = v16;
  objc_msgSend(v13, "getNSStringForColumnName:table:", "trisql_recordId", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 496, CFSTR("NULL read from NOT NULL column \"trisql_recordId\"));

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95070]), "initWithRecordName:", v17);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:recordID:", v14, v18);
  objc_msgSend(v13, "getDoubleForColumnName:table:", "modificationDate", 0);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v20);
  objc_msgSend(v19, "setModificationDate:", v21);

  objc_msgSend(v13, "getDoubleForColumnName:table:", "creationDate", 0);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v22);
  objc_msgSend(v19, "setCreationDate:", v23);

  v24 = v90;
  objc_msgSend(v90, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v27 = v26;
  v103 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
  if (!v103)
    goto LABEL_60;
  v102 = *(_QWORD *)v109;
  v89 = v15;
  v99 = v27;
  do
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v109 != v102)
        objc_enumerationMutation(v27);
      v29 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v28);
      v30 = (void *)MEMORY[0x1D8232A5C]();
      v31 = objc_retainAutorelease(v29);
      v32 = (const char *)objc_msgSend(v31, "UTF8String");
      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, v97, CFSTR("TRISQLiteCKDatabase.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("columnName"));

      }
      if ((objc_msgSend(v13, "isNullForColumnName:table:", v32, 0) & 1) == 0)
      {
        objc_msgSend(v100, "objectForKeyedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (objc_class *)objc_msgSend(v33, "firstObject");

        if (!v34)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, v97, CFSTR("TRISQLiteCKDatabase.m"), 519, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));

        }
        context = v30;
        if (v34 == (objc_class *)objc_opt_class())
        {
          objc_msgSend(v13, "getNSStringForColumnName:table:", v32, 0);
          v51 = objc_claimAutoreleasedReturnValue();
        }
        else if (v34 == (objc_class *)objc_opt_class())
        {
          v52 = objc_retainAutorelease(v13);
          if (sqlite3_column_count((sqlite3_stmt *)objc_msgSend(v52, "stmt")) < 1)
          {
            v53 = 0;
          }
          else
          {
            v53 = 0;
            do
            {
              v54 = objc_retainAutorelease(v52);
              v55 = sqlite3_column_name((sqlite3_stmt *)objc_msgSend(v54, "stmt"), v53);
              if (v55 && !strcmp(v55, v32))
                break;
              v53 = (v53 + 1);
            }
            while ((int)v53 < sqlite3_column_count((sqlite3_stmt *)objc_msgSend(objc_retainAutorelease(v54), "stmt")));
          }
          v57 = objc_retainAutorelease(v52);
          if ((int)v53 >= sqlite3_column_count((sqlite3_stmt *)objc_msgSend(v57, "stmt")))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, v97, CFSTR("TRISQLiteCKDatabase.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paramIndex >= 0 && paramIndex < sqlite3_column_count(row.stmt)"));

          }
          v58 = objc_retainAutorelease(v57);
          v59 = sqlite3_column_type((sqlite3_stmt *)objc_msgSend(v58, "stmt"), v53);
          v60 = objc_alloc(MEMORY[0x1E0CB37E8]);
          if (v59 == 2)
          {
            objc_msgSend(v58, "getDoubleForColumn:", v53);
            v51 = objc_msgSend(v60, "initWithDouble:");
          }
          else
          {
            v51 = objc_msgSend(v60, "initWithLongLong:", objc_msgSend(v58, "getInt64ForColumn:", v53));
          }
        }
        else if (v34 == (objc_class *)objc_opt_class())
        {
          v56 = objc_alloc(MEMORY[0x1E0C99D68]);
          objc_msgSend(v13, "getDoubleForColumnName:table:", v32, 0);
          v51 = objc_msgSend(v56, "initWithTimeIntervalSinceReferenceDate:");
        }
        else
        {
          if (v34 != (objc_class *)objc_opt_class())
          {
            if (v34 == (objc_class *)objc_opt_class())
            {
              objc_msgSend(v13, "getNSStringForColumnName:table:", v32, 0);
              v61 = objc_claimAutoreleasedReturnValue();
              if (!v61)
              {
                v81 = objc_alloc(MEMORY[0x1E0CB3940]);
                objc_msgSend(v19, "recordID");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "recordName");
                obj = (id)objc_claimAutoreleasedReturnValue();
                v82 = (void *)objc_msgSend(v81, "initWithFormat:", CFSTR("CKAsset column on record %@ has empty file path."), obj);
                -[TRISQLiteCKDatabase _errorWithCode:message:](v97, "_errorWithCode:message:", 1, v82);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = *a8;
                *a8 = v83;

                goto LABEL_63;
              }
              v38 = (void *)v61;
              objc_msgSend(v19, "recordID");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[TRISQLiteCKDatabase _assetForLocallyStoredAssetWithFilename:forRecordId:error:](v97, "_assetForLocallyStoredAssetWithFilename:forRecordId:error:", v38, v62, a8);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = v99;
              if (!v63)
                goto LABEL_64;
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v63, v31);

            }
            else
            {
              if (v34 != (objc_class *)objc_opt_class())
              {
                v78 = objc_alloc(MEMORY[0x1E0CB3940]);
                NSStringFromClass(v34);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                obj = (id)objc_msgSend(v78, "initWithFormat:", CFSTR("loading of scalar fields with type %@ is not implemented."), v38);
                -[TRISQLiteCKDatabase _errorWithCode:message:](v97, "_errorWithCode:message:", 1);
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = *a8;
                *a8 = v79;

LABEL_63:
                v27 = v99;

LABEL_64:
                objc_autoreleasePoolPop(context);

                v70 = 0;
                goto LABEL_65;
              }
              v35 = objc_msgSend(v13, "getInt64ForColumnName:table:", v32, 0);
              v36 = v35 & ~(v35 >> 63);
              objc_msgSend(v24, "objectForKeyedSubscript:", v31);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37;
              if (v37)
              {
                v106 = 0u;
                v107 = 0u;
                v104 = 0u;
                v105 = 0u;
                obj = v37;
                v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
                if (v93)
                {
                  v94 = v36;
                  v92 = *(_QWORD *)v105;
                  v88 = v13;
                  while (2)
                  {
                    for (i = 0; i != v93; ++i)
                    {
                      if (*(_QWORD *)v105 != v92)
                        objc_enumerationMutation(obj);
                      v40 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
                      v41 = (void *)MEMORY[0x1D8232A5C]();
                      v42 = objc_msgSend(v40, "rangeValue");
                      v44 = v42 + v43;
                      if (v42 + v43 > v94)
                      {
                        v71 = objc_alloc(MEMORY[0x1E0CB3940]);
                        objc_msgSend(v19, "recordID");
                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v72, "recordName");
                        v47 = v19;
                        v73 = (void *)objc_claimAutoreleasedReturnValue();
                        v74 = (void *)objc_msgSend(v71, "initWithFormat:", CFSTR("desiredKeys specifies range max %tu in array field %@[%@] for record %@, which exceeds maximum array count %tu."), v44, v98, v31, v73, v94);
                        -[TRISQLiteCKDatabase _errorWithCode:message:](v97, "_errorWithCode:message:", 12, v74);
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        v76 = *a8;
                        *a8 = v75;

LABEL_62:
                        objc_autoreleasePoolPop(v41);
                        v13 = v88;
                        v24 = v90;
                        v19 = v47;
                        v15 = v89;
                        goto LABEL_63;
                      }
                      v45 = v42;
                      v46 = v43;
                      objc_msgSend(v19, "recordID");
                      v47 = v19;
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TRISQLiteCKDatabase _loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:](v97, "_loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:", v98, v48, v31, v45, v46, v95, a8);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v49)
                        goto LABEL_62;
                      objc_msgSend(MEMORY[0x1E0C95048], "keyForListField:withIndexRange:", v31, v45, v46);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "setObject:forKeyedSubscript:", v49, v50);

                      objc_autoreleasePoolPop(v41);
                      v19 = v47;
                    }
                    v13 = v88;
                    v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v112, 16);
                    if (v93)
                      continue;
                    break;
                  }
                  v15 = v89;
                  v24 = v90;
                }
                else
                {
                  v15 = v89;
                }
                v27 = v99;
                v65 = obj;
              }
              else
              {
                objc_msgSend(v19, "recordID");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                -[TRISQLiteCKDatabase _loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:](v97, "_loadArrayForRecordType:recordId:fieldKey:indexRange:txn:error:", v98, v64, v31, 0, v36, v95, a8);
                v65 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v65)
                {
                  v27 = v99;
                  goto LABEL_64;
                }
                objc_msgSend(v19, "setObject:forKeyedSubscript:", v65, v31);
                v27 = v99;
              }

            }
            goto LABEL_48;
          }
          objc_msgSend(v13, "getNSDataForColumnName:table:", v32, 0);
          v51 = objc_claimAutoreleasedReturnValue();
        }
        v38 = (void *)v51;
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v51, v31);
        v27 = v99;
LABEL_48:

        v30 = context;
      }
      objc_autoreleasePoolPop(v30);
      ++v28;
    }
    while (v28 != v103);
    v69 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    v103 = v69;
  }
  while (v69);
LABEL_60:

  v70 = v19;
LABEL_65:

  return v70;
}

- (id)_loadArrayForRecordType:(id)a3 recordId:(id)a4 fieldKey:(id)a5 indexRange:(_NSRange)a6 txn:(id)a7 error:(id *)a8
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  unint64_t v30;
  char **__ptr32 *v31;
  SEL v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  SEL v50;
  uint64_t v51;
  NSUInteger v52;
  NSUInteger v53;
  TRISQLiteCKDatabase *v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(_QWORD *, void *);
  void *v62;
  id v63;
  NSUInteger v64;
  NSUInteger v65;
  _QWORD v66[5];
  id v67;
  SEL v68;
  _QWORD v69[5];
  id v70;
  SEL v71;
  _QWORD v72[5];
  id v73;
  SEL v74;

  length = a6.length;
  location = a6.location;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  if (length)
  {
    v53 = location;
    v55 = v18;
    -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 628, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

    }
    objc_msgSend(v19, "objectForKeyedSubscript:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v20, "count") < 2
      || (v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", 0), v21 != objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolvedType.count >= 2 && resolvedType[0] == [NSArray class]"));

    }
    v22 = objc_msgSend(v20, "objectAtIndexedSubscript:", 1);

    v23 = (void *)objc_opt_new();
    v24 = objc_opt_class();
    v25 = MEMORY[0x1E0C809B0];
    v56 = v16;
    v54 = self;
    v51 = v22;
    v52 = length;
    if (v22 == v24 || v22 == objc_opt_class())
    {
      v32 = a2;
      v26 = v17;
      v27 = v15;
      v72[0] = v25;
      v31 = &off_1D21D9000;
      v72[1] = 3221225472;
      v72[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke;
      v72[3] = &unk_1E932F9F8;
      v74 = v32;
      v72[4] = self;
      v73 = v23;
      v29 = (void *)MEMORY[0x1D8232C48](v72);
      v33 = v73;
    }
    else
    {
      v50 = a2;
      v26 = v17;
      v27 = v15;
      if (v22 == objc_opt_class())
      {
        v69[0] = v25;
        v31 = &off_1D21D9000;
        v69[1] = 3221225472;
        v69[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_2;
        v69[3] = &unk_1E932F9F8;
        v71 = v50;
        v69[4] = self;
        v70 = v23;
        v29 = (void *)MEMORY[0x1D8232C48](v69);
        v33 = v70;
      }
      else
      {
        if (v22 != objc_opt_class())
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v50, self, CFSTR("TRISQLiteCKDatabase.m"), 662, CFSTR("Loading arrays of type %@ is unsupported."), v22);

          v29 = 0;
          v30 = 0x1E0CB3000;
          v31 = &off_1D21D9000;
          goto LABEL_13;
        }
        v66[0] = v25;
        v31 = &off_1D21D9000;
        v66[1] = 3221225472;
        v66[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_3;
        v66[3] = &unk_1E932F9F8;
        v68 = v50;
        v66[4] = self;
        v67 = v23;
        v29 = (void *)MEMORY[0x1D8232C48](v66);
        v33 = v67;
      }
    }

    v30 = 0x1E0CB3000uLL;
LABEL_13:
    v15 = v27;
    v34 = (void *)objc_msgSend(objc_alloc(*(Class *)(v30 + 2368)), "initWithFormat:", CFSTR(" SELECT value FROM     %@_%@ WHERE         recordId = :record_id     AND idx >= :lower     AND idx < :upper ORDER BY idx ASC;"),
                    v27,
                    v26);
    objc_msgSend(v55, "db");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v25;
    v60 = *((_QWORD *)v31 + 490);
    v61 = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_4;
    v62 = &unk_1E932FA20;
    v36 = v56;
    v63 = v36;
    v64 = v53;
    v65 = v52;
    v57[0] = v25;
    v57[1] = v60;
    v57[2] = __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_5;
    v57[3] = &unk_1E932FA48;
    v37 = v29;
    v58 = v37;
    objc_msgSend(v35, "prepAndRunQuery:onPrep:onRow:onError:", v34, &v59, v57, 0);

    if (objc_msgSend(v23, "count") == v52)
    {
      if (v51 == objc_opt_class())
      {
        v17 = v26;
        if (objc_msgSend(v23, "count"))
        {
          v45 = 0;
          while (1)
          {
            objc_msgSend(v23, "objectAtIndexedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            -[TRISQLiteCKDatabase _assetForLocallyStoredAssetWithFilename:forRecordId:error:](v54, "_assetForLocallyStoredAssetWithFilename:forRecordId:error:", v46, v36, a8);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v47)
              break;
            objc_msgSend(v23, "setObject:atIndexedSubscript:", v47, v45);

            if (++v45 >= (unint64_t)objc_msgSend(v23, "count"))
              goto LABEL_25;
          }
          v38 = 0;
        }
        else
        {
LABEL_25:
          v38 = v23;
        }
        goto LABEL_19;
      }
      v38 = v23;
    }
    else
    {
      v39 = objc_alloc(*(Class *)(v30 + 2368));
      objc_msgSend(v36, "recordName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("Retrieval from array field %@[%@] on record %@ geerated wrong item count (exp %tu, act %tu)."), v15, v26, v40, v52, objc_msgSend(v23, "count"));
      -[TRISQLiteCKDatabase _errorWithCode:message:](v54, "_errorWithCode:message:", 1, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *a8;
      *a8 = v42;

      v38 = 0;
    }
    v17 = v26;
LABEL_19:

    v18 = v55;
    v16 = v56;
    goto LABEL_20;
  }
  v38 = (id)MEMORY[0x1E0C9AA60];
LABEL_20:

  return v38;
}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "getNSStringForColumnName:table:", "value", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRISQLiteCKDatabase.m"), 639, CFSTR("NULL loaded from NOT NULL column for array value"));

    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_2(_QWORD *a1, void *a2)
{
  int v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = objc_retainAutorelease(a2);
  v3 = sqlite3_column_type((sqlite3_stmt *)objc_msgSend(v10, "stmt"), 0);
  if (v3 == 2)
  {
    v4 = (void *)a1[5];
    v6 = objc_alloc(MEMORY[0x1E0CB37E8]);
    objc_msgSend(v10, "getDoubleForColumn:", 0);
    v5 = objc_msgSend(v6, "initWithDouble:");
  }
  else
  {
    if (v3 != 1)
    {
      if (v3 == 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRISQLiteCKDatabase.m"), 647, CFSTR("NULL loaded from NOT NULL array value column"));

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRISQLiteCKDatabase.m"), 651, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actType == SQLITE_INTEGER"));

    }
    v4 = (void *)a1[5];
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v10, "getInt64ForColumn:", 0));
  }
  v7 = (void *)v5;
  objc_msgSend(v4, "addObject:", v5);

}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "getNSDataForColumnName:table:", "value", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRISQLiteCKDatabase.m"), 658, CFSTR("NULL loaded from NOT NULL column for array value"));

    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = (void *)a1[4];
  v8 = a2;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bindNamedParam:toNSString:", ":record_id", v4);

  if (a1[5] >= 0x7FFFFFFFFFFFFFFFuLL)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = a1[5];
  objc_msgSend(v8, "bindNamedParam:toInt64:", ":lower", v5);
  v6 = a1[6];
  if ((unint64_t)(v6 + a1[5]) >= 0x7FFFFFFFFFFFFFFFLL)
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v7 = v6 + a1[5];
  objc_msgSend(v8, "bindNamedParam:toInt64:", ":upper", v7);

}

uint64_t __86__TRISQLiteCKDatabase__loadArrayForRecordType_recordId_fieldKey_indexRange_txn_error___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return *MEMORY[0x1E0D81780];
}

- (id)_parseIndexedFieldKey:(id)a3 indexRange:(_NSRange *)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v24;
  unint64_t v25;
  NSUInteger v26;
  _QWORD block[6];

  v7 = a3;
  *a4 = (_NSRange)xmmword_1D21D9FD0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__TRISQLiteCKDatabase__parseIndexedFieldKey_indexRange___block_invoke;
  block[3] = &unk_1E932FA70;
  block[4] = self;
  block[5] = a2;
  if (qword_1EFC74128 != -1)
    dispatch_once(&qword_1EFC74128, block);
  v8 = (id)_MergedGlobals_31;
  objc_msgSend(v8, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
    v21 = v7;
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v9, "numberOfRanges") <= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 732, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("match.numberOfRanges >= 4"));

  }
  v25 = 0;
  v26 = 0;
  v11 = objc_msgSend(v10, "rangeAtIndex:", 2);
  objc_msgSend(v7, "substringWithRange:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[TRISQLiteCKDatabase _parseDecimalString:value:](self, "_parseDecimalString:value:", v13, &v26))
  {

LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  v14 = objc_msgSend(v10, "rangeAtIndex:", 3);
  objc_msgSend(v7, "substringWithRange:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TRISQLiteCKDatabase _parseDecimalString:value:](self, "_parseDecimalString:value:", v16, &v25);

  if (!v17)
    goto LABEL_13;
  v18 = v25 - v26;
  if (v25 <= v26)
    goto LABEL_13;
  a4->location = v26;
  a4->length = v18;
  v19 = objc_msgSend(v10, "rangeAtIndex:", 1);
  objc_msgSend(v7, "substringWithRange:", v19, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v22 = v21;
LABEL_14:

  return v22;
}

void __56__TRISQLiteCKDatabase__parseIndexedFieldKey_indexRange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1D8232A5C]();
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^([^\\[]+)\\[([0-9]+)\\.\\.<([0-9]+)\\]$"), 0, &v7);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("TRISQLiteCKDatabase.m"), 721, CFSTR("Failed to create regex: %@"), v4);

  }
  v5 = (void *)_MergedGlobals_31;
  _MergedGlobals_31 = v3;

  objc_autoreleasePoolPop(v2);
}

- (BOOL)_parseDecimalString:(id)a3 value:(unint64_t *)a4
{
  int v5;
  unint64_t v7;

  v7 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toU64:", a3, 10, &v7);
  if (v5)
    *a4 = v7;
  return v5;
}

- (BOOL)_translatePredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  int v17;
  id v18;
  __CFString *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v12 = a3;
  v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = -[TRISQLiteCKDatabase _translateCompoundPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateCompoundPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
LABEL_5:
    v15 = v14;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = -[TRISQLiteCKDatabase _translateComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "isEqual:", v16);

  if (v17)
  {
    v18 = *a5;
    v19 = CFSTR("1");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v12, "isEqual:", v20);

    if (!v21)
    {
      v23 = objc_alloc(MEMORY[0x1E0CB3940]);
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Unable to translate predicate of unsupported type: %@"), v25);
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *a7;
      *a7 = v27;

      v15 = 0;
      goto LABEL_12;
    }
    v18 = *a5;
    v19 = CFSTR("0");
  }
  *a5 = v19;

  v22 = *a6;
  *a6 = (id)MEMORY[0x1E0C9AA60];

  v15 = 1;
LABEL_12:

  return v15;
}

- (BOOL)_translateCompoundPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  id v31;
  id v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  __CFString *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v52;
  SEL v53;
  id *v54;
  id *v55;
  void *v56;
  id v57;
  id v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v57 = a4;
  v14 = objc_msgSend(v13, "compoundPredicateType");
  if ((unint64_t)(v14 - 1) >= 2)
  {
    if (v14)
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unrecognized compound predicate type: %tu"), objc_msgSend(v13, "compoundPredicateType"));
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = *a7;
      *a7 = v42;

    }
    else
    {
      objc_msgSend(v13, "subpredicates");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35 == 1)
      {
        v63 = 0;
        objc_msgSend(v13, "subpredicates");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[TRISQLiteCKDatabase _translatePredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translatePredicate:forRecordType:toSQLExpr:paramBindings:error:", v37, v57, &v63, a6, a7);

        if (v33)
        {
          if (!v63)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subSQLExpr"));

          }
          v38 = objc_alloc(MEMORY[0x1E0CB3940]);
          v39 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("NOT (%@)"), v63);
          v40 = *a5;
          *a5 = v39;

        }
        goto LABEL_35;
      }
      v46 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v13, "subpredicates");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (void *)objc_msgSend(v46, "initWithFormat:", CFSTR("NOT predicate contains %tu subpredicates where exactly one was expected."), objc_msgSend(v47, "count"));
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = *a7;
      *a7 = v49;

    }
    LOBYTE(v33) = 0;
    goto LABEL_35;
  }
  objc_msgSend(v13, "subpredicates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v53 = a2;
    v54 = a6;
    v55 = a5;
    v17 = (void *)objc_opt_new();
    v18 = (void *)objc_opt_new();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v56 = v13;
    objc_msgSend(v13, "subpredicates");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v60;
      while (2)
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v60 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v23);
          v63 = 0;
          v58 = 0;
          if (!-[TRISQLiteCKDatabase _translatePredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translatePredicate:forRecordType:toSQLExpr:paramBindings:error:", v24, v57, &v63, &v58, a7))
          {

            LOBYTE(v33) = 0;
            goto LABEL_28;
          }
          if (!v63)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v53, self, CFSTR("TRISQLiteCKDatabase.m"), 848, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subSQLExpr"));

          }
          if (!v58)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", v53, self, CFSTR("TRISQLiteCKDatabase.m"), 849, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subBindings"));

          }
          v25 = objc_alloc(MEMORY[0x1E0CB3940]);
          v26 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("(%@)"), v63);
          objc_msgSend(v17, "addObject:", v26);

          objc_msgSend(v18, "addObjectsFromArray:", v58);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
        if (v21)
          continue;
        break;
      }
    }

    if (objc_msgSend(v56, "compoundPredicateType") == 1)
      v29 = CFSTR(" AND ");
    else
      v29 = CFSTR(" OR ");
    objc_msgSend(v17, "componentsJoinedByString:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *v55;
    *v55 = (id)v30;

    v32 = v18;
    v19 = *v54;
    *v54 = v32;
    LOBYTE(v33) = 1;
LABEL_28:

    v13 = v56;
  }
  else
  {
    if (objc_msgSend(v13, "compoundPredicateType") == 1)
      v44 = CFSTR("1");
    else
      v44 = CFSTR("0");
    objc_storeStrong(a5, v44);
    v45 = *a6;
    *a6 = (id)MEMORY[0x1E0C9AA60];

    LOBYTE(v33) = 1;
  }
LABEL_35:

  return v33;
}

- (BOOL)_translateComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  void *v18;
  void *v19;
  id v20;

  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v12, "predicateOperatorType");
  if (v14 >= 6)
  {
    if (v14 != 10)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported comparison predicate: %tu"), objc_msgSend(v12, "predicateOperatorType"));
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *a7;
      *a7 = v19;

      v16 = 0;
      goto LABEL_4;
    }
    v15 = -[TRISQLiteCKDatabase _translateArrayRHSComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateArrayRHSComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
  }
  else
  {
    v15 = -[TRISQLiteCKDatabase _translateScalarComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateScalarComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
  }
  v16 = v15;
LABEL_4:

  return v16;
}

- (BOOL)_translateScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;

  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v12, "comparisonPredicateModifier");
  if (v14 == 2)
  {
    v15 = -[TRISQLiteCKDatabase _translateAnyModifiedScalarComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateAnyModifiedScalarComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
  }
  else
  {
    if (v14)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported comparison predicate modifier: %tu"), objc_msgSend(v12, "comparisonPredicateModifier"));
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a7;
      *a7 = v18;

      v16 = 0;
      goto LABEL_7;
    }
    v15 = -[TRISQLiteCKDatabase _translateDirectModifiedScalarComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateDirectModifiedScalarComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
  }
  v16 = v15;
LABEL_7:

  return v16;
}

- (BOOL)_parseScalarExpression:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  __CFString *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  __CFString *v38;
  id v39;
  id *v40;
  void *v41;
  void **v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  objc_class *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  _QWORD v58[4];
  __CFString *v59;
  _QWORD v60[4];
  __CFString *v61;
  _QWORD v62[4];
  __CFString *v63;
  _QWORD v64[4];
  __CFString *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 939, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

  }
  if (objc_msgSend(v13, "expressionType") == 3)
  {
    objc_msgSend(v13, "keyPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0DC0E00]) & 1) != 0)
    {
      v17 = CFSTR("modificationDate");
    }
    else
    {
      objc_msgSend(v13, "keyPath");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v15, "objectForKeyedSubscript:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = objc_msgSend(v22, "firstObject");
      if (v24 != objc_opt_class())
      {
        objc_storeStrong(a5, v17);
        v25 = *a6;
        *a6 = (id)MEMORY[0x1E0C9AA60];
        v21 = 1;
LABEL_19:

        goto LABEL_20;
      }
      v33 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v13, "keyPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v33, "initWithFormat:", CFSTR("Field with key %@ is array-typed but is used in an expression where a scalar was expected."), v25, v57);
    }
    else
    {
      v31 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v13, "keyPath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "initWithFormat:", CFSTR("Unrecognized field key %@ on record type %@."), v25, v14);
    }
    v34 = (void *)v32;
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *a7;
    *a7 = v35;

    v21 = 0;
    goto LABEL_19;
  }
  if (!objc_msgSend(v13, "expressionType"))
  {
    objc_msgSend(v13, "constantValue");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = *a5;
      *a5 = CFSTR("?");

      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke;
      v64[3] = &unk_1E932FA98;
      v65 = v17;
      v27 = (void *)MEMORY[0x1D8232C48](v64);
      v69[0] = v27;
      v21 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *a6;
      *a6 = v28;

      v30 = v65;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v17;
        v39 = *a5;
        *a5 = CFSTR("?");

        if (CFNumberIsFloatType((CFNumberRef)v38))
        {
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_2;
          v62[3] = &unk_1E932FA98;
          v40 = (id *)&v63;
          v63 = v38;
          v41 = (void *)MEMORY[0x1D8232C48](v62);
          v68 = v41;
          v42 = &v68;
        }
        else
        {
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_3;
          v60[3] = &unk_1E932FA98;
          v40 = (id *)&v61;
          v61 = v38;
          v41 = (void *)MEMORY[0x1D8232C48](v60);
          v67 = v41;
          v42 = &v67;
        }
        v21 = 1;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = *a6;
        *a6 = v53;

        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v47 = objc_alloc(MEMORY[0x1E0CB3940]);
        v48 = (objc_class *)objc_opt_class();
        NSStringFromClass(v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("Constant-valued expression of class %@ is not supported in context where a scalar expression is expected."), v49);
        -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = *a7;
        *a7 = v51;

        v21 = 0;
        goto LABEL_20;
      }
      v43 = *a5;
      *a5 = CFSTR("?");

      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_4;
      v58[3] = &unk_1E932FA98;
      v59 = v17;
      v44 = (void *)MEMORY[0x1D8232C48](v58);
      v66 = v44;
      v21 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = *a6;
      *a6 = v45;

      v30 = v59;
    }

LABEL_20:
    goto LABEL_21;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Expression of type %tu is not supported in context where a scalar expression is expected."), objc_msgSend(v13, "expressionType"));
  -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *a7;
  *a7 = v19;

  v21 = 0;
LABEL_21:

  return v21;
}

uint64_t __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "bindParam:toNSString:", a3, *(_QWORD *)(a1 + 32));
}

void __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "bindParam:toDouble:", a3);

}

void __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindParam:toInt64:", a3, objc_msgSend(v4, "longLongValue"));

}

void __90__TRISQLiteCKDatabase__parseScalarExpression_forRecordType_toSQLExpr_paramBindings_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "bindParam:toDouble:", a3);

}

- (BOOL)_translateDirectModifiedScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;

  v13 = a3;
  v14 = a4;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

  }
  v39 = 0;
  v40 = 0;
  objc_msgSend(v13, "leftExpression");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[TRISQLiteCKDatabase _parseScalarExpression:forRecordType:toSQLExpr:paramBindings:error:](self, "_parseScalarExpression:forRecordType:toSQLExpr:paramBindings:error:", v16, v14, &v40, &v39, a7);

  if (v17)
  {
    if (!v40)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1030, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leftSQL"));

    }
    if (!v39)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1031, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leftParamBindings"));

    }
    v37 = 0;
    v38 = 0;
    objc_msgSend(v13, "rightExpression");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[TRISQLiteCKDatabase _parseScalarExpression:forRecordType:toSQLExpr:paramBindings:error:](self, "_parseScalarExpression:forRecordType:toSQLExpr:paramBindings:error:", v18, v14, &v38, &v37, a7);

    if (v19)
    {
      if (!v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1042, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rightSQL"));

      }
      if (!v37)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rightParamBindings"));

      }
      objc_msgSend(v39, "arrayByAddingObjectsFromArray:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *a6;
      *a6 = v20;

      switch(objc_msgSend(v13, "predicateOperatorType"))
      {
        case 0:
          v22 = objc_alloc(MEMORY[0x1E0CB3940]);
          v23 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@ < %@"), v40, v38);
          goto LABEL_23;
        case 1:
          v26 = objc_alloc(MEMORY[0x1E0CB3940]);
          v23 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("%@ <= %@"), v40, v38);
          goto LABEL_23;
        case 2:
          v27 = objc_alloc(MEMORY[0x1E0CB3940]);
          v23 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("%@ > %@"), v40, v38);
          goto LABEL_23;
        case 3:
          v28 = objc_alloc(MEMORY[0x1E0CB3940]);
          v23 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@ >= %@"), v40, v38);
          goto LABEL_23;
        case 4:
          v29 = objc_alloc(MEMORY[0x1E0CB3940]);
          v23 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("%@ = %@"), v40, v38);
          goto LABEL_23;
        case 5:
          v30 = objc_alloc(MEMORY[0x1E0CB3940]);
          v23 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("%@ != %@"), v40, v38);
LABEL_23:
          v25 = *a5;
          *a5 = v23;
          v24 = 1;
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1072, CFSTR("Unexpected scalar comparison predicate operator: %tu"), objc_msgSend(v13, "predicateOperatorType"));
          v24 = 0;
          break;
      }

    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)_translateAnyModifiedScalarComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  void *v8;
  id v9;

  -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, CFSTR("Use of ANY is only supported in conjunction with predicate operator IN."), a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *a7;
  *a7 = v8;

  return 0;
}

- (BOOL)_translateArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;

  v12 = a3;
  v13 = a4;
  v14 = objc_msgSend(v12, "comparisonPredicateModifier");
  if (v14 == 2)
  {
    v15 = -[TRISQLiteCKDatabase _translateAnyModifiedArrayRHSComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateAnyModifiedArrayRHSComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
  }
  else
  {
    if (v14)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported comparison predicate modifier: %tu"), objc_msgSend(v12, "comparisonPredicateModifier"));
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a7;
      *a7 = v18;

      v16 = 0;
      goto LABEL_7;
    }
    v15 = -[TRISQLiteCKDatabase _translateDirectModifiedArrayRHSComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:](self, "_translateDirectModifiedArrayRHSComparisonPredicate:forRecordType:toSQLExpr:paramBindings:error:", v12, v13, a5, a6, a7);
  }
  v16 = v15;
LABEL_7:

  return v16;
}

- (BOOL)_translateDirectModifiedArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v13 = a3;
  v14 = a4;
  if (objc_msgSend(v13, "predicateOperatorType") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1134, CFSTR("Expected IN operator, found %tu"), objc_msgSend(v13, "predicateOperatorType"));

  }
  v32 = 0;
  v33 = 0;
  objc_msgSend(v13, "leftExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TRISQLiteCKDatabase _parseScalarExpression:forRecordType:toSQLExpr:paramBindings:error:](self, "_parseScalarExpression:forRecordType:toSQLExpr:paramBindings:error:", v15, v14, &v33, &v32, a7);

  if (v16)
  {
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leftSQL"));

    }
    if (!v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leftParamBindings"));

    }
    v30 = 0;
    v31 = 0;
    objc_msgSend(v13, "rightExpression");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRISQLiteCKDatabase _parseArrayExpression:forRecordType:usingCTEName:toSQLCommonTableExpression:paramBindings:error:](self, "_parseArrayExpression:forRecordType:usingCTEName:toSQLCommonTableExpression:paramBindings:error:", v17, v14, CFSTR("trisql_cte_rhs"), &v31, &v30, a7);

    if (v18)
    {
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rhsWithClause"));

      }
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rhsWithClauseBindings"));

      }
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      v20 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@ IN (WITH %@ SELECT value FROM %@)"), v33, v31, CFSTR("trisql_cte_rhs"));
      v21 = *a5;
      *a5 = v20;

      objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *a6;
      *a6 = v22;

    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)_translateAnyModifiedArrayRHSComparisonPredicate:(id)a3 forRecordType:(id)a4 toSQLExpr:(id *)a5 paramBindings:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v13 = a3;
  v14 = a4;
  if (objc_msgSend(v13, "predicateOperatorType") != 10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1178, CFSTR("Expected IN operator, found %tu"), objc_msgSend(v13, "predicateOperatorType"));

  }
  v32 = 0;
  v33 = 0;
  objc_msgSend(v13, "leftExpression");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TRISQLiteCKDatabase _parseArrayExpression:forRecordType:usingCTEName:toSQLCommonTableExpression:paramBindings:error:](self, "_parseArrayExpression:forRecordType:usingCTEName:toSQLCommonTableExpression:paramBindings:error:", v15, v14, CFSTR("trisql_cte_lhs"), &v33, &v32, a7);

  if (v16)
  {
    if (!v33)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lhsWithClause"));

    }
    if (!v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lhsWithClauseBindings"));

    }
    v30 = 0;
    v31 = 0;
    objc_msgSend(v13, "rightExpression");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRISQLiteCKDatabase _parseArrayExpression:forRecordType:usingCTEName:toSQLCommonTableExpression:paramBindings:error:](self, "_parseArrayExpression:forRecordType:usingCTEName:toSQLCommonTableExpression:paramBindings:error:", v17, v14, CFSTR("trisql_cte_rhs"), &v31, &v30, a7);

    if (v18)
    {
      if (!v31)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rhsWithClause"));

      }
      if (!v30)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rhsWithClauseBindings"));

      }
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      v20 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("EXISTS (WITH %@, %@ SELECT 1 FROM %@ WHERE value IN %@ LIMIT 1)"), v33, v31, CFSTR("trisql_cte_lhs"), CFSTR("trisql_cte_rhs"));
      v21 = *a5;
      *a5 = v20;

      objc_msgSend(v32, "arrayByAddingObjectsFromArray:", v30);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *a6;
      *a6 = v22;

    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (BOOL)_parseArrayExpression:(id)a3 forRecordType:(id)a4 usingCTEName:(id)a5 toSQLCommonTableExpression:(id *)a6 paramBindings:(id *)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  TRISQLiteCKDatabase *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  BOOL v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  const __CFNumber *v49;
  _QWORD *v50;
  const __CFNumber *v51;
  void *v52;
  id v53;
  void **v54;
  unint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  objc_class *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  objc_class *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v80;
  void *v81;
  void *v82;
  id *v83;
  TRISQLiteCKDatabase *v84;
  id v85;
  id v86;
  void *v87;
  id *v88;
  id *v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD v96[5];
  _QWORD v97[5];
  _QWORD v98[5];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v80 = v17;
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

    v17 = v80;
  }
  if (objc_msgSend(v15, "expressionType") == 3)
  {
    v92 = v17;
    objc_msgSend(v15, "keyPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = self;
      v88 = a7;
      v90 = v18;
      v22 = objc_msgSend(v20, "firstObject");
      v23 = objc_opt_class();
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v15, "keyPath");
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v22 == v23)
      {
        v60 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@ (value) AS (SELECT value FROM %@_%@ WHERE recordId = trisql_outer_recordId)"), v92, v16, v25);
        v61 = *a6;
        *a6 = v60;

        v18 = v90;
        v26 = *v88;
        *v88 = (id)MEMORY[0x1E0C9AA60];
        v30 = 1;
      }
      else
      {
        v27 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("Field with key %@ is scalar-valued, but was used in a predicate where an array was expected."), v25);
        -[TRISQLiteCKDatabase _errorWithCode:message:](v21, "_errorWithCode:message:", 12, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *a8;
        *a8 = v28;

        v30 = 0;
        v18 = v90;
      }
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v15, "keyPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("Unrecognized field key %@ on record type %@."), v26, v16);
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = *a8;
      *a8 = v36;

      v30 = 0;
    }

    v17 = v92;
  }
  else if (objc_msgSend(v15, "expressionType"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Comparison predicate with expression of type %tu is not supported."), objc_msgSend(v15, "expressionType"));
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *a8;
    *a8 = v32;

    v30 = 0;
  }
  else
  {
    objc_msgSend(v15, "constantValue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v94 = v17;
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = v94;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v83 = a6;
      v84 = self;
      v89 = a7;
      v91 = v18;
      v85 = v16;
      v93 = v17;
      v86 = v15;
      v87 = v38;
      v39 = v38;
      v40 = (void *)objc_opt_new();
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v41 = v39;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
      v95 = v41;
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v100;
        v45 = MEMORY[0x1E0C809B0];
        while (2)
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v100 != v44)
              objc_enumerationMutation(v41);
            v47 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v98[0] = v45;
              v98[1] = 3221225472;
              v98[2] = __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke;
              v98[3] = &unk_1E932FA98;
              v98[4] = v47;
              v48 = (void *)MEMORY[0x1D8232C48](v98);
              objc_msgSend(v40, "addObject:", v48);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v69 = v41;
                v70 = objc_alloc(MEMORY[0x1E0CB3940]);
                v71 = (objc_class *)objc_opt_class();
                NSStringFromClass(v71);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = (void *)objc_msgSend(v70, "initWithFormat:", CFSTR("An NSArray containing a value of class %@ was used in a predicate which only supports arrays of NSString and NSNumber."), v72);
                -[TRISQLiteCKDatabase _errorWithCode:message:](v84, "_errorWithCode:message:", 12, v73);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = *a8;
                *a8 = v74;

                v30 = 0;
                v76 = v69;
                v16 = v85;
                v17 = v93;
                v38 = v87;
                goto LABEL_38;
              }
              v49 = v47;
              if (CFNumberIsFloatType(v49))
              {
                v97[0] = v45;
                v97[1] = 3221225472;
                v50 = v97;
                v97[2] = __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_2;
              }
              else
              {
                v96[0] = v45;
                v96[1] = 3221225472;
                v50 = v96;
                v96[2] = __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_3;
              }
              v50[3] = &unk_1E932FA98;
              v50[4] = v49;
              v51 = v49;
              v52 = (void *)MEMORY[0x1D8232C48](v50);
              objc_msgSend(v40, "addObject:", v52);

              v41 = v95;
            }
          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
          if (v43)
            continue;
          break;
        }
      }

      if (objc_msgSend(v41, "count"))
      {
        v53 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v41, "count"));
        v54 = v89;
        if (objc_msgSend(v41, "count"))
        {
          v55 = 0;
          do
          {
            objc_msgSend(v53, "addObject:", CFSTR("(?)"));
            ++v55;
          }
          while (v55 < objc_msgSend(v41, "count"));
        }
        v56 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v53, "componentsJoinedByString:", CFSTR(", "));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "initWithFormat:", CFSTR("%@ (value) AS (VALUES %@)"), v93, v57);
        v59 = *v83;
        *v83 = (id)v58;

        v17 = v93;
        v16 = v85;
        v15 = v86;
      }
      else
      {
        v17 = v93;
        v77 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ (value) AS (SELECT 1 WHERE 0)"), v93);
        v53 = *v83;
        *v83 = (id)v77;
        v16 = v85;
        v54 = v89;
      }

      v78 = v40;
      v76 = *v54;
      *v54 = v78;
      v30 = 1;
      v38 = v87;
      v69 = v95;
LABEL_38:

      v18 = v91;
    }
    else
    {
      v62 = v17;
      v63 = objc_alloc(MEMORY[0x1E0CB3940]);
      v64 = (objc_class *)objc_opt_class();
      NSStringFromClass(v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)objc_msgSend(v63, "initWithFormat:", CFSTR("Value of class %@ was used in a predicate where an array type was expected."), v65);
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = *a8;
      *a8 = v67;

      v17 = v62;
      v30 = 0;
    }

  }
  return v30;
}

uint64_t __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "bindParam:toNSString:", a3, *(_QWORD *)(a1 + 32));
}

void __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "bindParam:toDouble:", a3);

}

void __119__TRISQLiteCKDatabase__parseArrayExpression_forRecordType_usingCTEName_toSQLCommonTableExpression_paramBindings_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "bindParam:toInt64:", a3, objc_msgSend(v4, "longLongValue"));

}

- (void)_processFetchRecordsOperation:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _PASSqliteDatabase *db;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD, _QWORD);
  void *v31;
  void *v32;
  void (**v33)(void);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  TRISQLiteCKDatabase *v42;
  uint64_t *v43;
  uint64_t *v44;
  SEL v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__1;
  v56 = __Block_byref_object_dispose__1;
  v57 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__1;
  v50 = __Block_byref_object_dispose__1;
  v51 = 0;
  v35 = a3;
  objc_msgSend(v35, "recordIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v5)
  {
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, CFSTR("CKFetchRecordsOperation with nil recordIDs is not supported."));
    v12 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v47[5];
    v47[5] = v12;
  }
  else
  {
    -[TRISQLiteCKDatabase delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      && (-[TRISQLiteCKDatabase delegate](self, "delegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "shouldProcessFetchOperation:error:", v35, v47 + 5),
          v7,
          v6,
          (v8 & 1) == 0))
    {
      if (v47[5])
        goto LABEL_7;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0D81630];
      db = self->_db;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __53__TRISQLiteCKDatabase__processFetchRecordsOperation___block_invoke;
      v40[3] = &unk_1E932FAC0;
      v41 = v35;
      v42 = self;
      v43 = &v46;
      v44 = &v52;
      v45 = a2;
      objc_msgSend(v9, "readTransactionWithHandle:failableBlock:", db, v40);
      v11 = v41;
    }
  }

LABEL_7:
  objc_msgSend(v35, "perRecordCompletionBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_22;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v35, "recordIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v58, 16);
  if (!v15)
    goto LABEL_21;
  v16 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v37 != v16)
        objc_enumerationMutation(v14);
      v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      v19 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend((id)v53[5], "objectForKeyedSubscript:", v18);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (!v53[5])
      {
        v22 = (void *)v47[5];
        goto LABEL_17;
      }
      if (v20)
      {
        v22 = 0;
LABEL_17:
        v23 = v22;
        goto LABEL_19;
      }
      v24 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v18, "recordName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR("RecordID not found: %@"), v25);
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 11, v26);
      v23 = (id)objc_claimAutoreleasedReturnValue();

LABEL_19:
      objc_msgSend(v35, "perRecordCompletionBlock");
      v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, id))v27)[2](v27, v21, v18, v23);

      objc_autoreleasePoolPop(v19);
    }
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v58, 16);
  }
  while (v15);
LABEL_21:

LABEL_22:
  objc_msgSend(v35, "fetchRecordsCompletionBlock");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v35, "fetchRecordsCompletionBlock");
    v30 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v30[2](v30, v53[5], v47[5]);

    objc_autoreleasePoolPop(v29);
  }
  objc_msgSend(v35, "completionBlock");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v35, "completionBlock");
    v33 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v33[2]();

    objc_autoreleasePoolPop(v32);
  }
  _Block_object_dispose(&v46, 8);

  _Block_object_dispose(&v52, 8);
}

uint64_t __53__TRISQLiteCKDatabase__processFetchRecordsOperation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("TRISQLiteCKDatabase.m"), 1333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operation.recordIDs"));

  }
  v4 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "_allRecordTypes");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x1D8232A5C]();
        v11 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "recordIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "desiredKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_evalFetchRecordsOperationWithRecordIds:recordType:desiredKeys:txn:error:", v12, v9, v13, v19, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v15 = *MEMORY[0x1E0D81680];
          objc_autoreleasePoolPop(v10);

          goto LABEL_13;
        }
        objc_msgSend(v4, "addEntriesFromDictionary:", v14);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v4);
  v15 = *MEMORY[0x1E0D81678];
LABEL_13:

  return v15;
}

- (id)_evalFetchRecordsOperationWithRecordIds:(id)a3 recordType:(id)a4 desiredKeys:(id)a5 txn:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  int v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  id *v40;
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  id v47;
  id v48[2];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueTypes"));

  }
  v47 = 0;
  v48[0] = 0;
  v18 = 0;
  if (-[TRISQLiteCKDatabase _parseDesiredKeys:recordType:unindexedFields:indexedFields:error:](self, "_parseDesiredKeys:recordType:unindexedFields:indexedFields:error:", v15, v14, v48, &v47, a7))
  {
    if (!v48[0])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("unindexedDesiredKeys"));

    }
    if (!v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexedDesiredKeys"));

    }
    if (objc_msgSend(v13, "count"))
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v13, "count");
      _PASQMarksSeparatedByCommas();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR(" SELECT * FROM     %@ WHERE trisql_recordId IN (%@);"),
                      v14,
                      v20);

      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v46 = 1;
      v31 = (void *)objc_opt_new();
      objc_msgSend(v16, "db");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke;
      v41[3] = &unk_1E932F1F0;
      v42 = v13;
      v33[0] = v23;
      v33[1] = 3221225472;
      v33[2] = __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_2;
      v33[3] = &unk_1E932FAE8;
      v33[4] = self;
      v34 = v14;
      v35 = v48[0];
      v36 = v47;
      v37 = v16;
      v39 = &v43;
      v40 = a7;
      v24 = v31;
      v38 = v24;
      v32[0] = v23;
      v32[1] = 3221225472;
      v32[2] = __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_3;
      v32[3] = &__block_descriptor_40_e37___PASDBIterAction__B_16__0__NSError_8l;
      v32[4] = a7;
      v25 = objc_msgSend(v22, "prepAndRunQuery:onPrep:onRow:onError:", v21, v41, v33, v32);

      if (v25)
      {
        if (*((_BYTE *)v44 + 24))
          v26 = v24;
        else
          v26 = 0;
      }
      else
      {
        v26 = 0;
      }
      v18 = v26;

      _Block_object_dispose(&v43, 8);
    }
    else
    {
      v18 = (id)MEMORY[0x1E0C9AA70];
    }
  }

  return v18;
}

void __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      v4 = v3 + 1;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bindParam:toNSString:", v4, v6);

      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v3 = v4;
    }
    while (v7 > v4);
  }

}

uint64_t __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 *v7;

  objc_msgSend(*(id *)(a1 + 32), "_createRecordFromSelectRow:recordType:unindexedDesiredKeys:indexedDesiredKeys:txn:error:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 72);
    objc_msgSend(v3, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

    v7 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
    v7 = (unsigned __int8 *)MEMORY[0x1E0D81788];
  }

  return *v7;
}

uint64_t __96__TRISQLiteCKDatabase__evalFetchRecordsOperationWithRecordIds_recordType_desiredKeys_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong(*(id **)(a1 + 32), a2);
  return *MEMORY[0x1E0D81788];
}

- (void)_processModifyRecordsOperation:(id)a3
{
  id v4;
  void *v5;
  _PASSqliteDatabase *db;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *assetDir;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v34;
  void *v35;
  void *v36;
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void (**v42)(void);
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  TRISQLiteCKDatabase *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__1;
  v63 = __Block_byref_object_dispose__1;
  v64 = 0;
  v5 = (void *)MEMORY[0x1E0D81630];
  db = self->_db;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __54__TRISQLiteCKDatabase__processModifyRecordsOperation___block_invoke;
  v55[3] = &unk_1E932F650;
  v7 = v4;
  v56 = v7;
  v57 = self;
  v58 = &v59;
  objc_msgSend(v5, "writeTransactionWithHandle:failableBlock:", db, v55);
  if (!v60[5])
  {
    objc_msgSend(v7, "recordIDsToDelete");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;

    if (!v9)
    {
      v10 = objc_alloc(MEMORY[0x1E0C99E20]);
      objc_msgSend(v7, "recordIDsToDelete");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithArray:", v11);

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v7, "recordsToSave");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v52;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v52 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v16), "recordID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeObject:", v17);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
        }
        while (v14);
      }

      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v48;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v48 != v20)
              objc_enumerationMutation(v18);
            assetDir = self->_assetDir;
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v21), "recordName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSString stringByAppendingPathComponent:](assetDir, "stringByAppendingPathComponent:", v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeItemAtPath:error:", v24, 0);

            ++v21;
          }
          while (v19 != v21);
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v66, 16);
        }
        while (v19);
      }

    }
  }
  objc_msgSend(v7, "perRecordSaveBlock");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v7, "recordsToSave", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v44;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v44 != v29)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v30);
          v32 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v7, "perRecordSaveBlock");
          v33 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "recordID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *, _QWORD))v33)[2](v33, v34, v31, 0);

          objc_autoreleasePoolPop(v32);
          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v65, 16);
      }
      while (v28);
    }

  }
  objc_msgSend(v7, "modifyRecordsCompletionBlock");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v7, "modifyRecordsCompletionBlock");
    v37 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordsToSave");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordIDsToDelete");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, uint64_t))v37)[2](v37, v38, v39, v60[5]);

    objc_autoreleasePoolPop(v36);
  }
  objc_msgSend(v7, "completionBlock");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    v41 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v7, "completionBlock");
    v42 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v42[2]();

    objc_autoreleasePoolPop(v41);
  }

  _Block_object_dispose(&v59, 8);
}

uint64_t __54__TRISQLiteCKDatabase__processModifyRecordsOperation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordIDsToDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "_allRecordTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v26;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v9);
          v11 = (void *)MEMORY[0x1D8232A5C]();
          v12 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(a1 + 32), "recordIDsToDelete");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_deleteRecordsWithRecordIds:recordType:txn:", v13, v10, v3);

          objc_autoreleasePoolPop(v11);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v7);
    }

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recordsToSave", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(*(id *)(a1 + 40), "_upsertRecord:txn:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18), v3, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          v19 = *MEMORY[0x1E0D81680];

          goto LABEL_20;
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
        continue;
      break;
    }
  }

  v19 = *MEMORY[0x1E0D81678];
LABEL_20:

  return v19;
}

- (void)_deleteRecordsWithRecordIds:(id)a3 recordType:(id)a4 txn:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v21 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v21, "count"))
  {
    -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1516, CFSTR("Bad record type: %@"), v9);

    }
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke;
    v24[3] = &unk_1E932FB10;
    v13 = v9;
    v25 = v13;
    v14 = v21;
    v26 = v14;
    v15 = v10;
    v27 = v15;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v24);
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v14, "count");
    _PASQMarksSeparatedByCommas();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR(" DELETE FROM     %@ WHERE     trisql_recordId IN (%@);"),
                    v13,
                    v17);

    objc_msgSend(v15, "db");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_3;
    v22[3] = &unk_1E932F1F0;
    v23 = v14;
    objc_msgSend(v19, "prepAndRunQuery:onPrep:onRow:onError:", v18, v22, 0, 0);

  }
}

void __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v11 = a2;
  v5 = objc_msgSend(a3, "firstObject");
  if (v5 == objc_opt_class())
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "count");
    _PASQMarksSeparatedByCommas();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR(" DELETE FROM      %@_%@ WHERE     recordId IN (%@);"),
                   v7,
                   v11,
                   v8);

    objc_msgSend(*(id *)(a1 + 48), "db");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_2;
    v12[3] = &unk_1E932F1F0;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v9, v12, 0, 0);

  }
}

void __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      v4 = v3 + 1;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bindParam:toNSString:", v4, v6);

      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v3 = v4;
    }
    while (v7 > v4);
  }

}

void __66__TRISQLiteCKDatabase__deleteRecordsWithRecordIds_recordType_txn___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      v4 = v3 + 1;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recordName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bindParam:toNSString:", v4, v6);

      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v3 = v4;
    }
    while (v7 > v4);
  }

}

- (BOOL)_upsertRecord:(id)a3 txn:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  BOOL v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  objc_class *v56;
  void *v57;
  id v58;
  id v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[5];
  id v69;
  id v70;
  uint64_t *v71;
  id *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  TRISQLiteCKDatabase *v82;
  id v83;
  _QWORD v84[5];
  _QWORD v85[4];
  id v86;
  id v87;
  TRISQLiteCKDatabase *v88;
  id v89;
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD v92[4];
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v62 = a4;
  v67 = v6;
  objc_msgSend(v6, "recordType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v7);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    v65 = (void *)objc_opt_new();
    v64 = (void *)objc_opt_new();
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    objc_msgSend(v6, "allKeys");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v95;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v95 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v67, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1575, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fieldValue"));

        }
        objc_msgSend(v66, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "firstObject");

        if (!v16)
          break;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v55 = objc_alloc(MEMORY[0x1E0CB3940]);
          v56 = (objc_class *)objc_opt_class();
          NSStringFromClass(v56);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "recordType");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (id)objc_msgSend(v55, "initWithFormat:", CFSTR("Can't modify record with unexpected type %@ for field %@ on record type %@."), v51, v12, v52);
          -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v54);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = *a5;
          *a5 = v57;

          goto LABEL_20;
        }
        if (v16 == objc_opt_class())
          v17 = v64;
        else
          v17 = v65;
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v12);

        objc_autoreleasePoolPop(v13);
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
          if (v9)
            goto LABEL_4;
          goto LABEL_16;
        }
      }
      v50 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v67, "recordType");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v50, "initWithFormat:", CFSTR("Can't modify record using unknown field %@ for record type %@."), v12, v51);
      -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = *a5;
      *a5 = v53;
LABEL_20:

      objc_autoreleasePoolPop(v13);
      v44 = 0;
      goto LABEL_21;
    }
LABEL_16:

    v19 = (void *)objc_opt_new();
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    v23 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v24 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v67, "recordType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithFormat:", CFSTR(" INSERT INTO %@(    trisql_recordId,     modificationDate,     creationDate"), v25);
    v27 = (void *)objc_msgSend(v23, "initWithString:", v26);

    v28 = MEMORY[0x1E0C809B0];
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke;
    v92[3] = &unk_1E932FA98;
    v29 = v67;
    v93 = v29;
    v30 = (void *)MEMORY[0x1D8232C48](v92);
    objc_msgSend(v19, "addObject:", v30);

    v91[0] = v28;
    v91[1] = 3221225472;
    v91[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_2;
    v91[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
    v91[4] = v22;
    v31 = (void *)MEMORY[0x1D8232C48](v91);
    objc_msgSend(v19, "addObject:", v31);

    v90[0] = v28;
    v90[1] = 3221225472;
    v90[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_3;
    v90[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
    v90[4] = v22;
    v32 = (void *)MEMORY[0x1D8232C48](v90);
    objc_msgSend(v19, "addObject:", v32);

    v85[0] = v28;
    v85[1] = 3221225472;
    v85[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_4;
    v85[3] = &unk_1E932FB60;
    v33 = v27;
    v86 = v33;
    v34 = v19;
    v87 = v34;
    v88 = self;
    v35 = v29;
    v89 = v35;
    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v85);
    objc_msgSend(v65, "count");
    _PASQMarksSeparatedByCommas();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendFormat:", CFSTR(") VALUES (%@) ON CONFLICT (trisql_recordId) DO "), v36);

    v37 = (void *)objc_opt_new();
    objc_msgSend(v37, "addObject:", CFSTR("modificationDate = ?"));
    v84[0] = v28;
    v84[1] = 3221225472;
    v84[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_6;
    v84[3] = &__block_descriptor_40_e32_v20__0___PASSqliteStatement_8i16l;
    v84[4] = v22;
    v38 = (void *)MEMORY[0x1D8232C48](v84);
    objc_msgSend(v34, "addObject:", v38);

    v79[0] = v28;
    v79[1] = 3221225472;
    v79[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_7;
    v79[3] = &unk_1E932FB60;
    v80 = v37;
    v39 = v34;
    v81 = v39;
    v82 = self;
    v40 = v35;
    v83 = v40;
    v41 = v37;
    objc_msgSend(v65, "enumerateKeysAndObjectsUsingBlock:", v79);
    objc_msgSend(v33, "appendString:", CFSTR("UPDATE SET "));
    objc_msgSend(v41, "componentsJoinedByString:", CFSTR(", "));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "appendString:", v42);

    objc_msgSend(v33, "appendString:", CFSTR(";"));
    objc_msgSend(v62, "db");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v28;
    v77[1] = 3221225472;
    v77[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_9;
    v77[3] = &unk_1E932F1F0;
    v8 = v39;
    v78 = v8;
    objc_msgSend(v43, "prepAndRunQuery:onPrep:onRow:onError:", v33, v77, 0, 0);

    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 1;
    v68[0] = v28;
    v68[1] = 3221225472;
    v68[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_10;
    v68[3] = &unk_1E932FB88;
    v68[4] = self;
    v69 = v40;
    v71 = &v73;
    v72 = a5;
    v70 = v62;
    objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v68);
    v44 = *((_BYTE *)v74 + 24) != 0;

    _Block_object_dispose(&v73, 8);
LABEL_21:

  }
  else
  {
    v45 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v6, "recordType");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v45, "initWithFormat:", CFSTR("Can't modify record with unknown record type: %@"), v46);
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *a5;
    *a5 = v48;

    v44 = 0;
  }

  return v44;
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "recordID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindParam:toNSString:", a3, v6);

}

uint64_t __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toDouble:", *(double *)(a1 + 32));
}

uint64_t __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toDouble:", *(double *)(a1 + 32));
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(", %@"), a2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_5;
  v9[3] = &unk_1E932FB38;
  v6 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = *(id *)(a1 + 56);
  v7 = v5;
  v8 = (void *)MEMORY[0x1D8232C48](v9);
  objc_msgSend(v6, "addObject:", v8);

}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_5(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = (void *)a1[6];
  v7 = a2;
  objc_msgSend(v6, "recordID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bindParam:toScalarValue:forStatement:recordId:", a3, v5, v7, v8);

}

uint64_t __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bindParam:toDouble:", *(double *)(a1 + 32));
}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a2;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR("%@ = ?"), v8);

  objc_msgSend(v6, "addObject:", v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_8;
  v13[3] = &unk_1E932FB38;
  v10 = *(void **)(a1 + 40);
  v13[4] = *(_QWORD *)(a1 + 48);
  v14 = v5;
  v15 = *(id *)(a1 + 56);
  v11 = v5;
  v12 = (void *)MEMORY[0x1D8232C48](v13);
  objc_msgSend(v10, "addObject:", v12);

}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_8(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = (void *)a1[6];
  v7 = a2;
  objc_msgSend(v6, "recordID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_bindParam:toScalarValue:forStatement:recordId:", a3, v5, v7, v8);

}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 += i;
    }
    while (v6);
  }

}

void __47__TRISQLiteCKDatabase__upsertRecord_txn_error___block_invoke_10(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = a3;
  v10 = a2;
  objc_msgSend(v8, "recordType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recordID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "_replaceArrayFieldWithKey:recordType:recordId:values:txn:error:", v10, v11, v12, v9, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));

  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (id)_filenameForLocallyCopiedAsset:(id)a3 forRecordId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSString *assetDir;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v8, "assetContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_2;
  objc_msgSend(v8, "fileURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, CFSTR("CKAsset is missing a fileURL."));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *a5;
    *a5 = v33;

LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  v30 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v8, "fileURL");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v11 = (void *)objc_msgSend(v30, "initWithContentsOfURL:options:error:", v31, 1, &v42);
  v32 = v42;

  if (!v11)
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to read CKAsset file content: %@"), v32);
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *a5;
    *a5 = v36;

    goto LABEL_15;
  }

LABEL_2:
  v39 = v10;
  assetDir = self->_assetDir;
  objc_msgSend(v9, "recordName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](assetDir, "stringByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v41);
  v19 = v41;

  if ((v18 & 1) == 0)
  {
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v19;
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to create directory for asset: %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v22 = objc_msgSend(v11, "writeToFile:options:error:", v21, 0, &v40);
  v23 = v40;
  v24 = v23;
  if ((v22 & 1) != 0)
  {

    v25 = v16;
  }
  else
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to save CKAsset to database storage: %@"), v23);
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 1, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *a5;
    *a5 = v27;

    v25 = 0;
  }
  v10 = v39;

LABEL_16:
  objc_autoreleasePoolPop(v10);

  return v25;
}

- (id)_assetForLocallyStoredAssetWithFilename:(id)a3 forRecordId:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  NSString *assetDir;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSString *assetCacheDir;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *context;
  id v33;

  v7 = a3;
  v8 = a4;
  context = (void *)MEMORY[0x1D8232A5C]();
  v9 = (void *)MEMORY[0x1E0C99E98];
  assetDir = self->_assetDir;
  objc_msgSend(v8, "recordName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](assetDir, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", v12, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E98];
  assetCacheDir = self->_assetCacheDir;
  objc_msgSend(v8, "recordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](assetCacheDir, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURLWithPath:isDirectory:", v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v18, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", v7, v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", v7, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeItemAtURL:error:", v21, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v24 = objc_msgSend(v23, "copyItemAtURL:toURL:error:", v20, v21, &v33);
  v25 = v33;

  if ((v24 & 1) != 0)
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", v21);
  }
  else
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to copy asset into cache: %@"), v25);
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *a5;
    *a5 = v28;

    v26 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v26;
}

- (BOOL)_replaceArrayFieldWithKey:(id)a3 recordType:(id)a4 recordId:(id)a5 values:(id)a6 txn:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  BOOL v41;
  id v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v60;
  SEL v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  _QWORD *v84;
  _QWORD v85[4];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v70 = a5;
  v17 = a6;
  v18 = a7;
  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19)
  {
    v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Can't modify record with unknown record type: %@"), v16);
    -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *a8;
    *a8 = v39;

    v41 = 0;
    goto LABEL_31;
  }
  v69 = v18;
  v63 = v16;
  v66 = v19;
  objc_msgSend(v19, "objectForKeyedSubscript:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "firstObject");
  if (v22 != objc_opt_class() || (unint64_t)objc_msgSend(v21, "count") <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 1791, CFSTR("Expected array type for %@"), v15);

  }
  v61 = a2;
  v64 = v15;
  v68 = v21;
  v23 = (objc_class *)objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_opt_new();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v67 = v17;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v87;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v87 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v42 = objc_alloc(MEMORY[0x1E0CB3940]);
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v63;
          v15 = v64;
          v45 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("Can't modify record of type %@ with unexpected contained type %@ for array field %@."), v63, v44, v64);
          -[TRISQLiteCKDatabase _errorWithCode:message:](self, "_errorWithCode:message:", 12, v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = *a8;
          *a8 = v46;

          v41 = 0;
          goto LABEL_29;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[TRISQLiteCKDatabase _filenameForLocallyCopiedAsset:forRecordId:error:](self, "_filenameForLocallyCopiedAsset:forRecordId:error:", v30, v70, a8);
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            v41 = 0;
            v16 = v63;
            v15 = v64;
            v17 = v67;
            goto LABEL_30;
          }
          v32 = (void *)v31;
          objc_msgSend(v24, "addObject:", v31);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
      if (v27)
        continue;
      break;
    }
  }

  v33 = objc_opt_class();
  v34 = MEMORY[0x1E0C809B0];
  if (v23 == (objc_class *)v33)
  {
    v35 = MEMORY[0x1E0C809B0];
    v62 = &__block_literal_global_1;
    v16 = v63;
    v15 = v64;
    goto LABEL_28;
  }
  v16 = v63;
  v15 = v64;
  if (v23 == (objc_class *)objc_opt_class())
  {
    v35 = v34;
    v48 = &__block_literal_global_341;
LABEL_27:
    v62 = v48;
    goto LABEL_28;
  }
  if (v23 == (objc_class *)objc_opt_class())
  {
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2020000000;
    v85[3] = 0;
    v35 = v34;
    v82[0] = v34;
    v82[1] = 3221225472;
    v82[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_3;
    v82[3] = &unk_1E932FC10;
    v83 = v24;
    v84 = v85;
    v62 = (void *)MEMORY[0x1D8232C48](v82);

    _Block_object_dispose(v85, 8);
    goto LABEL_28;
  }
  v35 = v34;
  if (v23 == (objc_class *)objc_opt_class())
  {
    v48 = &__block_literal_global_342;
    goto LABEL_27;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(v23);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", v61, self, CFSTR("TRISQLiteCKDatabase.m"), 1840, CFSTR("No support for binding array contained type %@"), v37);

  v62 = 0;
LABEL_28:
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     %@_%@ WHERE     recordId = :record_id;"),
                  v16,
                  v15);
  objc_msgSend(v69, "db");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v35;
  v80[0] = v35;
  v80[1] = 3221225472;
  v80[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_5;
  v80[3] = &unk_1E932F1F0;
  v52 = v70;
  v81 = v52;
  objc_msgSend(v50, "prepAndRunQuery:onPrep:onRow:onError:", v49, v80, 0, 0);

  v74[0] = v51;
  v74[1] = 3221225472;
  v74[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_6;
  v74[3] = &unk_1E932FC80;
  v53 = v16;
  v75 = v53;
  v54 = v15;
  v76 = v54;
  v55 = v69;
  v77 = v55;
  v56 = v52;
  v78 = v56;
  v79 = v62;
  v65 = v62;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v74);
  v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" UPDATE %@ SET     %@ = :count WHERE trisql_recordId = :record_id"), v53, v54);
  objc_msgSend(v55, "db");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v51;
  v71[1] = 3221225472;
  v71[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_8;
  v71[3] = &unk_1E932FCA8;
  v72 = v25;
  v73 = v56;
  objc_msgSend(v58, "prepAndRunQuery:onPrep:onRow:onError:", v57, v71, 0, 0);

  v41 = 1;
  v44 = v75;
  v25 = v65;
LABEL_29:
  v17 = v67;

LABEL_30:
  v18 = v69;
  v20 = v66;

LABEL_31:
  return v41;
}

uint64_t __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "bindNamedParam:toNSString:", ":value", a3);
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  CFNumberRef number;

  number = a3;
  v4 = a2;
  if (CFNumberIsFloatType(number))
  {
    -[__CFNumber doubleValue](number, "doubleValue");
    objc_msgSend(v4, "bindNamedParam:toDouble:", ":value");
  }
  else
  {
    objc_msgSend(v4, "bindNamedParam:toInt64:", ":value", -[__CFNumber longLongValue](number, "longLongValue"));
  }

}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bindNamedParam:toNSString:", ":value", v6);

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "bindNamedParam:toNSData:", ":value", a3);
}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bindNamedParam:toNSString:", ":record_id", v4);

}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_6(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" INSERT INTO %@_%@(    recordId, idx, value) VALUES(    :record_id, :index, :value);"),
             *(_QWORD *)(a1 + 32),
             *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "db");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_7;
  v10[3] = &unk_1E932FC58;
  v11 = *(id *)(a1 + 56);
  v14 = a3;
  v7 = *(id *)(a1 + 64);
  v12 = v5;
  v13 = v7;
  v8 = v5;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", v9, v10, 0, 0);

}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_7(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bindNamedParam:toNSString:", ":record_id", v4);

  if (a1[7] >= 0x7FFFFFFFFFFFFFFFuLL)
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v5 = a1[7];
  objc_msgSend(v6, "bindNamedParam:toInt64:", ":index", v5);
  (*(void (**)(void))(a1[6] + 16))();

}

void __86__TRISQLiteCKDatabase__replaceArrayFieldWithKey_recordType_recordId_values_txn_error___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  if (v5 >= 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = v5;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":count", v6);
  objc_msgSend(*(id *)(a1 + 40), "recordName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":record_id", v7);

}

- (id)_allRecordTypes
{
  if (qword_1EFC74138 != -1)
    dispatch_once(&qword_1EFC74138, &__block_literal_global_354);
  return (id)qword_1EFC74130;
}

void __38__TRISQLiteCKDatabase__allRecordTypes__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = (void *)MEMORY[0x1D8232A5C]();
  v1 = (void *)MEMORY[0x1D8232A5C]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_msgSend(v2, "initWithObjects:", *MEMORY[0x1E0DC0CD0], *MEMORY[0x1E0DC0DC8], *MEMORY[0x1E0DC0BE8], *MEMORY[0x1E0DC0D58], *MEMORY[0x1E0DC0D80], *MEMORY[0x1E0DC0BF0], *MEMORY[0x1E0DC0C78], *MEMORY[0x1E0DC0C48], 0);
  objc_autoreleasePoolPop(v1);
  v4 = (void *)qword_1EFC74130;
  qword_1EFC74130 = v3;

  objc_autoreleasePoolPop(v0);
}

- (id)_valueTypesForFieldsOfRecordType:(id)a3
{
  id v3;
  uint64_t *v4;
  id v5;
  dispatch_once_t *v7;
  void *v8;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0CD0]))
  {
    if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0DC8]))
    {
      if (qword_1EFC74158 == -1)
      {
        v4 = &qword_1EFC74150;
        goto LABEL_25;
      }
      v4 = &qword_1EFC74150;
      v7 = &qword_1EFC74158;
      v8 = &__block_literal_global_361;
    }
    else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0BE8]))
    {
      if (qword_1EFC74168 == -1)
      {
        v4 = &qword_1EFC74160;
        goto LABEL_25;
      }
      v4 = &qword_1EFC74160;
      v7 = &qword_1EFC74168;
      v8 = &__block_literal_global_363;
    }
    else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0D58]))
    {
      if (qword_1EFC74178 == -1)
      {
        v4 = &qword_1EFC74170;
        goto LABEL_25;
      }
      v4 = &qword_1EFC74170;
      v7 = &qword_1EFC74178;
      v8 = &__block_literal_global_365;
    }
    else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0D80]))
    {
      if (qword_1EFC74188 == -1)
      {
        v4 = &qword_1EFC74180;
        goto LABEL_25;
      }
      v4 = &qword_1EFC74180;
      v7 = &qword_1EFC74188;
      v8 = &__block_literal_global_367;
    }
    else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0BF0]))
    {
      if (qword_1EFC74198 == -1)
      {
        v4 = &qword_1EFC74190;
        goto LABEL_25;
      }
      v4 = &qword_1EFC74190;
      v7 = &qword_1EFC74198;
      v8 = &__block_literal_global_369;
    }
    else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0C78]))
    {
      if (qword_1EFC741A8 == -1)
      {
        v4 = &qword_1EFC741A0;
        goto LABEL_25;
      }
      v4 = &qword_1EFC741A0;
      v7 = &qword_1EFC741A8;
      v8 = &__block_literal_global_371;
    }
    else
    {
      if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DC0C48]))
      {
        v5 = 0;
        goto LABEL_26;
      }
      if (qword_1EFC741B8 == -1)
      {
        v4 = &qword_1EFC741B0;
        goto LABEL_25;
      }
      v4 = &qword_1EFC741B0;
      v7 = &qword_1EFC741B8;
      v8 = &__block_literal_global_373;
    }
LABEL_36:
    dispatch_once(v7, v8);
    goto LABEL_25;
  }
  if (qword_1EFC74148 != -1)
  {
    v4 = &qword_1EFC74140;
    v7 = &qword_1EFC74148;
    v8 = &__block_literal_global_356;
    goto LABEL_36;
  }
  v4 = &qword_1EFC74140;
LABEL_25:
  v5 = (id)*v4;
LABEL_26:

  return v5;
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *context;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[18];
  _QWORD v40[20];

  v40[18] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8232A5C]();
  v39[0] = CFSTR("modificationDate");
  v38 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v19;
  v39[1] = CFSTR("creationDate");
  v37 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v18;
  v39[2] = *MEMORY[0x1E0DC0CD8];
  v36 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v17;
  v39[3] = *MEMORY[0x1E0DC0D10];
  v35 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v16;
  v39[4] = *MEMORY[0x1E0DC0CE8];
  v34 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v15;
  v39[5] = *MEMORY[0x1E0DC0CE0];
  v33 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v14;
  v39[6] = *MEMORY[0x1E0DC0D00];
  v32 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v13;
  v39[7] = *MEMORY[0x1E0DC0D08];
  v31 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v12;
  v39[8] = *MEMORY[0x1E0DC0D50];
  v30 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v0;
  v39[9] = *MEMORY[0x1E0DC0D20];
  v29 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v1;
  v39[10] = *MEMORY[0x1E0DC0D28];
  v28 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v2;
  v39[11] = *MEMORY[0x1E0DC0D18];
  v27 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[11] = v3;
  v39[12] = *MEMORY[0x1E0DC0D30];
  v26 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[12] = v4;
  v39[13] = *MEMORY[0x1E0DC0CF0];
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[13] = v5;
  v39[14] = *MEMORY[0x1E0DC0CF8];
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[14] = v6;
  v39[15] = *MEMORY[0x1E0DC0D38];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[15] = v7;
  v39[16] = *MEMORY[0x1E0DC0D48];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[16] = v8;
  v39[17] = *MEMORY[0x1E0DC0D40];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[17] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 18);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1EFC74140;
  qword_1EFC74140 = v10;

  objc_autoreleasePoolPop(context);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[8];
  _QWORD v20[10];

  v20[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D8232A5C]();
  v19[0] = CFSTR("modificationDate");
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v1;
  v19[1] = CFSTR("creationDate");
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v2;
  v19[2] = *MEMORY[0x1E0DC0DF8];
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v3;
  v19[3] = *MEMORY[0x1E0DC0DE8];
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v4;
  v19[4] = *MEMORY[0x1E0DC0DF0];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v5;
  v19[5] = *MEMORY[0x1E0DC0DE0];
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v6;
  v19[6] = *MEMORY[0x1E0DC0DD8];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v7;
  v19[7] = *MEMORY[0x1E0DC0DD0];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8, v11[0]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EFC74150;
  qword_1EFC74150 = v9;

  objc_autoreleasePoolPop(v0);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D8232A5C]();
  v15[0] = CFSTR("modificationDate");
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v1;
  v15[1] = CFSTR("creationDate");
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  v15[2] = *MEMORY[0x1E0DC0C30];
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  v15[3] = *MEMORY[0x1E0DC0C28];
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  v15[4] = *MEMORY[0x1E0DC0C38];
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  v15[5] = *MEMORY[0x1E0DC0C40];
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EFC74160;
  qword_1EFC74160 = v7;

  objc_autoreleasePoolPop(v0);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D8232A5C]();
  v15[0] = CFSTR("modificationDate");
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v1;
  v15[1] = CFSTR("creationDate");
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  v15[2] = *MEMORY[0x1E0DC0D70];
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  v15[3] = *MEMORY[0x1E0DC0D68];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  v15[4] = *MEMORY[0x1E0DC0D60];
  v10[0] = objc_opt_class();
  v10[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  v15[5] = *MEMORY[0x1E0DC0D78];
  v9 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1EFC74170;
  qword_1EFC74170 = v7;

  objc_autoreleasePoolPop(v0);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_5()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *context;
  _QWORD v13[2];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[10];
  _QWORD v24[12];

  v24[10] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8232A5C]();
  v23[0] = CFSTR("modificationDate");
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v0;
  v23[1] = CFSTR("creationDate");
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v1;
  v23[2] = *MEMORY[0x1E0DC0D88];
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v2;
  v23[3] = *MEMORY[0x1E0DC0DC0];
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v3;
  v23[4] = *MEMORY[0x1E0DC0D90];
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v4;
  v23[5] = *MEMORY[0x1E0DC0DB0];
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v5;
  v23[6] = *MEMORY[0x1E0DC0DB8];
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v6;
  v23[7] = *MEMORY[0x1E0DC0DA8];
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v7;
  v23[8] = *MEMORY[0x1E0DC0D98];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v8;
  v23[9] = *MEMORY[0x1E0DC0DA0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 10);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_1EFC74180;
  qword_1EFC74180 = v10;

  objc_autoreleasePoolPop(context);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_6()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[8];
  _QWORD v20[9];

  v20[8] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D8232A5C]();
  v19[0] = CFSTR("modificationDate");
  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v1;
  v19[1] = CFSTR("creationDate");
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v2;
  v19[2] = *MEMORY[0x1E0DC0C18];
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v3;
  v19[3] = *MEMORY[0x1E0DC0C10];
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v4;
  v19[4] = *MEMORY[0x1E0DC0C00];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v5;
  v19[5] = *MEMORY[0x1E0DC0BF8];
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v6;
  v19[6] = *MEMORY[0x1E0DC0C08];
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v7;
  v19[7] = *MEMORY[0x1E0DC0C20];
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[7] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EFC74190;
  qword_1EFC74190 = v9;

  objc_autoreleasePoolPop(v0);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_7()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *context;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[12];
  _QWORD v28[14];

  v28[12] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D8232A5C]();
  v27[0] = CFSTR("modificationDate");
  v26 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v27[1] = CFSTR("creationDate");
  v25 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v12;
  v27[2] = *MEMORY[0x1E0DC0C80];
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v11;
  v27[3] = *MEMORY[0x1E0DC0C90];
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v0;
  v27[4] = *MEMORY[0x1E0DC0C88];
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v28[4] = v1;
  v27[5] = *MEMORY[0x1E0DC0CC0];
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v28[5] = v2;
  v27[6] = *MEMORY[0x1E0DC0CC8];
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28[6] = v3;
  v27[7] = *MEMORY[0x1E0DC0CB0];
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28[7] = v4;
  v27[8] = *MEMORY[0x1E0DC0CA8];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[8] = v5;
  v27[9] = *MEMORY[0x1E0DC0CA0];
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[9] = v6;
  v27[10] = *MEMORY[0x1E0DC0C98];
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[10] = v7;
  v27[11] = *MEMORY[0x1E0DC0CB8];
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[11] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 12);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_1EFC741A0;
  qword_1EFC741A0 = v9;

  objc_autoreleasePoolPop(context);
}

void __56__TRISQLiteCKDatabase__valueTypesForFieldsOfRecordType___block_invoke_8()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[7];
  _QWORD v18[8];

  v18[7] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1D8232A5C]();
  v17[0] = CFSTR("modificationDate");
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v1;
  v17[1] = CFSTR("creationDate");
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v2;
  v17[2] = *MEMORY[0x1E0DC0C60];
  v14 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v3;
  v17[3] = *MEMORY[0x1E0DC0C50];
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v4;
  v17[4] = *MEMORY[0x1E0DC0C58];
  v12 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v5;
  v17[5] = *MEMORY[0x1E0DC0C68];
  v11 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v6;
  v17[6] = *MEMORY[0x1E0DC0C70];
  v10 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[6] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1EFC741B0;
  qword_1EFC741B0 = v8;

  objc_autoreleasePoolPop(v0);
}

- (id)_keysForFieldsOfRecordType:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[TRISQLiteCKDatabase _valueTypesForFieldsOfRecordType:](self, "_valueTypesForFieldsOfRecordType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_375);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__TRISQLiteCKDatabase__keysForFieldsOfRecordType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(&unk_1E93636D8, "containsObject:", a2) ^ 1;
}

- (void)_bindParam:(int)a3 toScalarValue:(id)a4 forStatement:(id)a5 recordId:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;

  v8 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "bindParam:toNSString:", v8, v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v11;
      if (CFNumberIsFloatType((CFNumberRef)v14))
      {
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v12, "bindParam:toDouble:", v8);
      }
      else
      {
        objc_msgSend(v12, "bindParam:toInt64:", v8, objc_msgSend(v14, "longLongValue"));
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        objc_msgSend(v12, "bindParam:toDouble:", v8);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v12, "bindParam:toNSData:", v8, v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = 0;
            -[TRISQLiteCKDatabase _filenameForLocallyCopiedAsset:forRecordId:error:](self, "_filenameForLocallyCopiedAsset:forRecordId:error:", v11, v13, &v20);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v15)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 2064, CFSTR("Failed to copy asset to local storage: %@"), v20);

            }
            objc_msgSend(v12, "bindParam:toNSString:", v8, v15);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 2068, CFSTR("Binding scalar values of type %@ is not supported"), v18);

          }
        }
      }
    }
  }

}

- (id)_errorWithCode:(int64_t)a3 message:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB35C8];
  v6 = a4;
  v7 = [v5 alloc];
  v8 = *MEMORY[0x1E0C947D8];
  v12 = *MEMORY[0x1E0CB2D50];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, a3, v9);
  return v10;
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint8_t buf[4];
  int v18;
  _QWORD v19[2];

  v3 = *(_QWORD *)&a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "TRISQLiteCKDatabase now performing migration.", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D81578]);
  v19[0] = self;
  v8 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithMigrationObjects:", v9);

  v11 = objc_msgSend(v10, "migrateDatabasesToVersion:", v3);
  switch((int)v11)
  {
    case 0:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v13 = "TRISQLiteCKDatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_11;
    case 1:
      goto LABEL_14;
    case 2:
    case 4:
    case 5:
    case 6:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)buf = 67109120;
      v18 = v11;
      v13 = "TRISQLiteCKDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corru"
            "pt and Trial storage will be reset on next launch.";
      v14 = v12;
      v15 = 8;
      break;
    case 3:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v13 = "TRISQLiteCKDatabase has a future schema version, cannot use database.";
LABEL_11:
      v14 = v12;
      v15 = 2;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteCKDatabase.m"), 2102, CFSTR("Unhandled migration result: %u"), v11);
      goto LABEL_13;
  }
  _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_13:

  v8 = 0;
LABEL_14:

  return v8;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)_createTableForRecordType:(id)a3 scalarFields:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v5 = (objc_class *)MEMORY[0x1E0CB37A0];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" CREATE TABLE %@(    trisql_recordId TEXT PRIMARY KEY,     modificationDate REAL NOT NULL,     creationDate REAL NOT NULL"), v7);

  v10 = (void *)objc_msgSend(v8, "initWithString:", v9);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__TRISQLiteCKDatabase__createTableForRecordType_scalarFields___block_invoke;
  v13[3] = &unk_1E932FE30;
  v11 = v10;
  v14 = v11;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);

  objc_msgSend(v11, "appendString:", CFSTR(");"));
  return v11;
}

uint64_t __62__TRISQLiteCKDatabase__createTableForRecordType_scalarFields___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR(", %@ %@"), a2, a3);
}

- (id)_createTableForArrayFieldWithKey:(id)a3 attachedToRecordType:(id)a4 sqliteContainedType:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", CFSTR(" CREATE TABLE %@_%@(     rowid INTEGER PRIMARY KEY AUTOINCREMENT,      recordId TEXT NOT NULL,      idx INTEGER NOT NULL,      value %@ NOT NULL,      FOREIGN KEY (recordId) REFERENCES %@ (trisql_recordId),      UNIQUE (recordId, idx));"),
                  v9,
                  v10,
                  v8,
                  v9);

  return v11;
}

- (id)migrations
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  _QWORD v78[5];
  _QWORD v79[5];
  _QWORD v80[10];
  _QWORD v81[10];
  _QWORD v82[3];
  _QWORD v83[6];
  _QWORD v84[6];
  void *v85;
  _QWORD v86[6];
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[8];
  _QWORD v90[2];
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  _QWORD v94[4];
  _QWORD v95[4];
  _QWORD v96[7];
  _QWORD v97[4];
  uint64_t v98;
  uint64_t v99;
  _QWORD v100[6];
  _QWORD v101[12];
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD v106[16];
  _QWORD v107[8];
  _QWORD v108[4];
  _QWORD v109[6];

  v109[4] = *MEMORY[0x1E0C80C00];
  v108[0] = &unk_1E9363978;
  v3 = *MEMORY[0x1E0DC0CD0];
  v4 = *MEMORY[0x1E0DC0D10];
  v101[0] = *MEMORY[0x1E0DC0CD8];
  v101[1] = v4;
  v106[0] = CFSTR("REAL");
  v106[1] = CFSTR("TEXT");
  v5 = *MEMORY[0x1E0DC0CE0];
  v101[2] = *MEMORY[0x1E0DC0CE8];
  v101[3] = v5;
  v106[2] = CFSTR("INTEGER");
  v106[3] = CFSTR("INTEGER");
  v6 = *MEMORY[0x1E0DC0D08];
  v101[4] = *MEMORY[0x1E0DC0D00];
  v101[5] = v6;
  v106[4] = CFSTR("BLOB");
  v106[5] = CFSTR("TEXT");
  v7 = *MEMORY[0x1E0DC0D20];
  v101[6] = *MEMORY[0x1E0DC0D50];
  v101[7] = v7;
  v106[6] = CFSTR("BLOB");
  v106[7] = CFSTR("INTEGER");
  v8 = *MEMORY[0x1E0DC0D18];
  v101[8] = *MEMORY[0x1E0DC0D28];
  v101[9] = v8;
  v106[8] = CFSTR("INTEGER");
  v106[9] = CFSTR("INTEGER");
  v9 = *MEMORY[0x1E0DC0CF0];
  v101[10] = *MEMORY[0x1E0DC0D30];
  v101[11] = v9;
  v106[10] = CFSTR("INTEGER");
  v106[11] = CFSTR("INTEGER");
  v11 = *MEMORY[0x1E0DC0D38];
  v102 = *MEMORY[0x1E0DC0CF8];
  v10 = v102;
  v103 = v11;
  v106[12] = CFSTR("INTEGER");
  v106[13] = CFSTR("INTEGER");
  v13 = *MEMORY[0x1E0DC0D40];
  v104 = *MEMORY[0x1E0DC0D48];
  v12 = v104;
  v105 = v13;
  v106[14] = CFSTR("INTEGER");
  v106[15] = CFSTR("INTEGER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v101, 16);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v3, v77);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v76;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v10, v3, CFSTR("INTEGER"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v107[1] = v75;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v11, v3, CFSTR("INTEGER"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v74;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v12, v3, CFSTR("INTEGER"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v107[3] = v73;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v13, v3, CFSTR("TEXT"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v72;
  v14 = *MEMORY[0x1E0DC0DC8];
  v15 = *MEMORY[0x1E0DC0DE8];
  v97[0] = *MEMORY[0x1E0DC0DF8];
  v97[1] = v15;
  v100[0] = CFSTR("TEXT");
  v100[1] = CFSTR("BLOB");
  v16 = *MEMORY[0x1E0DC0DE0];
  v97[2] = *MEMORY[0x1E0DC0DF0];
  v97[3] = v16;
  v100[2] = CFSTR("TEXT");
  v100[3] = CFSTR("BLOB");
  v18 = *MEMORY[0x1E0DC0DD0];
  v98 = *MEMORY[0x1E0DC0DD8];
  v17 = v98;
  v99 = v18;
  v100[4] = CFSTR("INTEGER");
  v100[5] = CFSTR("INTEGER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v97, 6);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v14, v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v107[5] = v70;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v17, v14, CFSTR("TEXT"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v107[6] = v69;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v18, v14, CFSTR("TEXT"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v107[7] = v68;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v107, 8);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v109[0] = v67;
  v108[1] = &unk_1E9363990;
  v19 = *MEMORY[0x1E0DC0BE8];
  v20 = *MEMORY[0x1E0DC0C28];
  v94[0] = *MEMORY[0x1E0DC0C30];
  v94[1] = v20;
  v95[0] = CFSTR("TEXT");
  v95[1] = CFSTR("TEXT");
  v21 = *MEMORY[0x1E0DC0C40];
  v94[2] = *MEMORY[0x1E0DC0C38];
  v94[3] = v21;
  v95[2] = CFSTR("TEXT");
  v95[3] = CFSTR("BLOB");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 4);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v19, v66);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v65;
  v22 = *MEMORY[0x1E0DC0D58];
  v23 = *MEMORY[0x1E0DC0D78];
  v90[0] = *MEMORY[0x1E0DC0D70];
  v90[1] = v23;
  v93[0] = CFSTR("TEXT");
  v93[1] = CFSTR("BLOB");
  v25 = *MEMORY[0x1E0DC0D60];
  v91 = *MEMORY[0x1E0DC0D68];
  v24 = v91;
  v92 = v25;
  v93[2] = CFSTR("INTEGER");
  v93[3] = CFSTR("INTEGER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v90, 4);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v22, v64);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v63;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v24, v22, CFSTR("BLOB"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v62;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v25, v22, CFSTR("TEXT"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v61;
  v26 = *MEMORY[0x1E0DC0D80];
  v27 = *MEMORY[0x1E0DC0DC0];
  v86[0] = *MEMORY[0x1E0DC0D88];
  v86[1] = v27;
  v89[0] = CFSTR("REAL");
  v89[1] = CFSTR("TEXT");
  v28 = *MEMORY[0x1E0DC0DB0];
  v86[2] = *MEMORY[0x1E0DC0D90];
  v86[3] = v28;
  v89[2] = CFSTR("INTEGER");
  v89[3] = CFSTR("BLOB");
  v29 = *MEMORY[0x1E0DC0DA8];
  v86[4] = *MEMORY[0x1E0DC0DB8];
  v86[5] = v29;
  v89[4] = CFSTR("TEXT");
  v89[5] = CFSTR("BLOB");
  v31 = *MEMORY[0x1E0DC0DA0];
  v87 = *MEMORY[0x1E0DC0D98];
  v30 = v87;
  v88 = v31;
  v89[6] = CFSTR("INTEGER");
  v89[7] = CFSTR("INTEGER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v86, 8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v26, v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v96[4] = v59;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v30, v26, CFSTR("TEXT"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v96[5] = v58;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v31, v26, CFSTR("INTEGER"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v96[6] = v57;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v96, 7);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v109[1] = v56;
  v108[2] = &unk_1E93639A8;
  v32 = *MEMORY[0x1E0DC0BF0];
  v33 = *MEMORY[0x1E0DC0C10];
  v83[0] = *MEMORY[0x1E0DC0C18];
  v83[1] = v33;
  v84[0] = CFSTR("TEXT");
  v84[1] = CFSTR("TEXT");
  v34 = *MEMORY[0x1E0DC0BF8];
  v83[2] = *MEMORY[0x1E0DC0C00];
  v83[3] = v34;
  v84[2] = CFSTR("TEXT");
  v84[3] = CFSTR("TEXT");
  v35 = *MEMORY[0x1E0DC0C20];
  v83[4] = *MEMORY[0x1E0DC0C08];
  v83[5] = v35;
  v84[4] = CFSTR("INTEGER");
  v84[5] = CFSTR("BLOB");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v32, v55);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v54;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v36;
  v108[3] = &unk_1E93639C0;
  v37 = *MEMORY[0x1E0DC0C78];
  v38 = *MEMORY[0x1E0DC0C80];
  v80[0] = *MEMORY[0x1E0DC0C88];
  v80[1] = v38;
  v81[0] = CFSTR("REAL");
  v81[1] = CFSTR("TEXT");
  v39 = *MEMORY[0x1E0DC0CC0];
  v80[2] = *MEMORY[0x1E0DC0C90];
  v80[3] = v39;
  v81[2] = CFSTR("INTEGER");
  v81[3] = CFSTR("BLOB");
  v40 = *MEMORY[0x1E0DC0CB0];
  v80[4] = *MEMORY[0x1E0DC0CC8];
  v80[5] = v40;
  v81[4] = CFSTR("TEXT");
  v81[5] = CFSTR("BLOB");
  v41 = *MEMORY[0x1E0DC0CB8];
  v80[6] = *MEMORY[0x1E0DC0C98];
  v80[7] = v41;
  v81[6] = CFSTR("INTEGER");
  v81[7] = CFSTR("INTEGER");
  v42 = *MEMORY[0x1E0DC0CA8];
  v80[8] = *MEMORY[0x1E0DC0CA0];
  v80[9] = v42;
  v81[8] = CFSTR("TEXT");
  v81[9] = CFSTR("INTEGER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 10);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v37, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v44;
  -[TRISQLiteCKDatabase _createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:](self, "_createTableForArrayFieldWithKey:attachedToRecordType:sqliteContainedType:", v42, v37, CFSTR("INTEGER"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v45;
  v46 = *MEMORY[0x1E0DC0C48];
  v47 = *MEMORY[0x1E0DC0C50];
  v78[0] = *MEMORY[0x1E0DC0C60];
  v78[1] = v47;
  v79[0] = CFSTR("INTEGER");
  v79[1] = CFSTR("BLOB");
  v48 = *MEMORY[0x1E0DC0C68];
  v78[2] = *MEMORY[0x1E0DC0C58];
  v78[3] = v48;
  v79[2] = CFSTR("TEXT");
  v79[3] = CFSTR("BLOB");
  v78[4] = *MEMORY[0x1E0DC0C70];
  v79[4] = CFSTR("INTEGER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRISQLiteCKDatabase _createTableForRecordType:scalarFields:](self, "_createTableForRecordType:scalarFields:", v46, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v109[3] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v109, v108, 4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  return v52;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (TRISQLiteCKDatabaseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (CKContainer)container
{
  return (CKContainer *)objc_loadWeakRetained((id *)&self->_container);
}

- (void)setContainer:(id)a3
{
  objc_storeWeak((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_container);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_opQueue, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_assetCacheDir, 0);
  objc_storeStrong((id *)&self->_assetDir, 0);
  objc_storeStrong((id *)&self->_parentDir, 0);
}

@end
