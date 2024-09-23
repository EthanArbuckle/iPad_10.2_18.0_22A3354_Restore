@implementation _PXArrayDisplayAssetFetchResult

- (_PXArrayDisplayAssetFetchResult)init
{
  return -[_PXArrayDisplayAssetFetchResult initWithAssets:](self, "initWithAssets:", MEMORY[0x24BDBD1A8]);
}

- (_PXArrayDisplayAssetFetchResult)initWithAssets:(id)a3
{
  id v4;
  _PXArrayDisplayAssetFetchResult *v5;
  uint64_t v6;
  NSArray *assets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXArrayDisplayAssetFetchResult;
  v5 = -[_PXArrayDisplayAssetFetchResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

  }
  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_assets, "objectAtIndex:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return -[NSArray objectsAtIndexes:](self->_assets, "objectsAtIndexes:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_assets, "indexOfObject:", a3);
}

- (PXDisplayAsset)firstObject
{
  return (PXDisplayAsset *)-[NSArray firstObject](self->_assets, "firstObject");
}

- (PXDisplayAsset)lastObject
{
  return (PXDisplayAsset *)-[NSArray lastObject](self->_assets, "lastObject");
}

- (BOOL)containsObject:(id)a3
{
  return -[NSArray containsObject:](self->_assets, "containsObject:", a3);
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  NSArray *assets;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];

  assets = self->_assets;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62___PXArrayDisplayAssetFetchResult_countOfAssetsWithMediaType___block_invoke;
  v7[3] = &__block_descriptor_40_e33_B32__0___PXDisplayAsset__8Q16_B24l;
  v7[4] = a3;
  -[NSArray indexesOfObjectsPassingTest:](assets, "indexesOfObjectsPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)count
{
  return -[NSArray count](self->_assets, "count");
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
