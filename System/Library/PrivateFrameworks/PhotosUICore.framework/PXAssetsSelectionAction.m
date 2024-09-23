@implementation PXAssetsSelectionAction

- (PXAssetsSelectionAction)initWithSelectionSnapshot:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PXAssetsSelectionAction *v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_super v17;

  v6 = a3;
  objc_msgSend(v6, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSelectionAction.m"), 23, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectionSnapshot.dataSource"), v14, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSelectionAction.m"), 23, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectionSnapshot.dataSource"), v14);
  }

LABEL_3:
  objc_msgSend(v7, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PXAssetsSelectionAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v17, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_selectionSnapshot, a3);
    objc_storeStrong((id *)&v10->_photosDataSource, v8);
  }

  return v10;
}

- (void)enumerateSelectedAssetIndexSetsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v4 = a3;
  -[PXAssetsSelectionAction photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSelectionAction selectionSnapshot](self, "selectionSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PXAssetsSelectionAction_enumerateSelectedAssetIndexSetsUsingBlock___block_invoke;
  v10[3] = &unk_1E511A0D8;
  v11 = v5;
  v12 = v4;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v7, "enumerateItemIndexSetsUsingBlock:", v10);

}

- (PXFastEnumeration)selectedAssets
{
  void *v2;
  void *v3;

  -[PXAssetsSelectionAction selectionSnapshot](self, "selectionSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allItemsEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXFastEnumeration *)v3;
}

- (PXSelectionSnapshot)selectionSnapshot
{
  return self->_selectionSnapshot;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_selectionSnapshot, 0);
}

void __69__PXAssetsSelectionAction_enumerateSelectedAssetIndexSetsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "assetCollectionForSection:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetsInSection:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
