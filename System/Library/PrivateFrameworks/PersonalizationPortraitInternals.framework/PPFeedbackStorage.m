@implementation PPFeedbackStorage

- (PPFeedbackStorage)init
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  PPFeedbackStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  _PASLock *v11;
  _PASLock *lock;
  PPFeedbackStorage *v13;
  NSObject *v14;
  objc_super v16;

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PPPaths subdirectory:](PPPaths, "subdirectory:", CFSTR("streams"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    v6 = v4;
    if (self)
    {
      v16.receiver = self;
      v16.super_class = (Class)PPFeedbackStorage;
      v7 = -[PPFeedbackStorage init](&v16, sel_init);
      self = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_db, v3);
        objc_storeStrong((id *)&self->_namedEntityStoreOverride, 0);
        objc_storeStrong((id *)&self->_topicStoreOverride, 0);
        objc_storeStrong((id *)&self->_locationStoreOverride, 0);
        objc_storeStrong((id *)&self->_quickTypeBrokerOverride, 0);
        objc_storeStrong((id *)&self->_contactStoreOverride, 0);
        objc_storeStrong((id *)&self->_eventStoreOverride, 0);
        objc_storeStrong((id *)&self->_connectionsStoreOverride, 0);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024C0]), "initWithStoreBasePath:segmentSize:", v6, 8 * NSPageSize());
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D024B0]), "initPruneOnAccess:filterByAgeOnRead:maxAge:maxStreamSize:", 1, 1, 51200, 86400.0);
        objc_msgSend(v8, "setPruningPolicy:", v9);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("portraitFeedback"), v8);
        v11 = (_PASLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v10);
        lock = self->_lock;
        self->_lock = v11;

      }
    }

    self = self;
    v13 = self;
  }
  else
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v16.receiver) = 0;
      _os_log_fault_impl(&dword_1C392E000, v14, OS_LOG_TYPE_FAULT, "Failed to get db instance", (uint8_t *)&v16, 2u);
    }

    v13 = 0;
  }

  return v13;
}

- (BOOL)storePendingFeedback:(id)a3 storeType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  _PASLock *lock;
  id v14;
  id v15;
  CFAbsoluteTime Current;
  _PASLock *v17;
  void *v18;
  void *v19;
  PPInternalFeedback *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _PASLock *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[8];
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  uint64_t *v44;
  double v45;

  v5 = a4;
  v7 = a3;
  objc_msgSend(v7, "clientBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "setStoreType:", v5);
    objc_msgSend(v7, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("ICLex"));

    v11 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v12 = v7;
      v7 = v12;
      if (self)
      {
        v33 = 0;
        v34 = &v33;
        v35 = 0x3032000000;
        v36 = __Block_byref_object_copy__17837;
        v37 = __Block_byref_object_dispose__17838;
        v38 = 0;
        *(_QWORD *)buf = v11;
        lock = self->_lock;
        v40 = 3221225472;
        v41 = __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke;
        v42 = &unk_1E7E1CC80;
        v7 = v12;
        LOBYTE(v45) = v5;
        v43 = v7;
        v44 = &v33;
        -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", buf);
        v14 = (id)v34[5];

        _Block_object_dispose(&v33, 8);
        if (v14)
        {
          v15 = v14;
          v33 = 0;
          v34 = &v33;
          v35 = 0x2020000000;
          LOBYTE(v36) = 1;
          Current = CFAbsoluteTimeGetCurrent();
          v17 = self->_lock;
          *(_QWORD *)buf = v11;
          v40 = 3221225472;
          v41 = __44__PPFeedbackStorage__removeExistingSession___block_invoke;
          v42 = &unk_1E7E1CBC8;
          v45 = Current + -40.0;
          v14 = v15;
          v43 = v14;
          v44 = &v33;
          -[_PASLock runWithLockAcquired:](v17, "runWithLockAcquired:", buf);
          LODWORD(v17) = *((unsigned __int8 *)v34 + 24);

          _Block_object_dispose(&v33, 8);
          if ((_DWORD)v17)
          {
            objc_msgSend(v14, "feedbackItems");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v18, "mutableCopy");

            objc_msgSend(v7, "feedbackItems");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObjectsFromArray:", v19);

            v20 = [PPInternalFeedback alloc];
            objc_msgSend(v14, "timestamp");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "clientIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "clientBundleId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "mappingId");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "build");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[PPInternalFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:](v20, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:", v30, v21, v22, v23, v29, v5, v24);

            v11 = MEMORY[0x1E0C809B0];
            v7 = (id)v25;
          }
        }
      }
      else
      {

        v14 = 0;
      }

    }
    v26 = self->_lock;
    v31[0] = v11;
    v31[1] = 3221225472;
    v31[2] = __58__PPFeedbackStorage_storePendingFeedback_storeType_error___block_invoke;
    v31[3] = &unk_1E7E1CB78;
    v7 = v7;
    v32 = v7;
    -[_PASLock runWithLockAcquired:](v26, "runWithLockAcquired:", v31);

  }
  else
  {
    pp_default_log_handle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v27, OS_LOG_TYPE_ERROR, "nil clientBundleId in client feedback", buf, 2u);
    }

  }
  return v8 != 0;
}

- (BOOL)deleteExpiredFeedbackWithShouldContinueBlock:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke;
  v8[3] = &unk_1E7E1CCD0;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:shouldContinueBlock:](lock, "runWithLockAcquired:shouldContinueBlock:", v8, v6);
  LOBYTE(lock) = *((_BYTE *)v12 + 24) == 0;

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (id)mappedTopicsPendingFeedbackWithShouldContinueBlock:(id)a3
{
  id v4;
  uint64_t v5;
  _PASLock *lock;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__17837;
  v25 = __Block_byref_object_dispose__17838;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17837;
  v19 = __Block_byref_object_dispose__17838;
  v20 = 0;
  v5 = MEMORY[0x1E0C809B0];
  lock = self->_lock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke;
  v14[3] = &unk_1E7E1CCF8;
  v14[4] = &v15;
  if (-[_PASLock runWithLockAcquired:shouldContinueBlock:](lock, "runWithLockAcquired:shouldContinueBlock:", v14, v4) == 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend((id)v16[5], "filterWithIsIncluded:", &__block_literal_global_85_17909);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapWithTransform:", &__block_literal_global_87_17910);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_5;
    v13[3] = &unk_1E7E1E4A0;
    v13[4] = &v21;
    v11 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", &__block_literal_global_88_17911, v13);

    v7 = (id)v22[5];
  }
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7;
}

- (BOOL)processPendingFeedbackWithShouldContinueBlock:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  PPSQLDatabase *db;
  id v8;
  _PASLock *lock;
  id v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t (**v16)(_QWORD);
  id v17;
  _QWORD v19[5];
  id v20;
  _QWORD v21[6];
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  if (self)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__17837;
    v37 = __Block_byref_object_dispose__17838;
    v38 = 0;
    db = self->_db;
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = (uint64_t)__44__PPFeedbackStorage__lastProcessedTimestamp__block_invoke;
    v31 = &unk_1E7E1DEE8;
    v32 = &v33;
    -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 7, &v28);
    v8 = (id)v34[5];
    _Block_object_dispose(&v33, 8);

  }
  else
  {
    v8 = 0;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__17837;
  v37 = __Block_byref_object_dispose__17838;
  v38 = 0;
  lock = self->_lock;
  v25[0] = v6;
  v25[1] = 3221225472;
  v25[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke;
  v25[3] = &unk_1E7E1CDA0;
  v27 = &v33;
  v10 = v8;
  v26 = v10;
  if (-[_PASLock runWithLockAcquired:shouldContinueBlock:](lock, "runWithLockAcquired:shouldContinueBlock:", v25, v5) == 1)
  {
    v11 = 0;
  }
  else
  {
    v28 = 0;
    v29 = (uint64_t)&v28;
    v30 = 0x2020000000;
    v31 = 0;
    v12 = (void *)MEMORY[0x1C3BD6630]();
    v13 = (void *)v34[5];
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_2;
    v23[3] = &unk_1E7E1CDC8;
    v24 = v10;
    objc_msgSend(v13, "filterWithIsIncluded:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_3;
    v22[3] = &unk_1E7E1CDF0;
    v22[4] = &v28;
    objc_msgSend(v14, "mapWithTransform:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v6;
    v21[1] = 3221225472;
    v21[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_4;
    v21[3] = &unk_1E7E1CE18;
    v21[4] = self;
    v21[5] = &v28;
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_101;
    v19[3] = &unk_1E7E1CE40;
    v19[4] = self;
    v16 = (uint64_t (**)(_QWORD))v5;
    v20 = v16;
    v17 = (id)objc_msgSend(v15, "sinkWithCompletion:shouldContinue:", v21, v19);

    objc_autoreleasePoolPop(v12);
    v11 = v16[2](v16);
    _Block_object_dispose(&v28, 8);
  }

  _Block_object_dispose(&v33, 8);
  return v11;
}

- (id)pendingTopicFeedback
{
  void *v3;
  _PASLock *lock;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__17837;
  v12 = __Block_byref_object_dispose__17838;
  v13 = 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630](self, a2));
  v3 = (void *)v9[5];
  v9[5] = MEMORY[0x1E0C9AA60];

  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke;
  v7[3] = &unk_1E7E1CCF8;
  v7[4] = &v8;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_connectionsStoreOverride, 0);
  objc_storeStrong((id *)&self->_eventStoreOverride, 0);
  objc_storeStrong((id *)&self->_contactStoreOverride, 0);
  objc_storeStrong((id *)&self->_quickTypeBrokerOverride, 0);
  objc_storeStrong((id *)&self->_locationStoreOverride, 0);
  objc_storeStrong((id *)&self->_topicStoreOverride, 0);
  objc_storeStrong((id *)&self->_namedEntityStoreOverride, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

void __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend(a2, "publisherFromStartTime:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterWithIsIncluded:", &__block_literal_global_104_17839);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapWithTransform:", &__block_literal_global_105);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_5;
  v8[3] = &unk_1E7E1E4A0;
  v8[4] = *(_QWORD *)(a1 + 32);
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_106, v8);

}

void __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventBody");
}

BOOL __41__PPFeedbackStorage_pendingTopicFeedback__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "storeType") == 2;

  return v3;
}

void __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v4, "publisherFromStartTime:");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

BOOL __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  _BOOL8 v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D70D00], "osBuild");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "bundleIdentifierIsEnabledForDonation:", v9))
    {
      objc_msgSend(v3, "timestamp");
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 32), "doubleValue");
      v13 = v11 > v12;
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v13;
}

id __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = 138412290;
      *(_QWORD *)((char *)&v10 + 4) = v9;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPFeedbackStorage: error processing pending feedback: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(v5 + 8);
    *(_QWORD *)&v10 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v10 + 1) = 3221225472;
    v11 = __49__PPFeedbackStorage__saveLastProcessedTimestamp___block_invoke;
    v12 = &unk_1E7E1EEB0;
    v13 = v6;
    objc_msgSend(v8, "writeTransactionWithClient:block:", 7, &v10);

  }
}

uint64_t __73__PPFeedbackStorage_processPendingFeedbackWithShouldContinueBlock_error___block_invoke_101(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;
  unsigned int (**v8)(_QWORD);
  unint64_t v9;
  const __CFString *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  unsigned int (**v18)(_QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  const __CFString *v65;
  const __CFString *v66;
  _UNKNOWN **v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _UNKNOWN **v73;
  const __CFString *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  id v81;
  id v82;
  unsigned int (**v83)(_QWORD);
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t j;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  int v118;
  NSObject *v119;
  int v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t k;
  void *v126;
  PPInternalFeedback *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  PPInternalFeedback *v134;
  uint64_t v135;
  PPInternalFeedback *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  uint64_t v140;
  NSObject *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  NSObject *v148;
  NSObject *v149;
  int v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v155;
  uint64_t v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  int v162;
  id v163;
  unsigned int (**v164)(_QWORD);
  id obj;
  unsigned int (**v166)(_QWORD);
  void *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  id v172;
  void *v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  unsigned int v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  unsigned int v197;
  void *v198;
  void *v199;
  NSObject *context;
  void *contexta;
  void *contextb;
  _QWORD v203[4];
  id v204;
  unsigned int (**v205)(_QWORD);
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 buf;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  uint8_t v217[4];
  void *v218;
  __int16 v219;
  uint64_t v220;
  __int16 v221;
  void *v222;
  __int16 v223;
  void *v224;
  __int16 v225;
  void *v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v155 = (void *)MEMORY[0x1C3BD6630]();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = objc_msgSend(v3, "storeType");
  v156 = a1;
  v6 = *(void **)(a1 + 40);
  v7 = v3;
  v8 = v6;
  v157 = v7;
  v168 = v4;
  if (v4)
  {
    v208 = 0u;
    v209 = 0u;
    v206 = 0u;
    v207 = 0u;
    objc_msgSend(v7, "feedbackItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v217, 16);
    if (!v170)
      goto LABEL_43;
    v169 = *(_QWORD *)v207;
    v9 = 0x1E0CB3000uLL;
    v10 = CFSTR("clientId");
    v162 = v5;
    v164 = v8;
    while (1)
    {
      for (i = 0; i != v170; ++i)
      {
        if (*(_QWORD *)v207 != v169)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1C3BD6630]();
        if (v5 != 3)
        {
          if (v5 == 2)
          {
            v173 = v13;
            v175 = i;
            objc_msgSend(v12, "itemString");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v182 = objc_msgSend(v12, "itemFeedbackType");
            v39 = v38;
            v40 = v7;
            v41 = v7;
            v166 = v8;
            -[PPFeedbackStorage topicStore](v168);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v8)
            {
              v163 = v42;
              objc_msgSend(v41, "mappingId");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                v44 = v43;
                v45 = v41;
                v46 = (void *)MEMORY[0x1C3BD6630]();
                v172 = v39;
                v160 = v44;
                objc_msgSend(v163, "unmapMappedTopicIdentifier:mappingIdentifier:error:", v39, v44, 0);
                v47 = v9;
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "allKeys");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "_pas_mappedArrayWithTransform:", &__block_literal_global_151);
                v50 = objc_claimAutoreleasedReturnValue();

                objc_autoreleasePoolPop(v46);
                v51 = (void *)objc_opt_new();
                v159 = (void *)v50;
                v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v50);
                objc_msgSend(v51, "setMatchingTopicIds:", v52);

                objc_msgSend(v45, "timestamp");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setToDate:", v53);

                objc_msgSend(v45, "timestamp");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setScoringDate:", v54);

                objc_msgSend(v45, "clientBundleId");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v55, 1);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "setExcludingSourceBundleIds:", v56);

                v57 = (void *)objc_opt_new();
                v203[0] = MEMORY[0x1E0C809B0];
                v203[1] = 3221225472;
                v203[2] = __101__PPFeedbackStorage__performAttributionForMappedTopic_baseFeedback_feedbackType_shouldContinueBlock___block_invoke_2;
                v203[3] = &unk_1E7E1CF08;
                v205 = v166;
                v58 = v57;
                v204 = v58;
                v158 = v51;
                objc_msgSend(v163, "iterTopicRecordsWithQuery:error:block:", v51, 0, v203);
                v161 = v45;
                objc_msgSend(v45, "clientIdentifier");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "_pas_stringBackedByUTF8CString");
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                v61 = (void *)MEMORY[0x1C3BD6630]();
                objc_msgSend(v58, "allValues");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = (void *)objc_msgSend(v62, "mutableCopy");

                objc_autoreleasePoolPop(v61);
                objc_msgSend(v63, "lastObject");
                v64 = objc_claimAutoreleasedReturnValue();
                v65 = v10;
                v66 = CFSTR("domain");
                v67 = &off_1E7E12000;
                if (v64)
                {
                  v68 = (void *)v64;
                  v176 = v60;
                  v179 = v63;
                  do
                  {
                    contexta = (void *)MEMORY[0x1C3BD6630]();
                    objc_msgSend(v63, "removeLastObject");
                    *(_QWORD *)&v227 = CFSTR("algorithm");
                    objc_msgSend(MEMORY[0x1E0D70CD0], "describeAlgorithm:", objc_msgSend(v68, "algorithm"));
                    v198 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_QWORD *)&buf = v198;
                    *((_QWORD *)&v227 + 1) = CFSTR("algorithmEnum");
                    objc_msgSend(*(id *)(v47 + 2024), "numberWithUnsignedInteger:", objc_msgSend(v68, "algorithm"));
                    v194 = (void *)objc_claimAutoreleasedReturnValue();
                    *((_QWORD *)&buf + 1) = v194;
                    *(_QWORD *)&v228 = CFSTR("source");
                    v69 = v67[313];
                    objc_msgSend(v68, "source");
                    v191 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v191, "bundleId");
                    v188 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v69, "filterBundleId:", v188);
                    v185 = (void *)objc_claimAutoreleasedReturnValue();
                    v211 = v185;
                    v212 = v60;
                    *((_QWORD *)&v228 + 1) = v65;
                    *(_QWORD *)&v229 = v66;
                    objc_msgSend(v67[313], "stringifyDomain:", 0);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v213 = v70;
                    *((_QWORD *)&v229 + 1) = CFSTR("feedbackType");
                    objc_msgSend(v67[313], "stringifyFeedbackType:", v182);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    v214 = v71;
                    *(_QWORD *)&v230 = CFSTR("isRemote");
                    objc_msgSend(*(id *)(v47 + 2024), "numberWithInt:", objc_msgSend(v68, "isLocal") ^ 1);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    v215 = v72;
                    *((_QWORD *)&v230 + 1) = CFSTR("feedbackTypeEnum");
                    objc_msgSend(*(id *)(v47 + 2024), "numberWithUnsignedInt:", v182);
                    v73 = v67;
                    v74 = v66;
                    v75 = v65;
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    v216 = v76;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v227, 8);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    v65 = v75;
                    v66 = v74;
                    v67 = v73;

                    v63 = v179;
                    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FeedbackAttributed"), v77, 1);

                    v60 = v176;
                    objc_autoreleasePoolPop(contexta);
                    objc_msgSend(v179, "lastObject");
                    v78 = objc_claimAutoreleasedReturnValue();

                    v68 = (void *)v78;
                  }
                  while (v78);
                }

                v40 = v157;
                v5 = v162;
                v8 = v164;
                v9 = v47;
                v10 = v65;
                v39 = v172;
                v43 = v160;
                v41 = v161;
              }

              v42 = v163;
            }

            i = v175;
            v7 = v40;
            goto LABEL_40;
          }
          if (v5 != 1)
            goto LABEL_41;
          v173 = v13;
          v174 = i;
          objc_msgSend(v12, "itemString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "itemFeedbackType");
          v16 = v14;
          v17 = v7;
          v18 = v8;
          -[PPFeedbackStorage namedEntityStore](v168);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)objc_opt_new();
          v21 = (void *)MEMORY[0x1C3BD6630]();
          v171 = v16;
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v16, 0);
          objc_autoreleasePoolPop(v21);
          objc_msgSend(v20, "setMatchingNames:", v22);

          objc_msgSend(v20, "setLimit:", 1);
          objc_msgSend(v17, "timestamp");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setToDate:", v23);

          objc_msgSend(v20, "setOrderByAscendingDate:", 1);
          objc_msgSend(v17, "clientBundleId");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v24, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setExcludingSourceBundleIds:", v25);

          if (v8[2](v18))
          {
            objc_msgSend(v19, "namedEntityRecordsWithQuery:error:", v20, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              if (v8[2](v18))
              {
                v197 = v15;
                v28 = (void *)MEMORY[0x1E0D70BC0];
                objc_msgSend(v27, "entity");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "describeCategory:", objc_msgSend(v29, "category"));
                v30 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(v27, "entity");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "dynamicCategory");
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                {
                  v33 = (void *)MEMORY[0x1C3BD6630]();
                  v34 = objc_alloc(MEMORY[0x1E0CB3940]);
                  objc_msgSend(v27, "entity");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "dynamicCategory");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v37 = objc_msgSend(v34, "initWithFormat:", CFSTR("%@:%@"), v30, v36);

                  objc_autoreleasePoolPop(v33);
                  context = v37;
                }
                else
                {
                  context = v30;
                }
                v196 = (void *)MEMORY[0x1C3BD6630]();
                *(_QWORD *)&v227 = CFSTR("algorithm");
                objc_msgSend(MEMORY[0x1E0D70BD8], "describeAlgorithm:", objc_msgSend(v27, "algorithm"));
                v193 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)&buf = v193;
                *((_QWORD *)&v227 + 1) = CFSTR("algorithmEnum");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v27, "algorithm"));
                v190 = (void *)objc_claimAutoreleasedReturnValue();
                *((_QWORD *)&buf + 1) = v190;
                *(_QWORD *)&v228 = CFSTR("source");
                objc_msgSend(v27, "source");
                v187 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v187, "bundleId");
                v184 = (void *)objc_claimAutoreleasedReturnValue();
                +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:", v184);
                v181 = (void *)objc_claimAutoreleasedReturnValue();
                v211 = v181;
                *((_QWORD *)&v228 + 1) = CFSTR("clientId");
                objc_msgSend(v17, "clientIdentifier");
                v178 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v178, "_pas_stringBackedByUTF8CString");
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                v212 = v167;
                *(_QWORD *)&v229 = CFSTR("domain");
                +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", 1);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v213 = v98;
                *((_QWORD *)&v229 + 1) = CFSTR("category");
                -[NSObject _pas_stringBackedByUTF8CString](context, "_pas_stringBackedByUTF8CString");
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                v214 = v99;
                *(_QWORD *)&v230 = CFSTR("feedbackType");
                +[PPMetricsUtils stringifyFeedbackType:](PPMetricsUtils, "stringifyFeedbackType:", v197);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v215 = v100;
                *((_QWORD *)&v230 + 1) = CFSTR("feedbackTypeEnum");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v197);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                v216 = v101;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v227, 8);
                v102 = (void *)objc_claimAutoreleasedReturnValue();

                objc_autoreleasePoolPop(v196);
                +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FeedbackAttributed"), v102, 1);

                v7 = v157;
                v8 = v164;
                v97 = context;
                goto LABEL_36;
              }
            }
            else
            {
              pp_private_log_handle();
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v171;
                _os_log_debug_impl(&dword_1C392E000, v97, OS_LOG_TYPE_DEBUG, "PPFeedbackStorage: unable to attribute feedback for named entity: %@", (uint8_t *)&buf, 0xCu);
              }
LABEL_36:

            }
            v5 = v162;
          }

          goto LABEL_39;
        }
        v173 = v13;
        v174 = i;
        objc_msgSend(v12, "itemString");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v12, "itemFeedbackType");
        v81 = v79;
        v82 = v7;
        v83 = v8;
        -[PPFeedbackStorage locationStore](v168);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = (void *)objc_opt_new();
        v171 = v81;
        objc_msgSend(v85, "setFuzzyMatchingString:", v81);
        objc_msgSend(v82, "timestamp");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setToDate:", v86);

        objc_msgSend(v85, "setLimit:", 1);
        objc_msgSend(v85, "setOrderByAscendingDate:", 1);
        objc_msgSend(v82, "clientBundleId");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPFeedbackExclusionProvider excludedBundleIdsForClientBundleId:domain:]((uint64_t)PPFeedbackExclusionProvider, v87, 2);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setExcludingSourceBundleIds:", v88);

        v8 = v164;
        if (v164[2](v83))
        {
          objc_msgSend(v84, "locationRecordsWithQuery:error:", v85, 0);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "firstObject");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            if (v164[2](v83))
            {
              contextb = (void *)MEMORY[0x1C3BD6630]();
              *(_QWORD *)&v227 = CFSTR("algorithm");
              objc_msgSend(MEMORY[0x1E0D70B90], "describeAlgorithm:", objc_msgSend(v90, "algorithm"));
              v199 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf = v199;
              *((_QWORD *)&v227 + 1) = CFSTR("algorithmEnum");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v90, "algorithm"));
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)&buf + 1) = v195;
              *(_QWORD *)&v228 = CFSTR("source");
              objc_msgSend(v90, "source");
              v192 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v192, "bundleId");
              v189 = (void *)objc_claimAutoreleasedReturnValue();
              +[PPMetricsUtils filterBundleId:](PPMetricsUtils, "filterBundleId:", v189);
              v186 = (void *)objc_claimAutoreleasedReturnValue();
              v211 = v186;
              *((_QWORD *)&v228 + 1) = CFSTR("clientId");
              objc_msgSend(v82, "clientIdentifier");
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v183, "_pas_stringBackedByUTF8CString");
              v180 = (void *)objc_claimAutoreleasedReturnValue();
              v212 = v180;
              *(_QWORD *)&v229 = CFSTR("domain");
              +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", 2);
              v177 = (void *)objc_claimAutoreleasedReturnValue();
              v213 = v177;
              *((_QWORD *)&v229 + 1) = CFSTR("category");
              v91 = (void *)MEMORY[0x1E0D70B78];
              objc_msgSend(v90, "location");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "describeCategory:", objc_msgSend(v92, "category"));
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v214 = v93;
              *(_QWORD *)&v230 = CFSTR("feedbackType");
              +[PPMetricsUtils stringifyFeedbackType:](PPMetricsUtils, "stringifyFeedbackType:", v80);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v215 = v94;
              *((_QWORD *)&v230 + 1) = CFSTR("feedbackTypeEnum");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v80);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              v216 = v95;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v227, 8);
              v96 = objc_claimAutoreleasedReturnValue();

              v7 = v157;
              v8 = v164;

              objc_autoreleasePoolPop(contextb);
              +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FeedbackAttributed"), v96, 1);
              goto LABEL_31;
            }
          }
          else
          {
            pp_private_log_handle();
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v171;
              _os_log_debug_impl(&dword_1C392E000, v96, OS_LOG_TYPE_DEBUG, "PPFeedbackStorage: unable to attribute feedback for location: %@", (uint8_t *)&buf, 0xCu);
            }
LABEL_31:

          }
          v5 = v162;
        }

LABEL_39:
        v39 = v171;

        v9 = 0x1E0CB3000;
        v10 = CFSTR("clientId");
        i = v174;
LABEL_40:

        v13 = v173;
LABEL_41:
        objc_autoreleasePoolPop(v13);
      }
      v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v206, v217, 16);
      if (!v170)
      {
LABEL_43:

        break;
      }
    }
  }

  objc_msgSend(v7, "feedbackItems");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v103, "mutableCopy");

  v105 = v104;
  objc_opt_self();
  v106 = (void *)objc_opt_new();
  v227 = 0u;
  v228 = 0u;
  v229 = 0u;
  v230 = 0u;
  v107 = v105;
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v227, v217, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v228;
    do
    {
      for (j = 0; j != v109; ++j)
      {
        if (*(_QWORD *)v228 != v110)
          objc_enumerationMutation(v107);
        v112 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * j);
        if (objc_msgSend(v112, "itemFeedbackType") == 5)
        {
          objc_msgSend(v112, "itemString");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "addObject:", v113);

        }
      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v227, v217, 16);
    }
    while (v109);
  }

  v114 = objc_msgSend(v107, "count");
  if (v114 - 1 >= 0)
  {
    v115 = v114;
    do
    {
      --v115;
      v116 = (void *)MEMORY[0x1C3BD6630]();
      objc_msgSend(v107, "objectAtIndexedSubscript:", v115);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v117, "itemFeedbackType");
      if ((v118 - 1) >= 4)
      {
        if (v118 == 5)
        {
          objc_msgSend(v107, "removeObjectAtIndex:", v115);
          goto LABEL_58;
        }
        pp_default_log_handle();
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          v120 = objc_msgSend(v117, "itemFeedbackType");
          LODWORD(buf) = 67109120;
          DWORD1(buf) = v120;
          _os_log_error_impl(&dword_1C392E000, v119, OS_LOG_TYPE_ERROR, "invalid feedbackType: %u", (uint8_t *)&buf, 8u);
        }
      }
      else
      {
        objc_msgSend(v117, "itemString");
        v119 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "removeObject:", v119);
      }

LABEL_58:
      objc_autoreleasePoolPop(v116);
    }
    while (v115 > 0);
  }
  v208 = 0u;
  v209 = 0u;
  v206 = 0u;
  v207 = 0u;
  v121 = v106;
  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v206, &buf, 16);
  if (v122)
  {
    v123 = v122;
    v124 = *(_QWORD *)v207;
    do
    {
      for (k = 0; k != v123; ++k)
      {
        if (*(_QWORD *)v207 != v124)
          objc_enumerationMutation(v121);
        v126 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70B60]), "initWithItemString:itemFeedbackType:", *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * k), 4);
        objc_msgSend(v107, "addObject:", v126);

      }
      v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v206, &buf, 16);
    }
    while (v123);
  }

  v127 = [PPInternalFeedback alloc];
  objc_msgSend(v7, "timestamp");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientBundleId");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mappingId");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = objc_msgSend(v7, "storeType");
  objc_msgSend(v7, "build");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = -[PPInternalFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:](v127, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:storeType:build:", v107, v128, v129, v130, v131, v132, v133);

  v135 = *(_QWORD *)(v156 + 32);
  v136 = v134;
  if (v135)
  {
    objc_msgSend((id)objc_opt_class(), "storeTypeDescription:", -[PPInternalFeedback storeType](v136, "storeType"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    pp_default_log_handle();
    v138 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
    {
      -[PPBaseFeedback feedbackItems](v136, "feedbackItems");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "count");
      *(_DWORD *)v217 = 138412546;
      v218 = v137;
      v219 = 2048;
      v220 = v140;
      _os_log_impl(&dword_1C392E000, v138, OS_LOG_TYPE_DEFAULT, "filterPendingFeedbackItems(%@): Filtering %tu pending items", v217, 0x16u);

    }
    pp_default_log_handle();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
    {
      -[PPBaseFeedback timestamp](v136, "timestamp");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPBaseFeedback clientIdentifier](v136, "clientIdentifier");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPBaseFeedback clientBundleId](v136, "clientBundleId");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPBaseFeedback mappingId](v136, "mappingId");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v217 = 138413314;
      v218 = v137;
      v219 = 2112;
      v220 = (uint64_t)v142;
      v221 = 2112;
      v222 = v143;
      v223 = 2112;
      v224 = v144;
      v225 = 2112;
      v226 = v145;
      _os_log_impl(&dword_1C392E000, v141, OS_LOG_TYPE_INFO, "filterPendingFeedbackItems(%@): Filtering items for (%@, %@, %@, %@)", v217, 0x34u);

      v7 = v157;
    }

    -[PPBaseFeedback feedbackItems](v136, "feedbackItems");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v146, "count");

    if (v147)
    {
      switch(-[PPInternalFeedback storeType](v136, "storeType"))
      {
        case 1u:
          -[PPFeedbackStorage namedEntityStore](v135);
          v148 = objc_claimAutoreleasedReturnValue();
          goto LABEL_92;
        case 2u:
          -[PPFeedbackStorage topicStore](v135);
          v148 = objc_claimAutoreleasedReturnValue();
          goto LABEL_92;
        case 3u:
          -[PPFeedbackStorage locationStore](v135);
          v148 = objc_claimAutoreleasedReturnValue();
          goto LABEL_92;
        case 4u:
          pp_default_log_handle();
          v149 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
            goto LABEL_86;
          break;
        case 5u:
          pp_default_log_handle();
          v149 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
          {
LABEL_86:
            objc_msgSend((id)objc_opt_class(), "storeTypeDescription:", -[PPInternalFeedback storeType](v136, "storeType"));
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v217 = 138412290;
            v218 = v151;
            _os_log_error_impl(&dword_1C392E000, v149, OS_LOG_TYPE_ERROR, "found pending items for unsupported PPStoreType value of %@", v217, 0xCu);

          }
          break;
        case 6u:
          v152 = *(void **)(v135 + 64);
          if (v152)
            goto LABEL_90;
          +[PPLocalConnectionsStore defaultStore](PPLocalConnectionsStore, "defaultStore");
          v148 = objc_claimAutoreleasedReturnValue();
          goto LABEL_92;
        case 7u:
          v152 = *(void **)(v135 + 40);
          if (v152)
          {
LABEL_90:
            v148 = v152;
          }
          else
          {
            +[PPLocalQuickTypeBroker sharedInstance](PPLocalQuickTypeBroker, "sharedInstance");
            v148 = objc_claimAutoreleasedReturnValue();
          }
LABEL_92:
          v149 = v148;
          -[NSObject processFeedback:](v148, "processFeedback:", v136);
          break;
        default:
          pp_default_log_handle();
          v149 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v149, OS_LOG_TYPE_FAULT))
          {
            v150 = -[PPInternalFeedback storeType](v136, "storeType");
            *(_DWORD *)v217 = 67109120;
            LODWORD(v218) = v150;
            _os_log_fault_impl(&dword_1C392E000, v149, OS_LOG_TYPE_FAULT, "found pending items for invalid PPStoreType value of %u", v217, 8u);
          }
          break;
      }

    }
  }

  v153 = (*(uint64_t (**)(void))(*(_QWORD *)(v156 + 40) + 16))();
  objc_autoreleasePoolPop(v155);

  return v153;
}

- (id)namedEntityStore
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
    return v1;
  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)topicStore
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    return v1;
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)locationStore
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    return v1;
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __101__PPFeedbackStorage__performAttributionForMappedTopic_baseFeedback_feedbackType_shouldContinueBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(uint64_t (**)(uint64_t))(v5 + 16);
  v7 = a2;
  if ((v6(v5) & 1) == 0)
    *a3 = 1;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v7, "topic");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topicIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

id __101__PPFeedbackStorage__performAttributionForMappedTopic_baseFeedback_feedbackType_shouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  uint64_t v5;

  v2 = (objc_class *)MEMORY[0x1E0CB3940];
  v3 = a2;
  v4 = [v2 alloc];
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return (id)objc_msgSend(v4, "initWithFormat:", CFSTR("Q%tu"), v5);
}

uint64_t __49__PPFeedbackStorage__saveLastProcessedTimestamp___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (v2)
    return +[PPSQLKVStore setNumber:forKey:transaction:](PPSQLKVStore, "setNumber:forKey:transaction:", v2, CFSTR("pendingFeedbackProcessedDate"), a2);
  return result;
}

void __44__PPFeedbackStorage__lastProcessedTimestamp__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  +[PPSQLKVStore numberForKey:transaction:](PPSQLKVStore, "numberForKey:transaction:", CFSTR("pendingFeedbackProcessedDate"), a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "publisherFromStartTime:", 0.0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eventBody");
}

BOOL __72__PPFeedbackStorage_mappedTopicsPendingFeedbackWithShouldContinueBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMapped"))
  {
    objc_msgSend(v2, "eventBody");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "storeType") == 2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke_2;
  v4[3] = &unk_1E7E1CCA8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a2, "pruneExpiredEventsWithBlock:", v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;

}

void __66__PPFeedbackStorage_deleteExpiredFeedbackWithShouldContinueBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
    *a2 = 1;
  pp_default_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_debug_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEBUG, "PPFeedbackStorage: deleted feedback from %lf", (uint8_t *)&v6, 0xCu);
  }

}

void __58__PPFeedbackStorage_storePendingFeedback_storeType_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendEvent:", *(_QWORD *)(a1 + 32));

  objc_autoreleasePoolPop(v3);
}

void __44__PPFeedbackStorage__removeExistingSession___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PPFeedbackStorage__removeExistingSession___block_invoke_2;
  v6[3] = &unk_1E7E1CBA0;
  v9 = *(_QWORD *)(a1 + 48);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(a2, "pruneWithPredicateBlock:", v6);

}

uint64_t __44__PPFeedbackStorage__removeExistingSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = a2;
  objc_msgSend(v3, "timestamp");
  if (v4 >= *(double *)(a1 + 48))
  {
    objc_msgSend(v3, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v7 + 24))
      v8 = v5;
    else
      v8 = 0;
    *(_BYTE *)(v7 + 24) = v8;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  char v11;

  v3 = a2;
  objc_msgSend(v3, "publisherFromStartTime:", CFAbsoluteTimeGetCurrent() + -30.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_2;
  v9[3] = &unk_1E7E1CBF0;
  v10 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v4, "filterWithIsIncluded:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_80;
  v8[3] = &unk_1E7E1CC58;
  v8[4] = *(_QWORD *)(a1 + 40);
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_17917, v8);

}

uint64_t __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mappingId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mappingId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend(v3, "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mappingId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mappingId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  objc_msgSend(v3, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "storeType") == *(unsigned __int8 *)(a1 + 40))
  {
    objc_msgSend(v3, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isEqual:", v14))
    {
      objc_msgSend(v3, "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientBundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "clientBundleId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17) & v10;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_80(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __64__PPFeedbackStorage__existingSessionMatchingFeedback_storeType___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    pp_default_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "PPFeedbackStorage: error processing sessions, starting a new one. %@", (uint8_t *)&v5, 0xCu);

    }
  }

}

+ (void)logFeedback:(id)a3 domain:(unsigned __int8)a4 domainStatus:(unsigned __int8)a5 inBackground:(BOOL)a6
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  void *v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  _BOOL4 v36;
  void *context;
  void *contexta;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _BYTE v47[128];
  uint64_t v48;

  v35 = a4;
  v36 = a6;
  v34 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("ICLex"));

  if (v8)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v6, "feedbackItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (context)
    {
      v32 = *(_QWORD *)v40;
      v33 = v6;
      obj = v9;
      do
      {
        for (i = 0; i != context; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v32)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v12 = (void *)MEMORY[0x1C3BD6630]();
          v13 = (void *)MEMORY[0x1C3BD6630]();
          v45[0] = CFSTR("clientId");
          objc_msgSend(v33, "clientIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_pas_stringBackedByUTF8CString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v46[0] = v15;
          v45[1] = CFSTR("mappingId");
          objc_msgSend(v33, "mappingId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16)
          {
            v31 = (void *)objc_opt_new();
            v17 = v31;
          }
          v46[1] = v17;
          v45[2] = CFSTR("type");
          +[PPMetricsUtils stringifyFeedbackType:](PPMetricsUtils, "stringifyFeedbackType:", objc_msgSend(v11, "itemFeedbackType"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v46[2] = v18;
          v45[3] = CFSTR("feedbackDomainStatus");
          +[PPMetricsUtils stringifyFeedbackDomainStatus:](PPMetricsUtils, "stringifyFeedbackDomainStatus:", v34);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v46[3] = v19;
          v45[4] = CFSTR("domain");
          +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v35);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v46[4] = v20;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 5);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          objc_autoreleasePoolPop(v13);
          +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FeedbackReceived"), v21, v36);

          objc_autoreleasePoolPop(v12);
        }
        v9 = obj;
        context = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (context);
      v6 = v33;
    }
  }
  else
  {
    contexta = (void *)MEMORY[0x1C3BD6630]();
    v43[0] = CFSTR("clientId");
    objc_msgSend(v6, "clientIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v22;
    v43[1] = CFSTR("mappingId");
    objc_msgSend(v6, "mappingId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
      v24 = (void *)objc_opt_new();
    v44[1] = v24;
    v43[2] = CFSTR("type");
    objc_msgSend(v6, "feedbackItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPMetricsUtils stringifyFeedbackType:](PPMetricsUtils, "stringifyFeedbackType:", objc_msgSend(v26, "itemFeedbackType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v27;
    v43[3] = CFSTR("feedbackDomainStatus");
    +[PPMetricsUtils stringifyFeedbackDomainStatus:](PPMetricsUtils, "stringifyFeedbackDomainStatus:", v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v28;
    v43[4] = CFSTR("domain");
    +[PPMetricsUtils stringifyDomain:](PPMetricsUtils, "stringifyDomain:", v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v44[4] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    objc_autoreleasePoolPop(contexta);
    +[PPMetricsDispatcher logPayloadForEvent:payload:inBackground:](PPMetricsDispatcher, "logPayloadForEvent:payload:inBackground:", CFSTR("com.apple.proactive.PersonalizationPortrait.FeedbackReceived"), v9, v36);
  }

}

+ (id)storeTypeDescription:(unsigned __int8)a3
{
  __CFString *v3;

  if (a3 >= 8u)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INVALID_VALUE_OF_%u"), a3);
  else
    v3 = off_1E7E1CF28[a3];
  return v3;
}

@end
