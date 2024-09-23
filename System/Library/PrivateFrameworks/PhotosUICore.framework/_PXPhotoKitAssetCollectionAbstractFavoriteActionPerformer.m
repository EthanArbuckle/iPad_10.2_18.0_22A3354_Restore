@implementation _PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  _QWORD v5[6];

  +[PXContentSyndicationAssetSavingHelper assetSavingHelperFromAssetCollectionActionPerformer:](PXContentSyndicationAssetSavingHelper, "assetSavingHelperFromAssetCollectionActionPerformer:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E511CB38;
  v5[4] = self;
  v5[5] = a2;
  objc_msgSend(v4, "performSaveActionIfNeededOnUnsavedSyndicatedAssetsWithCompletion:", v5);

}

- (void)performBackgroundTask
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  PXFavoriteMemoriesAction *v9;
  void *v10;
  PXFavoriteMemoriesAction *v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer *v23;
  char v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_targetFavoriteStateForAssetCollectionReference:", v5);

  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "px_isMemory"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1017, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 999, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v16, v19);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 999, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v16);
  }

LABEL_4:
  v9 = [PXFavoriteMemoriesAction alloc];
  v25[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXFavoriteMemoriesAction initWithMemories:favorite:](v9, "initWithMemories:favorite:", v10, v6);

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1002, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action != nil"));

  }
  -[PXActionPerformer undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __82___PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer_performBackgroundTask__block_invoke;
  v21[3] = &unk_1E51399B8;
  v24 = v6;
  v22 = v8;
  v23 = self;
  v13 = v8;
  -[PXAction executeWithUndoManager:completionHandler:](v11, "executeWithUndoManager:completionHandler:", v12, v21);

}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "px_isMemory"))
    v5 = objc_msgSend(v4, "px_canEditFavoriteState");
  else
    v5 = 0;

  return v5;
}

+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 951, CFSTR("Method %s is a responsibility of subclass %@"), "+[_PXPhotoKitAssetCollectionAbstractFavoriteActionPerformer _targetFavoriteStateForAssetCollectionReference:]", v8);

  abort();
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  if (objc_msgSend(a1, "_targetFavoriteStateForAssetCollectionReference:", a3, a4))
    return CFSTR("heart");
  else
    return CFSTR("heart.slash");
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = objc_msgSend((id)objc_opt_class(), "_targetFavoriteStateForAssetCollectionReference:", v6);

  v8 = CFSTR("Standard");
  if (!a3)
    v8 = CFSTR("Preview");
  v9 = CFSTR("Unfavorite");
  if (v7)
    v9 = CFSTR("Favorite");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXPhotoKitAssetCollectionManager%@ActionTitle_%@Memory"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v10, CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
