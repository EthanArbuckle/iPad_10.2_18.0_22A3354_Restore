@implementation PLAssetResourceDownloadManager

- (PLAssetResourceDownloadManager)init
{
  PLAssetResourceDownloadManager *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *requestIsolationQueue;
  NSMutableDictionary *v8;
  NSMutableDictionary *requestById;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLAssetResourceDownloadManager;
  v2 = -[PLAssetResourceDownloadManager init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 9);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.mobileslideshow.plassetresourcedownloadmanager"));
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("PLAssetResourceDownloadRequest isolation queue", v5);
    requestIsolationQueue = v2->_requestIsolationQueue;
    v2->_requestIsolationQueue = (OS_dispatch_queue *)v6;

    v2->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestById = v2->_requestById;
    v2->_requestById = v8;

  }
  return v2;
}

- (id)_requestWithID:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *requestById;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  requestById = self->_requestById;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](requestById, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)_setRequest:(id)a3 forRequestID:(int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  id v7;
  NSMutableDictionary *requestById;
  void *v9;

  v4 = *(_QWORD *)&a4;
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  requestById = self->_requestById;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](requestById, "setObject:forKeyedSubscript:", v7, v9);

  os_unfair_lock_unlock(p_lock);
}

- (int)requestCloudResourceType:(unint64_t)a3 assetObjectID:(id)a4 library:(id)a5 progressHandler:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  int *p_currentRequestId;
  unsigned int v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  PLAssetResourceDownloadRequest *v22;
  id v23;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetResourceDownloadManager.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  p_currentRequestId = &self->_currentRequestId;
  do
  {
    v18 = __ldaxr((unsigned int *)p_currentRequestId);
    v19 = v18 + 1;
  }
  while (__stlxr(v19, (unsigned int *)p_currentRequestId));
  PLBackendGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v13;
    v32 = 2112;
    v33 = v21;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Creating asset resource request for object id: %@ cloudResourceType: %@", buf, 0x16u);

  }
  v22 = -[PLAssetResourceDownloadRequest initWithRequestID:library:queue:cloudResourceType:managedObjectID:progressHandler:]([PLAssetResourceDownloadRequest alloc], "initWithRequestID:library:queue:cloudResourceType:managedObjectID:progressHandler:", v19, v14, self->_requestIsolationQueue, a3, v13, v15);
  -[PLAssetResourceDownloadManager _setRequest:forRequestID:](self, "_setRequest:forRequestID:", v22, v19);
  objc_initWeak((id *)buf, v22);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __115__PLAssetResourceDownloadManager_requestCloudResourceType_assetObjectID_library_progressHandler_completionHandler___block_invoke;
  v26[3] = &unk_1E36641A8;
  v26[4] = self;
  v29 = v19;
  v23 = v16;
  v27 = v23;
  objc_copyWeak(&v28, (id *)buf);
  -[PLAssetResourceDownloadRequest setCompletionBlock:](v22, "setCompletionBlock:", v26);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v22);
  objc_destroyWeak(&v28);

  objc_destroyWeak((id *)buf);
  return v19;
}

- (void)cancelRequest:(int)a3
{
  id v3;

  -[PLAssetResourceDownloadManager _requestWithID:](self, "_requestWithID:", *(_QWORD *)&a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestById, 0);
  objc_storeStrong((id *)&self->_requestIsolationQueue, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __115__PLAssetResourceDownloadManager_requestCloudResourceType_assetObjectID_library_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setRequest:forRequestID:", 0, *(unsigned int *)(a1 + 56));
  if (*(_QWORD *)(a1 + 40))
  {
    v2 = (id *)(a1 + 48);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = objc_loadWeakRetained(v2);
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, objc_msgSend(v5, "requestID"), v3);

  }
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_15533 != -1)
    dispatch_once(&defaultManager_onceToken_15533, &__block_literal_global_15534);
  return (id)defaultManager_manager_15535;
}

void __48__PLAssetResourceDownloadManager_defaultManager__block_invoke()
{
  PLAssetResourceDownloadManager *v0;
  void *v1;

  v0 = objc_alloc_init(PLAssetResourceDownloadManager);
  v1 = (void *)defaultManager_manager_15535;
  defaultManager_manager_15535 = (uint64_t)v0;

}

@end
