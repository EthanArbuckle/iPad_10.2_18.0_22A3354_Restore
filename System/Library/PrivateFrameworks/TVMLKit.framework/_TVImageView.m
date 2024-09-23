@implementation _TVImageView

- (_TVImageView)initWithFrame:(CGRect)a3
{
  _TVImageView *v3;
  _TVImageView *v4;
  id v5;
  uint64_t v6;
  UIImageView *imageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVImageView;
  v3 = -[_TVImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_imageContentMode = 1;
    v5 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[_TVImageView bounds](v4, "bounds");
    v6 = objc_msgSend(v5, "initWithFrame:");
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v6;

    -[UIImageView setClipsToBounds:](v4->_imageView, "setClipsToBounds:", 1);
    -[UIImageView setContentMode:](v4->_imageView, "setContentMode:", v4->_imageContentMode);
    -[_TVImageView addSubview:](v4, "addSubview:", v4->_imageView);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TVImageProxy setCompletionHandler:](self->_imageProxy, "setCompletionHandler:", 0);
  -[TVImageProxy cancel](self->_imageProxy, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_TVImageView;
  -[_TVImageView dealloc](&v3, sel_dealloc);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UIImageView intrinsicContentSize](self->_imageView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)contentMode
{
  return -[UIImageView contentMode](self->_imageView, "contentMode");
}

- (void)layoutSubviews
{
  UIImageView *imageView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TVImageView;
  -[_TVImageView layoutSubviews](&v4, sel_layoutSubviews);
  imageView = self->_imageView;
  -[_TVImageView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void)setContentMode:(int64_t)a3
{
  self->_imageContentMode = a3;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:");
  -[_TVImageView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)setFrame:(CGRect)a3
{
  UIImageView *imageView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVImageView;
  -[_TVImageView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  imageView = self->_imageView;
  -[_TVImageView bounds](self, "bounds");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  TVImageProxy *v9;
  TVImageProxy *v10;
  double v11;
  double v12;
  BOOL v13;
  BOOL v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (a3.width == *MEMORY[0x24BDBF148] && a3.height == v7)
  {
    v9 = self->_imageProxy;
  }
  else
  {
    -[_TVImageView _imageProxyWithSize:](self, "_imageProxyWithSize:", a3.width, a3.height);
    v9 = (TVImageProxy *)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[TVImageProxy expectedSize](v9, "expectedSize");
  v13 = v11 == v6 && v12 == v7;
  if (v13
    && ((-[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height), v11 == v6)
      ? (v14 = v12 == v7)
      : (v14 = 0),
        v14))
  {
    -[_TVImageView bounds](self, "bounds");
    v15 = v17;
    v16 = v18;
  }
  else
  {
    v15 = v11;
    v16 = v12;
  }

  v19 = v15;
  v20 = v16;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  BOOL v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVImageView;
  -[_TVImageView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  v5 = -[_TVImageView isImageLoaded](self, "isImageLoaded");
  if (a3)
  {
    if (!v5)
      -[_TVImageView _loadImage](self, "_loadImage");
  }
  else if (!v5)
  {
    -[TVImageProxy cancel](self->_imageProxy, "cancel");
  }
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setImage:(id)a3
{
  id v4;

  v4 = a3;
  -[_TVImageView setImageProxy:](self, "setImageProxy:", 0);
  -[_TVImageView _setImage:](self, "_setImage:", v4);

}

- (void)setImageProxy:(id)a3
{
  -[_TVImageView setImageProxy:completion:](self, "setImageProxy:completion:", a3, 0);
}

- (void)setImageProxy:(id)a3 completion:(id)a4
{
  id v7;
  TVImageProxy **p_imageProxy;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  _BOOL4 v12;
  BOOL v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  TVImageProxy *v21;

  v21 = (TVImageProxy *)a3;
  v7 = a4;
  p_imageProxy = &self->_imageProxy;
  if (self->_imageProxy != v21 || self->_completion != v7)
  {
    -[_TVImageView window](self, "window");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = -[_TVImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;

    }
    else
    {
      v11 = 0;
    }
    -[TVImageProxy setImageDirection:](*p_imageProxy, "setImageDirection:", v11);
    v12 = -[TVImageProxy isEqual:](v21, "isEqual:", *p_imageProxy);
    v13 = -[_TVImageView isImageLoaded](self, "isImageLoaded");
    if (v12)
    {
      if (!v13)
      {
        -[_TVImageView completion](self, "completion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[_TVImageView completion](self, "completion");
          v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[_TVImageView image](self, "image");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD, _QWORD))v15)[2](v15, v16, 0, 0);

        }
      }
      -[_TVImageView setCompletion:](self, "setCompletion:", v7);
      if (-[_TVImageView isImageLoaded](self, "isImageLoaded"))
      {
        -[_TVImageView completion](self, "completion");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[_TVImageView completion](self, "completion");
          v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[_TVImageView image](self, "image");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD, uint64_t))v18)[2](v18, v19, 0, 1);

          -[_TVImageView setCompletion:](self, "setCompletion:", 0);
        }
      }
    }
    else
    {
      if (!v13)
        -[TVImageProxy cancel](*p_imageProxy, "cancel");
      -[_TVImageView setImageLoaded:](self, "setImageLoaded:", 0);
      if (!-[TVImageProxy isOfSameOriginAs:](*p_imageProxy, "isOfSameOriginAs:", v21))
        -[_TVImageView _setImage:](self, "_setImage:", 0);
      -[_TVImageView setCompletion:](self, "setCompletion:", v7);
      objc_storeStrong((id *)&self->_imageProxy, a3);
      -[_TVImageView window](self, "window");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        -[_TVImageView _loadImage](self, "_loadImage");
    }
  }

}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[_TVImageView _updateImageView](self, "_updateImageView");
    v5 = v6;
  }

}

- (void)setBackgroundColor:(id)a3
{
  -[UIImageView setBackgroundColor:](self->_imageView, "setBackgroundColor:", a3);
}

- (id)backgroundColor
{
  return (id)-[UIImageView backgroundColor](self->_imageView, "backgroundColor");
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v5;

  -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:");
  -[UIImageView layer](self->_imageView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", a3 > 0.0);

  self->_continuousCorners = a3 > 0.0;
}

- (double)_continuousCornerRadius
{
  double result;

  -[UIImageView _continuousCornerRadius](self->_imageView, "_continuousCornerRadius");
  return result;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_TVImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setImageContainsCornerRadius:(BOOL)a3
{
  if (self->_imageContainsCornerRadius != a3)
  {
    self->_imageContainsCornerRadius = a3;
    -[_TVImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)_setContentRectInPixels:(CGRect)a3 forContentSize:(CGSize)a4
{
  -[UIImageView _setContentRectInPixels:forContentSize:](self->_imageView, "_setContentRectInPixels:forContentSize:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
}

- (void)_resetContentRect
{
  -[UIImageView _resetContentRect](self->_imageView, "_resetContentRect");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  CAFilter *highlightFilter;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  CAFilter *v10;
  CAFilter *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_super v22;

  v3 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TVImageView;
  -[UIView setHighlighted:](&v22, sel_setHighlighted_);
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:", v3);
  highlightFilter = self->_highlightFilter;
  if (self->__focusedColor)
    v6 = !v3;
  else
    v6 = 1;
  if (v6)
  {
    if (!highlightFilter)
      return;
    -[UIImageView layer](self->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "removeObjectIdenticalTo:", self->_highlightFilter);
    goto LABEL_15;
  }
  if (!highlightFilter)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BA8]);
    v10 = (CAFilter *)objc_claimAutoreleasedReturnValue();
    v11 = self->_highlightFilter;
    self->_highlightFilter = v10;

    -[CAFilter setValue:forKey:](self->_highlightFilter, "setValue:forKey:", -[UIColor CGColor](self->__focusedColor, "CGColor"), CFSTR("inputColor"));
  }
  -[UIImageView layer](self->_imageView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", self->_highlightFilter);

  if ((v14 & 1) == 0)
  {
    -[UIImageView layer](self->_imageView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "filters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    v9 = v19;

    objc_msgSend(v9, "addObject:", self->_highlightFilter);
LABEL_15:
    -[UIImageView layer](self->_imageView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v20, "setFilters:", v21);

  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  self->_selected = a3;
  -[_TVImageView _updateImageView](self, "_updateImageView");
  if (-[_TVImageView _enableEdgeAntialiasingOnSelected](self, "_enableEdgeAntialiasingOnSelected"))
  {
    -[UIImageView layer](self->_imageView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsEdgeAntialiasing:", v4);

    -[UIImageView layer](self->_imageView, "layer");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEdgeAntialiasingMask:", 3);

  }
}

- (id)_imageProxyWithSize:(CGSize)a3
{
  void (**dynamicProxyProvider)(id, SEL, __n128, __n128);
  TVImageProxy *v4;

  dynamicProxyProvider = (void (**)(id, SEL, __n128, __n128))self->_dynamicProxyProvider;
  if (dynamicProxyProvider)
  {
    dynamicProxyProvider[2](self->_dynamicProxyProvider, a2, (__n128)a3, *(__n128 *)&a3.height);
    v4 = (TVImageProxy *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_imageProxy;
  }
  return v4;
}

- (void)_reloadImageForLayoutDirectionChange
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  -[_TVImageView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[_TVImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1;
    -[_TVImageView imageProxy](self, "imageProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "imageDirection");

    if (v6 != v4)
      -[_TVImageView _loadImage](self, "_loadImage");
  }
  else
  {
    -[_TVImageView setImageLoaded:](self, "setImageLoaded:", 0);
  }
}

- (void)_loadImage
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  TVImageProxy *imageProxy;
  id v8;
  TVImageProxy *v9;
  id *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id from;
  id location;

  -[_TVImageView bounds](self, "bounds");
  -[_TVImageView _imageProxyWithSize:](self, "_imageProxyWithSize:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", self->_imageProxy) & 1) == 0)
    objc_storeStrong((id *)&self->_imageProxy, v6);
  imageProxy = self->_imageProxy;
  v8 = objc_initWeak(&location, imageProxy);

  if (imageProxy)
  {
    -[TVImageProxy setCacheOnLoad:](self->_imageProxy, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
    objc_initWeak(&from, self);
    v9 = self->_imageProxy;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __26___TVImageView__loadImage__block_invoke;
    v16[3] = &unk_24EB86500;
    objc_copyWeak(&v17, &location);
    objc_copyWeak(&v18, &from);
    -[TVImageProxy setCompletionHandler:](v9, "setCompletionHandler:", v16);
    -[TVImageProxy setImageDirection:](self->_imageProxy, "setImageDirection:", -[_TVImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1);
    -[TVImageProxy load](self->_imageProxy, "load");
    objc_destroyWeak(&v18);
    v10 = &v17;
  }
  else
  {
    -[_TVImageView completion](self, "completion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_7;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      -[_TVImageView completion](self, "completion");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, 0, 1);

      -[_TVImageView setCompletion:](self, "setCompletion:", 0);
      -[_TVImageView setImageLoaded:](self, "setImageLoaded:", 0);
      goto LABEL_7;
    }
    objc_initWeak(&from, self);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __26___TVImageView__loadImage__block_invoke_2;
    v13[3] = &unk_24EB86528;
    objc_copyWeak(&v14, &from);
    objc_copyWeak(&v15, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v13);
    objc_destroyWeak(&v15);
    v10 = &v14;
  }
  objc_destroyWeak(v10);
  objc_destroyWeak(&from);
LABEL_7:
  objc_destroyWeak(&location);

}

- (id)_imageView
{
  return self->_imageView;
}

- (void)_updateTintColor
{
  UIColor *focusedColor;
  void *v4;
  UIColor *darkTintColor;
  UIColor *v6;
  UIColor *v7;

  if (self->_selected)
  {
    focusedColor = self->__focusedColor;
    if (focusedColor)
      goto LABEL_8;
  }
  -[_TVImageView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "userInterfaceStyle") == 2)
  {
    darkTintColor = self->__darkTintColor;

    if (darkTintColor)
    {
      focusedColor = self->__darkTintColor;
LABEL_8:
      v6 = focusedColor;
      goto LABEL_9;
    }
  }
  else
  {

  }
  focusedColor = self->__tintColor;
  if (focusedColor)
    goto LABEL_8;
  v6 = 0;
LABEL_9:
  v7 = v6;
  -[_TVImageView setTintColor:](self, "setTintColor:", v6);
  self->_rendersImageAsTemplates = v7 != 0;
  if (self->_image)
    -[_TVImageView _updateFlatImageWithImage:](self, "_updateFlatImageWithImage:");

}

- (void)_setDarkTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__darkTintColor, a3);
  -[_TVImageView _updateTintColor](self, "_updateTintColor");
}

- (void)_setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->__tintColor, a3);
  -[_TVImageView _updateTintColor](self, "_updateTintColor");
}

- (void)_setFocusedColor:(id)a3
{
  objc_storeStrong((id *)&self->__focusedColor, a3);
  -[_TVImageView _updateImageView](self, "_updateImageView");
}

- (void)_updateFlatImageWithImage:(id)a3
{
  id v4;
  _BOOL4 rendersImageAsTemplates;
  void *v6;
  id v7;

  v4 = a3;
  rendersImageAsTemplates = self->_rendersImageAsTemplates;
  v7 = v4;
  if (self->_rendersImageAsTemplates)
  {
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_storeStrong((id *)&self->_flatImage, v4);
  if (rendersImageAsTemplates)

  -[_TVImageView _updateImageView](self, "_updateImageView");
}

- (void)_setImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_image, a3);
  v5 = a3;
  -[UIImageView setContentMode:](self->_imageView, "setContentMode:", self->_imageContentMode);
  -[_TVImageView _updateFlatImageWithImage:](self, "_updateFlatImageWithImage:", v5);

}

- (void)_setPreferredSymbolConfiguration:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, a3);
  v5 = a3;
  -[UIImageView setPreferredSymbolConfiguration:](self->_imageView, "setPreferredSymbolConfiguration:", v5);

}

- (void)_updateImageView
{
  UIColor *tintColor;
  void *v4;
  UIColor *darkTintColor;
  UIColor *v6;
  UIImage *placeholderImage;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int64_t imageContentMode;
  double v13;
  double v14;
  uint64_t v16;

  if (!self->_image)
  {
    placeholderImage = self->_placeholderImage;
    if (!placeholderImage)
    {
      -[UIImageView setImage:](self->_imageView, "setImage:", 0);
      goto LABEL_27;
    }
    v6 = placeholderImage;
    -[UIColor imageAsset](v6, "imageAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && -[UIColor imageOrientation](v6, "imageOrientation") == 4)
    {
      v9 = -[_TVImageView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");

      if (v9 != 1)
      {
LABEL_14:
        -[UIImageView setImage:](self->_imageView, "setImage:", v6);
        imageContentMode = self->_imageContentMode;
        -[UIImage size](self->_placeholderImage, "size");
        if (v14 == 1.0 && v13 == 1.0)
          v16 = 2;
        else
          v16 = imageContentMode;
        -[UIImageView setContentMode:](self->_imageView, "setContentMode:", v16);
        goto LABEL_26;
      }
      -[UIColor imageAsset](v6, "imageAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithLayoutDirection:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageWithTraitCollection:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v6 = (UIColor *)v11;
    }

    goto LABEL_14;
  }
  if (!self->_selected || (tintColor = self->__focusedColor) == 0)
  {
    -[_TVImageView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "userInterfaceStyle") == 2)
    {
      darkTintColor = self->__darkTintColor;

      if (darkTintColor)
      {
        v6 = self->__darkTintColor;
        if (!v6)
          goto LABEL_25;
        goto LABEL_24;
      }
    }
    else
    {

    }
    tintColor = self->__tintColor;
    if (!tintColor)
    {
      v6 = 0;
      goto LABEL_25;
    }
  }
  v6 = tintColor;
LABEL_24:
  -[_TVImageView setTintColor:](self, "setTintColor:", v6);
LABEL_25:
  -[UIImageView setImage:](self->_imageView, "setImage:", self->_flatImage);
LABEL_26:

LABEL_27:
  -[_TVImageView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)_updateCornerRadius
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v9;
  id v10;

  if (!self->_continuousCorners)
  {
    if (!self->_imageContainsCornerRadius || (v3 = 0.0, !self->_image))
    {
      -[_TVImageView cornerRadius](self, "cornerRadius");
      v3 = v4;
    }
    -[UIImageView layer](self->_imageView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", v3);

    v6 = -[UIImageView contentMode](self->_imageView, "contentMode");
    -[UIImageView layer](self->_imageView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    v9 = v3 > 0.0 || v6 != 1;
    objc_msgSend(v7, "setMasksToBounds:", v9);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_TVImageView;
  -[_TVImageView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[_TVImageView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "userInterfaceStyle"))
  {
    v6 = objc_msgSend(v4, "userInterfaceStyle");
    if (v6 != objc_msgSend(v5, "userInterfaceStyle"))
      -[_TVImageView _updateTintColor](self, "_updateTintColor");
  }

}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (BOOL)imageContainsCornerRadius
{
  return self->_imageContainsCornerRadius;
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (id)dynamicProxyProvider
{
  return self->_dynamicProxyProvider;
}

- (void)setDynamicProxyProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (BOOL)isImageLoaded
{
  return self->_imageLoaded;
}

- (void)setImageLoaded:(BOOL)a3
{
  self->_imageLoaded = a3;
}

- (UIColor)_tintColor
{
  return self->__tintColor;
}

- (UIColor)_darkTintColor
{
  return self->__darkTintColor;
}

- (UIColor)_focusedColor
{
  return self->__focusedColor;
}

- (BOOL)_enableEdgeAntialiasingOnSelected
{
  return self->__enableEdgeAntialiasingOnSelected;
}

- (void)_setEnableEdgeAntialiasingOnSelected:(BOOL)a3
{
  self->__enableEdgeAntialiasingOnSelected = a3;
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return self->_preferredSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->__darkTintColor, 0);
  objc_storeStrong((id *)&self->__tintColor, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_dynamicProxyProvider, 0);
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_flatHighlightImage, 0);
  objc_storeStrong((id *)&self->_flatImage, 0);
  objc_storeStrong((id *)&self->__focusedColor, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
