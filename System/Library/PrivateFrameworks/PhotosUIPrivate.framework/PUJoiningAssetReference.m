@implementation PUJoiningAssetReference

- (PUJoiningAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  return -[PUJoiningAssetReference initWithContainedAssetReference:hintDataSourceIndex:indexPath:dataSourceIdentifier:](self, "initWithContainedAssetReference:hintDataSourceIndex:indexPath:dataSourceIdentifier:", 0, 0, a5, a6);
}

- (PUJoiningAssetReference)initWithContainedAssetReference:(id)a3 hintDataSourceIndex:(int64_t)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  PUJoiningAssetReference *v17;
  void *v19;
  objc_super v20;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUJoiningAssetsDataSource.m"), 269, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containedAssetReference != nil"));

  }
  objc_msgSend(v12, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)PUJoiningAssetReference;
  v17 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](&v20, sel_initWithAsset_assetCollection_indexPath_dataSourceIdentifier_, v15, v16, v13, v14);

  if (v17)
  {
    v17->_hintDataSourceIndex = a4;
    objc_storeStrong((id *)&v17->_containedAssetReference, a3);
  }

  return v17;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUJoiningAssetReference;
  -[PUAssetReference description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUJoiningAssetReference hintDataSourceIndex](self, "hintDataSourceIndex");
  -[PUJoiningAssetReference containedAssetReference](self, "containedAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" hintDataSourceIndex:%lu containedAssetReference:%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)hintDataSourceIndex
{
  return self->_hintDataSourceIndex;
}

- (PUAssetReference)containedAssetReference
{
  return self->_containedAssetReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedAssetReference, 0);
}

@end
