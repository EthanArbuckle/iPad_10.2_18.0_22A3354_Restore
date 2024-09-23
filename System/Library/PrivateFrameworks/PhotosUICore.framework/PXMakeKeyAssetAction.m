@implementation PXMakeKeyAssetAction

- (PXMakeKeyAssetAction)initWithAssetCollection:(id)a3 keyAsset:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXMakeKeyAssetAction *v10;
  void *v11;
  uint64_t v12;
  PHAsset *undoKeyAsset;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)PXMakeKeyAssetAction;
  v10 = -[PXPhotosAction initWithPhotoLibrary:](&v15, sel_initWithPhotoLibrary_, v9);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetCollection, a3);
    objc_storeStrong((id *)&v10->_redoKeyAsset, a4);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
    undoKeyAsset = v10->_undoKeyAsset;
    v10->_undoKeyAsset = (PHAsset *)v12;

  }
  return v10;
}

- (id)actionIdentifier
{
  return CFSTR("MakeKeyAsset");
}

- (id)actionNameLocalizationKey
{
  return CFSTR("PXPhotoKitAssetActionManagerActionTitle_AlbumMakeKeyPhoto");
}

- (void)performAction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__PXMakeKeyAssetAction_performAction___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (void)performUndo:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __36__PXMakeKeyAssetAction_performUndo___block_invoke;
  v3[3] = &unk_1E5149198;
  v3[4] = self;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v3, a3);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (PHAsset)redoKeyAsset
{
  return self->_redoKeyAsset;
}

- (PHAsset)undoKeyAsset
{
  return self->_undoKeyAsset;
}

- (PHObjectPlaceholder)adaptiveHighlightPlaceholder
{
  return self->_adaptiveHighlightPlaceholder;
}

- (void)setAdaptiveHighlightPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_adaptiveHighlightPlaceholder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adaptiveHighlightPlaceholder, 0);
  objc_storeStrong((id *)&self->_undoKeyAsset, 0);
  objc_storeStrong((id *)&self->_redoKeyAsset, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

void __36__PXMakeKeyAssetAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "undoKeyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCustomKeyAsset:", v3);

}

void __38__PXMakeKeyAssetAction_performAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "assetCollection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "redoKeyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCustomKeyAsset:", v3);

}

@end
