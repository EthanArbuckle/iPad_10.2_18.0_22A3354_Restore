@implementation PEResourceManager

- (PEResourceManager)init
{
  PEResourceManager *v2;
  NSMutableSet *v3;
  NSMutableSet *resourceSet;
  dispatch_queue_t v5;
  OS_dispatch_queue *resourceQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *loadingQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *loaderCallbackQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PEResourceManager;
  v2 = -[PEResourceManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    resourceSet = v2->_resourceSet;
    v2->_resourceSet = v3;

    v5 = dispatch_queue_create("PEResourceManager", 0);
    resourceQueue = v2->_resourceQueue;
    v2->_resourceQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("PEResourceLoader", 0);
    loadingQueue = v2->_loadingQueue;
    v2->_loadingQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("PEResourceLoader_CallbackQueue", 0);
    loaderCallbackQueue = v2->_loaderCallbackQueue;
    v2->_loaderCallbackQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (id)compositionControllerWithoutSource:(id)a3
{
  return -[PEResourceManager compositionControllerWithoutSource:originalComposition:editorBundleID:](self, "compositionControllerWithoutSource:originalComposition:editorBundleID:", a3, 0, 0);
}

- (id)compositionControllerWithoutSource:(id)a3 originalComposition:(BOOL)a4 editorBundleID:(id *)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    v13 = 0;
    +[PEAdjustmentDataCache synchronousCompositionControllerForAsset:networkAccessAllowed:disposition:originalComposition:](PEAdjustmentDataCache, "synchronousCompositionControllerForAsset:networkAccessAllowed:disposition:originalComposition:", v8, 0, &v13, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      +[PEAdjustmentDataCache synchronousEditorBundleIDForAsset:](PEAdjustmentDataCache, "synchronousEditorBundleIDForAsset:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        *a5 = objc_retainAutorelease(v10);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)originalCompositionControllerWithoutSource:(id)a3 reconstructIfMissing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PEResourceManager compositionControllerWithoutSource:originalComposition:editorBundleID:](self, "compositionControllerWithoutSource:originalComposition:editorBundleID:", v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 && v4)
    {
      v8 = objc_alloc(MEMORY[0x24BE71C40]);
      v9 = (void *)objc_msgSend(MEMORY[0x24BE71CC8], "newComposition");
      v10 = (void *)objc_msgSend(v8, "initWithComposition:", v9);

      -[PEResourceManager compositionControllerWithoutSource:originalComposition:editorBundleID:](self, "compositionControllerWithoutSource:originalComposition:editorBundleID:", v6, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PESupport repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:](PESupport, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v10, v11, objc_msgSend(v6, "isLivePhoto"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)loadResourceForAsset:(id)a3 requireLocalResources:(BOOL)a4 forceRunAsUnadjustedAsset:(BOOL)a5 progressHandler:(id)a6 resultHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  _PEResourceHandler *v15;
  void *v16;
  _PEResourceHandler *v17;
  PEResourceLoadRequest *v18;
  NSObject *resourceQueue;
  _PEResourceHandler *v20;
  _QWORD v21[5];
  _PEResourceHandler *v22;

  v8 = a5;
  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = [_PEResourceHandler alloc];
  -[PEResourceManager loadingQueue](self, "loadingQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PEResourceLoader initWithAsset:loadingQueue:](v15, "initWithAsset:loadingQueue:", v14, v16);

  -[_PEResourceHandler setProgressHandler:](v17, "setProgressHandler:", v13);
  -[_PEResourceHandler setResultHandler:](v17, "setResultHandler:", v12);

  -[PEResourceLoader setForceRunAsUnadjustedAsset:](v17, "setForceRunAsUnadjustedAsset:", v8);
  -[PEResourceLoader setSkipDisplaySizeImage:](v17, "setSkipDisplaySizeImage:", 1);
  v18 = objc_alloc_init(PEResourceLoadRequest);
  -[PEResourceLoadRequest setDelegate:](v18, "setDelegate:", self);
  -[PEResourceLoadRequest setRequireAdjustments:](v18, "setRequireAdjustments:", 1);
  -[PEResourceLoadRequest setRequireLocalResources:](v18, "setRequireLocalResources:", v9);
  -[PEResourceLoader enqueueRequest:](v17, "enqueueRequest:", v18);
  resourceQueue = self->_resourceQueue;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __120__PEResourceManager_loadResourceForAsset_requireLocalResources_forceRunAsUnadjustedAsset_progressHandler_resultHandler___block_invoke;
  v21[3] = &unk_24C618E60;
  v21[4] = self;
  v22 = v17;
  v20 = v17;
  dispatch_async(resourceQueue, v21);

}

- (void)cancelAllRequests
{
  NSObject *resourceQueue;
  _QWORD block[5];

  resourceQueue = self->_resourceQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__PEResourceManager_cancelAllRequests__block_invoke;
  block[3] = &unk_24C618B48;
  block[4] = self;
  dispatch_async(resourceQueue, block);
}

- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];

  v7 = a5;
  v8 = a3;
  PLPhotoEditGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_INFO, "PEResourceManager completed resource fetch.", v10, 2u);
  }

  -[PEResourceManager _resourceLoader:loadedResult:error:](self, "_resourceLoader:loadedResult:error:", v8, v7, 0);
}

- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  if (v8)
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_ERROR, "Error fetching the resource: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  -[PEResourceManager _resourceLoader:loadedResult:error:](self, "_resourceLoader:loadedResult:error:", v7, 0, v8);

}

- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5
{
  void *v6;
  id v7;
  void *v8;
  void (**v9)(double);
  id v10;

  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v10;
  else
    v6 = 0;
  v7 = v6;
  objc_msgSend(v7, "progressHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "progressHandler");
    v9 = (void (**)(double))objc_claimAutoreleasedReturnValue();
    v9[2](a5);

  }
}

- (void)_resourceLoader:(id)a3 loadedResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v14;
  else
    v10 = 0;
  v11 = v10;
  objc_msgSend(v11, "resultHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v11, "resultHandler");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v13)[2](v13, v8, v9);

  }
  -[PEResourceManager _removeFromSet:](self, "_removeFromSet:", v14);

}

- (void)_removeFromSet:(id)a3
{
  id v4;
  NSObject *resourceQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  resourceQueue = self->_resourceQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__PEResourceManager__removeFromSet___block_invoke;
  v7[3] = &unk_24C618E60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(resourceQueue, v7);

}

- (NSMutableSet)resourceSet
{
  return self->_resourceSet;
}

- (OS_dispatch_queue)resourceQueue
{
  return self->_resourceQueue;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (OS_dispatch_queue)loaderCallbackQueue
{
  return self->_loaderCallbackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loaderCallbackQueue, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_resourceQueue, 0);
  objc_storeStrong((id *)&self->_resourceSet, 0);
}

uint64_t __36__PEResourceManager__removeFromSet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __38__PEResourceManager_cancelAllRequests__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "cancelAllRequests", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __120__PEResourceManager_loadResourceForAsset_requireLocalResources_forceRunAsUnadjustedAsset_progressHandler_resultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObject:", *(_QWORD *)(a1 + 40));
}

@end
