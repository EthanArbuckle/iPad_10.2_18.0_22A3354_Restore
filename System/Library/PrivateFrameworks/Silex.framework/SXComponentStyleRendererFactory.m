@implementation SXComponentStyleRendererFactory

- (SXComponentStyleRendererFactory)initWithImageFillViewFactory:(id)a3 videoFillViewFactory:(id)a4 gradientFactory:(id)a5 repeatableImageFillViewFactory:(id)a6 viewport:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SXComponentStyleRendererFactory *v17;
  SXComponentStyleRendererFactory *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SXComponentStyleRendererFactory;
  v17 = -[SXComponentStyleRendererFactory init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageFillViewFactory, a3);
    objc_storeStrong((id *)&v18->_videoFillViewFactory, a4);
    objc_storeStrong((id *)&v18->_gradientFactory, a5);
    objc_storeStrong((id *)&v18->_repeatableImageFillViewFactory, a6);
    objc_storeStrong((id *)&v18->_viewport, a7);
  }

  return v18;
}

- (id)componentStyleRendererForComponentStyle:(id)a3
{
  id v4;
  SXComponentStyleRenderer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SXComponentStyleRenderer *v11;

  v4 = a3;
  v5 = [SXComponentStyleRenderer alloc];
  -[SXComponentStyleRendererFactory viewport](self, "viewport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRendererFactory imageFillViewFactory](self, "imageFillViewFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRendererFactory videoFillViewFactory](self, "videoFillViewFactory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRendererFactory gradientFactory](self, "gradientFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXComponentStyleRendererFactory repeatableImageFillViewFactory](self, "repeatableImageFillViewFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXComponentStyleRenderer initWithComponentStyle:viewport:imageFillViewFactory:videoFillViewFactory:gradientViewFactory:repeatableImageFillViewFactory:](v5, "initWithComponentStyle:viewport:imageFillViewFactory:videoFillViewFactory:gradientViewFactory:repeatableImageFillViewFactory:", v4, v6, v7, v8, v9, v10);

  return v11;
}

- (SXImageFillViewFactory)imageFillViewFactory
{
  return self->_imageFillViewFactory;
}

- (SXVideoFillViewFactory)videoFillViewFactory
{
  return self->_videoFillViewFactory;
}

- (SXGradientFactory)gradientFactory
{
  return self->_gradientFactory;
}

- (SXRepeatableImageFillViewFactory)repeatableImageFillViewFactory
{
  return self->_repeatableImageFillViewFactory;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_repeatableImageFillViewFactory, 0);
  objc_storeStrong((id *)&self->_gradientFactory, 0);
  objc_storeStrong((id *)&self->_videoFillViewFactory, 0);
  objc_storeStrong((id *)&self->_imageFillViewFactory, 0);
}

@end
