@implementation PUCameraTransientAssetsDataSourceManager

- (PUCameraTransientAssetsDataSourceManager)init
{
  return -[PUCameraTransientAssetsDataSourceManager initWithTransientDataSource:](self, "initWithTransientDataSource:", 0);
}

- (PUCameraTransientAssetsDataSourceManager)initWithTransientDataSource:(id)a3
{
  id v5;
  PUCameraTransientAssetsDataSourceManager *v6;
  uint64_t v7;
  PUDisplayAssetCollection *containingAssetCollection;
  PUCameraTransientAssetsDataSourceManager *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUCameraTransientAssetsDataSourceManager;
  v6 = -[PUCameraTransientAssetsDataSourceManager init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", MEMORY[0x1E0C9AA60], 0);
    v7 = objc_claimAutoreleasedReturnValue();
    containingAssetCollection = v6->__containingAssetCollection;
    v6->__containingAssetCollection = (PUDisplayAssetCollection *)v7;

    objc_storeStrong((id *)&v6->__transientDataSource, a3);
    objc_msgSend(v5, "registerChangeObserver:", v6);
    -[PUCameraTransientAssetsDataSourceManager _updateWithTransientDataSource:](v6, "_updateWithTransientDataSource:", v5);
    v9 = v6;
  }

  return v6;
}

- (void)_updateWithTransientDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PUCameraTransientAssetsDataSource *v8;
  id v9;

  v4 = a3;
  -[PUCameraTransientAssetsDataSourceManager _containingAssetCollection](self, "_containingAssetCollection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuids");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientAssetMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientBurstMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PUCameraTransientAssetsDataSource initWithUUIDs:mapping:representativeMapping:inAssetCollection:]([PUCameraTransientAssetsDataSource alloc], "initWithUUIDs:mapping:representativeMapping:inAssetCollection:", v5, v6, v7, v9);
  -[PUAssetsDataSourceManager setAssetsDataSource:](self, "setAssetsDataSource:", v8);

}

- (PUTransientDataSource)_transientDataSource
{
  return self->__transientDataSource;
}

- (PUDisplayAssetCollection)_containingAssetCollection
{
  return self->__containingAssetCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__containingAssetCollection, 0);
  objc_storeStrong((id *)&self->__transientDataSource, 0);
}

@end
