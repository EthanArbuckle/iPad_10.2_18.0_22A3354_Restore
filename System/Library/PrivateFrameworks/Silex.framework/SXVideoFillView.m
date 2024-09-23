@implementation SXVideoFillView

- (SXVideoFillView)initWithVideoFill:(id)a3 DOMObjectProvider:(id)a4 imageViewFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXVideoFillView *v12;
  SXVideoFillView *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SXImageResource *imageResource;
  uint64_t v19;
  SXImageView *imageView;
  SXVideoFillPlayerView *v21;
  SXVideoFillPlayerView *playerView;
  SXClippingView *v23;
  SXClippingView *clippingView;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SXVideoFillView;
  v12 = -[SXFillView initWithFill:](&v26, sel_initWithFill_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_videoFill, a3);
    objc_msgSend(v9, "resourceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resourceForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stillImageIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageResourceForIdentifier:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    imageResource = v13->_imageResource;
    v13->_imageResource = (SXImageResource *)v17;

    objc_msgSend(v11, "imageViewForResource:", v13->_imageResource);
    v19 = objc_claimAutoreleasedReturnValue();
    imageView = v13->_imageView;
    v13->_imageView = (SXImageView *)v19;

    -[SXImageView setIsDecorative:](v13->_imageView, "setIsDecorative:", 1);
    v21 = -[SXVideoFillPlayerView initWithVideoResource:imageView:]([SXVideoFillPlayerView alloc], "initWithVideoResource:imageView:", v15, v13->_imageView);
    playerView = v13->_playerView;
    v13->_playerView = v21;

    -[SXVideoFillPlayerView setFillMode:](v13->_playerView, "setFillMode:", objc_msgSend(v9, "fillMode"));
    -[SXVideoFillPlayerView setShouldLoop:](v13->_playerView, "setShouldLoop:", objc_msgSend(v9, "loop"));
    v23 = -[SXClippingView initWithContentView:]([SXClippingView alloc], "initWithContentView:", v13->_playerView);
    clippingView = v13->_clippingView;
    v13->_clippingView = v23;

    -[SXVideoFillView addSubview:](v13, "addSubview:", v13->_clippingView);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  if (-[SXImageView objectHasQualityInterest:quality:](self->_imageView, "objectHasQualityInterest:quality:", self, 0))
  {
    -[SXImageView giveUpInterestForObject:](self->_imageView, "giveUpInterestForObject:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)SXVideoFillView;
  -[SXVideoFillView dealloc](&v3, sel_dealloc);
}

- (void)load
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXVideoFillView;
  -[SXFillView load](&v5, sel_load);
  if (!-[SXImageView objectHasQualityInterest:quality:](self->_imageView, "objectHasQualityInterest:quality:", self, 0))
  {
    -[SXVideoFillView contentFrame](self, "contentFrame");
    -[SXImageView setPreferredImageSize:](self->_imageView, "setPreferredImageSize:", v3, v4);
    -[SXImageView addInterestInImageQuality:forObject:](self->_imageView, "addInterestInImageQuality:forObject:", 0, self);
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXVideoFillView;
  -[SXVideoFillView layoutSubviews](&v4, sel_layoutSubviews);
  -[SXVideoFillView clippingView](self, "clippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXVideoFillView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[SXVideoFillView imageResource](self, "imageResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dimensions");
  v8 = v7;
  v10 = v9;

  -[SXFillView fill](self, "fill");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fillMode");

  -[SXFillView fill](self, "fill");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "horizontalAlignment");

  -[SXFillView fill](self, "fill");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "verticalAlignment");

  +[SXFillPositioning frameForFillWithDimensions:withinBounds:fillMode:horizontalAlignment:verticalAlignment:](SXFillPositioning, "frameForFillWithDimensions:withinBounds:fillMode:horizontalAlignment:verticalAlignment:", v12, v14, v16, v8, v10, width, height);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)play
{
  id v2;

  -[SXVideoFillView playerView](self, "playerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "play");

}

- (void)pause
{
  id v2;

  -[SXVideoFillView playerView](self, "playerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)reset
{
  id v2;

  -[SXVideoFillView playerView](self, "playerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (CGRect)contentFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SXVideoFillView clippingView](self, "clippingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SXVideoFillView clippingView](self, "clippingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);

}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (SXVideoFill)videoFill
{
  return self->_videoFill;
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (SXVideoFillPlayerView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_playerView, a3);
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (void)setImageResource:(id)a3
{
  objc_storeStrong((id *)&self->_imageResource, a3);
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_videoFill, 0);
}

@end
