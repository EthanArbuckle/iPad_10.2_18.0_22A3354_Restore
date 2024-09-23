@implementation FRFlintDataLoadingGroup

- (FRFlintDataLoadingGroup)initWithLoadJSONOnce:(id)a3 loadFontsOnce:(id)a4 loadAssetURLsOnce:(id)a5 loadAssetsOnce:(id)a6 loadLinkedContentOnce:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FRFlintDataLoadingGroup *v17;
  FRFlintDataLoadingGroup *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FRFlintDataLoadingGroup;
  v17 = -[FRFlintDataLoadingGroup init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_loadJSONOnce, a3);
    objc_storeStrong((id *)&v18->_loadFontsOnce, a4);
    objc_storeStrong((id *)&v18->_loadAssetURLsOnce, a5);
    objc_storeStrong((id *)&v18->_loadAssetsOnce, a6);
    objc_storeStrong((id *)&v18->_loadLinkedContentOnce, a7);
  }

  return v18;
}

- (FCAsyncOnceOperation)loadJSONOnce
{
  return self->_loadJSONOnce;
}

- (FCAsyncOnceOperation)loadFontsOnce
{
  return self->_loadFontsOnce;
}

- (FCAsyncOnceOperation)loadAssetURLsOnce
{
  return self->_loadAssetURLsOnce;
}

- (FCAsyncOnceOperation)loadAssetsOnce
{
  return self->_loadAssetsOnce;
}

- (FCAsyncOnceOperation)loadLinkedContentOnce
{
  return self->_loadLinkedContentOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadLinkedContentOnce, 0);
  objc_storeStrong((id *)&self->_loadAssetsOnce, 0);
  objc_storeStrong((id *)&self->_loadAssetURLsOnce, 0);
  objc_storeStrong((id *)&self->_loadFontsOnce, 0);
  objc_storeStrong((id *)&self->_loadJSONOnce, 0);
}

@end
