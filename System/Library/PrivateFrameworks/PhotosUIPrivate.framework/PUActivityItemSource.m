@implementation PUActivityItemSource

- (PUActivityItemSource)initWithAsset:(id)a3 sharingPreferences:(id)a4
{
  int64_t var6;
  uint64_t v5;
  id v8;
  PUActivityItemSource *v9;
  PUActivityItemSource *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *sharingURLs;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *sharingUUID;
  NSMutableSet *v17;
  NSMutableSet *onDemandExports;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *externalIsolation;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_semaphore_t v28;
  OS_dispatch_semaphore *fetchSharingVariantsSemaphore;
  NSObject *v30;
  _QWORD block[4];
  id v33;
  id location;
  _QWORD v35[4];
  NSObject *v36;
  objc_super v37;

  var6 = a4.var6;
  v5 = *(_QWORD *)&a4.var0;
  v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PUActivityItemSource;
  v9 = -[PUActivityItemSource init](&v37, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    *(_QWORD *)&v10->_sharingPreferences.excludeLiveness = v5;
    v10->_sharingPreferences.preferredExportFormat = var6;
    v10->_state = 0;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sharingURLs = v10->_sharingURLs;
    v10->_sharingURLs = v11;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    sharingUUID = v10->_sharingUUID;
    v10->_sharingUUID = (NSString *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    onDemandExports = v10->_onDemandExports;
    v10->_onDemandExports = v17;

    objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
    v19 = objc_claimAutoreleasedReturnValue();
    v10->_signpostId = os_signpost_id_make_with_pointer(v19, v10->_sharingUUID);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = dispatch_queue_create("com.apple.PUActivityItemSource.isolationQueue", v20);
    externalIsolation = v10->_externalIsolation;
    v10->_externalIsolation = (OS_dispatch_queue *)v21;

    v23 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke;
    v35[3] = &unk_1E58ABD10;
    v36 = v20;
    v24 = initWithAsset_sharingPreferences__predicate;
    v25 = v20;
    v26 = v25;
    if (v24 == -1)
    {
      v27 = v25;
    }
    else
    {
      dispatch_once(&initWithAsset_sharingPreferences__predicate, v35);
      v27 = v36;
    }
    v28 = dispatch_semaphore_create(0);
    fetchSharingVariantsSemaphore = v10->_fetchSharingVariantsSemaphore;
    v10->_fetchSharingVariantsSemaphore = (OS_dispatch_semaphore *)v28;

    objc_initWeak(&location, v10);
    v30 = initWithAsset_sharingPreferences___fetchSharingVariantsSerialQueue;
    block[0] = v23;
    block[1] = 3221225472;
    block[2] = __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke_2;
    block[3] = &unk_1E58AB2F8;
    objc_copyWeak(&v33, &location);
    dispatch_async(v30, block);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  return v10;
}

- (NSString)sharingUUID
{
  return self->_sharingUUID;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *sharingUUID;
  objc_super v5;
  uint8_t buf[4];
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[PUActivityItemSource _setExportProgress:](self, "_setExportProgress:", 0);
  if (-[NSMutableDictionary count](self->_sharingURLs, "count"))
  {
    PLShareSheetGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      *(_DWORD *)buf = 138543362;
      v7 = sharingUUID;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Deallocing PUActivityItemSource, but sharing URLs still remain non-empty", buf, 0xCu);
    }

  }
  -[PUActivityItemSource cleanUpExportedFiles](self, "cleanUpExportedFiles");
  v5.receiver = self;
  v5.super_class = (Class)PUActivityItemSource;
  -[PUActivityItemSource dealloc](&v5, sel_dealloc);
}

- (id)_activityOperationQueueForExplicitRunning
{
  if (_activityOperationQueueForExplicitRunning_onceToken != -1)
    dispatch_once(&_activityOperationQueueForExplicitRunning_onceToken, &__block_literal_global_42);
  return (id)_activityOperationQueueForExplicitRunning_activityOperationQueue;
}

- (void)runWithActivityType:(id)a3
{
  void *v4;
  id v5;

  v5 = -[PUActivityItemSource _newOperationForActivityType:](self, "_newOperationForActivityType:", a3);
  -[PUActivityItemSource _activityOperationQueueForExplicitRunning](self, "_activityOperationQueueForExplicitRunning");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOperation:", v5);

}

- (id)_sharingVariants
{
  NSObject *fetchSharingVariantsSemaphore;
  dispatch_time_t v4;
  intptr_t v5;
  OS_dispatch_semaphore *v6;
  NSObject *v7;
  NSString *sharingUUID;
  void *v9;
  int v11;
  NSString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  fetchSharingVariantsSemaphore = self->_fetchSharingVariantsSemaphore;
  if (fetchSharingVariantsSemaphore)
  {
    v4 = dispatch_time(0, 5000000000);
    v5 = dispatch_semaphore_wait(fetchSharingVariantsSemaphore, v4);
    v6 = self->_fetchSharingVariantsSemaphore;
    self->_fetchSharingVariantsSemaphore = 0;

    if (v5)
    {
      PLShareSheetGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        sharingUUID = self->_sharingUUID;
        -[PHAsset uuid](self->_asset, "uuid");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543618;
        v12 = sharingUUID;
        v13 = 2114;
        v14 = v9;
        _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Timed out fetching sharing variants for asset: %{public}@", (uint8_t *)&v11, 0x16u);

      }
    }
  }
  return self->_cachedSharingVariants;
}

- (void)_fetchSharingVariants
{
  PHAsset *asset;
  _BOOL8 shareAsUnmodifiedOriginal;
  NSDictionary *v6;
  id v7;
  NSDictionary *cachedSharingVariants;
  NSObject *v9;
  NSString *sharingUUID;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_fetchSharingVariantsSemaphore)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 287, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_fetchSharingVariantsSemaphore"));

  }
  if (self->_cachedSharingVariants)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_cachedSharingVariants"));

  }
  asset = self->_asset;
  shareAsUnmodifiedOriginal = self->_sharingPreferences.shareAsUnmodifiedOriginal;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CD1410], "variantsForAsset:asUnmodifiedOriginal:error:", asset, shareAsUnmodifiedOriginal, &v16);
  v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  cachedSharingVariants = self->_cachedSharingVariants;
  self->_cachedSharingVariants = v6;

  if (!self->_cachedSharingVariants)
  {
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      -[PHAsset uuid](self->_asset, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = sharingUUID;
      v19 = 2114;
      v20 = v11;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to fetch sharing variants for asset: %{public}@, error: %@", buf, 0x20u);

    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_fetchSharingVariantsSemaphore);
  -[PUActivityItemSource ppt_didFetchSharingVariantsHandler](self, "ppt_didFetchSharingVariantsHandler");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t))(v12 + 16))(v12);

}

- (void)_setExportProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *exportProgress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  exportProgress = self->__exportProgress;
  if (exportProgress != v5)
  {
    v7 = v5;
    -[NSProgress removeObserver:forKeyPath:context:](exportProgress, "removeObserver:forKeyPath:context:", self, CFSTR("fractionCompleted"), &PUActivityItemSourceProgressContext);
    objc_storeStrong((id *)&self->__exportProgress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](self->__exportProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 4, &PUActivityItemSourceProgressContext);
    v5 = v7;
  }

}

- (void)setState:(unint64_t)a3
{
  NSObject *externalIsolation;
  _QWORD v4[6];

  externalIsolation = self->_externalIsolation;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__PUActivityItemSource_setState___block_invoke;
  v4[3] = &unk_1E58AACF0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(externalIsolation, v4);
}

- (void)setSharingPreferences:(id)a3
{
  NSObject *externalIsolation;
  _QWORD block[5];
  $9D9B13A340AA60ED2DD68408BD7D962F v5;

  externalIsolation = self->_externalIsolation;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__PUActivityItemSource_setSharingPreferences___block_invoke;
  block[3] = &unk_1E58A5BB0;
  block[4] = self;
  v5 = a3;
  dispatch_sync(externalIsolation, block);
}

- (void)_resetState
{
  PUActivityItemSourceOperation *currentOperation;
  void *v5;
  void *v6;
  void *v7;

  if (-[NSMutableSet count](self->_onDemandExports, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 346, CFSTR("On-demand exports was not empty when state was reset on activity item source: %@"), self->_sharingUUID);

  }
  if (self->__exportProgress)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 347, CFSTR("Export progress was not nil when state was reset on activity item source: %@"), self->_sharingUUID);

  }
  if (self->__exportProgressHandler)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 348, CFSTR("Export progress handler was not nil when state was reset on activity item source: %@"), self->_sharingUUID);

  }
  -[PUActivityItemSource cleanUpExportedFiles](self, "cleanUpExportedFiles");
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  -[PUActivityItemSource setExportConfiguration:](self, "setExportConfiguration:", 0);
  -[PUActivityItemSource set_pasteboardItemProvider:](self, "set_pasteboardItemProvider:", 0);
  -[PUActivityItemSource _setAssetsLibraryURL:](self, "_setAssetsLibraryURL:", 0);
}

- (void)cancel
{
  NSObject *v4;
  NSString *sharingUUID;
  void *v6;
  void *v7;
  PUActivityItemSourceOperation *currentOperation;
  NSObject *v9;
  NSString *v10;
  PUActivityItemSourceOperation *v11;
  uint64_t v12;
  PUActivityItemSourceAnchorOperation *anchorOperation;
  NSObject *v14;
  NSString *v15;
  PUActivityItemSourceAnchorOperation *v16;
  void *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int v22;
  NSString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 361, CFSTR("expect main thread"));

  }
  PLShareSheetGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    sharingUUID = self->_sharingUUID;
    -[PHAsset uuid](self->_asset, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = sharingUUID;
    v24 = 2114;
    v25 = v6;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cancelling item for asset: %{public}@", (uint8_t *)&v22, 0x16u);

  }
  -[PUActivityItemSource _exportProgress](self, "_exportProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancel");

  currentOperation = self->_currentOperation;
  if (currentOperation)
  {
    -[PUActivityItemSourceOperation pu_cancel](currentOperation, "pu_cancel");
    -[PUActivityItemSourceOperation cancel](self->_currentOperation, "cancel");
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_sharingUUID;
      v11 = self->_currentOperation;
      v22 = 138543618;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cancelling current operation: %@", (uint8_t *)&v22, 0x16u);
    }

    if (-[PUActivityItemSourceOperation isExecuting](self->_currentOperation, "isExecuting"))
    {
      -[PUActivityItemSourceOperation semaphore](self->_currentOperation, "semaphore");
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_semaphore_signal((dispatch_semaphore_t)v12);
    }
    else
    {
      -[PUActivityItemSource completionHandler](self, "completionHandler");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[PUActivityItemSource setCompletionHandler:](self, "setCompletionHandler:", 0);
        (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v12 + 16))(v12, 0, 1, 0);
      }
    }

  }
  anchorOperation = self->_anchorOperation;
  if (anchorOperation)
  {
    -[PXAsyncOperation cancel](anchorOperation, "cancel");
    PLShareSheetGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = self->_sharingUUID;
      v16 = self->_anchorOperation;
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cancelling anchor operation: %@", (uint8_t *)&v22, 0x16u);
    }

  }
  objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[PUActivityItemSource signpostId](self, "signpostId");
  v19 = v17;
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v20, OS_SIGNPOST_EVENT, v18, "PrepareItemCancelled", " enableTelemetry=YES ", (uint8_t *)&v22, 2u);
  }

}

- (void)signalAnchorCompletion
{
  PUActivityItemSourceAnchorOperation *anchorOperation;
  PUActivityItemSourceAnchorOperation *v4;

  if (-[PUActivityItemSource shouldAnchorPreparation](self, "shouldAnchorPreparation"))
  {
    anchorOperation = self->_anchorOperation;
    if (anchorOperation)
    {
      -[PUActivityItemSourceAnchorOperation signalAnchor](anchorOperation, "signalAnchor");
      v4 = self->_anchorOperation;
      self->_anchorOperation = 0;

    }
  }
}

- (id)_uniformTypeIdentifierForActivityType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  PHAsset *v9;
  PHAsset *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "provideGenericTypeIdentifiersForNilActivityTypes");

  if (v4 || !v6)
  {
    -[PUActivityItemSource _sharingVariants](self, "_sharingVariants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = self->_asset;
    v10 = v9;
    if (v8)
    {
      -[PUActivityItemSource sharingPreferences](self, "sharingPreferences");
      v12 = v11;
      v13 = -[PUActivityItemSource sharingPreferences](self, "sharingPreferences");
      if (v4)
      {
        -[PUActivityItemSource sharingPreferences](self, "sharingPreferences");
        v15 = +[PUActivityItemSourceConfiguration shouldProvideCompatibleFormatForActivityType:forAsset:inPreferredExportFormat:withAvailableSharingVariants:](PUActivityItemSourceConfiguration, "shouldProvideCompatibleFormatForActivityType:forAsset:inPreferredExportFormat:withAvailableSharingVariants:", v4, v10, v14, v8);
        -[PUActivityItemSource sharingPreferences](self, "sharingPreferences");
        v17 = +[PUActivityItemSourceConfiguration shouldProvideAlternateVariantForActivityType:forAsset:inPreferredExportFormat:withAvailableSharingVariants:](PUActivityItemSourceConfiguration, "shouldProvideAlternateVariantForActivityType:forAsset:inPreferredExportFormat:withAvailableSharingVariants:", v4, v10, v16, v8);
        v7 = 0;
        if (v12)
          v18 = v12 == 2;
        else
          v18 = v15;
        v19 = (v13 & 0x10000000000) == 0 && v18;
        if ((v13 & 0x10000000000) == 0 && v17)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E59BACE0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v7 = 0;
        v19 = (v13 & 0x10000000000 | v12 & 0xFFFFFFFFFFFFFFFDLL) == 0;
      }
      if (v19 && v7 == 0)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E59BACF8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v7)
        goto LABEL_26;
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E59BAD10);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PHAsset uniformTypeIdentifier](v9, "uniformTypeIdentifier");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v20;
LABEL_26:

    goto LABEL_27;
  }
  objc_msgSend((id)objc_opt_class(), "_basicTypeIdentifierForAsset:", self->_asset);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v7;
}

- (id)_newOperationForActivityType:(id)a3
{
  id v5;
  PUActivityItemSourceOperation *v6;
  PUActivityItemSourceOperation *currentOperation;
  void *v9;

  v5 = a3;
  v6 = -[PUActivityItemSourceOperation initWithDelegate:activityType:]([PUActivityItemSourceOperation alloc], "initWithDelegate:activityType:", self, v5);

  currentOperation = self->_currentOperation;
  if (currentOperation && -[PUActivityItemSourceOperation isExecuting](currentOperation, "isExecuting"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUActivityItemSource.m"), 491, CFSTR("expect only one running operation"));

  }
  objc_storeStrong((id *)&self->_currentOperation, v6);
  return v6;
}

- (id)_newPasteboardItemProviderForURL:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = *MEMORY[0x1E0D96DA0];
  v5 = a3;
  -[PUActivityItemSource _uniformTypeIdentifierForActivityType:](self, "_uniformTypeIdentifierForActivityType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3AC0], "px_newPasteboardItemProviderForAsset:fileURL:utiType:", self->_asset, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)activityItemSourceOperation:(id)a3 prepareItemForActivityType:(id)a4
{
  void *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSString *sharingUUID;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSString *v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  NSObject *v43;
  __CFString *v44;
  __CFString *v45;
  const __CFString *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  _BOOL4 v56;
  __CFString *v57;
  __CFString *v58;
  __CFString *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  __CFString *v63;
  __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  void *v68;
  char v69;
  uint64_t v70;
  id v71;
  void (**v72)(void *, _QWORD, double);
  uint64_t v73;
  unint64_t v74;
  char v75;
  char v76;
  void *v77;
  unint64_t v78;
  int v79;
  int v80;
  NSObject *v81;
  NSString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  NSString *v90;
  NSObject *v91;
  NSString *v92;
  NSObject *v93;
  NSString *v94;
  NSObject *v95;
  NSString *v96;
  void *v97;
  NSObject *v98;
  NSString *v99;
  NSObject *v100;
  NSString *v101;
  NSObject *v102;
  NSString *v103;
  uint64_t v104;
  NSObject *v105;
  NSString *v106;
  uint64_t v107;
  NSObject *v108;
  NSString *v109;
  unint64_t v110;
  void *v111;
  id v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  id v119;
  NSObject *v120;
  NSString *v121;
  objc_class *v122;
  void *v123;
  __CFString *v124;
  NSObject *v125;
  NSString *v126;
  __CFString *v127;
  __CFString *v128;
  __CFString *v129;
  const __CFString *v130;
  NSObject *v131;
  NSObject *v132;
  const char *v133;
  void *v134;
  NSObject *v135;
  const __CFString *v136;
  uint64_t v137;
  char v138;
  _BOOL4 v139;
  os_signpost_id_t spid;
  int v141;
  unint64_t v142;
  NSString *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  __CFString *v148;
  void *v149;
  __CFString *v150;
  void *v151;
  void *v152;
  __CFString *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  id v158;
  id v159;
  __CFString *v160;
  uint64_t v161;
  __CFString *v162;
  void (**v163)(void);
  _BOOL4 v164;
  void (**v165)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v166;
  NSObject *v167;
  __CFString *v168;
  void *v169;
  PUActivityItemSourceConfiguration *v170;
  _QWORD v171[4];
  id v172;
  id v173;
  PUActivityItemSource *v174;
  NSObject *v175;
  uint64_t *v176;
  uint64_t *v177;
  uint64_t *v178;
  uint64_t *v179;
  uint64_t v180;
  uint64_t v181;
  BOOL v182;
  BOOL v183;
  char v184;
  _QWORD aBlock[5];
  id v186;
  id v187;
  uint64_t *v188;
  SEL v189;
  uint64_t v190;
  id *v191;
  uint64_t v192;
  uint64_t (*v193)(uint64_t, uint64_t);
  void (*v194)(uint64_t);
  id v195;
  uint64_t v196;
  uint64_t *v197;
  uint64_t v198;
  BOOL v199;
  uint64_t v200;
  uint64_t *v201;
  uint64_t v202;
  BOOL v203;
  uint64_t v204;
  uint64_t *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  uint8_t buf[4];
  NSString *v211;
  __int16 v212;
  unint64_t v213;
  __int16 v214;
  unint64_t v215;
  __int16 v216;
  void *v217;
  __int16 v218;
  const __CFString *v219;
  __int16 v220;
  const __CFString *v221;
  __int16 v222;
  __CFString *v223;
  __int16 v224;
  __CFString *v225;
  __int16 v226;
  __CFString *v227;
  __int16 v228;
  __CFString *v229;
  __int16 v230;
  __CFString *v231;
  __int16 v232;
  __CFString *v233;
  __int16 v234;
  __CFString *v235;
  uint64_t v236;

  v236 = *MEMORY[0x1E0C80C00];
  v158 = a3;
  v168 = (__CFString *)a4;
  -[PUActivityItemSource setLastPreparationError:](self, "setLastPreparationError:", 0);
  objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUActivityItemSource signpostId](self, "signpostId");
  v8 = v6;
  v9 = v8;
  spid = v7;
  v142 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PrepareItem", " enableTelemetry=YES ", buf, 2u);
  }
  v167 = v9;

  -[PHAsset uuid](self->_asset, "uuid");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
  -[PHAsset originalMetadataProperties](self->_asset, "originalMetadataProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "originalFilename");
  v160 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaType:", -[PHAsset mediaType](self->_asset, "mediaType"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForMediaSubtypes:", -[PHAsset mediaSubtypes](self->_asset, "mediaSubtypes"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "descriptionForPlaybackStyle:", -[PHAsset playbackStyle](self->_asset, "playbackStyle"));
  v153 = (__CFString *)objc_claimAutoreleasedReturnValue();
  PLShareSheetGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    sharingUUID = self->_sharingUUID;
    v13 = -[__CFString length](v160, "length");
    v14 = CFSTR("<Missing>");
    *(_DWORD *)buf = 138544898;
    if (v13)
      v14 = v160;
    v211 = sharingUUID;
    v212 = 2114;
    v213 = (unint64_t)v156;
    v214 = 2114;
    v215 = (unint64_t)v155;
    v216 = 2114;
    v217 = v154;
    v218 = 2114;
    v219 = v153;
    v220 = 2114;
    v221 = v14;
    v222 = 2114;
    v223 = v168;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Preparing asset %{public}@ (Type: %{public}@, Subtypes: %{public}@, Playback style: %{public}@, Primary Filename: %{public}@) for sharing to activity type: %{public}@", buf, 0x48u);
  }

  v15 = -[PUActivityItemSource sharingPreferences](self, "sharingPreferences");
  v146 = v16;
  v147 = v15;
  -[PUActivityItemSource _sharingVariants](self, "_sharingVariants");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = -[PUActivityItemSourceConfiguration initWithAsset:availableSharingVariants:activityType:preferences:]([PUActivityItemSourceConfiguration alloc], "initWithAsset:availableSharingVariants:activityType:preferences:", self->_asset, v157, v168, v147, v146);
  -[PUActivityItemSourceConfiguration assetExportRequestOptions](v170, "assetExportRequestOptions");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setShouldBundleComplexAssetResources:", 1);
  objc_msgSend((id)objc_opt_class(), "_exportResultHandlingQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v169, "setResultHandlerQueue:", v17);

  -[PUActivityItemSource exportConfiguration](self, "exportConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activityType");
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if (v166 && (objc_msgSend(v166, "isEqualToString:", v168) & 1) == 0)
  {
    PLShareSheetGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = self->_sharingUUID;
      *(_DWORD *)buf = 138543874;
      v211 = v20;
      v212 = 2114;
      v213 = (unint64_t)v168;
      v214 = 2114;
      v215 = (unint64_t)v166;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Re-using activity item source for activity type: %{public}@ (Previously: %{public}@)", buf, 0x20u);
    }

  }
  -[PUActivityItemSource exportConfiguration](self, "exportConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[PUActivityItemSource exportConfiguration](self, "exportConfiguration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqual:", v170);

    if ((v23 & 1) == 0)
    {
      PLShareSheetGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_sharingUUID;
        *(_DWORD *)buf = 138543874;
        v211 = v25;
        v212 = 2114;
        v213 = (unint64_t)v168;
        v214 = 2114;
        v215 = (unint64_t)v166;
        _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Export configuration (for activity %{public}@) does not match previous export configuration (for activity %{public}@). Deleting already-exported files.", buf, 0x20u);
      }

      -[PUActivityItemSource cleanUpExportedFilesImmediately:](self, "cleanUpExportedFilesImmediately:", 1);
    }
  }
  -[PUActivityItemSource setExportConfiguration:](self, "setExportConfiguration:", v170);
  v26 = -[PUActivityItemSourceConfiguration requiresAssetExport](v170, "requiresAssetExport");
  v27 = objc_msgSend(v169, "variant");
  v28 = objc_msgSend(v169, "variant");
  v29 = v28;
  v204 = 0;
  v205 = &v204;
  if (v27 == 3)
    v30 = 4;
  else
    v30 = v28 == 2;
  v206 = 0x2020000000;
  v207 = v30;
  v137 = v30;
  if (v26)
  {
    -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = objc_msgSend(v32, "fileExistsAtPath:", v33);

    }
    else
    {
      v141 = 0;
    }

  }
  else
  {
    v141 = 1;
  }
  v34 = 0;
  v200 = 0;
  v201 = &v200;
  v202 = 0x2020000000;
  v203 = 0;
  v161 = -[PUActivityItemSourceConfiguration assetExportKind](v170, "assetExportKind");
  if (v161 == 3)
  {
    -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v35 == 0;

  }
  v36 = 0;
  v203 = v34;
  v196 = 0;
  v197 = &v196;
  v198 = 0x2020000000;
  v199 = 0;
  if (v161 == 4)
  {
    -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", 5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v37 == 0;

  }
  v199 = v36;
  v38 = -[PUActivityItemSourceConfiguration outputType](v170, "outputType");
  if (v38 == 2)
  {
    -[PUActivityItemSource _assetsLibraryURL](self, "_assetsLibraryURL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v164 = v39 == 0;

    v139 = v164;
  }
  else
  {
    v139 = 0;
    v164 = 1;
  }
  v138 = objc_msgSend(v169, "shouldExportUnmodifiedOriginalResources");
  v190 = 0;
  v191 = (id *)&v190;
  v192 = 0x3032000000;
  v193 = __Block_byref_object_copy__3124;
  v194 = __Block_byref_object_dispose__3125;
  v195 = 0;
  +[PUActivityItemSourceConfiguration descriptionForOutputType:](PUActivityItemSourceConfiguration, "descriptionForOutputType:", -[PUActivityItemSourceConfiguration outputType](v170, "outputType"));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUActivityItemSourceConfiguration descriptionForAssetExportKind:](PUActivityItemSourceConfiguration, "descriptionForAssetExportKind:", -[PUActivityItemSourceConfiguration assetExportKind](v170, "assetExportKind"));
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 == 2)
    v40 = CFSTR("Compatible (HEIC/HEVC to JPG/MOV)");
  else
    v40 = CFSTR("Primary (original format)");
  if (v26)
  {
    v41 = CFSTR("NO");
    if (v141)
      v41 = CFSTR("YES");
    v42 = v41;

    v150 = v42;
  }
  else
  {
    v150 = CFSTR("n/a");
  }
  PLShareSheetGetLog();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v144 = self->_sharingUUID;
    if (v26)
      v44 = CFSTR("YES");
    else
      v44 = CFSTR("NO");
    v45 = v44;

    v148 = v45;
    v46 = CFSTR("Alternate (for auto-loops to GIF)");
    if (v27 != 3)
      v46 = v40;
    v136 = v46;
    if (v161 == 3)
      v47 = CFSTR("YES");
    else
      v47 = CFSTR("NO");
    v48 = v47;

    v162 = v48;
    v49 = CFSTR("NO");
    if (v161 == 3)
    {
      if (*((_BYTE *)v201 + 24))
        v49 = CFSTR("NO");
      else
        v49 = CFSTR("YES");
    }
    v50 = v49;

    v51 = v50;
    if (v161 == 4)
      v52 = CFSTR("YES");
    else
      v52 = CFSTR("NO");
    v53 = v52;

    v54 = v53;
    v55 = CFSTR("NO");
    if (v161 == 4)
    {
      if (*((_BYTE *)v197 + 24))
        v55 = CFSTR("NO");
      else
        v55 = CFSTR("YES");
    }
    v56 = v38 == 2;
    v57 = v55;

    v58 = v57;
    if (v56)
      v59 = CFSTR("YES");
    else
      v59 = CFSTR("NO");
    v60 = v59;

    v61 = v60;
    if (v164)
      v62 = CFSTR("NO");
    else
      v62 = CFSTR("YES");
    v63 = v62;

    v64 = v63;
    if (objc_msgSend(v169, "flattenSlomoVideos"))
      v65 = CFSTR("YES");
    else
      v65 = CFSTR("NO");
    v66 = v65;

    v67 = v66;
    *(_DWORD *)buf = 138546434;
    v211 = v144;
    v212 = 2112;
    v213 = (unint64_t)v152;
    v214 = 2112;
    v215 = (unint64_t)v148;
    v216 = 2112;
    v217 = v151;
    v218 = 2112;
    v219 = v136;
    v220 = 2112;
    v221 = v150;
    v222 = 2112;
    v223 = v162;
    v224 = 2112;
    v225 = v51;
    v226 = 2112;
    v227 = v54;
    v228 = 2112;
    v229 = v58;
    v230 = 2112;
    v231 = v61;
    v232 = 2112;
    v233 = v64;
    v234 = 2112;
    v235 = v67;
    _os_log_impl(&dword_1AAB61000, v43, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Preparation pre-flight - Output type: %@ (requires asset export: %@), as kind: %@, in format: %@ (file already exported: %@) - should create Live Photo bundle: %@ (already created: %@) - should create asset bundle: %@ (already created: %@) should set AssetsLibrary URL: %@ (already set: %@) - will flatten slo-mo video: %@", buf, 0x84u);

  }
  objc_msgSend(v158, "semaphore");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSource progressHandler](self, "progressHandler");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSource completionHandler](self, "completionHandler");
  v165 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSource postCompletionHandler](self, "postCompletionHandler");
  v163 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v149, "allowFallbacksWhilePreparing");
  v70 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke;
  aBlock[3] = &unk_1E589B030;
  aBlock[4] = self;
  v188 = &v190;
  v189 = a2;
  v71 = v158;
  v186 = v71;
  v159 = v68;
  v187 = v159;
  v72 = (void (**)(void *, _QWORD, double))_Block_copy(aBlock);
  v73 = -[PUActivityItemSourceConfiguration maxFileSizeLimit](v170, "maxFileSizeLimit");
  if (!v191[5])
  {
    v74 = v73;
    if ((objc_msgSend(v71, "pu_isCancelled") & 1) == 0)
    {
      v75 = objc_msgSend(v71, "isCancelled");
      v76 = v74 ? v75 : 1;
      if ((v76 & 1) == 0)
      {
        -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
        -[PHAsset originalMetadataProperties](self->_asset, "originalMetadataProperties");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "originalFilesize");

        v79 = objc_msgSend(v149, "simulateMaxFilesizeLimitForGIFsInSharedAlbumsError");
        v80 = v78 > v74 ? 1 : v79;
        if (v80 == 1)
        {
          PLShareSheetGetLog();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            v82 = self->_sharingUUID;
            *(_DWORD *)buf = 138543874;
            v211 = v82;
            v212 = 2048;
            v213 = v78;
            v214 = 2048;
            v215 = v74;
            _os_log_impl(&dword_1AAB61000, v81, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Attempted to share an asset that exceeds the filesize limit, %lu > %lu", buf, 0x20u);
          }

          v83 = (void *)objc_opt_class();
          v208 = *MEMORY[0x1E0D7BC48];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v74);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v209 = v84;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v209, &v208, 1);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "_sharingErrorWithCode:underlyingError:localizedDescription:additionalInfo:", -102, 0, CFSTR("Asset exceeds file size limit for sharing"), v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          objc_storeStrong(v191 + 5, v86);
        }
      }
    }
  }
  if (v191[5]
    || (objc_msgSend(v71, "pu_isCancelled") & 1) != 0
    || ((objc_msgSend(v71, "isCancelled") | v141) & 1) != 0)
  {
    if (!v191[5] && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0 && (objc_msgSend(v71, "isCancelled") & 1) == 0)
      -[PUActivityItemSource performChanges:](self, "performChanges:", &__block_literal_global_119);
  }
  else
  {
    v171[0] = v70;
    v171[1] = 3221225472;
    v171[2] = __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_99;
    v171[3] = &unk_1E589B058;
    v176 = &v190;
    v172 = v71;
    v173 = v149;
    v174 = self;
    v177 = &v204;
    v178 = &v196;
    v182 = v161 == 3;
    v183 = v161 == 4;
    v184 = v138;
    v179 = &v200;
    v180 = v147;
    v181 = v146;
    v87 = v145;
    v175 = v87;
    v88 = _Block_copy(v171);
    switch(v161)
    {
      case 2:
        PLShareSheetGetLog();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          v92 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v211 = v92;
          v212 = 2112;
          v213 = (unint64_t)v168;
          _os_log_impl(&dword_1AAB61000, v91, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching video for activity type: %@", buf, 0x16u);
        }

        -[PUActivityItemSource _fetchVideoWithOptions:forActivityType:progressHandler:completionHandler:](self, "_fetchVideoWithOptions:forActivityType:progressHandler:completionHandler:", v169, v168, v72, v88);
        break;
      case 5:
        PLShareSheetGetLog();
        v89 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          v90 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v211 = v90;
          v212 = 2112;
          v213 = (unint64_t)v168;
          _os_log_impl(&dword_1AAB61000, v89, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching auto-looping image as GIF for activity type: %@", buf, 0x16u);
        }

        -[PUActivityItemSource _fetchAlternateWithOptions:forActivityType:progressHandler:completionHandler:](self, "_fetchAlternateWithOptions:forActivityType:progressHandler:completionHandler:", v169, v168, v72, v88);
        break;
      case 3:
        PLShareSheetGetLog();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          v94 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v211 = v94;
          v212 = 2112;
          v213 = (unint64_t)v168;
          _os_log_impl(&dword_1AAB61000, v93, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching live photo bundle for activity type: %@", buf, 0x16u);
        }

        -[PUActivityItemSource _fetchLivePhotoWithOptions:forActivityType:progressHandler:completionHandler:](self, "_fetchLivePhotoWithOptions:forActivityType:progressHandler:completionHandler:", v169, v168, v72, v88);
        break;
      default:
        PLShareSheetGetLog();
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
        {
          v96 = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v211 = v96;
          v212 = 2112;
          v213 = (unint64_t)v168;
          _os_log_impl(&dword_1AAB61000, v95, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching image for activity type: %@", buf, 0x16u);
        }

        -[PUActivityItemSource _fetchImageWithOptions:forActivityType:progressHandler:completionHandler:](self, "_fetchImageWithOptions:forActivityType:progressHandler:completionHandler:", v169, v168, v72, v88);
        break;
    }
    dispatch_semaphore_wait(v87, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (!v191[5]
    && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0
    && ((objc_msgSend(v71, "isCancelled") | !v139) & 1) == 0)
  {
    -[PHAsset ALAssetURL](self->_asset, "ALAssetURL");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {
      PLShareSheetGetLog();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        v99 = self->_sharingUUID;
        *(_DWORD *)buf = 138543362;
        v211 = v99;
        _os_log_impl(&dword_1AAB61000, v98, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Setting assets library URL for sharing.", buf, 0xCu);
      }

      -[PUActivityItemSource _setAssetsLibraryURL:](self, "_setAssetsLibraryURL:", v97);
    }
    else
    {
      if ((v69 & 1) != 0)
      {
        PLShareSheetGetLog();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
        {
          v101 = self->_sharingUUID;
          *(_DWORD *)buf = 138543362;
          v211 = v101;
          _os_log_impl(&dword_1AAB61000, v100, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to get assets library URL for sharing. Falling back to unmodified.", buf, 0xCu);
        }
      }
      else
      {
        PLShareSheetGetLog();
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
        {
          v103 = self->_sharingUUID;
          *(_DWORD *)buf = 138543362;
          v211 = v103;
          _os_log_impl(&dword_1AAB61000, v102, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to get assets library URL for sharing.", buf, 0xCu);
        }

        objc_msgSend((id)objc_opt_class(), "_sharingErrorWithCode:underlyingError:localizedDescription:additionalInfo:", -106, 0, CFSTR("Failed to get assets library URL for sharing."), 0);
        v104 = objc_claimAutoreleasedReturnValue();
        v100 = v191[5];
        v191[5] = (id)v104;
      }

    }
  }
  if (!v191[5]
    && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0
    && (objc_msgSend(v71, "isCancelled") & 1) == 0
    && -[PUActivityItemSourceConfiguration outputType](v170, "outputType") == 1)
  {
    PLShareSheetGetLog();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      v106 = self->_sharingUUID;
      *(_DWORD *)buf = 138543362;
      v211 = v106;
      _os_log_impl(&dword_1AAB61000, v105, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Setting Pasteboard representation.", buf, 0xCu);
    }

    v107 = v137;
    if (v205[3] != v137)
    {
      PLShareSheetGetLog();
      v108 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
      {
        v109 = self->_sharingUUID;
        v110 = v205[3];
        *(_DWORD *)buf = 138543874;
        v211 = v109;
        v212 = 2050;
        v213 = v137;
        v214 = 2050;
        v215 = v110;
        _os_log_impl(&dword_1AAB61000, v108, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Requested source type %{public}zd is different from actual source type %{public}zd", buf, 0x20u);
      }

      v107 = v205[3];
    }
    -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", v107);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = -[PUActivityItemSource _newPasteboardItemProviderForURL:](self, "_newPasteboardItemProviderForURL:", v111);
    -[PUActivityItemSource set_pasteboardItemProvider:](self, "set_pasteboardItemProvider:", v112);

  }
  if (v72)
    v72[2](v72, 0, 1.0);
  -[PUActivityItemSource performChanges:](self, "performChanges:", &__block_literal_global_123);
  if ((objc_msgSend(v71, "pu_isCancelled") & 1) != 0)
    v113 = 1;
  else
    v113 = objc_msgSend(v71, "isCancelled");
  if (v165)
  {
    -[PUActivityItemSource _itemForActivityType:](self, "_itemForActivityType:", v168);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v114
      && !v191[5]
      && (objc_msgSend(v71, "pu_isCancelled") & 1) == 0
      && (objc_msgSend(v71, "isCancelled") & 1) == 0)
    {
      v115 = (void *)MEMORY[0x1E0CB3940];
      -[PHAsset uuid](self->_asset, "uuid");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "stringWithFormat:", CFSTR("Preparation failed (nil item) for activityType: %@, asset: %@"), v168, v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_sharingErrorWithCode:underlyingError:localizedDescription:additionalInfo:", -100, 0, v117, 0);
      v118 = objc_claimAutoreleasedReturnValue();
      v119 = v191[5];
      v191[5] = (id)v118;

      PLShareSheetGetLog();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
      {
        v121 = self->_sharingUUID;
        *(_DWORD *)buf = 138543618;
        v211 = v121;
        v212 = 2114;
        v213 = (unint64_t)v156;
        _os_log_impl(&dword_1AAB61000, v120, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Finished sharing preparation for asset %{public}@ with no errors or cancellation, but the item is nil. Will fail with generic error.", buf, 0x16u);
      }

    }
    v122 = (objc_class *)objc_opt_class();
    NSStringFromClass(v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v114, "path");
      v124 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v124 = 0;
    }
    PLShareSheetGetLog();
    v125 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      v126 = self->_sharingUUID;
      v127 = CFSTR("NO");
      if ((_DWORD)v113)
        v127 = CFSTR("YES");
      v128 = v127;

      v129 = v128;
      v130 = (const __CFString *)v191[5];
      *(_DWORD *)buf = 138544642;
      v211 = v126;
      v212 = 2114;
      v213 = (unint64_t)v156;
      v214 = 2112;
      v215 = (unint64_t)v129;
      v216 = 2114;
      v217 = v123;
      v218 = 2114;
      v219 = v124;
      v220 = 2112;
      v221 = v130;
      _os_log_impl(&dword_1AAB61000, v125, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Preparation completed for asset %{public}@ (Cancelled: %@), final item is of type %{public}@ (path: %{public}@), with error: %@", buf, 0x3Eu);

    }
    -[PUActivityItemSource setLastPreparationError:](self, "setLastPreparationError:", v191[5]);
    ((void (**)(_QWORD, void *, uint64_t, id))v165)[2](v165, v114, v113, v191[5]);

  }
  if ((_DWORD)v113)
  {
    v131 = v167;
    if (v142 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v132 = v131;
      if (os_signpost_enabled(v131))
      {
        *(_WORD *)buf = 0;
        v133 = " enableTelemetry=YES Cancel";
LABEL_166:
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v132, OS_SIGNPOST_INTERVAL_END, spid, "PrepareItem", v133, buf, 2u);
      }
    }
  }
  else
  {
    -[PUActivityItemSource lastPreparationError](self, "lastPreparationError");
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    v135 = v167;
    v132 = v135;
    if (v134)
    {
      if (v142 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
      {
        *(_WORD *)buf = 0;
        v133 = " enableTelemetry=YES Error";
        goto LABEL_166;
      }
    }
    else if (v142 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
    {
      *(_WORD *)buf = 0;
      v133 = " enableTelemetry=YES Success";
      goto LABEL_166;
    }
  }

  if (v163)
    v163[2]();
  -[PUActivityItemSource setPostCompletionHandler:](self, "setPostCompletionHandler:", 0);
  -[PUActivityItemSource setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[PUActivityItemSource setProgressHandler:](self, "setProgressHandler:", 0);

  _Block_object_dispose(&v190, 8);
  _Block_object_dispose(&v196, 8);
  _Block_object_dispose(&v200, 8);
  _Block_object_dispose(&v204, 8);

}

- (void)_runExportRequestWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PHAsset *asset;
  NSDictionary *cachedSharingVariants;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSString *sharingUUID;
  void *v24;
  NSObject *v25;
  NSString *v26;
  _QWORD v27[5];
  id v28;
  id v29[2];
  id v30;
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  asset = self->_asset;
  cachedSharingVariants = self->_cachedSharingVariants;
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:variants:error:", asset, cachedSharingVariants, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  if (v16)
  {
    objc_msgSend(v16, "setShouldSendTimingIntervalsToAnalytics:", -[PUActivityItemSource shouldSendAnalyticsInterval](self, "shouldSendAnalyticsInterval"));
    objc_msgSend(v16, "setAnalyticsActivityType:", v11);
    objc_msgSend(v16, "variants");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "variant"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      PLShareSheetGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        sharingUUID = self->_sharingUUID;
        *(_DWORD *)buf = 138543362;
        v32 = sharingUUID;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Requested variant unavailable for sharing, using current", buf, 0xCu);
      }

      objc_msgSend(v10, "setVariant:", 1);
    }
    v24 = (void *)objc_msgSend(v10, "variant");
    -[PUActivityItemSource _beginObservingExportRequest:withProgressHandler:](self, "_beginObservingExportRequest:withProgressHandler:", v16, v12);
    objc_initWeak((id *)buf, self);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __103__PUActivityItemSource__runExportRequestWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
    v27[3] = &unk_1E589B0E0;
    objc_copyWeak(v29, (id *)buf);
    v27[4] = self;
    v28 = v13;
    v29[1] = v24;
    objc_msgSend(v16, "exportWithOptions:completionHandler:", v10, v27);

    objc_destroyWeak(v29);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    PLShareSheetGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = self->_sharingUUID;
      *(_DWORD *)buf = 138543618;
      v32 = v26;
      v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to create PHAssetExportRequest: %@", buf, 0x16u);
    }

    (*((void (**)(id, _QWORD, id, _QWORD))v13 + 2))(v13, 0, v17, 0);
  }

}

- (void)_fetchImageWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD aBlock[4];
  NSObject *v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUActivityItemSource signpostId](self, "signpostId");
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemImage", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PUActivityItemSource__fetchImageWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E589B108;
  v23 = v10;
  v24 = v15;
  v22 = v17;
  v18 = v10;
  v19 = v17;
  v20 = _Block_copy(aBlock);
  -[PUActivityItemSource _runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:](self, "_runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:", v13, v12, v11, v20);

}

- (void)_fetchVideoWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD aBlock[4];
  NSObject *v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUActivityItemSource signpostId](self, "signpostId");
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemVideo", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__PUActivityItemSource__fetchVideoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E589B108;
  v23 = v10;
  v24 = v15;
  v22 = v17;
  v18 = v10;
  v19 = v17;
  v20 = _Block_copy(aBlock);
  -[PUActivityItemSource _runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:](self, "_runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:", v13, v12, v11, v20);

}

- (void)_fetchLivePhotoWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD aBlock[4];
  NSObject *v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUActivityItemSource signpostId](self, "signpostId");
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemLivePhoto", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PUActivityItemSource__fetchLivePhotoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E589B108;
  v23 = v10;
  v24 = v15;
  v22 = v17;
  v18 = v10;
  v19 = v17;
  v20 = _Block_copy(aBlock);
  -[PUActivityItemSource _runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:](self, "_runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:", v13, v12, v11, v20);

}

- (void)_fetchAlternateWithOptions:(id)a3 forActivityType:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _QWORD aBlock[4];
  NSObject *v22;
  id v23;
  os_signpost_id_t v24;
  uint8_t buf[16];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "activityItemSourceLog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PUActivityItemSource signpostId](self, "signpostId");
  v16 = v14;
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "FetchItemAlternate", " enableTelemetry=YES ", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PUActivityItemSource__fetchAlternateWithOptions_forActivityType_progressHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E589B108;
  v23 = v10;
  v24 = v15;
  v22 = v17;
  v18 = v10;
  v19 = v17;
  v20 = _Block_copy(aBlock);
  -[PUActivityItemSource _runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:](self, "_runExportRequestWithOptions:forActivityType:progressHandler:completionHandler:", v13, v12, v11, v20);

}

- (id)_itemForActivityType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUActivityItemSource exportConfiguration](self, "exportConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "outputType");
  switch(v6)
  {
    case 3:
      -[PUActivityItemSource asset](self, "asset");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      -[PUActivityItemSource _assetsLibraryURL](self, "_assetsLibraryURL");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      -[PUActivityItemSource _pasteboardItemProvider](self, "_pasteboardItemProvider");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v8 = (void *)v7;
      goto LABEL_30;
  }
  v9 = objc_msgSend(v5, "assetExportKind");
  v10 = v9;
  if (v9 != 3)
  {
    if (v9 != 4)
    {
      v8 = 0;
      goto LABEL_13;
    }
    v10 = 5;
  }
  -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
  objc_msgSend(v5, "assetExportRequestOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "shouldExportUnmodifiedOriginalResources"))
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D7BD30]))
    {
      -[PUActivityItemSource asset](self, "asset");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "canPlayPhotoIris");

      if (v13)
      {
        -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", 2);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14 && v15)
        {
          v21[0] = v14;
          v21[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
          v17 = objc_claimAutoreleasedReturnValue();

          v8 = (void *)v17;
        }

      }
    }
  }
  v18 = objc_msgSend(v11, "variant");
  if (v8 || v18 != 3)
  {
    if (v8 || v18 != 2)
      goto LABEL_27;
    v19 = 1;
  }
  else
  {
    v19 = 4;
  }
  -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
  if (!v8)
  {
    -[PUActivityItemSource _resourceURLForType:](self, "_resourceURLForType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_30:
  return v8;
}

- (void)_beginObservingExportRequest:(id)a3 withProgressHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "progress");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PUActivityItemSource _setAssetExportRequest:](self, "_setAssetExportRequest:", v7);
  -[PUActivityItemSource _setExportProgressHandler:](self, "_setExportProgressHandler:", v6);

  -[PUActivityItemSource _setExportProgress:](self, "_setExportProgress:", v8);
  objc_msgSend(v7, "setDelegate:", self);

}

- (void)_stopObservingExportRequest
{
  id v3;

  -[PUActivityItemSource _assetExportRequest](self, "_assetExportRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);
  -[PUActivityItemSource _setAssetExportRequest:](self, "_setAssetExportRequest:", 0);
  -[PUActivityItemSource _setExportProgress:](self, "_setExportProgress:", 0);
  -[PUActivityItemSource _setExportProgressHandler:](self, "_setExportProgressHandler:", 0);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (a6 == &PUActivityItemSourceProgressContext)
  {
    px_dispatch_on_main_queue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PUActivityItemSource;
    -[PUActivityItemSource observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)assetExportRequest:(id)a3 didChangeToState:(unint64_t)a4 fromState:(unint64_t)a5
{
  _QWORD v5[5];

  if (a4)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__PUActivityItemSource_assetExportRequest_didChangeToState_fromState___block_invoke;
    v5[3] = &__block_descriptor_40_e39_v16__0___PUMutableActivityItemSource__8l;
    v5[4] = a4;
    -[PUActivityItemSource performChanges:](self, "performChanges:", v5, a4, a5);
  }
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  return -[PUActivityItemSource _itemForActivityType:](self, "_itemForActivityType:", a4);
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(a3, "activity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activityType");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[PUActivityItemSource _uniformTypeIdentifierForActivityType:](self, "_uniformTypeIdentifierForActivityType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activityViewController:(id)a3 thumbnailImageDataForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  double v11;
  double v12;
  id v13;
  NSObject *v14;
  double v15;
  double v16;
  NSString *sharingUUID;
  void *v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  PHAsset *asset;
  void *v21;
  PHAsset *v22;
  id v23;
  _QWORD v25[6];
  _BYTE buf[24];
  uint64_t (*v27)(uint64_t, uint64_t);
  __int128 v28;
  uint64_t v29;
  CGSize v30;
  CGSize v31;

  height = a5.height;
  width = a5.width;
  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  PLPhysicalScreenScale();
  v12 = v11;
  v13 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v13, "setVersion:", self->_sharingPreferences.shareAsUnmodifiedOriginal);
  objc_msgSend(v13, "setSynchronous:", 1);
  objc_msgSend(v13, "setDeliveryMode:", 1);
  objc_msgSend(v13, "setResizeMode:", 2);
  PLShareSheetGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = width * v12;
  v16 = height * v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    sharingUUID = self->_sharingUUID;
    v30.width = width;
    v30.height = height;
    NSStringFromCGSize(v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31.width = v15;
    v31.height = v16;
    NSStringFromCGSize(v31);
    v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    asset = self->_asset;
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = sharingUUID;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v18;
    *(_WORD *)&buf[22] = 2114;
    v27 = v19;
    LOWORD(v28) = 2114;
    *(_QWORD *)((char *)&v28 + 2) = asset;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Fetching thumbnail image data of suggested size %{public}@ (scaled for screen: %{public}@) for asset: %{public}@", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v27 = __Block_byref_object_copy__3124;
  *(_QWORD *)&v28 = __Block_byref_object_dispose__3125;
  *((_QWORD *)&v28 + 1) = 0;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = self->_asset;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__PUActivityItemSource_activityViewController_thumbnailImageDataForActivityType_suggestedSize___block_invoke;
  v25[3] = &unk_1E58AA6F8;
  v25[4] = self;
  v25[5] = buf;
  objc_msgSend(v21, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v22, 1, v13, v25, v15, v16);
  v23 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v23;
}

- (id)_runOnDemandExportForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id location;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:error:", v8, &v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;
    if (v11)
    {
      -[NSMutableSet addObject:](self->_onDemandExports, "addObject:", v11);
      objc_initWeak(&location, v11);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__PUActivityItemSource__runOnDemandExportForAsset_withOptions_completionHandler___block_invoke;
      v15[3] = &unk_1E589B150;
      v15[4] = self;
      objc_copyWeak(&v17, &location);
      v16 = v10;
      objc_msgSend(v11, "exportWithOptions:completionHandler:", v9, v15);
      objc_msgSend(v11, "progress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_runOnDemandSingleFileExportForAsset:(id)a3 withOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PUActivityItemSource__runOnDemandSingleFileExportForAsset_withOptions_completionHandler___block_invoke;
  v12[3] = &unk_1E589B178;
  v13 = v8;
  v9 = v8;
  -[PUActivityItemSource _runOnDemandExportForAsset:withOptions:completionHandler:](self, "_runOnDemandExportForAsset:withOptions:completionHandler:", a3, a4, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)activityViewControllerApplicationExtensionItem:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  NSString *v16;
  id v17;
  void *v18;
  NSObject *v19;
  NSString *sharingUUID;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSString *v36;
  uint64_t v37;
  NSObject *v38;
  NSString *v39;
  void *v40;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  NSString *v48;
  void *v49;
  id val;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  NSString *v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  NSString *v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  NSString *v67;
  id v68;
  id v69[3];
  _QWORD v70[4];
  id v71;
  id v72;
  NSString *v73;
  id v74;
  id v75;
  _QWORD v76[4];
  NSString *v77;
  id v78;
  id v79;
  id v80;
  _QWORD v81[4];
  id v82;
  NSString *v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  char v90;
  _QWORD aBlock[6];
  id from;
  id location;
  uint8_t buf[4];
  NSString *v95;
  __int16 v96;
  id v97;
  __int16 v98;
  void *v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  val = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", 0, 0);
  -[PUActivityItemSource asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUActivityItemSource sharingPreferences](self, "sharingPreferences");
  v42 = v7;
  objc_msgSend(v5, "localIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(val, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityType");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = self->_sharingUUID;
  v9 = (void *)objc_opt_class();
  v10 = objc_msgSend(v9, "supportsAssetLocalIdentifierForActivityType:", v49);
  objc_initWeak(&location, self);
  objc_initWeak(&from, val);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke;
  aBlock[3] = &unk_1E589B1A0;
  aBlock[4] = self;
  aBlock[5] = v9;
  v46 = _Block_copy(aBlock);
  -[PUActivityItemSource activityViewController:dataTypeIdentifierForActivityType:](self, "activityViewController:dataTypeIdentifierForActivityType:", val, v49);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_140;
    v84[3] = &unk_1E589B1C8;
    objc_copyWeak(&v88, &location);
    objc_copyWeak(&v89, &from);
    v90 = v10;
    v85 = v47;
    v11 = v49;
    v86 = v11;
    v44 = v46;
    v87 = v44;
    objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v45, v84);

    objc_destroyWeak(&v89);
    objc_destroyWeak(&v88);
    v12 = objc_msgSend(v5, "playbackStyle");
    v13 = objc_msgSend(v5, "isMediaSubtype:", 8);
    if (v12 == 3)
      v14 = v13;
    else
      v14 = 0;
    if ((v14 & 1) != 0 || ((v13 ^ 1) & 1) != 0 || (v6 & 0x10000000000) == 0)
    {
      if ((v6 & 1) != 0)
        v14 = 0;
      if (v14 != 1)
        goto LABEL_17;
    }
    else if ((v6 & 1) != 0)
    {
LABEL_17:
      if ((-[PUActivityItemSource sharingPreferences](self, "sharingPreferences") & 1) == 0
        && v11
        && (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D7BD80]) & 1) != 0)
      {
        PLShareSheetGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          sharingUUID = self->_sharingUUID;
          *(_DWORD *)buf = 138543618;
          v95 = sharingUUID;
          v96 = 2114;
          v97 = v11;
          _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Registering with item provider as asset bundle for activity: %{public}@.", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0D750B8], "contentType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_151;
        v76[3] = &unk_1E589B268;
        objc_copyWeak(&v80, &location);
        v77 = v48;
        v78 = v5;
        v79 = v44;
        objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v22, v76);

        objc_destroyWeak(&v80);
      }
      -[PUActivityItemSource _sharingVariants](self, "_sharingVariants");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", &unk_1E59BAD10);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        objc_msgSend(v4, "registeredTypeIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v43);

        if ((v24 & 1) == 0)
        {
          v25 = objc_alloc_init(MEMORY[0x1E0CD1418]);
          objc_msgSend(v25, "setVariant:", 1);
          objc_msgSend(v25, "setShouldStripLocation:", (v6 >> 8) & 1);
          objc_msgSend(v25, "setShouldStripCaption:", (v6 >> 16) & 1);
          objc_msgSend(v25, "setShouldStripAccessibilityDescription:", (v6 >> 24) & 1);
          if ((PHAssetExportRequestPassthroughConversionIsSupportedByType() & 1) != 0
            || (objc_msgSend(MEMORY[0x1E0CD1410], "exportRequestForAsset:variants:error:", v5, v15, 0),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                buf[0] = 0,
                objc_msgSend(v26, "preflightExportWithOptions:assetAvailability:isProcessingRequired:fileURLs:info:", v25, 0, buf, 0, 0), v27 = buf[0], v26, !v27))
          {
            v70[0] = MEMORY[0x1E0C809B0];
            v70[1] = 3221225472;
            v70[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_158;
            v70[3] = &unk_1E589B290;
            objc_copyWeak(&v75, &location);
            v71 = v5;
            v72 = v25;
            v73 = v48;
            v74 = v44;
            objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v43, v70);

            objc_destroyWeak(&v75);
          }
          else
          {
            PLShareSheetGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v95 = v48;
              v96 = 2114;
              v97 = v43;
              _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Not registering current format as the format %{public}@ could not be maintained after additional metadata processing", buf, 0x16u);
            }

          }
        }
      }
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", &unk_1E59BACF8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        objc_msgSend(v4, "registeredTypeIdentifiers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "containsObject:", v29);

        if ((v31 & 1) == 0)
        {
          v65[0] = MEMORY[0x1E0C809B0];
          v65[1] = 3221225472;
          v65[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_161;
          v65[3] = &unk_1E589B2B8;
          objc_copyWeak(v69, &location);
          v69[1] = (id)v6;
          v69[2] = v42;
          v66 = v5;
          v67 = v48;
          v68 = v44;
          objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v29, v65);

          objc_destroyWeak(v69);
        }
      }
      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", &unk_1E59BACE0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        LODWORD(v11) = !+[PUActivityItemSourceConfiguration shouldExcludeAlternateVariantForActivityType:](PUActivityItemSourceConfiguration, "shouldExcludeAlternateVariantForActivityType:", v11);
      if (v32)
      {
        objc_msgSend(v4, "registeredTypeIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "containsObject:", v32);

        if ((v11 & ~v34) != 0)
        {
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_163;
          v60[3] = &unk_1E589B268;
          objc_copyWeak(&v64, &location);
          v61 = v5;
          v62 = v48;
          v63 = v44;
          objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v32, v60);

          objc_destroyWeak(&v64);
        }
      }
      if (objc_msgSend(v5, "isVideo"))
      {
        PLShareSheetGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = self->_sharingUUID;
          *(_DWORD *)buf = 138543362;
          v95 = v36;
          _os_log_impl(&dword_1AAB61000, v35, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Registering video resource as AVURLAsset", buf, 0xCu);
        }

        v37 = objc_opt_class();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_168;
        v55[3] = &unk_1E589B308;
        v56 = v48;
        objc_copyWeak(&v59, &location);
        v57 = v5;
        v58 = v44;
        objc_msgSend(v4, "registerObjectOfClass:visibility:loadHandler:", v37, 0, v55);

        objc_destroyWeak(&v59);
      }
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_171;
      v51[3] = &unk_1E589B330;
      objc_copyWeak(&v53, &location);
      objc_copyWeak(&v54, &from);
      v52 = v44;
      objc_msgSend(v4, "setPreviewImageHandler:", v51);
      PLShareSheetGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = self->_sharingUUID;
        objc_msgSend(v4, "registeredTypeIdentifiers");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v95 = v39;
        v96 = 2114;
        v97 = v40;
        _os_log_impl(&dword_1AAB61000, v38, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Registered type identifiers (in order): %{public}@", buf, 0x16u);

      }
      v17 = v4;

      objc_destroyWeak(&v54);
      objc_destroyWeak(&v53);

      goto LABEL_47;
    }
    objc_msgSend((id)*MEMORY[0x1E0CEC540], "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v81[0] = MEMORY[0x1E0C809B0];
    v81[1] = 3221225472;
    v81[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_144;
    v81[3] = &unk_1E589B218;
    v82 = v5;
    v83 = v48;
    objc_msgSend(v4, "registerItemForTypeIdentifier:loadHandler:", v18, v81);

    goto LABEL_17;
  }
  PLShareSheetGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    v16 = self->_sharingUUID;
    *(_DWORD *)buf = 138543874;
    v95 = v16;
    v96 = 2114;
    v97 = v47;
    v98 = 2112;
    v99 = v49;
    _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_FAULT, "[Item: %{public}@] No type identifier for asset: %{public}@ activity type: \"%@\", buf, 0x20u);
  }
  v17 = 0;
LABEL_47:

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v17;
}

- (id)activityViewControllerOperation:(id)a3
{
  id v4;
  PUActivityItemSourceAnchorOperation *v5;
  PUActivityItemSourceAnchorOperation *anchorOperation;
  PUActivityItemSourceAnchorOperation *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[PUActivityItemSource shouldSkipPreparation](self, "shouldSkipPreparation"))
  {
    if (-[PUActivityItemSource shouldAnchorPreparation](self, "shouldAnchorPreparation"))
    {
      v5 = objc_alloc_init(PUActivityItemSourceAnchorOperation);
      anchorOperation = self->_anchorOperation;
      self->_anchorOperation = v5;

      v7 = self->_anchorOperation;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activityType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PUActivityItemSource _newOperationForActivityType:](self, "_newOperationForActivityType:", v9);

  }
  return v7;
}

- (id)_outboundResourcesDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateDirectoryWithSubType:createIfNeeded:error:", 2, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", self->_sharingUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_generateURLForType:(int64_t)a3 withPathExtension:(id)a4 preferredFilename:(id)a5
{
  id v8;
  id v9;
  id *p_assetOriginalFilenameBase;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSString *sharingUUID;
  const __CFString *v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSString *v25;
  PHAsset *asset;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  _BOOL4 v31;
  NSString *v32;
  void *v33;
  NSString *v34;
  void *v35;
  int v36;
  NSString *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  PHAsset *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  p_assetOriginalFilenameBase = (id *)&self->_assetOriginalFilenameBase;
  if (self->_assetOriginalFilenameBase)
    goto LABEL_10;
  -[PHAsset fetchPropertySetsIfNeeded](self->_asset, "fetchPropertySetsIfNeeded");
  -[PHAsset originalMetadataProperties](self->_asset, "originalMetadataProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "originalFilename");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    objc_msgSend(v12, "stringByDeletingPathExtension");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v9, "length"))
    {
      PLShareSheetGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        sharingUUID = self->_sharingUUID;
        v36 = 138543618;
        v37 = sharingUUID;
        v38 = 2114;
        v39 = (int64_t)v9;
        _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Asset does not have valid originalFilename, going with preferredFilename: %{public}@", (uint8_t *)&v36, 0x16u);
      }

      objc_storeStrong((id *)&self->_assetOriginalFilenameBase, a5);
      goto LABEL_9;
    }
    -[PHAsset filename](self->_asset, "filename");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    PLShareSheetGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (v31)
      {
        v32 = self->_sharingUUID;
        -[PHAsset filename](self->_asset, "filename");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v32;
        v38 = 2114;
        v39 = (int64_t)v33;
        _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Asset does not have valid originalFilename, going with library filename: %{public}@", (uint8_t *)&v36, 0x16u);

      }
      -[PHAsset filename](self->_asset, "filename");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v31)
      {
        v34 = self->_sharingUUID;
        -[PHAsset uuid](self->_asset, "uuid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v34;
        v38 = 2114;
        v39 = (int64_t)v35;
        _os_log_impl(&dword_1AAB61000, v30, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Asset does not have valid originalFilename, going with UUID: %{public}@", (uint8_t *)&v36, 0x16u);

      }
      -[PHAsset uuid](self->_asset, "uuid");
      v13 = objc_claimAutoreleasedReturnValue();
    }
  }
  v14 = *p_assetOriginalFilenameBase;
  *p_assetOriginalFilenameBase = (id)v13;

LABEL_9:
LABEL_10:
  if ((unint64_t)a3 <= 5
    && (((1 << a3) & 0x2D) == 0
      ? ((v18 = 0, a3 != 1)
       ? (v17 = CFSTR("Alternate"))
       : (v17 = CFSTR("Compatible")))
      : (const __CFString *)(v17 = 0, v18 = 1),
        objc_msgSend(*p_assetOriginalFilenameBase, "stringByAppendingPathExtension:", v8),
        (v19 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v20 = v19;
    -[PUActivityItemSource _outboundResourcesDirectoryURL](self, "_outboundResourcesDirectoryURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v21, "URLByAppendingPathComponent:", v17);
      v23 = objc_claimAutoreleasedReturnValue();

      v22 = (void *)v23;
    }
    objc_msgSend(v22, "URLByAppendingPathComponent:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PLShareSheetGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = self->_sharingUUID;
      asset = self->_asset;
      v36 = 138544386;
      v37 = v25;
      v38 = 2048;
      v39 = a3;
      v40 = 2114;
      v41 = v8;
      v42 = 2114;
      v43 = v9;
      v44 = 2114;
      v45 = asset;
      _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Could not generate a valid URL for a PUActivityItemSource resource type %ld, with path extension: %{public}@, preferred filename: %{public}@ for asset: %{public}@", (uint8_t *)&v36, 0x34u);
    }
    v24 = 0;
  }

  return v24;
}

- (BOOL)_copyResourceAtURL:(id)a3 toURL:(id)a4 shouldMove:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSString *v24;
  const char *v25;
  NSString *sharingUUID;
  int v27;
  BOOL v28;
  NSString *v29;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  NSString *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v5 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v13 = objc_msgSend(v12, "createDirectoryIfNeededAtPath:error:", v11, &v33);
  v14 = v33;

  if ((v13 & 1) == 0)
  {
    PLShareSheetGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      *(_DWORD *)buf = 138543874;
      v35 = sharingUUID;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v14;
      _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to create temporary outbound directory for sharing asset at %@: %@", buf, 0x20u);
    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "removeItemAtURL:error:", v9, 0);

  if (v16)
  {
    PLShareSheetGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = self->_sharingUUID;
      *(_DWORD *)buf = 138543618;
      v35 = v18;
      v36 = 2112;
      v37 = v9;
      _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Removed existing file at %@. This may indicate an error", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v5)
  {
    v32 = v14;
    v21 = objc_msgSend(v19, "moveItemAtURL:toURL:error:", v8, v9, &v32);
    v22 = v32;

    if ((v21 & 1) == 0)
    {
      PLShareSheetGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = self->_sharingUUID;
        *(_DWORD *)buf = 138544130;
        v35 = v24;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v9;
        v40 = 2112;
        v41 = v22;
        v25 = "[Item: %{public}@] Failed to move resource at %@ to %@: %@";
LABEL_16:
        _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_ERROR, v25, buf, 0x2Au);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  else
  {
    v31 = v14;
    v27 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v8, v9, &v31);
    v22 = v31;

    if ((v27 & 1) == 0)
    {
      PLShareSheetGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v29 = self->_sharingUUID;
        *(_DWORD *)buf = 138544130;
        v35 = v29;
        v36 = 2112;
        v37 = v8;
        v38 = 2112;
        v39 = v9;
        v40 = 2112;
        v41 = v22;
        v25 = "[Item: %{public}@] Failed to copy resource at %@ to %@: %@";
        goto LABEL_16;
      }
LABEL_17:
      v14 = v22;
LABEL_18:

      v28 = 0;
      v22 = v14;
      goto LABEL_19;
    }
  }
  v28 = 1;
LABEL_19:

  return v28;
}

- (id)_createManagedURLForResourceAtURL:(id)a3 shouldMove:(BOOL)a4 forType:(int64_t)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  NSString *sharingUUID;
  int v18;
  NSString *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v6 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUActivityItemSource _generateURLForType:withPathExtension:preferredFilename:](self, "_generateURLForType:withPathExtension:preferredFilename:", a5, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v8;
  if (-[PUActivityItemSource _copyResourceAtURL:toURL:shouldMove:](self, "_copyResourceAtURL:toURL:shouldMove:", v13, v12, v6))
  {
    v14 = v12;

  }
  else
  {
    PLShareSheetGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      v18 = 138544130;
      v19 = sharingUUID;
      v20 = 2112;
      v21 = v13;
      v22 = 2048;
      v23 = a5;
      v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Failed to clone the URL (%@) for type %lu to outgoing temp (%@). Falling back to original URL which may cause failures in clients", (uint8_t *)&v18, 0x2Au);
    }

    v14 = v13;
  }

  return v14;
}

- (id)_resourceURLForType:(int64_t)a3
{
  NSMutableDictionary *sharingURLs;
  void *v4;
  void *v5;

  sharingURLs = self->_sharingURLs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sharingURLs, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setResourceURL:(id)a3 forType:(int64_t)a4
{
  id v6;
  NSMutableDictionary *sharingURLs;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *sharingUUID;
  NSMutableDictionary *v12;
  void *v13;
  int v14;
  NSString *v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  sharingURLs = self->_sharingURLs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sharingURLs, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v9)
  {
    PLShareSheetGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      sharingUUID = self->_sharingUUID;
      v14 = 138544130;
      v15 = sharingUUID;
      v16 = 2048;
      v17 = a4;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Overwriting sharing URL of type: %lu from %@ to %@", (uint8_t *)&v14, 0x2Au);
    }

  }
  v12 = self->_sharingURLs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v6, v13);

}

- (void)cleanUpExportedFiles
{
  -[PUActivityItemSource cleanUpExportedFilesImmediately:](self, "cleanUpExportedFilesImmediately:", 0);
}

- (void)cleanUpExportedFilesImmediately:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSString *sharingUUID;
  NSString *v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD block[4];
  id v18;
  _QWORD aBlock[4];
  id v20;
  NSString *v21;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_sharingURLs, "removeAllObjects");
  -[PUActivityItemSource _outboundResourcesDirectoryURL](self, "_outboundResourcesDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sharingUUID = self->_sharingUUID;
      *(_DWORD *)buf = 138543362;
      v23 = sharingUUID;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Scheduling removal of exported files", buf, 0xCu);
    }

    v11 = self->_sharingUUID;
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke;
    aBlock[3] = &unk_1E58ABCA8;
    v20 = v5;
    v13 = v11;
    v21 = v13;
    v14 = _Block_copy(aBlock);
    v15 = v14;
    if (v3)
    {
      (*((void (**)(void *))v14 + 2))(v14);
    }
    else
    {
      dispatch_get_global_queue(9, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = v12;
      block[1] = 3221225472;
      block[2] = __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke_2;
      block[3] = &unk_1E58ABAC8;
      v18 = v15;
      dispatch_async(v16, block);

    }
  }

}

- (PHAsset)asset
{
  return self->_asset;
}

- ($9D9B13A340AA60ED2DD68408BD7D962F)sharingPreferences
{
  $3FD7B82E0D0D833B9D006DE3CA1215AC *p_sharingPreferences;
  uint64_t v3;
  int64_t preferredExportFormat;
  $9D9B13A340AA60ED2DD68408BD7D962F result;

  p_sharingPreferences = &self->_sharingPreferences;
  v3 = *(_QWORD *)&self->_sharingPreferences.excludeLiveness;
  preferredExportFormat = p_sharingPreferences->preferredExportFormat;
  result.var6 = preferredExportFormat;
  result.var0 = v3;
  result.var1 = BYTE1(v3);
  result.var2 = BYTE2(v3);
  result.var3 = BYTE3(v3);
  result.var4 = BYTE4(v3);
  result.var5 = BYTE5(v3);
  return result;
}

- (unint64_t)state
{
  return self->_state;
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 184, 1);
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 184);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 192, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (id)postCompletionHandler
{
  return objc_getProperty(self, a2, 200, 1);
}

- (void)setPostCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 200);
}

- (NSError)lastPreparationError
{
  return self->_lastPreparationError;
}

- (void)setLastPreparationError:(id)a3
{
  objc_storeStrong((id *)&self->_lastPreparationError, a3);
}

- (BOOL)shouldSendAnalyticsInterval
{
  return self->_shouldSendAnalyticsInterval;
}

- (void)setShouldSendAnalyticsInterval:(BOOL)a3
{
  self->_shouldSendAnalyticsInterval = a3;
}

- (BOOL)shouldSkipPreparation
{
  return self->_shouldSkipPreparation;
}

- (void)setShouldSkipPreparation:(BOOL)a3
{
  self->_shouldSkipPreparation = a3;
}

- (BOOL)shouldAnchorPreparation
{
  return self->_shouldAnchorPreparation;
}

- (void)setShouldAnchorPreparation:(BOOL)a3
{
  self->_shouldAnchorPreparation = a3;
}

- (PUActivityItemSourceConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (void)setExportConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_exportConfiguration, a3);
}

- (PHAssetExportRequest)_assetExportRequest
{
  return self->__assetExportRequest;
}

- (void)_setAssetExportRequest:(id)a3
{
  objc_storeStrong((id *)&self->__assetExportRequest, a3);
}

- (NSProgress)_exportProgress
{
  return self->__exportProgress;
}

- (id)_exportProgressHandler
{
  return self->__exportProgressHandler;
}

- (void)_setExportProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSItemProvider)_pasteboardItemProvider
{
  return (NSItemProvider *)objc_getProperty(self, a2, 248, 1);
}

- (void)set_pasteboardItemProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSURL)_assetsLibraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (void)_setAssetsLibraryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (OS_dispatch_queue)externalIsolation
{
  return self->_externalIsolation;
}

- (id)ppt_didFetchSharingVariantsHandler
{
  return objc_getProperty(self, a2, 280, 1);
}

- (void)setPpt_didFetchSharingVariantsHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ppt_didFetchSharingVariantsHandler, 0);
  objc_storeStrong((id *)&self->_externalIsolation, 0);
  objc_storeStrong((id *)&self->__assetsLibraryURL, 0);
  objc_storeStrong((id *)&self->__pasteboardItemProvider, 0);
  objc_storeStrong(&self->__exportProgressHandler, 0);
  objc_storeStrong((id *)&self->__exportProgress, 0);
  objc_storeStrong((id *)&self->__assetExportRequest, 0);
  objc_storeStrong((id *)&self->_exportConfiguration, 0);
  objc_storeStrong((id *)&self->_lastPreparationError, 0);
  objc_storeStrong(&self->_postCompletionHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_anchorOperation, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_assetOriginalFilenameBase, 0);
  objc_storeStrong((id *)&self->_sharingUUID, 0);
  objc_storeStrong((id *)&self->_sharingURLs, 0);
  objc_storeStrong((id *)&self->_onDemandExports, 0);
  objc_storeStrong((id *)&self->_fetchSharingVariantsSemaphore, 0);
  objc_storeStrong((id *)&self->_cachedSharingVariants, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

uint64_t __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke(uint64_t a1)
{
  return +[PUActivityItemSource _deleteOutputDirectoryURL:forSharingUUID:](PUActivityItemSource, "_deleteOutputDirectoryURL:forSharingUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __56__PUActivityItemSource_cleanUpExportedFilesImmediately___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_sharingErrorWithCode:underlyingError:localizedDescription:additionalInfo:", -103, 0, CFSTR("An instance of UIActivityViewController was not available."), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLShareSheetGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v8 = 138543874;
    v9 = v6;
    v10 = 2112;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Error %@: %@", (uint8_t *)&v8, 0x20u);
  }

  return v4;
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_140(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void (*v7)(void);
  _QWORD *v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = v4;
  if (!WeakRetained || !v4)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void (*)(void))v8[2];
LABEL_7:
    v7();

    goto LABEL_8;
  }
  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(WeakRetained, "activityViewController:itemForActivityType:", v4, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void (*)(void))v8[2];
    goto LABEL_7;
  }
  ((void (*)(_QWORD *, _QWORD, _QWORD))v8[2])(v8, *(_QWORD *)(a1 + 32), 0);
LABEL_8:

}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_144(uint64_t a1, void *a2, objc_class *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a2;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CD1618]);
    objc_msgSend(v6, "setDeliveryMode:", 1);
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2;
    v12[3] = &unk_1E589B1F0;
    v14 = v5;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v8, 0, v6, v12, *MEMORY[0x1E0CD1C28], *(double *)(MEMORY[0x1E0CD1C28] + 8));

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    NSStringFromClass(a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unexpected value class (%@)"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v11);
  }

}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_151(uint64_t a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void (**v19)(id, void *, _QWORD);
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_resourceURLForType:", 5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PLShareSheetGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0D750B8], "contentType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v21 = v9;
          v22 = 2114;
          v23 = v6;
          v24 = 2114;
          v25 = v10;
          _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Already have asset bundle at %{public}@ for item provider providing %{public}@", buf, 0x20u);

        }
        v3[2](v3, v6, 0);
      }
      else
      {
        if (v8)
        {
          v11 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0D750B8], "contentType");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v21 = v11;
          v22 = 2114;
          v23 = v12;
          _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: On-demand export required to generate asset bundle for item provider providing %{public}@", buf, 0x16u);

        }
        v13 = objc_alloc_init(MEMORY[0x1E0CD1418]);
        objc_msgSend(v13, "setVariant:", 1);
        objc_msgSend(v13, "setIncludeAllAssetResources:", 1);
        objc_msgSend(v13, "setShouldBundleComplexAssetResources:", 1);
        v14 = *(_QWORD *)(a1 + 40);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_153;
        v16[3] = &unk_1E589B240;
        v17 = v5;
        v18 = *(id *)(a1 + 32);
        v19 = v3;
        v15 = (id)objc_msgSend(v17, "_runOnDemandExportForAsset:withOptions:completionHandler:", v14, v13, v16);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }

  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_158(uint64_t a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_resourceURLForType:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v3[2](v3, v6, 0);
      }
      else
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_159;
        v10[3] = &unk_1E589B2E0;
        v11 = v5;
        v13 = v3;
        v12 = *(id *)(a1 + 48);
        v9 = (id)objc_msgSend(v11, "_runOnDemandSingleFileExportForAsset:withOptions:completionHandler:", v7, v8, v10);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }

  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_161(uint64_t a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_resourceURLForType:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v3[2](v3, v6, 0);
      }
      else
      {
        v7 = objc_alloc_init(MEMORY[0x1E0CD1418]);
        objc_msgSend(v7, "setVariant:", 2);
        objc_msgSend(v7, "setShouldStripLocation:", *(unsigned __int8 *)(a1 + 65));
        objc_msgSend(v7, "setShouldStripCaption:", *(unsigned __int8 *)(a1 + 66));
        objc_msgSend(v7, "setShouldStripAccessibilityDescription:", *(unsigned __int8 *)(a1 + 67));
        v8 = *(_QWORD *)(a1 + 32);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_162;
        v10[3] = &unk_1E589B2E0;
        v11 = v5;
        v13 = v3;
        v12 = *(id *)(a1 + 40);
        v9 = (id)objc_msgSend(v11, "_runOnDemandSingleFileExportForAsset:withOptions:completionHandler:", v8, v7, v10);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }

  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_163(uint64_t a1, void *a2)
{
  void (**v3)(id, void *, _QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);

  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_resourceURLForType:", 4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v3[2](v3, v6, 0);
      }
      else
      {
        v7 = objc_alloc_init(MEMORY[0x1E0CD1418]);
        objc_msgSend(v7, "setVariant:", 3);
        v8 = *(_QWORD *)(a1 + 32);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_164;
        v10[3] = &unk_1E589B2E0;
        v11 = v5;
        v13 = v3;
        v12 = *(id *)(a1 + 40);
        v9 = (id)objc_msgSend(v11, "_runOnDemandSingleFileExportForAsset:withOptions:completionHandler:", v8, v7, v10);

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v3)[2](v3, 0, v6);
    }

  }
}

id __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_168(uint64_t a1, void *a2)
{
  void (**v3)(id, id, _QWORD);
  NSObject *v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  void (**v20)(id, id, _QWORD);
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLShareSheetGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v22 = v5;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Providing original video resource as AVURLAsset", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_resourceURLForType:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PLShareSheetGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Original video resource already exists for AVURLAsset", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v8);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v3[2](v3, v12, 0);
        v13 = 0;
      }
      else
      {
        if (v10)
        {
          v14 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543362;
          v22 = v14;
          _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Original video resource doesn't exist for AVURLAsset, exporting...", buf, 0xCu);
        }

        v12 = objc_alloc_init(MEMORY[0x1E0CD1418]);
        objc_msgSend(v12, "setShouldStripLocation:", ((unint64_t)objc_msgSend(v7, "sharingPreferences") >> 8) & 1);
        objc_msgSend(v12, "setShouldStripCaption:", ((unint64_t)objc_msgSend(v7, "sharingPreferences") >> 16) & 1);
        objc_msgSend(v12, "setVariant:", 1);
        v15 = *(_QWORD *)(a1 + 40);
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_169;
        v17[3] = &unk_1E589B2E0;
        v18 = v7;
        v19 = *(id *)(a1 + 32);
        v20 = v3;
        objc_msgSend(v18, "_runOnDemandSingleFileExportForAsset:withOptions:completionHandler:", v15, v12, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, void *))v3)[2](v3, 0, v8);
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_171(uint64_t a1, void *a2)
{
  id *v3;
  void (**v4)(id, void *, _QWORD);
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && v5)
  {
    objc_msgSend(v5, "activity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_thumbnailSize");
    v9 = v8;
    v11 = v10;

    objc_msgSend(v6, "activityType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activityViewController:thumbnailImageDataForActivityType:suggestedSize:", v5, v12, v9, v11);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v14, 0);

    v4 = (void (**)(id, void *, _QWORD))v13;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v6);
  }

}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_169(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  NSObject *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createManagedURLForResourceAtURL:shouldMove:forType:", v5, 0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    PLShareSheetGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138543874;
      v13 = v9;
      v14 = 2114;
      v15 = v7;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Original video resource exported for AVURLAsset as %{public}@ from URL: %{public}@", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLShareSheetGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error providing original video resource as AVURLAsset: %{public}@", (uint8_t *)&v12, 0x16u);
    }
    v10 = 0;
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_164(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createManagedURLForResourceAtURL:shouldMove:forType:", a2, 0, 4);
    v6 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    if (!v5)
      goto LABEL_4;
    PLShareSheetGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from alternate-variant export request %@", (uint8_t *)&v8, 0x16u);
    }
  }

LABEL_4:
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_162(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createManagedURLForResourceAtURL:shouldMove:forType:", v7, 0, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v6)
  {
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from compatible-variant export request %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2_159(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createManagedURLForResourceAtURL:shouldMove:forType:", v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v6)
  {
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from current-variant export request %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1878]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createManagedURLForResourceAtURL:shouldMove:forType:", v7, 0, 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D750B8], "contentType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v10;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = (uint64_t)v11;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] NSItemProvider: Created asset bundle at %{public}@ for item provider providing %{public}@", (uint8_t *)&v17, 0x20u);

    }
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (v6)
  {
    PLShareSheetGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = objc_msgSend(v5, "count");
      objc_msgSend(v5, "allKeys");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR(", "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v13;
      v19 = 2112;
      v20 = v6;
      v21 = 2048;
      v22 = v14;
      v23 = 2114;
      v24 = v16;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "[Item: %{public}@] NSItemProvider: Error from export request %@. %lu file urls returned: [%{public}@]", (uint8_t *)&v17, 0x2Au);

    }
  }

}

void __71__PUActivityItemSource_activityViewControllerApplicationExtensionItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CD1BE8];
  v6 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  if (v7)
  {
    PLShareSheetGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Error fetching live photo %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

void __91__PUActivityItemSource__runOnDemandSingleFileExportForAsset_withOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, id, id);
  id v12;
  id v13;

  v5 = *MEMORY[0x1E0CD18B0];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B8]);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (!v8)
    v9 = v13;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void (**)(uint64_t, id, id))(v10 + 16);
  v12 = v8;
  v11(v10, v9, v6);

}

void __81__PUActivityItemSource__runOnDemandExportForAsset_withOptions_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "removeObject:", WeakRetained);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v5)
  {
    PLShareSheetGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Error on-demand export %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

void __95__PUActivityItemSource_activityViewController_thumbnailImageDataForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  NSObject *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  CGSize v25;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!v5)
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8]);
    v9 = objc_claimAutoreleasedReturnValue();
    PLShareSheetGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      goto LABEL_8;
    }
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    v18 = 138543618;
    v19 = v17;
    v20 = 2112;
    v21 = v9;
    v13 = "[Item: %{public}@] Error fetching thumbnail image data: %@";
    v14 = v11;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 22;
LABEL_6:
    _os_log_impl(&dword_1AAB61000, v14, v15, v13, (uint8_t *)&v18, v16);
    goto LABEL_7;
  }
  _UIImageJPEGRepresentation();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  PLShareSheetGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(v5, "size");
    NSStringFromCGSize(v25);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length");
    v18 = 138543874;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    v22 = 2050;
    v23 = v12;
    v13 = "[Item: %{public}@] Fetched thumbnail image of size %{public}@. (JPEG file size: %{public}lu bytes)";
    v14 = v9;
    v15 = OS_LOG_TYPE_DEFAULT;
    v16 = 32;
    goto LABEL_6;
  }
LABEL_8:

}

uint64_t __70__PUActivityItemSource_assetExportRequest_didChangeToState_fromState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32) == 3)
    v2 = 1;
  else
    v2 = 2;
  return objc_msgSend(a2, "setState:", v2);
}

void __71__PUActivityItemSource_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  char v7;

  objc_msgSend(*(id *)(a1 + 32), "_exportProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "fractionCompleted");
    if (v4 < 1.0)
    {
      v7 = 0;
      objc_msgSend(*(id *)(a1 + 32), "_exportProgressHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "_exportProgressHandler");
        v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fractionCompleted");
        ((void (**)(_QWORD, char *))v6)[2](v6, &v7);

        if (v7)
          objc_msgSend(v3, "cancel");
      }
    }
  }

}

void __101__PUActivityItemSource__fetchAlternateWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemAlternate", " enableTelemetry=YES ", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);

}

void __101__PUActivityItemSource__fetchLivePhotoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemLivePhoto", " enableTelemetry=YES ", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);

}

void __97__PUActivityItemSource__fetchVideoWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemVideo", " enableTelemetry=YES ", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);

}

void __97__PUActivityItemSource__fetchImageWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint8_t v13[16];

  v7 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 48);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v10, OS_SIGNPOST_INTERVAL_END, v11, "FetchItemImage", " enableTelemetry=YES ", v13, 2u);
  }

  v12 = *(_QWORD *)(a1 + 40);
  if (v12)
    (*(void (**)(uint64_t, id, id, uint64_t))(v12 + 16))(v12, v7, v8, a4);

}

void __103__PUActivityItemSource__runExportRequestWithOptions_forActivityType_progressHandler_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_stopObservingExportRequest");

  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!-[NSObject isEqualToString:](v8, "isEqualToString:", *MEMORY[0x1E0CD1880]))
    {
LABEL_6:

      goto LABEL_7;
    }
    v9 = objc_msgSend(v6, "code");

    if (v9 == 1)
    {
      PLShareSheetGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
        v11 = 138543362;
        v12 = v10;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] User cancelled during asset export.", (uint8_t *)&v11, 0xCu);
      }
      goto LABEL_6;
    }
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t v7;
  char v8;
  void *v9;

  if (a3 < 0.0 || a3 > 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("PUActivityItemSource.m"), 628, CFSTR("expect progress range"));

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 40), "pu_isCancelled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 40), "isCancelled") & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(double))(v7 + 16))(a3);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || (objc_msgSend(*(id *)(a1 + 40), "pu_isCancelled") & 1) != 0)
  {
    if (!a2)
      return;
    goto LABEL_14;
  }
  v8 = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
  if (a2 && (v8 & 1) != 0)
LABEL_14:
    *a2 = 1;
}

void __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_99(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)
    && (objc_msgSend(*(id *)(a1 + 32), "pu_isCancelled") & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v9 = objc_msgSend(*(id *)(a1 + 40), "simulateDownloadFailure");
    v10 = objc_msgSend(*(id *)(a1 + 40), "simulateCPLNotReadyError");
    v11 = objc_msgSend(*(id *)(a1 + 40), "simulateLowDiskSpaceError");
    v12 = objc_msgSend(*(id *)(a1 + 40), "simulateUserCloudNotAuthenticated");
    v13 = objc_msgSend(*(id *)(a1 + 40), "simulateSyndicatedResourceUnavailable");
    if (v9)
    {

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CD1880];
      v16 = CFSTR("Simulated download failure, for debugging.");
      v17 = 2;
    }
    else if (v10)
    {

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0D71C78];
      v16 = CFSTR("Simulated CPL Not ready error, for debugging.");
      v17 = 15;
    }
    else if (v11)
    {

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CD1880];
      v16 = CFSTR("Simulated low disk space error, for debugging.");
      v17 = 3;
    }
    else if (v12)
    {

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CD1880];
      v16 = CFSTR("Simulated \"user needs to review iCloud settings\" error, for debugging.");
      v17 = 4;
    }
    else
    {
      if (!v13)
        goto LABEL_15;

      v14 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CD1880];
      v16 = CFSTR("Simulated \"syndicated resource unavailable\" error, for debugging.");
      v17 = 5;
    }
    objc_msgSend(v14, "px_errorWithDomain:code:debugDescription:", v15, v17, v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (id)MEMORY[0x1E0C9AA70];
    v8 = (id)v18;
LABEL_15:
    PLShareSheetGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 136);
      v56 = 138543874;
      v57 = v20;
      v58 = 2048;
      v59 = objc_msgSend(v7, "count");
      v60 = 2112;
      v61 = v8;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Export Request completed with number of resource URLs: %ld, error: %@", (uint8_t *)&v56, 0x20u);
    }

    PLShareSheetGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v8)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 136);
        v56 = 138543618;
        v57 = v23;
        v58 = 2112;
        v59 = (uint64_t)v8;
        _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Preparation export error %@", (uint8_t *)&v56, 0x16u);
      }

      objc_msgSend(v8, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0CD1880];
      if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0CD1880]))
      {
        v26 = objc_msgSend(v8, "code");

        if (v26 == 2)
        {
          v27 = (void *)MEMORY[0x1E0CB35C8];
          v28 = *MEMORY[0x1E0D7BC40];
          v29 = CFSTR("Couldn't retrieve resource(s) for asset due to a network-related error.");
          v30 = -101;
LABEL_29:
          objc_msgSend(v27, "px_errorWithDomain:code:underlyingError:debugDescription:", v28, v30, v8, v29);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v22 = *(NSObject **)(v35 + 40);
          *(_QWORD *)(v35 + 40) = v34;
          goto LABEL_32;
        }
      }
      else
      {

      }
      objc_msgSend(v8, "domain");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v32, "isEqualToString:", v25))
      {
        v33 = objc_msgSend(v8, "code");

        if (v33 == 3)
        {
          v27 = (void *)MEMORY[0x1E0CB35C8];
          v28 = *MEMORY[0x1E0D7BC40];
          v29 = CFSTR("Couldn't retrieve resource(s) for asset due to low disk space.");
          v30 = -110;
          goto LABEL_29;
        }
      }
      else
      {

      }
      v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v37 = v8;
      v22 = *(NSObject **)(v36 + 40);
      *(_QWORD *)(v36 + 40) = v37;
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 136);
      v56 = 138543618;
      v57 = v31;
      v58 = 2114;
      v59 = (uint64_t)v7;
      _os_log_impl(&dword_1AAB61000, v22, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Retrieved resource urls: %{public}@", (uint8_t *)&v56, 0x16u);
    }
LABEL_32:

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B0]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD18B8]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1878]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1898]);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    if (a4 == 2)
    {
      v42 = 1;
    }
    else
    {
      if (a4 != 3)
        goto LABEL_37;
      v42 = 4;
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v42;
LABEL_37:
    if (v40)
    {
      objc_msgSend(*(id *)(a1 + 48), "_createManagedURLForResourceAtURL:shouldMove:forType:", v40, 0, 5);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "_setResourceURL:forType:", v43, 5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;

    }
    if (v41)
    {
      objc_msgSend(*(id *)(a1 + 48), "_createManagedURLForResourceAtURL:shouldMove:forType:", v41, 0, 3);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "_setResourceURL:forType:", v44, 3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;

    }
    if (!v38)
    {
      if (v39)
      {
        objc_msgSend(*(id *)(a1 + 48), "_createManagedURLForResourceAtURL:shouldMove:forType:", v39, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "_setResourceURL:forType:", v45, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      }
      else
      {
        PLShareSheetGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 136);
          v49 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
          v56 = 138543618;
          v57 = v48;
          v58 = 2112;
          v59 = v49;
          _os_log_impl(&dword_1AAB61000, v47, OS_LOG_TYPE_ERROR, "[Item: %{public}@] Unable to fetch any primary resource with error %@", (uint8_t *)&v56, 0x16u);
        }

        v50 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v51 = *(void **)(v50 + 40);
        if (v51)
        {
          v52 = v51;
          v45 = *(void **)(v50 + 40);
          *(_QWORD *)(v50 + 40) = v52;
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "_sharingErrorWithCode:underlyingError:localizedDescription:additionalInfo:", -100, 0, CFSTR("No primary resources found with no error"), 0);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v45 = *(void **)(v55 + 40);
          *(_QWORD *)(v55 + 40) = v54;
        }
      }
      goto LABEL_56;
    }
    objc_msgSend(*(id *)(a1 + 48), "_createManagedURLForResourceAtURL:shouldMove:forType:", v38, 0, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_setResourceURL:forType:", v45, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
    v46 = 0;
    if (!*(_BYTE *)(a1 + 112))
    {
      if (*(_BYTE *)(a1 + 113))
      {
        v46 = 0;
      }
      else
      {
        if (!*(_BYTE *)(a1 + 114))
        {
LABEL_56:

          goto LABEL_57;
        }
        v46 = *(_BYTE *)(a1 + 96) != 0;
      }
    }
    if (v39 && !v46)
    {
      objc_msgSend(*(id *)(a1 + 48), "_createManagedURLForResourceAtURL:shouldMove:forType:", v39, 0, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "_setResourceURL:forType:", v53, 2);

    }
    goto LABEL_56;
  }
LABEL_57:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

uint64_t __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_122(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 0);
}

uint64_t __79__PUActivityItemSource_activityItemSourceOperation_prepareItemForActivityType___block_invoke_117(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setState:", 2);
}

uint64_t __46__PUActivityItemSource_setSharingPreferences___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if (result)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    v10 = objc_msgSend(*(id *)(a1 + 32), "state");
    if (v10 > 2)
      v11 = CFSTR("unknown");
    else
      v11 = off_1E589B370[v10];
    v12 = v11;
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Attempted to set sharing preferences while activity item source's state was %@"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v13, 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v3 = *(_QWORD *)(a1 + 40) ^ *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288);
  if ((v3 & 0x101010101) != 0
    || (v3 & 0x10000000000) != 0
    || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) != *(_QWORD *)(a1 + 48))
  {
    PLShareSheetGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(v5 + 136);
      PUActivityItemSharingPreferencesDescription(*(_QWORD *)(v5 + 288));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      PUActivityItemSharingPreferencesDescription(*(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Changing sharing preferences from\n%{public}@ to\n%{public}@", buf, 0x20u);

    }
    *(_OWORD *)(*(_QWORD *)(a1 + 32) + 288) = *(_OWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "_resetState");
    return objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
  }
  return result;
}

uint64_t __33__PUActivityItemSource_setState___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  unint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 176) != *(_QWORD *)(result + 40))
  {
    v1 = result;
    PLShareSheetGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(v1 + 32);
      v4 = *(_QWORD *)(v3 + 176);
      if (v4 > 2)
        v5 = CFSTR("unknown");
      else
        v5 = off_1E589B370[v4];
      v6 = *(_QWORD *)(v3 + 136);
      v7 = *(_QWORD *)(v1 + 40);
      if (v7 > 2)
        v8 = CFSTR("unknown");
      else
        v8 = off_1E589B370[v7];
      v9 = 138543874;
      v10 = v6;
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1AAB61000, v2, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Changing state from %{public}@ to %{public}@", (uint8_t *)&v9, 0x20u);
    }

    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 176) = *(_QWORD *)(v1 + 40);
    return objc_msgSend(*(id *)(v1 + 32), "signalChange:", 1);
  }
  return result;
}

uint64_t __65__PUActivityItemSource__activityOperationQueueForExplicitRunning__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)_activityOperationQueueForExplicitRunning_activityOperationQueue;
  _activityOperationQueueForExplicitRunning_activityOperationQueue = (uint64_t)v0;

  return objc_msgSend((id)_activityOperationQueueForExplicitRunning_activityOperationQueue, "setMaxConcurrentOperationCount:", 3);
}

void __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke(uint64_t a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.PUActivityItemSource.fetchSharingVariants", *(dispatch_queue_attr_t *)(a1 + 32));
  v2 = (void *)initWithAsset_sharingPreferences___fetchSharingVariantsSerialQueue;
  initWithAsset_sharingPreferences___fetchSharingVariantsSerialQueue = (uint64_t)v1;

}

void __57__PUActivityItemSource_initWithAsset_sharingPreferences___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchSharingVariants");

}

+ (BOOL)supportsAssetLocalIdentifierForActivityType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7BDE8]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D7BCD8]);

  return v4;
}

+ (id)_sharingErrorWithCode:(int64_t)a3 underlyingError:(id)a4 localizedDescription:(id)a5 additionalInfo:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
    objc_msgSend(v12, "setObject:forKey:", v9, *MEMORY[0x1E0CB3388]);
  if (v10)
    objc_msgSend(v13, "setObject:forKey:", v10, *MEMORY[0x1E0CB2D50]);
  if (v11)
    objc_msgSend(v13, "addEntriesFromDictionary:", v11);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D7BC40], a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_exportResultHandlingQueue
{
  if (_exportResultHandlingQueue_onceToken != -1)
    dispatch_once(&_exportResultHandlingQueue_onceToken, &__block_literal_global_3197);
  return (id)_exportResultHandlingQueue_resultHandlingQueue;
}

+ (id)_basicTypeIdentifierForAsset:(id)a3
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "mediaType");
  v5 = (id *)MEMORY[0x1E0CEC568];
  switch(v4)
  {
    case 0:
      v5 = (id *)MEMORY[0x1E0CEC4A0];
      goto LABEL_8;
    case 1:
      if (!objc_msgSend(v3, "canPlayLoopingVideo"))
        v5 = (id *)MEMORY[0x1E0CEC520];
      goto LABEL_8;
    case 2:
      goto LABEL_8;
    case 3:
      v5 = (id *)MEMORY[0x1E0CEC450];
LABEL_8:
      objc_msgSend(*v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

+ (void)_deleteOutputDirectoryURL:(id)a3 forSharingUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v5, &v19);
  v9 = v19;

  if (!v8)
  {
    objc_msgSend(v9, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject domain](v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v13 = -[NSObject code](v10, "code");

      if (v13 == 2)
      {
        PLShareSheetGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v6;
          v15 = "[Item: %{public}@] Outbound resources directory was not created or was already deleted, so no exported f"
                "iles to clean up";
          v16 = v14;
          v17 = OS_LOG_TYPE_DEFAULT;
          v18 = 12;
LABEL_11:
          _os_log_impl(&dword_1AAB61000, v16, v17, v15, buf, v18);
          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else
    {

    }
    PLShareSheetGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v6;
      v22 = 2114;
      v23 = v9;
      v15 = "[Item: %{public}@] Failed to clean up outbound resources directory: %{public}@";
      v16 = v14;
      v17 = OS_LOG_TYPE_ERROR;
      v18 = 22;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  PLShareSheetGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "[Item: %{public}@] Cleaned up outbound resources directory: %{public}@", buf, 0x16u);
  }
LABEL_13:

}

+ (OS_os_log)activityItemSourceLog
{
  if (activityItemSourceLog_onceToken != -1)
    dispatch_once(&activityItemSourceLog_onceToken, &__block_literal_global_182);
  return (OS_os_log *)(id)activityItemSourceLog_activityItemSourceLog;
}

void __45__PUActivityItemSource_activityItemSourceLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "ActivityItemSource");
  v1 = (void *)activityItemSourceLog_activityItemSourceLog;
  activityItemSourceLog_activityItemSourceLog = (uint64_t)v0;

}

void __50__PUActivityItemSource__exportResultHandlingQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("PUActivityItemSource.resultHandlingQueue", attr);
  v2 = (void *)_exportResultHandlingQueue_resultHandlingQueue;
  _exportResultHandlingQueue_resultHandlingQueue = (uint64_t)v1;

}

@end
