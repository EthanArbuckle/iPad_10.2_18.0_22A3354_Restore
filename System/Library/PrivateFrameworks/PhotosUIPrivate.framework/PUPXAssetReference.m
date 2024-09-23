@implementation PUPXAssetReference

- (PUPXAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXAssetReference.m"), 15, CFSTR("%s is not available as initializer"), "-[PUPXAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:]");

  abort();
}

- (PUPXAssetReference)initWithPXAssetReference:(id)a3 dataSourceIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PUPXAssetReference *v12;
  objc_super v14[3];

  v7 = a3;
  v8 = a4;
  if (v7)
    objc_msgSend(v7, "indexPath");
  else
    memset(&v14[1], 0, 32);
  PXIndexPathFromSimpleIndexPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0].receiver = self;
  v14[0].super_class = (Class)PUPXAssetReference;
  v12 = -[objc_super initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v14, sel_initWithAsset_assetCollection_indexPath_dataSourceIdentifier_, v10, v11, v9, v8);

  if (v12)
    objc_storeStrong((id *)&v12->_underlyingAssetReference, a3);

  return v12;
}

- (PXAssetReference)underlyingAssetReference
{
  return self->_underlyingAssetReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingAssetReference, 0);
}

@end
