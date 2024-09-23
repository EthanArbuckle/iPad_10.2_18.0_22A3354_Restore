@implementation PXPhotoKitAssetPickAssetActionPerformer

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  return a3 != 0;
}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 || objc_msgSend(v11, "sourceType") != 8 || objc_msgSend(v12, "assetCollectionType") != 7)
  {
    v16 = 0;
    goto LABEL_8;
  }
  v15 = v12;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetPickAssetActionPerformer.m"), 26, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v20);
LABEL_11:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetPickAssetActionPerformer.m"), 26, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v20, v22);

    goto LABEL_11;
  }
LABEL_6:
  v16 = objc_msgSend(v15, "status") == 3;

LABEL_8:
  return v16;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v13;

  v4 = a4;
  objc_msgSend(v4, "objectReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("PXPhotoKitAssetActionManagerPreviewActionTitle_SelectItem");
  if (v5)
  {
    objc_msgSend(v4, "selectionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "selectedIndexPaths");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPath");
    v10 = objc_msgSend(v9, "containsIndexPath:", &v13);

    if (v10)
      v6 = CFSTR("PXPhotoKitAssetActionManagerPreviewActionTitle_DeselectItem");

  }
  PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

- (void)performUserInteractionTask
{
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

@end
