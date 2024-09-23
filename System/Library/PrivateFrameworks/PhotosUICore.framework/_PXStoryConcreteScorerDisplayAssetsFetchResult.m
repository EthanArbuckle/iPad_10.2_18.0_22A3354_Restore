@implementation _PXStoryConcreteScorerDisplayAssetsFetchResult

- (void)dealloc
{
  objc_super v3;

  free(self->_resourceIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryConcreteScorerDisplayAssetsFetchResult;
  -[_PXStoryConcreteScorerDisplayAssetsFetchResult dealloc](&v3, sel_dealloc);
}

- (void)removeAllResources
{
  -[_PXStoryConcreteScorerDisplayAssetsFetchResult setCount:](self, "setCount:", 0);
}

- (void)addResourceWithIndex:(int64_t)a3
{
  int64_t v5;

  v5 = -[_PXStoryConcreteScorerDisplayAssetsFetchResult count](self, "count");
  -[_PXStoryConcreteScorerDisplayAssetsFetchResult setCount:](self, "setCount:", -[_PXStoryConcreteScorerDisplayAssetsFetchResult count](self, "count") + 1);
  self->_resourceIndexes[v5] = a3;
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 450, CFSTR("%s not implemented yet"), "-[_PXStoryConcreteScorerDisplayAssetsFetchResult objectsAtIndexes:]");

  abort();
}

- (PXDisplayAsset)firstObject
{
  void *v3;

  if (-[_PXStoryConcreteScorerDisplayAssetsFetchResult count](self, "count") < 1)
  {
    v3 = 0;
  }
  else
  {
    -[_PXStoryConcreteScorerDisplayAssetsFetchResult objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)lastObject
{
  uint64_t v3;
  void *v4;

  v3 = -[_PXStoryConcreteScorerDisplayAssetsFetchResult count](self, "count");
  if (v3 < 1)
  {
    v4 = 0;
  }
  else
  {
    -[_PXStoryConcreteScorerDisplayAssetsFetchResult objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:", v3 - 1);
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
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 463, CFSTR("%s not implemented yet"), "-[_PXStoryConcreteScorerDisplayAssetsFetchResult containsObject:]");

  abort();
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 467, CFSTR("%s not implemented yet"), "-[_PXStoryConcreteScorerDisplayAssetsFetchResult countOfAssetsWithMediaType:]");

  abort();
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 471, CFSTR("%s not implemented yet"), "-[_PXStoryConcreteScorerDisplayAssetsFetchResult cachedCountOfAssetsWithMediaType:]");

  abort();
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimelineScorer.m"), 475, CFSTR("%s not implemented yet"), "-[_PXStoryConcreteScorerDisplayAssetsFetchResult thumbnailAssetAtIndex:]");

  abort();
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (void)setResourcesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_resourcesDataSource, a3);
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
