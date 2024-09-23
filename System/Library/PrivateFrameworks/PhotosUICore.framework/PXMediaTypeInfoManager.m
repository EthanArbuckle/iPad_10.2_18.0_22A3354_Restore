@implementation PXMediaTypeInfoManager

void __54__PXMediaTypeInfoManager_prepareInformationForLookups__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_prepareInformationForLookups");

}

void __39__PXMediaTypeInfoManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PXMediaTypeInfoManager _init]([PXMediaTypeInfoManager alloc], "_init");
  v1 = (void *)sharedManager__sharedManager;
  sharedManager__sharedManager = (uint64_t)v0;

}

- (void)prepareInformationForLookups
{
  dispatch_block_t v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__PXMediaTypeInfoManager_prepareInformationForLookups__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  v2 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v4);
  dispatch_get_global_queue(9, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, v2);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_prepareInformationForLookups
{
  NSObject *v3;
  uint8_t v4[16];

  if (objc_msgSend(MEMORY[0x1E0D4E020], "nonUserInitiatedDownloadsAllowed"))
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "PXMediaTypeInfoManager - Kick off speculative asset download.", v4, 2u);
    }

    -[PXMediaTypeInfoManager _installMobileAssetAsUserInitiated:timeout:completionHandler:](self, "_installMobileAssetAsUserInitiated:timeout:completionHandler:", 0, 0, -1.0);
  }
}

- (void)_installMobileAssetAsUserInitiated:(BOOL)a3 timeout:(double)a4 completionHandler:(id)a5
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  dispatch_time_t v14;
  NSObject *v15;
  NSObject *serialQueue;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;
  _QWORD v23[5];
  id v24;
  _QWORD block[4];
  id v26;
  id *v27;
  _QWORD aBlock[4];
  id v29;
  id *v30;
  id location[3];
  char v32;

  v9 = a5;
  v10 = v9;
  v11 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    v12 = _Block_copy(v9);
    if (a4 > 0.0)
    {
      if (!a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaTypeInfoManager.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInitiated"));

      }
      location[0] = 0;
      location[1] = location;
      location[2] = (id)0x2020000000;
      v32 = 1;
      aBlock[0] = v11;
      aBlock[1] = 3221225472;
      aBlock[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke;
      aBlock[3] = &unk_1E5131658;
      v30 = location;
      v29 = v10;
      v13 = _Block_copy(aBlock);

      v14 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      dispatch_get_global_queue(25, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472;
      block[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2;
      block[3] = &unk_1E5149038;
      v27 = location;
      v12 = v13;
      v26 = v12;
      dispatch_after(v14, v15, block);

      _Block_object_dispose(location, 8);
    }
    serialQueue = self->_serialQueue;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_208;
    v23[3] = &unk_1E5148CE0;
    v23[4] = self;
    v24 = v12;
    v17 = v12;
    dispatch_sync(serialQueue, v23);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4E028]), "initWithAssetType:", CFSTR("com.apple.MobileAsset.MediaSupport"));
  objc_initWeak(location, self);
  v20[0] = v11;
  v20[1] = 3221225472;
  v20[2] = __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2_210;
  v20[3] = &unk_1E5131680;
  objc_copyWeak(&v21, location);
  v22 = a3;
  objc_msgSend(v18, "startQuery:", v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(location);

}

- (id)_init
{
  PXMediaTypeInfoManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialQueue;
  NSMutableArray *v5;
  NSMutableArray *pendingCompletionHandlers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXMediaTypeInfoManager;
  v2 = -[PXMediaTypeInfoManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PXMediaTypeInfoManagerSerialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingCompletionHandlers = v2->_pendingCompletionHandlers;
    v2->_pendingCompletionHandlers = v5;

  }
  return v2;
}

+ (PXMediaTypeInfoManager)sharedManager
{
  if (sharedManager_predicate != -1)
    dispatch_once(&sharedManager_predicate, &__block_literal_global_172029);
  return (PXMediaTypeInfoManager *)(id)sharedManager__sharedManager;
}

- (PXMediaTypeInfoManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaTypeInfoManager.m"), 32, CFSTR("%s is not available as initializer"), "-[PXMediaTypeInfoManager init]");

  abort();
}

- (void)_processPendingCallbacksWithAsset:(id)a3
{
  id v4;
  NSObject *serialQueue;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  _QWORD block[6];
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__172012;
  v13[4] = __Block_byref_object_dispose__172013;
  v14 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = v13;
  dispatch_sync(serialQueue, block);
  dispatch_get_global_queue(25, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_2;
  v9[3] = &unk_1E5148AA8;
  v10 = v4;
  v11 = v13;
  v8 = v4;
  dispatch_async(v7, v9);

  _Block_object_dispose(v13, 8);
}

- (void)_handleAssetDownloadProgressWithAsset:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PXMediaTypeInfoManager *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Download returned error: %@", (uint8_t *)&v12, 0xCu);
    }

    v9 = self;
    v10 = 0;
LABEL_5:
    -[PXMediaTypeInfoManager _processPendingCallbacksWithAsset:](v9, "_processPendingCallbacksWithAsset:", v10);
    goto LABEL_6;
  }
  if (v6 && objc_msgSend(v6, "state") == 1)
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Did download asset.", (uint8_t *)&v12, 2u);
    }

    v9 = self;
    v10 = v6;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_handleAssetQueryCallbackWithAsset:(id)a3 error:(id)a4 userInitiated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id from;
  id location;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 buf;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = objc_msgSend(v8, "state");
    if (v10 == 1)
    {
      PLUIGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Asset installed.", (uint8_t *)&buf, 2u);
      }

      -[PXMediaTypeInfoManager _processPendingCallbacksWithAsset:](self, "_processPendingCallbacksWithAsset:", v8);
    }
    else if (!v10)
    {
      v11 = objc_msgSend(MEMORY[0x1E0D4E020], "nonUserInitiatedDownloadsAllowed");
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v11)
      {
        if (v13)
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Asset not present, will download.", (uint8_t *)&buf, 2u);
        }

        objc_msgSend(v8, "setUserInitiatedDownload:", v5);
        objc_initWeak(&location, self);
        objc_initWeak(&from, v8);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __81__PXMediaTypeInfoManager__handleAssetQueryCallbackWithAsset_error_userInitiated___block_invoke;
        v21[3] = &unk_1E5131630;
        objc_copyWeak(&v22, &location);
        objc_copyWeak(&v23, &from);
        objc_msgSend(v8, "setProgressHandler:", v21);
        if (v5)
        {
          v14 = *MEMORY[0x1E0D4DF20];
          v26 = *MEMORY[0x1E0D4DF18];
          v27 = v14;
          *(_QWORD *)&buf = MEMORY[0x1E0C9AAB0];
          *((_QWORD *)&buf + 1) = MEMORY[0x1E0C9AAB0];
          v15 = *MEMORY[0x1E0D4DF30];
          v28 = *MEMORY[0x1E0D4DF28];
          v29 = v15;
          v32 = MEMORY[0x1E0C9AAB0];
          v33 = MEMORY[0x1E0C9AAB0];
          v30 = *MEMORY[0x1E0D4DF48];
          v34 = *MEMORY[0x1E0D4DF58];
          v16 = 5;
        }
        else
        {
          v19 = *MEMORY[0x1E0D4DF28];
          v26 = *MEMORY[0x1E0D4DF20];
          v27 = v19;
          *(_QWORD *)&buf = MEMORY[0x1E0C9AAB0];
          *((_QWORD *)&buf + 1) = MEMORY[0x1E0C9AAB0];
          v28 = *MEMORY[0x1E0D4DF30];
          v32 = MEMORY[0x1E0C9AAB0];
          v16 = 3;
        }
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, &v26, v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "beginDownloadWithOptions:", v20);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&v22);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
      else
      {
        if (v13)
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Asset not present, not allowed to download.", (uint8_t *)&buf, 2u);
        }

        -[PXMediaTypeInfoManager _processPendingCallbacksWithAsset:](self, "_processPendingCallbacksWithAsset:", 0);
      }
    }
  }
  else
  {
    PLUIGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Query returned no asset! Error: %@", (uint8_t *)&buf, 0xCu);
    }

    -[PXMediaTypeInfoManager _processPendingCallbacksWithAsset:](self, "_processPendingCallbacksWithAsset:", 0);
  }

}

- (void)_handleInstallMobileAssetCallbackWithAsset:(id)a3 UTI:(id)a4 codecName:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD block[4];
  NSObject *v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (objc_msgSend(v11, "state") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaTypeInfoManager.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!asset || ([asset state] == ASAssetStateInstalled)"));

    }
    v49 = v13;
    objc_msgSend(v11, "localURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("mediaSupport"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathExtension:", CFSTR("plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v17, 2, &v54);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v54;
    v20 = v12;
    if (!v18)
    {
      PLUIGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v19;
        _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: failed to load plist data with error: %@", buf, 0xCu);
      }
      v33 = 0;
      v22 = v19;
LABEL_31:

      v12 = v20;
      v13 = v49;
      if (v33)
        goto LABEL_33;
      goto LABEL_32;
    }
    v53 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v18, 0, 0, &v53);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v53;

    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v21;
        v24 = v20;
        v47 = v49;
        -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("uniformTypeIdentifierURLs-Photos"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v24;
        objc_msgSend(v25, "objectForKeyedSubscript:", v24);
        v26 = objc_claimAutoreleasedReturnValue();

        if (v26)
          goto LABEL_44;
        -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("uniformTypeIdentifierURLs"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v48);
        v26 = objc_claimAutoreleasedReturnValue();

        if (v26)
          goto LABEL_44;
        -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("codecURLs-Photos"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v47);
        v26 = objc_claimAutoreleasedReturnValue();

        if (v26
          || (-[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("codecURLs")),
              v29 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v29, "objectForKeyedSubscript:", v47),
              v26 = objc_claimAutoreleasedReturnValue(),
              v29,
              v26))
        {
LABEL_44:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v46 = v23;
            PLUIGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              v31 = objc_opt_class();
              *(_DWORD *)buf = 138412290;
              v56 = v31;
              v32 = v31;
              _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: value should be string but is: \"%@\", buf, 0xCu);

            }
            v26 = 0;
            v23 = v46;
          }
        }

        if (v26)
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
          v33 = objc_claimAutoreleasedReturnValue();
          PLUIGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v33;
            _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Returning URL: \"%@\", buf, 0xCu);
          }

          goto LABEL_30;
        }
      }
      else
      {
        PLUIGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v36 = objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v56 = v36;
          v37 = v36;
          _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: plist must be a dictionary but is: \"%@\", buf, 0xCu);

        }
      }
    }
    else
    {
      PLUIGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v22;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Error: failed to deserialize plist data with error: %@", buf, 0xCu);
      }
    }
    v33 = 0;
LABEL_30:

    goto LABEL_31;
  }
  PLUIGetLog();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6789000, v35, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - No asset available for lookup.", buf, 2u);
  }

LABEL_32:
  +[PXMediaTypeInfoManager knowledgeBaseFallbackURL](PXMediaTypeInfoManager, "knowledgeBaseFallbackURL");
  v33 = objc_claimAutoreleasedReturnValue();
LABEL_33:
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "stringForKey:", CFSTR("PXMediaTypeInfoManagerMoreInfoURLString"));
  v39 = objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
    v40 = objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v40)
    {
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v40;
        _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Using debug URL: \"%@\", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v39);
      v42 = v33;
      v33 = objc_claimAutoreleasedReturnValue();
    }
    else if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v39;
      _os_log_impl(&dword_1A6789000, v42, OS_LOG_TYPE_ERROR, "PXMediaTypeInfoManager - Failed to create debug URL from the provided string: \"%@\", buf, 0xCu);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__PXMediaTypeInfoManager__handleInstallMobileAssetCallbackWithAsset_UTI_codecName_completionHandler___block_invoke;
  block[3] = &unk_1E5148CE0;
  v51 = v33;
  v52 = v14;
  v43 = v33;
  v44 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)mediaTypeInfoURLForUTI:(id)a3 codecName:(id)a4 timeout:(double)a5 completionHandler:(id)a6
{
  unint64_t v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26[2];
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = (unint64_t)a3;
  v12 = (unint64_t)a4;
  v13 = a6;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaTypeInfoManager.m"), 310, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  if (v11 | v12)
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Look up URL for UTI: \"%@\", codec: \"%@\", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    dispatch_get_global_queue(25, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_222;
    block[3] = &unk_1E513D290;
    objc_copyWeak(v26, (id *)buf);
    v26[1] = *(id *)&a5;
    v23 = (id)v11;
    v24 = (id)v12;
    v25 = v13;
    v16 = v13;
    dispatch_async(v15, block);

    objc_destroyWeak(v26);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    +[PXMediaTypeInfoManager knowledgeBaseFallbackURL](PXMediaTypeInfoManager, "knowledgeBaseFallbackURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = (unint64_t)v17;
      _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - !UTI && !codecName - Returning fallback URL: \"%@\", buf, 0xCu);
    }

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke;
    v27[3] = &unk_1E5148CE0;
    v28 = v17;
    v29 = v13;
    v19 = v17;
    v20 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], v27);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

uint64_t __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_222(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  double v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(double *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_2;
  v5[3] = &unk_1E51316A8;
  objc_copyWeak(&v9, v2);
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(WeakRetained, "_installMobileAssetAsUserInitiated:timeout:completionHandler:", 1, v5, v4);

  objc_destroyWeak(&v9);
}

void __85__PXMediaTypeInfoManager_mediaTypeInfoURLForUTI_codecName_timeout_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 7);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleInstallMobileAssetCallbackWithAsset:UTI:codecName:completionHandler:", v4, a1[4], a1[5], a1[6]);

}

uint64_t __101__PXMediaTypeInfoManager__handleInstallMobileAssetCallbackWithAsset_UTI_codecName_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    PLUIGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "PXMediaTypeInfoManager - Lookup timed out.", v3, 2u);
    }

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

void __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_208(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v2 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __87__PXMediaTypeInfoManager__installMobileAssetAsUserInitiated_timeout_completionHandler___block_invoke_2_210(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAssetQueryCallbackWithAsset:error:userInitiated:", v7, v5, *(unsigned __int8 *)(a1 + 40));

}

void __81__PXMediaTypeInfoManager__handleAssetQueryCallbackWithAsset_error_userInitiated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAssetDownloadProgressWithAsset:error:", v6, v5);

}

uint64_t __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

void __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_3;
  v3[3] = &unk_1E5131608;
  v4 = v1;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);

}

uint64_t __60__PXMediaTypeInfoManager__processPendingCallbacksWithAsset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

+ (NSURL)knowledgeBaseFallbackURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/kb/HT206892"));
}

@end
