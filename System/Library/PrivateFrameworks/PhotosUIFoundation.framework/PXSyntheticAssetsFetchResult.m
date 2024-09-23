@implementation PXSyntheticAssetsFetchResult

- (PXSyntheticAssetsFetchResult)initWithAssets:(id)a3
{
  id v4;
  PXSyntheticAssetsFetchResult *v5;
  uint64_t v6;
  NSArray *assets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXSyntheticAssetsFetchResult;
  v5 = -[PXSyntheticAssetsFetchResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assets = v5->_assets;
    v5->_assets = (NSArray *)v6;

  }
  return v5;
}

- (PXSyntheticAssetsFetchResult)init
{
  return -[PXSyntheticAssetsFetchResult initWithAssets:](self, "initWithAssets:", MEMORY[0x24BDBD1A8]);
}

- (int64_t)count
{
  return -[NSArray count](self->_assets, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return -[NSArray objectsAtIndexes:](self->_assets, "objectsAtIndexes:", a3);
}

- (BOOL)containsObject:(id)a3
{
  return -[NSArray containsObject:](self->_assets, "containsObject:", a3);
}

- (PXDisplayAsset)firstObject
{
  return (PXDisplayAsset *)-[NSArray firstObject](self->_assets, "firstObject");
}

- (PXDisplayAsset)lastObject
{
  return (PXDisplayAsset *)-[NSArray lastObject](self->_assets, "lastObject");
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_assets, "objectAtIndexedSubscript:", a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
