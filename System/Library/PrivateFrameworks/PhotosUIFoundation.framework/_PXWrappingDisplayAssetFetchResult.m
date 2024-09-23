@implementation _PXWrappingDisplayAssetFetchResult

- (_PXWrappingDisplayAssetFetchResult)initWithFetchResult:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _PXWrappingDisplayAssetFetchResult *v10;
  void *v12;
  void *v13;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXWrappingDisplayAssetFetchResult;
  v10 = -[_PXWrappingDisplayAssetFetchResult init](&v14, sel_init);
  if (v10)
  {
    if (location >= objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXDisplayAssetFetchResult.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.location < fetchResult.count"));

    }
    if (location + length > objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PXDisplayAssetFetchResult.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(range) <= fetchResult.count"));

    }
    objc_storeStrong((id *)&v10->_displayFetchResult, a3);
    v10->_range.location = location;
    v10->_range.length = length;
  }

  return v10;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromRange(self->_range);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetFetchResult description](self->_displayFetchResult, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p: range = %@; fetchResult = %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)-[PXDisplayAssetFetchResult objectAtIndex:](self->_displayFetchResult, "objectAtIndex:", self->_range.location + a3);
}

- (id)objectsAtIndexes:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "shiftIndexesStartingAtIndex:by:", 0, self->_range.location);
  -[PXDisplayAssetFetchResult objectsAtIndexes:](self->_displayFetchResult, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PXDisplayAsset)firstObject
{
  void *v2;

  if (self->_range.length)
  {
    -[PXDisplayAssetFetchResult objectAtIndex:](self->_displayFetchResult, "objectAtIndex:", self->_range.location);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return (PXDisplayAsset *)v2;
}

- (PXDisplayAsset)lastObject
{
  NSUInteger length;
  void *v3;

  length = self->_range.length;
  if (length)
  {
    -[PXDisplayAssetFetchResult objectAtIndex:](self->_displayFetchResult, "objectAtIndex:", length + self->_range.location - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (PXDisplayAsset *)v3;
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t v4;
  unint64_t result;
  NSUInteger location;

  v4 = -[PXDisplayAssetFetchResult indexOfObject:](self->_displayFetchResult, "indexOfObject:", a3);
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    location = self->_range.location;
    if (v4 >= location && v4 < self->_range.length + location)
      return v4 - location;
  }
  return result;
}

- (BOOL)containsObject:(id)a3
{
  return -[PXDisplayAssetFetchResult containsObject:](self->_displayFetchResult, "containsObject:", a3);
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return -[PXDisplayAssetFetchResult countOfAssetsWithMediaType:](self->_displayFetchResult, "countOfAssetsWithMediaType:", a3);
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  return -[PXDisplayAssetFetchResult cachedCountOfAssetsWithMediaType:](self->_displayFetchResult, "cachedCountOfAssetsWithMediaType:", a3);
}

- (int64_t)count
{
  return self->_range.length;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return (id)-[PXDisplayAssetFetchResult thumbnailAssetAtIndex:](self->_displayFetchResult, "thumbnailAssetAtIndex:", self->_range.location + a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayFetchResult, 0);
}

@end
