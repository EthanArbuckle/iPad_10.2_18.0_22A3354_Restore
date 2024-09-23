@implementation PLCloudPersistentHistoryTransactionsResult

- (PLCloudPersistentHistoryTransactionsResult)initWithSuccesfulTransactionIterator:(id)a3
{
  id v5;
  PLCloudPersistentHistoryTransactionsResult *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPersistentHistoryTransactionsResult.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iterator != nil"));

  }
  v6 = -[PLCloudPersistentHistoryTransactionsResult initWithResultType:transactionIterator:](self, "initWithResultType:transactionIterator:", 0, v5);

  return v6;
}

- (PLCloudPersistentHistoryTransactionsResult)initWithUnsuccessfulResultType:(int64_t)a3
{
  void *v7;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPersistentHistoryTransactionsResult.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultType != PLCloudChangeEventsResultSuccess"));

  }
  return -[PLCloudPersistentHistoryTransactionsResult initWithResultType:transactionIterator:](self, "initWithResultType:transactionIterator:", a3, 0);
}

- (PLCloudPersistentHistoryTransactionsResult)initWithResultType:(int64_t)a3 transactionIterator:(id)a4
{
  id v7;
  PLCloudPersistentHistoryTransactionsResult *v8;
  PLCloudPersistentHistoryTransactionsResult *v9;
  NSPersistentHistoryToken *lastProcessedCoreDataToken;
  PLCloudPersistentHistoryTransactionsResult *v11;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PLCloudPersistentHistoryTransactionsResult;
  v8 = -[PLCloudPersistentHistoryTransactionsResult init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_resultType = a3;
    objc_storeStrong((id *)&v8->_transactionIterator, a4);
    lastProcessedCoreDataToken = v9->_lastProcessedCoreDataToken;
    v9->_lastProcessedCoreDataToken = 0;

    v11 = v9;
  }

  return v9;
}

- (void)enumerateLocalEventsWithBlock:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_resultType)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPersistentHistoryTransactionsResult.m"), 87, CFSTR("Can only enumerate succesful results"));

  }
  -[PLCloudPersistentHistoryTransactionsResult _nextLocalEventUpToNonCoalescableTransaction](self, "_nextLocalEventUpToNonCoalescableTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    do
    {
      v6 = (void *)MEMORY[0x19AEC1554]();
      -[PLCloudPersistentHistoryTransactionsResult _sendLocalEvent:toEnumerationBlock:](self, "_sendLocalEvent:toEnumerationBlock:", v5, v9);
      -[PLCloudPersistentHistoryTransactionsResult _nextLocalEventUpToNonCoalescableTransaction](self, "_nextLocalEventUpToNonCoalescableTransaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v6);
      v5 = v7;
    }
    while (objc_msgSend(v7, "count"));
  }
  else
  {
    v7 = v5;
  }
  -[PLCloudPersistentHistoryTransactionsResult _updateLastProcessedCoreDataToken](self, "_updateLastProcessedCoreDataToken");

}

- (void)_sendLocalEvent:(id)a3 toEnumerationBlock:(id)a4
{
  id v5;
  void (**v6)(id, id, _BYTE *);
  NSObject *v7;
  void *v8;
  NSObject *v9;
  char v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, id, _BYTE *))a4;
  if (objc_msgSend(v5, "count"))
  {
    v10 = 0;
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "_pl_prettyDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v12 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Enumerating local event: %@", buf, 0xCu);

      }
    }
    v6[2](v6, v5, &v10);
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Not enumerating empty local event", buf, 2u);
    }

  }
}

- (id)_nextLocalEventUpToNonCoalescableTransaction
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __90__PLCloudPersistentHistoryTransactionsResult__nextLocalEventUpToNonCoalescableTransaction__block_invoke;
  v3[3] = &unk_1E366D710;
  v3[4] = self;
  +[PLLocalChangeEventBuilder localEventWithBuilderBlock:](PLLocalChangeEventBuilder, "localEventWithBuilderBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateLastProcessedCoreDataToken
{
  void *v3;
  NSPersistentHistoryToken **p_lastProcessedCoreDataToken;
  NSObject *v5;
  NSPersistentHistoryToken *v6;
  int v7;
  NSPersistentHistoryToken *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLPersistentHistoryTransactionIterator lastIteratedToken](self->_transactionIterator, "lastIteratedToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    p_lastProcessedCoreDataToken = &self->_lastProcessedCoreDataToken;
    objc_storeStrong((id *)&self->_lastProcessedCoreDataToken, v3);
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v6 = *p_lastProcessedCoreDataToken;
        v7 = 138412290;
        v8 = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Setting _lastProcessedCoreDataToken to: %@", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

- (int64_t)resultType
{
  return self->_resultType;
}

- (NSString)currentTokenDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSPersistentHistoryToken)lastProcessedCoreDataToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedCoreDataToken, 0);
  objc_storeStrong((id *)&self->_currentTokenDescription, 0);
  objc_storeStrong(&self->_isTransactionSyncableFilter, 0);
  objc_storeStrong((id *)&self->_transactionIterator, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

void __90__PLCloudPersistentHistoryTransactionsResult__nextLocalEventUpToNonCoalescableTransaction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "_isTransactionSyncableFilter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTransactionFilter:", v4);

  objc_msgSend((id)objc_opt_class(), "_coalescingLimitTest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordTransactionsFromIterator:untilTest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v5);

}

+ (id)fetchTransactionsSinceToken:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  PLCloudPersistentHistoryTransactionsResult *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  PLCloudPersistentHistoryTransactionsResult *v15;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0;
  +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", v5, v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  if (!v7)
  {
    if (PLIsErrorEqualToCode())
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v19 = (uint64_t)v5;
          v20 = 2114;
          v21 = v6;
          v13 = "Token was expired, sending back PLCloudChangeEventsResultHistoryTokenInvalid, token: %{public}@, context: %{public}@";
LABEL_15:
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (!PLIsErrorEqualToCode())
      {
        if (*MEMORY[0x1E0D115D0])
        {
          v14 = 1;
          goto LABEL_22;
        }
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v19 = (uint64_t)v5;
          v20 = 2112;
          v21 = v6;
          v22 = 2112;
          v23 = v8;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch transactions since token: %{public}@, context: %@, error: %@,", buf, 0x20u);
        }
        v14 = 1;
        goto LABEL_21;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v19 = (uint64_t)v5;
          v20 = 2114;
          v21 = v6;
          v13 = "Token is inconsistent (token passed to NSPersistentChangeRequest does not contain the store), sending ba"
                "ck PLCloudChangeEventsResultHistoryTokenInvalid, token: %{public}@, context: %{public}@";
          goto LABEL_15;
        }
LABEL_16:
        v14 = 2;
LABEL_21:

LABEL_22:
        v11 = -[PLCloudPersistentHistoryTransactionsResult initWithUnsuccessfulResultType:]([PLCloudPersistentHistoryTransactionsResult alloc], "initWithUnsuccessfulResultType:", v14);
        goto LABEL_23;
      }
    }
    v14 = 2;
    goto LABEL_22;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v19 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Sending back PLCloudChangeEventsResultSuccess with %lu transactions in an iterator", buf, 0xCu);
    }

  }
  v11 = -[PLCloudPersistentHistoryTransactionsResult initWithSuccesfulTransactionIterator:]([PLCloudPersistentHistoryTransactionsResult alloc], "initWithSuccesfulTransactionIterator:", v7);
LABEL_23:
  v15 = v11;

  return v15;
}

+ (id)_coalescingLimitTest
{
  PLPersistentHistoryTransactionModifiers *v2;
  PLPersistentHistoryTransactionModifiers *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  PLPersistentHistoryTransactionModifiers *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[4];
  _QWORD v12[4];

  v2 = objc_alloc_init(PLPersistentHistoryTransactionModifiers);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PLCloudPersistentHistoryTransactionsResult__coalescingLimitTest__block_invoke;
  v7[3] = &unk_1E3668968;
  v9 = v12;
  v10 = v11;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x19AEC174C](v7);
  v5 = (void *)MEMORY[0x19AEC174C]();

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v12, 8);
  return v5;
}

+ (int64_t)_transactionCoalescingLimit
{
  if (_transactionCoalescingLimit_sOnceToken != -1)
    dispatch_once(&_transactionCoalescingLimit_sOnceToken, &__block_literal_global_33608);
  return _transactionCoalescingLimit_sTransactionCoalescingLimit;
}

+ (int64_t)_changeCoalescingLimit
{
  if (_changeCoalescingLimit_sOnceToken != -1)
    dispatch_once(&_changeCoalescingLimit_sOnceToken, &__block_literal_global_19_33603);
  return _changeCoalescingLimit_sChangeCoalescingLimit;
}

+ (id)_isTransactionSyncableFilter
{
  PLPersistentHistoryTransactionModifiers *v2;
  PLPersistentHistoryTransactionModifiers *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  PLPersistentHistoryTransactionModifiers *v8;

  v2 = objc_alloc_init(PLPersistentHistoryTransactionModifiers);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PLCloudPersistentHistoryTransactionsResult__isTransactionSyncableFilter__block_invoke;
  v7[3] = &unk_1E36689D0;
  v8 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x19AEC174C](v7);
  v5 = (void *)MEMORY[0x19AEC174C]();

  return v5;
}

uint64_t __74__PLCloudPersistentHistoryTransactionsResult__isTransactionSyncableFilter__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "author");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFromTransactionAuthor:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "isSyncable");
}

void __68__PLCloudPersistentHistoryTransactionsResult__changeCoalescingLimit__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("PLCloudPersistentHistoryChangeCoalescingLimit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = 134218240;
        v4 = _changeCoalescingLimit_sChangeCoalescingLimit;
        v5 = 2048;
        v6 = objc_msgSend(v1, "integerValue");
        _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Overriding CPL change coalescing limit of %zd to %zd)", (uint8_t *)&v3, 0x16u);
      }

    }
    _changeCoalescingLimit_sChangeCoalescingLimit = objc_msgSend(v1, "integerValue");
  }

}

void __73__PLCloudPersistentHistoryTransactionsResult__transactionCoalescingLimit__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("PLCloudPersistentHistoryTransactionCoalescingLimit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = 134218240;
        v4 = _transactionCoalescingLimit_sTransactionCoalescingLimit;
        v5 = 2048;
        v6 = objc_msgSend(v1, "integerValue");
        _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Overriding CPL transaction coalescing limit of %zd to %zd", (uint8_t *)&v3, 0x16u);
      }

    }
    _transactionCoalescingLimit_sTransactionCoalescingLimit = objc_msgSend(v1, "integerValue");
  }

}

uint64_t __66__PLCloudPersistentHistoryTransactionsResult__coalescingLimitTest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(v3, "changes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218496;
      v23 = v6;
      v24 = 2048;
      v25 = v7;
      v26 = 2048;
      v27 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Checking coalescing limit: transaction count = %zd + 1, change count = %zd + %zd", (uint8_t *)&v22, 0x20u);

    }
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v3, "changes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v9, "count");

  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v10 >= +[PLCloudPersistentHistoryTransactionsResult _transactionCoalescingLimit](PLCloudPersistentHistoryTransactionsResult, "_transactionCoalescingLimit")|| (v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v11 >= +[PLCloudPersistentHistoryTransactionsResult _changeCoalescingLimit](PLCloudPersistentHistoryTransactionsResult, "_changeCoalescingLimit")))
  {
    if (!*v4)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v22 = 134218240;
        v23 = v18;
        v24 = 2048;
        v25 = v19;
        v15 = "Stopping history iteration due to coalescing limit: transaction count = %zd, change count = %zd";
        v16 = v14;
        v17 = 22;
        goto LABEL_14;
      }
LABEL_15:

    }
  }
  else
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v3, "author");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateFromTransactionAuthor:", v13);

    if (!objc_msgSend(*(id *)(a1 + 32), "nonCoalescing"))
    {
      v20 = 0;
      goto LABEL_17;
    }
    if (!*v4)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        v15 = "Stopping history iteration due non coalescing transaction modifier";
        v16 = v14;
        v17 = 2;
LABEL_14:
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v22, v17);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  v20 = 1;
LABEL_17:

  return v20;
}

@end
