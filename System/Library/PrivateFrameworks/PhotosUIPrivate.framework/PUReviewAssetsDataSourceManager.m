@implementation PUReviewAssetsDataSourceManager

- (PUReviewAssetsDataSourceManager)init
{
  return -[PUReviewAssetsDataSourceManager initWithReviewDataSource:](self, "initWithReviewDataSource:", 0);
}

- (PUReviewAssetsDataSourceManager)initWithReviewDataSource:(id)a3
{
  id v5;
  PUReviewAssetsDataSourceManager *v6;
  uint64_t v7;
  PUDisplayAssetCollection *containingAssetCollection;
  PUReviewAssetsDataSourceManager *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUReviewAssetsDataSourceManager;
  v6 = -[PUReviewAssetsDataSourceManager init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", MEMORY[0x1E0C9AA60], 0);
    v7 = objc_claimAutoreleasedReturnValue();
    containingAssetCollection = v6->__containingAssetCollection;
    v6->__containingAssetCollection = (PUDisplayAssetCollection *)v7;

    objc_storeStrong((id *)&v6->__reviewDataSource, a3);
    objc_msgSend(v5, "registerChangeObserver:", v6);
    -[PUReviewAssetsDataSourceManager _updateWithReviewDataSource:changeDetails:](v6, "_updateWithReviewDataSource:changeDetails:", v5, 0);
    v9 = v6;
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PUReviewAssetsDataSourceManager _reviewDataSource](self, "_reviewDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PUReviewAssetsDataSourceManager;
  -[PUReviewAssetsDataSourceManager dealloc](&v4, sel_dealloc);
}

- (void)_updateWithReviewDataSource:(id)a3 changeDetails:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  PUReviewAssetsDataSource *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "assetsByIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUReviewAssetsDataSourceManager _containingAssetCollection](self, "_containingAssetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PUReviewAssetsDataSource initWithAssetsByIdentifier:usingOrdering:inAssetCollection:]([PUReviewAssetsDataSource alloc], "initWithAssetsByIdentifier:usingOrdering:inAssetCollection:", v12, v8, v9);
  -[PUAssetsDataSourceManager setAssetsDataSource:](self, "setAssetsDataSource:", v10);
  -[PUReviewAssetsDataSourceManager reviewDelegate](self, "reviewDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetsDataSourceManager:didChangeAssetsDataSource:changeDetails:", self, v10, v6);

}

- (PUReviewAssetsDataSourceManagerDelegate)reviewDelegate
{
  return (PUReviewAssetsDataSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_reviewDelegate);
}

- (void)setReviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reviewDelegate, a3);
}

- (PUReviewDataSource)_reviewDataSource
{
  return self->__reviewDataSource;
}

- (PUDisplayAssetCollection)_containingAssetCollection
{
  return self->__containingAssetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containingAssetCollection, 0);
  objc_storeStrong((id *)&self->__reviewDataSource, 0);
  objc_destroyWeak((id *)&self->_reviewDelegate);
}

@end
