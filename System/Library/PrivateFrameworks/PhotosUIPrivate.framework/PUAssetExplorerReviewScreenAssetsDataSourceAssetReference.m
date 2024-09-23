@implementation PUAssetExplorerReviewScreenAssetsDataSourceAssetReference

- (PUAssetExplorerReviewScreenAssetsDataSourceAssetReference)initWithOriginalAssetReference:(id)a3 asset:(id)a4 dataSourceIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PUAssetExplorerReviewScreenAssetsDataSourceAssetReference *v14;
  PUAssetExplorerReviewScreenAssetsDataSourceAssetReference *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSourceAssetReference;
  v14 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](&v17, sel_initWithAsset_assetCollection_indexPath_dataSourceIdentifier_, v11, v12, v13, v10);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_originalAssetReference, a3);
    v15 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUAssetExplorerReviewScreenAssetsDataSourceAssetReference;
  -[PUAssetReference description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetExplorerReviewScreenAssetsDataSourceAssetReference originalAssetReference](self, "originalAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" originalAssetReference:%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PUAssetReference)originalAssetReference
{
  return self->_originalAssetReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalAssetReference, 0);
}

@end
