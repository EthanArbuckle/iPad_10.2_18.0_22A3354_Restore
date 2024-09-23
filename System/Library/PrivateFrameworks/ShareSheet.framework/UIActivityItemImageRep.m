@implementation UIActivityItemImageRep

+ (id)activityItemImageRepWithAsset:(id)a3 thumbnailProvider:(id)a4 dataProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  UIActivityItemImageRep *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(UIActivityItemImageRep);
  -[UIActivityItemImageRep setAsset:](v10, "setAsset:", v9);

  -[UIActivityItemImageRep setThumbnailProvider:](v10, "setThumbnailProvider:", v8);
  -[UIActivityItemImageRep setDataProvider:](v10, "setDataProvider:", v7);

  return v10;
}

- (id)thumbnail
{
  return (id)(*((uint64_t (**)(void))self->_thumbnailProvider + 2))();
}

- (id)data
{
  return (id)(*((uint64_t (**)(void))self->_dataProvider + 2))();
}

- (id)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong(&self->_asset, a3);
}

- (id)thumbnailProvider
{
  return self->_thumbnailProvider;
}

- (void)setThumbnailProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dataProvider, 0);
  objc_storeStrong(&self->_thumbnailProvider, 0);
  objc_storeStrong(&self->_asset, 0);
}

@end
