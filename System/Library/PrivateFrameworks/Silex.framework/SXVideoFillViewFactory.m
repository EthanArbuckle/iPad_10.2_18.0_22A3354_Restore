@implementation SXVideoFillViewFactory

- (SXVideoFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4
{
  id v7;
  id v8;
  SXVideoFillViewFactory *v9;
  SXVideoFillViewFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXVideoFillViewFactory;
  v9 = -[SXVideoFillViewFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_imageViewFactory, a4);
  }

  return v10;
}

- (id)createVideoFillViewForVideoFill:(id)a3
{
  id v4;
  SXVideoFillView *v5;
  void *v6;
  void *v7;
  SXVideoFillView *v8;

  v4 = a3;
  v5 = [SXVideoFillView alloc];
  -[SXVideoFillViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoFillViewFactory imageViewFactory](self, "imageViewFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SXVideoFillView initWithVideoFill:DOMObjectProvider:imageViewFactory:](v5, "initWithVideoFill:DOMObjectProvider:imageViewFactory:", v4, v6, v7);

  return v8;
}

- (SXDOMObjectProviding)DOMObjectProvider
{
  return self->_DOMObjectProvider;
}

- (SXImageViewFactory)imageViewFactory
{
  return self->_imageViewFactory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewFactory, 0);
  objc_storeStrong((id *)&self->_DOMObjectProvider, 0);
}

@end
