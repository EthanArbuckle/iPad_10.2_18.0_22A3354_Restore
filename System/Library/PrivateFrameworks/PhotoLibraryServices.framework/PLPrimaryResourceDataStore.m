@implementation PLPrimaryResourceDataStore

+ (unsigned)storeClassID
{
  return 0;
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  uint64_t v3;
  int v4;
  void *v5;

  v3 = a3;
  if (a3 >= 0x10u)
    v4 = 16;
  else
    v4 = a3;
  if (v4 == 3 || v4 == 4 || v4 == 16)
    v5 = (void *)objc_opt_class();
  else
    v5 = 0;
  return objc_msgSend(v5, "keyLengthWithDataPreview:", v3);
}

- (PLPrimaryResourceDataStore)initWithPathManager:(id)a3
{
  id v4;
  PLPrimaryResourceDataStore *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *lock_makeAvailableProgressByTaskIdentifier;
  PLPrimaryResourceDataStoreKeyHelper *v8;
  PLPrimaryResourceDataStoreKeyHelper *mainScopeKeyHelper;
  id v10;
  id v11;
  uint64_t v12;
  NSDictionary *keyHelperByBundleScope;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PLPrimaryResourceDataStore;
  v5 = -[PLResourceDataStore initWithPathManager:](&v17, sel_initWithPathManager_, v4);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_makeAvailableProgressByTaskIdentifier = v5->_lock_makeAvailableProgressByTaskIdentifier;
    v5->_lock_makeAvailableProgressByTaskIdentifier = v6;

    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_masterThumbRecipeID = 0;
    v8 = -[PLPrimaryResourceDataStoreKeyHelper initWithPathManager:]([PLPrimaryResourceDataStoreKeyHelper alloc], "initWithPathManager:", v4);
    mainScopeKeyHelper = v5->_mainScopeKeyHelper;
    v5->_mainScopeKeyHelper = v8;

    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__PLPrimaryResourceDataStore_initWithPathManager___block_invoke;
    v15[3] = &unk_1E36626C0;
    v16 = v10;
    v11 = v10;
    objc_msgSend(v4, "enumerateBundleScopesWithBlock:", v15);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v11);
    keyHelperByBundleScope = v5->_keyHelperByBundleScope;
    v5->_keyHelperByBundleScope = (NSDictionary *)v12;

  }
  return v5;
}

void __50__PLPrimaryResourceDataStore_initWithPathManager___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  PLPrimaryResourceDataStoreKeyHelper *v9;

  if ((_DWORD)a2)
  {
    v6 = a4;
    v9 = -[PLPrimaryResourceDataStoreKeyHelper initWithPathManager:]([PLPrimaryResourceDataStoreKeyHelper alloc], "initWithPathManager:", v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);

  }
}

- (id)keyHelperForBundleScope:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[PLPrimaryResourceDataStore keyHelperByBundleScope](self, "keyHelperByBundleScope");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PLPrimaryResourceDataStore mainScopeKeyHelper](self, "mainScopeKeyHelper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (PLPrimaryResourceDataStoreKeyHelper)mainScopeKeyHelper
{
  return self->_mainScopeKeyHelper;
}

- (NSDictionary)keyHelperByBundleScope
{
  return self->_keyHelperByBundleScope;
}

- (id)_newProgressForTaskWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  +[PLSyncCancellingProgress discreteProgressWithTotalUnitCount:](PLSyncCancellingProgress, "discreteProgressWithTotalUnitCount:", 100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PLPrimaryResourceDataStore__newProgressForTaskWithIdentifier_type___block_invoke;
  v11[3] = &unk_1E3677B80;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  objc_msgSend(v7, "setCancellationHandler:", v11);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInfoObject:forKey:", v9, CFSTR("_PLMakeAvailableProgressTypeKey"));

  objc_msgSend(v7, "setUserInfoObject:forKey:", &unk_1E375D2A8, CFSTR("_PLMakeAvailableProgressStateKey"));
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v7;
}

- (BOOL)_lock_taskIsPendingDownloadWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PLMakeAvailableProgressTypeKey"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "integerValue") == 1)
      {
        objc_msgSend(v6, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_PLMakeAvailableProgressStateKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue") == 1;

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_lock_transitionTaskToInflightWithIdentifier:(id)a3
{
  id v3;

  if (a3)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "objectForKeyedSubscript:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInfoObject:forKey:", &unk_1E375D2C0, CFSTR("_PLMakeAvailableProgressStateKey"));

  }
}

- (id)_finalizeDeferredResource:(id)a3 asset:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  os_signpost_id_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void (**v34)(id, void *, id);
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  NSObject *v43;
  NSObject *v44;
  void *v46;
  id v47;
  void *v48;
  id v49;
  _QWORD v50[4];
  id v51;
  id v52;
  PLPrimaryResourceDataStore *v53;
  void (**v54)(id, void *, id);
  _BYTE *v55;
  NSObject *v56;
  os_signpost_id_t v57;
  id v58;
  id v59;
  _BYTE buf[24];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, void *, id))a6;
  v46 = v10;
  objc_msgSend(v10, "taskIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLImageManagerGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ requesting final image from deferred processing demon for asset: %@", buf, 0x16u);
  }

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTaskIdentifier:", v12);
  }
  PLSendCTMScheduleAnalytics(v9, 0, 1);
  v15 = objc_msgSend(v49, "recipeID");
  v16 = objc_msgSend(v9, "deferredProcessingNeeded");
  v17 = objc_msgSend(v9, "videoDeferredProcessingNeeded");
  objc_msgSend(v49, "localAvailabilityTarget");
  if ((v15 & 0xFFFFFFFD) == 0x10198)
    goto LABEL_6;
  v19 = 0;
  if (v15 <= 131271)
  {
    if (v15 != 65938)
    {
      if (v15 != 0x20000)
        goto LABEL_29;
      goto LABEL_15;
    }
    v19 = 0;
    if (v16 == 2 || v16 == 9)
      goto LABEL_29;
    v20 = v16 == 1 || v16 == 10;
    v21 = 4;
    v22 = 2;
LABEL_23:
    if (v20)
      v21 = v22;
LABEL_27:
    if ((unint64_t)(v21 - 1) > 1)
    {
LABEL_28:
      v19 = 0;
      goto LABEL_29;
    }
LABEL_6:
    v18 = objc_msgSend(v9, "deferredProcessingNeeded");
    if (v18 == 10 || v18 == 1)
    {
      +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 65944);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (v15 == 131280)
  {
    v21 = v17 != 0;
    goto LABEL_27;
  }
  if (v15 != 131272)
    goto LABEL_29;
LABEL_15:
  v19 = 0;
  switch(v16)
  {
    case 1:
    case 10:
      goto LABEL_6;
    case 2:
    case 9:
      break;
    default:
      v20 = v17 == 0;
      v21 = 2;
      v22 = 4;
      goto LABEL_23;
  }
LABEL_29:
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  v23 = objc_msgSend(v48, "BOOLForKey:", CFSTR("PLFrameDropRecoveryOnDemandProcessingUserDefaultsKey"));
  if ((v23 & 1) != 0)
  {
    v47 = 0;
  }
  else
  {
    v59 = 0;
    v24 = +[PLPrimaryResourceDataStore bailOutOfVideoFinalizationForAsset:taskIdentifier:error:](PLPrimaryResourceDataStore, "bailOutOfVideoFinalizationForAsset:taskIdentifier:error:", v9, v12, &v59);
    v47 = v59;
    if (!v24)
    {
      PLImageManagerGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v61 = v47;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Error bailing out of video finalization for asset with uuid %@: %@", buf, 0x20u);
      }

      goto LABEL_50;
    }
  }
  if (!v19)
  {
LABEL_50:
    v11[2](v11, v12, v47);
    v19 = 0;
    v39 = 0;
    goto LABEL_51;
  }
  PLImageManagerGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ Generating resource for recipe %@ as it is not available", buf, 0x16u);
  }

  if (v23)
  {
    PLImageManagerGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = CFSTR("PLFrameDropRecoveryOnDemandProcessingUserDefaultsKey");
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Requesting on demand frame drop recovery because the user default %@ is set", buf, 0x16u);
    }

    +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", 131280);
    v27 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v27;
  }
  PLImageManagerGetLog();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v29 = os_signpost_id_generate(v28);

  v30 = v28;
  v31 = v30;
  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v19;
    _os_signpost_emit_with_name_impl(&dword_199541000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "GenerateAndStoreDeferredResource", "taskIdentifier = %{public}@, recipe %{public}@", buf, 0x16u);
  }
  v44 = v31;

  v32 = v12;
  v33 = v13;
  v34 = v11;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v61) = 0;
  -[PLPrimaryResourceDataStore _imageConversionServiceClient](self, "_imageConversionServiceClient");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPrimaryResourceDataStore _videoConversionServiceClient](self, "_videoConversionServiceClient");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPrimaryResourceDataStore _deferredPhotoFinalizer](self, "_deferredPhotoFinalizer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3254779904;
  v50[2] = __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke;
  v50[3] = &unk_1E365EB50;
  v43 = v44;
  v56 = v43;
  v57 = v29;
  v38 = v32;
  v51 = v38;
  v52 = v33;
  v53 = self;
  v55 = buf;
  v54 = v34;
  objc_msgSend(v19, "generateAndStoreForAsset:version:imageConversionClient:videoConversionClient:conversionServiceOptions:deferredPhotoFinalizer:progress:reason:completion:", v9, 0, v35, v36, 0, v37, &v58, CFSTR("On demand recipe generation request"), v50);
  v39 = v58;

  v11 = v34;
  v13 = v33;
  v12 = v32;

  if (v39)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "setObject:forKeyedSubscript:", v39, v38);
    os_unfair_lock_unlock(&self->_lock);
  }

  _Block_object_dispose(buf, 8);
LABEL_51:
  v41 = v39;

  return v41;
}

- (BOOL)isCPLSyncableLibraryStore
{
  void *v2;
  char v3;

  -[PLResourceDataStore pathManager](self, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCPLSyncablePhotoLibraryPathManager");

  return v3;
}

- (id)_cplResourceIfDownloadIsAvailableForResource:(id)a3 asset:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _OWORD v18[3];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[PLPrimaryResourceDataStore isCPLSyncableLibraryStore](self, "isCPLSyncableLibraryStore")
    && objc_msgSend(v8, "isCPLResource"))
  {
    if (objc_msgSend(v10, "isTransient"))
    {
      objc_msgSend(v9, "rm_cplResourceForResourceType:", objc_msgSend(v8, "cplType"));
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v12 = (void *)v11;
      goto LABEL_6;
    }
    objc_msgSend(v10, "downloadOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hasValidTimeRange");

    if (!v15)
    {
      objc_msgSend(v8, "cplResourceIncludeFile:", 1);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend(v10, "downloadOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "timeRange");
    else
      memset(v18, 0, sizeof(v18));
    objc_msgSend(v8, "cplResourceForTimeRange:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
LABEL_6:

  return v12;
}

- (void)_downloadCPLResource:(id)a3 options:(id)a4 taskDidBeginHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, float);
  void *v27;
  PLPrimaryResourceDataStore *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  uint8_t buf[16];

  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  if (objc_msgSend(v10, "isTransient"))
  {
    objc_msgSend(v10, "dataHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      PLImageManagerGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Transient download started without a handler to deliver data, downloaded data will be unused", buf, 2u);
      }

    }
    -[PLPrimaryResourceDataStore _cplManager](self, "_cplManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "taskIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke;
    v29[3] = &unk_1E3660310;
    v30 = v10;
    v31 = v11;
    objc_msgSend(v16, "downloadResourceInMemory:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:completionHandler:", v13, v17, v18, v12, v29);

  }
  else
  {
    -[PLPrimaryResourceDataStore _cplManager](self, "_cplManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "downloadOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientBundleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "taskIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "wantsProgress"))
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke_2;
      v27 = &unk_1E3660338;
      v23 = &v24;
      v28 = self;
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v19, "downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v13, v20, v21, v22, v12, v23, v11, v24, v25, v26, v27, v28);

  }
}

- (id)_deferredPhotoFinalizer
{
  PLPrimaryResourceDataStore *v2;
  PLDeferredPhotoFinalizer *v3;
  PLDeferredPhotoFinalizer *deferredPhotoFinalizer;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_deferredPhotoFinalizer)
  {
    v3 = -[PLDeferredPhotoFinalizer initForUseCase:]([PLDeferredPhotoFinalizer alloc], "initForUseCase:", 0);
    deferredPhotoFinalizer = v2->_deferredPhotoFinalizer;
    v2->_deferredPhotoFinalizer = v3;

  }
  objc_sync_exit(v2);

  return v2->_deferredPhotoFinalizer;
}

- (id)_imageConversionServiceClient
{
  PLPrimaryResourceDataStore *v2;
  PAImageConversionServiceClient *v3;
  PAImageConversionServiceClient *imageConversionServiceClient;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_imageConversionServiceClient)
  {
    v3 = (PAImageConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47BE8]);
    imageConversionServiceClient = v2->_imageConversionServiceClient;
    v2->_imageConversionServiceClient = v3;

  }
  objc_sync_exit(v2);

  return v2->_imageConversionServiceClient;
}

- (id)_videoConversionServiceClient
{
  PLPrimaryResourceDataStore *v2;
  PAVideoConversionServiceClient *v3;
  PAVideoConversionServiceClient *videoConversionServiceClient;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_videoConversionServiceClient)
  {
    v3 = (PAVideoConversionServiceClient *)objc_alloc_init(MEMORY[0x1E0D47C30]);
    videoConversionServiceClient = v2->_videoConversionServiceClient;
    v2->_videoConversionServiceClient = v3;

  }
  objc_sync_exit(v2);

  return v2->_videoConversionServiceClient;
}

- (void)_cancelAvailabilityRequestWithTaskIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  const __CFString *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  const __CFString *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("_PLMakeAvailableProgressTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v6, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_PLMakeAvailableProgressStateKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

  }
  else
  {
    v12 = 0;
    v9 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "setObject:forKeyedSubscript:", 0, v4);
  os_unfair_lock_unlock(&self->_lock);
  PLImageManagerGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      if (v9 > 2)
        v15 = CFSTR("undefined");
      else
        v15 = off_1E3660538[v9];
      if (v12 > 2)
        v20 = CFSTR("undefined");
      else
        v20 = off_1E3660550[v12];
      *(_DWORD *)buf = 138543874;
      v25 = v4;
      v26 = 2112;
      v27 = v15;
      v28 = 2112;
      v29 = v20;
      v16 = "[RM]: %{public}@ Will cancel make available request of type %@ in state %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEBUG;
      v19 = 32;
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v4;
    v16 = "Attempting to cancel availability request with identifier: %{public}@ that is not being tracked";
    v17 = v14;
    v18 = OS_LOG_TYPE_DEFAULT;
    v19 = 12;
LABEL_15:
    _os_log_impl(&dword_199541000, v17, v18, v16, buf, v19);
  }

  if (v9 == 1 && v12 == 2)
  {
    -[PLPrimaryResourceDataStore _cplManager](self, "_cplManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __75__PLPrimaryResourceDataStore__cancelAvailabilityRequestWithTaskIdentifier___block_invoke;
    v22[3] = &unk_1E3660360;
    v23 = v4;
    objc_msgSend(v21, "cancelResourceTransferTaskWithIdentifier:completion:", v23, v22);

  }
}

- (void)_verifyResourceLocalAvailability:(id)a3 localResourceFileURL:(id *)a4 resourceReapirNeeded:(int64_t *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  char v24;
  char v25;

  v7 = a3;
  if (objc_msgSend(v7, "isLocallyAvailable"))
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v10, &v25);

    v12 = 1;
    if (v11 && !v25)
    {
      objc_msgSend(v7, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (PLCanIncludeResourceInHints(v7, v13))
      {
        objc_msgSend(v7, "asset");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "imageRequestHintsContainsResource:", v7);

        if (v15)
          v12 = 0;
        else
          v12 = 3;
      }
      else
      {

        v12 = 0;
      }
      objc_msgSend(v7, "fileURL");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v7, "fileURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(v7, "expectedFileURL");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "fileExistsAtPath:isDirectory:", v21, &v24);

  v23 = 0;
  if (v22 && !v24)
  {
    v23 = v19;
    v12 = 2;
  }

  if (a4)
LABEL_16:
    *a4 = objc_retainAutorelease(v23);
LABEL_17:
  if (a5)
    *a5 = v12;

}

- (id)_makeResourceLocallyAvailable:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  id *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  __CFString *v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  char v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  void *v81;
  NSObject *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  BOOL v101;
  void *v102;
  uint64_t v103;
  void *v104;
  __CFString *v105;
  __CFString *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  id v114;
  NSObject *v115;
  void *v116;
  void *v117;
  int v118;
  void *v119;
  NSObject *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  uint64_t v136;
  void *v137;
  id v138;
  NSObject *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  unsigned int v144;
  __CFString *v145;
  __CFString *v146;
  int v147;
  const __CFString *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  unsigned int v156;
  __CFString *v157;
  __CFString *v158;
  int v159;
  const __CFString *v160;
  void *v161;
  void *v162;
  void *v164;
  _BOOL8 v165;
  int v166;
  void *v167;
  uint64_t v168;
  void *v169;
  int v170;
  const __CFString *v171;
  uint64_t v172;
  void *v173;
  void (**v174)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v175;
  void *v176;
  void *v177;
  _QWORD v178[4];
  id v179;
  id v180;
  _QWORD v181[4];
  id v182;
  id v183;
  void (**v184)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v185;
  int v186;
  _QWORD v187[4];
  id v188;
  id v189;
  PLPrimaryResourceDataStore *v190;
  id v191;
  id v192;
  void (**v193)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v194;
  uint64_t v195;
  int v196;
  id v197;
  _QWORD v198[4];
  id v199;
  id v200;
  id v201;
  PLPrimaryResourceDataStore *v202;
  id v203;
  void (**v204)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v205;
  uint64_t v206;
  int v207;
  _QWORD v208[5];
  id v209;
  id v210;
  id v211;
  id v212;
  _QWORD v213[4];
  id v214;
  PLPrimaryResourceDataStore *v215;
  id v216;
  uint64_t v217;
  _QWORD v218[4];
  id v219;
  PLPrimaryResourceDataStore *v220;
  id v221;
  _QWORD v222[4];
  id v223;
  id v224;
  __CFString *v225;
  _QWORD v226[4];
  id v227;
  id v228;
  _QWORD v229[4];
  id v230;
  id v231;
  id v232;
  uint64_t v233;
  void *v234;
  void *v235;
  _BYTE buf[12];
  __int16 v237;
  void *v238;
  __int16 v239;
  const __CFString *v240;
  uint64_t v241;

  v241 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  PLImageManagerGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "taskIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "[RM] %@ primaryDataStore - making resource available", buf, 0xCu);

  }
  objc_msgSend(v8, "fileSystemBookmark");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v8, "fileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      PLImageManagerGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "taskIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[RM] %@ reference media resource is missing fileURL, attempting to recreate from bookmark", buf, 0xCu);

      }
      objc_msgSend(v8, "fileSystemBookmark");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fileSystemVolume");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v232 = 0;
      v25 = PLPrimaryResourceDataStoreReferenceFileURL(v23, v24, &v232);
      v16 = (__CFString *)v232;

      if (v25)
      {
        if (v25 != 3)
        {
LABEL_52:
          v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v50, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D74608]);
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 7, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD, uint64_t, _QWORD))v10 + 2))(v10, v51, 0, objc_msgSend(v8, "cplType"), 0);

          goto LABEL_53;
        }
        PLImageManagerGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "taskIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "asset");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v27;
          v237 = 2114;
          v238 = v29;
          v239 = 2112;
          v240 = v16;
          v30 = "[RM] %@ No volume URL for referenced resource for asset %{public}@, using artificial volume for URL %@";
          v31 = v26;
          v32 = OS_LOG_TYPE_DEFAULT;
          v33 = 32;
LABEL_50:
          _os_log_impl(&dword_199541000, v31, v32, v30, buf, v33);

        }
      }
      else
      {
        PLImageManagerGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "taskIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "asset");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v27;
          v237 = 2114;
          v238 = v29;
          v30 = "[RM] %@ Failed to resolve bookmark URL for asset %{public}@";
          v31 = v26;
          v32 = OS_LOG_TYPE_ERROR;
          v33 = 22;
          goto LABEL_50;
        }
      }

      goto LABEL_52;
    }
  }
  if ((objc_msgSend(v9, "isTransient") & 1) != 0)
    goto LABEL_23;
  *(_QWORD *)buf = 0;
  v231 = 0;
  -[PLPrimaryResourceDataStore _verifyResourceLocalAvailability:localResourceFileURL:resourceReapirNeeded:](self, "_verifyResourceLocalAvailability:localResourceFileURL:resourceReapirNeeded:", v8, &v231, buf);
  v16 = (__CFString *)v231;
  switch(*(_QWORD *)buf)
  {
    case 3:
      v18 = v10;
      objc_msgSend(v8, "photoLibrary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v226[0] = MEMORY[0x1E0C809B0];
      v226[1] = 3221225472;
      v226[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_75;
      v226[3] = &unk_1E3677C18;
      v20 = &v227;
      v227 = v9;
      v228 = v8;
      objc_msgSend(v34, "performTransactionAndWait:", v226);

      v19 = v228;
      goto LABEL_20;
    case 2:
      objc_msgSend(v8, "fileSystemBookmark");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
        break;
      v18 = v10;
      objc_msgSend(v8, "photoLibrary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v222[0] = MEMORY[0x1E0C809B0];
      v222[1] = 3221225472;
      v222[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_76;
      v222[3] = &unk_1E3677530;
      v20 = &v223;
      v223 = v9;
      v224 = v8;
      v225 = v16;
      objc_msgSend(v36, "performTransactionAndWait:", v222);

      v19 = v224;
      goto LABEL_20;
    case 1:
      objc_msgSend(v8, "fileSystemBookmark");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v18 = v10;
        objc_msgSend(v8, "photoLibrary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v229[0] = MEMORY[0x1E0C809B0];
        v229[1] = 3221225472;
        v229[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke;
        v229[3] = &unk_1E3677AA0;
        v20 = &v230;
        v230 = v8;
        objc_msgSend(v19, "performTransactionAndWait:", v229);
LABEL_20:

        v10 = v18;
      }
      break;
  }
  if (v16)
  {
    (*((void (**)(id, _QWORD, _QWORD, uint64_t, __CFString *))v10 + 2))(v10, 0, 0, objc_msgSend(v8, "cplType"), v16);
LABEL_53:
    v52 = 0;
    goto LABEL_132;
  }
LABEL_23:
  if (objc_msgSend((id)objc_opt_class(), "isMasterThumbRecipeID:", objc_msgSend(v8, "recipeID")))
  {
    objc_msgSend(v8, "asset");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "hasAdjustments"))
      objc_msgSend(v37, "assetResourceForCPLType:", 5);
    else
      objc_msgSend(v37, "masterResourceForCPLType:", 5);
    v38 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v38;
  }
  v39 = objc_msgSend(v8, "recipeID");
  objc_msgSend(v8, "asset");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "deferredProcessingNeeded");
  objc_msgSend(v8, "asset");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "videoDeferredProcessingNeeded");
  v44 = objc_msgSend(v8, "localAvailabilityTarget");
  if ((v39 & 0xFFFFFFFD) == 0x10198)
  {
    v45 = 1;
    goto LABEL_62;
  }
  if (v39 >= 0x20000)
  {
    switch(v39)
    {
      case 131072:
        goto LABEL_34;
      case 131280:
        v45 = v43 != 0;
        goto LABEL_62;
      case 131272:
LABEL_34:
        LOWORD(v46) = v41 - 1;
        if ((v41 - 1) >= 0xA || ((0x303u >> v46) & 1) == 0)
        {
          v47 = v43 == 0;
          v48 = 2;
          v49 = 4;
LABEL_37:
          if (v47)
            v45 = v49;
          else
            v45 = v48;
          goto LABEL_62;
        }
        v46 = (__int16)v46;
        v53 = &unk_199B9FCB0;
LABEL_61:
        v45 = v53[v46];
        goto LABEL_62;
    }
LABEL_56:
    if (v44 != 1 || (unsigned __int16)(v41 - 2) > 7u)
    {
      v45 = 0;
      goto LABEL_62;
    }
    v46 = (unsigned __int16)(v41 - 2);
    v53 = &unk_199B9AE98;
    goto LABEL_61;
  }
  if (v39 == 65749)
  {
    v45 = 6;
    goto LABEL_62;
  }
  if (v39 != 65938)
    goto LABEL_56;
  v45 = 3;
  if (v41 != 2 && v41 != 9)
  {
    v47 = v41 == 1 || v41 == 10;
    v48 = 4;
    v49 = 2;
    goto LABEL_37;
  }
LABEL_62:

  v54 = objc_msgSend(v8, "cplType");
  objc_msgSend(v8, "asset");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPrimaryResourceDataStore _cplResourceIfDownloadIsAvailableForResource:asset:options:](self, "_cplResourceIfDownloadIsAvailableForResource:asset:options:", v8, v55, v9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = v9;
  if (!v56 || (v45 & 3) != 0)
  {
    if (objc_msgSend(v8, "recipeID") == 327689)
    {
      v68 = objc_msgSend(v9, "isNetworkAccessAllowed");
      PLImageManagerGetLog();
      v69 = objc_claimAutoreleasedReturnValue();
      v70 = v69;
      if ((v68 & 1) == 0)
      {
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v9, "taskIdentifier");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v92;
          _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_DEBUG, "[RM][CCSS] %{public}@ network access permission needed to download computesync resource", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 6, 0);
        v67 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, id, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, v67, 0, 0, 0);
        goto LABEL_89;
      }
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "taskIdentifier");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v71;
        _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_DEFAULT, "[RM][CCSS]: %{public}@ downloading computesync resource", buf, 0xCu);

      }
      v176 = v56;

      objc_msgSend(v9, "taskIdentifier");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v72)
      {
        objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTaskIdentifier:", v72);
      }
      v65 = -[PLPrimaryResourceDataStore _newProgressForTaskWithIdentifier:type:](self, "_newProgressForTaskWithIdentifier:type:", v72, 1);
      os_unfair_lock_lock(&self->_lock);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "setObject:forKeyedSubscript:", v65, v72);
      os_unfair_lock_unlock(&self->_lock);
      objc_msgSend(v8, "photoLibrary");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "libraryServicesManager");
      v74 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectID");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPrimaryResourceDataStore _cplManager](self, "_cplManager");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asset");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "scopedIdentifier");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v235 = v77;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v235, 1);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v208[0] = MEMORY[0x1E0C809B0];
      v208[1] = 3221225472;
      v208[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_84;
      v208[3] = &unk_1E36603D8;
      v208[4] = self;
      v209 = v72;
      v211 = v75;
      v212 = v10;
      v210 = v74;
      v79 = v75;
      v80 = v74;
      v67 = v72;
      objc_msgSend(v169, "fetchComputeStatesForRecordsWithScopedIdentifiers:onDemand:completionHandler:", v78, 1, v208);

    }
    else
    {
      v174 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v10;
      v176 = v56;
      switch(v45)
      {
        case 0:
          if (objc_msgSend(v8, "recipeID"))
          {
            +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", objc_msgSend(v8, "recipeID"));
            v90 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v90 = 0;
          }
          PLBackendGetLog();
          v139 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            v167 = (void *)MEMORY[0x1E0CB3940];
            v172 = v54;
            objc_msgSend(v8, "asset");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "uuid");
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "description");
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "asset");
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            v144 = objc_msgSend(v143, "deferredProcessingNeeded");
            if (v144 > 0xB)
              v145 = 0;
            else
              v145 = off_1E3663E30[v144];
            v146 = v145;
            v147 = objc_msgSend(v8, "localAvailabilityTarget");
            v148 = CFSTR("N");
            if (v147 > 0)
              v148 = CFSTR("Y");
            objc_msgSend(v167, "stringWithFormat:", CFSTR("Unable to download or generate resource for asset: %@, recipe: %@, deferred processing: %@ local availability targeted: %@"), v141, v142, v146, v148);
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v149;
            _os_log_impl(&dword_199541000, v139, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            v54 = v172;
          }

          v150 = (void *)MEMORY[0x1E0CB35C8];
          v168 = *MEMORY[0x1E0D74600];
          v233 = *MEMORY[0x1E0CB2D50];
          v151 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "asset");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v152, "uuid");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "description");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "asset");
          v155 = (void *)objc_claimAutoreleasedReturnValue();
          v156 = objc_msgSend(v155, "deferredProcessingNeeded");
          v173 = v152;
          if (v156 > 0xB)
            v157 = 0;
          else
            v157 = off_1E3663E30[v156];
          v158 = v157;
          v159 = objc_msgSend(v8, "localAvailabilityTarget");
          v160 = CFSTR("N");
          if (v159 > 0)
            v160 = CFSTR("Y");
          objc_msgSend(v151, "stringWithFormat:", CFSTR("Unable to download or generate resource for asset: %@, recipe: %@, deferred processing: %@ local availability targeted: %@"), v153, v154, v158, v160);
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          v234 = v161;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v234, &v233, 1);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "errorWithDomain:code:userInfo:", v168, 4, v162);
          v67 = (id)objc_claimAutoreleasedReturnValue();

          v10 = v174;
          ((void (**)(_QWORD, id, _QWORD, uint64_t, _QWORD))v174)[2](v174, v67, 0, v54, 0);
          goto LABEL_127;
        case 1:
        case 2:
          objc_msgSend(v8, "asset");
          v67 = (id)objc_claimAutoreleasedReturnValue();
          v170 = objc_msgSend(v8, "version");
          objc_msgSend(v67, "uuidDescription");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          PLImageManagerGetLog();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v177, "taskIdentifier");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = CFSTR("N");
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v83;
            v237 = 2114;
            if (v45 == 2)
              v84 = CFSTR("Y");
            v238 = v81;
            v239 = 2114;
            v240 = v84;
            _os_log_impl(&dword_199541000, v82, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ finalizing deferred asset %{public}@, with deferred adjustment: %{public}@", buf, 0x20u);

          }
          objc_msgSend(v67, "objectID");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "photoLibrary");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "libraryServicesManager");
          v87 = (void *)objc_claimAutoreleasedReturnValue();

          v198[0] = MEMORY[0x1E0C809B0];
          v198[1] = 3221225472;
          v198[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_99;
          v198[3] = &unk_1E3660428;
          v199 = v87;
          v200 = v85;
          v204 = v174;
          v205 = v54;
          v206 = v45;
          v201 = v177;
          v202 = self;
          v207 = v170;
          v203 = v81;
          v88 = v81;
          v89 = v85;
          v90 = v87;
          -[PLPrimaryResourceDataStore _finalizeDeferredResource:asset:options:completionHandler:](self, "_finalizeDeferredResource:asset:options:completionHandler:", v8, v67, v201, v198);
          v65 = (id)objc_claimAutoreleasedReturnValue();

          v10 = v174;
          goto LABEL_128;
        case 3:
          goto LABEL_96;
        case 4:
          PLImageManagerGetLog();
          v93 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "taskIdentifier");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "asset");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "uuid");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v94;
            v237 = 2114;
            v238 = v96;
            _os_log_impl(&dword_199541000, v93, OS_LOG_TYPE_DEFAULT, "[RM] %{public}@ Unable to download, attempting optimistic adjustment rendering for asset %{public}@", buf, 0x16u);

          }
LABEL_96:
          objc_msgSend(v8, "asset");
          v67 = (id)objc_claimAutoreleasedReturnValue();
          PLImageManagerGetLog();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "taskIdentifier");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "uuid");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v98;
            v237 = 2112;
            v238 = v99;
            _os_log_impl(&dword_199541000, v97, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Generating deferred adjustment for asset %@", buf, 0x16u);

          }
          objc_msgSend(v9, "taskIdentifier");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = 0;
          v101 = +[PLPrimaryResourceDataStore bailOutOfVideoFinalizationForAsset:taskIdentifier:error:](PLPrimaryResourceDataStore, "bailOutOfVideoFinalizationForAsset:taskIdentifier:error:", v67, v100, &v197);
          v171 = (const __CFString *)v197;

          if (v101)
          {
            v166 = objc_msgSend(v8, "version");
            objc_msgSend(v9, "downloadOptions");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = objc_msgSend(v102, "priority");

            v165 = (unint64_t)(v103 - 1) < 2;
            v104 = (void *)MEMORY[0x1E0CB3940];
            v105 = CFSTR("undefined");
            if (v45 == 3)
              v105 = CFSTR("generate adjusted");
            if (v45 == 4)
              v105 = CFSTR("none but try generate adjusted anyway");
            v106 = v105;
            objc_msgSend(v9, "taskIdentifier");
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "stringWithFormat:", CFSTR("Deferred adjustment resource generation (%@) for image manager request %@, allow cancellation = %d (transfer priority = %tu)"), v106, v107, (unint64_t)(v103 - 1) < 2, v103);
            v164 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v67, "objectID");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "photoLibrary");
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "libraryServicesManager");
            v110 = (void *)objc_claimAutoreleasedReturnValue();

            -[PLPrimaryResourceDataStore _imageConversionServiceClient](self, "_imageConversionServiceClient");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLPrimaryResourceDataStore _videoConversionServiceClient](self, "_videoConversionServiceClient");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v187[0] = MEMORY[0x1E0C809B0];
            v187[1] = 3221225472;
            v187[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_106;
            v187[3] = &unk_1E36604A0;
            v188 = v110;
            v189 = v108;
            v190 = self;
            v194 = v54;
            v196 = v166;
            v193 = v174;
            v195 = v45;
            v67 = v67;
            v191 = v67;
            v192 = v177;
            v113 = v108;
            v114 = v110;
            objc_msgSend(v67, "generateDeferredAdjustmentWithImageConversionClient:videoConversionClient:reason:allowCancellationByService:completion:", v111, v112, v164, v165, v187);
            v65 = (id)objc_claimAutoreleasedReturnValue();

            v10 = v174;
            v90 = (id)v171;
          }
          else
          {
            PLImageManagerGetLog();
            v115 = objc_claimAutoreleasedReturnValue();
            v90 = (id)v171;
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v9, "taskIdentifier");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "uuid");
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v116;
              v237 = 2112;
              v238 = v117;
              v239 = 2112;
              v240 = v171;
              _os_log_impl(&dword_199541000, v115, OS_LOG_TYPE_ERROR, "[RM]: %{public}@ Error bailing out of video finalization for asset %@: %@", buf, 0x20u);

            }
            v10 = v174;
            ((void (**)(_QWORD, const __CFString *, _QWORD, uint64_t, _QWORD))v174)[2](v174, v171, 0, v54, 0);
LABEL_127:
            v65 = 0;
          }
LABEL_128:

          break;
        case 5:
          v118 = objc_msgSend(v8, "recipeID");
          objc_msgSend(v8, "asset");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          PLImageManagerGetLog();
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v177, "taskIdentifier");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "uuid");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v121;
            v237 = 2114;
            v238 = v122;
            _os_log_impl(&dword_199541000, v120, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Generating missing derivatives for asset %{public}@", buf, 0x16u);

          }
          v67 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v177, "taskIdentifier");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setObject:forKeyedSubscript:", v123, *MEMORY[0x1E0D47CB8]);

          -[PLPrimaryResourceDataStore _imageConversionServiceClient](self, "_imageConversionServiceClient");
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPrimaryResourceDataStore _videoConversionServiceClient](self, "_videoConversionServiceClient");
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v181[0] = MEMORY[0x1E0C809B0];
          v181[1] = 3221225472;
          v181[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_116;
          v181[3] = &unk_1E36604C8;
          v186 = v118;
          v182 = v119;
          v184 = v174;
          v185 = v54;
          v183 = v8;
          v90 = v119;
          v10 = v174;
          +[PLResourceGenerator generateAndStoreMissingExpectedLocalResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:reason:completion:](PLResourceGenerator, "generateAndStoreMissingExpectedLocalResourcesForAsset:versions:imageConversionClient:videoConversionClient:conversionServiceOptions:reason:completion:", v90, &unk_1E37631A0, v124, v125, v67, CFSTR("Resource local availability request"), v181);
          v65 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_128;
        case 6:
          v126 = v10;
          +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", objc_msgSend(v8, "recipeID"));
          v67 = (id)objc_claimAutoreleasedReturnValue();
          PLImageManagerGetLog();
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v9, "taskIdentifier");
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "asset");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "uuid");
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v128;
            v237 = 2114;
            v238 = v130;
            _os_log_impl(&dword_199541000, v127, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Generating image from video for asset %{public}@", buf, 0x16u);

          }
          v131 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v8, "asset");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "pathForLocalVideoKeyFrame");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "fileURLWithPath:", v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "asset");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = objc_msgSend(v9, "isNetworkAccessAllowed");
          objc_msgSend(v9, "clientBundleID");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v178[0] = MEMORY[0x1E0C809B0];
          v178[1] = 3221225472;
          v178[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_123;
          v178[3] = &unk_1E36604F0;
          v179 = v134;
          v180 = v126;
          v138 = v134;
          v10 = v126;
          v90 = v138;
          objc_msgSend(v67, "generateAndStoreForAsset:networkAccessAllowed:clientBundleID:progress:completion:", v135, v136, v137, 0, v178);

          goto LABEL_127;
        default:
          v65 = 0;
          goto LABEL_131;
      }
    }
    v56 = v176;
    goto LABEL_130;
  }
  v57 = objc_msgSend(v9, "isNetworkAccessAllowed");
  PLImageManagerGetLog();
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v57)
  {
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "taskIdentifier");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v91;
      _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_DEBUG, "[RM] %{public}@ network access permission needed to download resource", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 6, 0);
    v67 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, _QWORD, uint64_t, _QWORD))v10 + 2))(v10, v67, 0, v54, 0);
LABEL_89:
    v65 = 0;
    goto LABEL_130;
  }
  v175 = v56;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "taskIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:", v54);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v60;
    v237 = 2112;
    v238 = v61;
    _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ downloading CPL resource type: %@", buf, 0x16u);

  }
  v62 = v10;

  objc_msgSend(v9, "taskIdentifier");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63)
  {
    objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTaskIdentifier:", v63);
  }
  v64 = v9;
  v65 = -[PLPrimaryResourceDataStore _newProgressForTaskWithIdentifier:type:](self, "_newProgressForTaskWithIdentifier:type:", v63, 1);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_makeAvailableProgressByTaskIdentifier, "setObject:forKeyedSubscript:", v65, v63);
  os_unfair_lock_unlock(&self->_lock);
  v66 = MEMORY[0x1E0C809B0];
  v218[0] = MEMORY[0x1E0C809B0];
  v218[1] = 3221225472;
  v218[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_78;
  v218[3] = &unk_1E3660388;
  v219 = v63;
  v220 = self;
  v221 = v62;
  v213[0] = v66;
  v10 = v62;
  v213[1] = 3221225472;
  v213[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_81;
  v213[3] = &unk_1E36603B0;
  v214 = v219;
  v215 = self;
  v216 = v221;
  v217 = v54;
  v67 = v219;
  v56 = v175;
  -[PLPrimaryResourceDataStore _downloadCPLResource:options:taskDidBeginHandler:completionHandler:](self, "_downloadCPLResource:options:taskDidBeginHandler:completionHandler:", v175, v64, v218, v213);

LABEL_130:
LABEL_131:
  v16 = (__CFString *)v65;

  v52 = v16;
  v9 = v177;
LABEL_132:

  return v52;
}

- (id)_expectedFileURLForMasterThumbnailForAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "thumbnailIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D732F0];
    objc_msgSend(v4, "thumbnailIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "thumbnailPathForThumbIdentifier:withPathManager:recipeID:forDelete:", v7, v8, -[PLPrimaryResourceDataStore masterThumbRecipeID](self, "masterThumbRecipeID"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to resolve master thumbnail path for asset %{public}@ due to nil thumbnail identifier", (uint8_t *)&v14, 0xCu);

    }
    v10 = 0;
  }

  return v10;
}

- (id)_masterThumbnailVirtualResourceForAsset:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  PLFileBackedThumbnailVirtualResource *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  float v16;
  uint64_t v17;
  PLValidatedExternalResource *v18;
  void *v19;
  id v20;

  v4 = a3;
  v5 = -[PLPrimaryResourceDataStore masterThumbRecipeID](self, "masterThumbRecipeID");
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLVirtualResource initWithRecipe:forAsset:]([PLFileBackedThumbnailVirtualResource alloc], "initWithRecipe:forAsset:", v6, v4);
  objc_msgSend(v6, "sizeForAssetWidth:height:", objc_msgSend(v4, "width"), objc_msgSend(v4, "height"));
  v9 = v8;
  v11 = v10;
  -[PLVirtualResource setUnorientedWidth:](v7, "setUnorientedWidth:", (uint64_t)v8);
  -[PLVirtualResource setUnorientedHeight:](v7, "setUnorientedHeight:", (uint64_t)v11);
  +[PLUniformTypeIdentifier jpegUniformTypeIdentifier](PLUniformTypeIdentifier, "jpegUniformTypeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLVirtualResource setUniformTypeIdentifier:](v7, "setUniformTypeIdentifier:", v12);

  objc_msgSend(v6, "codecFourCharCodeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLVirtualResource setCodecFourCharCodeName:](v7, "setCodecFourCharCodeName:", v13);

  v14 = objc_msgSend(v4, "width");
  if (objc_msgSend(v4, "height") * v14 < 1)
  {
    LODWORD(v15) = 0;
  }
  else
  {
    v17 = objc_msgSend(v4, "width");
    v16 = v9 * v11;
    *(float *)&v15 = v16 / (float)(objc_msgSend(v4, "height") * v17);
  }
  -[PLVirtualResource setScale:](v7, "setScale:", v15);
  -[PLVirtualResource setDataStore:](v7, "setDataStore:", self);
  v18 = objc_alloc_init(PLValidatedExternalResource);
  -[PLValidatedExternalResource setVersion:](v18, "setVersion:", 3);
  -[PLValidatedExternalResource setRecipeID:](v18, "setRecipeID:", v5);
  -[PLValidatedExternalResource setResourceType:](v18, "setResourceType:", 0);
  -[PLPrimaryResourceDataStore _expectedFileURLForMasterThumbnailForAsset:](self, "_expectedFileURLForMasterThumbnailForAsset:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLValidatedExternalResource setFileURL:](v18, "setFileURL:", v19);

  v20 = -[PLPrimaryResourceDataStoreKey initFromExistingLocationOfExternalResource:asset:]([PLPrimaryResourceDataStoreKey alloc], "initFromExistingLocationOfExternalResource:asset:", v18, v4);
  -[PLVirtualResource setDataStoreKey:](v7, "setDataStoreKey:", v20);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PAVideoConversionServiceClient invalidateAfterPendingRequestCompletion](self->_videoConversionServiceClient, "invalidateAfterPendingRequestCompletion");
  v3.receiver = self;
  v3.super_class = (Class)PLPrimaryResourceDataStore;
  -[PLPrimaryResourceDataStore dealloc](&v3, sel_dealloc);
}

- (PLCloudPhotoLibraryManager)_cplManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (PLIsAssetsd())
  {
    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLResourceDataStore pathManager](self, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleForLibraryURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "libraryServicesManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cloudPhotoLibraryManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (PLCloudPhotoLibraryManager *)v8;
}

- (id)name
{
  return CFSTR("Primary");
}

- (id)descriptionForSubtype:(int64_t)a3
{
  if (!a3)
    return CFSTR("(not set)");
  objc_msgSend(MEMORY[0x1E0D11440], "shortDescriptionForResourceType:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)keyFromKeyStruct:(const void *)a3
{
  return -[PLPrimaryResourceDataStoreKey initWithKeyStruct:]([PLPrimaryResourceDataStoreKey alloc], "initWithKeyStruct:", a3);
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  objc_msgSend(v7, "fileURLForAssetID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v11;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1250, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

  }
  objc_msgSend(v7, "fileURLForAssetID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unsigned int v36;
  int v37;
  id v38;
  int v39;
  id v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "cplType"))
  {
    objc_msgSend(v7, "pathForCPLResourceType:adjusted:", objc_msgSend(v6, "dataStoreSubtype"), objc_msgSend(v6, "version") == 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        v39 = objc_msgSend(v6, "resourceType");
        v37 = objc_msgSend(v6, "version");
        v22 = objc_msgSend(v6, "recipeID");
        objc_msgSend(v6, "dataStore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend((id)objc_opt_class(), "storeClassID");
        v25 = objc_msgSend(v6, "dataStoreSubtype");
        objc_msgSend(v6, "uniformTypeIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "uuid");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110658;
        v42 = v39;
        v43 = 1024;
        v44 = v37;
        v45 = 1024;
        v46 = v22;
        v47 = 1024;
        v48 = v24;
        v49 = 2048;
        v50 = v25;
        v51 = 2112;
        v52 = v26;
        v53 = 2112;
        v54 = v27;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_FAULT, "Unable to build expectedFileURL for resource type: %d, version: %d, recipeID: %d, store: %d, storeSubType: %lld, UTI: %@ on asset uuid: %@", buf, 0x38u);

      }
      v9 = 0;
    }

  }
  else
  {
    objc_msgSend(v7, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isUBF");

    if (v11)
    {
      v38 = objc_alloc(MEMORY[0x1E0D73278]);
      objc_msgSend(v7, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v7, "bundleScope");
      objc_msgSend(v6, "uniformTypeIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "version");
      v16 = objc_msgSend(v6, "resourceType");
      v17 = objc_msgSend(v6, "recipeID");
      objc_msgSend(v7, "originalFilename");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v38, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v12, v36, v14, v15, v16, v17, v18);

      -[PLResourceDataStore pathManager](self, "pathManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "readOnlyUrlWithIdentifier:", v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "uniformTypeIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset preferredFileExtensionForType:](PLManagedAsset, "preferredFileExtensionForType:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_retainAutorelease(v30);
      objc_msgSend(v40, "UTF8String");
      objc_msgSend(v6, "version");
      objc_msgSend(v6, "recipeID");
      objc_msgSend(v6, "resourceType");
      objc_msgSend(v7, "filename");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "directory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pathManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLThumbnailManager masterThumbFilename](PLThumbnailManager, "masterThumbFilename");
      v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v34, "UTF8String");
      PLDCIMURLForResourcePropertiesAndPathManager();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v9;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E20], "set", a3, *(_QWORD *)&a4);
}

- (id)virtualResourcesForAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  PLAdjustmentVirtualResource *v7;
  void *v8;
  PLAdjustmentVirtualResource *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v4, "isDeleted") & 1) == 0
    && ((objc_msgSend(v4, "hasMasterThumb") & 1) != 0 || objc_msgSend(v4, "thumbnailIndex") == -3))
  {
    -[PLPrimaryResourceDataStore _masterThumbnailVirtualResourceForAsset:](self, "_masterThumbnailVirtualResourceForAsset:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  if (objc_msgSend(v4, "hasAdjustments"))
  {
    v7 = [PLAdjustmentVirtualResource alloc];
    objc_msgSend(v4, "pathForAdjustmentFile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLAdjustmentVirtualResource initWithAdjustmentFilePath:forAsset:](v7, "initWithAdjustmentFilePath:forAsset:", v8, v4);

    -[PLVirtualResource setDataStore:](v9, "setDataStore:", self);
    objc_msgSend(v5, "addObject:", v9);

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  id v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalResource"));

  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PLSharedStreamsValidatedExternalResource")) & 1) != 0)
    LOBYTE(v8) = 0;
  else
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PLSyndicationValidatedExternalResource")) ^ 1;

  return v8;
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  PLPrimaryResourceDataStoreReferenceFileKey *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  BOOL v53;
  char v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalResource"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1332, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset"));

LABEL_3:
  objc_msgSend(v13, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v67 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetID");
    v66 = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "cplTypeWithAssetID:");
    objc_msgSend(v12, "uniformTypeIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (v16)
        goto LABEL_6;
    }
    else
    {
      -[PLResourceDataStore guessUTIForExternalResource:forAssetKind:](self, "guessUTIForExternalResource:forAssetKind:", v12, objc_msgSend(v13, "kind"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUniformTypeIdentifier:", v28);

      PLImageManagerGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "uuid");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v70 = v12;
        v71 = 2114;
        v72 = v30;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "[RM] guessed UTI for external resource: %{public}@ for asset uuid: %{public}@", buf, 0x16u);

      }
      if (v16)
      {
LABEL_6:
        v18 = objc_msgSend(v12, "resourceType");
        v19 = (void *)v67;
        if ((objc_msgSend(v14, "assumeNoExistingResources") & 1) == 0)
        {
          v20 = v16;
          if (v18 != 5)
          {
            objc_msgSend(v13, "resourceForCPLType:version:", v16, objc_msgSend(v12, "version"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "resourceType") == 4 && (PLResourceIdentityIsEqual(v12, v21) & 1) == 0)
            {

              objc_msgSend(v12, "setResourceType:", 5);
              v20 = objc_msgSend(v12, "cplTypeWithAssetID:", v66);
              v21 = 0;
            }
            else
            {
              v20 = v16;
            }
            objc_msgSend(v21, "setResourceIdentity:managedObjectContext:", v12, v15);
            if (v21)
            {
LABEL_26:
              v65 = v15;
              v32 = v14;
              objc_msgSend(v12, "fileURL");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
              {
                objc_msgSend(v12, "fileURL");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "path");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v19, "fileExistsAtPath:", v35);

              }
              else
              {
                v36 = 0;
              }
              if (objc_msgSend(v21, "isInserted"))
              {
                objc_msgSend(v21, "setDataStoreClassID:", 0);
                if (v16)
                  objc_msgSend(v21, "setDataStoreSubtype:", v20);
              }
              objc_msgSend(v12, "codecFourCharCode");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v14 = v32;
              if (v37)
              {
                objc_msgSend(v12, "codecFourCharCode");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setCodecFourCharCodeName:", v38);

              }
              objc_msgSend(v21, "setUnorientedWidth:", objc_msgSend(v12, "unorientedWidth"));
              objc_msgSend(v21, "setUnorientedHeight:", objc_msgSend(v12, "unorientedHeight"));
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v64 = v36;
                v39 = v12;
                objc_msgSend(v21, "setRemoteAvailability:", objc_msgSend(v39, "remoteAvailability"));
                objc_msgSend(v21, "fingerprint");
                v40 = objc_claimAutoreleasedReturnValue();
                if (v40)
                {
                  v41 = (void *)v40;
                  objc_msgSend(v39, "fingerprint");
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (v42)
                  {
                    v43 = (void *)v42;
                    objc_msgSend(v21, "fingerprint");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "fingerprint");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v44, "isEqualToString:", v45);

                    v19 = (void *)v67;
                    v14 = v32;

                    if ((v46 & 1) == 0)
                      objc_msgSend(v21, "resetPrefetchState");
                  }
                  else
                  {

                  }
                }
                objc_msgSend(v21, "setCloudAttributesWithExternalResource:", v39);

                v36 = v64;
              }
              objc_msgSend(v12, "sidecarIndex");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setSidecarIndex:", v47);

              objc_msgSend(v21, "fileSystemBookmark");
              v48 = (void *)objc_claimAutoreleasedReturnValue();

              if (v48)
              {
                v49 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", objc_msgSend(v12, "resourceType"));
                v15 = v65;
                if (!v49)
                  goto LABEL_50;
LABEL_46:
                objc_msgSend(v21, "dataStoreKey");
                v50 = objc_claimAutoreleasedReturnValue();
                if (v50
                  && (v51 = (void *)v50,
                      objc_msgSend(v21, "dataStoreKey"),
                      v52 = (void *)objc_claimAutoreleasedReturnValue(),
                      v53 = -[PLPrimaryResourceDataStoreKey isEqualToKey:](v49, "isEqualToKey:", v52),
                      v52,
                      v51,
                      !v53))
                {
                  objc_msgSend(v21, "dataStoreKey");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "fileURLForAssetID:", v66);
                  v56 = (void *)objc_claimAutoreleasedReturnValue();

                  -[PLPrimaryResourceDataStoreReferenceFileKey fileURLForAssetID:](v49, "fileURLForAssetID:", v66);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(MEMORY[0x1E0D73208], "fileURL:isEqualToFileURL:", v56, v57) & 1) == 0)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Attempt to overwrite primary store resource with existing key: %@ with new key: %@), on resource: %@.  Store will orphan the previous key."), v56, v57, v21);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    PLSimulateCrash();

                  }
                  v54 = 0;
                  v19 = (void *)v67;
                }
                else
                {
                  v54 = 0;
                }
                goto LABEL_54;
              }
              v15 = v65;
              if (v36)
              {
                v49 = -[PLPrimaryResourceDataStoreKey initFromExistingLocationOfExternalResource:asset:]([PLPrimaryResourceDataStoreKey alloc], "initFromExistingLocationOfExternalResource:asset:", v12, v13);
                if (v49)
                  goto LABEL_46;
              }
              else
              {
                v49 = 0;
              }
LABEL_50:
              v54 = 1;
LABEL_54:
              objc_msgSend(v21, "setDataLength:", objc_msgSend(v12, "dataLength"));
              -[PLPrimaryResourceDataStoreReferenceFileKey keyData](v49, "keyData");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setDataStoreKeyData:", v59);

              if ((int)objc_msgSend(v12, "trashedState") >= 1 && !objc_msgSend(v21, "trashedState"))
              {
                objc_msgSend(v21, "setTrashedState:", objc_msgSend(v12, "trashedState"));
                objc_msgSend(v12, "trashedDate");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setTrashedDate:", v60);

              }
              if ((v54 & 1) != 0)
              {
                objc_msgSend(v21, "setLocalAvailability:", 0xFFFFFFFFLL);
              }
              else
              {
                objc_msgSend(v21, "setLocalAvailability:", 1);
                objc_msgSend(v21, "setLocalAvailabilityTarget:", 0);
              }
              v27 = v21 != 0;
              if (a7 && v21)
                *a7 = objc_retainAutorelease(v21);

              v26 = v66;
              goto LABEL_64;
            }
          }
LABEL_25:
          objc_msgSend(v13, "fetchOrCreateResourceWithIdentity:", v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        }
        goto LABEL_19;
      }
    }
    v19 = (void *)v67;
    if (!objc_msgSend(v14, "assumeNoExistingResources"))
    {
      v20 = 0;
      goto LABEL_25;
    }
LABEL_19:
    objc_msgSend(v13, "objectID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLInternalResource insertResourceForAssetObjectID:resourceIdentity:inManagedObjectContext:](PLInternalResource, "insertResourceForAssetObjectID:resourceIdentity:inManagedObjectContext:", v31, v12, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v16;
    if (v21)
      goto LABEL_26;
    goto LABEL_25;
  }
  PLBackendGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v70 = v23;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "asset %{public}@ managed object context is nil, cannot complete storing external resource", buf, 0xCu);

  }
  v24 = (void *)MEMORY[0x1E0CB35C8];
  v25 = *MEMORY[0x1E0D74498];
  v73 = *MEMORY[0x1E0CB2938];
  v74[0] = CFSTR("asset managed object context is nil");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 47001, v19);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    v26 = objc_retainAutorelease(v26);
    v27 = 0;
    *a6 = v26;
  }
  else
  {
    v27 = 0;
  }
LABEL_64:

  return v27;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  int v8;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  PLPrimaryResourceDataStore *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  void (**v37)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSObject *v38;
  os_signpost_id_t v39;
  id v40;
  uint64_t v41;
  __CFString *v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  id v46;
  uint64_t v47;
  _QWORD v48[2];

  v8 = a3;
  v48[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (v11)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1510, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resource"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  objc_msgSend(v11, "dataStore");
  v15 = (PLPrimaryResourceDataStore *)objc_claimAutoreleasedReturnValue();

  if (v15 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPrimaryResourceDataStore.m"), 1512, CFSTR("resource does not belong to this data store."));

  }
  if (v8 == -1)
  {
    v40 = 0;
    objc_msgSend(v11, "purgeIfPossibleReturningError:", &v40);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v40;
    ((void (**)(_QWORD, id, _QWORD, void *))v14)[2](v14, v19, 0, v20);

LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  if (v8 == -32768)
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = CFSTR("Setting availability to not possible by request is not permitted");
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48[0] = CFSTR("Setting availability to not possible by request is not permitted");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 4, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id, _QWORD, _QWORD))v14)[2](v14, v19, 0, 0);
    goto LABEL_19;
  }
  if (v8 < 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid local availability value requested: %ld"), v8);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v28;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v30 = (void *)MEMORY[0x1E0CB35C8];
    v41 = *MEMORY[0x1E0CB2D50];
    v42 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74600], 4, v31);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id, _QWORD, _QWORD))v14)[2](v14, v19, 0, 0);
    goto LABEL_19;
  }
  +[PLResourceRecipe recipeFromID:](PLResourceRecipe, "recipeFromID:", objc_msgSend(v11, "recipeID"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  PLImageManagerGetLog();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = os_signpost_id_generate(v21);

  v23 = v21;
  v24 = v23;
  if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    objc_msgSend(v12, "taskIdentifier");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v44 = v25;
    v45 = 2114;
    v46 = v19;
    _os_signpost_emit_with_name_impl(&dword_199541000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MakeResourceLocallyAvailable", "taskIdentifier = %{public}@, resource %{public}@", buf, 0x16u);

  }
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3254779904;
  v36[2] = __92__PLPrimaryResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke;
  v36[3] = &unk_1E365EAA8;
  v38 = v24;
  v39 = v22;
  v37 = v14;
  v26 = v24;
  -[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:](self, "_makeResourceLocallyAvailable:options:completion:", v11, v12, v36);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v27;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return a3 != 0;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = v5;
  switch(a4)
  {
    case 0u:
      v7 = objc_msgSend(v5, "isDerivative") ^ 1;
      break;
    case 1u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "recipeID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(&unk_1E37631D0, "containsObject:", v8) & 1) != 0)
      {
        LOBYTE(v7) = 1;
        goto LABEL_10;
      }
      v9 = objc_msgSend(v6, "isDerivative");
      goto LABEL_9;
    case 2u:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v5, "recipeID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(&unk_1E37631B8, "containsObject:", v8);
LABEL_9:
      LOBYTE(v7) = v9 ^ 1;
LABEL_10:

      break;
    case 3u:
      LOBYTE(v7) = 1;
      break;
    default:
      LOBYTE(v7) = 0;
      break;
  }

  return v7;
}

- (BOOL)canStreamResource:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "isInCloud"))
  {
    objc_msgSend(v3, "uniformTypeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "conformsToMovie");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  const __CFString *v31;
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a7;
  v17 = a9;
  v18 = a10;
  v19 = objc_msgSend(a3, "cplType");
  if (v19)
  {
    v20 = v19;
    -[PLPrimaryResourceDataStore _cplManager](self, "_cplManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __135__PLPrimaryResourceDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke;
    v28[3] = &unk_1E3660518;
    v29 = v18;
    v22 = *(_OWORD *)&a6->var0.var3;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0.var0;
    v33 = v22;
    v34 = *(_OWORD *)&a6->var1.var1;
    objc_msgSend(v21, "getStreamingURLForAsset:resourceType:intent:hints:timeRange:clientBundleID:completionHandler:", v15, v20, a5, v16, buf, v17, v28);

    v23 = v29;
  }
  else
  {
    PLBackendGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("Requesting a streaming URL for an unknown CPL type is not supported");
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D74600];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Requesting a streaming URL for an unknown CPL type is not supported");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 4, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v18 + 2))(v18, 0, 0, 0, 0, v23);
  }

}

- (BOOL)canMarkAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PLPrimaryResourceDataStore _videoConversionServiceClient](self, "_videoConversionServiceClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canMarkPendingRequestAsOptionalForProgress:", v4);

  return v6;
}

- (void)markAsynchronousLocalRenderAsOptionalForProgress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLPrimaryResourceDataStore _videoConversionServiceClient](self, "_videoConversionServiceClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markPendingRequestAsOptionalForProgress:", v4);

}

- (BOOL)supportsTimeRange
{
  return 1;
}

- (unsigned)masterThumbRecipeID
{
  unsigned int result;

  result = self->_masterThumbRecipeID;
  if (!result)
  {
    result = objc_msgSend((id)objc_opt_class(), "currentDeviceMasterThumbRecipeID");
    self->_masterThumbRecipeID = result;
  }
  return result;
}

- (void)transitional_reconsiderLocalAvailabilityBasedOnExistingLocationOfCPLResource:(id)a3 givenFilePath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PLPrimaryResourceDataStoreKey *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "fileExistsAtPath:", v5))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "validatedExternalResourceRepresentationUsingFileURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [PLPrimaryResourceDataStoreKey alloc];
    objc_msgSend(v13, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLPrimaryResourceDataStoreKey initFromExistingLocationOfExternalResource:asset:](v9, "initFromExistingLocationOfExternalResource:asset:", v8, v10);

    if (v11)
    {
      objc_msgSend(v11, "keyData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setDataStoreKeyData:", v12);

      objc_msgSend(v13, "setLocalAvailability:", 1);
    }
    else
    {
      objc_msgSend(v13, "markAsNotLocallyAvailable");
    }

  }
  else
  {
    objc_msgSend(v13, "markAsNotLocallyAvailable");
  }

}

- (void)setMasterThumbRecipeID:(unsigned int)a3
{
  self->_masterThumbRecipeID = a3;
}

- (void)setMainScopeKeyHelper:(id)a3
{
  objc_storeStrong((id *)&self->_mainScopeKeyHelper, a3);
}

- (void)setKeyHelperByBundleScope:(id)a3
{
  objc_storeStrong((id *)&self->_keyHelperByBundleScope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyHelperByBundleScope, 0);
  objc_storeStrong((id *)&self->_mainScopeKeyHelper, 0);
  objc_storeStrong((id *)&self->_videoConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_imageConversionServiceClient, 0);
  objc_storeStrong((id *)&self->_deferredPhotoFinalizer, 0);
  objc_storeStrong((id *)&self->_lock_makeAvailableProgressByTaskIdentifier, 0);
}

uint64_t __135__PLPrimaryResourceDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__PLPrimaryResourceDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];

  v7 = a2;
  v8 = a5;
  v9 = *(id *)(a1 + 40);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v11, "MakeResourceLocallyAvailable", ", v12, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    PLResourceIdentityShortDescription(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "[RM]: Data store was wrong, resource %{public}@ was not available, fixing...", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "markAsNotLocallyAvailable");
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_75(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLResourceIdentityShortDescription(*(void **)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "[RM] %@ Resource is locally available but not in hints, resource: %{public}@, asset: %{public}@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recalculateImageRequestHints");

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_76(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(a1[4], "taskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    PLResourceIdentityShortDescription(a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "[RM] %@ Resource local availability was not local but file exists at expected path, resource: %{public}@, asset %{public}@, path: %@", (uint8_t *)&v10, 0x2Au);

  }
  v8 = a1[5];
  objc_msgSend(a1[6], "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markAsLocallyAvailableWithFilePath:", v9);

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_78(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  os_unfair_lock_s *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if (!v6)
    v6 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  v8 = *(id **)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v8[2], "setObject:forKeyedSubscript:", 0, v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
    PLImageManagerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v7, "code");
      objc_msgSend(v7, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v6;
      v21 = 2112;
      v22 = v7;
      v23 = 2048;
      v24 = v10;
      v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Download failed on begin with error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v12 = objc_msgSend(v8, "_lock_taskIsPendingDownloadWithIdentifier:", v6);
    v13 = *(os_unfair_lock_s **)(a1 + 40);
    if (v12)
    {
      -[os_unfair_lock_s _lock_transitionTaskToInflightWithIdentifier:](v13, "_lock_transitionTaskToInflightWithIdentifier:", v6);
      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
      PLImageManagerGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v6;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download began", buf, 0xCu);
      }

    }
    else
    {
      os_unfair_lock_unlock(v13 + 6);
      PLImageManagerGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v6;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download began but has been cancelled, cancelling now", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "_cplManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_79;
      v17[3] = &unk_1E3660360;
      v18 = v6;
      objc_msgSend(v16, "cancelResourceTransferTaskWithIdentifier:completion:", v18, v17);

    }
  }

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_81(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10 = a5;
  if (!v8)
    v8 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, v8);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 24));
  if (v10)
  {
    objc_msgSend(v10, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == 3072)
      {
        PLImageManagerGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v16 = 138543362;
          v17 = v8;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download was cancelled", (uint8_t *)&v16, 0xCu);
        }
        goto LABEL_14;
      }
    }
    else
    {

    }
    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v10, "code");
      objc_msgSend(v10, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138544130;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      v20 = 2048;
      v21 = v14;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Download failed with error: %@, code: %ld, domain: %{public}@", (uint8_t *)&v16, 0x2Au);

    }
  }
  else
  {
    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v16 = 138543362;
      v17 = v8;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download complete", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_14:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL4 v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  _BYTE *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _BYTE *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  _BYTE buf[24];
  uint64_t (*v38)(uint64_t, uint64_t);
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 3072)
      {
        PLImageManagerGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v10 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "[RM][CCSS]: %{public}@ Computesync download was cancelled", buf, 0xCu);
        }
LABEL_16:

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        goto LABEL_17;
      }
    }
    else
    {

    }
    PLImageManagerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = objc_msgSend(v6, "code");
      objc_msgSend(v6, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2048;
      v38 = (uint64_t (*)(uint64_t, uint64_t))v22;
      LOWORD(v39) = 2114;
      *(_QWORD *)((char *)&v39 + 2) = v23;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[RM][CCSS]: %{public}@ Computesync download failed with error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

    }
    goto LABEL_16;
  }
  v11 = objc_msgSend(v5, "count") == 1;
  PLImageManagerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[RM][CCSS]: %{public}@ Computesync download failed with no error", buf, 0xCu);
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "[RM][CCSS]: %{public}@ Computesync download complete", buf, 0xCu);
  }

  objc_msgSend(v5, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v38 = __Block_byref_object_copy__2082;
  *(_QWORD *)&v39 = __Block_byref_object_dispose__2083;
  *((_QWORD *)&v39 + 1) = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__2082;
  v35[4] = __Block_byref_object_dispose__2083;
  v36 = 0;
  objc_msgSend(*(id *)(a1 + 48), "databaseContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "newShortLivedCplLibraryWithNameSuffix:", "-[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:]_block_invoke");

  v18 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2;
  v29[3] = &unk_1E366F518;
  v19 = v17;
  v30 = v19;
  v31 = *(id *)(a1 + 56);
  v20 = v15;
  v32 = v20;
  v33 = buf;
  v34 = v35;
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_90;
  v25[3] = &unk_1E3674CE0;
  v27 = v35;
  v26 = *(id *)(a1 + 64);
  v28 = buf;
  objc_msgSend(v19, "performTransactionAndWait:completionHandler:", v29, v25);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(buf, 8);

LABEL_17:
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  _BYTE *v22;
  __int128 v23;
  int v24;
  _BYTE buf[24];
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    PLImageManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "taskIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v26 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "[RM] %{public}@ deferred finalization failed for asset %{public}@ with error: %@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "databaseContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newShortLivedLibraryWithName:", "-[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:]_block_invoke");

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v26 = __Block_byref_object_copy__2082;
    v27 = __Block_byref_object_dispose__2083;
    v28 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_100;
    v15[3] = &unk_1E3660400;
    v12 = v11;
    v16 = v12;
    v17 = *(id *)(a1 + 40);
    v18 = v5;
    v21 = *(id *)(a1 + 72);
    v23 = *(_OWORD *)(a1 + 80);
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    v19 = v13;
    v20 = v14;
    v24 = *(_DWORD *)(a1 + 96);
    v22 = buf;
    objc_msgSend(v12, "performBlockAndWait:", v15);

    _Block_object_dispose(buf, 8);
  }

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_106(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;
  int v31;
  _QWORD v32[5];
  void *v33;

  v5 = a3;
  if (a2)
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__2082;
    v32[4] = __Block_byref_object_dispose__2083;
    v33 = 0;
    objc_msgSend(*(id *)(a1 + 32), "databaseContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "-[PLPrimaryResourceDataStore _makeResourceLocallyAvailable:options:completion:]_block_invoke");

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_107;
    v24[3] = &unk_1E3660450;
    v8 = v7;
    v25 = v8;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v26 = v9;
    v27 = v10;
    v12 = *(void **)(a1 + 72);
    v11 = *(_QWORD *)(a1 + 80);
    v29 = v32;
    v30 = v11;
    v31 = *(_DWORD *)(a1 + 96);
    v28 = v12;
    objc_msgSend(v8, "performBlockAndWait:", v24);

    _Block_object_dispose(v32, 8);
    v13 = v33;
  }
  else
  {
    if (!PLIsErrorEqualToCode() || *(_QWORD *)(a1 + 88) != 3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 56), "photoLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_108;
    v17[3] = &unk_1E3660478;
    v15 = *(id *)(a1 + 56);
    v22 = *(_QWORD *)(a1 + 80);
    v23 = *(_DWORD *)(a1 + 96);
    v16 = *(_QWORD *)(a1 + 48);
    v18 = v15;
    v19 = v16;
    v20 = *(id *)(a1 + 64);
    v21 = *(id *)(a1 + 72);
    objc_msgSend(v14, "performBlock:", v17);

    v13 = v18;
  }

LABEL_8:
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
    goto LABEL_10;
  v9 = v7;
  v10 = 0;
  v11 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v37 != v11)
        objc_enumerationMutation(v6);
      v10 |= objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "recipeID") == *(_DWORD *)(a1 + 64);
    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  }
  while (v9);
  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_117;
    v32[3] = &unk_1E3674C40;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v34 = v14;
    v35 = v15;
    v33 = *(id *)(a1 + 40);
    objc_msgSend(v13, "performBlock:", v32);

    v16 = v34;
  }
  else
  {
LABEL_10:
    objc_msgSend(v5, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      PLBackendGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(*(id *)(a1 + 40), "debugDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("Unable to generate missing resource: %@"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v43 = v20;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D74600];
      v40 = *MEMORY[0x1E0CB2D50];
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "debugDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Unable to generate missing resource: %@"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 4, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v27 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD))(v27 + 16))(v27, v28, 0, *(_QWORD *)(a1 + 56), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_120;
  v30[3] = &unk_1E3677AA0;
  v31 = *(id *)(a1 + 32);
  objc_msgSend(v29, "performTransaction:", v30);

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_123(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v10;
  if (objc_msgSend(v7, "hasChanges"))
  {
    v16 = 0;
    v12 = objc_msgSend(v7, "save:", &v16);
    v13 = v16;
    v11 = v10;
    if ((v12 & 1) == 0)
    {
      PLImageManagerGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to save moc with error: %@", buf, 0xCu);
      }

      v11 = v10;
      if (!v10)
        v11 = v13;
    }

  }
  if (objc_msgSend(v9, "count"))
    v15 = *(_QWORD *)(a1 + 32);
  else
    v15 = 0;
  (*(void (**)(_QWORD, id, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, 0, 0, v15);

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_117(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, uint64_t, id))(v2 + 16))(v2, 0, 0, v1, v3);

}

uint64_t __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_120(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDeferredProcessingNeeded:", 0);
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_107(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v14 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "getClosestResourceMatchingCPLResourceType:version:asset:", *(_QWORD *)(a1 + 72), *(unsigned int *)(a1 + 80), v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(NSObject **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    if (!v5)
      goto LABEL_4;
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }
  }

LABEL_4:
  v9 = *(_QWORD *)(a1 + 56);
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "dataLength");
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, void *))(v9 + 16))(v9, 0, v10, v11, v12);

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_108(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resourceForCPLType:version:", *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "_makeResourceLocallyAvailable:options:completion:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2_100(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  const __CFString *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v34 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v34);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v34;

  if (v4)
  {
    if (objc_msgSend(v4, "deferredProcessingNeeded") == 2)
    {
      v6 = *(_QWORD *)(a1 + 48);
      v33 = 0;
      v7 = +[PLPrimaryResourceDataStore bailOutOfVideoFinalizationForAsset:taskIdentifier:error:](PLPrimaryResourceDataStore, "bailOutOfVideoFinalizationForAsset:taskIdentifier:error:", v4, v6, &v33);
      v8 = v33;
      PLImageManagerGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v7)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v11 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v4, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v36 = v11;
          v37 = 2112;
          v38 = v12;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ requesting adjustment render for asset: %@", buf, 0x16u);

        }
        v13 = (void *)MEMORY[0x1E0CB3940];
        v14 = *(_QWORD *)(a1 + 96);
        if (v14 > 6)
          v15 = CFSTR("undefined");
        else
          v15 = off_1E3660568[v14];
        objc_msgSend(*(id *)(a1 + 56), "taskIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("Deferred adjustment resource generation (%@) for image manager request %@"), v15, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = *(void **)(a1 + 64);
        objc_msgSend(v29, "_imageConversionServiceClient");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 64), "_videoConversionServiceClient");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v32) = *(_DWORD *)(a1 + 104);
        objc_msgSend(v29, "generateDeferredAdjustmentForAsset:imageConversionServiceClient:videoConversionServiceClient:reason:taskIdentifier:cplResourceType:version:completion:", v4, v30, v31, v28, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 88), v32, *(_QWORD *)(a1 + 72));

      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v25 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v4, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v36 = v25;
          v37 = 2114;
          v38 = v26;
          v39 = 2112;
          v40 = v8;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "[RM] %{public}@ Error bailing out of video finalization for asset with uuid %{public}@: %@", buf, 0x20u);

        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      }

    }
    else
    {
      objc_msgSend(v4, "resourceForCPLType:version:", *(_QWORD *)(a1 + 88), *(unsigned int *)(a1 + 104));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      v21 = *(_QWORD *)(a1 + 72);
      v22 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "dataLength");
      v23 = *(_QWORD *)(a1 + 88);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "fileURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, void *))(v21 + 16))(v21, 0, v22, v23, v24);

    }
  }
  else if (v5)
  {
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v36 = v17;
      v37 = 2112;
      v38 = v5;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString **v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  const __CFString *v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  NSObject *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v3)
  {
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v9 = objc_msgSend(v4, "copyComputeSyncResourceFromCPLFilePath:error:", v8, &v43);
    v10 = v43;

    if (v9)
    {
      objc_msgSend(v4, "updateComputeSyncResourceAfterDownloadWithResource:onDemandDownload:", v3, 1);
      v11 = *(_QWORD *)(a1 + 48);
      v42 = 0;
      v12 = objc_msgSend(v4, "applyComputeSyncPayloadWithComputeStateRecord:originatedFromPrefetch:error:", v11, 0, &v42);
      v13 = v42;
      PLImageManagerGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v12)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v16 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v4, "scopedIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v49 = v16;
          v50 = 2114;
          v51 = v17;
          v18 = "[CCSS] Applied compute sync record %@ to asset %{public}@ using payload helper";
          v19 = v15;
          v20 = OS_LOG_TYPE_INFO;
          v21 = 22;
LABEL_19:
          _os_log_impl(&dword_199541000, v19, v20, v18, buf, v21);

        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v38 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v4, "scopedIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v49 = v38;
        v50 = 2114;
        v51 = v17;
        v52 = 2112;
        v53 = v13;
        v18 = "[CCSS] Failed to apply compute sync record %@ to asset %{public}@ using payload helper error: %@";
        v19 = v15;
        v20 = OS_LOG_TYPE_ERROR;
        v21 = 32;
        goto LABEL_19;
      }

      objc_msgSend(v3, "fileURL");
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v41 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = v39;

      goto LABEL_21;
    }
    PLImageManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v32 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v4, "scopedIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v49 = v32;
      v50 = 2114;
      v51 = v33;
      v52 = 2112;
      v53 = v10;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "[CCSS] Failed to copy compute sync record %@ to asset %{public}@ using payload helper error: %@", buf, 0x20u);

    }
  }
  else
  {

    PLImageManagerGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v23)
      {
        v24 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v4, "scopedIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *(NSObject **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v49 = v24;
        v50 = 2114;
        v51 = v25;
        v52 = 2114;
        v53 = v26;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "[CCSS] No compute sync wrapper resource found %@ for asset: %{public}@, resource: %{public}@", buf, 0x20u);

      }
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0D74498];
      v44 = *MEMORY[0x1E0CB2938];
      v45 = CFSTR("Unable to find resource");
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = &v45;
      v31 = &v44;
    }
    else
    {
      if (v23)
      {
        v34 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v4, "scopedIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v49 = v34;
        v50 = 2114;
        v51 = v35;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "[CCSS] ComputeStateRecord contains nil fileURL unexpectedly %@ for asset %{public}@", buf, 0x16u);

      }
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0D74498];
      v46 = *MEMORY[0x1E0CB2938];
      v47 = CFSTR("Fetched ComputeStateRecord with nil fileURL");
      v29 = (void *)MEMORY[0x1E0C99D80];
      v30 = &v47;
      v31 = &v46;
    }
    objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, 47013, v10);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v13 = *(NSObject **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;
  }
LABEL_21:

}

uint64_t __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40);
  if (v4)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, v4, 0, 0, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, 0, 0, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __79__PLPrimaryResourceDataStore__makeResourceLocallyAvailable_options_completion___block_invoke_79(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Cancel callback, cancel succeeded: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __75__PLPrimaryResourceDataStore__cancelAvailabilityRequestWithTaskIdentifier___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLImageManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = CFSTR("NO");
    v6 = *(_QWORD *)(a1 + 32);
    if (a2)
      v5 = CFSTR("YES");
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Cancel callback, cancel succeeded: %@", (uint8_t *)&v7, 0x16u);
  }

}

void __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "dataHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataHandler");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v7);

  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, _QWORD, _QWORD, id))(v11 + 16))(v11, v12, 0, 0, v8);

}

void __97__PLPrimaryResourceDataStore__downloadCPLResource_options_taskDidBeginHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  PLImageManagerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138543618;
    v9 = v5;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Download progress %f", (uint8_t *)&v8, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v7, "setCompletedUnitCount:", (uint64_t)(float)((float)objc_msgSend(v7, "totalUnitCount") * a3));

}

void __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2082;
  v29[4] = __Block_byref_object_dispose__2083;
  v16 = v12;
  v30 = v16;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke_59;
  v25[3] = &unk_1E3676EA0;
  v17 = v11;
  v26 = v17;
  v18 = v16;
  v27 = v18;
  v28 = v29;
  objc_msgSend(v17, "performBlockAndWait:", v25);
  v19 = *(id *)(a1 + 72);
  v20 = v19;
  v21 = *(_QWORD *)(a1 + 80);
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v21, "GenerateAndStoreDeferredResource", ", buf, 2u);
  }

  PLImageManagerGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v23;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Generate and store completed for asset: %@", buf, 0x16u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 24));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 24));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  _Block_object_dispose(v29, 8);
}

void __88__PLPrimaryResourceDataStore__finalizeDeferredResource_asset_options_completionHandler___block_invoke_59(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v7 = 0;
    v3 = objc_msgSend(v2, "save:", &v7);
    v4 = v7;
    v5 = v7;
    if ((v3 & 1) == 0)
    {
      PLImageManagerGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to save moc with error: %@", buf, 0xCu);
      }

      if (!*(_QWORD *)(a1 + 40))
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v4);
    }

  }
}

void __69__PLPrimaryResourceDataStore__newProgressForTaskWithIdentifier_type___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_cancelAvailabilityRequestWithTaskIdentifier:", *(_QWORD *)(a1 + 32));

}

+ (id)supportedRecipes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PLPrimaryResourceDataStore_supportedRecipes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedRecipes_s_onceToken != -1)
    dispatch_once(&supportedRecipes_s_onceToken, block);
  return (id)supportedRecipes_s_recipes;
}

+ (unsigned)currentDeviceMasterThumbRecipeID
{
  if (currentDeviceMasterThumbRecipeID_s_onceToken != -1)
    dispatch_once(&currentDeviceMasterThumbRecipeID_s_onceToken, &__block_literal_global_184);
  return currentDeviceMasterThumbRecipeID_s_recipeID;
}

void __62__PLPrimaryResourceDataStore_currentDeviceMasterThumbRecipeID__block_invoke()
{
  void *v0;
  int v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "masterThumbnailFormat");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "formatID") == 5005)
    v1 = 272155;
  else
    v1 = 272151;
  currentDeviceMasterThumbRecipeID_s_recipeID = v1;

}

void __46__PLPrimaryResourceDataStore_supportedRecipes__block_invoke(uint64_t a1)
{
  void *v2;
  PLPrimaryResourceDataStoreImageRecipe *v3;
  void *v4;
  PLPrimaryResourceDataStoreImageRecipe *v5;
  PLPrimaryResourceDataStoreVideoRecipe *v6;
  PLPrimaryResourceDataStoreVideoRecipe *v7;
  PLPrimaryResourceDataStoreVideoRecipe *v8;
  PLPrimaryResourceDataStoreVideoRecipe *v9;
  PLPrimaryResourceDataStoreVideoRecipe *v10;
  PLPrimaryResourceDataStoreVideoRecipe *v11;
  PLPrimaryResourceDataStoreVideoRecipe *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  PLPrimaryResourceDataStoreImageRecipe *v16;
  PLPrimaryResourceDataStoreImageRecipe *v17;
  PLPrimaryResourceDataStoreImageRecipe *v18;
  PLPrimaryResourceDataStoreImageRecipe *v19;
  _QWORD v20[12];
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", MEMORY[0x1E0C9AA60]);
  v3 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", objc_msgSend(*(id *)(a1 + 32), "currentDeviceMasterThumbRecipeID"));
  v21[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v19 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", 65737);
  v20[0] = v19;
  v18 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", 65938);
  v20[1] = v18;
  v17 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", 65739);
  v20[2] = v17;
  v16 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", 65741);
  v20[3] = v16;
  v5 = -[PLPrimaryResourceDataStoreImageRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreImageRecipe alloc], "initWithRecipeID:", 65743);
  v20[4] = v5;
  v6 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 0x20000);
  v20[5] = v6;
  v7 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 131075);
  v20[6] = v7;
  v8 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 131079);
  v20[7] = v8;
  v9 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 131081);
  v20[8] = v9;
  v10 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 131277);
  v20[9] = v10;
  v11 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 131275);
  v20[10] = v11;
  v12 = -[PLPrimaryResourceDataStoreVideoRecipe initWithRecipeID:]([PLPrimaryResourceDataStoreVideoRecipe alloc], "initWithRecipeID:", 131272);
  v20[11] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v13);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)supportedRecipes_s_recipes;
  supportedRecipes_s_recipes = v14;

}

- (id)getClosestResourceMatchingCPLResourceType:(unint64_t)a3 version:(unsigned int)a4 asset:(id)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "resourceForCPLType:version:", a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || (int)objc_msgSend(v8, "localAvailability") <= 0)
  {

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "modernResources", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v9 = 0;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v15, "version") == (_DWORD)v5
            && objc_msgSend(v15, "localAvailability") == 1)
          {
            if (!v9 || (v16 = objc_msgSend(v9, "unorientedWidth"), v16 < objc_msgSend(v15, "unorientedWidth")))
            {
              v17 = v15;

              v9 = v17;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)generateDeferredAdjustmentForAsset:(id)a3 imageConversionServiceClient:(id)a4 videoConversionServiceClient:(id)a5 reason:(id)a6 taskIdentifier:(id)a7 cplResourceType:(unint64_t)a8 version:(unsigned int)a9 completion:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  unint64_t v34;
  unsigned int v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a10;
  objc_msgSend(v14, "objectID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "photoLibrary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "libraryServicesManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke;
  v29[3] = &unk_1E366D250;
  v30 = v18;
  v31 = v22;
  v33 = v19;
  v34 = a8;
  v35 = a9;
  v32 = v20;
  v23 = v19;
  v24 = v20;
  v25 = v22;
  v26 = v18;
  v27 = (id)objc_msgSend(v14, "generateDeferredAdjustmentWithImageConversionClient:videoConversionClient:reason:allowCancellationByService:completion:", v15, v16, v17, 0, v29);

}

void __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLImageManagerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "[RM]: %{public}@ Render complete", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "databaseContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLPrimaryResourceDataStore(Finalization) generateDeferredAdjustmentForAsset:imageConversionServiceClient:videoConversionServiceClient:reason:taskIdentifier:cplResourceType:version:completion:]_block_invoke");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke_2;
    v18[3] = &unk_1E366D228;
    v19 = v10;
    v11 = *(id *)(a1 + 48);
    v13 = *(void **)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v20 = v11;
    v22 = v12;
    v23 = *(_DWORD *)(a1 + 72);
    v21 = v13;
    v14 = v10;
    objc_msgSend(v14, "performBlockAndWait:", v18);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = objc_msgSend(v5, "code");
      objc_msgSend(v5, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v15;
      v26 = 2112;
      v27 = v5;
      v28 = 2048;
      v29 = v16;
      v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "[RM]: %{public}@ Render failed with error: %@, code: %ld, domain: %{public}@", buf, 0x2Au);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __194__PLPrimaryResourceDataStore_Finalization__generateDeferredAdjustmentForAsset_imageConversionServiceClient_videoConversionServiceClient_reason_taskIdentifier_cplResourceType_version_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;

  if (v4)
  {
    objc_msgSend(v4, "resourceForCPLType:version:", *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      PLBackendGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v15 = v8;
        v16 = 2112;
        v17 = v5;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Existing object with id %@ no longer found with error %@", buf, 0x16u);
      }

    }
    v6 = 0;
  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = objc_msgSend(v6, "dataLength");
  v11 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, void *))(v9 + 16))(v9, 0, v10, v11, v12);

}

+ (BOOL)bailOutOfVideoFinalizationForAsset:(id)a3 taskIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!objc_msgSend(v7, "videoDeferredProcessingNeeded"))
  {
    v10 = 0;
    v9 = 1;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v21 = 0;
  v9 = objc_msgSend(v7, "promoteProxyToFinalVideoComplementWithOutError:", &v21);
  v10 = v21;
  PLImageManagerGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) != 0)
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    v13 = "[RM]: %{public}@ [FDR] Promoted video complement proxy to final";
    v14 = v12;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 138543618;
    v23 = v8;
    v24 = 2112;
    v25 = v10;
    v13 = "[RM]: %{public}@ [FDR] Error on-demand promoting video complement proxy to final: %@";
    v14 = v12;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 22;
  }
  _os_log_impl(&dword_199541000, v14, v15, v13, buf, v16);
LABEL_10:

  PLSendFRCBailOutAnalytics(v7);
  objc_msgSend(v7, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__PLPrimaryResourceDataStore_Finalization__bailOutOfVideoFinalizationForAsset_taskIdentifier_error___block_invoke;
  v19[3] = &unk_1E3677AA0;
  v20 = v7;
  objc_msgSend(v17, "performTransactionAndWait:", v19);

  if (a5)
LABEL_11:
    *a5 = objc_retainAutorelease(v10);
LABEL_12:

  return v9;
}

uint64_t __100__PLPrimaryResourceDataStore_Finalization__bailOutOfVideoFinalizationForAsset_taskIdentifier_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVideoDeferredProcessingNeeded:", 0);
}

@end
