@implementation PXPhotoKitSelectVariationAssetActionPerformer

+ (PXAssetEditOperationManager)editOperationManager
{
  return +[PXAssetEditOperationManager sharedManager](PXAssetEditOperationManager, "sharedManager");
}

+ (NSString)editOperationType
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitSelectVariationAssetActionPerformer.m"), 39, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXPhotoKitSelectVariationAssetActionPerformer editOperationType]", v6);

  abort();
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v8;
  char v9;
  void *v10;
  void *v11;

  v8 = a3;
  if (objc_msgSend(a4, "assetCollectionType") == 7)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(a1, "editOperationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "editOperationType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "canPerformEditOperationWithType:onAsset:", v11, v8);

  }
  return v9;
}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  dispatch_group_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[7];
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  PXPhotoKitSelectVariationAssetActionPerformer *v18;
  id v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[3];
  char v25;

  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitSelectVariationAssetActionPerformer setProgress:](self, "setProgress:", v3);
  objc_msgSend((id)objc_opt_class(), "editOperationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "editOperationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 1;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__63660;
  v22[4] = __Block_byref_object_dispose__63661;
  v23 = 0;
  v6 = dispatch_group_create();
  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke;
  v14[3] = &unk_1E511EFD8;
  v9 = v6;
  v15 = v9;
  v10 = v4;
  v16 = v10;
  v11 = v5;
  v17 = v11;
  v18 = self;
  v20 = v22;
  v21 = v24;
  v12 = v3;
  v19 = v12;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);

  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_137;
  v13[3] = &unk_1E51401A8;
  v13[4] = self;
  v13[5] = v24;
  v13[6] = v22;
  dispatch_group_notify(v9, MEMORY[0x1E0C80D38], v13);

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

}

- (void)cancelActionWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PXPhotoKitSelectVariationAssetActionPerformer progress](self, "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v7);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "enumerateEditOperationsPerformedOnAsset:usingBlock:", v8, &__block_literal_global_63663);
        v9 = *(void **)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 56), "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "undoManagerForActionPerformer:", *(_QWORD *)(a1 + 56));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_3;
        v15[3] = &unk_1E511EFB0;
        v15[4] = v8;
        v17 = *(_OWORD *)(a1 + 72);
        v16 = *(id *)(a1 + 32);
        objc_msgSend(v9, "performEditOperationWithType:asset:undoManager:completionHandler:", v10, v8, v12, v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(*(id *)(a1 + 64), "px_appendChild:withPendingUnitCount:", v13, 1);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

}

uint64_t __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_137(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7 = v5;
    px_dispatch_on_main_queue();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_ERROR, "Error performEditOperationWithType for asset:%@ error:%@", (uint8_t *)&v8, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
    objc_storeStrong(v6, *(id *)(a1 + 40));
}

void __70__PXPhotoKitSelectVariationAssetActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  if (PXAssetVariationTypeForEditOperationType(a2) != -1)
    objc_msgSend(v4, "cancel");

}

@end
