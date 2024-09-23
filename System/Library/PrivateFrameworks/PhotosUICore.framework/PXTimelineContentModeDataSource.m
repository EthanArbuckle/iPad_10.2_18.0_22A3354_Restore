@implementation PXTimelineContentModeDataSource

- (PXTimelineContentModeDataSource)initWithName:(id)a3 assetSources:(id)a4
{
  id v7;
  id v8;
  PXTimelineContentModeDataSource *v9;
  PXTimelineContentModeDataSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXTimelineContentModeDataSource;
  v9 = -[PXTimelineContentModeDataSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_assetSources, a4);
  }

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (PHFetchResult)assetSources
{
  return self->_assetSources;
}

- (void)setAssetSources:(id)a3
{
  objc_storeStrong((id *)&self->_assetSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSources, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
