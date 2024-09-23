@implementation PXPhotoKitDeleteAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v8;
  id v9;
  char v10;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isTrashBin") & 1) != 0 || objc_msgSend(v9, "px_isRecoveredSmartAlbum"))
    v10 = objc_msgSend(a1, "canExpungeAsset:inAssetCollection:", v8, v9);
  else
    v10 = 0;

  return v10;
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "px_isRecentlyDeletedSmartAlbum") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "px_isRecoveredSmartAlbum");

  return v4;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v7 = a3;
  objc_msgSend(a5, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAnyItemSelected");

  if (v10)
    v11 = CFSTR("PXPhotoKitDeleteAssetActionPerformer_TitleDefault");
  else
    v11 = CFSTR("PXPhotoKitDeleteAssetActionPerformer_TitleSelection");
  PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v12, 0, v7, a4);

  return v13;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  int v5;
  __CFString *v6;

  objc_msgSend(a4, "effectiveSelectionSnapshot", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAnyItemSelected");

  if (v5)
    v6 = CFSTR("PXPhotoKitDeleteAssetActionPerformer_TitleDefault");
  else
    v6 = CFSTR("PXPhotoKitDeleteAssetActionPerformer_TitleSelection");
  return PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("trash");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

- (int64_t)destructivePhotosAction
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDeleteAssetActionPerformer.m"), 46, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v11, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDeleteAssetActionPerformer.m"), 46, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetsByAssetCollection.allKeys.firstObject"), v11);
  }

LABEL_3:
  if (objc_msgSend(v6, "isTrashBin"))
    v7 = 6;
  else
    v7 = 5;

  return v7;
}

- (id)actionType
{
  __CFString *v2;

  v2 = CFSTR("PXAssetActionTypeDelete");
  return CFSTR("PXAssetActionTypeDelete");
}

@end
