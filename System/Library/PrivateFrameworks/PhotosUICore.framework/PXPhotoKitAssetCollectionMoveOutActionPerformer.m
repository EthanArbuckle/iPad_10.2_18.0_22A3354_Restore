@implementation PXPhotoKitAssetCollectionMoveOutActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  uint8_t buf[8];
  _QWORD v22[4];
  id v23;
  id v24;
  PXPhotoKitAssetCollectionMoveOutActionPerformer *v25;

  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer.m"), 40, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollectionReference.assetCollection"), v18);
LABEL_14:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer.m"), 40, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollectionReference.assetCollection"), v18, v20);

    goto LABEL_14;
  }
LABEL_3:
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIncludeRootFolder:", 1);
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v9, v7),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "firstObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke;
    v22[3] = &unk_1E5143FC0;
    v23 = v11;
    v24 = v9;
    v25 = self;
    v13 = v11;
    objc_msgSend(v12, "presentAlertWithConfigurationHandler:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      PLUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", buf, 2u);
      }

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
  else
  {
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  void *v6;
  PXMoveToCollectionListAction *v7;
  void *v8;
  PXMoveToCollectionListAction *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollectionReference.assetCollection"), v13, v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer.m"), 79, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollectionReference.assetCollection"), v13);
  }

LABEL_3:
  +[PXPhotoKitAssetCollectionMoveOutActionPerformer _grandParentOfCollection:](PXPhotoKitAssetCollectionMoveOutActionPerformer, "_grandParentOfCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [PXMoveToCollectionListAction alloc];
    v17[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXMoveToCollectionListAction initWithCollections:targetCollectionList:](v7, "initWithCollections:targetCollectionList:", v8, v6);

    -[PXActionPerformer undoManager](self, "undoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PXPhotoKitAssetCollectionMoveOutActionPerformer_performBackgroundTask__block_invoke;
    v16[3] = &unk_1E5148B78;
    v16[4] = self;
    -[PXAction executeWithUndoManager:completionHandler:](v9, "executeWithUndoManager:completionHandler:", v10, v16);

  }
}

uint64_t __72__PXPhotoKitAssetCollectionMoveOutActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

void __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "px_isTopLevelFolder");
  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer_ToAllAlbums_%@_TitleFormat"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer_ToUserFolder_%@_%@_TitleFormat"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "setTitle:", v9);
  objc_msgSend(v4, "setStyle:", 0);
  PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_2;
  v15[3] = &unk_1E5149198;
  v15[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v11, 1, v15);
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformerTitle"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_3;
  v14[3] = &unk_1E5149198;
  v14[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v13, 0, v14);

}

uint64_t __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __77__PXPhotoKitAssetCollectionMoveOutActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  void *v7;
  BOOL v8;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer.m"), 31, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v12, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformer.m"), 31, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v12);
  }

LABEL_3:
  if (objc_msgSend(v6, "px_isRegularAlbum"))
  {
    +[PXPhotoKitAssetCollectionMoveOutActionPerformer _grandParentOfCollection:](PXPhotoKitAssetCollectionMoveOutActionPerformer, "_grandParentOfCollection:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_grandParentOfCollection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIncludeRootFolder:", 1);
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionMoveOutActionPerformerTitle"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("folder.badge.minus");
}

@end
