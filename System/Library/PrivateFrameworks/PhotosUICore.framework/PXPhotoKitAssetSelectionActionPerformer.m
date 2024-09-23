@implementation PXPhotoKitAssetSelectionActionPerformer

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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetSelectionActionPerformer.m"), 26, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v20);
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
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetSelectionActionPerformer.m"), 26, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v20, v22);

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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  char v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  -[PXPhotoKitAssetActionPerformer objectReference](self, "objectReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "indexPathForObjectReference:", v5);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
  }

  if ((_QWORD)v21 == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v3, "selectedIndexPaths");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20[0] = v21;
    v20[1] = v22;
    objc_msgSend(off_1E50B3180, "indexPathSetWithIndexPath:", v20);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[PXAssetActionPerformer selectionManager](self, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedIndexPaths");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isSupersetOfSet:", v7);

  -[PXAssetActionPerformer selectionManager](self, "selectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__PXPhotoKitAssetSelectionActionPerformer_performUserInteractionTask__block_invoke;
  v17 = &unk_1E5144348;
  v19 = v11;
  v18 = v7;
  v13 = v7;
  objc_msgSend(v12, "performChanges:", &v14);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0, v14, v15, v16, v17);

}

uint64_t __69__PXPhotoKitAssetSelectionActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSelectedState:forIndexPathSet:", *(_BYTE *)(a1 + 40) == 0, *(_QWORD *)(a1 + 32));
}

@end
