@implementation PLPersistentHistoryTransactionIterator

- (PLPersistentHistoryTransactionIterator)initWithTransactions:(id)a3 managedObjectObjectContext:(id)a4
{
  id v6;
  id v7;
  PLPersistentHistoryTransactionIterator *v8;
  PLPersistentHistoryTransactionIterator *v9;
  NSManagedObjectContext *context;
  PLPersistentHistoryTransactionIterator *v11;
  PLPersistentHistoryTransactionIterator *v12;
  _QWORD v14[4];
  PLPersistentHistoryTransactionIterator *v15;
  id v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLPersistentHistoryTransactionIterator;
  v8 = -[PLPersistentHistoryTransactionIterator init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_transactionIndex = 0;
    objc_storeStrong((id *)&v8->_context, a4);
    context = v9->_context;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90__PLPersistentHistoryTransactionIterator_initWithTransactions_managedObjectObjectContext___block_invoke;
    v14[3] = &unk_1E3677C18;
    v11 = v9;
    v15 = v11;
    v16 = v6;
    -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v14);
    v12 = v11;

  }
  return v9;
}

- (BOOL)hasMoreTransactions
{
  return self->_transactionIndex < self->_count;
}

- (void)enumerateRemainingTransactionsWithBlock:(id)a3
{
  void *v4;
  _BOOL4 v5;
  id v6;

  v6 = a3;
  do
  {
    if (!-[PLPersistentHistoryTransactionIterator hasMoreTransactions](self, "hasMoreTransactions"))
      break;
    v4 = (void *)MEMORY[0x19AEC1554]();
    v5 = -[PLPersistentHistoryTransactionIterator enumerateOneTransactionWithBlock:](self, "enumerateOneTransactionWithBlock:", v6);
    objc_autoreleasePoolPop(v4);
  }
  while (!v5);

}

- (BOOL)enumerateOneTransactionWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSManagedObjectContext *context;
  uint64_t v6;
  NSPersistentHistoryToken *v7;
  NSPersistentHistoryToken *lastIteratedToken;
  BOOL v9;
  char v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = (void (**)(id, uint64_t, char *))a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__24349;
  v23 = __Block_byref_object_dispose__24350;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__24349;
  v17 = __Block_byref_object_dispose__24350;
  v18 = 0;
  context = self->_context;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__PLPersistentHistoryTransactionIterator_enumerateOneTransactionWithBlock___block_invoke;
  v12[3] = &unk_1E3677830;
  v12[4] = self;
  v12[5] = &v19;
  v12[6] = &v13;
  -[NSManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v12);
  v6 = v20[5];
  if (v6)
  {
    v11 = 0;
    v4[2](v4, v6, &v11);
    v7 = (NSPersistentHistoryToken *)objc_msgSend((id)v14[5], "copy");
    lastIteratedToken = self->_lastIteratedToken;
    self->_lastIteratedToken = v7;

    v9 = v11 != 0;
  }
  else
  {
    v9 = 1;
  }
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (id)_safeTransactionAtIndex:(unint64_t)a3
{
  -[NSArray objectAtIndexedSubscript:](self->_transactions, "objectAtIndexedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)count
{
  return self->_count;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentHistoryToken)lastIteratedToken
{
  return self->_lastIteratedToken;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_lastIteratedToken, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
}

void __75__PLPersistentHistoryTransactionIterator_enumerateOneTransactionWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_safeTransactionAtIndex:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "token");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

uint64_t __90__PLPersistentHistoryTransactionIterator_initWithTransactions_managedObjectObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = result;
  return result;
}

+ (id)iteratorSinceToken:(id)a3 withManagedObjectObjectContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[PLPersistentHistoryMarker markerWithToken:](PLPersistentHistoryMarker, "markerWithToken:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iteratorSinceMarker:withFetchRequest:managedObjectObjectContext:error:", v9, 0, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)iteratorSinceMarker:(id)a3 withFetchRequest:(id)a4 managedObjectObjectContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a4;
  PLPersistentHistoryGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v22 = a1;
    v23 = 2114;
    v24 = v10;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching persistent history transactions since marker: %{public}@", buf, 0x16u);
  }

  +[PLPersistentHistoryUtilities fetchTransactionsSinceMarker:withFetchRequest:batchSize:context:error:](PLPersistentHistoryUtilities, "fetchTransactionsSinceMarker:withFetchRequest:batchSize:context:error:", v10, v12, 100, v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  PLPersistentHistoryGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __112__PLPersistentHistoryTransactionIterator_iteratorSinceMarker_withFetchRequest_managedObjectObjectContext_error___block_invoke;
    v18[3] = &unk_1E3674C18;
    v20 = a1;
    v19 = v14;
    objc_msgSend(v11, "performBlockAndWait:", v18);

  }
  if (v14)
    v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTransactions:managedObjectObjectContext:", v14, v11);
  else
    v16 = 0;

  return v16;
}

void __112__PLPersistentHistoryTransactionIterator_iteratorSinceMarker_withFetchRequest_managedObjectObjectContext_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPersistentHistoryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = 138543618;
    v6 = v3;
    v7 = 2050;
    v8 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: Fetched persistent history transaction count: %{public}lu", (uint8_t *)&v5, 0x16u);
  }

}

@end
