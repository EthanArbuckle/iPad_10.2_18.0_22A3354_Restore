@implementation PUAssetExplorerReviewScreenAssetsDataSourceManager

- (PUAssetExplorerReviewScreenAssetsDataSourceManager)initWithOriginalDataSourceManager:(id)a3
{
  id v5;
  PUAssetExplorerReviewScreenAssetsDataSourceManager *v6;
  PUAssetExplorerReviewScreenAssetsDataSourceManager *v7;
  void *v8;
  PUAssetExplorerReviewScreenAssetsDataSourceManager *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSourceManager;
  v6 = -[PUAssetExplorerReviewScreenAssetsDataSourceManager init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__originalDataSourceManager, a3);
    -[PUAssetsDataSourceManager setDelegate:](v7->__originalDataSourceManager, "setDelegate:", v7);
    objc_msgSend(v5, "assetsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUAssetsDataSourceManager setAssetsDataSource:](v7, "setAssetsDataSource:", v8);
    v9 = v7;

  }
  return v7;
}

- (void)detachFromOriginalDataSourceManager
{
  void *v3;

  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _originalDataSourceManager](self, "_originalDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _setOriginalDataSourceManager:](self, "_setOriginalDataSourceManager:", 0);
}

- (void)performChanges:(id)a3
{
  void (**v4)(id, PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *);
  PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *v5;
  void *v6;
  id v7;

  v4 = (void (**)(id, PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation *))a3;
  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _replacementAssetsByUUID](self, "_replacementAssetsByUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation initWithReplacementAssetsByUUID:]([PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation alloc], "initWithReplacementAssetsByUUID:", v7);
  v4[2](v4, v5);

  -[PUMutableAssetExplorerReviewScreenAssetsDataSourceManagerImplementation replacementAssetsByUUID](v5, "replacementAssetsByUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _setReplacementAssetsByUUID:](self, "_setReplacementAssetsByUUID:", v6);
  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _updateDataSource](self, "_updateDataSource");

}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PUAssetExplorerReviewScreenAssetsDataSource *v8;
  id v9;

  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _originalDataSourceManager](self, "_originalDataSourceManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenAssetsDataSourceManager _replacementAssetsByUUID](self, "_replacementAssetsByUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUAssetExplorerReviewScreenAssetsDataSource initWithDataSource:substitutedAssets:]([PUAssetExplorerReviewScreenAssetsDataSource alloc], "initWithDataSource:substitutedAssets:", v3, v7);
  -[PUAssetsDataSourceManager setAssetsDataSource:](self, "setAssetsDataSource:", v8);

}

- (id)assetsDataSourceManagerInterestingAssetReferences:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[PUAssetsDataSourceManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsDataSourceManagerInterestingAssetReferences:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __104__PUAssetExplorerReviewScreenAssetsDataSourceManager_assetsDataSourceManagerInterestingAssetReferences___block_invoke;
  v10[3] = &unk_1E589CCE0;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (NSDictionary)_replacementAssetsByUUID
{
  return self->__replacementAssetsByUUID;
}

- (void)_setReplacementAssetsByUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PUAssetsDataSourceManager)_originalDataSourceManager
{
  return self->__originalDataSourceManager;
}

- (void)_setOriginalDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->__originalDataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__originalDataSourceManager, 0);
  objc_storeStrong((id *)&self->__replacementAssetsByUUID, 0);
}

void __104__PUAssetExplorerReviewScreenAssetsDataSourceManager_assetsDataSourceManagerInterestingAssetReferences___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "originalAssetReference");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

@end
