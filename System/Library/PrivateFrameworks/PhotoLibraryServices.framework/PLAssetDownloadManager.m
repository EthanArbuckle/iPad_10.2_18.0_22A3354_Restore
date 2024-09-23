@implementation PLAssetDownloadManager

- (void)_onQueueAsync:(id)a3
{
  pl_dispatch_async();
}

- (PLAssetDownloadManager)init
{
  PLAssetDownloadManager *v2;
  uint64_t v3;
  NSMutableDictionary *requestsById;
  uint64_t v5;
  NSMutableDictionary *progressById;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLAssetDownloadManager;
  v2 = -[PLAssetDownloadManager init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    requestsById = v2->_requestsById;
    v2->_requestsById = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    progressById = v2->_progressById;
    v2->_progressById = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.mobileslideshow.plassetdownloadrequest", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (int)requestRequiredResourcesForManagedAssetObjectUUID:(id)a3 library:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  int *p_currentRequestId;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  int v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  _QWORD v41[5];
  id v42;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_currentRequestId = &self->_currentRequestId;
  do
  {
    v12 = __ldaxr((unsigned int *)p_currentRequestId);
    v13 = v12 + 1;
  }
  while (__stlxr(v13, (unsigned int *)p_currentRequestId));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__3330;
  v41[4] = __Block_byref_object_dispose__3331;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__3330;
  v39 = __Block_byref_object_dispose__3331;
  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke;
  v30[3] = &unk_1E3676348;
  v16 = v8;
  v31 = v16;
  v17 = v9;
  v32 = v17;
  v33 = v41;
  v34 = &v35;
  objc_msgSend(v17, "performBlockAndWait:", v30);
  if (objc_msgSend((id)v36[5], "count"))
  {
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4;
    v20[3] = &unk_1E3677880;
    v20[4] = self;
    v21 = v14;
    v25 = &v35;
    v22 = v16;
    v26 = v41;
    v23 = v17;
    v24 = v10;
    -[PLAssetDownloadManager _onQueueAsync:](self, "_onQueueAsync:", v20);

    v18 = v21;
  }
  else
  {
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3;
    v27[3] = &unk_1E3660DA8;
    v28 = v10;
    v29 = v13;
    -[PLAssetDownloadManager _onQueueAsync:](self, "_onQueueAsync:", v27);
    v18 = v28;
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(v41, 8);

  return v13;
}

- (void)cancelRequest:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__PLAssetDownloadManager_cancelRequest___block_invoke;
  v3[3] = &unk_1E3660E70;
  v3[4] = self;
  v4 = a3;
  -[PLAssetDownloadManager _onQueueAsync:](self, "_onQueueAsync:", v3);
}

- (PLAssetDownloadManagerDelegate)delegate
{
  return (PLAssetDownloadManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressById, 0);
  objc_storeStrong((id *)&self->_requestsById, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__PLAssetDownloadManager_cancelRequest___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        +[PLAssetResourceDownloadManager defaultManager](PLAssetResourceDownloadManager, "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancelRequest:", objc_msgSend(v8, "intValue"));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", a1[4], a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(v2, "persistedResourcesMatching:", &__block_literal_global_24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "cplType");
        if (v12)
        {
          v13 = v12;
          if ((int)objc_msgSend(v11, "remoteAvailability") >= 1)
          {
            objc_msgSend(v11, "cplFileURL");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "checkResourceIsReachableAndReturnError:", 0);

            if ((v15 & 1) == 0)
            {
              v16 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v17);

            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

}

uint64_t __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), 0);
}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  id obj;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKey:", v2, *(_QWORD *)(a1 + 40));
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v28 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v29;
    *(_QWORD *)&v4 = 138412546;
    v19 = v4;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v8), "unsignedIntegerValue", v19);
        PLBackendGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v19;
          v33 = v11;
          v34 = 2112;
          v35 = v12;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Starting download for asset: %@ cloudResourceType: %@", buf, 0x16u);

        }
        +[PLAssetResourceDownloadManager defaultManager](PLAssetResourceDownloadManager, "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v15 = *(_QWORD *)(a1 + 56);
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_27;
        v26[3] = &unk_1E3660E20;
        v16 = *(void **)(a1 + 40);
        v26[4] = *(_QWORD *)(a1 + 32);
        v27 = v16;
        v21[0] = v7;
        v21[1] = 3221225472;
        v21[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4_34;
        v21[3] = &unk_1E3660E48;
        v21[4] = *(_QWORD *)(a1 + 32);
        v22 = *(id *)(a1 + 48);
        v25 = v9;
        v23 = *(id *)(a1 + 40);
        v24 = *(id *)(a1 + 64);
        v17 = objc_msgSend(v13, "requestCloudResourceType:assetObjectID:library:progressHandler:completionHandler:", v9, v14, v15, v26, v21);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v18);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v5);
  }

}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_27(uint64_t a1, int a2, double a3)
{
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  double v9;
  int v10;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_2_28;
  v6[3] = &unk_1E3660DF8;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = a3;
  v10 = a2;
  objc_msgSend(v7, "_onQueueAsync:", v6);

}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_4_34(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;

  v5 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_5;
  v11[3] = &unk_1E3673910;
  v6 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 64);
  v12 = v7;
  v13 = v5;
  v9 = *(_QWORD *)(a1 + 32);
  v17 = v8;
  v14 = v9;
  v15 = *(id *)(a1 + 48);
  v18 = a2;
  v16 = *(id *)(a1 + 56);
  v10 = v5;
  objc_msgSend(v6, "_onQueueAsync:", v11);

}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLBackendGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", *(_QWORD *)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v11 = 138412802;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Finished download for asset: %@ cloudResourceType: %@ error:%@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v9);

    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 56));
      v10 = *(_QWORD *)(a1 + 64);
      if (v10)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 40));
    }
  }

}

void __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_2_28(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  id WeakRetained;
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3_29;
  v9[3] = &unk_1E3660DD0;
  v9[4] = &v10;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v9);
  v5 = v11[3];
  v6 = objc_msgSend(v2, "count");
  v11[3] = v5 / (double)v6;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v8, "progressForRequestId:progress:", *(unsigned int *)(a1 + 56), v11[3]);

  }
  _Block_object_dispose(&v10, 8);

}

double __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_3_29(uint64_t a1, uint64_t a2, void *a3)
{
  float v4;
  uint64_t v5;
  double result;

  objc_msgSend(a3, "floatValue");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v5 + 24) + v4;
  *(double *)(v5 + 24) = result;
  return result;
}

BOOL __102__PLAssetDownloadManager_requestRequiredResourcesForManagedAssetObjectUUID_library_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_msgSend(v2, "isDerivative") & 1) == 0
    && objc_msgSend(v2, "resourceType") != 13
    && objc_msgSend(v2, "resourceType") != 9;

  return v3;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_3349);
  return (id)defaultManager_manager;
}

void __40__PLAssetDownloadManager_defaultManager__block_invoke()
{
  PLAssetDownloadManager *v0;
  void *v1;

  v0 = objc_alloc_init(PLAssetDownloadManager);
  v1 = (void *)defaultManager_manager;
  defaultManager_manager = (uint64_t)v0;

}

@end
