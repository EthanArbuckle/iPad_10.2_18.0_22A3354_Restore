@implementation _PXAudioAssetSingleItemFetchResult

- (_PXAudioAssetSingleItemFetchResult)initWithAsset:(id)a3
{
  id v5;
  _PXAudioAssetSingleItemFetchResult *v6;
  _PXAudioAssetSingleItemFetchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXAudioAssetSingleItemFetchResult;
  v6 = -[_PXAudioAssetSingleItemFetchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_asset, a3);

  return v7;
}

- (_PXAudioAssetSingleItemFetchResult)init
{
  return -[_PXAudioAssetSingleItemFetchResult initWithAsset:](self, "initWithAsset:", 0);
}

- (int64_t)count
{
  return self->_asset != 0;
}

- (PXAudioAsset)firstObject
{
  return self->_asset;
}

- (PXAudioAsset)lastObject
{
  return self->_asset;
}

- (id)objectAtIndex:(unint64_t)a3
{
  PXAudioAsset *asset;
  void *v7;

  if (a3 || (asset = self->_asset) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetFetchResult.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("index == 0 && _asset != nil"));

    asset = self->_asset;
  }
  return asset;
}

- (id)objectsAtIndexes:(id)a3
{
  id v5;
  PXAudioAsset *asset;
  void *v7;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") != 1
    || !objc_msgSend(v5, "containsIndex:", 0)
    || (asset = self->_asset) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAudioAssetFetchResult.m"), 229, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexes.count == 1 && [indexes containsIndex:0] && _asset != nil"));

    asset = self->_asset;
  }
  v10[0] = asset;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)containsObject:(id)a3
{
  PXAudioAsset *asset;

  asset = self->_asset;
  if (asset == a3)
    return 1;
  else
    return objc_msgSend(a3, "isEqual:", asset);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  PXAudioAsset *asset;
  char v4;

  asset = self->_asset;
  if (asset)
  {
    v4 = 0;
    (*((void (**)(id, PXAudioAsset *, _QWORD, char *))a3 + 2))(a3, asset, 0, &v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
