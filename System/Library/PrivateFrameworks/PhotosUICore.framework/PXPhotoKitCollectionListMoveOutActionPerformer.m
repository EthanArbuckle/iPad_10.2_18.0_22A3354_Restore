@implementation PXPhotoKitCollectionListMoveOutActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  id v17;
  PXPhotoKitCollectionListMoveOutActionPerformer *v18;

  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIncludeRootFolder:", 1);
  objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionListsContainingCollection:options:", v7, v5),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "firstObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v9))
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke;
    v15[3] = &unk_1E5143FC0;
    v16 = v9;
    v17 = v7;
    v18 = self;
    v11 = v9;
    objc_msgSend(v10, "presentAlertWithConfigurationHandler:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      PLUIGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Failed to present remove confirmation. User must confirm to perform removal.", v14, 2u);
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
  void *v3;
  void *v4;
  PXMoveToCollectionListAction *v5;
  void *v6;
  PXMoveToCollectionListAction *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitCollectionListActionPerformer collectionList](self, "collectionList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotoKitCollectionListMoveOutActionPerformer _grandParentOfCollection:](PXPhotoKitCollectionListMoveOutActionPerformer, "_grandParentOfCollection:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [PXMoveToCollectionListAction alloc];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXMoveToCollectionListAction initWithCollections:targetCollectionList:](v5, "initWithCollections:targetCollectionList:", v6, v4);

    -[PXActionPerformer undoManager](self, "undoManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PXPhotoKitCollectionListMoveOutActionPerformer_performBackgroundTask__block_invoke;
    v9[3] = &unk_1E5148B78;
    v9[4] = self;
    -[PXAction executeWithUndoManager:completionHandler:](v7, "executeWithUndoManager:completionHandler:", v8, v9);

  }
}

uint64_t __71__PXPhotoKitCollectionListMoveOutActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

void __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
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
    PXLocalizedStringFromTable(CFSTR("PXPhotoKitCollectionListMoveOutActionPerformer_ToAllAlbums_%@_TitleFormat"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "localizedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PXLocalizedStringFromTable(CFSTR("PXPhotoKitCollectionListMoveOutActionPerformer_ToUserFolder_%@_%@_TitleFormat"), CFSTR("PhotosUICore"));
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
  v15[2] = __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_2;
  v15[3] = &unk_1E5149198;
  v15[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v11, 1, v15);
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitCollectionListMoveOutActionPerformerTitle"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v12;
  v14[1] = 3221225472;
  v14[2] = __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_3;
  v14[3] = &unk_1E5149198;
  v14[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "addActionWithTitle:style:action:", v13, 0, v14);

}

uint64_t __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

uint64_t __76__PXPhotoKitCollectionListMoveOutActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (BOOL)canPerformOnCollectionList:(id)a3
{
  void *v3;
  BOOL v4;

  +[PXPhotoKitCollectionListMoveOutActionPerformer _grandParentOfCollection:](PXPhotoKitCollectionListMoveOutActionPerformer, "_grandParentOfCollection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
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

+ (id)localizedTitleForActionType:(id)a3 collectionList:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitCollectionListMoveOutActionPerformerTitle"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForCollectionList:(id)a3 actionType:(id)a4
{
  return CFSTR("folder.badge.minus");
}

@end
