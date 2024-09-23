@implementation PUPhotosGridDownloadHelper

- (PUPhotosGridDownloadHelper)init
{
  return -[PUPhotosGridDownloadHelper initWithUpdateHandler:](self, "initWithUpdateHandler:", 0);
}

- (PUPhotosGridDownloadHelper)initWithUpdateHandler:(id)a3
{
  id v4;
  PUPhotosGridDownloadHelper *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *downloadContexts;
  dispatch_queue_t v8;
  OS_dispatch_queue *downloadContextsIsolationQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotosGridDownloadHelper;
  v5 = -[PUPhotosGridDownloadHelper init](&v11, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    downloadContexts = v5->_downloadContexts;
    v5->_downloadContexts = v6;

    v8 = dispatch_queue_create("PUPhotosGridDownloadHelper._downloadContexts", 0);
    downloadContextsIsolationQueue = v5->_downloadContextsIsolationQueue;
    v5->_downloadContextsIsolationQueue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_updateHandler, v4);
    v5->_mode = 0;
  }

  return v5;
}

- (void)handleDownloadOfAssetIfNeeded:(id)a3 inCollection:(id)a4 withSuccessHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PUPhotosGridDownloadHelpContext *v12;
  void *v13;
  id v14;
  PUPhotosGridDownloadHelpContext *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  PUPhotosGridDownloadHelpContext *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PUPhotosGridDownloadHelper _cancelPreviousDownloadsForAsset:](self, "_cancelPreviousDownloadsForAsset:", v8);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1740]), "initWithAsset:requestType:", v8, 0);
  v12 = objc_alloc_init(PUPhotosGridDownloadHelpContext);
  -[PUPhotosGridDownloadHelpContext setResourceLocalAvailabilityRequest:](v12, "setResourceLocalAvailabilityRequest:", v11);
  objc_msgSend(v8, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridDownloadHelper _setDownloadContext:forIdentifier:](self, "_setDownloadContext:forIdentifier:", v12, v13);
  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__PUPhotosGridDownloadHelper_handleDownloadOfAssetIfNeeded_inCollection_withSuccessHandler___block_invoke;
  v19[3] = &unk_1E58A5F40;
  v19[4] = self;
  v14 = v13;
  v20 = v14;
  v15 = v12;
  v21 = v15;
  v16 = v10;
  v24 = v16;
  objc_copyWeak(&v25, &location);
  v17 = v9;
  v22 = v17;
  v18 = v11;
  v23 = v18;
  -[PUPhotosGridDownloadHelper _checkIfRetrievalIsRequiredForResourceRequest:completion:](self, "_checkIfRetrievalIsRequiredForResourceRequest:completion:", v18, v19);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (BOOL)isAnyPickerAssetDownloading:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CD1740];
  v5 = a3;
  -[PUPhotosGridDownloadHelper _defaultOptions](self, "_defaultOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexesForAssetsRequiringResourceRetrieval:requestType:options:", v5, 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "count") != 0;
  return (char)v5;
}

- (void)_cancelPreviousDownloadsForAsset:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = -[PUPhotosGridDownloadHelper mode](self, "mode");
  if (v4 == 1)
  {
    objc_msgSend(v6, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosGridDownloadHelper cancelDownloadForIdentifier:](self, "cancelDownloadForIdentifier:", v5);

  }
  else if (!v4)
  {
    -[PUPhotosGridDownloadHelper cancelAllDownloads](self, "cancelAllDownloads");
  }

}

- (void)_checkIfRetrievalIsRequiredForResourceRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[PUPhotosGridDownloadHelper _defaultOptions](self, "_defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PUPhotosGridDownloadHelper__checkIfRetrievalIsRequiredForResourceRequest_completion___block_invoke;
  v10[3] = &unk_1E58A5F68;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "fetchResourceAvailabilityWithOptions:completionHandler:", v8, v10);

}

- (id)_defaultOptions
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CD1748]);
  objc_msgSend(v3, "setTreatLivePhotoAsStill:", -[PUPhotosGridDownloadHelper shouldTreatLivePhotosAsStills](self, "shouldTreatLivePhotosAsStills"));
  return v3;
}

- (void)cancelDownloadForIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  -[PUPhotosGridDownloadHelper _downloadContextForIdentifier:](self, "_downloadContextForIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "downloadHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUPhotosGridDownloadHelper"), 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "downloadHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v6);

    objc_msgSend(v4, "setDownloadHandler:", 0);
  }
  objc_msgSend(v4, "resourceLocalAvailabilityRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelRetrievalRequest");

  objc_msgSend(v4, "gridProgressIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
    objc_msgSend(WeakRetained, "endShowingProgressWithIdentifier:succeeded:canceled:error:", v9, 0, 1, 0);

  }
  -[PUPhotosGridDownloadHelper _removeDownloadRequestForIdentifier:](self, "_removeDownloadRequestForIdentifier:", v11);

}

- (void)cancelAllDownloads
{
  NSObject *downloadContextsIsolationQueue;
  id v4;
  uint64_t v5;
  uint64_t v6;
  PUPhotosGridDownloadUpdateHandler **p_updateHandler;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
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
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__70440;
  v25 = __Block_byref_object_dispose__70441;
  v26 = 0;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke;
  block[3] = &unk_1E58AAE48;
  block[4] = self;
  block[5] = &v21;
  dispatch_sync(downloadContextsIsolationQueue, block);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (id)v22[5];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    p_updateHandler = &self->_updateHandler;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "resourceLocalAvailabilityRequest", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancelRetrievalRequest");

        objc_msgSend(v9, "gridProgressIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          WeakRetained = objc_loadWeakRetained((id *)p_updateHandler);
          objc_msgSend(WeakRetained, "endShowingProgressWithIdentifier:succeeded:canceled:error:", v11, 0, 1, 0);

        }
        objc_msgSend(v9, "downloadHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUPhotosGridDownloadHelper"), 1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "downloadHandler");
          v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, _QWORD, void *))v15)[2](v15, 0, v14);

          objc_msgSend(v9, "setDownloadHandler:", 0);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_startRetrievingRequiredResourcesForRequest:(id)a3 options:(id)a4 inCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridDownloadHelper _downloadContextForIdentifier:](self, "_downloadContextForIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
  objc_msgSend(v8, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "beginShowingProgressForAsset:inCollection:", v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setGridProgressIdentifier:", v16);
  objc_initWeak(&location, self);
  v17 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke;
  v23[3] = &unk_1E58AB210;
  objc_copyWeak(&v25, &location);
  v18 = v11;
  v24 = v18;
  objc_msgSend(v8, "setProgressChangeHandler:", v23);
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke_2;
  v20[3] = &unk_1E58A5FB8;
  objc_copyWeak(&v22, &location);
  v19 = v8;
  v21 = v19;
  objc_msgSend(v19, "retrieveRequiredResourcesWithOptions:completionHandler:", v9, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

}

- (void)_updateDownloadProgressForAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;

  objc_msgSend(a3, "localIdentifier");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridDownloadHelper _downloadContextForIdentifier:](self, "_downloadContextForIdentifier:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gridProgressIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceLocalAvailabilityRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "progressFraction");
    v9 = v8;
    WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
    objc_msgSend(WeakRetained, "updateProgressWithIdentifier:withValue:", v5, v9);

  }
}

- (void)_downloadForRequest:(id)a3 didCompleteWithSuccess:(BOOL)a4 canceled:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void (**v20)(_QWORD, _QWORD, _QWORD);
  id WeakRetained;
  void *v22;
  id v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v7 = a5;
  v8 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  objc_msgSend(v10, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosGridDownloadHelper _downloadContextForIdentifier:](self, "_downloadContextForIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 && !v7)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412546;
      v25 = v10;
      v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Error downloading resources for request %@: %@", (uint8_t *)&v24, 0x16u);
    }

  }
  -[PUPhotosGridDownloadHelper _removeDownloadRequestForIdentifier:](self, "_removeDownloadRequestForIdentifier:", v13);
  objc_msgSend(v14, "downloadHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v16)
    {
      objc_msgSend(v14, "downloadHandler");
      v17 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v17[2](v17, 1, 0);

      objc_msgSend(v14, "setDownloadHandler:", 0);
    }
  }
  else
  {
    if (v7)
    {
      if (!v16)
        goto LABEL_16;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PUPhotosGridDownloadHelper"), 1, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "downloadHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v18);

      objc_msgSend(v14, "setDownloadHandler:", 0);
    }
    else
    {
      if (v16)
      {
        objc_msgSend(v14, "downloadHandler");
        v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, _QWORD, id))v20)[2](v20, 0, v11);

        objc_msgSend(v14, "setDownloadHandler:", 0);
      }
      +[PUPhotosGridDownloadHelper createAlertControllerForDownloadError:withAsset:](PUPhotosGridDownloadHelper, "createAlertControllerForDownloadError:withAsset:", v11, v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_updateHandler);
      objc_msgSend(WeakRetained, "presentAlertController:", v18);

    }
  }
LABEL_16:
  objc_msgSend(v14, "gridProgressIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = objc_loadWeakRetained((id *)&self->_updateHandler);
    objc_msgSend(v23, "endShowingProgressWithIdentifier:succeeded:canceled:error:", v22, v8, v7, v11);

  }
}

- (void)_setDownloadContext:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *downloadContextsIsolationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PUPhotosGridDownloadHelper__setDownloadContext_forIdentifier___block_invoke;
  block[3] = &unk_1E58AB790;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(downloadContextsIsolationQueue, block);

}

- (id)_downloadContextForIdentifier:(id)a3
{
  id v4;
  NSObject *downloadContextsIsolationQueue;
  id v6;
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
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__70440;
  v16 = __Block_byref_object_dispose__70441;
  v17 = 0;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PUPhotosGridDownloadHelper__downloadContextForIdentifier___block_invoke;
  block[3] = &unk_1E58AAD18;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(downloadContextsIsolationQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_removeDownloadRequestForIdentifier:(id)a3
{
  id v4;
  NSObject *downloadContextsIsolationQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  downloadContextsIsolationQueue = self->_downloadContextsIsolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PUPhotosGridDownloadHelper__removeDownloadRequestForIdentifier___block_invoke;
  block[3] = &unk_1E58ABCA8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(downloadContextsIsolationQueue, block);

}

- (PUPhotosGridDownloadUpdateHandler)updateHandler
{
  return (PUPhotosGridDownloadUpdateHandler *)objc_loadWeakRetained((id *)&self->_updateHandler);
}

- (BOOL)shouldTreatLivePhotosAsStills
{
  return self->_shouldTreatLivePhotosAsStills;
}

- (void)setShouldTreatLivePhotosAsStills:(BOOL)a3
{
  self->_shouldTreatLivePhotosAsStills = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateHandler);
  objc_storeStrong((id *)&self->_downloadContextsIsolationQueue, 0);
  objc_storeStrong((id *)&self->_downloadContexts, 0);
}

uint64_t __66__PUPhotosGridDownloadHelper__removeDownloadRequestForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
}

void __60__PUPhotosGridDownloadHelper__downloadContextForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __64__PUPhotosGridDownloadHelper__setDownloadContext_forIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

void __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateDownloadProgressForAsset:", *(_QWORD *)(a1 + 32));

}

void __95__PUPhotosGridDownloadHelper__startRetrievingRequiredResourcesForRequest_options_inCollection___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v8;
  id v9;
  id WeakRetained;

  v8 = (id *)(a1 + 40);
  v9 = a5;
  WeakRetained = objc_loadWeakRetained(v8);
  objc_msgSend(WeakRetained, "_downloadForRequest:didCompleteWithSuccess:canceled:error:", *(_QWORD *)(a1 + 32), a2, a3, v9);

}

void __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke_2;
  v8[3] = &unk_1E58A5F90;
  v9 = v2;
  v7 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
}

uint64_t __48__PUPhotosGridDownloadHelper_cancelAllDownloads__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __87__PUPhotosGridDownloadHelper__checkIfRetrievalIsRequiredForResourceRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 != 0, a4);
  return result;
}

void __92__PUPhotosGridDownloadHelper_handleDownloadOfAssetIfNeeded_inCollection_withSuccessHandler___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_downloadContextForIdentifier:", *(_QWORD *)(a1 + 40));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && objc_msgSend(*(id *)(a1 + 48), "isEqual:", v9))
  {
    objc_msgSend(*(id *)(a1 + 48), "setDownloadHandler:", *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 48), "resourceLocalAvailabilityRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
    v6 = WeakRetained;
    if (a2)
    {
      objc_msgSend(WeakRetained, "_defaultOptions");
      v7 = objc_claimAutoreleasedReturnValue();

      v8 = objc_loadWeakRetained((id *)(a1 + 80));
      objc_msgSend(v8, "_startRetrievingRequiredResourcesForRequest:options:inCollection:", v4, v7, *(_QWORD *)(a1 + 56));

      v6 = (void *)v7;
    }
    else
    {
      objc_msgSend(WeakRetained, "_downloadForRequest:didCompleteWithSuccess:canceled:error:", v4, 1, 0, 0);
    }

  }
  else
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 80));
    objc_msgSend(v4, "_downloadForRequest:didCompleteWithSuccess:canceled:error:", *(_QWORD *)(a1 + 64), 0, 1, 0);
  }

}

+ (id)createAlertControllerForDownloadError:(id)a3 withAsset:(id)a4
{
  id v5;
  id v6;
  PUSharingErrorPresentationController *v7;
  void *v8;
  void *v9;
  PUSharingErrorPresentationController *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = [PUSharingErrorPresentationController alloc];
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PUSharingErrorPresentationController initWithErrors:forAssets:fromSource:preparationType:](v7, "initWithErrors:forAssets:fromSource:preparationType:", v8, v9, 3, 0);
  -[PUErrorPresentationController setRadarDescription:](v10, "setRadarDescription:", CFSTR("Error trying to pick an asset from image picker."));
  -[PUErrorPresentationController setRadarComponentID:name:version:](v10, "setRadarComponentID:name:version:", CFSTR("476273"), CFSTR("Photos UI Image Picker"), CFSTR("iOS"));
  -[PUErrorPresentationController alertControllerWithCompletion:](v10, "alertControllerWithCompletion:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
