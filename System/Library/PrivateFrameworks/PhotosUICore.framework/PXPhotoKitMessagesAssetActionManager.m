@implementation PXPhotoKitMessagesAssetActionManager

- (void)px_registerAdditionalPerformerClasses
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitMessagesAssetActionManager;
  -[PXAssetActionManager px_registerAdditionalPerformerClasses](&v3, sel_px_registerAdditionalPerformerClasses);
  -[PXPhotoKitAssetActionManager registerPerformerClass:forType:](self, "registerPerformerClass:forType:", objc_opt_class(), CFSTR("PXAssetActionTypeAddToLibrary"));
}

- (unint64_t)presentationSource
{
  return 2;
}

- (id)_selectionSnapshotForPerformerClass:(Class)a3 applySubsetIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  objc_class *v42;
  void *v43;
  objc_class *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  id v50;
  Class v51;
  _OWORD v52[2];
  __int128 v53;
  __int128 v54;

  v4 = a4;
  -[PXAssetActionManager selectionManager](self, "selectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMessagesAssetActionManager.m"), 48, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v43);
LABEL_23:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (objc_class *)objc_opt_class();
    NSStringFromClass(v44);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitMessagesAssetActionManager.m"), 48, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v43, v45);

    goto LABEL_23;
  }
LABEL_3:
  if ((objc_msgSend(v9, "isAnyItemSelected") & 1) != 0
    || (-[PXAssetActionManager objectReference](self, "objectReference"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    if ((objc_msgSend(v9, "isAnyItemSelected") & 1) != 0
      || (objc_msgSend(v10, "containerCollection"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = -[objc_class canPerformOnImplicitSelectionInContainerCollection:](a3, "canPerformOnImplicitSelectionInContainerCollection:", v17), v17, !v18))
    {
      if (-[objc_class canPerformOnSubsetOfSelection](a3, "canPerformOnSubsetOfSelection") && v4)
      {
        v22 = objc_alloc_init((Class)off_1E50B3668);
        objc_msgSend(v10, "photosDataSource");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectedIndexPaths");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotoKitAssetActionManager person](self, "person");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotoKitAssetActionManager socialGroup](self, "socialGroup");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = MEMORY[0x1E0C809B0];
        v46[1] = 3221225472;
        v46[2] = __96__PXPhotoKitMessagesAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke;
        v46[3] = &unk_1E5137010;
        v50 = v22;
        v51 = a3;
        v47 = v23;
        v48 = v25;
        v49 = v26;
        v27 = v22;
        v28 = v26;
        v29 = v25;
        v30 = v23;
        objc_msgSend(v24, "enumerateItemIndexPathsUsingBlock:", v46);
        v31 = objc_msgSend(objc_alloc((Class)off_1E50B4A80), "initWithDataSource:selectedIndexPaths:", v10, v27);

        v9 = (void *)v31;
      }
    }
    else
    {
      v19 = objc_alloc((Class)off_1E50B4A80);
      objc_msgSend(v10, "allItemIndexPaths");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithDataSource:selectedIndexPaths:", v10, v20);

      v9 = (void *)v21;
    }
  }
  else
  {
    objc_msgSend(v9, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "identifier");
    -[PXAssetActionManager objectReference](self, "objectReference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "indexPath");
      v16 = v53;
    }
    else
    {
      v16 = 0;
      v53 = 0u;
      v54 = 0u;
    }

    if (v13 != v16)
    {
      objc_msgSend(v9, "dataSource");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetActionManager objectReference](self, "objectReference");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectReferenceForObjectReference:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetActionManager setObjectReference:](self, "setObjectReference:", v34);

    }
    v35 = objc_alloc((Class)off_1E50B4A80);
    objc_msgSend(v9, "dataSource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetActionManager objectReference](self, "objectReference");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
      objc_msgSend(v37, "indexPath");
    else
      memset(v52, 0, sizeof(v52));
    v39 = objc_msgSend(v35, "initWithDataSource:selectedIndexPath:", v36, v52);

    v9 = (void *)v39;
  }

  return v9;
}

void __96__PXPhotoKitMessagesAssetActionManager__selectionSnapshotForPerformerClass_applySubsetIfNeeded___block_invoke(uint64_t a1, __int128 *a2)
{
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "assetCollectionForSection:", *((_QWORD *)a2 + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v10 = *a2;
  v11 = v6;
  objc_msgSend(v5, "assetAtSimpleIndexPath:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "canPerformOnAsset:inAssetCollection:person:socialGroup:", v7, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
  {
    v8 = *(void **)(a1 + 56);
    v9 = a2[1];
    v10 = *a2;
    v11 = v9;
    objc_msgSend(v8, "addIndexPath:", &v10);
  }

}

+ (id)assetActionManagerWithCMMSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSelectionManager:", v6);
  objc_msgSend(v6, "dataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitMessagesAssetActionManager assetActionManagerWithCMMSession:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotoKitMessagesAssetActionManager.m"), 24, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionManager.dataSourceManager"), v18);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PXPhotoKitMessagesAssetActionManager assetActionManagerWithCMMSession:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotoKitMessagesAssetActionManager.m"), 24, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionManager.dataSourceManager"), v18, v20);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v7, "setDataSourceManager:", v8);

  objc_msgSend(v4, "importStatusManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImportStatusManager:", v9);

  objc_msgSend(v4, "importSessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setImportSessionID:", v10);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v21[0] = CFSTR("PXAssetActionTypeAddToLibrary");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAllowedActionTypes:", v13);
  return v7;
}

@end
