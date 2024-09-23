@implementation _PXStoryDummyDisplayAssetsFetchResult

- (_PXStoryDummyDisplayAssetsFetchResult)initWithResourcesDataSource:(id)a3
{
  id v5;
  _PXStoryDummyDisplayAssetsFetchResult *v6;
  _PXStoryDummyDisplayAssetsFetchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryDummyDisplayAssetsFetchResult;
  v6 = -[_PXStoryDummyDisplayAssetsFetchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_resourcesDataSource, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_resourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryDummyDisplayAssetsFetchResult;
  -[_PXStoryDummyDisplayAssetsFetchResult dealloc](&v3, sel_dealloc);
}

- (void)configureWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  int64_t *resourceIndexes;

  length = a3.length;
  location = a3.location;
  -[_PXStoryDummyDisplayAssetsFetchResult setCount:](self, "setCount:", a3.length);
  if (length)
  {
    resourceIndexes = self->_resourceIndexes;
    do
    {
      *resourceIndexes++ = location++;
      --length;
    }
    while (length);
  }
}

- (void)setCount:(int64_t)a3
{
  int64_t capacity;

  if (self->_count != a3)
  {
    self->_count = a3;
    capacity = self->_capacity;
    _PXGArrayCapacityResizeToCount();
    self->_capacity = capacity;
  }
}

- (const)resourceIndexes
{
  return self->_resourceIndexes;
}

- (id)storyDisplayAssetAtIndex:(int64_t)a3
{
  PXStoryReusableDisplayAsset *asset;
  PXStoryReusableDisplayAsset *v6;
  PXStoryReusableDisplayAsset *v7;

  asset = self->_asset;
  if (!asset)
  {
    v6 = objc_alloc_init(PXStoryReusableDisplayAsset);
    v7 = self->_asset;
    self->_asset = v6;

    asset = self->_asset;
  }
  -[PXStoryReusableDisplayAsset configureWithDisplayResourceIndex:resourcesDataSource:](asset, "configureWithDisplayResourceIndex:resourcesDataSource:", self->_resourceIndexes[a3], self->_resourcesDataSource);
  return self->_asset;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self->_resourcesDataSource, "displayAssetResourceAtIndex:", self->_resourceIndexes[a3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_storyResourceDisplayAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)objectsAtIndexes:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTimelineProducer.m"), 173, CFSTR("%s not implemented yet"), "-[_PXStoryDummyDisplayAssetsFetchResult objectsAtIndexes:]");

  abort();
}

- (PXDisplayAsset)firstObject
{
  void *v3;

  if (-[_PXStoryDummyDisplayAssetsFetchResult count](self, "count") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[_PXStoryDummyDisplayAssetsFetchResult objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)lastObject
{
  uint64_t v3;
  void *v4;

  v3 = -[_PXStoryDummyDisplayAssetsFetchResult count](self, "count");
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    -[_PXStoryDummyDisplayAssetsFetchResult objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v3 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v4;
}

- (BOOL)containsObject:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTimelineProducer.m"), 186, CFSTR("%s not implemented yet"), "-[_PXStoryDummyDisplayAssetsFetchResult containsObject:]");

  abort();
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTimelineProducer.m"), 190, CFSTR("%s not implemented yet"), "-[_PXStoryDummyDisplayAssetsFetchResult countOfAssetsWithMediaType:]");

  abort();
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTimelineProducer.m"), 194, CFSTR("%s not implemented yet"), "-[_PXStoryDummyDisplayAssetsFetchResult cachedCountOfAssetsWithMediaType:]");

  abort();
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTimelineProducer.m"), 198, CFSTR("%s not implemented yet"), "-[_PXStoryDummyDisplayAssetsFetchResult thumbnailAssetAtIndex:]");

  abort();
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
