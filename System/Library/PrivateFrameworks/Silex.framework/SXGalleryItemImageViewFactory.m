@implementation SXGalleryItemImageViewFactory

- (SXGalleryItemImageViewFactory)initWithResourceDataSourceProvider:(id)a3 reachabilityProvider:(id)a4
{
  id v7;
  id v8;
  SXGalleryItemImageViewFactory *v9;
  SXGalleryItemImageViewFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXGalleryItemImageViewFactory;
  v9 = -[SXGalleryItemImageViewFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceDataSourceProvider, a3);
    objc_storeStrong((id *)&v10->_reachabilityProvider, a4);
  }

  return v10;
}

- (id)imageViewForGalleryItem:(id)a3 imageResource:(id)a4
{
  id v6;
  id v7;
  SXGalleryItemImageView *v8;
  void *v9;
  void *v10;
  void *v11;
  SXGalleryItemImageView *v12;

  v6 = a4;
  v7 = a3;
  v8 = [SXGalleryItemImageView alloc];
  -[SXGalleryItemImageViewFactory resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXGalleryItemImageViewFactory reachabilityProvider](self, "reachabilityProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SXGalleryItemImageView initWithGalleryItem:imageResource:resourceDataSource:reachabilityProvider:](v8, "initWithGalleryItem:imageResource:resourceDataSource:reachabilityProvider:", v7, v6, v10, v11);

  return v12;
}

- (SXResourceDataSourceProvider)resourceDataSourceProvider
{
  return self->_resourceDataSourceProvider;
}

- (SWReachabilityProvider)reachabilityProvider
{
  return self->_reachabilityProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reachabilityProvider, 0);
  objc_storeStrong((id *)&self->_resourceDataSourceProvider, 0);
}

@end
