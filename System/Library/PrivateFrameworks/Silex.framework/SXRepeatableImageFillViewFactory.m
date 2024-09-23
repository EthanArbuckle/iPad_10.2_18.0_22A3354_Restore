@implementation SXRepeatableImageFillViewFactory

- (SXRepeatableImageFillViewFactory)initWithDOMObjectProvider:(id)a3 imageViewFactory:(id)a4
{
  id v7;
  id v8;
  SXRepeatableImageFillViewFactory *v9;
  SXRepeatableImageFillViewFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXRepeatableImageFillViewFactory;
  v9 = -[SXRepeatableImageFillViewFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_DOMObjectProvider, a3);
    objc_storeStrong((id *)&v10->_imageViewFactory, a4);
  }

  return v10;
}

- (id)createRepeatableImageFillViewForRepeatableImageFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SXRepeatableImageFillView *v10;

  v4 = a3;
  -[SXRepeatableImageFillViewFactory DOMObjectProvider](self, "DOMObjectProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageResourceForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXRepeatableImageFillViewFactory imageViewFactory](self, "imageViewFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repeatableImageViewForResource:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SXRepeatableImageFillView initWithRepeatableImageFill:imageView:]([SXRepeatableImageFillView alloc], "initWithRepeatableImageFill:imageView:", v4, v9);
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
