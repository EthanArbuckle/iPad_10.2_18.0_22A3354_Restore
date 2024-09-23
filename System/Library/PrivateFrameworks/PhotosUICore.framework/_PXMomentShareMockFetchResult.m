@implementation _PXMomentShareMockFetchResult

- (_PXMomentShareMockFetchResult)initWithAssets:(id)a3
{
  id v5;
  _PXMomentShareMockFetchResult *v6;
  _PXMomentShareMockFetchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXMomentShareMockFetchResult;
  v6 = -[_PXMomentShareMockFetchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assets, a3);

  return v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_assets, "objectAtIndex:", a3);
}

- (BOOL)containsObject:(id)a3
{
  return -[NSArray containsObject:](self->_assets, "containsObject:", a3);
}

- (id)objectsAtIndexes:(id)a3
{
  return -[NSArray objectsAtIndexes:](self->_assets, "objectsAtIndexes:", a3);
}

- (PXDisplayAsset)firstObject
{
  void *v3;

  if (-[_PXMomentShareMockFetchResult count](self, "count") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[_PXMomentShareMockFetchResult objectAtIndex:](self, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)lastObject
{
  void *v3;

  if (-[_PXMomentShareMockFetchResult count](self, "count") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[_PXMomentShareMockFetchResult objectAtIndex:](self, "objectAtIndex:", -[_PXMomentShareMockFetchResult count](self, "count") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v3;
}

- (int64_t)count
{
  return -[NSArray count](self->_assets, "count");
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assets, 0);
}

+ (id)momentShareMockFetchResultWithPhotosCount:(unint64_t)a3 videosCount:(unint64_t)a4
{
  id i;
  _PXMomentShareMockDisplayAsset *v7;
  _PXMomentShareMockDisplayAsset *v8;
  _PXMomentShareMockFetchResult *v9;

  for (i = objc_alloc_init(MEMORY[0x1E0C99DE8]); a3; --a3)
  {
    v7 = objc_alloc_init(_PXMomentShareMockDisplayAsset);
    -[_PXMomentShareMockDisplayAsset setMediaType:](v7, "setMediaType:", 1);
    objc_msgSend(i, "addObject:", v7);

  }
  for (; a4; --a4)
  {
    v8 = objc_alloc_init(_PXMomentShareMockDisplayAsset);
    -[_PXMomentShareMockDisplayAsset setMediaType:](v8, "setMediaType:", 2);
    objc_msgSend(i, "addObject:", v8);

  }
  v9 = -[_PXMomentShareMockFetchResult initWithAssets:]([_PXMomentShareMockFetchResult alloc], "initWithAssets:", i);

  return v9;
}

@end
