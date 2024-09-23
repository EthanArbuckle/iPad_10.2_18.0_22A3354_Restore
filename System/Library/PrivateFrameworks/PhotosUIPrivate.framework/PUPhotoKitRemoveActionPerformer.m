@implementation PUPhotoKitRemoveActionPerformer

- (BOOL)shouldShowConfirmation
{
  return 1;
}

- (void)performUserInteractionTask
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[8];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD aBlock[5];
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  if (!-[PUPhotoKitRemoveActionPerformer shouldShowConfirmation](self, "shouldShowConfirmation"))
  {
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
    return;
  }
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = objc_claimAutoreleasedReturnValue();
  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1038, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v24);
LABEL_18:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v26 = v7;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1038, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v24, v27);

    v7 = v26;
    goto LABEL_18;
  }
LABEL_4:
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke;
  v35[3] = &unk_1E58A5248;
  v35[4] = &v36;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v35);

  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_3;
  aBlock[3] = &unk_1E58A8DE8;
  aBlock[4] = self;
  v30 = _Block_copy(aBlock);
  if (objc_msgSend(v7, "canPerformEditOperation:", 2))
  {
    v33[0] = v9;
    v33[1] = 3221225472;
    v33[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_4;
    v33[3] = &unk_1E58A8DE8;
    v33[4] = self;
    v10 = _Block_copy(v33);
  }
  else
  {
    v10 = 0;
  }
  v28 = v7;
  if (*((_BYTE *)v37 + 24))
  {
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_5;
    v32[3] = &unk_1E58A8DE8;
    v32[4] = self;
    v11 = _Block_copy(v32);
  }
  else
  {
    v11 = 0;
  }
  v29 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0D7B718], "warningStringForAssets:isDeleting:", v4, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("REMOVE_FROM_ALBUM_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  PULocalizedString(CFSTR("DELETE_FROM_LIBRARY_BUTTON_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v12, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 1, v30);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v17);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v14, 0, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v18);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v15, 2, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addAction:", v19);

  if (!-[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v16))
  {
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present confirmation dialog."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v21);

  }
  _Block_object_dispose(&v36, 8);

}

- (void)_performTrashTask
{
  PUPhotoKitTrashActionPerformer *v3;
  void *v4;
  void *v5;
  PUPhotoKitTrashActionPerformer *v6;
  _QWORD v7[5];

  v3 = [PUPhotoKitTrashActionPerformer alloc];
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PUAssetActionPerformer initWithActionType:assets:orAssetsByAssetCollection:](v3, "initWithActionType:assets:orAssetsByAssetCollection:", 8, v4, v5);

  -[PUAssetActionPerformer setDelegate:](v6, "setDelegate:", self);
  -[PUPhotoKitRemoveActionPerformer setTrashActionPerformer:](self, "setTrashActionPerformer:", v6);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PUPhotoKitRemoveActionPerformer__performTrashTask__block_invoke;
  v7[3] = &unk_1E58AB060;
  v7[4] = self;
  -[PUAssetActionPerformer performWithCompletionHandler:](v6, "performWithCompletionHandler:", v7);

}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[PUPhotoKitRemoveActionPerformer trashActionPerformer](self, "trashActionPerformer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUAssetActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PUPhotoKitActionPerformer instantlyExcludeAssetsFromDataSource](self, "instantlyExcludeAssetsFromDataSource");
    -[PUAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0D7B6F0];
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataSourceWithAssetCollections:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "selectionSnapshotForAssetsByAssetCollection:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B898]), "initWithSelectionSnapshot:", v8);
    -[PUAssetActionPerformer undoManager](self, "undoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__PUPhotoKitRemoveActionPerformer_performBackgroundTask__block_invoke;
    v11[3] = &unk_1E58AB060;
    v11[4] = self;
    objc_msgSend(v9, "executeWithUndoManager:completionHandler:", v10, v11);

  }
}

- (id)undoManagerForAssetActionPerformer:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undoManagerForAssetActionPerformer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)assetActionPerformer:(id)a3 presentViewController:(id)a4
{
  return -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)assetActionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a4;
  -[PUAssetActionPerformer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v9, "assetActionPerformer:dismissViewController:completionHandler:", self, v8, v7);

  return (char)self;
}

- (NSDictionary)fetchResultsByAssetCollection
{
  return self->_fetchResultsByAssetCollection;
}

- (void)setFetchResultsByAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResultsByAssetCollection, a3);
}

- (PUPhotoKitTrashActionPerformer)trashActionPerformer
{
  return self->_trashActionPerformer;
}

- (void)setTrashActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_trashActionPerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trashActionPerformer, 0);
  objc_storeStrong((id *)&self->_fetchResultsByAssetCollection, 0);
}

void __56__PUPhotoKitRemoveActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v5);

}

uint64_t __52__PUPhotoKitRemoveActionPerformer__performTrashTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

void __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];

  v10 = a2;
  v7 = a3;
  v8 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v8)
  {
    if (objc_msgSend(v10, "canPerformEditOperation:", 1))
      v8 = objc_msgSend(v10, "isTrashBin") ^ 1;
    else
      v8 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(v9 + 8) + 24)
    || (v11[0] = MEMORY[0x1E0C809B0],
        v11[1] = 3221225472,
        v11[2] = __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_2,
        v11[3] = &unk_1E58A5220,
        v11[4] = v9,
        objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11),
        !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)))
  {
    *a4 = 1;
  }

}

void __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Remove canceled."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "completeUserInteractionTaskWithSuccess:error:", 0, v2);

}

uint64_t __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performTrashTask");
}

void __61__PUPhotoKitRemoveActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  char v8;
  id v9;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = v6;
  if (*(_BYTE *)(v7 + 24))
  {
    v8 = objc_msgSend(v6, "canPerformEditOperation:", 1);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a4 = 1;

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a4, "canPerformEditOperation:", 2);
}

@end
