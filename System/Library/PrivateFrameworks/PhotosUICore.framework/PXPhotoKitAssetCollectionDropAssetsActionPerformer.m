@implementation PXPhotoKitAssetCollectionDropAssetsActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  objc_class *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  SEL v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer dropSession](self, "dropSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "px_assetsDropMode"))
  {
    -[PXPhotoKitAssetCollectionDropAssetsActionPerformer memoryAssetsActionFactory](self, "memoryAssetsActionFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      PLDragAndDropGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        v24 = 2112;
        v25 = v4;
        v13 = "%@ called with non-editable collection: %@";
        goto LABEL_12;
      }
LABEL_13:

      -[PXPhotoKitAssetCollectionDropAssetsActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
      goto LABEL_14;
    }
  }
  if (!v5)
  {
    PLDragAndDropGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v12;
      v24 = 2112;
      v25 = v4;
      v13 = "%@ called without drop session: %@";
LABEL_12:
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, v13, buf, 0x16u);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v7 = objc_msgSend(v4, "px_isSharedAlbum");
  +[PXImportManager defaultManager](PXImportManager, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke;
    v19[3] = &unk_1E513C3F8;
    v19[4] = self;
    v20 = v4;
    v21 = v5;
    objc_msgSend(v8, "fetchAssetsFromDrop:importIfNeeded:completion:", v21, 0, v19);

    v9 = v20;
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_7;
    v15[3] = &unk_1E513C420;
    v18 = a2;
    v15[4] = self;
    v16 = v5;
    v17 = v4;
    objc_msgSend(v8, "fetchAssetsFromDrop:importIfNeeded:completion:", v16, 1, v15);

    v9 = v16;
  }

LABEL_14:
}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotoKitAssetCollectionDropAssetsActionPerformer;
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](&v5, sel_completeUserInteractionTaskWithSuccess_error_, a3, a4);
  -[PXAssetCollectionActionPerformer setDragSession:](self, "setDragSession:", 0);
  -[PXAssetCollectionActionPerformer setDropSession:](self, "setDropSession:", 0);
}

- (id)memoryAssetsActionFactory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXActionPerformer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "allowCustomUserAssets"))
    {
      -[PXActionPerformer delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "memoryAssetsActionFactory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_2;
    block[3] = &unk_1E51457C8;
    block[4] = *(_QWORD *)(a1 + 32);
    v4 = &v14;
    v14 = v3;
    v5 = &v15;
    v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    +[PXImportManager defaultManager](PXImportManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_3;
    v10[3] = &unk_1E513C3D0;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v4 = &v11;
    v11 = v8;
    v5 = &v12;
    v12 = *(id *)(a1 + 48);
    v9 = (id)objc_msgSend(v6, "importSharedSourcesForDragItems:completionHandler:", v7, v10);

  }
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(void *, uint64_t, _QWORD);
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  void *v18;
  PXFavoriteAssetsAction *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  PXRearrangeAssetCollectionAction *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  objc_class *v35;
  uint64_t v36;
  _QWORD aBlock[5];

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1 + 56);
      v29 = *(_QWORD *)(a1 + 32);
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "px_descriptionForAssertionMessage");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v28, v29, CFSTR("PXPhotoKitAssetCollectionDropAssetsActionPerformer.m"), 126, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("displayAssetFetchResult"), v31, v32);

    }
  }
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(*(id *)(a1 + 40), "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
  {
    +[PXDragAndDropUIUtilities dropImportErrorAlertControllerWithHandler:](PXDragAndDropUIUtilities, "dropImportErrorAlertControllerWithHandler:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:", v7);

  }
  if (objc_msgSend(v3, "count"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_8;
    aBlock[3] = &unk_1E5148B78;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v8 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
    objc_msgSend(*(id *)(a1 + 32), "actionType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeMoveAssets"));

    if (!v10)
    {
      if (objc_msgSend(*(id *)(a1 + 48), "px_isFavoritesSmartAlbum"))
      {
        v19 = -[PXFavoriteAssetsAction initWithAssets:favorite:]([PXFavoriteAssetsAction alloc], "initWithAssets:favorite:", v3, 1);
      }
      else
      {
        if ((objc_msgSend(*(id *)(a1 + 48), "px_isPhotosVirtualCollection") & 1) != 0)
        {
          v8[2](v8, 1, 0);
LABEL_31:

          goto LABEL_32;
        }
        v19 = -[PXAddAssetsToAssetCollectionAction initWithAssets:assetCollection:]([PXAddAssetsToAssetCollectionAction alloc], "initWithAssets:assetCollection:", v3, *(_QWORD *)(a1 + 48));
      }
      v13 = v19;
      objc_msgSend(*(id *)(a1 + 32), "undoManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "executeWithUndoManager:completionHandler:", v26, v8);

LABEL_30:
      goto LABEL_31;
    }
    objc_msgSend(*(id *)(a1 + 32), "dropTargetAssetReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "dropTargetAssetReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_18;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = *(_QWORD *)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 32);
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "px_descriptionForAssertionMessage");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v36, v15, CFSTR("PXPhotoKitAssetCollectionDropAssetsActionPerformer.m"), 141, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dropTargetAssetReference.asset"), v17, v18);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(_QWORD *)(a1 + 56);
        v34 = *(_QWORD *)(a1 + 32);
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v33, v34, CFSTR("PXPhotoKitAssetCollectionDropAssetsActionPerformer.m"), 141, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dropTargetAssetReference.asset"), v17);
      }

    }
    else
    {
      v13 = 0;
    }
LABEL_18:

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(a1 + 48), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "containsObject:", v13) & 1) != 0
      || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), !v13)
      || (isKindOfClass & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "memoryAssetsActionFactory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rearrangeMemoryAssetsActionWithAssetCollection:movedAssets:beforeAsset:", *(_QWORD *)(a1 + 48), v3, v13);
      v23 = (PXRearrangeAssetCollectionAction *)objc_claimAutoreleasedReturnValue();

      if (v23
        || (objc_msgSend(*(id *)(a1 + 48), "px_isMemory") & 1) == 0
        && (v23 = -[PXRearrangeAssetCollectionAction initWithAssetCollection:movedAssets:targetAsset:]([PXRearrangeAssetCollectionAction alloc], "initWithAssetCollection:movedAssets:targetAsset:", *(_QWORD *)(a1 + 48), v3, v13)) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "undoManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAction executeWithUndoManager:completionHandler:](v23, "executeWithUndoManager:completionHandler:", v25, v8);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to obtain rearrange action for asset collection: %@"), *(_QWORD *)(a1 + 48));
        v23 = (PXRearrangeAssetCollectionAction *)objc_claimAutoreleasedReturnValue();
        ((void (**)(void *, uint64_t, PXRearrangeAssetCollectionAction *))v8)[2](v8, 0, v23);
      }
    }
    else
    {
      v22 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Unable to know where the move target is, %@ is not in the list of existing assets."), v13);
      v23 = (PXRearrangeAssetCollectionAction *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "completeUserInteractionTaskWithSuccess:error:", 0, v23);
    }

    goto LABEL_30;
  }
  objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
LABEL_32:

}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_8(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_9;
  block[3] = &unk_1E51473C0;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = a2;
  block[4] = v6;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAssets:toSharedAlbum:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_3(id *a1, int a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  void (**v18)(_QWORD);
  _QWORD aBlock[5];
  id v20;
  id v21;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_4;
  aBlock[3] = &unk_1E51457C8;
  aBlock[4] = a1[4];
  v8 = v6;
  v20 = v8;
  v21 = a1[5];
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(a1[6], "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 == v12)
  {
    if (a2 && objc_msgSend(v8, "count"))
      v9[2](v9);
  }
  else
  {
    v14 = v7;
    v15 = 3221225472;
    v16 = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_6;
    v17 = &unk_1E5142658;
    v18 = v9;
    +[PXDragAndDropUIUtilities dropImportErrorAlertControllerWithHandler:](PXDragAndDropUIUtilities, "dropImportErrorAlertControllerWithHandler:", &v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "presentViewController:", v13, v14, v15, v16, v17);

  }
}

void __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD block[5];
  id v4;
  id v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_5;
  block[3] = &unk_1E51457C8;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __80__PXPhotoKitAssetCollectionDropAssetsActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAssets:toSharedAlbum:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  char HasValidItems;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;

  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDropAssetsActionPerformer.m"), 43, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v31, v33);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionDropAssetsActionPerformer.m"), 43, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v31);
  }

LABEL_3:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "dropSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  objc_msgSend(v10, "memoryAssetsActionFactory");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_10;
  v14 = (void *)v13;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "allowCustomUserAssets");

  if ((v16 & 1) != 0)
  {
    v17 = 0;
    v18 = 1;
  }
  else
  {
LABEL_10:
    v18 = objc_msgSend(v11, "px_assetsDropMode");
    v17 = 1;
  }
  if (v12)
    v19 = v18 == 0;
  else
    v19 = 1;
  v20 = !v19;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeMoveAssets")))
  {
    if (v17)
      v21 = objc_msgSend(v11, "canPerformEditOperation:", 5);
    else
      v21 = 1;
    if ((v20 & v21) != 1)
      goto LABEL_29;
    objc_msgSend(v10, "dropTargetAssetReference");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v10, "dropTargetAssetReference");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "asset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_29;
    }
  }
  else if (!v20)
  {
LABEL_29:
    HasValidItems = 0;
    goto LABEL_30;
  }
  if (v18 == 2 && !PXDropSessionHasItemsNeedingImport(v12))
    goto LABEL_29;
  HasValidItems = PXDropSessionHasValidItems(v12);
LABEL_30:

  return HasValidItems;
}

+ (id)dropAssetsActionPerformerForAssetCollection:(id)a3 dropSession:(id)a4
{
  id v5;
  id v6;
  PXDisplayTitleInfo *v7;
  id v8;
  void *v9;
  PXPhotoKitAssetCollectionDropAssetsActionPerformer *v10;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  v5 = a4;
  v6 = a3;
  v7 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:]([PXDisplayTitleInfo alloc], "initWithAssetCollection:useVerboseSmartDescription:", v6, 0);
  v8 = objc_alloc((Class)off_1E50B1668);
  v12 = *(_QWORD *)off_1E50B7E98;
  v13 = xmmword_1A7C0C1F0;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)objc_msgSend(v8, "initWithAssetCollection:keyAssetReference:indexPath:", v6, 0, &v12);

  v10 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:]([PXPhotoKitAssetCollectionDropAssetsActionPerformer alloc], "initWithActionType:assetCollectionReference:displayTitleInfo:", CFSTR("PXAssetCollectionActionTypeDropAssets"), v9, v7);
  -[PXAssetCollectionActionPerformer setDropSession:](v10, "setDropSession:", v5);

  return v10;
}

@end
