@implementation PXPhotoKitAssetCollectionAddContentActionPerformer

- (PXPhotoKitAssetCollectionAddContentActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 parameters:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXDisplayTitleInfo *v12;
  void *v13;
  PXDisplayTitleInfo *v14;
  PXPhotoKitAssetCollectionAddContentActionPerformer *v15;
  PXFastEnumeration *v16;
  PXFastEnumeration *v17;
  PXFastEnumeration *content;
  void *v20;
  void *v21;
  objc_super v22;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [PXDisplayTitleInfo alloc];
  objc_msgSend(v10, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXDisplayTitleInfo initWithAssetCollection:useVerboseSmartDescription:](v12, "initWithAssetCollection:useVerboseSmartDescription:", v13, 0);

  v22.receiver = self;
  v22.super_class = (Class)PXPhotoKitAssetCollectionAddContentActionPerformer;
  v15 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v22, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v11, v10, v14);

  if (v15)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)off_1E50B7D28);
    v16 = (PXFastEnumeration *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((-[PXFastEnumeration conformsToProtocol:](v16, "conformsToProtocol:", &unk_1EEA11168) & 1) != 0)
      {
LABEL_4:
        content = v15->_content;
        v15->_content = v17;

        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXFastEnumeration px_descriptionForAssertionMessage](v17, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer.m"), 41, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("parameters[PXActionParameterKeyContent]"), CFSTR("PXFastEnumeration"), v21);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v15, CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer.m"), 41, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("parameters[PXActionParameterKeyContent]"), CFSTR("PXFastEnumeration"));
    }

    goto LABEL_4;
  }
LABEL_5:

  return v15;
}

- (BOOL)_isAddingToSharedAlbum
{
  void *v3;
  void *v4;
  char v5;

  -[PXFastEnumeration firstObject](self->_content, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "px_isSharedAlbum");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  unint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  PXFastEnumeration *v29;
  _QWORD v30[5];
  _QWORD v31[5];

  if (-[PXPhotoKitAssetCollectionAddContentActionPerformer _isAddingToSharedAlbum](self, "_isAddingToSharedAlbum"))
  {
    v29 = self->_content;
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXFastEnumeration px_descriptionForAssertionMessage](v29, "px_descriptionForAssertionMessage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer.m"), 55, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("_content"), v26, v27);

      }
      -[PXFastEnumeration fetchedObjects](v29, "fetchedObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotoKitAssetCollectionActionPerformer addAssets:toSharedAlbum:](self, "addAssets:toSharedAlbum:", v4, v5);

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Invalid contents. PXPhotoKitAssetCollectionAddContentActionPerformer did not complete successfully."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

  }
  -[PXFastEnumeration firstObject](self->_content, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer_MergeAlbumsTitle"), CFSTR("PhotosUICore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = -[PXFastEnumeration count](self->_content, "count");
    v12 = "One";
    if (v11 > 1)
      v12 = "Many";
    objc_msgSend(v10, "stringWithFormat:", CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer_MergeAlbumsMessageFormat_%s"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v14, CFSTR("%@"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer_MergeAlbumsActionTitle"), CFSTR("PhotosUICore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v9, v16, 1, v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke;
    v31[3] = &unk_1E5144530;
    v31[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v17, 0, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v20);
    v21 = (void *)MEMORY[0x1E0DC3448];
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v19;
    v30[1] = 3221225472;
    v30[2] = __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_3;
    v30[3] = &unk_1E5144530;
    v30[4] = self;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v22, 1, v30);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addAction:", v23);
    -[PXActionPerformer presentViewController:](self, "presentViewController:", v18);

  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
}

- (void)performBackgroundTask
{
  void *v3;
  char isKindOfClass;
  _QWORD v5[5];

  if (-[PXPhotoKitAssetCollectionAddContentActionPerformer _isAddingToSharedAlbum](self, "_isAddingToSharedAlbum"))
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    -[PXFastEnumeration firstObject](self->_content, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __75__PXPhotoKitAssetCollectionAddContentActionPerformer_performBackgroundTask__block_invoke;
      v5[3] = &unk_1E5148B78;
      v5[4] = self;
      -[PXPhotoKitAssetCollectionAddContentActionPerformer _performAddAssets:](self, "_performAddAssets:", v5);
    }
  }
}

- (void)_performAddAssets:(id)a3
{
  id v5;
  void *v6;
  PXAddAssetsToAssetCollectionAction *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a3;
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && -[PXFastEnumeration count](self->_content, "count"))
  {
    if ((objc_msgSend(v6, "canPerformEditOperation:", 3) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer.m"), 126, CFSTR("Attempting to add assets to a non-editable collection: %@"), v6);

    }
    v7 = -[PXAddAssetsToAssetCollectionAction initWithAssets:assetCollection:]([PXAddAssetsToAssetCollectionAction alloc], "initWithAssets:assetCollection:", self->_content, v6);
    -[PXActionPerformer undoManager](self, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __72__PXPhotoKitAssetCollectionAddContentActionPerformer__performAddAssets___block_invoke;
    v11[3] = &unk_1E5146918;
    v11[4] = self;
    v12 = v6;
    v13 = v5;
    -[PXAction executeWithUndoManager:completionHandler:](v7, "executeWithUndoManager:completionHandler:", v8, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer did not complete successfully"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v9);

  }
}

- (void)_performMergeAssetCollections:(id)a3
{
  id v4;
  void *v5;
  PXMergeAssetCollectionsAction *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMergeAssetCollectionsAction initWithSourceAssetCollections:targetAssetCollection:]([PXMergeAssetCollectionsAction alloc], "initWithSourceAssetCollections:targetAssetCollection:", self->_content, v5);
  -[PXActionPerformer undoManager](self, "undoManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PXPhotoKitAssetCollectionAddContentActionPerformer__performMergeAssetCollections___block_invoke;
  v10[3] = &unk_1E5146918;
  v10[4] = self;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  -[PXAction executeWithUndoManager:completionHandler:](v6, "executeWithUndoManager:completionHandler:", v7, v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
}

void __84__PXPhotoKitAssetCollectionAddContentActionPerformer__performMergeAssetCollections___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = *(_QWORD *)(a1[4] + 192);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "failed merging asset collections to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void __72__PXPhotoKitAssetCollectionAddContentActionPerformer__performAddAssets___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = a1[5];
      v8 = *(_QWORD *)(a1[4] + 192);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __75__PXPhotoKitAssetCollectionAddContentActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

uint64_t __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_2;
  v3[3] = &unk_1E5148B78;
  v3[4] = v1;
  return objc_msgSend(v1, "_performMergeAssetCollections:", v3);
}

uint64_t __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __80__PXPhotoKitAssetCollectionAddContentActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  char v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v11);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionAddContentActionPerformer.m"), 30, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v11, v13);

    goto LABEL_6;
  }
LABEL_3:
  v7 = objc_msgSend(v6, "canPerformEditOperation:", 3);

  return v7;
}

@end
