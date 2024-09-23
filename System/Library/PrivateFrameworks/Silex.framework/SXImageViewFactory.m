@implementation SXImageViewFactory

- (SXImageViewFactory)initWithResourceDataSourceProvider:(id)a3 reachabilityProvider:(id)a4
{
  id v7;
  id v8;
  SXImageViewFactory *v9;
  SXImageViewFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXImageViewFactory;
  v9 = -[SXImageViewFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resourceDataSourceProvider, a3);
    objc_storeStrong((id *)&v10->_reachabilityProvider, a4);
  }

  return v10;
}

- (id)imageViewForResource:(id)a3
{
  id v4;
  SXImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  SXImageView *v9;

  v4 = a3;
  v5 = [SXImageView alloc];
  -[SXImageViewFactory resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageViewFactory reachabilityProvider](self, "reachabilityProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXImageView initWithImageResource:resourceDataSource:reachabilityProvider:](v5, "initWithImageResource:resourceDataSource:reachabilityProvider:", v4, v7, v8);

  return v9;
}

- (id)repeatableImageViewForResource:(id)a3
{
  id v4;
  SXRepeatableImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  SXRepeatableImageView *v9;

  v4 = a3;
  v5 = [SXRepeatableImageView alloc];
  -[SXImageViewFactory resourceDataSourceProvider](self, "resourceDataSourceProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageViewFactory reachabilityProvider](self, "reachabilityProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SXImageView initWithImageResource:resourceDataSource:reachabilityProvider:](v5, "initWithImageResource:resourceDataSource:reachabilityProvider:", v4, v7, v8);

  return v9;
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
