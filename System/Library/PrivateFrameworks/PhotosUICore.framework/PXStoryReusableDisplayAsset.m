@implementation PXStoryReusableDisplayAsset

- (void)configureWithDisplayResourceIndex:(int64_t)a3 resourcesDataSource:(id)a4
{
  id v7;
  PXDisplayAsset *v8;
  PXDisplayAsset *displayAsset;
  id v10;

  objc_storeStrong((id *)&self->_resourcesDataSource, a4);
  v7 = a4;
  self->_resourceIndex = a3;
  -[PXStoryResourcesDataSource displayAssetResourceAtIndex:](self->_resourcesDataSource, "displayAssetResourceAtIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_storyResourceDisplayAsset");
  v8 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
  displayAsset = self->_displayAsset;
  self->_displayAsset = v8;

}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_displayAsset;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryReusableDisplayAsset;
  if (-[PXStoryReusableDisplayAsset respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

- (id)displayAsset
{
  return self->_displayAsset;
}

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (int64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
  objc_storeStrong((id *)&self->_displayAsset, 0);
}

@end
