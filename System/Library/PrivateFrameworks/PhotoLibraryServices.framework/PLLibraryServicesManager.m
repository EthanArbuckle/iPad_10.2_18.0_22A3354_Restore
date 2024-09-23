@implementation PLLibraryServicesManager

- (BOOL)isSystemPhotoLibrary
{
  return -[PLLibraryServicesManager wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier") == 1;
}

- (int64_t)wellKnownPhotoLibraryIdentifier
{
  return self->_wellKnownPhotoLibraryIdentifier;
}

- (int64_t)state
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__PLLibraryServicesManager_state__block_invoke;
  v6[3] = &unk_1E3677C68;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__PLLibraryServicesManager_state__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_state");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __37__PLLibraryServicesManager_activate___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[57])
  {
    if (objc_msgSend(v2, "_state") == 99)
    {
      PLLibraryServicesGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "logPrefix");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        PLStringFromLibraryServicesState();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "invalidationError");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v17 = v4;
        v18 = 2112;
        v19 = v5;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Cannot activate state machine in error state (%@: %@)", buf, 0x20u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      if (*(_QWORD *)(a1 + 48))
      {
        v14 = CFSTR("currentState");
        PLStringFromLibraryServicesState();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = (void *)objc_opt_class();
        objc_msgSend(*(id *)(a1 + 32), "invalidationError", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorForInvalidationError:userInfo:", v10, v8);
        **(_QWORD **)(a1 + 48) = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  else
  {
    PLLibraryServicesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Activating state machine at current QoS: %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "setActive:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", objc_msgSend((id)objc_opt_class(), "_initialState"));
  }
}

void __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_state");
  if ((PLIsValidStateForMinimumStateRequirement() & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "isFinalizing")
    && (v2 = objc_msgSend(*(id *)(a1 + 32), "_state"), v2 == objc_msgSend((id)objc_opt_class(), "_finalState")))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dispatchAwaitLibraryStateCompletionHandler:group:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_state");
    if (!PLHasPathFromSourceStateToTargetState()
      || (objc_msgSend(*(id *)(a1 + 32), "_enqueueExternalWaiterCompletionBlockForState:completionBlock:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56)), objc_msgSend(*(id *)(a1 + 32), "_enqueueAwaitOperation"), v3 = objc_claimAutoreleasedReturnValue(), v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), v5 = *(void **)(v4 + 40), *(_QWORD *)(v4 + 40) = v3, v5, !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
  }
}

- (void)_awaitLibraryState:(int64_t)a3 sync:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v5;
  id v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  dispatch_block_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  NSObject *v24;
  id v25;
  id v26;
  uint64_t *v27;
  int64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD block[5];
  NSObject *v36;
  id v37;
  int64_t v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v5 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (a3 < 1)
    goto LABEL_4;
  v39 = 0;
  v9 = -[PLLibraryServicesManager activate:](self, "activate:", &v39);
  v10 = v39;
  v11 = v10;
  if (v9)
  {

LABEL_4:
    v12 = dispatch_group_create();
    dispatch_group_enter(v12);
    v13 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke;
    block[3] = &unk_1E3674E68;
    v14 = v8;
    v37 = v14;
    v38 = a3;
    block[4] = self;
    v15 = v12;
    v36 = v15;
    v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__40700;
    v33 = __Block_byref_object_dispose__40701;
    v34 = 0;
    -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke_2;
    v23[3] = &unk_1E3673BE0;
    v23[4] = self;
    v28 = a3;
    v25 = v14;
    v11 = v15;
    v24 = v11;
    v18 = v16;
    v26 = v18;
    v27 = &v29;
    dispatch_sync(v17, v23);

    if (v5)
    {
      -[PLLibraryServicesManager _waitForAwaitOperation:](self, "_waitForAwaitOperation:", v30[5]);
      PLLibraryServicesGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[PLLibraryServicesManager logPrefix](self, "logPrefix");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        PLStringFromLibraryServicesState();
        v21 = (id)objc_claimAutoreleasedReturnValue();
        qos_class_self();
        PLStringFromQoSClass();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v41 = v20;
        v42 = 2114;
        v43 = v21;
        v44 = 2114;
        v45 = v22;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting on dispatch_group for library state %{public}@ at QoS: %{public}@", buf, 0x20u);

      }
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    }

    _Block_object_dispose(&v29, 8);
    goto LABEL_11;
  }
  if (v8)
    (*((void (**)(id, _QWORD, NSObject *))v8 + 2))(v8, 0, v10);
LABEL_11:

}

- (int64_t)_state
{
  NSObject *v3;
  void *v4;
  int64_t v5;

  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  return v5;
}

- (OS_dispatch_queue)stateSerializationQueue
{
  return self->_stateSerializationQueue;
}

- (PLLibraryServicesStateNode)currentStateNode
{
  return self->_currentStateNode;
}

- (BOOL)activate:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  char v9;
  _QWORD block[7];
  _BYTE buf[24];
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLLibraryServicesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    qos_class_self();
    PLStringFromQoSClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: Received activate state machine at current QoS: %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v13 = 1;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PLLibraryServicesManager_activate___block_invoke;
  block[3] = &unk_1E3675800;
  block[4] = self;
  block[5] = buf;
  block[6] = a3;
  dispatch_sync(v8, block);

  v9 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v9;
}

- (NSString)logPrefix
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)_waitForAwaitOperation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    PLLibraryServicesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v6;
      v10 = 2114;
      v11 = v4;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Waiting for await operation to finish: %{public}@ at QoS: %{public}@", (uint8_t *)&v8, 0x20u);

    }
    objc_msgSend(v4, "waitUntilFinished");
  }

}

void __84__PLLibraryServicesManager__dispatchAwaitLibraryStateCompletionHandler_group_error___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __52__PLLibraryServicesManager_awaitLibraryState_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (id)libraryServicesManagerForLibraryURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLLibraryServicesManager.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookupOrCreateBundleForLibraryURL:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (Class)libraryServicesDelegateClass
{
  return (Class)(id)_libraryServicesDelegateClass;
}

- (PLSearchIndexManager)searchIndexManager
{
  return (PLSearchIndexManager *)-[PLLazyObject objectValue](self->_lazySearchIndexManager, "objectValue");
}

- (PLChangeHandlingContainer)changeHandlingContainer
{
  void *v2;
  void *v3;

  -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeHandlingContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLChangeHandlingContainer *)v3;
}

- (PLPhotoLibraryBundle)libraryBundle
{
  return (PLPhotoLibraryBundle *)objc_loadWeakRetained((id *)&self->_libraryBundle);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)createOptions
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;

  -[PLLibraryServicesManager modelMigrator](self, "modelMigrator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLPhotoLibraryCreateOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  return v5;
}

- (PLModelMigrator)modelMigrator
{
  return (PLModelMigrator *)-[PLLazyObject objectValue](self->_lazyModelMigrator, "objectValue");
}

- (BOOL)awaitLibraryState:(int64_t)a3 error:(id *)a4
{
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__40700;
  v12 = __Block_byref_object_dispose__40701;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PLLibraryServicesManager_awaitLibraryState_error___block_invoke;
  v7[3] = &unk_1E36769C0;
  v7[4] = &v14;
  v7[5] = &v8;
  -[PLLibraryServicesManager _awaitLibraryState:sync:completionHandler:](self, "_awaitLibraryState:sync:completionHandler:", a3, 1, v7);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (void)awaitLibraryState:(int64_t)a3 completionHandler:(id)a4
{
  -[PLLibraryServicesManager _awaitLibraryState:sync:completionHandler:](self, "_awaitLibraryState:sync:completionHandler:", a3, 0, a4);
}

- (NSProgress)postRunningProgress
{
  return self->_postRunningProgress;
}

- (PLDeferredProcessingServiceHandler)deferredProcessingServicerHandler
{
  return (PLDeferredProcessingServiceHandler *)-[PLLazyObject objectValue](self->_lazyDeferredProcessingServiceHandler, "objectValue");
}

- (void)_dispatchAwaitLibraryStateCompletionHandler:(id)a3 group:(id)a4 error:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  qos_class_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  dispatch_group_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    PLLibraryServicesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      qos_class_self();
      PLStringFromQoSClass();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "%{public}@: Dispatching await completion handler at current QoS: %{public}@", buf, 0x16u);

    }
    v14 = qos_class_self();
    dispatch_get_global_queue(v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__PLLibraryServicesManager__dispatchAwaitLibraryStateCompletionHandler_group_error___block_invoke;
    block[3] = &unk_1E3676290;
    v17 = v10;
    v19 = v8;
    v18 = v9;
    dispatch_group_async(v18, v15, block);

  }
  else
  {
    dispatch_group_leave(v9);
  }

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_pathManager);
}

- (id)statusDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PLLibraryServicesManager libraryURL](self, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "state");
  PLStringFromLibraryServicesState();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Library %@ [%@]\n"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLLibraryServicesManager activeOperations](self, "activeOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%d ACTIVE OPERATIONS\n"), objc_msgSend(v9, "count"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("  [%d] %@\n"), v13 + i, v16);

      }
      v13 = (v13 + i);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  -[PLLibraryServicesManager pendingOperations](self, "pendingOperations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%d PENDING OPERATIONS\n"), objc_msgSend(v17, "count"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "description");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appendFormat:", CFSTR("  [%d] %@\n"), v13 + j, v23, (_QWORD)v25);

      }
      v13 = (v13 + j);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

  return v8;
}

- (PLLibraryServicesManager)initWithLibraryBundle:(id)a3 backgroundJobService:(id)a4 cacheDeleteRegistration:(id)a5 delegateClass:(Class)a6
{
  id v11;
  PLLibraryServicesManager *v12;
  uint64_t v13;
  PLPhotoLibraryPathManager *pathManager;
  uint64_t v15;
  NSString *logPrefix;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  PLLibraryServicesManager *v21;
  void *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *stateSerializationQueue;
  NSMutableArray *v25;
  NSMutableArray *mutablePendingOperations;
  NSMutableDictionary *v27;
  NSMutableDictionary *externalWaiterCompletionBlocksByState;
  id v29;
  void *v30;
  dispatch_queue_t v31;
  OS_dispatch_queue *helperQueue;
  NSObject *v33;
  NSObject *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *albumCountQueue;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  PLLazyObject *lazyDatabaseContext;
  id v42;
  id v43;
  uint64_t v44;
  PLLazyObject *lazyImageWriter;
  id v46;
  id v47;
  uint64_t v48;
  PLLazyObject *lazyModelMigrator;
  id v50;
  id v51;
  uint64_t v52;
  PLLazyObject *lazySearchIndexManager;
  id v54;
  id v55;
  uint64_t v56;
  PLLazyObject *lazySearchIndexingEngine;
  id v58;
  id v59;
  uint64_t v60;
  PLLazyObject *lazySearchDonationProgress;
  id v62;
  id v63;
  uint64_t v64;
  PLLazyObject *lazyRelationshipOrderKeyManager;
  id v66;
  id v67;
  uint64_t v68;
  PLLazyObject *lazyMomentGenerationDataManager;
  id v70;
  id v71;
  uint64_t v72;
  PLLazyObject *lazyDuplicateProcessor;
  id v74;
  id v75;
  uint64_t v76;
  PLLazyObject *lazyRebuildJournalManager;
  id v78;
  id v79;
  uint64_t v80;
  PLLazyObject *lazyComputeCacheManager;
  id v82;
  id v83;
  uint64_t v84;
  PLLazyObject *lazyQuickActionManager;
  id v86;
  id v87;
  uint64_t v88;
  PLLazyObject *lazyKeywordManager;
  id v90;
  id v91;
  uint64_t v92;
  PLLazyObject *lazyPairingManager;
  id v94;
  id v95;
  uint64_t v96;
  PLLazyObject *lazyCPLReadiness;
  id v98;
  id v99;
  uint64_t v100;
  PLLazyObject *lazyClientSideEncryptionManager;
  id v102;
  id v103;
  uint64_t v104;
  PLLazyObject *lazyDeferredProcessingServiceHandler;
  id v106;
  id v107;
  uint64_t v108;
  PLLazyObject *lazyDirectServerConfiguration;
  id v110;
  id v111;
  uint64_t v112;
  PLLazyObject *lazyCPLSettings;
  id v114;
  id v115;
  uint64_t v116;
  PLLazyObject *lazyAnalysisCoordinator;
  id v118;
  id v119;
  uint64_t v120;
  PLLazyObject *lazyMainScopeIdentifier;
  id v122;
  id v123;
  uint64_t v124;
  PLLazyObject *lazyAlbumCountCoalescer;
  id v126;
  id v127;
  uint64_t v128;
  PLLazyObject *lazyImportSessionCountCoalescer;
  id v130;
  id v131;
  uint64_t v132;
  PLLazyObject *lazyCloudPhotoLibraryManager;
  id v134;
  id v135;
  uint64_t v136;
  PLLazyObject *lazyReadyForAnalysis;
  id v138;
  id v139;
  uint64_t v140;
  PLLazyObject *lazyAvailabilityProgressDelegate;
  id v142;
  id v143;
  uint64_t v144;
  PLLazyObject *lazyAvailabilityTransitionDelegate;
  id v146;
  id v147;
  uint64_t v148;
  PLLazyObject *lazyAvailabilityComputer;
  id v150;
  void *v151;
  uint64_t v152;
  PFStateCaptureHandler *stateHandler;
  NSObject *v154;
  uint64_t v155;
  void *v157;
  void *v158;
  id obj;
  id v160;
  id v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  id v165;
  _QWORD v166[4];
  id v167;
  _QWORD v168[4];
  id v169;
  _QWORD v170[4];
  id v171;
  _QWORD v172[4];
  id v173;
  _QWORD v174[4];
  id v175;
  _QWORD v176[4];
  id v177;
  _QWORD v178[4];
  id v179;
  _QWORD v180[4];
  id v181;
  _QWORD v182[4];
  id v183;
  _QWORD v184[4];
  id v185;
  _QWORD v186[4];
  id v187;
  _QWORD v188[4];
  id v189;
  _QWORD v190[4];
  id v191;
  _QWORD v192[4];
  id v193;
  _QWORD v194[4];
  id v195;
  _QWORD v196[4];
  id v197;
  _QWORD v198[4];
  id v199;
  _QWORD v200[4];
  id v201;
  _QWORD v202[4];
  id v203;
  _QWORD v204[4];
  id v205;
  _QWORD v206[4];
  id v207;
  _QWORD v208[4];
  id v209;
  _QWORD v210[4];
  id v211;
  _QWORD v212[4];
  id v213;
  _QWORD v214[4];
  id v215;
  _QWORD v216[4];
  id v217;
  id v218;
  objc_super v219;
  uint8_t buf[4];
  uint64_t v221;
  __int16 v222;
  PLLibraryServicesManager *v223;
  __int16 v224;
  id v225;
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  obj = a5;
  v160 = a4;
  v161 = a5;
  v219.receiver = self;
  v219.super_class = (Class)PLLibraryServicesManager;
  v12 = -[PLLibraryServicesManager init](&v219, sel_init);
  if (v12)
  {
    if ((PLIsAssetsd() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v157, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PLLibraryServicesManager.m"), 268, CFSTR("Only supposed to be running in assetsd"));

    }
    objc_storeWeak((id *)&v12->_libraryBundle, v11);
    objc_msgSend(v11, "pathManager");
    v13 = objc_claimAutoreleasedReturnValue();
    pathManager = v12->_pathManager;
    v12->_pathManager = (PLPhotoLibraryPathManager *)v13;

    v12->_wellKnownPhotoLibraryIdentifier = -[PLLibraryServicesManager _determineWellKnownPhotoLibraryIdentifier](v12, "_determineWellKnownPhotoLibraryIdentifier");
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("LSM-%d-%p"), v12->_wellKnownPhotoLibraryIdentifier, v12);
    logPrefix = v12->_logPrefix;
    v12->_logPrefix = (NSString *)v15;

    PLLibraryServicesGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](v12, "logPrefix");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0D731F0];
      objc_msgSend(v11, "libraryURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "descriptionWithFileURL:", v20);
      v21 = (PLLibraryServicesManager *)objc_claimAutoreleasedReturnValue();
      PLStringFromWellKnownPhotoLibraryIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v221 = (uint64_t)v18;
      v222 = 2112;
      v223 = v21;
      v224 = 2112;
      v225 = v22;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Initialized library services manager at path %@ with well known identifier %@", buf, 0x20u);

    }
    v23 = dispatch_queue_create("PLLibraryServicesManager.nodesQueue", 0);
    stateSerializationQueue = v12->_stateSerializationQueue;
    v12->_stateSerializationQueue = (OS_dispatch_queue *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    mutablePendingOperations = v12->_mutablePendingOperations;
    v12->_mutablePendingOperations = v25;

    *(_QWORD *)&v12->_importMutex._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v12->_localeUpdateLock._os_unfair_lock_opaque = 0;
    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    externalWaiterCompletionBlocksByState = v12->_externalWaiterCompletionBlocksByState;
    v12->_externalWaiterCompletionBlocksByState = v27;

    if (a6)
    {
      v29 = [a6 alloc];
      if ((objc_msgSend(v29, "conformsToProtocol:", &unk_1EE44D290) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PLLibraryServicesManager.m"), 284, CFSTR("Invalid class '%@' assigned to libraryServicesDelegateClass, must conform to PLLibraryServicesDelegate"), a6);

      }
      v30 = (void *)objc_msgSend(v29, "initWithLibraryServicesManager:", v12);
      -[PLLibraryServicesManager setLibraryServicesDelegate:](v12, "setLibraryServicesDelegate:", v30);
      v31 = dispatch_queue_create("PLLibraryServicesManager.helperQueue", 0);
      helperQueue = v12->_helperQueue;
      v12->_helperQueue = (OS_dispatch_queue *)v31;

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v33, QOS_CLASS_BACKGROUND, 0);
    v34 = objc_claimAutoreleasedReturnValue();

    v35 = dispatch_queue_create("album-count-update", v34);
    albumCountQueue = v12->_albumCountQueue;
    v12->_albumCountQueue = (OS_dispatch_queue *)v35;

    v37 = objc_initWeak((id *)buf, v12);
    v38 = objc_alloc(MEMORY[0x1E0D73248]);
    v39 = MEMORY[0x1E0C809B0];
    v216[0] = MEMORY[0x1E0C809B0];
    v216[1] = 3221225472;
    v216[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke;
    v216[3] = &unk_1E3670E50;
    objc_copyWeak(&v218, (id *)buf);
    v217 = v11;
    v40 = objc_msgSend(v38, "initWithBlock:", v216);

    objc_destroyWeak(&v218);
    objc_destroyWeak((id *)buf);
    lazyDatabaseContext = v12->_lazyDatabaseContext;
    v12->_lazyDatabaseContext = (PLLazyObject *)v40;

    v42 = objc_initWeak((id *)buf, v12);
    v43 = objc_alloc(MEMORY[0x1E0D73248]);
    v214[0] = v39;
    v214[1] = 3221225472;
    v214[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_2;
    v214[3] = &unk_1E36759D8;
    objc_copyWeak(&v215, (id *)buf);
    v44 = objc_msgSend(v43, "initWithBlock:", v214);
    objc_destroyWeak(&v215);
    objc_destroyWeak((id *)buf);
    lazyImageWriter = v12->_lazyImageWriter;
    v12->_lazyImageWriter = (PLLazyObject *)v44;

    v46 = objc_initWeak((id *)buf, v12);
    v47 = objc_alloc(MEMORY[0x1E0D73248]);
    v212[0] = v39;
    v212[1] = 3221225472;
    v212[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_3;
    v212[3] = &unk_1E36759D8;
    objc_copyWeak(&v213, (id *)buf);
    v48 = objc_msgSend(v47, "initWithBlock:", v212);
    objc_destroyWeak(&v213);
    objc_destroyWeak((id *)buf);
    lazyModelMigrator = v12->_lazyModelMigrator;
    v12->_lazyModelMigrator = (PLLazyObject *)v48;

    v50 = objc_initWeak((id *)buf, v12);
    v51 = objc_alloc(MEMORY[0x1E0D73248]);
    v210[0] = v39;
    v210[1] = 3221225472;
    v210[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_4;
    v210[3] = &unk_1E36759D8;
    objc_copyWeak(&v211, (id *)buf);
    v52 = objc_msgSend(v51, "initWithBlock:", v210);
    objc_destroyWeak(&v211);
    objc_destroyWeak((id *)buf);
    lazySearchIndexManager = v12->_lazySearchIndexManager;
    v12->_lazySearchIndexManager = (PLLazyObject *)v52;

    v54 = objc_initWeak((id *)buf, v12);
    v55 = objc_alloc(MEMORY[0x1E0D73248]);
    v208[0] = v39;
    v208[1] = 3221225472;
    v208[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_5;
    v208[3] = &unk_1E36759D8;
    objc_copyWeak(&v209, (id *)buf);
    v56 = objc_msgSend(v55, "initWithBlock:", v208);
    objc_destroyWeak(&v209);
    objc_destroyWeak((id *)buf);
    lazySearchIndexingEngine = v12->_lazySearchIndexingEngine;
    v12->_lazySearchIndexingEngine = (PLLazyObject *)v56;

    v58 = objc_initWeak((id *)buf, v12);
    v59 = objc_alloc(MEMORY[0x1E0D73248]);
    v206[0] = v39;
    v206[1] = 3221225472;
    v206[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_6;
    v206[3] = &unk_1E36759D8;
    objc_copyWeak(&v207, (id *)buf);
    v60 = objc_msgSend(v59, "initWithBlock:", v206);
    objc_destroyWeak(&v207);
    objc_destroyWeak((id *)buf);
    lazySearchDonationProgress = v12->_lazySearchDonationProgress;
    v12->_lazySearchDonationProgress = (PLLazyObject *)v60;

    v62 = objc_initWeak((id *)buf, v12);
    v63 = objc_alloc(MEMORY[0x1E0D73248]);
    v204[0] = v39;
    v204[1] = 3221225472;
    v204[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_7;
    v204[3] = &unk_1E36759D8;
    objc_copyWeak(&v205, (id *)buf);
    v64 = objc_msgSend(v63, "initWithBlock:", v204);
    objc_destroyWeak(&v205);
    objc_destroyWeak((id *)buf);
    lazyRelationshipOrderKeyManager = v12->_lazyRelationshipOrderKeyManager;
    v12->_lazyRelationshipOrderKeyManager = (PLLazyObject *)v64;

    v66 = objc_initWeak((id *)buf, v12);
    v67 = objc_alloc(MEMORY[0x1E0D73248]);
    v202[0] = v39;
    v202[1] = 3221225472;
    v202[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_8;
    v202[3] = &unk_1E36759D8;
    objc_copyWeak(&v203, (id *)buf);
    v68 = objc_msgSend(v67, "initWithBlock:", v202);
    objc_destroyWeak(&v203);
    objc_destroyWeak((id *)buf);
    lazyMomentGenerationDataManager = v12->_lazyMomentGenerationDataManager;
    v12->_lazyMomentGenerationDataManager = (PLLazyObject *)v68;

    v70 = objc_initWeak((id *)buf, v12);
    v71 = objc_alloc(MEMORY[0x1E0D73248]);
    v200[0] = v39;
    v200[1] = 3221225472;
    v200[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_9;
    v200[3] = &unk_1E36759D8;
    objc_copyWeak(&v201, (id *)buf);
    v72 = objc_msgSend(v71, "initWithBlock:", v200);
    objc_destroyWeak(&v201);
    objc_destroyWeak((id *)buf);
    lazyDuplicateProcessor = v12->_lazyDuplicateProcessor;
    v12->_lazyDuplicateProcessor = (PLLazyObject *)v72;

    v74 = objc_initWeak((id *)buf, v12);
    v75 = objc_alloc(MEMORY[0x1E0D73248]);
    v198[0] = v39;
    v198[1] = 3221225472;
    v198[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_10;
    v198[3] = &unk_1E36759D8;
    objc_copyWeak(&v199, (id *)buf);
    v76 = objc_msgSend(v75, "initWithBlock:", v198);
    objc_destroyWeak(&v199);
    objc_destroyWeak((id *)buf);
    lazyRebuildJournalManager = v12->_lazyRebuildJournalManager;
    v12->_lazyRebuildJournalManager = (PLLazyObject *)v76;

    v78 = objc_initWeak((id *)buf, v12);
    v79 = objc_alloc(MEMORY[0x1E0D73248]);
    v196[0] = v39;
    v196[1] = 3221225472;
    v196[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_11;
    v196[3] = &unk_1E36759D8;
    objc_copyWeak(&v197, (id *)buf);
    v80 = objc_msgSend(v79, "initWithBlock:", v196);
    objc_destroyWeak(&v197);
    objc_destroyWeak((id *)buf);
    lazyComputeCacheManager = v12->_lazyComputeCacheManager;
    v12->_lazyComputeCacheManager = (PLLazyObject *)v80;

    v82 = objc_initWeak((id *)buf, v12);
    v83 = objc_alloc(MEMORY[0x1E0D73248]);
    v194[0] = v39;
    v194[1] = 3221225472;
    v194[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_12;
    v194[3] = &unk_1E36759D8;
    objc_copyWeak(&v195, (id *)buf);
    v84 = objc_msgSend(v83, "initWithBlock:", v194);
    objc_destroyWeak(&v195);
    objc_destroyWeak((id *)buf);
    lazyQuickActionManager = v12->_lazyQuickActionManager;
    v12->_lazyQuickActionManager = (PLLazyObject *)v84;

    v86 = objc_initWeak((id *)buf, v12);
    v87 = objc_alloc(MEMORY[0x1E0D73248]);
    v192[0] = v39;
    v192[1] = 3221225472;
    v192[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_13;
    v192[3] = &unk_1E36759D8;
    objc_copyWeak(&v193, (id *)buf);
    v88 = objc_msgSend(v87, "initWithBlock:", v192);
    objc_destroyWeak(&v193);
    objc_destroyWeak((id *)buf);
    lazyKeywordManager = v12->_lazyKeywordManager;
    v12->_lazyKeywordManager = (PLLazyObject *)v88;

    objc_storeStrong((id *)&v12->_backgroundJobService, a4);
    v90 = objc_initWeak((id *)buf, v12);

    v91 = objc_alloc(MEMORY[0x1E0D73248]);
    v190[0] = v39;
    v190[1] = 3221225472;
    v190[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_14;
    v190[3] = &unk_1E36759D8;
    objc_copyWeak(&v191, (id *)buf);
    v92 = objc_msgSend(v91, "initWithBlock:", v190);
    objc_destroyWeak(&v191);
    objc_destroyWeak((id *)buf);
    lazyPairingManager = v12->_lazyPairingManager;
    v12->_lazyPairingManager = (PLLazyObject *)v92;

    v94 = objc_initWeak((id *)buf, v12);
    v95 = objc_alloc(MEMORY[0x1E0D73248]);
    v188[0] = v39;
    v188[1] = 3221225472;
    v188[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_15;
    v188[3] = &unk_1E36759D8;
    objc_copyWeak(&v189, (id *)buf);
    v96 = objc_msgSend(v95, "initWithBlock:", v188);
    objc_destroyWeak(&v189);
    objc_destroyWeak((id *)buf);
    lazyCPLReadiness = v12->_lazyCPLReadiness;
    v12->_lazyCPLReadiness = (PLLazyObject *)v96;

    v98 = objc_initWeak((id *)buf, v12);
    v99 = objc_alloc(MEMORY[0x1E0D73248]);
    v186[0] = v39;
    v186[1] = 3221225472;
    v186[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_16;
    v186[3] = &unk_1E36759D8;
    objc_copyWeak(&v187, (id *)buf);
    v100 = objc_msgSend(v99, "initWithBlock:", v186);
    objc_destroyWeak(&v187);
    objc_destroyWeak((id *)buf);
    lazyClientSideEncryptionManager = v12->_lazyClientSideEncryptionManager;
    v12->_lazyClientSideEncryptionManager = (PLLazyObject *)v100;

    v102 = objc_initWeak((id *)buf, v12);
    v103 = objc_alloc(MEMORY[0x1E0D73248]);
    v184[0] = v39;
    v184[1] = 3221225472;
    v184[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_17;
    v184[3] = &unk_1E36759D8;
    objc_copyWeak(&v185, (id *)buf);
    v104 = objc_msgSend(v103, "initWithBlock:", v184);
    objc_destroyWeak(&v185);
    objc_destroyWeak((id *)buf);
    lazyDeferredProcessingServiceHandler = v12->_lazyDeferredProcessingServiceHandler;
    v12->_lazyDeferredProcessingServiceHandler = (PLLazyObject *)v104;

    v106 = objc_initWeak((id *)buf, v12);
    v107 = objc_alloc(MEMORY[0x1E0D73248]);
    v182[0] = v39;
    v182[1] = 3221225472;
    v182[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_18;
    v182[3] = &unk_1E36759D8;
    objc_copyWeak(&v183, (id *)buf);
    v108 = objc_msgSend(v107, "initWithBlock:", v182);
    objc_destroyWeak(&v183);
    objc_destroyWeak((id *)buf);
    lazyDirectServerConfiguration = v12->_lazyDirectServerConfiguration;
    v12->_lazyDirectServerConfiguration = (PLLazyObject *)v108;

    v110 = objc_initWeak((id *)buf, v12);
    v111 = objc_alloc(MEMORY[0x1E0D73248]);
    v180[0] = v39;
    v180[1] = 3221225472;
    v180[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_19;
    v180[3] = &unk_1E36759D8;
    objc_copyWeak(&v181, (id *)buf);
    v112 = objc_msgSend(v111, "initWithBlock:", v180);
    objc_destroyWeak(&v181);
    objc_destroyWeak((id *)buf);
    lazyCPLSettings = v12->_lazyCPLSettings;
    v12->_lazyCPLSettings = (PLLazyObject *)v112;

    v114 = objc_initWeak((id *)buf, v12);
    v115 = objc_alloc(MEMORY[0x1E0D73248]);
    v178[0] = v39;
    v178[1] = 3221225472;
    v178[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_20;
    v178[3] = &unk_1E36759D8;
    objc_copyWeak(&v179, (id *)buf);
    v116 = objc_msgSend(v115, "initWithBlock:", v178);
    objc_destroyWeak(&v179);
    objc_destroyWeak((id *)buf);
    lazyAnalysisCoordinator = v12->_lazyAnalysisCoordinator;
    v12->_lazyAnalysisCoordinator = (PLLazyObject *)v116;

    v118 = objc_initWeak((id *)buf, v12);
    v119 = objc_alloc(MEMORY[0x1E0D73248]);
    v176[0] = v39;
    v176[1] = 3221225472;
    v176[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_21;
    v176[3] = &unk_1E36759D8;
    objc_copyWeak(&v177, (id *)buf);
    v120 = objc_msgSend(v119, "initWithRetriableBlock:", v176);
    objc_destroyWeak(&v177);
    objc_destroyWeak((id *)buf);
    lazyMainScopeIdentifier = v12->_lazyMainScopeIdentifier;
    v12->_lazyMainScopeIdentifier = (PLLazyObject *)v120;

    v122 = objc_initWeak((id *)buf, v12);
    v123 = objc_alloc(MEMORY[0x1E0D73248]);
    v174[0] = v39;
    v174[1] = 3221225472;
    v174[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_22;
    v174[3] = &unk_1E36759D8;
    objc_copyWeak(&v175, (id *)buf);
    v124 = objc_msgSend(v123, "initWithBlock:", v174);
    objc_destroyWeak(&v175);
    objc_destroyWeak((id *)buf);
    lazyAlbumCountCoalescer = v12->_lazyAlbumCountCoalescer;
    v12->_lazyAlbumCountCoalescer = (PLLazyObject *)v124;

    v126 = objc_initWeak((id *)buf, v12);
    v127 = objc_alloc(MEMORY[0x1E0D73248]);
    v172[0] = v39;
    v172[1] = 3221225472;
    v172[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_23;
    v172[3] = &unk_1E36759D8;
    objc_copyWeak(&v173, (id *)buf);
    v128 = objc_msgSend(v127, "initWithBlock:", v172);
    objc_destroyWeak(&v173);
    objc_destroyWeak((id *)buf);
    lazyImportSessionCountCoalescer = v12->_lazyImportSessionCountCoalescer;
    v12->_lazyImportSessionCountCoalescer = (PLLazyObject *)v128;

    v130 = objc_initWeak((id *)buf, v12);
    v131 = objc_alloc(MEMORY[0x1E0D73248]);
    v170[0] = v39;
    v170[1] = 3221225472;
    v170[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_24;
    v170[3] = &unk_1E36759D8;
    objc_copyWeak(&v171, (id *)buf);
    v132 = objc_msgSend(v131, "initWithRetriableBlock:", v170);
    objc_destroyWeak(&v171);
    objc_destroyWeak((id *)buf);
    lazyCloudPhotoLibraryManager = v12->_lazyCloudPhotoLibraryManager;
    v12->_lazyCloudPhotoLibraryManager = (PLLazyObject *)v132;

    v134 = objc_initWeak((id *)buf, v12);
    v135 = objc_alloc(MEMORY[0x1E0D73248]);
    v168[0] = v39;
    v168[1] = 3221225472;
    v168[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_25;
    v168[3] = &unk_1E36759D8;
    objc_copyWeak(&v169, (id *)buf);
    v136 = objc_msgSend(v135, "initWithBlock:", v168);
    objc_destroyWeak(&v169);
    objc_destroyWeak((id *)buf);
    lazyReadyForAnalysis = v12->_lazyReadyForAnalysis;
    v12->_lazyReadyForAnalysis = (PLLazyObject *)v136;

    v138 = objc_initWeak((id *)buf, v12);
    v139 = objc_alloc(MEMORY[0x1E0D73248]);
    v166[0] = v39;
    v166[1] = 3221225472;
    v166[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_26;
    v166[3] = &unk_1E36759D8;
    objc_copyWeak(&v167, (id *)buf);
    v140 = objc_msgSend(v139, "initWithBlock:", v166);
    objc_destroyWeak(&v167);
    objc_destroyWeak((id *)buf);
    lazyAvailabilityProgressDelegate = v12->_lazyAvailabilityProgressDelegate;
    v12->_lazyAvailabilityProgressDelegate = (PLLazyObject *)v140;

    v142 = objc_initWeak((id *)buf, v12);
    v143 = objc_alloc(MEMORY[0x1E0D73248]);
    v164[0] = v39;
    v164[1] = 3221225472;
    v164[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_27;
    v164[3] = &unk_1E36759D8;
    objc_copyWeak(&v165, (id *)buf);
    v144 = objc_msgSend(v143, "initWithBlock:", v164);
    objc_destroyWeak(&v165);
    objc_destroyWeak((id *)buf);
    lazyAvailabilityTransitionDelegate = v12->_lazyAvailabilityTransitionDelegate;
    v12->_lazyAvailabilityTransitionDelegate = (PLLazyObject *)v144;

    v146 = objc_initWeak((id *)buf, v12);
    v147 = objc_alloc(MEMORY[0x1E0D73248]);
    v162[0] = v39;
    v162[1] = 3221225472;
    v162[2] = __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_28;
    v162[3] = &unk_1E36759D8;
    objc_copyWeak(&v163, (id *)buf);
    v148 = objc_msgSend(v147, "initWithBlock:", v162);
    objc_destroyWeak(&v163);
    objc_destroyWeak((id *)buf);
    lazyAvailabilityComputer = v12->_lazyAvailabilityComputer;
    v12->_lazyAvailabilityComputer = (PLLazyObject *)v148;

    v12->_outstandingTransactionHandlerTimerLock._os_unfair_lock_opaque = 0;
    *(_QWORD *)&v12->_resourceCacheMetrics.imageCacheHitCount = 0;
    *(_QWORD *)&v12->_resourceCacheMetrics.videoComplementCacheHitCount = 0;
    -[PLLibraryServicesManager _initSystemPhotoLibrarySpecificServices](v12, "_initSystemPhotoLibrarySpecificServices");
    if (-[PLLibraryServicesManager isSyndicationPhotoLibrary](v12, "isSyndicationPhotoLibrary"))
      -[PLLibraryServicesManager _initSyndicationPhotoLibrarySpecificServices](v12, "_initSyndicationPhotoLibrarySpecificServices");
    v12->_maxWaiterQoS = 9;
    v150 = objc_alloc(MEMORY[0x1E0D71088]);
    -[PLLibraryServicesManager logPrefix](v12, "logPrefix");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    v152 = objc_msgSend(v150, "initWithProvider:name:", v12, v151);
    stateHandler = v12->_stateHandler;
    v12->_stateHandler = (PFStateCaptureHandler *)v152;

    objc_storeStrong((id *)&v12->_cacheDeleteRegistration, obj);
  }
  PLPhotosObjectLifecycleGetLog();
  v154 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v154, OS_LOG_TYPE_DEBUG))
  {
    v155 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v221 = v155;
    v222 = 2048;
    v223 = v12;
    v224 = 2112;
    v225 = v11;
    _os_log_impl(&dword_199541000, v154, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryBundle:%@", buf, 0x20u);
  }

  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  PLPhotoLibraryPathManager *pathManager;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  PLLibraryServicesManager *v10;
  __int16 v11;
  PLPhotoLibraryPathManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    pathManager = self->_pathManager;
    *(_DWORD *)buf = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = pathManager;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLLibraryServicesManager;
  -[PLLibraryServicesManager dealloc](&v6, sel_dealloc);
}

- (int64_t)_determineWellKnownPhotoLibraryIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D73280];
  -[PLLibraryServicesManager pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifierForURL:", v5);

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0D73280];
    -[PLLibraryServicesManager pathManager](self, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "isSystemPhotoLibraryURL:", v9);

    return v6;
  }
  return v6;
}

- (void)_initCameraPreviewWellManager
{
  id v3;
  id v4;
  PLLazyObject *v5;
  PLLazyObject *lazyCameraPreviewWellManager;
  _QWORD v7[4];
  id v8;
  id location;

  v3 = objc_initWeak(&location, self);

  v4 = objc_alloc(MEMORY[0x1E0D73248]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PLLibraryServicesManager__initCameraPreviewWellManager__block_invoke;
  v7[3] = &unk_1E36759D8;
  objc_copyWeak(&v8, &location);
  v5 = (PLLazyObject *)objc_msgSend(v4, "initWithBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  lazyCameraPreviewWellManager = self->_lazyCameraPreviewWellManager;
  self->_lazyCameraPreviewWellManager = v5;

}

- (id)_newOrderKeyManager
{
  PLRelationshipOrderKeyManager *v3;
  _QWORD v5[5];

  v3 = [PLRelationshipOrderKeyManager alloc];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__PLLibraryServicesManager__newOrderKeyManager__block_invoke;
  v5[3] = &unk_1E3670BD0;
  v5[4] = self;
  return -[PLRelationshipOrderKeyManager initWithGenerateContextBlock:](v3, "initWithGenerateContextBlock:", v5);
}

- (void)currentLocaleDidChangeNotification:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = -[PLLibraryServicesManager state](self, "state", a3);
  PLLibraryServicesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 < 6)
  {
    if (v6)
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromLibraryServicesState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Library not ready to handle locale change notification (state: %{public}@)", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    if (v6)
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating saved locale in response to locale change notification.", (uint8_t *)&v12, 0xCu);

    }
    if (-[PLLibraryServicesManager updateSavedLocaleIfNeeded](self, "updateSavedLocaleIfNeeded"))
    {
      PLLibraryServicesGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[PLLibraryServicesManager logPrefix](self, "logPrefix");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting exit due to detected locale change.", (uint8_t *)&v12, 0xCu);

      }
      xpc_transaction_exit_clean();
    }
  }
}

- (BOOL)updateSavedLocaleIfNeeded
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)updateGreenTeaSavedContactsAuthorizationIfNeeded
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (void)invalidateReverseLocationDataOnAllAssets
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__40700;
  v23 = __Block_byref_object_dispose__40701;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[PLLibraryServicesManager databaseContext](self, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newShortLivedLibraryWithName:", "-[PLLibraryServicesManager invalidateReverseLocationDataOnAllAssets]");

  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__PLLibraryServicesManager_invalidateReverseLocationDataOnAllAssets__block_invoke;
  v11[3] = &unk_1E3677830;
  v13 = &v15;
  v6 = v5;
  v12 = v6;
  v14 = &v19;
  objc_msgSend(v4, "performTransactionAndWait:", v11);
  if (*((_BYTE *)v16 + 24))
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully invalidated reverseLocationDataIsValid on ALL assets", buf, 0xCu);

    }
  }
  else
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v20[5];
      *(_DWORD *)buf = 138543618;
      v26 = v9;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to invalidate reverseLocationDataIsValid on ALL assets error: %@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

- (NSURL)libraryURL
{
  void *v2;
  void *v3;

  -[PLLibraryServicesManager pathManager](self, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  void *v2;
  void *v3;
  void *v4;

  -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedPersistentStoreCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStoreCoordinator *)v4;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
  {
    LOBYTE(v3) = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  }
  else
  {
    v3 = -[PLLibraryServicesManager isAppPhotoLibrary](self, "isAppPhotoLibrary");
    if (v3)
    {
      -[PLLibraryServicesManager cplSettings](self, "cplSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isICPLEnabled");

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (BOOL)isCreateMode
{
  return self->_isCreateMode;
}

- (void)setCreateMode:(BOOL)a3 options:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a4;
  self->_isCreateMode = a3;
  v10 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&self->_openerCreationOptions, a4);
    objc_msgSend(v10, "createDatabaseOptionsDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLibraryServicesManager modelMigrator](self, "modelMigrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOptions:", v8);

  }
}

- (void)refreshAlbumCountForAlbumIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLLibraryServicesManager refreshAlbumCountForAlbumIDs:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLazyObject objectValue](self->_lazyAlbumCountCoalescer, "objectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PLLibraryServicesManager_refreshAlbumCountForAlbumIDs___block_invoke;
  v9[3] = &unk_1E3669938;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "update:", v9);

}

- (void)refreshImportSessionCountForImportSessionIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLLibraryServicesManager refreshImportSessionCountForImportSessionIDs:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLazyObject objectValue](self->_lazyImportSessionCountCoalescer, "objectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PLLibraryServicesManager_refreshImportSessionCountForImportSessionIDs___block_invoke;
  v9[3] = &unk_1E3669938;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "update:", v9);

}

- (BOOL)isSyndicationPhotoLibrary
{
  return -[PLLibraryServicesManager wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier") == 3;
}

- (BOOL)isAppPhotoLibrary
{
  void *v2;
  char v3;

  -[PLLibraryServicesManager cplSettings](self, "cplSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppLibrary");

  return v3;
}

- (BOOL)isCPLSyncablePhotoLibrary
{
  if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary")
    || -[PLLibraryServicesManager isAppPhotoLibrary](self, "isAppPhotoLibrary"))
  {
    return 1;
  }
  if (PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken != -1)
    dispatch_once(&PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken, &__block_literal_global_291);
  return PLCloudPhotoLibraryMultiLibarySyncingEnabled_multiLibrarySyncingEnabled
      && -[PLLibraryServicesManager isSyndicationPhotoLibrary](self, "isSyndicationPhotoLibrary");
}

- (BOOL)isSearchIndexingEnabled
{
  char v3;
  BOOL v4;
  char v5;

  v3 = -[PLLibraryServicesManager createOptions](self, "createOptions");
  v4 = -[PLLibraryServicesManager isSyndicationPhotoLibrary](self, "isSyndicationPhotoLibrary");
  v5 = (v3 & 2) == 0 || v4;
  return PLPlatformSearchSupported() & v5;
}

- (NSString)mainScopeIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  -[PLLazyObject objectValue](self->_lazyMainScopeIdentifier, "objectValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    CPLPrimaryScopeIdentifierForCurrentUniverse();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return (NSString *)v5;
}

- (void)_initSystemPhotoLibrarySpecificServices
{
  id v3;
  id v4;
  uint64_t v5;
  PLLazyObject *v6;
  PLLazyObject *lazyCrashRecoverySupport;
  id v8;
  id v9;
  PLLazyObject *v10;
  PLLazyObject *lazySyndicationDeleteManager;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[PLLibraryServicesManager _initCameraPreviewWellManager](self, "_initCameraPreviewWellManager");
  v3 = objc_initWeak(&location, self);

  v4 = objc_alloc(MEMORY[0x1E0D73248]);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke;
  v14[3] = &unk_1E36759D8;
  objc_copyWeak(&v15, &location);
  v6 = (PLLazyObject *)objc_msgSend(v4, "initWithBlock:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  lazyCrashRecoverySupport = self->_lazyCrashRecoverySupport;
  self->_lazyCrashRecoverySupport = v6;

  if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
  {
    v8 = objc_initWeak(&location, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke_2;
    v12[3] = &unk_1E36759D8;
    objc_copyWeak(&v13, &location);
    v10 = (PLLazyObject *)objc_msgSend(v9, "initWithBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    lazySyndicationDeleteManager = self->_lazySyndicationDeleteManager;
    self->_lazySyndicationDeleteManager = v10;

  }
}

- (void)_invalidateSystemPhotoLibrarySpecificServices
{
  void *v3;
  void *v4;

  -[PLLibraryServicesManager searchIndexingEngine](self, "searchIndexingEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableUISearch");

  -[PLLibraryServicesManager searchIndexManager](self, "searchIndexManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disableUISearch");

  -[PLLibraryServicesManager _invalidateCameraPreviewWellManager](self, "_invalidateCameraPreviewWellManager");
  -[PLLibraryServicesManager _invalidateCrashRecoverySupport](self, "_invalidateCrashRecoverySupport");
  -[PLLibraryServicesManager _invalidateSyndicationDeleteManager](self, "_invalidateSyndicationDeleteManager");
}

- (void)_initSyndicationPhotoLibrarySpecificServices
{
  id v3;
  id v4;
  uint64_t v5;
  PLLazyObject *v6;
  PLLazyObject *lazySyndicationDeleteManager;
  id v8;
  id v9;
  PLLazyObject *v10;
  PLLazyObject *lazyCacheDeleteSupport;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = objc_initWeak(&location, self);

  v4 = objc_alloc(MEMORY[0x1E0D73248]);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke;
  v14[3] = &unk_1E36759D8;
  objc_copyWeak(&v15, &location);
  v6 = (PLLazyObject *)objc_msgSend(v4, "initWithBlock:", v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  lazySyndicationDeleteManager = self->_lazySyndicationDeleteManager;
  self->_lazySyndicationDeleteManager = v6;

  v8 = objc_initWeak(&location, self);
  v9 = objc_alloc(MEMORY[0x1E0D73248]);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke_2;
  v12[3] = &unk_1E36759D8;
  objc_copyWeak(&v13, &location);
  v10 = (PLLazyObject *)objc_msgSend(v9, "initWithBlock:", v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  self->_lazyCacheDeleteSupport = v10;

}

- (void)_invalidateSyndicationPhotoLibrarySpecificServices
{
  -[PLLibraryServicesManager _invalidateSyndicationDeleteManager](self, "_invalidateSyndicationDeleteManager");
  -[PLLibraryServicesManager _invalidateCacheDeleteSupport](self, "_invalidateCacheDeleteSupport");
}

- (id)newAlbumCountCoalescer
{
  return -[PLLibraryServicesManager _newContainer:scope:](self, "_newContainer:scope:", objc_opt_class(), CFSTR("PLTransactionScopeAlbumCounts"));
}

- (id)newImportSessionCountCoalescer
{
  return -[PLLibraryServicesManager _newContainer:scope:](self, "_newContainer:scope:", objc_opt_class(), CFSTR("PLTransactionScopeImportSessionCounts"));
}

- (void)_handleCoalescerActionWithScope:(id)a3 class:(Class)a4 forIDs:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  PLLibraryServicesManager *v21;
  double v22;
  PLClientServerTransaction *serverTransaction;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  Class v29;

  v25 = a3;
  v10 = a5;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_albumCountQueue);
  v12 = -[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary");
  -[objc_class entityName](a4, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager databaseContext](self, "databaseContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-countCoalescer"), v13);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (void *)objc_msgSend(v16, "newShortLivedLibraryWithName:", objc_msgSend(v17, "UTF8String"));

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__PLLibraryServicesManager__handleCoalescerActionWithScope_class_forIDs_context___block_invoke;
  v26[3] = &unk_1E3669960;
  v29 = a4;
  v19 = v18;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  objc_msgSend(v19, "performTransactionAndWait:", v26);
  v21 = self;
  objc_sync_enter(v21);
  -[PLClientServerTransaction completeTransactionScope:](v21->_serverTransaction, "completeTransactionScope:", v25);
  if (v12)
    v22 = 4.0;
  else
    v22 = 0.5;
  serverTransaction = v21->_serverTransaction;
  v21->_serverTransaction = 0;

  objc_sync_exit(v21);
  objc_msgSend(v14, "endActivity");
  objc_msgSend(v11, "delayNextInvocationByTimeInterval:", v22);

}

- (id)_newContainer:(Class)a3 scope:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *albumCountQueue;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  Class v16;

  v6 = a4;
  -[objc_class entityName](a3, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D71080];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.photos.%@counts"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  albumCountQueue = self->_albumCountQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__PLLibraryServicesManager__newContainer_scope___block_invoke;
  v14[3] = &unk_1E3669988;
  v15 = v6;
  v16 = a3;
  v11 = v6;
  objc_msgSend(v8, "setCoalescerWithLabel:target:queue:action:", v9, self, albumCountQueue, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (PLImageWriter)imageWriter
{
  return (PLImageWriter *)-[PLLazyObject objectValue](self->_lazyImageWriter, "objectValue");
}

- (PLSearchIndexingEngine)searchIndexingEngine
{
  return (PLSearchIndexingEngine *)-[PLLazyObject objectValue](self->_lazySearchIndexingEngine, "objectValue");
}

- (PLSearchDonationProgress)searchDonationProgress
{
  return (PLSearchDonationProgress *)-[PLLazyObject objectValue](self->_lazySearchDonationProgress, "objectValue");
}

- (PLDatabaseContext)databaseContext
{
  return (PLDatabaseContext *)-[PLLazyObject objectValue](self->_lazyDatabaseContext, "objectValue");
}

- (id)newCloudPhotoLibraryManager
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[PLLibraryServicesManager isCPLSyncablePhotoLibrary](self, "isCPLSyncablePhotoLibrary"))
    return -[PLCloudPhotoLibraryManager initWithLibraryServicesManager:]([PLCloudPhotoLibraryManager alloc], "initWithLibraryServicesManager:", self);
  PLLibraryServicesGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLibraryServicesManager pathManager](self, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Request for newCloudPhotoLibraryManager from a non-system photo library: %@", (uint8_t *)&v7, 0x16u);

  }
  return 0;
}

- (PLCloudPhotoLibraryManager)cloudPhotoLibraryManager
{
  return (PLCloudPhotoLibraryManager *)-[PLLazyObject objectValue](self->_lazyCloudPhotoLibraryManager, "objectValue");
}

- (id)newCrashRecoverySupport
{
  PLAssetsdCrashRecoverySupport *v3;
  void *v4;
  PLAssetsdCrashRecoverySupport *v5;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
  {
    v3 = [PLAssetsdCrashRecoverySupport alloc];
    -[PLLibraryServicesManager pathManager](self, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PLAssetsdCrashRecoverySupport initWithPathManager:](v3, "initWithPathManager:", v4);

    return v5;
  }
  else
  {
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLibraryServicesManager pathManager](self, "pathManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Request for newCrashRecoverySupport from a non-system photo library: %@", (uint8_t *)&v10, 0x16u);

    }
    return 0;
  }
}

- (PLAssetsdCrashRecoverySupport)crashRecoverySupport
{
  return (PLAssetsdCrashRecoverySupport *)-[PLLazyObject objectValue](self->_lazyCrashRecoverySupport, "objectValue");
}

- (id)newSearchIndexManager
{
  NSObject *v3;
  PLSearchIndexManager *v4;
  void *v5;
  PLSearchIndexManager *v6;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PhotosSearchBackgroundJobWorker feature flag enabled. Not initializing PLSearchIndexManager.", (uint8_t *)&v10, 2u);
    }

  }
  else
  {
    if (-[PLLibraryServicesManager isSearchIndexingEnabled](self, "isSearchIndexingEnabled"))
    {
      v4 = [PLSearchIndexManager alloc];
      -[PLLibraryServicesManager pathManager](self, "pathManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PLSearchIndexManager initWithPathManager:](v4, "initWithPathManager:", v5);

      return v6;
    }
    PLLibraryServicesGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Search index manager disabled, newSearchIndexManager unavailable", (uint8_t *)&v10, 0xCu);

    }
  }
  return 0;
}

- (id)newSearchIndexingEngine
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[PLLibraryServicesManager isSearchIndexingEnabled](self, "isSearchIndexingEnabled"))
    return -[PLSearchIndexingEngine initWithLibraryServicesManager:]([PLSearchIndexingEngine alloc], "initWithLibraryServicesManager:", self);
  PLLibraryServicesGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Search indexing disabled, newSearchIndexingEngine unavailable", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

- (id)_provideContextForSearchDonationProgress
{
  void *v2;
  void *v3;
  void *v4;

  -[PLLibraryServicesManager databaseContext](self, "databaseContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newShortLivedLibraryWithName:", "search donation progress");

  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)newSearchDonationProgress
{
  void *v3;
  PLSearchDonationProgress *v4;
  void *v5;
  PLSearchDonationProgress *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __53__PLLibraryServicesManager_newSearchDonationProgress__block_invoke;
  v11 = &unk_1E36699B0;
  objc_copyWeak(&v12, &location);
  v3 = (void *)MEMORY[0x19AEC174C](&v8);
  v4 = [PLSearchDonationProgress alloc];
  -[PLLibraryServicesManager pathManager](self, "pathManager", v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLSearchDonationProgress initWithPathManager:contextProviderBlock:](v4, "initWithPathManager:contextProviderBlock:", v5, v3);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

- (id)newMomentGenerationDataManager
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (PLPlatformMomentsSupported())
    return -[PLMomentGenerationDataManager initWithLibraryServicesManager:]([PLMomentGenerationDataManager alloc], "initWithLibraryServicesManager:", self);
  PLLibraryServicesGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Moments disabled, momentGenerationDataManager unavailable", (uint8_t *)&v6, 0xCu);

  }
  return 0;
}

- (PLLibraryServicesCPLReadiness)cplReadiness
{
  return (PLLibraryServicesCPLReadiness *)-[PLLazyObject objectValue](self->_lazyCPLReadiness, "objectValue");
}

- (CPLConfiguration)directServerConfiguration
{
  return (CPLConfiguration *)-[PLLazyObject objectValue](self->_lazyDirectServerConfiguration, "objectValue");
}

- (PLReadyForAnalysis)readyForAnalysis
{
  return (PLReadyForAnalysis *)-[PLLazyObject objectValue](self->_lazyReadyForAnalysis, "objectValue");
}

- (void)_invalidateMomentGenerationDataManager
{
  -[PLLazyObject invalidate](self->_lazyMomentGenerationDataManager, "invalidate");
}

- (void)_invalidateRebuildJournalManager
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyRebuildJournalManager, "invalidateWithHandler:", &__block_literal_global_40742);
}

- (void)_invalidateComputeCacheManager
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyComputeCacheManager, "invalidateWithHandler:", &__block_literal_global_125_40740);
}

- (void)_invalidateSearchIndexManager
{
  -[PLLazyObject invalidateWithHandler:](self->_lazySearchIndexManager, "invalidateWithHandler:", &__block_literal_global_127);
}

- (void)_invalidateSearchIndexingEngine
{
  -[PLLazyObject invalidateWithHandler:](self->_lazySearchIndexingEngine, "invalidateWithHandler:", &__block_literal_global_129_40737);
}

- (void)_invalidateSearchDonationProgress
{
  -[PLLazyObject invalidateWithHandler:](self->_lazySearchDonationProgress, "invalidateWithHandler:", &__block_literal_global_131);
}

- (void)_invalidateModelMigrator
{
  -[PLLazyObject invalidate](self->_lazyModelMigrator, "invalidate");
}

- (void)_invalidateAlbumCountCoalescer
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyAlbumCountCoalescer, "invalidateWithHandler:", &__block_literal_global_133_40735);
}

- (void)_invalidateImportSessionCountCoalescer
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyImportSessionCountCoalescer, "invalidateWithHandler:", &__block_literal_global_134);
}

- (void)_invalidateImageWriter
{
  -[PLLazyObject invalidate](self->_lazyImageWriter, "invalidate");
}

- (void)_invalidateKeywordManager
{
  -[PLLazyObject invalidate](self->_lazyKeywordManager, "invalidate");
}

- (void)_invalidatePairingManager
{
  -[PLLazyObject invalidate](self->_lazyPairingManager, "invalidate");
}

- (void)_invalidateDuplicateProcessor
{
  -[PLLazyObject invalidate](self->_lazyDuplicateProcessor, "invalidate");
}

- (void)_invalidateRelationshipOrderKeyManager
{
  -[PLLazyObject invalidate](self->_lazyRelationshipOrderKeyManager, "invalidate");
}

- (void)_invalidateQuickActionManager
{
  -[PLLazyObject invalidate](self->_lazyQuickActionManager, "invalidate");
}

- (void)_invalidateDatabaseContext
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyDatabaseContext, "invalidateWithHandler:", &__block_literal_global_136);
}

- (void)_invalidateCloudPhotoLibraryManager
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyCloudPhotoLibraryManager, "invalidateWithHandler:", &__block_literal_global_138);
}

- (void)_invalidateCrashRecoverySupport
{
  -[PLLazyObject invalidate](self->_lazyCrashRecoverySupport, "invalidate");
}

- (void)_invalidateBackgroundJobService
{
  PLBackgroundJobService *backgroundJobService;
  void *v4;
  dispatch_block_t block;

  if (self->_backgroundJobService)
  {
    block = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_139);
    backgroundJobService = self->_backgroundJobService;
    -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBackgroundJobService invalidateLibraryBundle:completion:](backgroundJobService, "invalidateLibraryBundle:completion:", v4, block);

    dispatch_block_wait(block, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)_invalidateCPLReadiness
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyCPLReadiness, "invalidateWithHandler:", &__block_literal_global_141_40731);
}

- (void)_invalidateClientSideEncryptionManager
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyClientSideEncryptionManager, "invalidateWithHandler:", &__block_literal_global_143);
}

- (void)_invalidateDirectServerConfiguration
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyDirectServerConfiguration, "invalidateWithHandler:", &__block_literal_global_145);
}

- (void)_invalidateCameraPreviewWellManager
{
  -[PLLazyObject invalidate](self->_lazyCameraPreviewWellManager, "invalidate");
}

- (void)_invalidateSyndicationDeleteManager
{
  -[PLLazyObject invalidate](self->_lazySyndicationDeleteManager, "invalidate");
}

- (void)_invalidateCacheDeleteSupport
{
  -[PLLazyObject invalidate](self->_lazyCacheDeleteSupport, "invalidate");
}

- (void)_invalidateOutstandingTransactionHandlerTimer
{
  os_unfair_lock_s *p_outstandingTransactionHandlerTimerLock;
  OS_dispatch_source *outstandingTransactionHandlerTimer;
  OS_dispatch_source *v5;

  p_outstandingTransactionHandlerTimerLock = &self->_outstandingTransactionHandlerTimerLock;
  os_unfair_lock_lock(&self->_outstandingTransactionHandlerTimerLock);
  outstandingTransactionHandlerTimer = self->_outstandingTransactionHandlerTimer;
  self->_outstandingTransactionHandlerTimer = 0;
  v5 = outstandingTransactionHandlerTimer;

  os_unfair_lock_unlock(p_outstandingTransactionHandlerTimerLock);
  +[PLClientServerTransaction cancelOutstandingTransactionHandlerTimer:](PLClientServerTransaction, "cancelOutstandingTransactionHandlerTimer:", v5);

}

- (void)_invalidateCPLSettings
{
  -[PLLazyObject invalidate](self->_lazyCPLSettings, "invalidate");
}

- (void)_invalidateMainScopeIdentifier
{
  -[PLLazyObject invalidate](self->_lazyMainScopeIdentifier, "invalidate");
}

- (void)_invalidateAnalysisCoordinator
{
  -[PLLazyObject invalidate](self->_lazyAnalysisCoordinator, "invalidate");
}

- (void)_invalidateAvailabilityProgressDelegate
{
  -[PLLazyObject invalidate](self->_lazyAvailabilityProgressDelegate, "invalidate");
}

- (void)_invalidateAvailabilityTransitionDelegate
{
  -[PLLazyObject invalidate](self->_lazyAvailabilityTransitionDelegate, "invalidate");
}

- (void)_invalidateAvailabilityComputer
{
  -[PLLazyObject invalidate](self->_lazyAvailabilityComputer, "invalidate");
}

- (void)_invalidateReadyForAnalysis
{
  -[PLLazyObject invalidate](self->_lazyReadyForAnalysis, "invalidate");
}

- (PLRelationshipOrderKeyManager)relationshipOrderKeyManager
{
  return (PLRelationshipOrderKeyManager *)-[PLLazyObject objectValue](self->_lazyRelationshipOrderKeyManager, "objectValue");
}

- (PLMomentGenerationDataManager)momentGenerationDataManager
{
  void *v3;

  if (PLPlatformMomentsSupported())
  {
    -[PLLazyObject objectValue](self->_lazyMomentGenerationDataManager, "objectValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PLMomentGenerationDataManager *)v3;
}

- (PLDuplicateProcessor)duplicateProcessor
{
  return (PLDuplicateProcessor *)-[PLLazyObject objectValue](self->_lazyDuplicateProcessor, "objectValue");
}

- (PLRebuildJournalManager)rebuildJournalManager
{
  return (PLRebuildJournalManager *)-[PLLazyObject objectValue](self->_lazyRebuildJournalManager, "objectValue");
}

- (id)newRebuildJournalManager
{
  if (+[PLRebuildJournalManager isEnabledWithPathManager:error:](PLRebuildJournalManager, "isEnabledWithPathManager:error:", self->_pathManager, 0))
  {
    return -[PLRebuildJournalManager initWithLibraryServicesManager:]([PLRebuildJournalManager alloc], "initWithLibraryServicesManager:", self);
  }
  else
  {
    return 0;
  }
}

- (PLComputeCacheManager)computeCacheManager
{
  return (PLComputeCacheManager *)-[PLLazyObject objectValue](self->_lazyComputeCacheManager, "objectValue");
}

- (id)newComputeCacheManager
{
  PLComputeCacheManager *v2;

  v2 = -[PLComputeCacheManager initWithLibraryServicesManager:]([PLComputeCacheManager alloc], "initWithLibraryServicesManager:", self);
  -[PLComputeCacheManager start](v2, "start");
  return v2;
}

- (id)journalManagerForName:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  +[PLComputeCacheManager name](PLComputeCacheManager, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    -[PLLibraryServicesManager computeCacheManager](self, "computeCacheManager");
  else
    -[PLLibraryServicesManager rebuildJournalManager](self, "rebuildJournalManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PFClientSideEncryptionManager)clientSideEncryptionManager
{
  void *v3;

  if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
  {
    -[PLLazyObject objectValue](self->_lazyClientSideEncryptionManager, "objectValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PFClientSideEncryptionManager *)v3;
}

- (id)newClientSideEncryptionManager
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0D750E8]);
  v3 = (void *)objc_msgSend(v2, "initWithProfile:", *MEMORY[0x1E0D753E8]);
  objc_msgSend(v3, "start");
  return v3;
}

- (id)newDirectServerConfiguration
{
  PLPhotoLibraryPathManager *pathManager;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  pathManager = self->_pathManager;
  v10 = 0;
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](pathManager, "photoDirectoryWithType:createIfNeeded:error:", 5, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  if (v4)
  {
    PLBackendGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Could not create private directory for direct server configuration cache: %@", buf, 0xCu);
    }

  }
  v6 = objc_alloc(MEMORY[0x1E0D11358]);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithClientLibraryBaseURL:minUpdateInterval:updateIntervalKey:", v7, *MEMORY[0x1E0D11220], *MEMORY[0x1E0D11228]);

  return v8;
}

- (PLQuickActionManager)quickActionManager
{
  return (PLQuickActionManager *)-[PLLazyObject objectValue](self->_lazyQuickActionManager, "objectValue");
}

- (PLKeywordManager)keywordManager
{
  return (PLKeywordManager *)-[PLLazyObject objectValue](self->_lazyKeywordManager, "objectValue");
}

- (PLPairing)pairingManager
{
  return (PLPairing *)-[PLLazyObject objectValue](self->_lazyPairingManager, "objectValue");
}

- (PLCameraPreviewWellManager)cameraPreviewWellManager
{
  return (PLCameraPreviewWellManager *)-[PLLazyObject objectValue](self->_lazyCameraPreviewWellManager, "objectValue");
}

- (PLSyndicationDeleteEngine)syndicationDeleteManager
{
  return (PLSyndicationDeleteEngine *)-[PLLazyObject objectValue](self->_lazySyndicationDeleteManager, "objectValue");
}

- (PLCacheDeleteSupport)cacheDeleteSupport
{
  return (PLCacheDeleteSupport *)-[PLLazyObject objectValue](self->_lazyCacheDeleteSupport, "objectValue");
}

- (PLAnalysisCoordinator)analysisCoordinator
{
  return (PLAnalysisCoordinator *)-[PLLazyObject objectValue](self->_lazyAnalysisCoordinator, "objectValue");
}

- (id)availabilityProgressDelegate
{
  return (id)-[PLLazyObject objectValue](self->_lazyAvailabilityProgressDelegate, "objectValue");
}

- (id)availabilityTransitionDelegate
{
  return (id)-[PLLazyObject objectValue](self->_lazyAvailabilityTransitionDelegate, "objectValue");
}

- (PLFeatureAvailabilityComputer)availabilityComputer
{
  return (PLFeatureAvailabilityComputer *)-[PLLazyObject objectValue](self->_lazyAvailabilityComputer, "objectValue");
}

- (void)initializeChangeHandling
{
  id v2;

  -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initializeChangeHandling");

}

- (void)initializeConstraintsDirector
{
  id v2;
  id v3;

  -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "constraintsDirector");

}

- (PLCPLSettings)cplSettings
{
  return (PLCPLSettings *)-[PLLazyObject objectValue](self->_lazyCPLSettings, "objectValue");
}

- (id)_libraryServicesStateNodeWithState:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D73260]), "initWithLibraryServicesState:qualityOfService:logPrefix:", a3, self->_maxWaiterQoS, self->_logPrefix);
}

- (BOOL)enqueueOperation:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__40700;
  v20 = __Block_byref_object_dispose__40701;
  v21 = 0;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__PLLibraryServicesManager_enqueueOperation_error___block_invoke;
  v12[3] = &unk_1E3676348;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = *((unsigned __int8 *)v23 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)shutdownLibraryWithDescription:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0D74498];
  v11 = *MEMORY[0x1E0CB2938];
  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41021, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "shutdownBundle:reason:", WeakRetained, v10);
}

- (void)_increaseStateQueueQoSIfNeeded
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = qos_class_self();
  if (v4 > self->_maxWaiterQoS)
  {
    v5 = v4;
    PLLibraryServicesGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromQoSClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromQoSClass();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Increase QoS from %{public}@ to %{public}@", (uint8_t *)&v11, 0x20u);

    }
    self->_maxWaiterQoS = v5;
    -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setQos:", v5);

  }
}

- (void)_resetStateQueueQoS
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (self->_maxWaiterQoS != 9)
  {
    PLLibraryServicesGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromQoSClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Resetting QoS to %{public}@", (uint8_t *)&v8, 0x16u);

    }
    self->_maxWaiterQoS = 9;
    -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQos:", 9);

  }
}

- (BOOL)_enqueueOperation:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v6, "setLogPrefix:", self->_logPrefix);
  if (!-[PLLibraryServicesManager isFinalizing](self, "isFinalizing")
    || (v8 = objc_msgSend(v6, "requiredState"), v8 == objc_msgSend((id)objc_opt_class(), "_finalState")))
  {
    if (-[PLLibraryServicesManager isActive](self, "isActive"))
    {
      v9 = -[PLLibraryServicesManager _state](self, "_state");
      if (v9 == objc_msgSend(v6, "requiredState"))
      {
        -[PLLibraryServicesManager _increaseStateQueueQoSIfNeeded](self, "_increaseStateQueueQoSIfNeeded");
        PLLibraryServicesGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          -[PLLibraryServicesManager logPrefix](self, "logPrefix");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "qualityOfService");
          PLStringFromQualityOfService();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v30 = v11;
          v31 = 2114;
          v32 = v6;
          v33 = 2114;
          v34 = v12;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%{public}@: Adding operation: %{public}@ at QoS: %{public}@", buf, 0x20u);

        }
        -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "enqueueOperation:error:", v6, 0);

        if ((v14 & 1) == 0)
          goto LABEL_12;
LABEL_11:
        v16 = 1;
        goto LABEL_19;
      }
    }
    -[PLLibraryServicesManager _state](self, "_state");
    objc_msgSend(v6, "requiredState");
    if (PLHasPathFromSourceStateToTargetState())
    {
      -[PLLibraryServicesManager _increaseStateQueueQoSIfNeeded](self, "_increaseStateQueueQoSIfNeeded");
      -[PLLibraryServicesManager mutablePendingOperations](self, "mutablePendingOperations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v6);

      goto LABEL_11;
    }
  }
LABEL_12:
  -[PLLibraryServicesManager _state](self, "_state", CFSTR("currentState"));
  PLStringFromLibraryServicesState();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = CFSTR("operation");
  v28[0] = v17;
  objc_msgSend(v6, "description");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_opt_class();
  -[PLLibraryServicesManager invalidationError](self, "invalidationError");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorForInvalidationError:userInfo:", v21, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x1E0D73258], "shouldSuppressLogging") & 1) == 0)
  {
    PLLibraryServicesGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLibraryServicesManager _state](self, "_state");
      PLStringFromLibraryServicesState();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v24;
      v31 = 2114;
      v32 = v25;
      v33 = 2114;
      v34 = v6;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Enqueue operation failed with invalid library state %{public}@ %{public}@", buf, 0x20u);

    }
  }
  if (a4)
    *a4 = objc_retainAutorelease(v22);

  v16 = 0;
LABEL_19:

  return v16;
}

- (id)activeOperations
{
  void *v2;
  void *v3;

  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pendingOperations
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[PLLibraryServicesManager mutablePendingOperations](self, "mutablePendingOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_enqueueAwaitOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  _QWORD v17[6];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__PLLibraryServicesManager__enqueueAwaitOperation__block_invoke;
  v17[3] = &unk_1E3674C18;
  v17[4] = self;
  v17[5] = v4;
  objc_msgSend(MEMORY[0x1E0D73258], "operationWithName:requiredState:parentProgress:execution:", CFSTR("Await Operation"), v4, 0, v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLogPrefix:", self->_logPrefix);
  qos_class_self();
  objc_msgSend(v5, "setQualityOfService:", PLQualityOfServiceFromQoSClass());
  PLLibraryServicesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "qualityOfService");
    PLStringFromQualityOfService();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v7;
    v20 = 2114;
    v21 = v5;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: Adding await operation: %{public}@ at QoS: %{public}@", buf, 0x20u);

  }
  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "enqueueOperation:error:", v5, &v16);
  v11 = v16;

  if ((v10 & 1) != 0)
  {
    v12 = v5;
  }
  else
  {
    PLLibraryServicesGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2112;
      v21 = v5;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enqueue await operation: %@ error: %@", buf, 0x20u);

    }
    v12 = 0;
  }

  return v12;
}

- (void)_enqueueExternalWaiterCompletionBlockForState:(int64_t)a3 completionBlock:(id)a4
{
  NSObject *v7;
  NSMutableDictionary *externalWaiterCompletionBlocksByState;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryServicesManager.m"), 1332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  externalWaiterCompletionBlocksByState = self->_externalWaiterCompletionBlocksByState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](externalWaiterCompletionBlocksByState, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = self->_externalWaiterCompletionBlocksByState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v13 = (void *)MEMORY[0x19AEC174C](v15);
  objc_msgSend(v10, "addObject:", v13);

  -[PLLibraryServicesManager _increaseStateQueueQoSIfNeeded](self, "_increaseStateQueueQoSIfNeeded");
}

- (BOOL)transitionToState:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PLLibraryServicesManager_transitionToState_error___block_invoke;
  v9[3] = &unk_1E3675558;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  dispatch_sync(v7, v9);

  LOBYTE(a4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)a4;
}

- (void)_invalidate
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLLibraryServicesGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating", buf, 0xCu);

  }
  -[PLLibraryServicesManager _invalidateCPLReadiness](self, "_invalidateCPLReadiness");
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PLLibraryServicesManager__invalidate__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(v5, block);

  -[PLLibraryServicesManager _invalidateCloudPhotoLibraryManager](self, "_invalidateCloudPhotoLibraryManager");
  -[PLLibraryServicesManager _invalidateCrashRecoverySupport](self, "_invalidateCrashRecoverySupport");
  -[PLLibraryServicesManager _invalidateMomentGenerationDataManager](self, "_invalidateMomentGenerationDataManager");
  -[PLLibraryServicesManager _invalidateRebuildJournalManager](self, "_invalidateRebuildJournalManager");
  -[PLLibraryServicesManager _invalidateComputeCacheManager](self, "_invalidateComputeCacheManager");
  -[PLLibraryServicesManager _invalidateSearchIndexManager](self, "_invalidateSearchIndexManager");
  -[PLLibraryServicesManager _invalidateSearchIndexingEngine](self, "_invalidateSearchIndexingEngine");
  -[PLLibraryServicesManager _invalidateSearchDonationProgress](self, "_invalidateSearchDonationProgress");
  -[PLLibraryServicesManager _invalidateModelMigrator](self, "_invalidateModelMigrator");
  -[PLLibraryServicesManager _invalidateBackgroundJobService](self, "_invalidateBackgroundJobService");
  -[PLLibraryServicesManager _invalidateAlbumCountCoalescer](self, "_invalidateAlbumCountCoalescer");
  -[PLLibraryServicesManager _invalidateImageWriter](self, "_invalidateImageWriter");
  -[PLLibraryServicesManager _invalidateKeywordManager](self, "_invalidateKeywordManager");
  -[PLLibraryServicesManager _invalidatePairingManager](self, "_invalidatePairingManager");
  -[PLLibraryServicesManager _invalidateDuplicateProcessor](self, "_invalidateDuplicateProcessor");
  -[PLLibraryServicesManager _invalidateRelationshipOrderKeyManager](self, "_invalidateRelationshipOrderKeyManager");
  -[PLLibraryServicesManager _invalidateQuickActionManager](self, "_invalidateQuickActionManager");
  -[PLLibraryServicesManager _invalidateDatabaseContext](self, "_invalidateDatabaseContext");
  -[PLLibraryServicesManager _invalidateCameraPreviewWellManager](self, "_invalidateCameraPreviewWellManager");
  if (-[PLLibraryServicesManager isSyndicationPhotoLibrary](self, "isSyndicationPhotoLibrary"))
    -[PLLibraryServicesManager _invalidateSyndicationPhotoLibrarySpecificServices](self, "_invalidateSyndicationPhotoLibrarySpecificServices");
  -[PLLibraryServicesManager _invalidateOutstandingTransactionHandlerTimer](self, "_invalidateOutstandingTransactionHandlerTimer");
  -[PLLibraryServicesManager _invalidateClientSideEncryptionManager](self, "_invalidateClientSideEncryptionManager");
  -[PLLibraryServicesManager _invalidateDirectServerConfiguration](self, "_invalidateDirectServerConfiguration");
  -[PLLibraryServicesManager _invalidateMainScopeIdentifier](self, "_invalidateMainScopeIdentifier");
  -[PLLibraryServicesManager _invalidateCPLSettings](self, "_invalidateCPLSettings");
  -[PLLibraryServicesManager _invalidateAnalysisCoordinator](self, "_invalidateAnalysisCoordinator");
  -[PLLibraryServicesManager _invalidateReadyForAnalysis](self, "_invalidateReadyForAnalysis");
  -[PLLibraryServicesManager _invalidateAvailabilityComputer](self, "_invalidateAvailabilityComputer");
  self->_wellKnownPhotoLibraryIdentifier = -[PLLibraryServicesManager _determineWellKnownPhotoLibraryIdentifier](self, "_determineWellKnownPhotoLibraryIdentifier");
}

- (BOOL)finalize:(id *)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v13;
  _QWORD block[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager setFinalizing:](self, "setFinalizing:", 1);
  PLLibraryServicesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting finalize", buf, 0xCu);

  }
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PLLibraryServicesManager_finalize___block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(v7, block);

  v13 = 0;
  v8 = -[PLLibraryServicesManager awaitLibraryState:error:](self, "awaitLibraryState:error:", objc_msgSend((id)objc_opt_class(), "_finalState"), &v13);
  v9 = v13;
  if (v8)
  {
    -[PLLibraryServicesManager _invalidate](self, "_invalidate");
  }
  else
  {
    PLLibraryServicesGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Finalize failed with error %@", buf, 0x16u);

    }
    if (a3)
      *a3 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (void)deactivateWithInvalidationError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  PLLibraryServicesManager *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLibraryServicesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Deactivating with error %@", buf, 0x16u);

  }
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__PLLibraryServicesManager_deactivateWithInvalidationError___block_invoke;
  v12 = &unk_1E3677C18;
  v13 = self;
  v14 = v4;
  v8 = v4;
  dispatch_sync(v7, &v9);

  -[PLLibraryServicesManager _invalidate](self, "_invalidate", v9, v10, v11, v12, v13);
}

- (BOOL)_canTransitionToState:(int64_t)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;
  BOOL v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[PLLibraryServicesManager _state](self, "_state");
  -[PLLibraryServicesManager _state](self, "_state");
  if ((PLCanMoveFromSourceStateToTargetState() & 1) != 0)
  {
    -[PLLibraryServicesManager activeOperations](self, "activeOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      v18 = 0;
      v19 = 1;
      goto LABEL_9;
    }
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v21[0] = CFSTR("currentState");
    PLStringFromLibraryServicesState();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v21[1] = CFSTR("targetState");
    PLStringFromLibraryServicesState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = CFSTR("reason");
    v22[1] = v12;
    v22[2] = CFSTR("Current library state has active operations");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v22;
    v15 = v21;
    v16 = 3;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0D74498];
    v23[0] = CFSTR("currentState");
    PLStringFromLibraryServicesState();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("targetState");
    v24[0] = v11;
    PLStringFromLibraryServicesState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = v24;
    v15 = v23;
    v16 = 2;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 43002, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a4 = v18;
  }
  else
  {
    v19 = 0;
  }
LABEL_9:

  return v19;
}

- (void)_transitionToState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");

  if (v7 != a3)
  {
    PLLibraryServicesGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromLibraryServicesState();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PLStringFromLibraryServicesState();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v43 = v9;
      v44 = 2114;
      v45 = v10;
      v46 = 2114;
      v47 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Transition from library services state %{public}@ to %{public}@", buf, 0x20u);

    }
  }
  -[PLLibraryServicesManager _stopObservingLibraryStateCompletedAllOperations](self, "_stopObservingLibraryStateCompletedAllOperations");
  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "terminate");

  -[PLLibraryServicesManager _libraryServicesStateNodeWithState:](self, "_libraryServicesStateNodeWithState:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager _setCurrentStateNode:](self, "_setCurrentStateNode:", v13);

  if (-[PLLibraryServicesManager isActive](self, "isActive"))
  {
    -[PLLibraryServicesManager libraryServicesDelegate](self, "libraryServicesDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (objc_msgSend((id)objc_opt_class(), "_initialState") == a3)
      {
        objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLLibraryServicesManager setPreRunningProgress:](self, "setPreRunningProgress:", v15);

        PLLibraryServicesGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          -[PLLibraryServicesManager logPrefix](self, "logPrefix");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLLibraryServicesManager preRunningProgress](self, "preRunningProgress");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v17;
          v44 = 2112;
          v45 = v18;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: preRunningProgress = %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 100);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLLibraryServicesManager setPostRunningProgress:](self, "setPostRunningProgress:", v19);

        PLLibraryServicesGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[PLLibraryServicesManager logPrefix](self, "logPrefix");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLLibraryServicesManager postRunningProgress](self, "postRunningProgress");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v21;
          v44 = 2112;
          v45 = v22;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: postRunnningProgress = %@", buf, 0x16u);

        }
      }
      -[PLLibraryServicesManager libraryServicesDelegate](self, "libraryServicesDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "operationsForLibraryStateTransition:", a3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v25 = v24;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v26)
      {
        v27 = v26;
        v28 = 0;
        v29 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v38 != v29)
              objc_enumerationMutation(v25);
            v31 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v28 += objc_msgSend(v31, "progressPercentOfTotal", (_QWORD)v37);
            -[PLLibraryServicesManager _enqueueOperation:error:](self, "_enqueueOperation:error:", v31, 0);
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        }
        while (v27);
      }
      else
      {
        v28 = 0;
      }

      if (objc_msgSend((id)objc_opt_class(), "_initialState") == a3)
      {
        PLLibraryServicesGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          -[PLLibraryServicesManager logPrefix](self, "logPrefix");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "debugDescription");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v33;
          v44 = 2112;
          v45 = v34;
          v46 = 2048;
          v47 = v28;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "%{public}@: Finished adding operations: %@\ntotalUnitCounts is %ld.", buf, 0x20u);

        }
      }

    }
    -[PLLibraryServicesManager currentStateNode](self, "currentStateNode", (_QWORD)v37);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLibraryServicesManager _addPendingOperationsForStateNode:](self, "_addPendingOperationsForStateNode:", v35);

    -[PLLibraryServicesManager _startObservingLibraryStateCompletedAllOperations](self, "_startObservingLibraryStateCompletedAllOperations");
    -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "run");

  }
  -[PLLibraryServicesManager _dispatchExternalWaitersForState:](self, "_dispatchExternalWaitersForState:", a3);
}

- (void)_dispatchExternalWaitersForState:(int64_t)a3
{
  NSObject *v5;
  int64_t v6;
  int64_t v7;
  NSMutableDictionary *externalWaiterCompletionBlocksByState;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_msgSend((id)objc_opt_class(), "_initialState");
  if (v6 <= a3)
  {
    v7 = v6;
    do
    {
      externalWaiterCompletionBlocksByState = self->_externalWaiterCompletionBlocksByState;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](externalWaiterCompletionBlocksByState, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v11);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15++) + 16))();
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v13);
        }

        v16 = self->_externalWaiterCompletionBlocksByState;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v16, "removeObjectForKey:", v17);

      }
    }
    while (v7++ != a3);
  }
}

- (void)_startObservingLibraryStateCompletedAllOperations
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLLibraryServicesManager operationCountObservee](self, "operationCountObservee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[PLLibraryServicesManager _stopObservingLibraryStateCompletedAllOperations](self, "_stopObservingLibraryStateCompletedAllOperations");
  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOperationCountObserver:context:", self, &PLLibraryServicesManagerOperationQueueObserverOperationCountContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager setOperationCountObservee:](self, "setOperationCountObservee:", v5);

}

- (void)_stopObservingLibraryStateCompletedAllOperations
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLLibraryServicesManager operationCountObservee](self, "operationCountObservee");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0D73260];
    -[PLLibraryServicesManager operationCountObservee](self, "operationCountObservee");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeOperationCountObserver:fromObservedObject:context:", self, v6, &PLLibraryServicesManagerOperationQueueObserverOperationCountContext);

    -[PLLibraryServicesManager setOperationCountObservee:](self, "setOperationCountObservee:", 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  NSObject *v12;
  objc_super v13;
  _QWORD block[5];

  v10 = a4;
  v11 = v10;
  if (a6 == &PLLibraryServicesManagerOperationQueueObserverOperationCountContext)
  {
    if (!objc_msgSend(v10, "operationCount"))
    {
      -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __75__PLLibraryServicesManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E3677AA0;
      block[4] = self;
      dispatch_async(v12, block);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PLLibraryServicesManager;
    -[PLLibraryServicesManager observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, v10, a5, a6);
  }

}

- (void)_handleLibraryStateCompletedAllOperations
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD block[4];
  id v11[2];
  id location;

  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "operationCount");

  if (!v5)
  {
    v6 = -[PLLibraryServicesManager _state](self, "_state");
    objc_msgSend((id)objc_opt_class(), "_finalState");
    if (PLCanMoveFromSourceStateToTargetState()
      && -[PLLibraryServicesManager isFinalizing](self, "isFinalizing"))
    {
      -[PLLibraryServicesManager _transitionToState:](self, "_transitionToState:", objc_msgSend((id)objc_opt_class(), "_finalState"));
    }
    if (v6 == (void *)7)
      -[PLLibraryServicesManager _resetStateQueueQoS](self, "_resetStateQueueQoS");
    -[PLLibraryServicesManager libraryServicesDelegate](self, "libraryServicesDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v7);

    v8 = objc_loadWeakRetained(&location);
    if (v8)
    {
      -[PLLibraryServicesManager helperQueue](self, "helperQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PLLibraryServicesManager__handleLibraryStateCompletedAllOperations__block_invoke;
      block[3] = &unk_1E3669C00;
      objc_copyWeak(v11, &location);
      v11[1] = v6;
      dispatch_async(v9, block);

      objc_destroyWeak(v11);
    }
    objc_destroyWeak(&location);
  }
}

- (void)_setCurrentStateNode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  PLLibraryServicesStateNode *currentStateNode;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v10[0] = CFSTR("PLLibraryServicesManagerStateChangeStateKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("PLLibraryServicesManagerStateChangeStateNodeKey");
  v11[0] = v6;
  v11[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PLLibraryServicesManagerStateWillChangeNotification"), self, v7);
  currentStateNode = self->_currentStateNode;
  self->_currentStateNode = (PLLibraryServicesStateNode *)v4;

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PLLibraryServicesManagerStateDidChangeNotification"), self, v7);
}

- (void)_addPendingOperationsForStateNode:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "state");
  -[PLLibraryServicesManager pendingOperations](self, "pendingOperations");
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v12, "requiredState") == v7)
        {
          objc_msgSend(v6, "addObject:", v12);
          -[PLLibraryServicesManager mutablePendingOperations](self, "mutablePendingOperations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObject:", v12);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
    }
    while (v9);
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = v6;
  v14 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v24);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        PLLibraryServicesGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          -[PLLibraryServicesManager logPrefix](self, "logPrefix");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "qualityOfService");
          PLStringFromQualityOfService();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v35 = v20;
          v36 = 2114;
          v37 = v18;
          v38 = 2114;
          v39 = v21;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "%{public}@: Adding pending operation: %{public}@ at QoS: %{public}@", buf, 0x20u);

        }
        objc_msgSend(v18, "setLogPrefix:", self->_logPrefix);
        if ((objc_msgSend(v4, "enqueueOperation:error:", v18, 0) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryServicesManager.m"), 1633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enqueued"));

        }
      }
      v15 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    }
    while (v15);
  }

}

- (void)_cancelPendingOperations
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager stateSerializationQueue](self, "stateSerializationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PLLibraryServicesManager mutablePendingOperations](self, "mutablePendingOperations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "cancel");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[PLLibraryServicesManager mutablePendingOperations](self, "mutablePendingOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAllObjects");

}

- (void)performBlockWithImportMutex:(id)a3
{
  PLSafeRunWithUnfairLock();
}

- (void)performFileSystemAssetImporterWorkWithLibrary:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  PLFileSystemAssetImporter *v8;
  NSObject *v9;
  void *v10;
  PLFileSystemAssetImporter *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[PLFileSystemAssetImporter initWithPhotoLibrary:libraryServicesManager:]([PLFileSystemAssetImporter alloc], "initWithPhotoLibrary:libraryServicesManager:", v6, self);
  PLLibraryServicesGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Preparing to run file system asset importer work block", buf, 0xCu);

  }
  v14 = v6;
  v15 = v7;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  PLSafeRunWithUnfairLock();

}

- (void)registerOutstandingTransactionsHandler:(id)a3
{
  id v5;
  void *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *outstandingTransactionHandlerTimer;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v5 = a3;
  -[PLLibraryServicesManager pathManager](self, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__PLLibraryServicesManager_registerOutstandingTransactionsHandler___block_invoke;
  v11[3] = &unk_1E3677AA0;
  v11[4] = self;
  +[PLClientServerTransaction handleOutstandingTransactionsForPathManager:sqliteErrorHandler:handler:](PLClientServerTransaction, "handleOutstandingTransactionsForPathManager:sqliteErrorHandler:handler:", v6, v11, v5);
  v7 = (OS_dispatch_source *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryServicesManager.m"), 1665, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timer != nil"));

  }
  os_unfair_lock_lock(&self->_outstandingTransactionHandlerTimerLock);
  outstandingTransactionHandlerTimer = self->_outstandingTransactionHandlerTimer;
  if (outstandingTransactionHandlerTimer)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryServicesManager.m"), 1667, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_outstandingTransactionHandlerTimer == nil"));

    outstandingTransactionHandlerTimer = self->_outstandingTransactionHandlerTimer;
  }
  self->_outstandingTransactionHandlerTimer = v7;

  os_unfair_lock_unlock(&self->_outstandingTransactionHandlerTimerLock);
}

- (void)_setCameraRollCountedInQuota:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  pl_dispatch_once();
  if (v3)
    objc_msgSend((id)_setCameraRollCountedInQuota___BackupManager, "countCameraRollQuota");
  else
    objc_msgSend((id)_setCameraRollCountedInQuota___BackupManager, "discountCameraRollQuota");
}

- (void)setICloudPhotosEnabledInternal:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  _DWORD v29[7];

  v3 = a3;
  *(_QWORD *)&v29[5] = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLLibraryServicesManager.m"), 1701, CFSTR("Only Assetsd should be calling setICloudPhotosEnabledInternal"));

  }
  -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indicatorFileCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLLibraryServicesGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v9)
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v29 = v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: enabling iCloud Photos", buf, 0xCu);

    }
    objc_msgSend(v7, "writeEnableICloudPhotosMarker");
    if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
    {
      -[PLLibraryServicesManager modelMigrator](self, "modelMigrator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isPostProcessingLightweightMigration");

      if ((v12 & 1) == 0)
      {
        PLLibraryServicesGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          -[PLLibraryServicesManager logPrefix](self, "logPrefix");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v29 = v14;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: deleting all iTunes synced content", buf, 0xCu);

        }
        -[PLLibraryServicesManager databaseContext](self, "databaseContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "performSync:withName:", &__block_literal_global_189, "-[PLLibraryServicesManager setICloudPhotosEnabledInternal:]");

      }
      PLLibraryServicesGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        -[PLLibraryServicesManager logPrefix](self, "logPrefix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v29 = v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: deleting all My Photo Stream assets", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", *MEMORY[0x1E0D74DF0], *MEMORY[0x1E0D74DB8]);
      -[PLLibraryServicesManager imageWriter](self, "imageWriter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "enqueueJob:", v18);

      -[PLLibraryServicesManager _setCameraRollCountedInQuota:](self, "_setCameraRollCountedInQuota:", 1);
    }
  }
  else
  {
    if (v9)
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v29 = v20;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: disabling iCloud Photos", buf, 0xCu);

    }
    objc_msgSend(v7, "writeDisableICloudPhotosMarker");
    if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
      -[PLLibraryServicesManager _setCameraRollCountedInQuota:](self, "_setCameraRollCountedInQuota:", 0);
  }
  -[PLLibraryServicesManager readyForAnalysis](self, "readyForAnalysis");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "resetReadyForAnalysisState");

  -[PLLibraryServicesManager cplSettings](self, "cplSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v23 = objc_msgSend(v22, "setICPLEnabled:error:", v3, &v27);
  v24 = v27;

  if ((v23 & 1) == 0)
  {
    PLLibraryServicesGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v29[0] = v3;
      LOWORD(v29[1]) = 2112;
      *(_QWORD *)((char *)&v29[1] + 2) = v24;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed to write CPL enabled setting to %d, %@", buf, 0x12u);
    }

  }
  if (objc_msgSend(v7, "isICloudPhotosPaused"))
  {
    CFPreferencesSetAppValue(CFSTR("cloudPhotosPaused"), 0, CFSTR("com.apple.mobileslideshow"));
    objc_msgSend(v7, "clearPauseMarkerForReason:", 3);
  }
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));

}

- (BOOL)willBecomeNonSyncablePhotoLibrary:(id *)a3
{
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = -[PLLibraryServicesManager awaitLibraryState:error:](self, "awaitLibraryState:error:", 6, a3);
  if (v4)
  {
    PLLibraryServicesGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PLLibraryServicesManager logPrefix](self, "logPrefix");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D731F0];
      -[PLLibraryServicesManager libraryURL](self, "libraryURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "descriptionWithFileURL:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary");
      v11 = CFSTR("no");
      *(_DWORD *)buf = 138543874;
      v31 = v6;
      v32 = 2112;
      if (v10)
        v11 = CFSTR("yes");
      v33 = v9;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Library will become non-syncable: %@ isSPL: %@", buf, 0x20u);

    }
    -[PLLibraryServicesManager cloudPhotoLibraryManager](self, "cloudPhotoLibraryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "disableiCPLSyncWillBecomeNonSyncablePhotoLibrary");

    if (-[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary"))
    {
      v13 = dispatch_group_create();
      +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "cachedPrimaryAppleAccount");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = *MEMORY[0x1E0C8F380];
      if (objc_msgSend(v15, "isEnabledForDataclass:", *MEMORY[0x1E0C8F380]))
      {
        objc_msgSend(v15, "setEnabled:forDataclass:", 0, v16);
        v17 = *MEMORY[0x1E0C8F410];
        if ((objc_msgSend(v15, "isEnabledForDataclass:", *MEMORY[0x1E0C8F410]) & 1) == 0)
        {
LABEL_14:
          PLLibraryServicesGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            -[PLLibraryServicesManager logPrefix](self, "logPrefix");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v31 = v24;
            v32 = 2112;
            v33 = v15;
            _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: SPL Change: Updating account %@", buf, 0x16u);

          }
          +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v13);
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __62__PLLibraryServicesManager_willBecomeNonSyncablePhotoLibrary___block_invoke;
          v27[3] = &unk_1E3669C68;
          v27[4] = self;
          v28 = v15;
          v29 = v13;
          objc_msgSend(v25, "saveAccount:withDataclassActions:doVerify:completion:", v28, 0, 0, v27);

          goto LABEL_17;
        }
      }
      else
      {
        v17 = *MEMORY[0x1E0C8F410];
        if (!objc_msgSend(v15, "isEnabledForDataclass:", *MEMORY[0x1E0C8F410]))
        {
LABEL_17:
          dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);

          return v4;
        }
      }
      objc_msgSend(v15, "setEnabled:forDataclass:", 0, v17);
      PLLibraryServicesGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[PLLibraryServicesManager logPrefix](self, "logPrefix");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1E0D731F0];
        -[PLLibraryServicesManager libraryURL](self, "libraryURL");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "descriptionWithFileURL:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2112;
        v33 = v22;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: SPL Change: Disabling Shared Albums of previous SPL at %@", buf, 0x16u);

      }
      +[PLCloudSharingEnablingJob disableCloudSharingWithLibraryServicesManager:](PLCloudSharingEnablingJob, "disableCloudSharingWithLibraryServicesManager:", self);
      goto LABEL_14;
    }
  }
  return v4;
}

- (void)didBecomeNonSyncablePhotoLibrary
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[PLLibraryServicesManager isSystemPhotoLibrary](self, "isSystemPhotoLibrary");
  self->_wellKnownPhotoLibraryIdentifier = -[PLLibraryServicesManager _determineWellKnownPhotoLibraryIdentifier](self, "_determineWellKnownPhotoLibraryIdentifier");
  -[PLLazyObject resetObject](self->_lazyMainScopeIdentifier, "resetObject");
  -[PLLazyObject resetObjectWithHandler:](self->_lazyCloudPhotoLibraryManager, "resetObjectWithHandler:", &__block_literal_global_200);
  -[PLLibraryServicesManager readyForAnalysis](self, "readyForAnalysis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetReadyForAnalysisState");

  if (v3)
    -[PLLibraryServicesManager _invalidateSystemPhotoLibrarySpecificServices](self, "_invalidateSystemPhotoLibrarySpecificServices");
  -[PLLibraryServicesManager backgroundJobService](self, "backgroundJobService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager libraryBundle](self, "libraryBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signalBackgroundProcessingNeededOnBundle:", v5);

}

- (void)didRemainSyncablePhotoLibrary
{
  id v3;

  -[PLLazyObject resetObjectWithHandler:](self->_lazyCloudPhotoLibraryManager, "resetObjectWithHandler:", &__block_literal_global_201_40617);
  v3 = -[PLLibraryServicesManager cloudPhotoLibraryManager](self, "cloudPhotoLibraryManager");
}

- (BOOL)disableiCPLForLibraryDeletionWithError:(id *)a3
{
  PLPhotoLibraryOpener *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  if (-[PLLibraryServicesManager isCPLSyncablePhotoLibrary](self, "isCPLSyncablePhotoLibrary"))
  {
    v5 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:]([PLPhotoLibraryOpener alloc], "initWithLibraryServicesManager:reportInProgressUpgrades:", self, 0);
    v6 = -[PLPhotoLibraryOpener openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:](v5, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 1, 0, a3);
    if (v6)
    {
      -[PLLibraryServicesManager cloudPhotoLibraryManager](self, "cloudPhotoLibraryManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "disableiCPLSyncForLibraryDeletion");
      }
      else
      {
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "disableiCPLForLibraryDeletionWithError: CPL manager unexpectedly nil, unable to disable iCPL", v11, 2u);
        }

      }
    }

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)stateCaptureDictionary
{
  NSObject *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  PLLibraryServicesGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLLibraryServicesManager logPrefix](self, "logPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D731F0];
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryBundle);
    objc_msgSend(WeakRetained, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptionWithFileURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412546;
    v22 = v4;
    v23 = 2112;
    v24 = v8;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "STATEDUMP: %@: State information for library services manager at path %@", (uint8_t *)&v21, 0x16u);

  }
  -[PLLibraryServicesManager currentStateNode](self, "currentStateNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PLLibraryServicesManager state](self, "state");
  PLStringFromLibraryServicesState();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("state"));

  objc_msgSend(v9, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("currentStateNode"));

  -[PLLibraryServicesManager activeOperations](self, "activeOperations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_pl_prettyDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("activeOperations"));

  -[PLLibraryServicesManager pendingOperations](self, "pendingOperations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_pl_prettyDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("pendingOperations"));

  PLStringFromQoSClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("maxWaiterQoS"));

  -[PLLibraryServicesManager wellKnownPhotoLibraryIdentifier](self, "wellKnownPhotoLibraryIdentifier");
  PLStringFromWellKnownPhotoLibraryIdentifier();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("wellKnownPhotoLibraryIdentifier"));

  -[PLBackgroundJobService description](self->_backgroundJobService, "description");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("backgroundJobService"));

  return v10;
}

- (PLLibraryServicesDelegate)libraryServicesDelegate
{
  return (PLLibraryServicesDelegate *)objc_getProperty(self, a2, 376, 1);
}

- (void)setLibraryServicesDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (NSError)invalidationError
{
  return self->_invalidationError;
}

- (PLBackgroundJobService)backgroundJobService
{
  return (PLBackgroundJobService *)objc_getProperty(self, a2, 392, 1);
}

- (PLTrackableRequestManager)trackableRequestManager
{
  return (PLTrackableRequestManager *)objc_getProperty(self, a2, 400, 1);
}

- (PLCacheDeleteRegistration)cacheDeleteRegistration
{
  return (PLCacheDeleteRegistration *)objc_getProperty(self, a2, 408, 1);
}

- (NSProgress)preRunningProgress
{
  return self->_preRunningProgress;
}

- (void)setPreRunningProgress:(id)a3
{
  objc_storeStrong((id *)&self->_preRunningProgress, a3);
}

- (void)setPostRunningProgress:(id)a3
{
  objc_storeStrong((id *)&self->_postRunningProgress, a3);
}

- (PLLibraryOpenerCreationOptions)openerCreationOptions
{
  return self->_openerCreationOptions;
}

- (void)setOpenerCreationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_openerCreationOptions, a3);
}

- (NSString)upgradeClient
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (void)setUpgradeClient:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 440);
}

- (PLMigrationServiceProtocol)migrationServiceProxy
{
  return (PLMigrationServiceProtocol *)objc_loadWeakRetained((id *)&self->_migrationServiceProxy);
}

- (void)setMigrationServiceProxy:(id)a3
{
  objc_storeWeak((id *)&self->_migrationServiceProxy, a3);
}

- ($5E5F304956FB491AF6F034FDF0808287)resourceCacheMetrics
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];
  $5E5F304956FB491AF6F034FDF0808287 result;

  objc_copyStruct(v4, &self->_resourceCacheMetrics, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.var2 = v3;
  result.var3 = HIDWORD(v3);
  result.var0 = v2;
  result.var1 = HIDWORD(v2);
  return result;
}

- (void)setResourceCacheMetrics:(id)a3
{
  $5E5F304956FB491AF6F034FDF0808287 v3;

  v3 = a3;
  objc_copyStruct(&self->_resourceCacheMetrics, &v3, 16, 1, 0);
}

- (id)operationCountObservee
{
  return self->_operationCountObservee;
}

- (void)setOperationCountObservee:(id)a3
{
  objc_storeStrong(&self->_operationCountObservee, a3);
}

- (NSMutableArray)mutablePendingOperations
{
  return self->_mutablePendingOperations;
}

- (OS_dispatch_queue)helperQueue
{
  return self->_helperQueue;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isFinalizing
{
  return self->_finalizing;
}

- (void)setFinalizing:(BOOL)a3
{
  self->_finalizing = a3;
}

- (os_unfair_lock_s)importMutex
{
  return self->_importMutex;
}

- (void)setImportMutex:(os_unfair_lock_s)a3
{
  self->_importMutex = a3;
}

- (os_unfair_lock_s)fileSystemAssetImporterMutex
{
  return self->_fileSystemAssetImporterMutex;
}

- (void)setFileSystemAssetImporterMutex:(os_unfair_lock_s)a3
{
  self->_fileSystemAssetImporterMutex = a3;
}

- (os_unfair_lock_s)localeUpdateLock
{
  return self->_localeUpdateLock;
}

- (void)setLocaleUpdateLock:(os_unfair_lock_s)a3
{
  self->_localeUpdateLock = a3;
}

- (os_unfair_lock_s)contactsAuthorizationUpdateLock
{
  return self->_contactsAuthorizationUpdateLock;
}

- (void)setContactsAuthorizationUpdateLock:(os_unfair_lock_s)a3
{
  self->_contactsAuthorizationUpdateLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_helperQueue, 0);
  objc_storeStrong((id *)&self->_stateSerializationQueue, 0);
  objc_storeStrong((id *)&self->_mutablePendingOperations, 0);
  objc_storeStrong(&self->_operationCountObservee, 0);
  objc_storeStrong((id *)&self->_currentStateNode, 0);
  objc_destroyWeak((id *)&self->_migrationServiceProxy);
  objc_storeStrong((id *)&self->_upgradeClient, 0);
  objc_storeStrong((id *)&self->_openerCreationOptions, 0);
  objc_storeStrong((id *)&self->_postRunningProgress, 0);
  objc_storeStrong((id *)&self->_preRunningProgress, 0);
  objc_storeStrong((id *)&self->_cacheDeleteRegistration, 0);
  objc_storeStrong((id *)&self->_trackableRequestManager, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_libraryServicesDelegate, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_externalWaiterCompletionBlocksByState, 0);
  objc_storeStrong((id *)&self->_albumCountQueue, 0);
  objc_storeStrong((id *)&self->_outstandingTransactionHandlerTimer, 0);
  objc_storeStrong((id *)&self->_serverTransaction, 0);
  objc_storeStrong((id *)&self->_lazyAvailabilityComputer, 0);
  objc_storeStrong((id *)&self->_lazyAvailabilityTransitionDelegate, 0);
  objc_storeStrong((id *)&self->_lazyAvailabilityProgressDelegate, 0);
  objc_storeStrong((id *)&self->_lazyReadyForAnalysis, 0);
  objc_storeStrong((id *)&self->_lazyAnalysisCoordinator, 0);
  objc_storeStrong((id *)&self->_lazyMainScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_lazyCPLSettings, 0);
  objc_storeStrong((id *)&self->_lazyDirectServerConfiguration, 0);
  objc_storeStrong((id *)&self->_lazyDeferredProcessingServiceHandler, 0);
  objc_storeStrong((id *)&self->_lazyCacheDeleteSupport, 0);
  objc_storeStrong((id *)&self->_lazySyndicationDeleteManager, 0);
  objc_storeStrong((id *)&self->_lazyCameraPreviewWellManager, 0);
  objc_storeStrong((id *)&self->_lazyClientSideEncryptionManager, 0);
  objc_storeStrong((id *)&self->_lazyCPLReadiness, 0);
  objc_storeStrong((id *)&self->_lazyPairingManager, 0);
  objc_storeStrong((id *)&self->_lazyCrashRecoverySupport, 0);
  objc_storeStrong((id *)&self->_lazyCloudPhotoLibraryManager, 0);
  objc_storeStrong((id *)&self->_lazyImportSessionCountCoalescer, 0);
  objc_storeStrong((id *)&self->_lazyAlbumCountCoalescer, 0);
  objc_storeStrong((id *)&self->_lazyKeywordManager, 0);
  objc_storeStrong((id *)&self->_lazyQuickActionManager, 0);
  objc_storeStrong((id *)&self->_lazyComputeCacheManager, 0);
  objc_storeStrong((id *)&self->_lazyRebuildJournalManager, 0);
  objc_storeStrong((id *)&self->_lazyMomentGenerationDataManager, 0);
  objc_storeStrong((id *)&self->_lazyRelationshipOrderKeyManager, 0);
  objc_storeStrong((id *)&self->_lazyDuplicateProcessor, 0);
  objc_storeStrong((id *)&self->_lazyDatabaseContext, 0);
  objc_storeStrong((id *)&self->_lazySearchDonationProgress, 0);
  objc_storeStrong((id *)&self->_lazySearchIndexingEngine, 0);
  objc_storeStrong((id *)&self->_lazySearchIndexManager, 0);
  objc_storeStrong((id *)&self->_lazyModelMigrator, 0);
  objc_storeStrong((id *)&self->_lazyImageWriter, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_destroyWeak((id *)&self->_libraryBundle);
}

uint64_t __57__PLLibraryServicesManager_didRemainSyncablePhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __60__PLLibraryServicesManager_didBecomeNonSyncablePhotoLibrary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

void __62__PLLibraryServicesManager_willBecomeNonSyncablePhotoLibrary___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLLibraryServicesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543618;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v10 = "%{public}@: SPL Change: Successfully updated account %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_DEFAULT;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v19 = 2112;
    v20 = v5;
    v10 = "%{public}@: SPL Change: Failed to update account %@: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __59__PLLibraryServicesManager_setICloudPhotosEnabledInternal___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteITunesSyncedContentForEnablingiCPL");
}

uint64_t __57__PLLibraryServicesManager__setCameraRollCountedInQuota___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setCameraRollCountedInQuota:", *(unsigned __int8 *)(a1 + 40));
}

void __57__PLLibraryServicesManager__setCameraRollCountedInQuota___block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getMBManagerClass_softClass;
  v8 = getMBManagerClass_softClass;
  if (!getMBManagerClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getMBManagerClass_block_invoke;
    v4[3] = &unk_1E3677580;
    v4[4] = &v5;
    __getMBManagerClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)_setCameraRollCountedInQuota___BackupManager;
  _setCameraRollCountedInQuota___BackupManager = (uint64_t)v2;

}

uint64_t __67__PLLibraryServicesManager_registerOutstandingTransactionsHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "shutdownLibraryWithDescription:", CFSTR("excessive recovery attempts"));
}

void __80__PLLibraryServicesManager_performFileSystemAssetImporterWorkWithLibrary_block___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLLibraryServicesGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v7 = 138543618;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting file system asset importer work block on library %@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  PLLibraryServicesGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed file system asset importer work block", (uint8_t *)&v7, 0xCu);

  }
}

void __69__PLLibraryServicesManager__handleLibraryStateCompletedAllOperations__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleCompletedAllOperationsForLibraryState:", *(_QWORD *)(a1 + 40));

}

uint64_t __75__PLLibraryServicesManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleLibraryStateCompletedAllOperations");
}

uint64_t __60__PLLibraryServicesManager_deactivateWithInvalidationError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidationError");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 384), *(id *)(a1 + 40));
  }
  result = objc_msgSend(*(id *)(a1 + 32), "_state");
  if (result != 99)
  {
    objc_msgSend(*(id *)(a1 + 32), "_cancelPendingOperations");
    return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 99);
  }
  return result;
}

void __37__PLLibraryServicesManager_finalize___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_state");
  if (v2 != objc_msgSend((id)objc_opt_class(), "_finalState"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_state");
    objc_msgSend((id)objc_opt_class(), "_finalState");
    if (PLCanMoveFromSourceStateToTargetState())
    {
      objc_msgSend(*(id *)(a1 + 32), "currentStateNode");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "operationCount");

      if (!v4)
        objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", objc_msgSend((id)objc_opt_class(), "_finalState"));
    }
  }
}

uint64_t __39__PLLibraryServicesManager__invalidate__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_stopObservingLibraryStateCompletedAllOperations");
  objc_msgSend(*(id *)(a1 + 32), "currentStateNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminate");

  return objc_msgSend(*(id *)(a1 + 32), "setActive:", 0);
}

void __52__PLLibraryServicesManager_transitionToState_error___block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_state") != *(_QWORD *)(a1 + 48))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "_canTransitionToState:error:");
    v3 = 0;
    v4 = v3;
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      if (*(_QWORD *)(a1 + 56))
      {
        **(_QWORD **)(a1 + 56) = objc_retainAutorelease(v3);
      }
      else
      {
        PLLibraryServicesGetLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "logPrefix");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          PLStringFromLibraryServicesState();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          PLStringFromLibraryServicesState();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "description");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v11 = v6;
          v12 = 2114;
          v13 = v7;
          v14 = 2114;
          v15 = v8;
          v16 = 2114;
          v17 = v9;
          v18 = 2114;
          v19 = v4;
          _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Transition from %{public}@ to %{public}@ on %{public}@ failed with error %{public}@", buf, 0x34u);

        }
      }
    }

  }
}

void __50__PLLibraryServicesManager__enqueueAwaitOperation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLLibraryServicesGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLStringFromLibraryServicesState();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    qos_class_self();
    PLStringFromQoSClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543874;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Running await block, current state: %{public}@ at QoS: %{public}@)", (uint8_t *)&v6, 0x20u);

  }
}

void __70__PLLibraryServicesManager__awaitLibraryState_sync_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "stateSerializationQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(*(id *)(a1 + 32), "_state");
    if ((PLIsValidStateForMinimumStateRequirement() & 1) != 0)
    {
      v3 = 0;
    }
    else
    {
      v8 = CFSTR("currentState");
      PLStringFromLibraryServicesState();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)objc_opt_class();
      objc_msgSend(*(id *)(a1 + 32), "invalidationError");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorForInvalidationError:userInfo:", v7, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(*(id *)(a1 + 32), "_dispatchAwaitLibraryStateCompletionHandler:group:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v3);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void __51__PLLibraryServicesManager_enqueueOperation_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_enqueueOperation:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __64__PLLibraryServicesManager__invalidateDirectServerConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __66__PLLibraryServicesManager__invalidateClientSideEncryptionManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shutdownWithCompletionHandler:", 0);
}

uint64_t __51__PLLibraryServicesManager__invalidateCPLReadiness__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __63__PLLibraryServicesManager__invalidateCloudPhotoLibraryManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __54__PLLibraryServicesManager__invalidateDatabaseContext__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __66__PLLibraryServicesManager__invalidateImportSessionCountCoalescer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

uint64_t __58__PLLibraryServicesManager__invalidateAlbumCountCoalescer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reset");
}

uint64_t __61__PLLibraryServicesManager__invalidateSearchDonationProgress__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __59__PLLibraryServicesManager__invalidateSearchIndexingEngine__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "close");
}

uint64_t __57__PLLibraryServicesManager__invalidateSearchIndexManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __58__PLLibraryServicesManager__invalidateComputeCacheManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

uint64_t __60__PLLibraryServicesManager__invalidateRebuildJournalManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

id __53__PLLibraryServicesManager_newSearchDonationProgress__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_provideContextForSearchDonationProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __48__PLLibraryServicesManager__newContainer_scope___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "_handleCoalescerActionWithScope:class:forIDs:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3, a4);
}

void __81__PLLibraryServicesManager__handleCoalescerActionWithScope_class_forIDs_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibrary refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:](PLPhotoLibrary, "refreshCachedCountsAndDates:onAssetsContainerClass:inContext:withPredicate:", 1, v2, v3, *(_QWORD *)(a1 + 40));

}

PLSyndicationDeleteEngine *__72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLSyndicationDeleteEngine *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLSyndicationDeleteEngine initWithLibraryServicesManager:]([PLSyndicationDeleteEngine alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PLCacheDeleteSupport *__72__PLLibraryServicesManager__initSyndicationPhotoLibrarySpecificServices__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PLCacheDeleteSupport *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLCacheDeleteSupport initWithLibraryServicesManager:cplStatus:]([PLCacheDeleteSupport alloc], "initWithLibraryServicesManager:cplStatus:", WeakRetained, 0);
  else
    v2 = 0;

  return v2;
}

id __67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newCrashRecoverySupport");
  else
    v3 = 0;

  return v3;
}

PLSyndicationDeleteEngine *__67__PLLibraryServicesManager__initSystemPhotoLibrarySpecificServices__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PLSyndicationDeleteEngine *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLSyndicationDeleteEngine initWithLibraryServicesManager:]([PLSyndicationDeleteEngine alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

void __73__PLLibraryServicesManager_refreshImportSessionCountForImportSessionIDs___block_invoke(uint64_t a1, void *a2)
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
  id v12;

  v12 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 304))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PLTransactionScopeImportSessionCounts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v4, v5, "-[PLLibraryServicesManager refreshImportSessionCountForImportSessionIDs:]_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "transactionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v7, v4, v8, "-[PLLibraryServicesManager refreshImportSessionCountForImportSessionIDs:]_block_invoke");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 304);
    *(_QWORD *)(v10 + 304) = v9;

    objc_msgSend(v6, "completeTransaction");
  }
  objc_sync_exit(v3);

  objc_msgSend(v12, "unionSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

void __57__PLLibraryServicesManager_refreshAlbumCountForAlbumIDs___block_invoke(uint64_t a1, void *a2)
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
  id v12;

  v12 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 304))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("PLTransactionScopeAlbumCounts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v4, v5, "-[PLLibraryServicesManager refreshAlbumCountForAlbumIDs:]_block_invoke");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "transactionToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v7, v4, v8, "-[PLLibraryServicesManager refreshAlbumCountForAlbumIDs:]_block_invoke");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 304);
    *(_QWORD *)(v10 + 304) = v9;

    objc_msgSend(v6, "completeTransaction");
  }
  objc_sync_exit(v3);

  objc_msgSend(v12, "unionSet:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

void __68__PLLibraryServicesManager_invalidateReverseLocationDataOnAllAssets__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = +[PLManagedAsset invalidateReverseLocationDataOnAllAssetsInManagedObjectContext:error:](PLManagedAsset, "invalidateReverseLocationDataOnAllAssetsInManagedObjectContext:error:", v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

void __76__PLLibraryServicesManager_updateGreenTeaSavedContactsAuthorizationIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newShortLivedLibraryWithName:", "-[PLLibraryServicesManager updateGreenTeaSavedContactsAuthorizationIfNeeded]_block_invoke");

  objc_msgSend(v3, "globalValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "greenTeaContactsAuthorization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v5, "isEqualToNumber:", v6) & 1) != 0)
      goto LABEL_9;
    PLLibraryServicesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v6;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected contacts authorization change: currentAuthStatus %{public}@ differs from savedAuthStatus %{public}@", (uint8_t *)&v13, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  PLLibraryServicesGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving new contacts authorization: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(v4, "setGreenTeaContactsAuthorization:", v6);
LABEL_9:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "generator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:completionBlock:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "invalidateReverseLocationDataOnAllAssets");
  }

}

void __53__PLLibraryServicesManager_updateSavedLocaleIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "databaseContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newShortLivedLibraryWithName:", "-[PLLibraryServicesManager updateSavedLocaleIfNeeded]_block_invoke");

  objc_msgSend(v3, "globalValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
      goto LABEL_9;
    PLLibraryServicesGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "logPrefix");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v9;
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Detected locale change: currentLocaleIdentifier %{public}@ differs from savedLocaleIdentifier %{public}@", (uint8_t *)&v14, 0x20u);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  PLLibraryServicesGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "logPrefix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Saving new locale identifier: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  objc_msgSend(v4, "setLocaleIdentifier:", v7);
LABEL_9:
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "generator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:completionBlock:", 1, 0);

    objc_msgSend(*(id *)(a1 + 32), "invalidateReverseLocationDataOnAllAssets");
  }

}

uint64_t __47__PLLibraryServicesManager__newOrderKeyManager__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "newShortLivedLibraryWithName:", a2);

  return objc_msgSend(v4, "managedObjectContext");
}

PLCameraPreviewWellManager *__57__PLLibraryServicesManager__initCameraPreviewWellManager__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  PLCameraPreviewWellManager *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isSystemPhotoLibrary"))
    v3 = objc_alloc_init(PLCameraPreviewWellManager);
  else
    v3 = 0;

  return v3;
}

PLDatabaseContext *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLDatabaseContext *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = -[PLDatabaseContext initWithLibraryBundle:]([PLDatabaseContext alloc], "initWithLibraryBundle:", *(_QWORD *)(a1 + 32));
  else
    v3 = 0;

  return v3;
}

PLImageWriter *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  PLImageWriter *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLImageWriter initWithLibraryServicesManager:]([PLImageWriter alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PLModelMigrator *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  PLModelMigrator *v2;
  void *v3;
  PLModelMigrator *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLModelMigrator alloc];
    objc_msgSend(WeakRetained, "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PLModelMigrator initWithPathManager:](v2, "initWithPathManager:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newSearchIndexManager");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newSearchIndexingEngine");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newSearchDonationProgress");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "_newOrderKeyManager");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newMomentGenerationDataManager");
  else
    v3 = 0;

  return v3;
}

PLDuplicateProcessor *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  PLDuplicateProcessor *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLDuplicateProcessor initWithLibraryServicesManager:]([PLDuplicateProcessor alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newRebuildJournalManager");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newComputeCacheManager");
  else
    v3 = 0;

  return v3;
}

PLQuickActionManager *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  PLQuickActionManager *v2;
  void *v3;
  PLQuickActionManager *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLQuickActionManager alloc];
    objc_msgSend(WeakRetained, "databaseContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PLQuickActionManager initWithDatabaseContext:](v2, "initWithDatabaseContext:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PLKeywordManager *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  PLKeywordManager *v2;
  void *v3;
  PLKeywordManager *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLKeywordManager alloc];
    objc_msgSend(WeakRetained, "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PLKeywordManager initWithPathManager:](v2, "initWithPathManager:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PLPairing *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  PLPairing *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(PLPairing);
  else
    v2 = 0;

  return v2;
}

PLLibraryServicesCPLReadiness *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  PLLibraryServicesCPLReadiness *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLLibraryServicesCPLReadiness initWithLibraryServicesManager:]([PLLibraryServicesCPLReadiness alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_16(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newClientSideEncryptionManager");
  else
    v3 = 0;

  return v3;
}

PLDeferredProcessingServiceHandler *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_17(uint64_t a1)
{
  id WeakRetained;
  PLDeferredProcessingServiceHandler *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(PLDeferredProcessingServiceHandler);
  else
    v2 = 0;

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_18(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newDirectServerConfiguration");
  else
    v3 = 0;

  return v3;
}

PLCPLSettings *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  PLCPLSettings *v2;
  void *v3;
  PLCPLSettings *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLCPLSettings alloc];
    objc_msgSend(WeakRetained, "libraryBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PLCPLSettings initWithLibraryBundle:](v2, "initWithLibraryBundle:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PLAnalysisCoordinator *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_20(uint64_t a1)
{
  id WeakRetained;
  PLAnalysisCoordinator *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLAnalysisCoordinator initWithLibraryServicesManager:]([PLAnalysisCoordinator alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isCPLSyncablePhotoLibrary"))
  {
    objc_msgSend(v2, "cplSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deriveMainScopeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newAlbumCountCoalescer");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_23(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newImportSessionCountCoalescer");
  else
    v3 = 0;

  return v3;
}

id __109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_24(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newCloudPhotoLibraryManager");
  else
    v3 = 0;

  return v3;
}

PLReadyForAnalysis *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  PLReadyForAnalysis *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLReadyForAnalysis initWithLibraryServicesManager:]([PLReadyForAnalysis alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PLFeatureAvailabilityProgressDelegate *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_26(uint64_t a1)
{
  id WeakRetained;
  PLFeatureAvailabilityProgressDelegate *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLFeatureAvailabilityProgressDelegate initWithLibraryServicesManager:]([PLFeatureAvailabilityProgressDelegate alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PLFeatureAvailabilityTransitionDelegate *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  PLFeatureAvailabilityTransitionDelegate *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLFeatureAvailabilityTransitionDelegate initWithLibraryServicesManager:]([PLFeatureAvailabilityTransitionDelegate alloc], "initWithLibraryServicesManager:", WeakRetained);
  else
    v2 = 0;

  return v2;
}

PLFeatureAvailabilityComputer *__109__PLLibraryServicesManager_initWithLibraryBundle_backgroundJobService_cacheDeleteRegistration_delegateClass___block_invoke_28(uint64_t a1)
{
  id WeakRetained;
  PLFeatureAvailabilityComputer *v2;
  void *v3;
  void *v4;
  PLFeatureAvailabilityComputer *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLFeatureAvailabilityComputer alloc];
    objc_msgSend(WeakRetained, "availabilityTransitionDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "availabilityProgressDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PLFeatureAvailabilityComputer initWithTransitionDelegate:progressDelegate:](v2, "initWithTransitionDelegate:progressDelegate:", v3, v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)setLibraryServicesDelegateClass:(Class)a3
{
  _libraryServicesDelegateClass = (uint64_t)a3;
}

+ (int64_t)_initialState
{
  return 1;
}

+ (int64_t)_finalState
{
  return 8;
}

+ (id)errorForInvalidationError:(id)a3 userInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D74498];
  v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D74498]);

  if (v9)
  {
    v10 = v5;
  }
  else
  {
    v11 = *MEMORY[0x1E0CB3388];
    if (v5)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v13 = objc_alloc(MEMORY[0x1E0C99E08]);
        if (v6)
          v14 = v6;
        else
          v14 = (id)MEMORY[0x1E0C9AA70];
        v15 = (void *)objc_msgSend(v13, "initWithDictionary:", v14);
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v5, v11);

        v6 = v15;
      }
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (PLIsErrorEqualToCode())
      v17 = 46516;
    else
      v17 = 43002;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v8, v17, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)performTransactionForSyndicationDeleteManager:(id)a3 name:(const char *)a4 transaction:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v7 = a5;
  -[PLLibraryServicesManager databaseContext](self, "databaseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newShortLivedLibraryWithName:", a4);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __126__PLLibraryServicesManager_PLSyndicationDeleteEngineDelegate__performTransactionForSyndicationDeleteManager_name_transaction___block_invoke;
  v12[3] = &unk_1E3675C58;
  v13 = v9;
  v14 = v7;
  v10 = v9;
  v11 = v7;
  objc_msgSend(v10, "performTransactionAndWait:", v12);

}

void __126__PLLibraryServicesManager_PLSyndicationDeleteEngineDelegate__performTransactionForSyndicationDeleteManager_name_transaction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
