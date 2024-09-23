@implementation SXRepeatableImageFillView

- (SXRepeatableImageFillView)initWithRepeatableImageFill:(id)a3 imageView:(id)a4
{
  id v7;
  SXRepeatableImageFillView *v8;
  SXRepeatableImageFillView *v9;
  id *p_imageView;
  SXClippingView *v11;
  SXClippingView *clippingView;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXRepeatableImageFillView;
  v8 = -[SXFillView initWithFill:](&v14, sel_initWithFill_, a3);
  v9 = v8;
  if (v8)
  {
    p_imageView = (id *)&v8->_imageView;
    objc_storeStrong((id *)&v8->_imageView, a4);
    objc_msgSend(*p_imageView, "setIsDecorative:", 1);
    objc_msgSend(*p_imageView, "setContentMode:", 1);
    v11 = -[SXClippingView initWithContentView:]([SXClippingView alloc], "initWithContentView:", v7);
    clippingView = v9->_clippingView;
    v9->_clippingView = v11;

    -[SXClippingView setClippingMode:](v9->_clippingView, "setClippingMode:", 0);
    -[SXRepeatableImageFillView addSubview:](v9, "addSubview:", v9->_clippingView);
  }

  return v9;
}

- (void)load
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXRepeatableImageFillView;
  -[SXFillView load](&v3, sel_load);
  if (!-[SXImageView objectHasQualityInterest:quality:](self->_imageView, "objectHasQualityInterest:quality:", self, 0))-[SXImageView addInterestInImageQuality:forObject:](self->_imageView, "addInterestInImageQuality:forObject:", 0, self);
}

- (void)dealloc
{
  objc_super v3;

  if (-[SXImageView objectHasQualityInterest:quality:](self->_imageView, "objectHasQualityInterest:quality:", self, 0))
  {
    -[SXImageView giveUpInterestForObject:](self->_imageView, "giveUpInterestForObject:", self);
  }
  v3.receiver = self;
  v3.super_class = (Class)SXRepeatableImageFillView;
  -[SXRepeatableImageFillView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SXRepeatableImageFillView;
  -[SXRepeatableImageFillView layoutSubviews](&v4, sel_layoutSubviews);
  -[SXRepeatableImageFillView clippingView](self, "clippingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXRepeatableImageFillView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (CGRect)fillFrameWithBoundingSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  long double v28;
  double v29;
  double v30;
  long double v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  double v40;
  double v41;
  long double v42;
  double v43;
  double v44;
  double v45;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[SXFillView fill](self, "fill");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "repeat") == 3)
  {
    v7 = 1;
  }
  else
  {
    -[SXFillView fill](self, "fill");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "repeat") == 1;

  }
  -[SXFillView fill](self, "fill");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "repeat") == 3)
  {
    v10 = 1;
  }
  else
  {
    -[SXFillView fill](self, "fill");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "repeat") == 2;

  }
  -[SXFillView fill](self, "fill");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "verticalAlignment");

  -[SXFillView fill](self, "fill");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "horizontalAlignment");

  v16 = height;
  if (!v10)
  {
    -[SXRepeatableImageFillView patternSize](self, "patternSize");
    v16 = v17;
  }
  v18 = width;
  if (!v7)
  {
    -[SXRepeatableImageFillView patternSize](self, "patternSize");
    v18 = v19;
  }
  v20 = MEMORY[0x24BDBEFB0];
  if (v15 == 2)
  {
    if (v7)
    {
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v27 = v26;
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v18 = v18 + v27 - fmod(width, v28);
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v30 = v29;
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v25 = -(v30 - fmod(width, v31));
    }
    else
    {
      v25 = width - v18;
    }
  }
  else if (v15 == 1)
  {
    if (v7)
    {
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v22 = vcvtmd_u64_f64(width / v21);
      v23 = (double)(v22 + (v22 & 1) + 1);
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v18 = v24 * v23;
    }
    v25 = (width - v18) * 0.5;
  }
  else
  {
    v25 = *MEMORY[0x24BDBEFB0];
  }
  if (v13 == 2)
  {
    if (v10)
    {
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v38 = v37;
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v16 = v16 + v38 - fmod(height, v39);
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v41 = v40;
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v36 = -(v41 - fmod(height, v42));
    }
    else
    {
      v36 = height - v16;
    }
  }
  else if (v13 == 1)
  {
    if (v10)
    {
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v33 = vcvtmd_u64_f64(height / v32);
      v34 = (double)(v33 + (v33 & 1) + 1);
      -[SXRepeatableImageFillView patternSize](self, "patternSize");
      v16 = v35 * v34;
    }
    v36 = (height - v16) * 0.5;
  }
  else
  {
    v36 = *(double *)(v20 + 8);
  }
  v43 = v25;
  v44 = v18;
  v45 = v16;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.y = v36;
  result.origin.x = v43;
  return result;
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

  -[SXRepeatableImageFillView clippingView](self, "clippingView");
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
  -[SXRepeatableImageFillView clippingView](self, "clippingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentFrame:", x, y, width, height);

}

- (void)setPatternSize:(CGSize)a3
{
  CGSize *p_patternSize;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double width;
  double height;
  double v14;
  void *v16;

  p_patternSize = &self->_patternSize;
  if (self->_patternSize.width != a3.width || self->_patternSize.height != a3.height)
  {
    p_patternSize->width = a3.width;
    self->_patternSize.height = a3.height;
    -[SXRepeatableImageFillView imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageResource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dimensions");
    v9 = v8;
    v11 = v10;

    width = p_patternSize->width;
    height = p_patternSize->height;
    v14 = v9 / fmax(v11, 1.0);
    if (p_patternSize->width >= 2.22044605e-16 || height <= 0.0)
    {
      if (width > 0.0 && height < 2.22044605e-16)
        p_patternSize->height = width / v14;
    }
    else
    {
      p_patternSize->width = v14 * height;
    }
    -[SXRepeatableImageFillView imageView](self, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreferredImageSize:", p_patternSize->width, p_patternSize->height);

    -[SXRepeatableImageFillView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)play
{
  id v2;

  -[SXRepeatableImageFillView imageView](self, "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)pause
{
  id v2;

  -[SXRepeatableImageFillView imageView](self, "imageView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (CGSize)patternSize
{
  double width;
  double height;
  CGSize result;

  width = self->_patternSize.width;
  height = self->_patternSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (SXRepeatableImageView)imageView
{
  return self->_imageView;
}

- (SXClippingView)clippingView
{
  return self->_clippingView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
