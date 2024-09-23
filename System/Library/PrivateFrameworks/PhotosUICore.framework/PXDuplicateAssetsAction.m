@implementation PXDuplicateAssetsAction

- (PXDuplicateAssetsAction)initWithSelectionSnapshot:(id)a3
{
  PXDuplicateAssetsAction *v3;
  NSMutableArray *v4;
  NSMutableArray *assetsToDuplicate;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXDuplicateAssetsAction;
  v3 = -[PXAssetsSelectionAction initWithSelectionSnapshot:](&v8, sel_initWithSelectionSnapshot_, a3);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetsToDuplicate = v3->_assetsToDuplicate;
    v3->_assetsToDuplicate = v4;

    v6 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v3->_stillImageTime.value = *MEMORY[0x1E0CA2E18];
    v3->_stillImageTime.epoch = *(_QWORD *)(v6 + 16);
  }
  return v3;
}

- (PXDuplicateAssetsAction)initWithAssets:(id)a3 assetCollection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PXDuplicateAssetsAction *v11;
  uint64_t v12;
  NSMutableArray *assetsInput;
  PXDuplicateAssetsAction *v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXPhotosAction initWithPhotoLibrary:](self, "initWithPhotoLibrary:", v10);

    if (v11)
    {
      v12 = objc_msgSend(v6, "copy");
      assetsInput = v11->_assetsInput;
      v11->_assetsInput = (NSMutableArray *)v12;

      objc_storeStrong((id *)&v11->_collectionInput, a4);
    }
    self = v11;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_checkDuplicateCapabilities
{
  void *v3;
  int64_t v4;
  char v5;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  if (!self->_didCheckDuplicateCapabilities)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 1;
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 1;
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    -[PXAssetsSelectionAction selectedAssets](self, "selectedAssets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __54__PXDuplicateAssetsAction__checkDuplicateCapabilities__block_invoke;
      v6[3] = &unk_1E5140D50;
      v6[4] = self;
      v6[5] = &v15;
      v6[6] = &v7;
      v6[7] = &v11;
      -[PXAssetsSelectionAction enumerateSelectedAssetIndexSetsUsingBlock:](self, "enumerateSelectedAssetIndexSetsUsingBlock:", v6);
      v4 = v8[3];
    }
    else
    {
      -[PXDuplicateAssetsAction processWithAssets:assetCollection:canDuplicate:canExtractStill:](self, "processWithAssets:assetCollection:canDuplicate:canExtractStill:", self->_assetsInput, 0, v16 + 3, v12 + 3);
      v4 = -[NSMutableArray count](self->_assetsInput, "count");
      v8[3] = v4;
    }
    self->_assetCount = v4;
    v5 = *((_BYTE *)v12 + 24);
    if (v5)
      v5 = *((_BYTE *)v16 + 24) != 0;
    self->_canExtractStill = v5;
    self->_didCheckDuplicateCapabilities = 1;
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v15, 8);
  }
}

- (void)processWithAssets:(id)a3 assetCollection:(id)a4 canDuplicate:(BOOL *)a5 canExtractStill:(BOOL *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  int v20;
  char v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v10;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        *a5 = objc_msgSend((id)objc_opt_class(), "canPerformOnAsset:inAssetCollection:", v16, v11);
        v17 = objc_msgSend(v16, "playbackStyle");
        v18 = objc_msgSend(v16, "playbackVariation");
        v19 = *a6;
        if (*a6)
        {
          v20 = v18;
          v21 = objc_msgSend(v16, "isPhotoIris");
          if (v17 == 5)
            v19 = 0;
          else
            v19 = v21;
          if (v20 == 3)
            v19 = 0;
        }
        *a6 = v19;
        -[NSMutableArray addObject:](self->_assetsToDuplicate, "addObject:", v16);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

- (int64_t)assetCount
{
  -[PXDuplicateAssetsAction _checkDuplicateCapabilities](self, "_checkDuplicateCapabilities");
  return self->_assetCount;
}

- (BOOL)canExtractStill
{
  -[PXDuplicateAssetsAction _checkDuplicateCapabilities](self, "_checkDuplicateCapabilities");
  return self->_canExtractStill;
}

- (void)setDuplicatesOriginal:(BOOL)a3
{
  void *v6;

  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDuplicateAssetsAction.m"), 142, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXDuplicateAssetsAction setDuplicatesOriginal:]");

  }
  self->_duplicatesOriginal = a3;
}

- (void)setDuplicatesAsStill:(BOOL)a3
{
  void *v6;

  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDuplicateAssetsAction.m"), 147, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXDuplicateAssetsAction setDuplicatesAsStill:]");

  }
  self->_duplicatesAsStill = a3;
}

- (void)setStillImageTime:(id *)a3
{
  int64_t var3;
  void *v7;

  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDuplicateAssetsAction.m"), 152, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXDuplicateAssetsAction setStillImageTime:]");

  }
  var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.epoch = var3;
}

- (void)setActionProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *actionProgress;
  void *v7;

  v5 = (NSProgress *)a3;
  if (-[PXAction executionStarted](self, "executionStarted"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDuplicateAssetsAction.m"), 157, CFSTR("%s cannot be called after the receiver has started executing."), "-[PXDuplicateAssetsAction setActionProgress:]");

  }
  actionProgress = self->_actionProgress;
  self->_actionProgress = v5;

}

- (void)setDownloadCompletionHandler:(id)a3
{
  void *v4;
  id downloadCompletionHandler;

  v4 = (void *)objc_msgSend(a3, "copy");
  downloadCompletionHandler = self->_downloadCompletionHandler;
  self->_downloadCompletionHandler = v4;

}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXDuplicateActionName");
}

- (void)performAction:(id)a3
{
  id v4;
  PXPhotoKitAssetLocalAvailabilityHelper *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  v5 = -[PXPhotoKitAssetLocalAvailabilityHelper initWithAssets:treatLivePhotoAsStill:]([PXPhotoKitAssetLocalAvailabilityHelper alloc], "initWithAssets:treatLivePhotoAsStill:", self->_assetsToDuplicate, self->_duplicatesAsStill);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke;
  v12[3] = &unk_1E5146918;
  v12[4] = self;
  v13 = v6;
  v14 = v4;
  v7 = v4;
  v8 = v6;
  -[PXPhotoKitAssetLocalAvailabilityHelper ensureLocalAvailabilityOfAssetsWithCompletionHandler:](v5, "ensureLocalAvailabilityOfAssetsWithCompletionHandler:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXDuplicateAssetsAction assetCount](self, "assetCount");
  -[PXDuplicateAssetsAction actionProgress](self, "actionProgress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTotalUnitCount:", 100 * v10);
  objc_msgSend(v11, "addChild:withPendingUnitCount:", v9, 75 * v10);
  objc_msgSend(v11, "addChild:withPendingUnitCount:", v8, 25 * v10);

}

- (id)processDuplicateActionWithAssets:(id)a3 assetCollection:(id)a4 assetsInAssetCollection:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  int64_t epoch;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  v10 = objc_opt_new();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = v8;
  v12 = v9;
  v13 = (void *)v10;
  obj = v11;
  v35 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v35)
  {
    v14 = 0x1E0CD1000uLL;
    v34 = *(_QWORD *)v39;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
        v17 = objc_alloc_init(*(Class *)(v14 + 1016));
        objc_msgSend(v17, "setCopyOriginal:", self->_duplicatesOriginal);
        objc_msgSend(v16, "burstIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCopySinglePhotoFromBurst:", v18 != 0);

        objc_msgSend(v17, "setCopyStillPhotoFromLivePhoto:", self->_duplicatesAsStill);
        v36 = *(_OWORD *)&self->_stillImageTime.value;
        epoch = self->_stillImageTime.epoch;
        objc_msgSend(v17, "setStillSourceTime:", &v36);
        objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetCopyFromAsset:options:", v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "placeholderForCreatedAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v21);

        if (v19 && objc_msgSend(v12, "canPerformEditOperation:", 3))
        {
          v22 = v13;
          v23 = objc_msgSend(v32, "indexOfObject:", v16);
          v24 = v23 + 1;
          if (v23 == 0x7FFFFFFFFFFFFFFELL)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDuplicateAssetsAction.m"), 238, CFSTR("The asset being duplicated should be in the assetCollection"));

          }
          objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v20;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
          v26 = v12;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "insertAssets:atIndexes:", v27, v28);

          v12 = v26;
          v13 = v22;
          v14 = 0x1E0CD1000;
        }

        ++v15;
      }
      while (v35 != v15);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v35);
  }

  return v13;
}

- (void)performUndo:(id)a3
{
  void *v4;
  NSArray *createdAssetLocalIdentifiers;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSArray *v11;
  PHFetchResult *assetsCreated;
  id v13;

  v4 = (void *)MEMORY[0x1E0CD1390];
  createdAssetLocalIdentifiers = self->_createdAssetLocalIdentifiers;
  v6 = a3;
  -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchAssetsWithLocalIdentifiers:options:", createdAssetLocalIdentifiers, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0CD1408]);
  objc_msgSend(v8, "setExpungeSource:", 4);
  v9 = (void *)MEMORY[0x1E0CD13B0];
  -[PXPhotosAction photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBatchExpungeWithAssets:deleteOptions:photoLibrary:completionHandler:", v13, v8, v10, v6);

  v11 = self->_createdAssetLocalIdentifiers;
  self->_createdAssetLocalIdentifiers = 0;

  assetsCreated = self->_assetsCreated;
  self->_assetsCreated = 0;

}

- (PHFetchResult)createdAssets
{
  void *v3;
  NSArray *createdAssetLocalIdentifiers;
  void *v5;
  PHFetchResult *v6;
  PHFetchResult *assetsCreated;

  if (!self->_assetsCreated && -[NSArray count](self->_createdAssetLocalIdentifiers, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CD1390];
    createdAssetLocalIdentifiers = self->_createdAssetLocalIdentifiers;
    -[PXPhotosAction standardFetchOptions](self, "standardFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fetchAssetsWithLocalIdentifiers:options:", createdAssetLocalIdentifiers, v5);
    v6 = (PHFetchResult *)objc_claimAutoreleasedReturnValue();
    assetsCreated = self->_assetsCreated;
    self->_assetsCreated = v6;

  }
  return self->_assetsCreated;
}

- (BOOL)duplicatesOriginal
{
  return self->_duplicatesOriginal;
}

- (BOOL)duplicatesAsStill
{
  return self->_duplicatesAsStill;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (NSProgress)actionProgress
{
  return self->_actionProgress;
}

- (id)downloadCompletionHandler
{
  return self->_downloadCompletionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_downloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_actionProgress, 0);
  objc_storeStrong((id *)&self->_collectionInput, 0);
  objc_storeStrong((id *)&self->_assetsInput, 0);
  objc_storeStrong((id *)&self->_assetsCreated, 0);
  objc_storeStrong((id *)&self->_createdAssetLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_assetsToDuplicate, 0);
}

void __41__PXDuplicateAssetsAction_performAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  const void *v6;
  unsigned int (**v7)(void *, _QWORD, id);
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];

  v5 = a3;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168))
    v6 = *(const void **)(*(_QWORD *)(a1 + 32) + 168);
  else
    v6 = &__block_literal_global_258753;
  v7 = (unsigned int (**)(void *, _QWORD, id))_Block_copy(v6);
  if (v7[2](v7, a2, v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke_3;
    v13[3] = &unk_1E5149198;
    v9 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke_3_142;
    v10[3] = &unk_1E5148348;
    v11 = v9;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "performChanges:completionHandler:", v13, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__258754;
  v11 = __Block_byref_object_dispose__258755;
  v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __41__PXDuplicateAssetsAction_performAction___block_invoke_139;
    v6[3] = &unk_1E5140DB8;
    v6[4] = v3;
    v6[5] = &v7;
    objc_msgSend(v3, "enumerateSelectedAssetIndexSetsUsingBlock:", v6);
  }
  else
  {
    objc_msgSend(v3, "processDuplicateActionWithAssets:assetCollection:assetsInAssetCollection:", v3[17], v3[18], 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v8[5];
    v8[5] = v4;

  }
  px_dispatch_on_main_queue();
  _Block_object_dispose(&v7, 8);

}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_3_142(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v4, "totalUnitCount"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_139(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a2;
  objc_msgSend(v7, "objectsAtIndexes:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "processDuplicateActionWithAssets:assetCollection:assetsInAssetCollection:", v12, v8, v7);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

void __41__PXDuplicateAssetsAction_performAction___block_invoke_2_140(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 120);
  *(_QWORD *)(v3 + 120) = v2;

}

uint64_t __41__PXDuplicateAssetsAction_performAction___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return a2;
}

void __54__PXDuplicateAssetsAction__checkDuplicateCapabilities__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v9 = a3;
  v10 = a4;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(_BYTE *)(v11 + 24);
  if (v12)
  {
    v12 = objc_msgSend(v17, "assetCollectionSubtype") != 101;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v11 + 24) = v12;
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(_BYTE *)(v13 + 24);
  if (v14)
  {
    v14 = objc_msgSend(v17, "assetCollectionSubtype") != 1000000201;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v13 + 24) = v14;
  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "count") + v15;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || (objc_msgSend(v9, "objectsAtIndexes:", v10),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "processWithAssets:assetCollection:canDuplicate:canExtractStill:", v16, v17, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v16, !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)))
  {
    *a5 = 1;
  }

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v4;
  int v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isTrashed") & 1) != 0
    || (objc_msgSend(v4, "isRecoveredAsset") & 1) != 0
    || objc_msgSend(v4, "sourceType") == 2
    || objc_msgSend(v4, "sourceType") == 8)
  {
    goto LABEL_5;
  }
  if (!objc_msgSend(v4, "px_isSyndicatedAsset"))
  {
    LOBYTE(v5) = 1;
    goto LABEL_6;
  }
  if (!objc_msgSend(v4, "px_isUnsavedSyndicatedAsset"))
LABEL_5:
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v4, "px_isSyndicationPhotoLibraryAsset") ^ 1;
LABEL_6:

  return v5;
}

+ (BOOL)canPerformOnAllAssets:(id)a3
{
  return PXExists() ^ 1;
}

uint64_t __49__PXDuplicateAssetsAction_canPerformOnAllAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "canPerformOnAsset:inAssetCollection:", a2, 0) ^ 1;
}

@end
