@implementation PLAssetsdCPLResourceDownloader

- (PLAssetsdCPLResourceDownloader)initWithPhotoLibrary:(id)a3 trustedCallerBundleID:(id)a4 clientConnection:(id)a5
{
  id v10;
  id v11;
  PLAssetsdCPLResourceDownloader *v12;
  PLAssetsdCPLResourceDownloader *v13;
  id v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *pendingCPLDownloads;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *pendingCPLDownloadsIsolationQueue;
  void *v21;
  objc_super v22;
  id location;

  v10 = a3;
  v11 = a4;
  objc_initWeak(&location, a5);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCPLResourceDownloader.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v22.receiver = self;
  v22.super_class = (Class)PLAssetsdCPLResourceDownloader;
  v12 = -[PLAssetsdCPLResourceDownloader init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_trustedCallerBundleID, a4);
    v14 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v13->_clientConnection, v14);

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingCPLDownloads = v13->_pendingCPLDownloads;
    v13->_pendingCPLDownloads = v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.assetsd.pendingCPLDownloadsIsolation", v17);
    pendingCPLDownloadsIsolationQueue = v13->_pendingCPLDownloadsIsolationQueue;
    v13->_pendingCPLDownloadsIsolationQueue = (OS_dispatch_queue *)v18;

  }
  objc_destroyWeak(&location);

  return v13;
}

- (void)_handleInvalidation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pendingCPLDownloadsIsolationQueue);
  if (-[NSMutableDictionary count](self->_pendingCPLDownloads, "count"))
  {
    -[PLPhotoLibrary libraryServicesManager](self->_photoLibrary, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cloudPhotoLibraryManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary allKeys](self->_pendingCPLDownloads, "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "cancelResourceTransferTaskWithIdentifier:completion:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    -[NSMutableDictionary removeAllObjects](self->_pendingCPLDownloads, "removeAllObjects");
  }
}

- (void)handleInvalidation
{
  NSObject *pendingCPLDownloadsIsolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__PLAssetsdCPLResourceDownloader_handleInvalidation__block_invoke;
  v4[3] = &unk_1E3677D48;
  objc_copyWeak(&v5, &location);
  dispatch_async(pendingCPLDownloadsIsolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)startCPLDownloadForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 highPriority:(BOOL)a6 track:(BOOL)a7 notify:(BOOL)a8 transient:(BOOL)a9 proposedTaskIdentifier:(id)a10 doneToken:(id)a11 error:(id *)a12
{
  _BOOL4 v12;
  _BOOL4 v14;
  _BOOL8 v15;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  NSObject *pendingCPLDownloadsIsolationQueue;
  id v30;
  id v31;
  void *v32;
  NSObject *v33;
  NSString *trustedCallerBundleID;
  id *v35;
  id *v36;
  id *v37;
  uint64_t v38;
  _BOOL4 v40;
  NSString *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  _QWORD v47[4];
  _QWORD v48[2];
  id v49;
  id v50;
  BOOL v51;
  _QWORD v52[4];
  id v53[2];
  id v54;
  BOOL v55;
  _QWORD v56[4];
  _QWORD v57[2];
  id v58;
  id v59;
  BOOL v60;
  _QWORD v61[4];
  id v62;
  PLAssetsdCPLResourceDownloader *v63;
  id v64;
  BOOL v65;
  _QWORD block[5];
  id v67;
  id v68;
  unint64_t v69;
  _QWORD v70[4];
  id v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint8_t buf[4];
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[3];

  v12 = a8;
  v14 = a6;
  v15 = a5;
  v82[1] = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v43 = a10;
  v44 = a11;
  -[PLPhotoLibrary libraryServicesManager](self->_photoLibrary, "libraryServicesManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "cloudPhotoLibraryManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v73 = 0;
    v74 = &v73;
    v75 = 0x3032000000;
    v76 = __Block_byref_object_copy__77770;
    v77 = __Block_byref_object_dispose__77771;
    v78 = 0;
    objc_msgSend(v45, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke;
    v70[3] = &unk_1E3677C68;
    v72 = &v73;
    v42 = v45;
    v71 = v42;
    objc_msgSend(v19, "performBlockAndWait:", v70);

    PLImageManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = v74[5];
      *(_DWORD *)buf = 138412290;
      v80 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Starting CPL download with asset uuid: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdCPLResourceDownloader startCPLDownloadForAsset:resourceType:masterResourceOnly:highPriority:track:notify:transient:proposedTaskIdentifier:doneToken:error:]");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a7 || v12)
    {
      if (objc_msgSend(v43, "length"))
      {
        v27 = v43;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "UUIDString");
        v27 = (id)objc_claimAutoreleasedReturnValue();

      }
      pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_32;
      block[3] = &unk_1E3674F30;
      v69 = a4;
      block[4] = self;
      v23 = v27;
      v67 = v23;
      v68 = v22;
      dispatch_async(pendingCPLDownloadsIsolationQueue, block);

    }
    else
    {
      v23 = 0;
    }
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2;
    v61[3] = &unk_1E3671738;
    v30 = v23;
    v62 = v30;
    v63 = self;
    v65 = v12;
    v31 = v22;
    v64 = v31;
    v32 = (void *)MEMORY[0x19AEC174C](v61);
    if (a9)
    {
      if (v14)
      {
        PLBackendGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Requesting high priority in-memory resource download not supported, download will take place with default priority", buf, 2u);
        }

      }
      trustedCallerBundleID = self->_trustedCallerBundleID;
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_43;
      v56[3] = &unk_1E3671788;
      v57[0] = v30;
      v57[1] = self;
      v60 = v12;
      v58 = v44;
      v59 = v31;
      objc_msgSend(v46, "downloadResourceInMemoryForAsset:resourceType:masterResourceOnly:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:completionHandler:", v42, a4, v15, trustedCallerBundleID, v57[0], v32, v56);
      v35 = (id *)v57;
      v36 = &v58;
      v37 = &v59;
    }
    else
    {
      v40 = v14;
      v41 = self->_trustedCallerBundleID;
      v38 = MEMORY[0x1E0C809B0];
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_52;
      v52[3] = &unk_1E36717D8;
      v53[0] = v30;
      v53[1] = self;
      v55 = v12;
      v54 = v31;
      v47[0] = v38;
      v47[1] = 3221225472;
      v47[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3_55;
      v47[3] = &unk_1E3671828;
      v48[0] = v53[0];
      v48[1] = self;
      v51 = v12;
      v49 = v44;
      v50 = v54;
      objc_msgSend(v46, "downloadAsset:resourceType:masterResourceOnly:highPriority:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v42, a4, v15, v40, v41, v48[0], v32, v52, v47);

      v35 = v53;
      v36 = &v54;
      v37 = (id *)v48;
    }

    v26 = v30;
    _Block_object_dispose(&v73, 8);

  }
  else
  {
    if (a12)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      v81 = *MEMORY[0x1E0CB2D50];
      v82[0] = CFSTR("PLCloudPhotoLibraryManager is not available");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41004, v25);
      *a12 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = 0;
  }

  return v26;
}

- (void)cancelCPLDownloadTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  NSObject *pendingCPLDownloadsIsolationQueue;
  _QWORD v11[5];
  id v12;
  id v13;
  void (**v14)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[PLPhotoLibrary libraryServicesManager](self->_photoLibrary, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v9)
  {
    pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke;
    v11[3] = &unk_1E3671878;
    v11[4] = self;
    v12 = v6;
    v13 = v9;
    v14 = v7;
    dispatch_async(pendingCPLDownloadsIsolationQueue, v11);

  }
  else
  {
    v7[2](v7);
  }

}

- (void)cancelCPLDownloadTasks:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *pendingCPLDownloadsIsolationQueue;
  _QWORD v11[4];
  id v12;
  PLAssetsdCPLResourceDownloader *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PLPhotoLibrary libraryServicesManager](self->_photoLibrary, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v9)
  {
    pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke;
    v11[3] = &unk_1E3671878;
    v12 = v6;
    v13 = self;
    v14 = v9;
    v15 = v7;
    dispatch_async(pendingCPLDownloadsIsolationQueue, v11);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (void)sendClientCPLStatusWithVirtualTaskIdentifier:(id)a3 downloadContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  void *v24;
  id v25;

  v25 = a4;
  v6 = a3;
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("taskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("pending"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else if (v7)
  {
    -[PLPhotoLibrary libraryServicesManager](self->_photoLibrary, "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudPhotoLibraryManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isResourceTransferTaskAliveWithTaskWithIdentifier:", v7);

    v10 = v13 ^ 1;
  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("progress"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("progress"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

  }
  else
  {
    v17 = -1.0;
  }

  if ((v10 & 1) != 0)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("completed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("completed"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v20, "BOOLValue");

    }
    else
    {
      v18 = 0;
    }

  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("error"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("data"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  objc_msgSend(WeakRetained, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_77756);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "downloadStatusForIdentifier:progress:completed:data:error:", v6, v18, v22, v21, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCPLDownloads, 0);
  objc_storeStrong((id *)&self->_pendingCPLDownloadsIsolationQueue, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __95__PLAssetsdCPLResourceDownloader_sendClientCPLStatusWithVirtualTaskIdentifier_downloadContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLGatekeeperXPCGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[PLAssetsdCPLResourceDownloader sendClientCPLStatusWithVirtualTaskIdentifier:downloadContext:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!v2)
    goto LABEL_9;
  v3 = v2;
  v4 = 0;
  for (i = 0; i != v3; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("taskIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        ++v16[3];
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_2;
        v10[3] = &unk_1E36718C8;
        v9 = *(void **)(a1 + 48);
        v10[4] = *(_QWORD *)(a1 + 40);
        v11 = v6;
        v14 = &v15;
        v13 = *(id *)(a1 + 56);
        v12 = *(id *)(a1 + 32);
        objc_msgSend(v9, "cancelResourceTransferTaskWithIdentifier:completion:", v8, v10);

        v4 = 1;
      }

    }
  }
  if ((v4 & 1) == 0)
LABEL_9:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  _Block_object_dispose(&v15, 8);
}

void __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  __int128 v7;
  _QWORD block[5];
  id v9;
  id v10;
  __int128 v11;
  char v12;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_3;
  block[3] = &unk_1E36718A0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(v3 + 32);
  block[1] = 3221225472;
  v12 = a2;
  block[4] = v3;
  v9 = v4;
  v7 = *(_OWORD *)(a1 + 56);
  v6 = (id)v7;
  v11 = v7;
  v10 = *(id *)(a1 + 48);
  dispatch_async(v5, block);

}

uint64_t __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 72))
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 40), "removeObjectForKey:", *(_QWORD *)(result + 40));
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 64) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
  return result;
}

void __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("taskIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_2;
      v7[3] = &unk_1E3671850;
      v5 = *(void **)(a1 + 40);
      v6 = *(void **)(a1 + 48);
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v5;
      v9 = *(id *)(a1 + 56);
      objc_msgSend(v6, "cancelResourceTransferTaskWithIdentifier:completion:", v4, v7);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[5];
  id v11;

  if ((_DWORD)a2)
  {
    v6 = a1[4];
    v7 = (void *)a1[5];
    v8 = *(NSObject **)(v6 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_3;
    v10[3] = &unk_1E3677C18;
    v10[4] = v6;
    v11 = v7;
    dispatch_async(v8, v10);

  }
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], a2, a3, a4, a5);
}

uint64_t __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, CFSTR("resourceType"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("pending"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "hash");
  objc_msgSend((id)v6, "hash");
  kdebug_trace();
  if (v6 | v7)
  {
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(NSObject **)(v9 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3;
      v11[3] = &unk_1E3671710;
      v11[4] = v9;
      v12 = v8;
      v13 = (id)v6;
      v14 = (id)v7;
      v16 = *(_BYTE *)(a1 + 56);
      v15 = *(id *)(a1 + 48);
      dispatch_async(v10, v11);

    }
  }

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_43(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "hash");
  objc_msgSend(v7, "hash");
  kdebug_trace();
  if (v7)
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(NSObject **)(v11 + 32);
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_44;
      v16 = &unk_1E3671760;
      v17 = v11;
      v18 = v10;
      v19 = v9;
      v20 = v8;
      v24 = *(_BYTE *)(a1 + 64);
      v21 = v7;
      v22 = *(id *)(a1 + 48);
      v23 = *(id *)(a1 + 56);
      dispatch_async(v12, &v13);

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "stillAlive", v13, v14, v15, v16, v17);

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_52(uint64_t a1, void *a2, float a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  float v13;
  char v14;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "hash");
  objc_msgSend(v5, "hash");
  kdebug_trace();
  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(NSObject **)(v7 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_53;
      block[3] = &unk_1E36717B0;
      block[4] = v7;
      v10 = v6;
      v13 = a3;
      v14 = *(_BYTE *)(a1 + 56);
      v11 = v5;
      v12 = *(id *)(a1 + 48);
      dispatch_async(v8, block);

    }
  }

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3_55(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v7 = a2;
  v8 = a5;
  objc_msgSend(*(id *)(a1 + 32), "hash");
  objc_msgSend(v7, "hash");
  kdebug_trace();
  if (v7)
  {
    v9 = *(void **)(a1 + 32);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(NSObject **)(v10 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_4;
      block[3] = &unk_1E3671800;
      block[4] = v10;
      v13 = v9;
      v14 = v8;
      v18 = *(_BYTE *)(a1 + 64);
      v15 = v7;
      v16 = *(id *)(a1 + 48);
      v17 = *(id *)(a1 + 56);
      dispatch_async(v11, block);

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "stillAlive");

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v2, CFSTR("completed"));

  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("error"));
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 40), "hash");
    objc_msgSend(*(id *)(a1 + 56), "hash");
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "sendClientCPLStatusWithVirtualTaskIdentifier:downloadContext:", *(_QWORD *)(a1 + 40), v5);
  }
  v4 = *(void **)(a1 + 64);
  if (v4)
  {
    objc_msgSend(v4, "hash");
    kdebug_trace();
    notify_post((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 64)), "UTF8String"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 72), "stillAlive");

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_53(uint64_t a1)
{
  double v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("progress"));

  if (*(_BYTE *)(a1 + 68))
  {
    objc_msgSend(*(id *)(a1 + 40), "hash");
    objc_msgSend(*(id *)(a1 + 48), "hash");
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "sendClientCPLStatusWithVirtualTaskIdentifier:downloadContext:", *(_QWORD *)(a1 + 40), v4);
  }
  objc_msgSend(*(id *)(a1 + 56), "stillAlive");

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("completed"));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v2, CFSTR("error"));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("data"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E37643C8, CFSTR("progress"));
  }
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 40), "hash");
    objc_msgSend(*(id *)(a1 + 64), "hash");
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "sendClientCPLStatusWithVirtualTaskIdentifier:downloadContext:", *(_QWORD *)(a1 + 40), v5);
  }
  v4 = *(void **)(a1 + 72);
  if (v4)
  {
    objc_msgSend(v4, "hash");
    kdebug_trace();
    notify_post((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 72)), "UTF8String"));
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 80), "stillAlive");

}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    objc_msgSend(v4, "setObject:forKey:", v2, CFSTR("taskIdentifier"));
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("error"));
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "hash");
    objc_msgSend(*(id *)(a1 + 48), "hash");
    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "sendClientCPLStatusWithVirtualTaskIdentifier:downloadContext:", *(_QWORD *)(a1 + 40), v4);
  }
  objc_msgSend(*(id *)(a1 + 64), "stillAlive");
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("pending"));

}

void __52__PLAssetsdCPLResourceDownloader_handleInvalidation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInvalidation");

}

@end
