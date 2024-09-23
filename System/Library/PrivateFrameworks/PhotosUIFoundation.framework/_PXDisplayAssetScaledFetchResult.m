@implementation _PXDisplayAssetScaledFetchResult

- (_PXDisplayAssetScaledFetchResult)initWithFetchResult:(id)a3 multiplier:(int64_t)a4
{
  id v8;
  _PXDisplayAssetScaledFetchResult *v9;
  void *v11;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_PXDisplayAssetScaledFetchResult;
  v9 = -[_PXDisplayAssetScaledFetchResult init](&v12, sel_init);
  if (v9)
  {
    if (a4 <= 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXDisplayAssetFetchResult.m"), 276, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("multiplier >= 1"));

    }
    objc_storeStrong((id *)&v9->_fetchResult, a3);
    v9->_multipler = a4;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: multiple%ld fetchResult = %@>"), v5, self, self->_multipler, self->_fetchResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[PXDisplayAssetFetchResult objectAtIndex:](self->_fetchResult, "objectAtIndex:", a3 / self->_multipler);
}

- (id)objectsAtIndexes:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _PXDisplayAssetScaledFetchResult *v15;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __53___PXDisplayAssetScaledFetchResult_objectsAtIndexes___block_invoke;
  v13 = &unk_2514D1018;
  v14 = v6;
  v15 = self;
  v7 = v6;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

- (PXDisplayAsset)firstObject
{
  return (PXDisplayAsset *)-[PXDisplayAssetFetchResult firstObject](self->_fetchResult, "firstObject");
}

- (PXDisplayAsset)lastObject
{
  return (PXDisplayAsset *)-[PXDisplayAssetFetchResult lastObject](self->_fetchResult, "lastObject");
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t v4;
  unint64_t result;

  v4 = -[PXDisplayAssetFetchResult indexOfObject:](self->_fetchResult, "indexOfObject:", a3);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    return self->_multipler * v4;
  return result;
}

- (BOOL)containsObject:(id)a3
{
  return -[PXDisplayAssetFetchResult containsObject:](self->_fetchResult, "containsObject:", a3);
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return self->_multipler
       * -[PXDisplayAssetFetchResult countOfAssetsWithMediaType:](self->_fetchResult, "countOfAssetsWithMediaType:", a3);
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  return self->_multipler
       * -[PXDisplayAssetFetchResult cachedCountOfAssetsWithMediaType:](self->_fetchResult, "cachedCountOfAssetsWithMediaType:", a3);
}

- (int64_t)count
{
  return self->_multipler * -[PXDisplayAssetFetchResult count](self->_fetchResult, "count");
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return (id)-[PXDisplayAssetFetchResult thumbnailAssetAtIndex:](self->_fetchResult, "thumbnailAssetAtIndex:", a3 / self->_multipler);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResult, 0);
}

@end
