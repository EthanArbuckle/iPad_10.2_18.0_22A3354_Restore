@implementation PXPhotoKitRestoreAssetActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v7 = a3;
  if (!objc_msgSend(v7, "isAnyItemSelected"))
  {
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v7, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitRestoreAssetActionPerformer.m"), 28, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v14);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitRestoreAssetActionPerformer.m"), 28, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v14, v16);

    goto LABEL_9;
  }
LABEL_4:
  objc_msgSend(v8, "containerCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "px_isRecentlyDeletedSmartAlbum");

LABEL_6:
  return v10;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return objc_msgSend(a4, "px_isRecentlyDeletedSmartAlbum", a3);
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)canPerformOnImplicitSelectionInContainerCollection:(id)a3
{
  return objc_msgSend(a3, "px_isRecentlyDeletedSmartAlbum");
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
    v11 = CFSTR("PXPhotoKitRestoreAssetActionPerformer_Title");
  else
    v11 = CFSTR("PXPhotoKitRestoreAssetActionPerformer_TitleSelection");
  PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v12, 0, v7, a4);

  return v13;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
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
    v6 = CFSTR("PXPhotoKitRestoreAssetActionPerformer_Title");
  else
    v6 = CFSTR("PXPhotoKitRestoreAssetActionPerformer_TitleSelection");
  return PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("arrow.up.bin");
}

- (int64_t)destructivePhotosAction
{
  return 3;
}

@end
