@implementation PUAssetReference

- (PUAssetReference)init
{
  return -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](self, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", 0, 0, 0, 0);
}

- (PUAssetReference)initWithAsset:(id)a3 assetCollection:(id)a4 indexPath:(id)a5 dataSourceIdentifier:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  PUAssetReference *v16;
  NSString *v17;
  void *dataSourceIdentifier;
  void *v19;
  uint64_t v20;
  NSString *v21;
  void *v23;
  void *v24;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v25.receiver = self;
  v25.super_class = (Class)PUAssetReference;
  v16 = -[PUAssetReference init](&v25, sel_init);
  if (v16)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("PUAssetReference.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("asset != nil"));

    }
    objc_storeStrong((id *)&v16->_asset, a3);
    if (v15)
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("PUAssetReference.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

      }
      v17 = (NSString *)v15;
      dataSourceIdentifier = v16->_dataSourceIdentifier;
      v16->_dataSourceIdentifier = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      dataSourceIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(dataSourceIdentifier, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("random-"), "stringByAppendingString:", v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v16->_dataSourceIdentifier;
      v16->_dataSourceIdentifier = (NSString *)v20;

    }
    objc_storeStrong((id *)&v16->_assetCollection, a4);
    objc_storeStrong((id *)&v16->_indexPath, a5);
  }

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PUAssetReference asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[NSIndexPath isEqual:](self->_indexPath, "isEqual:", v4[3])
    && -[NSString isEqual:](self->_dataSourceIdentifier, "isEqual:", v4[4]))
  {
    v5 = -[PUDisplayAsset isEqual:](self->_asset, "isEqual:", v4[1]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUAssetReference;
  -[PUAssetReference description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetReference asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetReference assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetReference indexPath](self, "indexPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetReference dataSourceIdentifier](self, "dataSourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" asset=%@ assetCollection=%@ indexPath=%@ dataSourceIdentifier=%@"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (PXSimpleIndexPath)simpleIndexPath
{
  PXSimpleIndexPath *result;
  id v5;

  -[PUAssetReference indexPath](self, "indexPath");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  PXSimpleIndexPathFromIndexPath();

  return result;
}

- (PXAssetReference)pxAssetReference
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v9[4];

  if (pxAssetReference_onceToken != -1)
    dispatch_once(&pxAssetReference_onceToken, &__block_literal_global_13519);
  -[PUAssetReference indexPath](self, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXSimpleIndexPathFromIndexPath();

  v4 = objc_alloc(MEMORY[0x1E0D7CCD0]);
  -[PUAssetReference assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetReference asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v9, 0, sizeof(v9));
  v7 = (void *)objc_msgSend(v4, "initWithSectionObject:itemObject:subitemObject:indexPath:", v5, v6, 0, v9);

  return (PXAssetReference *)v7;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (NSString)dataSourceIdentifier
{
  return self->_dataSourceIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

uint64_t __36__PUAssetReference_pxAssetReference__block_invoke()
{
  uint64_t result;

  result = PXDataSourceIdentifierMakeUnique();
  pxAssetReference_unknownDataSourceIdentifier = result;
  return result;
}

@end
