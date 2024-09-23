@implementation SXImageFillViewFactory

- (SXImageFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4
{
  id v7;
  id v8;
  SXImageFillViewFactory *v9;
  SXImageFillViewFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXImageFillViewFactory;
  v9 = -[SXImageFillViewFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_imageViewFactory, a4);
  }

  return v10;
}

- (id)createImageFillViewForImageFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SXImageFillView *v8;
  void *v9;
  SXImageFillView *v10;

  v4 = a3;
  -[SXImageFillViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageResourceForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [SXImageFillView alloc];
  -[SXImageFillViewFactory imageViewFactory](self, "imageViewFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SXImageFillView initWithImageFill:imageResource:imageViewFactory:](v8, "initWithImageFill:imageResource:imageViewFactory:", v4, v7, v9);

  return v10;
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
