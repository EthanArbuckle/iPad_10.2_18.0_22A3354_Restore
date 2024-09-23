@implementation VUIProductUberBackgroundView

- (VUIProductUberBackgroundView)initWithFrame:(CGRect)a3
{
  VUIProductUberBackgroundView *v3;
  VUIProductUberBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIProductUberBackgroundView;
  v3 = -[VUIProductUberBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VUIProductUberBackgroundView setAutoresizingMask:](v3, "setAutoresizingMask:", 1);
    v4->_configuredBlurInterfaceStyle = 0;
  }
  return v4;
}

- (void)setImageView:(id)a3
{
  UIView *v5;
  UIView *v6;
  UIView *v7;

  v5 = (UIView *)a3;
  if (self->_imageView != v5)
  {
    v7 = v5;
    -[VUIProductUberBackgroundView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5);
    v6 = v7;
    if (self->_imageView != v7)
    {
      objc_storeStrong((id *)&self->_imageView, a3);
      v6 = v7;
    }
    -[UIView setVuiContentMode:](v6, "setVuiContentMode:", 2);
    -[VUIProductUberBackgroundView vui_setNeedsLayout](self, "vui_setNeedsLayout");
    v5 = v7;
  }

}

- (void)configureBlurWithInterfaceStyle:(unint64_t)a3
{
  -[VUIProductUberBackgroundView bounds](self, "bounds");
  -[VUIProductUberBackgroundView configureBlurWithInterfaceStyle:mainRect:](self, "configureBlurWithInterfaceStyle:mainRect:", a3);
}

- (void)configureBlurWithInterfaceStyle:(unint64_t)a3 mainRect:(CGRect)a4
{
  if (a3)
  {
    if (!self->_blurEffectView || self->_configuredBlurInterfaceStyle != a3)
    {
      -[VUIProductUberBackgroundView configureBlurEffectAndGradientWithInterfaceStyle:mainRect:](self, "configureBlurEffectAndGradientWithInterfaceStyle:mainRect:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      self->_configuredBlurInterfaceStyle = a3;
    }
  }
  else
  {
    -[VUIProductUberBackgroundView resetBlurEffectAndGradient](self, "resetBlurEffectAndGradient", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  }
}

- (void)setMasksBlur:(BOOL)a3
{
  -[UIVisualEffectView setHidden:](self->_blurEffectView, "setHidden:", !a3);
}

- (void)setImageOffset:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  VUIRoundValue();
  self->_contentOffset = v5;
  -[VUIProductUberBackgroundView bounds](self, "bounds");
  v8 = v6;
  v9 = v7;
  if (a3 > 0.0)
    -[UIView _setContentRectInPixels:forContentSize:](self->_imageView, "_setContentRectInPixels:forContentSize:", 0.0, fmin(self->_contentOffset * -0.28, 0.0), v6, v7, v6, v7);
  -[UIView setFrame:](self->_imageView, "setFrame:", 0.0, self->_contentOffset, v8, v9 - self->_contentOffset);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  UIView *imageView;
  double contentOffset;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  if (!a4)
  {
    imageView = self->_imageView;
    if (imageView)
    {
      contentOffset = self->_contentOffset;
      v9 = height - contentOffset;
      v10 = a3.width;
    }
    else
    {
      contentOffset = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    -[UIView setFrame:](imageView, "setFrame:", *MEMORY[0x1E0C9D648], contentOffset, v10, v9);
    -[VUIProductUberBackgroundView vui_bringSubviewToFront:](self, "vui_bringSubviewToFront:", self->_blurEffectView);
    v18.origin.x = 0.0;
    v18.origin.y = 0.0;
    v18.size.width = width;
    v18.size.height = height;
    v11 = objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v18));
    v12 = (void *)MEMORY[0x1E0DC3F98];
    -[CAGradientLayer frame](self->_gradientLayer, "frame");
    if (v11 != objc_msgSend(v12, "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v19)) && self->_isChannelBanner)
      -[VUIProductUberBackgroundView _configureGradientLayer:currentSizeClass:mainRect:](self, "_configureGradientLayer:currentSizeClass:mainRect:", self->_gradientLayer, v11, 0.0, 0.0, width, height);
    -[VUIProductUberBackgroundView _gradientHeightForSizeClass:mainRect:](self, "_gradientHeightForSizeClass:mainRect:", v11, 0.0, 0.0, width, height);
    v14 = v13;
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", 0.0, 0.0, width, v13);
    -[CAGradientLayer removeAllAnimations](self->_gradientLayer, "removeAllAnimations");
    -[UIVisualEffectView setFrame:](self->_blurEffectView, "setFrame:", 0.0, height - v14, width, v14);
  }
  v15 = width;
  v16 = height;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)configureBlurEffectAndGradientWithInterfaceStyle:(unint64_t)a3 mainRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CAGradientLayer *v10;
  void *v11;
  CAGradientLayer *gradientLayer;
  uint64_t v13;
  uint64_t v14;
  UIVisualEffectView *blurEffectView;
  UIVisualEffectView *v16;
  UIVisualEffectView *v17;
  UIVisualEffectView *v18;
  void *v19;
  void *v20;
  id v21;
  CGRect v22;

  if (!self->_gradientLayer)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v10 = (CAGradientLayer *)objc_claimAutoreleasedReturnValue();
    -[CAGradientLayer setShouldRasterize:](v10, "setShouldRasterize:", 0);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "vui_main");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vui_scale");
    -[CAGradientLayer setRasterizationScale:](v10, "setRasterizationScale:");

    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    -[VUIProductUberBackgroundView _configureGradientLayer:currentSizeClass:mainRect:](self, "_configureGradientLayer:currentSizeClass:mainRect:", v10, objc_msgSend(MEMORY[0x1E0DC3F98], "vui_currentSizeClassForWindowWidth:", CGRectGetWidth(v22)), x, y, width, height);
    gradientLayer = self->_gradientLayer;
    self->_gradientLayer = v10;

  }
  if (a3 == 1)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v13, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v14 = objc_claimAutoreleasedReturnValue();
  blurEffectView = self->_blurEffectView;
  v21 = (id)v14;
  if (blurEffectView)
  {
    -[UIVisualEffectView setEffect:](blurEffectView, "setEffect:", v14);
  }
  else
  {
    v16 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v14);
    v17 = self->_blurEffectView;
    self->_blurEffectView = v16;
    v18 = v16;

    -[VUIProductUberBackgroundView addSubview:](self, "addSubview:", self->_blurEffectView);
  }
  -[UIVisualEffectView layer](self->_blurEffectView, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSublayer:", self->_gradientLayer);

  -[UIVisualEffectView layer](self->_blurEffectView, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAllowsGroupBlending:", 1);

}

- (void)resetBlurEffectAndGradient
{
  UIVisualEffectView *blurEffectView;
  CAGradientLayer *gradientLayer;

  -[UIVisualEffectView removeFromSuperview](self->_blurEffectView, "removeFromSuperview");
  blurEffectView = self->_blurEffectView;
  self->_blurEffectView = 0;

  -[CAGradientLayer removeFromSuperlayer](self->_gradientLayer, "removeFromSuperlayer");
  gradientLayer = self->_gradientLayer;
  self->_gradientLayer = 0;

}

- (double)_gradientHeightForSizeClass:(int64_t)a3 mainRect:(CGRect)a4
{
  double v5;
  double v7;
  double result;

  if (self->_isChannelBanner)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 4 || a3 == 5)
      return 300.0;
    else
      return 376.0;
  }
  else
  {
    VUIRoundValue();
    v5 = v7;
    if (UIAccessibilityIsReduceTransparencyEnabled() && self->_highestSubviewY > 0.0)
    {
      VUIRoundValue();
      return result;
    }
  }
  return v5;
}

- (void)_configureGradientLayer:(id)a3 currentSizeClass:(int64_t)a4 mainRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  uint64_t v30;
  _QWORD v31[6];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v31[5] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = v11;
  if (self->_isChannelBanner)
  {
    -[VUIProductUberBackgroundView _gradientHeightForSizeClass:mainRect:](self, "_gradientHeightForSizeClass:mainRect:", a4, x, y, width, height);
    v14 = v13;
    v15 = a4 - 4;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "CGColor");
    if (v15 > 2)
    {
      v30 = v17;
      v18 = &unk_1EA0BBB50;
      v19 = &v30;
    }
    else
    {
      v31[0] = v17;
      v18 = &unk_1EA0BBB38;
      v19 = v31;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.74);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[1] = objc_msgSend(v23, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.1);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[2] = objc_msgSend(v24, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[3] = objc_msgSend(v25, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.0);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19[4] = objc_msgSend(v26, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColors:", v27);

    +[VUIUtilities gradientLayerLocationsFromSpacings:height:](VUIUtilities, "gradientLayerLocationsFromSpacings:height:", v18, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocations:", v28);

    objc_msgSend(v12, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v12, "setEndPoint:", 0.5, 1.0);
  }
  else
  {
    objc_msgSend(v11, "setStartPoint:", 0.5, 0.0);
    objc_msgSend(v12, "setEndPoint:", 0.5, 1.0);
    objc_msgSend(v12, "setLocations:", &unk_1EA0BBB68);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29[0] = objc_msgSend(v20, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29[1] = objc_msgSend(v21, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setColors:", v22);

  }
  objc_msgSend(v12, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);

}

- (BOOL)isChannelBanner
{
  return self->_isChannelBanner;
}

- (void)setIsChannelBanner:(BOOL)a3
{
  self->_isChannelBanner = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (UIView)imageView
{
  return self->_imageView;
}

- (double)highestSubviewY
{
  return self->_highestSubviewY;
}

- (void)setHighestSubviewY:(double)a3
{
  self->_highestSubviewY = a3;
}

- (unint64_t)configuredBlurInterfaceStyle
{
  return self->_configuredBlurInterfaceStyle;
}

- (void)setConfiguredBlurInterfaceStyle:(unint64_t)a3
{
  self->_configuredBlurInterfaceStyle = a3;
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffectView, a3);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
  objc_storeStrong((id *)&self->_gradientLayer, a3);
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(double)a3
{
  self->_contentOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
