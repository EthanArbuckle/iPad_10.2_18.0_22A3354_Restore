@implementation PXVideoSessionManager

- (PXVideoSessionManager)init
{
  id v3;
  PXVideoSessionManager *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D78238]);
  v4 = -[PXVideoSessionManager initWithResourceReclamationController:](self, "initWithResourceReclamationController:", v3);

  return v4;
}

- (PXVideoSessionManager)initWithResourceReclamationController:(id)a3
{
  id v5;
  PXVideoSessionManager *v6;
  PXVideoSessionManager *v7;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  OS_dispatch_queue *ivarQueue;
  NSMutableDictionary *v12;
  NSMutableDictionary *ivarQueue_sessionsByIdentifier;
  NSCountedSet *v14;
  NSCountedSet *ivarQueue_sessionCounts;
  PXReusableObjectPool *v16;
  PXReusableObjectPool *ivarQueue_playerPool;
  PXVideoSessionManager *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXVideoSessionManager;
  v6 = -[PXVideoSessionManager init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceReclamationController, a3);
    objc_msgSend(v5, "registerObserver:", v7);
    px_dispatch_queue_create_serial_with_priority();
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    px_dispatch_queue_create_serial();
    v10 = objc_claimAutoreleasedReturnValue();
    ivarQueue = v7->_ivarQueue;
    v7->_ivarQueue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    ivarQueue_sessionsByIdentifier = v7->_ivarQueue_sessionsByIdentifier;
    v7->_ivarQueue_sessionsByIdentifier = v12;

    v14 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    ivarQueue_sessionCounts = v7->_ivarQueue_sessionCounts;
    v7->_ivarQueue_sessionCounts = v14;

    v16 = (PXReusableObjectPool *)objc_alloc_init((Class)off_1E50B46A0);
    ivarQueue_playerPool = v7->_ivarQueue_playerPool;
    v7->_ivarQueue_playerPool = v16;

    v7->_ivarQueue_canStoreReusablePlayers = 0;
    -[PXReusableObjectPool registerReusableObjectForReuseIdentifier:maximumPoolSize:creationHandler:](v7->_ivarQueue_playerPool, "registerReusableObjectForReuseIdentifier:maximumPoolSize:creationHandler:", 42, 5, &__block_literal_global_8_55805);
    v19 = v7;
    px_dispatch_on_main_queue();

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXVideoSessionManager;
  -[PXVideoSessionManager dealloc](&v4, sel_dealloc);
}

- (id)checkOutSessionWithContentProvider:(id)a3
{
  id v4;
  void *v5;
  NSObject *ivarQueue;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "contentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__55785;
  v19 = __Block_byref_object_dispose__55786;
  v20 = 0;
  ivarQueue = self->_ivarQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke;
  v11[3] = &unk_1E513D0D8;
  v11[4] = self;
  v12 = v5;
  v13 = v4;
  v14 = &v15;
  v7 = v4;
  v8 = v5;
  dispatch_sync(ivarQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)checkInVideoSession:(id)a3
{
  id v4;
  void *v5;
  NSObject *ivarQueue;
  _QWORD v7[4];
  id v8;
  PXVideoSessionManager *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    ivarQueue = self->_ivarQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke;
    v7[3] = &unk_1E5148D08;
    v8 = v4;
    v9 = self;
    dispatch_async(ivarQueue, v7);

  }
}

- (NSString)description
{
  id v3;
  NSObject *ivarQueue;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__55785;
  v25 = __Block_byref_object_dispose__55786;
  v26 = 0;
  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PXVideoSessionManager_description__block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(ivarQueue, block);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)v22[5];
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      v6 += v7;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    }
    while (v7);
  }

  v11 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)PXVideoSessionManager;
  -[PXVideoSessionManager description](&v15, sel_description);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@, %lu sessions:\n%@"), v12, v6, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v21, 8);
  return (NSString *)v13;
}

- (NSArray)activeSessions
{
  NSObject *ivarQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__55785;
  v10 = __Block_byref_object_dispose__55786;
  v11 = 0;
  ivarQueue = self->_ivarQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__PXVideoSessionManager_activeSessions__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ivarQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (id)checkOutReusableWrappedPlayer
{
  return (id)-[PXReusableObjectPool checkOutReusableObjectWithReuseIdentifier:](self->_ivarQueue_playerPool, "checkOutReusableObjectWithReuseIdentifier:", 42);
}

- (void)checkInReusableWrappedPlayer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "status") == 2)
  {
    PLVideoPlaybackGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Dropping checked-in wrapped player because it's status is .failed. Error: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    -[PXReusableObjectPool checkInReusableObject:](self->_ivarQueue_playerPool, "checkInReusableObject:", v4);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)ApplicationStateContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXVideoSessionManager.m"), 181, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXVideoSessionManager _updateCanStoreReusablePlayers](self, "_updateCanStoreReusablePlayers");
    v9 = v11;
  }

}

- (void)_updateCanStoreReusablePlayers
{
  void *v3;
  BOOL v4;
  NSObject *ivarQueue;
  _QWORD v6[5];
  BOOL v7;

  +[PXApplicationState sharedState](PXApplicationState, "sharedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "visibilityState") != 3;

  ivarQueue = self->_ivarQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PXVideoSessionManager__updateCanStoreReusablePlayers__block_invoke;
  v6[3] = &unk_1E5144398;
  v6[4] = self;
  v7 = v4;
  dispatch_async(ivarQueue, v6);
}

- (void)_flushReusablePlayerPool
{
  NSObject *ivarQueue;
  _QWORD block[5];

  ivarQueue = self->_ivarQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__PXVideoSessionManager__flushReusablePlayerPool__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(ivarQueue, block);
}

- (void)_ivarQueue_flushReusablePlayerPool
{
  -[PXReusableObjectPool removeAllReusableObjectsWithReuseIdentifier:](self->_ivarQueue_playerPool, "removeAllReusableObjectsWithReuseIdentifier:", 42);
}

- (PXAVResourceReclamationController)resourceReclamationController
{
  return self->_resourceReclamationController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceReclamationController, 0);
  objc_storeStrong((id *)&self->_ivarQueue_sessionCounts, 0);
  objc_storeStrong((id *)&self->_ivarQueue_sessionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_ivarQueue_playerPool, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
}

uint64_t __49__PXVideoSessionManager__flushReusablePlayerPool__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ivarQueue_flushReusablePlayerPool");
}

_BYTE *__55__PXVideoSessionManager__updateCanStoreReusablePlayers__block_invoke(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = *(_BYTE *)(a1 + 40);
  result = *(_BYTE **)(a1 + 32);
  if (!result[136])
    return (_BYTE *)objc_msgSend(result, "_ivarQueue_flushReusablePlayerPool");
  return result;
}

void __39__PXVideoSessionManager_activeSessions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __36__PXVideoSessionManager_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__PXVideoSessionManager_checkInVideoSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];

  objc_msgSend(*(id *)(a1 + 32), "contentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "removeObject:", v3);
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 128), "countForObject:", v3);
  if (!v4)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "removeObjectForKey:", v3);
  v5 = MEMORY[0x1E0C809B0];
  v6 = *(void **)(a1 + 40);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_2;
  v17[3] = &unk_1E51479C8;
  v17[4] = v6;
  objc_msgSend(v6, "performChanges:", v17);
  if (!v4)
  {
    v7 = *(void **)(a1 + 32);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_3;
    v15[3] = &unk_1E511E318;
    v16 = v7;
    objc_msgSend(v16, "performChanges:withPresentationContext:presenter:", v15, 1, 0);
    v8 = *(void **)(a1 + 32);
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 104);
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_4;
    v12[3] = &unk_1E5148D08;
    v10 = v8;
    v11 = *(_QWORD *)(a1 + 40);
    v13 = v10;
    v14 = v11;
    dispatch_async(v9, v12);

  }
}

uint64_t __45__PXVideoSessionManager_checkInVideoSession___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

void __45__PXVideoSessionManager_checkInVideoSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "setDesiredPlayState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceCurrentItemWithPlayerItem:", 0);

}

void __45__PXVideoSessionManager_checkInVideoSession___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "performFinalCleanup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v3 + 96);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__PXVideoSessionManager_checkInVideoSession___block_invoke_5;
  v6[3] = &unk_1E5148D08;
  v7 = v2;
  v8 = v3;
  v5 = v2;
  dispatch_async(v4, v6);

}

uint64_t __45__PXVideoSessionManager_checkInVideoSession___block_invoke_5(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = *(_QWORD *)(result + 40);
    if (*(_BYTE *)(v1 + 136))
      return objc_msgSend(*(id *)(v1 + 112), "checkInReusableObject:");
  }
  return result;
}

uint64_t __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  PXVideoSession *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "checkOutReusableObjectWithReuseIdentifier:", 42);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PXVideoSession alloc];
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "resourceReclamationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXVideoSession initWithContentProvider:videoPlayer:resourceReclamationController:](v6, "initWithContentProvider:videoPlayer:resourceReclamationController:", v7, v5, v8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
  v12 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke_2;
  v14[3] = &unk_1E51479C8;
  v14[4] = v12;
  return objc_msgSend(v12, "performChanges:", v14);
}

uint64_t __60__PXVideoSessionManager_checkOutSessionWithContentProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 1);
}

uint64_t __63__PXVideoSessionManager_initWithResourceReclamationController___block_invoke_2(uint64_t a1)
{
  void *v2;

  +[PXApplicationState sharedState](PXApplicationState, "sharedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerChangeObserver:context:", *(_QWORD *)(a1 + 32), ApplicationStateContext);

  return objc_msgSend(*(id *)(a1 + 32), "_updateCanStoreReusablePlayers");
}

id __63__PXVideoSessionManager_initWithResourceReclamationController___block_invoke()
{
  return objc_alloc_init(MEMORY[0x1E0D78298]);
}

+ (PXVideoSessionManager)sharedInstance
{
  if (sharedInstance_onceToken_55812 != -1)
    dispatch_once(&sharedInstance_onceToken_55812, &__block_literal_global_55813);
  return (PXVideoSessionManager *)(id)sharedInstance_sharedInstance_55814;
}

void __39__PXVideoSessionManager_sharedInstance__block_invoke()
{
  PXVideoSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(PXVideoSessionManager);
  v1 = (void *)sharedInstance_sharedInstance_55814;
  sharedInstance_sharedInstance_55814 = (uint64_t)v0;

}

- (id)videoSessionForAsset:(id)a3 mediaProvider:(id)a4
{
  id v6;
  id v7;
  PXVideoSessionManagerDisplayAssetOptions *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PXVideoSessionManagerDisplayAssetOptions);
  -[PXVideoSessionManager videoSessionForAsset:withOptions:mediaProvider:](self, "videoSessionForAsset:withOptions:mediaProvider:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)videoSessionForAsset:(id)a3 withOptions:(id)a4 mediaProvider:(id)a5
{
  void *v6;
  void *v7;

  -[PXVideoSessionManager contentProviderForAsset:withOptions:mediaProvider:requestURLOnly:](self, "contentProviderForAsset:withOptions:mediaProvider:requestURLOnly:", a3, a4, a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVideoSessionManager checkOutSessionWithContentProvider:](self, "checkOutSessionWithContentProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contentProviderForAsset:(id)a3 withOptions:(id)a4 mediaProvider:(id)a5 requestURLOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  PXWallpaperAssetVideoContentProvider *v14;
  PXDisplayAssetVideoContentProvider *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  PXPhotoKitVideoContentProvider *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  PXPhotoKitLivePhotoVideoContentProviderSpec *v26;
  void *v27;
  id v28;
  PXPhotoKitLivePhotoVideoContentProvider *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  _OWORD v42[3];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[16];

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v6
    && ((objc_msgSend(v11, "shouldCrossfadeLivePhotosWhenLooping") & 1) != 0
     || (objc_msgSend(v11, "shouldStabilizeLivePhotosIfPossible") & 1) != 0
     || (objc_msgSend(v11, "isAudioAllowed") & 1) == 0))
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "requestURLOnly can't be mixed with specified options", buf, 2u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v10, "mediaType") != 1 || v6)
    {
      v19 = v12;
      v20 = v10;
      v21 = [PXPhotoKitVideoContentProvider alloc];
      objc_msgSend(v11, "strategies");
      v34 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "audioSession");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXVideoSessionManager resourceReclamationController](self, "resourceReclamationController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXPhotoKitVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](v21, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:", v20, v19, v22, v23, v6, v24);

      v12 = v34;
    }
    else if ((objc_msgSend(v11, "shouldPlayLivePhotosWithSettlingEffectIfPossible") & 1) != 0)
    {
      v14 = -[PXWallpaperAssetVideoContentProvider initWithWallpaperAsset:]([PXWallpaperAssetVideoContentProvider alloc], "initWithWallpaperAsset:", v10);
    }
    else
    {
      v35 = v12;
      v25 = v10;
      v26 = objc_alloc_init(PXPhotoKitLivePhotoVideoContentProviderSpec);
      if (v11)
      {
        objc_msgSend(v11, "livePhotoLoopTimeRange");
      }
      else
      {
        v44 = 0u;
        v45 = 0u;
        v43 = 0u;
      }
      v42[0] = v43;
      v42[1] = v44;
      v42[2] = v45;
      -[PXPhotoKitLivePhotoVideoContentProviderSpec setLoopTimeRange:](v26, "setLoopTimeRange:", v42);
      v40 = *MEMORY[0x1E0CA2E68];
      v41 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      -[PXPhotoKitLivePhotoVideoContentProviderSpec setLoopStartTime:](v26, "setLoopStartTime:", &v40);
      if (objc_msgSend(v11, "shouldCrossfadeLivePhotosWhenLooping"))
      {
        v27 = (void *)objc_opt_class();
        if (v27)
        {
          objc_msgSend(v27, "livePhotoCrossfadeDuration");
        }
        else
        {
          v38 = 0uLL;
          v39 = 0;
        }
        v36 = v38;
        v37 = v39;
        -[PXPhotoKitLivePhotoVideoContentProviderSpec setCrossfadeDuration:](v26, "setCrossfadeDuration:", &v36);
      }
      if (objc_msgSend(v11, "shouldStabilizeLivePhotosIfPossible"))
        -[PXPhotoKitLivePhotoVideoContentProviderSpec setStabilizeIfPossible:](v26, "setStabilizeIfPossible:", objc_msgSend((id)objc_opt_class(), "isLivePhotoStabilizationEnabled"));
      v28 = v12;
      if (objc_msgSend(v11, "isAudioAllowed"))
        -[PXPhotoKitLivePhotoVideoContentProviderSpec setWantsAudio:](v26, "setWantsAudio:", 1);
      v29 = [PXPhotoKitLivePhotoVideoContentProvider alloc];
      objc_msgSend(v11, "strategies");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "audioSession");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXVideoSessionManager resourceReclamationController](self, "resourceReclamationController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXPhotoKitLivePhotoVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:spec:resourceReclamationController:](v29, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:spec:resourceReclamationController:", v25, v35, v30, v31, v26, v32);

      v12 = v28;
    }
  }
  else
  {
    v15 = [PXDisplayAssetVideoContentProvider alloc];
    objc_msgSend(v11, "strategies");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "audioSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXVideoSessionManager resourceReclamationController](self, "resourceReclamationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXDisplayAssetVideoContentProvider initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:](v15, "initWithAsset:mediaProvider:deliveryStrategies:audioSession:requestURLOnly:resourceReclamationController:", v10, v12, v16, v17, v6, v18);

  }
  if (objc_msgSend(v11, "shouldCreateUniqueVideoSession"))
    -[PXWallpaperAssetVideoContentProvider makeUniqueContentIdentifier](v14, "makeUniqueContentIdentifier");

  return v14;
}

+ (BOOL)isLivePhotoStabilizationEnabled
{
  void *v2;
  char v3;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stabilizeLivePhotos");

  return v3;
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)livePhotoCrossfadeDuration
{
  Float64 v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  id v6;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "livePhotoLoopingCrossfadeDuration");
  CMTimeMakeWithSeconds((CMTime *)retstr, v4, 600);

  return result;
}

@end
