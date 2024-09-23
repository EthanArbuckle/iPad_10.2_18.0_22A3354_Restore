@implementation PXPhotoKitAssetLocalAvailabilityHelper

- (PXPhotoKitAssetLocalAvailabilityHelper)initWithAssets:(id)a3 treatLivePhotoAsStill:(BOOL)a4
{
  id v7;
  PXPhotoKitAssetLocalAvailabilityHelper *v8;
  PXPhotoKitAssetLocalAvailabilityHelper *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPhotoKitAssetLocalAvailabilityHelper;
  v8 = -[PXPhotoKitAssetLocalAvailabilityHelper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_assets, a3);
    v9->_treatLivePhotoAsStill = a4;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PXPhotoKitAssetLocalAvailabilityHelper setLocalAvailabilityProgress:](self, "setLocalAvailabilityProgress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitAssetLocalAvailabilityHelper;
  -[PXPhotoKitAssetLocalAvailabilityHelper dealloc](&v3, sel_dealloc);
}

- (id)ensureLocalAvailabilityOfAssetsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *workQueue;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[16];

  v4 = a3;
  if (self->_localAvailabilityProgress)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "PXPhotoKitAssetLocalAvailabilityHelper: Attempted to use local availability helper as it's already in progress.", buf, 2u);
    }

  }
  self->_wasInterrupted = 0;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (OS_dispatch_queue *)dispatch_queue_create("PXPhotoKitAssetLocalAvailabilityHelper", v6);
  workQueue = self->_workQueue;
  self->_workQueue = v7;

  -[PXPhotoKitAssetLocalAvailabilityHelper _setUpLocalAvailabilityRequests](self, "_setUpLocalAvailabilityRequests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_workQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E5148CE0;
  v13[4] = self;
  v14 = v4;
  v11 = v4;
  dispatch_async(v10, v13);

  return v9;
}

- (void)setLocalAvailabilityProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *v6;
  char v7;
  NSProgress *v8;

  v8 = (NSProgress *)a3;
  v5 = self->_localAvailabilityProgress;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSProgress isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      -[NSProgress removeObserver:forKeyPath:](self->_localAvailabilityProgress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
      -[NSProgress removeObserver:forKeyPath:](self->_localAvailabilityProgress, "removeObserver:forKeyPath:", self, CFSTR("cancelled"));
      objc_storeStrong((id *)&self->_localAvailabilityProgress, a3);
      -[NSProgress addObserver:forKeyPath:options:context:](self->_localAvailabilityProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 4, &PXPhotoKitAssetLocalAvailabilityHelperFractionCompletedContext);
      -[NSProgress addObserver:forKeyPath:options:context:](self->_localAvailabilityProgress, "addObserver:forKeyPath:options:context:", self, CFSTR("cancelled"), 4, &PXPhotoKitAssetLocalAvailabilityHelperIsCancelledContext);
    }
  }

}

- (id)_setUpLocalAvailabilityRequests
{
  id v3;
  NSMutableArray *v4;
  NSMutableArray *pinnedResourceLocalAvailabilityRequests;
  NSMutableArray *v6;
  NSMutableArray *resourceLocalAvailabilityRequests;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSMutableArray *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CD1748]);
  objc_msgSend(v3, "setTreatLivePhotoAsStill:", -[PXPhotoKitAssetLocalAvailabilityHelper treatLivePhotoAsStill](self, "treatLivePhotoAsStill"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pinnedResourceLocalAvailabilityRequests = self->_pinnedResourceLocalAvailabilityRequests;
  self->_pinnedResourceLocalAvailabilityRequests = v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  resourceLocalAvailabilityRequests = self->_resourceLocalAvailabilityRequests;
  self->_resourceLocalAvailabilityRequests = v6;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[PXPhotoKitAssetLocalAvailabilityHelper assets](self, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1740]), "initWithAsset:requestType:", v13, 2);
        -[NSMutableArray addObject:](self->_pinnedResourceLocalAvailabilityRequests, "addObject:", v14);
        v15 = objc_msgSend(v14, "resourceAvailabilityForOptions:resourceInfo:", v3, 0);
        PLUIGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
        if (v15)
        {
          if (v17)
          {
            objc_msgSend(v13, "localIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v18;
            _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: [Queued] Resources need retrieval for %@", buf, 0xCu);

          }
          -[NSMutableArray addObject:](self->_resourceLocalAvailabilityRequests, "addObject:", v14);
        }
        else
        {
          if (v17)
          {
            objc_msgSend(v13, "localIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v35 = (uint64_t)v19;
            _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: [Skipped] Resources already available for %@", buf, 0xCu);

          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    }
    while (v10);
  }

  PLUIGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = -[NSMutableArray count](self->_resourceLocalAvailabilityRequests, "count");
    -[PXPhotoKitAssetLocalAvailabilityHelper assets](self, "assets");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134218240;
    v35 = v21;
    v36 = 2048;
    v37 = v23;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: %tu / %tu assets need to have their resource retrieved.", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", -[NSMutableArray count](self->_resourceLocalAvailabilityRequests, "count"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = self->_resourceLocalAvailabilityRequests;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __73__PXPhotoKitAssetLocalAvailabilityHelper__setUpLocalAvailabilityRequests__block_invoke;
  v28[3] = &unk_1E5131DA0;
  v26 = v24;
  v29 = v26;
  -[NSMutableArray enumerateObjectsUsingBlock:](v25, "enumerateObjectsUsingBlock:", v28);
  -[PXPhotoKitAssetLocalAvailabilityHelper setLocalAvailabilityProgress:](self, "setLocalAvailabilityProgress:", v26);

  return v26;
}

- (unint64_t)_ensureAssetsAreLocallyAvailable:(id *)a3
{
  id v5;
  dispatch_group_t v6;
  NSMutableArray *resourceLocalAvailabilityRequests;
  NSObject *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  NSObject *v18;
  PXPhotoKitAssetLocalAvailabilityHelper *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = objc_alloc_init(MEMORY[0x1E0CD1748]);
  objc_msgSend(v5, "setTreatLivePhotoAsStill:", -[PXPhotoKitAssetLocalAvailabilityHelper treatLivePhotoAsStill](self, "treatLivePhotoAsStill"));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__176915;
  v26 = __Block_byref_object_dispose__176916;
  v27 = 0;
  v6 = dispatch_group_create();
  resourceLocalAvailabilityRequests = self->_resourceLocalAvailabilityRequests;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke;
  v17 = &unk_1E5131DF0;
  v8 = v6;
  v18 = v8;
  v19 = self;
  v9 = v5;
  v20 = v9;
  v21 = &v22;
  -[NSMutableArray enumerateObjectsUsingBlock:](resourceLocalAvailabilityRequests, "enumerateObjectsUsingBlock:", &v14);
  if (-[PXPhotoKitAssetLocalAvailabilityHelper wasInterrupted](self, "wasInterrupted", v14, v15, v16, v17))
  {
    -[PXPhotoKitAssetLocalAvailabilityHelper localAvailabilityProgress](self, "localAvailabilityProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancel");

    v11 = 2;
  }
  else
  {
    v12 = (void *)v23[5];
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }
  }

  _Block_object_dispose(&v22, 8);
  return v11;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  NSObject *v23;
  objc_super v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &PXPhotoKitAssetLocalAvailabilityHelperFractionCompletedContext)
  {
    -[PXPhotoKitAssetLocalAvailabilityHelper localAvailabilityProgress](self, "localAvailabilityProgress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "isEqual:", v13);

    if (v14)
    {
      -[PXPhotoKitAssetLocalAvailabilityHelper localAvailabilityProgress](self, "localAvailabilityProgress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fractionCompleted");
      v17 = v16;

      PLUIGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v26 = v17;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: Fraction completed: %f", buf, 0xCu);
      }

    }
  }
  else if (a6 == &PXPhotoKitAssetLocalAvailabilityHelperIsCancelledContext)
  {
    -[PXPhotoKitAssetLocalAvailabilityHelper localAvailabilityProgress](self, "localAvailabilityProgress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "isEqual:", v19);

    if (v20)
    {
      -[PXPhotoKitAssetLocalAvailabilityHelper localAvailabilityProgress](self, "localAvailabilityProgress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isCancelled");

      if (v22)
      {
        PLUIGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_INFO, "PXPhotoKitAssetLocalAvailabilityHelper: Action was cancelled", buf, 2u);
        }

        self->_wasInterrupted = 1;
      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)PXPhotoKitAssetLocalAvailabilityHelper;
    -[PXPhotoKitAssetLocalAvailabilityHelper observeValueForKeyPath:ofObject:change:context:](&v24, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (PXFastEnumeration)assets
{
  return self->_assets;
}

- (BOOL)treatLivePhotoAsStill
{
  return self->_treatLivePhotoAsStill;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (BOOL)wasInterrupted
{
  return self->_wasInterrupted;
}

- (NSMutableArray)pinnedResourceLocalAvailabilityRequests
{
  return self->_pinnedResourceLocalAvailabilityRequests;
}

- (NSMutableArray)resourceLocalAvailabilityRequests
{
  return self->_resourceLocalAvailabilityRequests;
}

- (PHResourceLocalAvailabilityRequest)currentResourceRequest
{
  return self->_currentResourceRequest;
}

- (NSProgress)overallProgress
{
  return self->_overallProgress;
}

- (NSProgress)localAvailabilityProgress
{
  return self->_localAvailabilityProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAvailabilityProgress, 0);
  objc_storeStrong((id *)&self->_overallProgress, 0);
  objc_storeStrong((id *)&self->_currentResourceRequest, 0);
  objc_storeStrong((id *)&self->_resourceLocalAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_pinnedResourceLocalAvailabilityRequests, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int, int, void *, void *);
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  _BYTE *v20;

  v7 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), a2);
  v8 = *(_QWORD *)(a1 + 48);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke_2;
  v16 = &unk_1E5131DC8;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 56);
  v17 = v9;
  v19 = v10;
  v20 = a4;
  v18 = *(id *)(a1 + 32);
  objc_msgSend(v9, "retrieveRequiredResourcesWithOptions:completionHandler:", v8, &v13);
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(v11 + 48);
  *(_QWORD *)(v11 + 48) = 0;

  if (objc_msgSend(*(id *)(a1 + 40), "wasInterrupted", v13, v14, v15, v16))
    *a4 = 1;

}

void __75__PXPhotoKitAssetLocalAvailabilityHelper__ensureAssetsAreLocallyAvailable___block_invoke_2(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v9;
      v14 = "PXPhotoKitAssetLocalAvailabilityHelper: Asset %@ retrieval succeeded: %@";
LABEL_7:
      v15 = v13;
      v16 = OS_LOG_TYPE_INFO;
LABEL_8:
      _os_log_impl(&dword_1A6789000, v15, v16, v14, (uint8_t *)&v17, 0x16u);
    }
  }
  else if (a3)
  {
    **(_BYTE **)(a1 + 56) = 1;
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v9;
      v14 = "PXPhotoKitAssetLocalAvailabilityHelper: Asset %@ retrieval cancelled: %@";
      goto LABEL_7;
    }
  }
  else
  {
    if (!v10)
      goto LABEL_10;
    **(_BYTE **)(a1 + 56) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a5);
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412546;
      v18 = v12;
      v19 = 2112;
      v20 = v10;
      v14 = "PXPhotoKitAssetLocalAvailabilityHelper: Asset %@ retrieval failed with error: %@.";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
  }

LABEL_10:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __73__PXPhotoKitAssetLocalAvailabilityHelper__setUpLocalAvailabilityRequests__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "progress");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addChild:withPendingUnitCount:", v3, 1);

}

void __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v13 = 0;
  v3 = objc_msgSend(v2, "_ensureAssetsAreLocallyAvailable:", &v13);
  v4 = v13;
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E513A6B0;
    v12 = v3;
    v11 = v5;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __95__PXPhotoKitAssetLocalAvailabilityHelper_ensureLocalAvailabilityOfAssetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(void);

  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 2:
      v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_7;
    case 1:
      v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
      goto LABEL_7;
    case 0:
      v3 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_7:
      v3();
      break;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setLocalAvailabilityProgress:", 0);
}

@end
