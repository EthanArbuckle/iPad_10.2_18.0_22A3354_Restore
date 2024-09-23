@implementation _PXStoryConcreteScorerDisplayAsset

- (void)setResourceIndex:(int64_t)a3 resourcesDataSource:(id)a4
{
  id v6;
  PXDisplayAsset *v7;
  PXDisplayAsset *displayAsset;
  id v9;

  self->_resourceIndex = a3;
  objc_storeStrong((id *)&self->_resourcesDataSource, a4);
  v6 = a4;
  objc_msgSend(v6, "displayAssetResourceAtIndex:", self->_resourceIndex);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_storyResourceDisplayAsset");
  v7 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
  displayAsset = self->_displayAsset;
  self->_displayAsset = v7;

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_displayAsset;
}

- (id)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (int64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (id)displayAsset
{
  return self->_displayAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
}

@end
