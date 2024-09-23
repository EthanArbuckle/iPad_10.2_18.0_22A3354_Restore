@implementation TSPObjectContext

- (int64_t)modifyObjectTokenForNewObject
{
  NSObject *documentStateQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  documentStateQueue = self->_documentStateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__TSPObjectContext_modifyObjectTokenForNewObject__block_invoke;
  v5[3] = &unk_24D8297F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(documentStateQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__TSPObjectContext_modifyObjectTokenForNewObject__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (id).cxx_construct
{
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_DWORD *)self + 48) = 1065353216;
  return self;
}

- (void)dealloc
{
  TSPObjectContainer *documentObjectContainer;
  TSPObjectContainer *supportObjectContainer;
  TSPObject *documentObject;
  TSPDataManager *dataManager;
  objc_super v7;

  -[TSPObjectContext close](self, "close");
  documentObjectContainer = self->_documentObjectContainer;
  self->_documentObjectContainer = 0;

  supportObjectContainer = self->_supportObjectContainer;
  self->_supportObjectContainer = 0;

  documentObject = self->_documentObject;
  self->_documentObject = 0;

  dataManager = self->_dataManager;
  self->_dataManager = 0;

  v7.receiver = self;
  v7.super_class = (Class)TSPObjectContext;
  -[TSPObjectContext dealloc](&v7, sel_dealloc);
}

- (void)close
{
  -[TSPDataManager didCloseDocument](self->_dataManager, "didCloseDocument");
}

- (TSPObjectContext)initWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TSPObjectContext *v8;
  TSPObjectContext *v9;
  TSPDataManager *v10;
  TSPDataManager *dataManager;
  uint64_t v12;
  NSMapTable *objects;
  dispatch_queue_t v14;
  OS_dispatch_queue *objectsQueue;
  dispatch_queue_t v16;
  OS_dispatch_queue *writeQueue;
  NSRecursiveLock *v18;
  NSRecursiveLock *readLock;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *documentStateQueue;
  dispatch_queue_t v23;
  OS_dispatch_queue *documentResourceDataProviderQueue;
  dispatch_group_t v25;
  OS_dispatch_group *pendingEndSaveGroup;
  dispatch_group_t v27;
  OS_dispatch_group *outstandingReadsGroup;
  dispatch_queue_t v29;
  OS_dispatch_queue *loadObserversQueue;
  dispatch_queue_t v31;
  OS_dispatch_queue *runLoadObserversQueue;
  dispatch_queue_t v33;
  OS_dispatch_queue *temporaryDirectoryQueue;
  TSPObjectContext *v35;
  objc_super v37;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext initWithDelegate:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 171, CFSTR("Invalid parameter not satisfying: %s"), "delegate");

  }
  v37.receiver = self;
  v37.super_class = (Class)TSPObjectContext;
  v8 = -[TSPObjectContext init](&v37, sel_init);
  v9 = v8;
  if (v8)
  {
    -[TSPObjectContext setDelegate:](v8, "setDelegate:", v4);
    v10 = -[TSPDataManager initWithContext:]([TSPDataManager alloc], "initWithContext:", v9);
    dataManager = v9->_dataManager;
    v9->_dataManager = v10;

    v12 = objc_msgSend(MEMORY[0x24BDD1650], "newTspWeakObjectsMapTable");
    objects = v9->_objects;
    v9->_objects = (NSMapTable *)v12;

    v14 = dispatch_queue_create("TSPObjectContext.Objects", MEMORY[0x24BDAC9C0]);
    objectsQueue = v9->_objectsQueue;
    v9->_objectsQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_create("TSPObjectContext.Write", 0);
    writeQueue = v9->_writeQueue;
    v9->_writeQueue = (OS_dispatch_queue *)v16;

    v18 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    readLock = v9->_readLock;
    v9->_readLock = v18;

    v20 = MEMORY[0x24BDAC9C0];
    v21 = dispatch_queue_create("TSPObjectContext.DocumentState", MEMORY[0x24BDAC9C0]);
    documentStateQueue = v9->_documentStateQueue;
    v9->_documentStateQueue = (OS_dispatch_queue *)v21;

    v23 = dispatch_queue_create("TSPObjectContext.DocumentResourceDataProvider", 0);
    documentResourceDataProviderQueue = v9->_documentResourceDataProviderQueue;
    v9->_documentResourceDataProviderQueue = (OS_dispatch_queue *)v23;

    *(_OWORD *)&v9->_lastObjectIdentifier = xmmword_217C279A0;
    v25 = dispatch_group_create();
    pendingEndSaveGroup = v9->_pendingEndSaveGroup;
    v9->_pendingEndSaveGroup = (OS_dispatch_group *)v25;

    v27 = dispatch_group_create();
    outstandingReadsGroup = v9->_outstandingReadsGroup;
    v9->_outstandingReadsGroup = (OS_dispatch_group *)v27;

    v29 = dispatch_queue_create("TSPObjectContext.LoadObservers", v20);
    loadObserversQueue = v9->_loadObserversQueue;
    v9->_loadObserversQueue = (OS_dispatch_queue *)v29;

    v31 = dispatch_queue_create("TSPObjectContext.RunLoadObservers", 0);
    runLoadObserversQueue = v9->_runLoadObserversQueue;
    v9->_runLoadObserversQueue = (OS_dispatch_queue *)v31;

    v33 = dispatch_queue_create("TSPObjectContext.TemporaryDirectory", 0);
    temporaryDirectoryQueue = v9->_temporaryDirectoryQueue;
    v9->_temporaryDirectoryQueue = (OS_dispatch_queue *)v33;

    v35 = v9;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportObject, 0);
  objc_storeStrong((id *)&self->_versionUUID, 0);
  objc_storeStrong((id *)&self->_documentUUID, 0);
  objc_storeStrong((id *)&self->_passwordVerifier, 0);
  objc_storeStrong((id *)&self->_supportObjectContainer, 0);
  objc_storeStrong((id *)&self->_documentObjectContainer, 0);
  objc_storeStrong((id *)&self->_dataManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_documentObject, 0);
  objc_storeStrong((id *)&self->_documentPasswordHint, 0);
  std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::~__hash_table((uint64_t)&self->_loadObservers);
  objc_storeStrong((id *)&self->_temporaryDirectory, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryQueue, 0);
  objc_storeStrong((id *)&self->_outstandingReadsGroup, 0);
  objc_storeStrong((id *)&self->_pendingEndSaveGroup, 0);
  objc_storeStrong((id *)&self->_documentResourceDataProviderQueue, 0);
  objc_storeStrong((id *)&self->_runLoadObserversQueue, 0);
  objc_storeStrong((id *)&self->_loadObserversQueue, 0);
  objc_storeStrong((id *)&self->_documentStateQueue, 0);
  objc_storeStrong((id *)&self->_readLock, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_objectsQueue, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_supportURL, 0);
  objc_storeStrong((id *)&self->_documentURL, 0);
  objc_storeStrong((id *)&self->_decryptionKey, 0);
}

- (TSPObjectContext)init
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext init]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, v4, 166, CFSTR("Do not call method"));

  v5 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[TSPObjectContext init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)beginWriteOperation
{
  NSObject *writeQueue;
  _QWORD block[5];

  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__TSPObjectContext_beginWriteOperation__block_invoke;
  block[3] = &unk_24D829778;
  block[4] = self;
  dispatch_sync(writeQueue, block);
}

void __39__TSPObjectContext_beginWriteOperation__block_invoke(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)endWriteOperation
{
  dispatch_resume((dispatch_object_t)self->_writeQueue);
}

- (void)performReadOperation:(id)a3
{
  void (**v4)(void);
  void (**v5)(void);

  v4 = (void (**)(void))a3;
  if (v4)
  {
    v5 = v4;
    dispatch_suspend((dispatch_object_t)self->_writeQueue);
    -[NSRecursiveLock lock](self->_readLock, "lock");
    v5[2]();
    -[NSRecursiveLock unlock](self->_readLock, "unlock");
    dispatch_resume((dispatch_object_t)self->_writeQueue);
    v4 = v5;
  }

}

- (void)beginAssertOnModify
{
  int *p_modifyObjectCount;
  unsigned int v3;

  p_modifyObjectCount = &self->_modifyObjectCount;
  do
    v3 = __ldxr((unsigned int *)p_modifyObjectCount);
  while (__stxr(v3 + 1, (unsigned int *)p_modifyObjectCount));
}

- (void)endAssertOnModify
{
  int *p_modifyObjectCount;
  unsigned int v3;

  p_modifyObjectCount = &self->_modifyObjectCount;
  do
    v3 = __ldxr((unsigned int *)p_modifyObjectCount);
  while (__stxr(v3 - 1, (unsigned int *)p_modifyObjectCount));
}

- (id)objectForIdentifier:(int64_t)a3
{
  TSPObjectContainer *documentObject;
  NSObject *objectsQueue;
  id v7;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  switch(a3)
  {
    case 1:
      documentObject = (TSPObjectContainer *)self->_documentObject;
      return documentObject;
    case 3:
    case 2:
      return 0;
    case 61:
      documentObject = self->_documentObjectContainer;
      return documentObject;
    case 62:
      return 0;
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  objectsQueue = self->_objectsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__TSPObjectContext_objectForIdentifier___block_invoke;
  block[3] = &unk_24D8297A0;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(objectsQueue, block);
  v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

void __40__TSPObjectContext_objectForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "tsp_objectForIdentifier:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)performReadOperationOnKnownObjects:(id)a3
{
  id v4;
  NSObject *objectsQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  objectsQueue = self->_objectsQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TSPObjectContext_performReadOperationOnKnownObjects___block_invoke;
  block[3] = &unk_24D8297C8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(objectsQueue, block);

}

uint64_t __55__TSPObjectContext_performReadOperationOnKnownObjects___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (id)temporaryDirectory
{
  NSObject *temporaryDirectoryQueue;
  _QWORD block[5];

  temporaryDirectoryQueue = self->_temporaryDirectoryQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__TSPObjectContext_temporaryDirectory__block_invoke;
  block[3] = &unk_24D829778;
  block[4] = self;
  dispatch_sync(temporaryDirectoryQueue, block);
  -[TSUTemporaryDirectory path](self->_temporaryDirectory, "path");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __38__TSPObjectContext_temporaryDirectory__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152))
  {
    v2 = objc_alloc_init(MEMORY[0x24BEB3D10]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 152);
    *(_QWORD *)(v3 + 152) = v2;

  }
}

- (void)checkforDataWarningsWithPackageURL:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSPDataManager checkForPersistenceWarningsWithPackageURL:](self->_dataManager, "checkForPersistenceWarningsWithPackageURL:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addPersistenceWarnings:", v5);

  }
}

- (NSURL)documentURL
{
  NSObject *documentStateQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  documentStateQueue = self->_documentStateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__TSPObjectContext_documentURL__block_invoke;
  v5[3] = &unk_24D8297F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(documentStateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSURL *)v3;
}

void __31__TSPObjectContext_documentURL__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didMoveToURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *documentStateQueue;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  TSPObjectContext *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    documentStateQueue = self->_documentStateQueue;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __33__TSPObjectContext_didMoveToURL___block_invoke;
    v14 = &unk_24D829818;
    v15 = self;
    v7 = v4;
    v16 = v7;
    dispatch_barrier_async(documentStateQueue, &v11);
    if (-[TSPObjectContext areExternalReferencesSupported](self, "areExternalReferencesSupported", v11, v12, v13, v14, v15)&& !-[TSPObjectContext areExternalReferencesToDataAllowedAtURL:](self, "areExternalReferencesToDataAllowedAtURL:", v7))
    {
      -[TSPDataManager removeExternalReferences](self->_dataManager, "removeExternalReferences");
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext didMoveToURL:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 1367, CFSTR("Invalid nil document URL."));

  }
}

void __33__TSPObjectContext_didMoveToURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)didMoveSupportToURL:(id)a3
{
  id v4;
  NSObject *documentStateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  documentStateQueue = self->_documentStateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__TSPObjectContext_didMoveSupportToURL___block_invoke;
  v7[3] = &unk_24D829818;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(documentStateQueue, v7);

}

void __40__TSPObjectContext_didMoveSupportToURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

- (BOOL)isDocumentModified
{
  self->_isDocumentModified = 0;
  return 0;
}

- (BOOL)isSupportModified
{
  self->_isSupportModified = 0;
  return 0;
}

- (BOOL)areExternalReferencesSupported
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (BOOL)areNewExternalReferencesToDataAllowed
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "areNewExternalReferencesToDataAllowed");
  else
    v3 = 0;

  return v3;
}

- (BOOL)areExternalReferencesToDataAllowedAtURL:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "areExternalReferencesToDataAllowedAtURL:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)needsDownload
{
  return 0;
}

- (int64_t)estimatedDownloadSize
{
  return 0;
}

- (BOOL)isEstimatedDownloadSizePrecise
{
  return 1;
}

- (BOOL)isPasswordProtected
{
  self->_isPasswordProtected = 0;
  return 0;
}

- (SFUCryptoKey)decryptionKey
{
  return self->_decryptionKey;
}

+ (void)waitForPendingEndSaveGroup:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *group;

  group = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v3 = *MEMORY[0x24BDBCA90];
    while (dispatch_group_wait(group, 0))
    {
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "runMode:beforeDate:", v3, v5);

      if ((v6 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSPObjectContext waitForPendingEndSaveGroup:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 2134, CFSTR("Run loop could not be started."));

        break;
      }
    }
  }
  else
  {
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }

}

- (void)waitForSaveToFinishIfNeeded
{
  objc_msgSend((id)objc_opt_class(), "waitForPendingEndSaveGroup:", self->_pendingEndSaveGroup);
}

- (id)supportDirectoryURL
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "supportDirectoryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)dataOrNilForIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;

  -[TSPObjectContext dataManager](self, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataOrNilForIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)ignoreDocumentSupport
{
  id WeakRetained;
  char v3;

  if ((self->_mode & 1) != 0)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "ignoreDocumentSupport");
  else
    v3 = 0;

  return v3;
}

- (BOOL)isDocumentSupportTemporary
{
  id WeakRetained;
  char v3;

  if ((self->_mode & 2) != 0)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "isDocumentSupportTemporary");
  else
    v3 = 0;

  return v3;
}

- (BOOL)ignoreUnknownContentWhileReading
{
  return (LOBYTE(self->_mode) >> 2) & 1;
}

- (BOOL)ignoreVersionCheckingWhileReading
{
  return (LOBYTE(self->_mode) >> 3) & 1;
}

- (BOOL)ignoreDocumentResourcesWhileReading
{
  return (LOBYTE(self->_mode) >> 4) & 1;
}

- (void)setDocumentObject:(id)a3
{
  TSPObjectContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  TSPObject **p_documentObject;
  TSPObject *documentObject;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "context");
  v5 = (TSPObjectContext *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext setDocumentObject:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 2403, CFSTR("Document object should belong to object context %@."), self);

  }
  objc_msgSend(v18, "packageLocator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext setDocumentObject:]");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 2404, CFSTR("Document object shouldn't have a package locator."));

  }
  documentObject = self->_documentObject;
  p_documentObject = &self->_documentObject;
  if (documentObject)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext setDocumentObject:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, v17, 2421, CFSTR("Already have a document object"));

  }
  else
  {
    objc_storeStrong((id *)p_documentObject, a3);
    -[TSPObject setTsp_identifier:](*p_documentObject, "setTsp_identifier:", 1);
  }

}

- (void)didReadDocumentObject:(id)a3
{
  TSPObject *v4;
  void *v5;
  void *v6;
  void *v7;
  TSPObject *documentObject;

  v4 = (TSPObject *)a3;
  if (self->_documentObject)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext didReadDocumentObject:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 2427, CFSTR("expected nil value for '%s'"), "_documentObject");

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    TSULogErrorInFunction();

    v4 = 0;
  }
  documentObject = self->_documentObject;
  self->_documentObject = v4;

}

- (int64_t)newObjectIdentifier
{
  int64_t *p_lastObjectIdentifier;
  unint64_t v3;
  int64_t result;

  p_lastObjectIdentifier = &self->_lastObjectIdentifier;
  do
  {
    v3 = __ldaxr((unint64_t *)p_lastObjectIdentifier);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, (unint64_t *)p_lastObjectIdentifier));
  return result;
}

- (int64_t)lastObjectIdentifier
{
  return self->_lastObjectIdentifier;
}

- (void)setLastObjectIdentifier:(int64_t)a3
{
  unint64_t *p_lastObjectIdentifier;
  unint64_t v4;
  unint64_t v5;

  p_lastObjectIdentifier = (unint64_t *)&self->_lastObjectIdentifier;
  while (1)
  {
    v4 = *p_lastObjectIdentifier;
    if ((uint64_t)*p_lastObjectIdentifier >= a3)
      break;
    while (1)
    {
      v5 = __ldaxr(p_lastObjectIdentifier);
      if (v5 != v4)
        break;
      if (!__stlxr(a3, p_lastObjectIdentifier))
        return;
    }
    __clrex();
  }
}

- (int64_t)incrementLastObjectIdentifier:(int64_t)a3
{
  int64_t *p_lastObjectIdentifier;
  unint64_t v5;
  int64_t result;
  void *v7;
  void *v8;
  void *v9;

  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPObjectContext incrementLastObjectIdentifier:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPObjectContext.mm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 2547, CFSTR("don't increment by a negative value"));

    return self->_lastObjectIdentifier;
  }
  else
  {
    p_lastObjectIdentifier = &self->_lastObjectIdentifier;
    do
    {
      v5 = __ldaxr((unint64_t *)p_lastObjectIdentifier);
      result = v5 + a3;
    }
    while (__stlxr(v5 + a3, (unint64_t *)p_lastObjectIdentifier));
  }
  return result;
}

- (int64_t)updateModifyObjectToken
{
  int64_t *p_modifyObjectToken;
  unint64_t v3;
  int64_t result;

  p_modifyObjectToken = &self->_modifyObjectToken;
  do
  {
    v3 = __ldaxr((unint64_t *)p_modifyObjectToken);
    result = v3 + 1;
  }
  while (__stlxr(v3 + 1, (unint64_t *)p_modifyObjectToken));
  return result;
}

- (id)addLoadedObjectsAndEnqueueNotifications:(id)a3
{
  id v4;
  void *v5;
  NSObject *objectsQueue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = 0;
    objectsQueue = self->_objectsQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke;
    block[3] = &unk_24D829868;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_barrier_sync(objectsQueue, block);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke(_QWORD *a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)a1[5];
  v3 = *(NSObject **)(a1[4] + 96);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_2;
  block[3] = &unk_24D829868;
  v4 = v2;
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  dispatch_sync(v3, block);

}

uint64_t __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_3;
  v3[3] = &unk_24D829840;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v3);
}

void __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  v4 = objc_msgSend(v3, "tsp_identifier");
  v15 = v4;
  if (!+[TSPObject tsp_isTransientObjectIdentifier:](TSPObject, "tsp_isTransientObjectIdentifier:", v4))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "tsp_setObject:forIdentifier:", v3, v4);
    v5 = std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::find<long long>((_QWORD *)(*(_QWORD *)(a1 + 32) + 160), (unint64_t *)&v15);
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v5[3]);
      v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (!v7)
      {
        v8 = dispatch_queue_create("TSPObjectContext.RunLoadObserversForRead", 0);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 104));
        dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v7 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_4;
      block[3] = &unk_24D829818;
      v13 = v6;
      v14 = v3;
      v11 = v6;
      dispatch_async(v7, block);

    }
  }

}

void __60__TSPObjectContext_addLoadedObjectsAndEnqueueNotifications___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v6, "target", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "performSelector:withObject:", objc_msgSend(v6, "action"), *(_QWORD *)(a1 + 40));

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (void)runObjectNotificationsInQueue:(id)a3
{
  if (a3)
    dispatch_resume((dispatch_object_t)a3);
  dispatch_sync((dispatch_queue_t)self->_runLoadObserversQueue, &__block_literal_global_5);
}

- (void)addLoadObserver:(id)a3 action:(SEL)a4 forObjectIdentifier:(int64_t)a5 objectOrNil:(id)a6
{
  id v10;
  id v11;
  NSObject *loadObserversQueue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  TSPObjectContext *v17;
  id v18;
  SEL v19;
  int64_t v20;

  v10 = a3;
  v11 = a6;
  loadObserversQueue = self->_loadObserversQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke;
  block[3] = &unk_24D8298D8;
  v16 = v10;
  v17 = self;
  v19 = a4;
  v20 = a5;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_barrier_async(loadObserversQueue, block);

}

void __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke(uint64_t a1)
{
  TSPObjectContextObserver *v2;
  _QWORD *v3;
  id v4;
  unint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v2 = -[TSPObjectContextObserver initWithTarget:action:]([TSPObjectContextObserver alloc], "initWithTarget:action:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  v3 = std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::find<long long>((_QWORD *)(*(_QWORD *)(a1 + 40) + 160), (unint64_t *)(a1 + 64));
  if (v3)
  {
    v4 = (id)v3[3];
    for (i = objc_msgSend(v4, "count") - 1; i < objc_msgSend(v4, "count"); --i)
    {
      objc_msgSend(v4, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "target");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        objc_msgSend(v4, "removeObjectAtIndex:", i);
    }
    objc_msgSend(v4, "addObject:", v2);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v2, 0);
    v21 = *(_QWORD *)(a1 + 64);
    v22 = v9;
    std::__hash_table<std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::__unordered_map_hasher<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,TSP::IdentifierHash,std::equal_to<long long const>,true>,std::__unordered_map_equal<long long const,std::__hash_value_type<long long const,NSMutableArray * {__strong}>,std::equal_to<long long const>,TSP::IdentifierHash,true>,std::allocator<std::__hash_value_type<long long const,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<long long,std::pair<long long const,NSMutableArray * {__strong}>>(v8 + 160, (unint64_t *)&v21, &v21);

  }
  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(NSObject **)(v11 + 64);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_2;
    block[3] = &unk_24D8298D8;
    v13 = *(_QWORD *)(a1 + 64);
    block[4] = v11;
    v19 = v13;
    v17 = v10;
    v14 = *(id *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 56);
    v18 = v14;
    v20 = v15;
    dispatch_async(v12, block);

  }
}

void __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "tsp_objectForIdentifier:", *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 104);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_3;
    block[3] = &unk_24D8298B0;
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 64);
    v8 = v5;
    v10 = v6;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v4, block);

  }
}

uint64_t __75__TSPObjectContext_addLoadObserver_action_forObjectIdentifier_objectOrNil___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)addLoadObserver:(id)a3 action:(SEL)a4 forLazyReference:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v8 = a5;
  objc_msgSend(v8, "weakObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "tsp_identifier");
  else
    v11 = objc_msgSend(v8, "identifier");
  -[TSPObjectContext addLoadObserver:action:forObjectIdentifier:objectOrNil:](self, "addLoadObserver:action:forObjectIdentifier:objectOrNil:", v12, a4, v11, v10);

}

- (void)setIsDocumentModified:(BOOL)a3
{
  self->_isDocumentModified = a3;
}

- (void)setIsSupportModified:(BOOL)a3
{
  self->_isSupportModified = a3;
}

- (void)setIsPasswordProtected:(BOOL)a3
{
  self->_isPasswordProtected = a3;
}

- (NSString)documentPasswordHint
{
  return self->_documentPasswordHint;
}

- (void)setDocumentPasswordHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (TSPObject)documentObject
{
  return self->_documentObject;
}

- (TSPObjectContextDelegate)delegate
{
  return (TSPObjectContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TSPDataManager)dataManager
{
  return self->_dataManager;
}

- (TSPObjectContainer)documentObjectContainer
{
  return self->_documentObjectContainer;
}

- (void)setDocumentObjectContainer:(id)a3
{
  objc_storeStrong((id *)&self->_documentObjectContainer, a3);
}

- (TSPObjectContainer)supportObjectContainer
{
  return self->_supportObjectContainer;
}

- (void)setSupportObjectContainer:(id)a3
{
  objc_storeStrong((id *)&self->_supportObjectContainer, a3);
}

- (BOOL)documentHasCurrentFileFormatVersion
{
  return self->_documentHasCurrentFileFormatVersion;
}

- (NSData)passwordVerifier
{
  return self->_passwordVerifier;
}

- (void)setPasswordVerifier:(id)a3
{
  objc_storeStrong((id *)&self->_passwordVerifier, a3);
}

- (NSUUID)documentUUID
{
  return self->_documentUUID;
}

- (NSUUID)versionUUID
{
  return self->_versionUUID;
}

- (TSPObject)supportObject
{
  return self->_supportObject;
}

- (void)setSupportObject:(id)a3
{
  objc_storeStrong((id *)&self->_supportObject, a3);
}

- (id)documentRoot
{
  objc_opt_class();
  -[TSPObjectContext documentObject](self, "documentObject");
  return (id)TSUDynamicCast();
}

@end
