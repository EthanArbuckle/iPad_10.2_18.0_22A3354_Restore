@implementation PLManagedObjectPagingIterator

- (PLManagedObjectPagingIterator)initWithEntityName:(id)a3 resultType:(unint64_t)a4 resumeObjectID:(id)a5 additionalPredicate:(id)a6
{
  return -[PLManagedObjectPagingIterator initWithEntityName:resultType:resumeObjectID:additionalPredicate:batchSize:propertiesToFetch:relationshipKeyPathsToPrefetch:](self, "initWithEntityName:resultType:resumeObjectID:additionalPredicate:batchSize:propertiesToFetch:relationshipKeyPathsToPrefetch:", a3, a4, a5, a6, 100, 0, 0);
}

- (PLManagedObjectPagingIterator)initWithEntityName:(id)a3 resultType:(unint64_t)a4 resumeObjectID:(id)a5 additionalPredicate:(id)a6 batchSize:(unint64_t)a7 propertiesToFetch:(id)a8 relationshipKeyPathsToPrefetch:(id)a9
{
  id v16;
  id v17;
  PLManagedObjectPagingIterator *v18;
  PLManagedObjectPagingIterator *v19;
  NSMutableArray *v20;
  NSMutableArray *lock_resultQueue;
  void *v23;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a5;
  v25 = a6;
  v16 = a8;
  v17 = a9;
  if (a4 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLManagedObjectPagingIterator.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultType == NSManagedObjectResultType || resultType == NSManagedObjectIDResultType"));

  }
  v28.receiver = self;
  v28.super_class = (Class)PLManagedObjectPagingIterator;
  v18 = -[PLManagedObjectPagingIterator init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_entityName, a3);
    v19->_resultType = a4;
    objc_storeStrong((id *)&v19->_lock_resumeObjectID, a5);
    objc_storeStrong((id *)&v19->_additionalPredicate, a6);
    v19->_batchSize = a7;
    objc_storeStrong((id *)&v19->_propertiesToFetch, a8);
    objc_storeStrong((id *)&v19->_relationshipKeyPathsToPrefetch, a9);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lock_resultQueue = v19->_lock_resultQueue;
    v19->_lock_resultQueue = v20;

    v19->_lock._os_unfair_lock_opaque = 0;
  }

  return v19;
}

- (BOOL)_lock_shouldFetchCountRemaining
{
  void *v3;
  double v4;
  double v5;
  BOOL result;

  result = !self->_lock_lastFetchCountTime
        || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
            v3 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v3, "timeIntervalSinceDate:", self->_lock_lastFetchCountTime),
            v5 = v4,
            v3,
            v5 > 300.0)
        || self->_lock_countRemaining == 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (id)_neverCallWithLock_refillResultQueueWithManagedObjectContext:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__65242;
  v15 = __Block_byref_object_dispose__65243;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_updateResumeObjectIDWithObject:(id)a3 progressCount:(unint64_t)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  PLSafeRunWithUnfairLock();

}

- (id)nextObjectWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if ((PLBoolResultWithUnfairLock() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (PLBoolResultWithUnfairLock())
    {
      -[PLManagedObjectPagingIterator _neverCallWithLock_refillResultQueueWithManagedObjectContext:](self, "_neverCallWithLock_refillResultQueueWithManagedObjectContext:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isFailure") & 1) != 0)
      {
        v7 = (void *)MEMORY[0x1E0D732B8];
        objc_msgSend(v6, "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "failureWithError:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_12;
      }
      else
      {

      }
    }
    PLResultWithUnfairLock();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectPagingIterator _updateResumeObjectIDWithObject:progressCount:](self, "_updateResumeObjectIDWithObject:progressCount:", v9, 1);
    }
    else
    {
      v5 = 0;
    }

  }
LABEL_12:

  return v5;
}

- (id)nextBatchWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((PLBoolResultWithUnfairLock() & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (PLBoolResultWithUnfairLock())
    {
      -[PLManagedObjectPagingIterator _neverCallWithLock_refillResultQueueWithManagedObjectContext:](self, "_neverCallWithLock_refillResultQueueWithManagedObjectContext:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isFailure") & 1) != 0)
      {
        v7 = (void *)MEMORY[0x1E0D732B8];
        objc_msgSend(v6, "error");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "failureWithError:", v8);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_12;
      }
      else
      {

      }
    }
    PLSafeResultWithUnfairLock();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLManagedObjectPagingIterator _updateResumeObjectIDWithObject:progressCount:](self, "_updateResumeObjectIDWithObject:progressCount:", v10, objc_msgSend(v9, "count"));

    }
    else
    {
      v5 = 0;
    }

  }
LABEL_12:

  return v5;
}

- (id)countRemainingWithManagedObjectContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD *);
  void *v14;
  PLManagedObjectPagingIterator *v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  void *v33;
  PLManagedObjectPagingIterator *v34;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke;
  v33 = &unk_1E3670EA0;
  v34 = self;
  if (PLBoolResultWithUnfairLock())
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", &unk_1E375FBB8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__65242;
    v24 = __Block_byref_object_dispose__65243;
    v25 = 0;
    -[PLManagedObjectPagingIterator resumeObjectID](self, "resumeObjectID");
    v11 = v5;
    v12 = 3221225472;
    v13 = __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke_21;
    v14 = &unk_1E366F518;
    v15 = self;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v18 = &v26;
    v17 = v4;
    v19 = &v20;
    objc_msgSend(v17, "performBlockAndWait:", &v11);
    v8 = (void *)MEMORY[0x1E0D732B8];
    if (v27[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v21[5], v11, v12, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11, v12, v13, v14, v15, v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "successWithResult:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
  }

  return v6;
}

- (NSManagedObjectID)resumeObjectID
{
  PLSafeResultWithUnfairLock();
  return (NSManagedObjectID *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)reset
{
  PLSafeRunWithUnfairLock();
}

- (NSString)entityName
{
  return self->_entityName;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (NSPredicate)additionalPredicate
{
  return self->_additionalPredicate;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (NSArray)propertiesToFetch
{
  return self->_propertiesToFetch;
}

- (NSArray)relationshipKeyPathsToPrefetch
{
  return self->_relationshipKeyPathsToPrefetch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipKeyPathsToPrefetch, 0);
  objc_storeStrong((id *)&self->_propertiesToFetch, 0);
  objc_storeStrong((id *)&self->_additionalPredicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_lock_resultQueue, 0);
  objc_storeStrong((id *)&self->_lock_lastFetchCountTime, 0);
  objc_storeStrong((id *)&self->_lock_resumeObjectID, 0);
}

uint64_t __38__PLManagedObjectPagingIterator_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return result;
}

id __47__PLManagedObjectPagingIterator_resumeObjectID__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 16);
}

uint64_t __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

void __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke_21(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id obj[6];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  obj[1] = (id)MEMORY[0x1E0C809B0];
  obj[2] = (id)3221225472;
  obj[3] = __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke_2;
  obj[4] = &unk_1E3670EA0;
  obj[5] = v2;
  if (PLBoolResultWithUnfairLock())
  {
    objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1[4] + 56));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3528];
    v5 = *(void **)(a1[4] + 72);
    v6 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = v6;
    if (a1[5])
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self < %@"), a1[5]);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "andPredicateWithSubpredicates:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPredicate:", v9);

    if (!v5)
    v10 = (void *)a1[6];
    v11 = *(_QWORD *)(a1[8] + 8);
    obj[0] = *(id *)(v11 + 40);
    v12 = objc_msgSend(v10, "countForFetchRequest:error:", v3, obj);
    objc_storeStrong((id *)(v11 + 40), obj[0]);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = v12;
    PLSafeRunWithUnfairLock();

  }
  else
  {
    PLSafeRunWithUnfairLock();
  }
}

uint64_t __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_shouldFetchCountRemaining");
}

void __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __72__PLManagedObjectPagingIterator_countRemainingWithManagedObjectContext___block_invoke_4(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __67__PLManagedObjectPagingIterator_nextBatchWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

BOOL __67__PLManagedObjectPagingIterator_nextBatchWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") == 0;
}

id __67__PLManagedObjectPagingIterator_nextBatchWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  return v2;
}

uint64_t __68__PLManagedObjectPagingIterator_nextObjectWithManagedObjectContext___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40);
}

BOOL __68__PLManagedObjectPagingIterator_nextObjectWithManagedObjectContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") == 0;
}

id __68__PLManagedObjectPagingIterator_nextObjectWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectAtIndex:", 0);
  return v2;
}

void __79__PLManagedObjectPagingIterator__updateResumeObjectIDWithObject_progressCount___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  void *v12;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[8];
  if (v3 == 1)
  {
    v7 = *(id *)(a1 + 40);
    v6 = (void *)v2[2];
    v2[2] = v7;
  }
  else
  {
    if (v3)
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 40), "objectID");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;
  }

  v2 = *(_QWORD **)(a1 + 32);
LABEL_6:
  v8 = *(_QWORD *)(a1 + 48);
  v9 = v2[3];
  v10 = v9 >= v8;
  v11 = v9 - v8;
  if (v10)
  {
    v2[3] = v11;
  }
  else
  {
    v12 = (void *)v2[4];
    v2[4] = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  }
}

void __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v2 = (void *)objc_opt_class();
  v3 = (_QWORD *)a1[4];
  v4 = a1[5];
  v5 = v3[7];
  v6 = v3[8];
  objc_msgSend(v3, "resumeObjectID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_nextBatchOfResultsWithManagedObjectContext:entityName:resultType:resumeObjectID:additionalPredicate:batchSize:propertiesToFetch:relationshipKeyPathsToPrefetch:", v4, v5, v6, v7, *(_QWORD *)(a1[4] + 72), *(_QWORD *)(a1[4] + 80), *(_QWORD *)(a1[4] + 88), *(_QWORD *)(a1[4] + 96));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isFailure"))
  {
    v9 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(v8, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "failureWithError:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    objc_msgSend(v8, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v21 = v8;
      PLSafeRunWithUnfairLock();

    }
    else
    {
      PLSafeRunWithUnfairLock();
    }
    v16 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "successWithResult:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = *(_QWORD *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

uint64_t __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

void __94__PLManagedObjectPagingIterator__neverCallWithLock_refillResultQueueWithManagedObjectContext___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(*(id *)(a1 + 40), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObjectsFromArray:", v2);

}

+ (id)_nextBatchOfResultsWithManagedObjectContext:(id)a3 entityName:(id)a4 resultType:(unint64_t)a5 resumeObjectID:(id)a6 additionalPredicate:(id)a7 batchSize:(unint64_t)a8 propertiesToFetch:(id)a9 relationshipKeyPathsToPrefetch:(id)a10
{
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v33;
  id v34;
  void *v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a7;
  v15 = (void *)MEMORY[0x1E0C97B48];
  v16 = a10;
  v17 = a9;
  v18 = a3;
  objc_msgSend(v15, "fetchRequestWithEntityName:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3528];
  v21 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[0] = v21;
  v33 = v13;
  if (v13)
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self < %@"), v13);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPredicate:", v24);

  if (!v14)
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSortDescriptors:", v26);

  objc_msgSend(v19, "setFetchLimit:", a8);
  objc_msgSend(v19, "setResultType:", a5);
  objc_msgSend(v19, "setIncludesPendingChanges:", 0);
  objc_msgSend(v19, "setPropertiesToFetch:", v17);

  objc_msgSend(v19, "setRelationshipKeyPathsForPrefetching:", v16);
  v34 = 0;
  objc_msgSend(v18, "executeFetchRequest:error:", v19, &v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v34;
  if (v27)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v27);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

@end
