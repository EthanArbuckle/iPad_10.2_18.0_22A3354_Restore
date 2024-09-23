@implementation SXImageFillView

- (SXImageFillView)initWithImageFill:(id)a3 imageResource:(id)a4 imageViewFactory:(id)a5
{
  id v9;
  id v10;
  id v11;
  SXImageFillView *v12;
  SXImageFillView *v13;
  uint64_t v14;
  SXImageView *imageView;
  SXImageView *v16;
  void *v17;
  SXClippingView *v18;
  SXClippingView *clippingView;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SXImageFillView;
  v12 = -[SXFillView initWithFill:](&v21, sel_initWithFill_, v9);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageFill, a3);
    objc_storeStrong((id *)&v13->_imageResource, a4);
    objc_msgSend(v11, "imageViewForResource:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    imageView = v13->_imageView;
    v13->_imageView = (SXImageView *)v14;

    v16 = v13->_imageView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXImageView setBackgroundColor:](v16, "setBackgroundColor:", v17);

    v18 = -[SXClippingView initWithContentView:]([SXClippingView alloc], "initWithContentView:", v13->_imageView);
    clippingView = v13->_clippingView;
    v13->_clippingView = v18;

    -[SXImageFillView addSubview:](v13, "addSubview:", v13->_clippingView);
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
  v3.super_class = (Class)SXImageFillView;
  -[SXImageFillView dealloc](&v3, sel_dealloc);
}

- (void)load
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXImageFillView;
  -[SXFillView load](&v5, sel_load);
  if (!-[SXImageView objectHasQualityInterest:quality:](self->_imageView, "objectHasQualityInterest:quality:", self, 0))
  {
    -[SXImageFillView contentFrame](self, "contentFrame");
    -[SXImageView setPreferredImageSize:](self->_imageView, "setPreferredImageSize:", v3, v4);
    -[SXImageView addInterestInImageQuality:forObject:](self->_imageView, "addInterestInImageQuality:forObject:", 0, self);
  }
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXImageFillView;
  -[SXImageFillView layoutSubviews](&v4, sel_layoutSubviews);
  -[SXImageFillView clippingView](self, "clippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageFillView bounds](self, "bounds");
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
  -[SXImageFillView imageResource](self, "imageResource");
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

- (UIImage)image
{
  void *v2;
  void *v3;

  -[SXImageFillView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (SXAnimatedImage)animatedImage
{
  void *v2;
  void *v3;

  -[SXImageFillView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "animatedImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SXAnimatedImage *)v3;
}

- (void)play
{
  id v2;

  -[SXImageFillView imageView](self, "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)pause
{
  id v2;

  -[SXImageFillView imageView](self, "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

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

  -[SXImageFillView clippingView](self, "clippingView");
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
  -[SXImageFillView clippingView](self, "clippingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);

}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_clippingView, a3);
}

- (SXImageFill)imageFill
{
  return self->_imageFill;
}

- (SXImageResource)imageResource
{
  return self->_imageResource;
}

- (SXImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageResource, 0);
  objc_storeStrong((id *)&self->_imageFill, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end
