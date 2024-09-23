@implementation PBFComplicationSnapshotService

- (PBFComplicationSnapshotService)init
{
  PBFComplicationSnapshotService *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  uint64_t v5;
  NSMapTable *lock_requestToSnapshotReceivedHandlers;
  uint64_t v7;
  NSMapTable *lock_requestToSnapshotErrorHandlers;
  uint64_t v9;
  NSMapTable *lock_requestToResult;
  uint64_t v11;
  OS_dispatch_queue *callbackQueue;
  uint64_t v13;
  BSAtomicSignal *invalidationFlag;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PBFComplicationSnapshotService;
  v2 = -[PBFComplicationSnapshotService init](&v16, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("ComplicationSnapshotQueue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 3);
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    lock_requestToSnapshotReceivedHandlers = v2->_lock_requestToSnapshotReceivedHandlers;
    v2->_lock_requestToSnapshotReceivedHandlers = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    lock_requestToSnapshotErrorHandlers = v2->_lock_requestToSnapshotErrorHandlers;
    v2->_lock_requestToSnapshotErrorHandlers = (NSMapTable *)v7;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v9 = objc_claimAutoreleasedReturnValue();
    lock_requestToResult = v2->_lock_requestToResult;
    v2->_lock_requestToResult = (NSMapTable *)v9;

    objc_msgSend(MEMORY[0x1E0D7F8F0], "sharedWorkloop");
    v11 = objc_claimAutoreleasedReturnValue();
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicSignal *)v13;

  }
  return v2;
}

- (id)preparedComplicationSnapshotsForRequests:(id)a3
{
  id v4;
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
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    if (-[BSAtomicSignal hasBeenSignalled](self->_invalidationFlag, "hasBeenSignalled"))
    {
      v5 = (void *)objc_opt_new();
    }
    else
    {
      os_unfair_lock_lock(&self->_lock);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
      {
        v8 = v7;
        v5 = 0;
        v9 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v15 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
            -[PBFComplicationSnapshotService _lock_preparedComplicationSnapshotForRequest:](self, "_lock_preparedComplicationSnapshotForRequest:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
            {
              if (!v5)
              {
                objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v5, "setObject:forKey:", v12, v11);
            }

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v8);
      }
      else
      {
        v5 = 0;
      }

      os_unfair_lock_unlock(&self->_lock);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_lock_preparedComplicationSnapshotForRequest:(id)a3
{
  void *v3;
  void *v4;

  -[NSMapTable objectForKey:](self->_lock_requestToResult, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "snapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)fetchComplicationSnapshotsForRequests:(id)a3 complicationSnapshotReceivedHandler:(id)a4 errorHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void (**v16)(void *, _QWORD, void *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PBFComplicationSnapshotter *v23;
  void *v24;
  int v25;
  PBFComplicationSnapshotterOperation *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void (**v35)(void *, _QWORD, void *);
  void *v36;
  id obj;
  uint64_t v38;
  dispatch_group_t group;
  _QWORD block[4];
  id v41;
  id v42;
  id location;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  dispatch_group_t v51;
  id v52;
  _QWORD aBlock[4];
  NSObject *v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v10 = a4;
  v34 = a5;
  v11 = a6;
  v32 = v10;
  if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidationFlag, "hasBeenSignalled"))
  {
    v31 = v11;
    v13 = (void *)objc_opt_new();
    v14 = dispatch_group_create();
    dispatch_group_enter(v14);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke;
    aBlock[3] = &unk_1E86F3F10;
    v55 = v10;
    v15 = v14;
    v54 = v15;
    v16 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_2;
    v49[3] = &unk_1E86F3F38;
    v30 = v13;
    v50 = v30;
    v52 = v34;
    group = v15;
    v51 = group;
    v35 = (void (**)(void *, _QWORD, void *))_Block_copy(v49);
    os_unfair_lock_lock(&self->_lock);
    -[NSOperationQueue operations](self->_operationQueue, "operations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v33;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    if (!v17)
      goto LABEL_23;
    v38 = *(_QWORD *)v46;
    while (1)
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v18);
        dispatch_group_enter(group);
        -[PBFComplicationSnapshotService _lock_preparedComplicationSnapshotForRequest:](self, "_lock_preparedComplicationSnapshotForRequest:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v16[2](v16, v19, v20);
          goto LABEL_19;
        }
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_3;
        v44[3] = &unk_1E86F3F60;
        v44[4] = v19;
        objc_msgSend(v36, "bs_firstObjectPassingTest:", v44);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          objc_msgSend(v21, "snapshotter");
          v23 = (PBFComplicationSnapshotter *)objc_claimAutoreleasedReturnValue();
          -[PBFComplicationSnapshotter snapshotError](v23, "snapshotError");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v22, "isFinished");
          if (v24)
          {
            v35[2](v35, v19, v24);
          }
          else
          {
            if (!v25)
            {
              -[PBFComplicationSnapshotService _lock_appendReceivedBlock:forRequest:](self, "_lock_appendReceivedBlock:forRequest:", v16, v19);
              -[PBFComplicationSnapshotService _lock_appendErrorBlock:forRequest:](self, "_lock_appendErrorBlock:forRequest:", v35, v19);
              goto LABEL_18;
            }
            -[PBFComplicationSnapshotter snapshot](v23, "snapshot");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v16[2](v16, v19, v27);

          }
        }
        else
        {
          v23 = -[PBFComplicationSnapshotter initWithComplicationSnapshotRequest:]([PBFComplicationSnapshotter alloc], "initWithComplicationSnapshotRequest:", v19);
          location = 0;
          v26 = -[PBFComplicationSnapshotterOperation initWithRequest:snapshotter:]([PBFComplicationSnapshotterOperation alloc], "initWithRequest:snapshotter:", v19, v23);
          objc_storeWeak(&location, v26);
          -[PBFComplicationSnapshotService _lock_appendReceivedBlock:forRequest:](self, "_lock_appendReceivedBlock:forRequest:", v16, v19);
          -[PBFComplicationSnapshotService _lock_appendErrorBlock:forRequest:](self, "_lock_appendErrorBlock:forRequest:", v35, v19);
          -[PBFComplicationSnapshotter addObserver:](v23, "addObserver:", self);
          -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v26);

          objc_destroyWeak(&location);
        }
LABEL_18:

LABEL_19:
        ++v18;
      }
      while (v17 != v18);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
      v17 = v28;
      if (!v28)
      {
LABEL_23:

        os_unfair_lock_unlock(&self->_lock);
        dispatch_group_leave(group);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_4;
        block[3] = &unk_1E86F2F98;
        v41 = v30;
        v42 = v31;
        v29 = v30;
        dispatch_group_notify(group, MEMORY[0x1E0C80D38], block);

        v11 = v31;
        goto LABEL_24;
      }
    }
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v12);

  }
LABEL_24:

}

void __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_sync_exit(v6);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __139__PBFComplicationSnapshotService_fetchComplicationSnapshotsForRequests_complicationSnapshotReceivedHandler_errorHandler_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = *(id *)(a1 + 32);
    objc_sync_enter(v2);
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v3 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F70];
      v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pbf_generalErrorWithCode:userInfo:", 10, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_sync_exit(v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)complicationSnapshotForRequest:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable objectForKey:](self->_lock_requestToResult, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v6, "snapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)trimCachedSnapshotsToRequests:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[PBFComplicationSnapshotService _lock_trimCachedSnapshotsToRequests:](self, "_lock_trimCachedSnapshotsToRequests:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_fireCompletionHandlersForRequest:(id)a3 snapshot:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  NSObject *callbackQueue;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  NSObject *v31;
  _PBFComplicationSnapshotResult *v32;
  void *v33;
  void *v34;
  os_unfair_lock_s *v35;
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD block[4];
  id v48;
  id v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v38 = a4;
  v37 = a5;
  v10 = v9;
  NSClassFromString(CFSTR("PBFComplicationSnapshotRequest"));
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotService _fireCompletionHandlersForRequest:snapshot:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v33), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA39340);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PBFComplicationSnapshotRequestClass]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PBFComplicationSnapshotService _fireCompletionHandlersForRequest:snapshot:error:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBA393A4);
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_requestToSnapshotErrorHandlers, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v37 && objc_msgSend(v12, "count"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v14 = (void *)objc_msgSend(v13, "copy");
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v52;
      v18 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v52 != v17)
            objc_enumerationMutation(v14);
          v20 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          callbackQueue = self->_callbackQueue;
          block[0] = v18;
          block[1] = 3221225472;
          block[2] = __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke;
          block[3] = &unk_1E86F2E08;
          v50 = v20;
          v48 = v10;
          v49 = v37;
          dispatch_async(callbackQueue, block);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v16);
    }

    p_lock = &self->_lock;
  }
  objc_msgSend(v13, "removeAllObjects");
  -[NSMapTable removeObjectForKey:](self->_lock_requestToSnapshotErrorHandlers, "removeObjectForKey:", v10);
  -[NSMapTable objectForKey:](self->_lock_requestToSnapshotReceivedHandlers, "objectForKey:", v10);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v38 && objc_msgSend(v22, "count"))
  {
    v35 = p_lock;
    v36 = v13;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = (void *)objc_msgSend(v23, "copy");
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v44;
      v28 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(v24);
          v30 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          v31 = self->_callbackQueue;
          v39[0] = v28;
          v39[1] = 3221225472;
          v39[2] = __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke_2;
          v39[3] = &unk_1E86F2E08;
          v42 = v30;
          v40 = v10;
          v41 = v38;
          dispatch_async(v31, v39);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v26);
    }

    p_lock = v35;
    v13 = v36;
  }
  objc_msgSend(v23, "removeAllObjects");
  -[NSMapTable removeObjectForKey:](self->_lock_requestToSnapshotReceivedHandlers, "removeObjectForKey:", v10);
  v32 = -[_PBFComplicationSnapshotResult initWithSnapshot:error:]([_PBFComplicationSnapshotResult alloc], "initWithSnapshot:error:", v38, v37);
  -[NSMapTable setObject:forKey:](self->_lock_requestToResult, "setObject:forKey:", v32, v10);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __83__PBFComplicationSnapshotService__fireCompletionHandlersForRequest_snapshot_error___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)complicationSnapshotter:(id)a3 didFinishWithSnapshot:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "request");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PBFComplicationSnapshotService _fireCompletionHandlersForRequest:snapshot:error:](self, "_fireCompletionHandlersForRequest:snapshot:error:", v10, v9, v8);

}

- (void)_lock_appendReceivedBlock:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[NSMapTable objectForKey:](self->_lock_requestToSnapshotReceivedHandlers, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      -[NSMapTable setObject:forKey:](self->_lock_requestToSnapshotReceivedHandlers, "setObject:forKey:", v7, v6);
    }
    v8 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)_lock_appendErrorBlock:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    -[NSMapTable objectForKey:](self->_lock_requestToSnapshotErrorHandlers, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      -[NSMapTable setObject:forKey:](self->_lock_requestToSnapshotErrorHandlers, "setObject:forKey:", v7, v6);
    }
    v8 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (void)_lock_trimCachedSnapshotsToRequests:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  -[NSOperationQueue operations](self->_operationQueue, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v48 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v10, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "containsObject:", v11);

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v10, "snapshotter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "invalidate");

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v7);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v14 = (void *)-[NSMapTable copy](self->_lock_requestToResult, "copy");
  objc_msgSend(v14, "keyEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v44 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        if ((objc_msgSend(v4, "containsObject:", v20) & 1) == 0)
          -[NSMapTable removeObjectForKey:](self->_lock_requestToResult, "removeObjectForKey:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v17);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = (void *)-[NSMapTable copy](self->_lock_requestToSnapshotReceivedHandlers, "copy");
  objc_msgSend(v21, "keyEnumerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v40 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k);
        if ((objc_msgSend(v4, "containsObject:", v27) & 1) == 0)
          -[NSMapTable removeObjectForKey:](self->_lock_requestToSnapshotReceivedHandlers, "removeObjectForKey:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    }
    while (v24);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = (void *)-[NSMapTable copy](self->_lock_requestToSnapshotErrorHandlers, "copy", 0);
  objc_msgSend(v28, "keyEnumerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v36;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v36 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * m);
        if ((objc_msgSend(v4, "containsObject:", v34) & 1) == 0)
          -[NSMapTable removeObjectForKey:](self->_lock_requestToSnapshotErrorHandlers, "removeObjectForKey:", v34);
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
    }
    while (v31);
  }

}

- (void)invalidate
{
  PBFComplicationSnapshotService *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_unfair_lock_s *lock;
  id obj;
  uint64_t v23;
  PBFComplicationSnapshotService *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD aBlock[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v2 = self;
  v43 = *MEMORY[0x1E0C80C00];
  if (-[BSAtomicSignal signal](self->_invalidationFlag, "signal"))
  {
    lock = &v2->_lock;
    os_unfair_lock_lock(&v2->_lock);
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[NSMapTable keyEnumerator](v2->_lock_requestToSnapshotErrorHandlers, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    v3 = 0;
    if (v25)
    {
      v23 = *(_QWORD *)v37;
      v4 = MEMORY[0x1E0C809B0];
      v24 = v2;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v37 != v23)
            objc_enumerationMutation(obj);
          v26 = v5;
          v6 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v5);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          -[NSMapTable objectForKey:](v2->_lock_requestToSnapshotErrorHandlers, "objectForKey:", v6, lock);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v33;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v33 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v11);
                if (!v3)
                  v3 = (void *)objc_opt_new();
                aBlock[0] = v4;
                aBlock[1] = 3221225472;
                aBlock[2] = __44__PBFComplicationSnapshotService_invalidate__block_invoke;
                aBlock[3] = &unk_1E86F2F98;
                aBlock[4] = v6;
                aBlock[5] = v12;
                v13 = _Block_copy(aBlock);
                objc_msgSend(v3, "addObject:", v13);

                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
            }
            while (v9);
          }

          v5 = v26 + 1;
          v2 = v24;
        }
        while (v26 + 1 != v25);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v25);
    }

    -[NSOperationQueue operations](v2->_operationQueue, "operations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", &__block_literal_global_2);

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFComplicationSnapshotService _lock_trimCachedSnapshotsToRequests:](v2, "_lock_trimCachedSnapshotsToRequests:", v15);

    os_unfair_lock_unlock(lock);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = v3;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          dispatch_async((dispatch_queue_t)v2->_callbackQueue, *(dispatch_block_t *)(*((_QWORD *)&v27 + 1) + 8 * v20++));
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      }
      while (v18);
    }

  }
}

void __44__PBFComplicationSnapshotService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v1 + 16))(v1, v2, v3);

}

void __44__PBFComplicationSnapshotService_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "snapshotter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_lock_requestToResult, 0);
  objc_storeStrong((id *)&self->_lock_requestToSnapshotErrorHandlers, 0);
  objc_storeStrong((id *)&self->_lock_requestToSnapshotReceivedHandlers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

- (void)_fireCompletionHandlersForRequest:(const char *)a1 snapshot:error:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
