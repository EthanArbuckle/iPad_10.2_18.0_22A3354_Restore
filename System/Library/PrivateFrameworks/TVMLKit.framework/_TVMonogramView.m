@implementation _TVMonogramView

- (_TVMonogramView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _TVMonogramView *v11;
  _TVMonogramView *v12;
  id v13;
  uint64_t v14;
  UIView *placeholderView;
  void *v16;
  void *v17;
  _TVImageView *v18;
  uint64_t v19;
  _TVImageView *imageView;
  _TVImageView *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  UIView *unfocusedShadowView;
  void *v28;
  UIView *v29;
  objc_super v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_TVMonogramView;
  v11 = -[_UIFloatingContentView initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    -[_UIFloatingContentView setContentOpaque:](v12, "setContentOpaque:", 1);
    -[_UIFloatingContentView setBackgroundColor:forState:](v12, "setBackgroundColor:forState:", 0, 0);
    -[_UIFloatingContentView setBackgroundColor:forState:](v12, "setBackgroundColor:forState:", 0, 8);
    -[_UIFloatingContentView setBackgroundColor:forState:](v12, "setBackgroundColor:forState:", 0, 1);
    -[_UIFloatingContentView setBackgroundColor:forState:](v12, "setBackgroundColor:forState:", 0, 4);
    -[_UIFloatingContentView setCornerRadius:](v12, "setCornerRadius:", 0.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:](v12, "setContentMotionRotation:translation:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 8.0, 8.0);
    -[_UIFloatingContentView setFloatingContentDelegate:](v12, "setFloatingContentDelegate:", v12);
    -[_TVMonogramView setFocusedStateEnabled:](v12, "setFocusedStateEnabled:", 1);
    v13 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[_TVMonogramView bounds](v12, "bounds");
    v14 = objc_msgSend(v13, "initWithFrame:");
    placeholderView = v12->_placeholderView;
    v12->_placeholderView = (UIView *)v14;

    -[UIView setHidden:](v12->_placeholderView, "setHidden:", 1);
    -[UIView layer](v12->_placeholderView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMonogramView bounds](v12, "bounds");
    objc_msgSend(v16, "setCornerRadius:", CGRectGetWidth(v32) * 0.5);

    -[_UIFloatingContentView contentView](v12, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v12->_placeholderView);

    v18 = [_TVImageView alloc];
    -[_TVMonogramView bounds](v12, "bounds");
    v19 = -[_TVImageView initWithFrame:](v18, "initWithFrame:");
    imageView = v12->_imageView;
    v12->_imageView = (_TVImageView *)v19;

    v21 = v12->_imageView;
    objc_msgSend(v10, "focusedBgColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVImageView _setFocusedColor:](v21, "_setFocusedColor:", v22);

    -[_TVImageView setClipsToBounds:](v12->_imageView, "setClipsToBounds:", 1);
    -[_TVImageView setContentMode:](v12->_imageView, "setContentMode:", 1);
    -[_UIFloatingContentView contentView](v12, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v12->_imageView);

    objc_msgSend(v10, "unfocusedShadowImage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[_UIFloatingContentView setShadowEnabled:](v12, "setShadowEnabled:", 0);
      -[_UIFloatingContentView setClipsContentToBounds:](v12, "setClipsContentToBounds:", 0);
      v25 = objc_alloc(MEMORY[0x24BDF6F90]);
      v26 = objc_msgSend(v25, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      unfocusedShadowView = v12->_unfocusedShadowView;
      v12->_unfocusedShadowView = (UIView *)v26;

      -[_UIFloatingContentView contentView](v12, "contentView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "insertSubview:atIndex:", v12->_unfocusedShadowView, 0);

      v29 = v12->_unfocusedShadowView;
      objc_msgSend(v10, "unfocusedShadowAlpha");
      -[UIView setAlpha:](v29, "setAlpha:");
    }
  }

  return v12;
}

- (void)setImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[_TVImageView setImage:](self->_imageView, "setImage:", v5);
    -[_TVImageView setAlpha:](self->_imageView, "setAlpha:", 1.0);
  }

}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[_TVImageView setPlaceholderImage:](self->_imageView, "setPlaceholderImage:", v5);
    -[_TVMonogramView _updatePlaceholerView](self, "_updatePlaceholerView");
  }

}

- (void)setMonogramDescription:(id)a3
{
  void *v5;
  void *v6;
  _TVMonogramDescription *v7;

  v7 = (_TVMonogramDescription *)a3;
  if (self->_monogramDescription != v7)
  {
    objc_storeStrong((id *)&self->_monogramDescription, a3);
    if (-[_TVMonogramDescription scaleMode](v7, "scaleMode") == 2)
      -[_TVMonogramDescription backgroundColor](v7, "backgroundColor");
    else
      -[_TVMonogramDescription fillColor](v7, "fillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_placeholderView, "setBackgroundColor:", v5);
    -[_TVMonogramView _updatePlaceholerView](self, "_updatePlaceholerView");
    -[_TVMonogramView imageProxy](self, "imageProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVMonogramView _loadWithMonogramDescription:imageProxy:](self, "_loadWithMonogramDescription:imageProxy:", v7, v6);

  }
}

- (void)_updatePlaceholerView
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;

  -[_TVMonogramView placeholderImage](self, "placeholderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;
  v5 = v3 != 0;

  -[UIView setHidden:](self->_placeholderView, "setHidden:", v5);
  -[_TVImageView setHidden:](self->_imageView, "setHidden:", v4);
}

- (void)_updateUnfocusedShadowFrameAndLayerWithFrame:(CGRect)a3
{
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v4 = a3.size.width / 130.0;
  -[TVMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  v10 = floor(v4 * v7);
  v11 = floor(v4 * v9);
  -[_TVMonogramView bounds](self, "bounds");
  v12 = floor((CGRectGetWidth(v17) - v10) * 0.5);
  -[_TVMonogramView bounds](self, "bounds");
  -[UIView setFrame:](self->_unfocusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v18) - v11) * 0.5), v10, v11);
  -[UIView layer](self->_unfocusedShadowView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));

  -[UIView layer](self->_unfocusedShadowView, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[TVMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  objc_msgSend(v16, "setContentsScale:");

}

- (void)_updateFocusedShadowFrameAndLayerWithFrame:(CGRect)a3
{
  CGFloat v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v4 = a3.size.width / 130.0;
  -[TVMonogramViewConfiguration focusedShadowImage](self->_configuration, "focusedShadowImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  v10 = floor(v4 * v7 * 0.78);
  v11 = floor(v4 * v9 * 0.78);
  -[_TVMonogramView bounds](self, "bounds");
  v12 = floor((CGRectGetWidth(v17) - v10) * 0.5);
  -[_TVMonogramView bounds](self, "bounds");
  -[UIView setFrame:](self->_focusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v18) - v11) * 0.5), v10, v11);
  -[UIView layer](self->_focusedShadowView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVMonogramViewConfiguration focusedShadowImage](self->_configuration, "focusedShadowImage");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "CGImage"));

  -[UIView layer](self->_focusedShadowView, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[TVMonogramViewConfiguration focusedShadowImage](self->_configuration, "focusedShadowImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  objc_msgSend(v16, "setContentsScale:");

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_TVMonogramView;
  -[_UIFloatingContentView layoutSubviews](&v11, sel_layoutSubviews);
  -[_TVMonogramView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_TVImageView setFrame:](self->_imageView, "setFrame:");
  -[UIView setFrame:](self->_placeholderView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
  -[_TVMonogramView _updateUnfocusedShadowFrameAndLayerWithFrame:](self, "_updateUnfocusedShadowFrameAndLayerWithFrame:", v4, v6, v8, v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setHighlighted:(BOOL)a3
{
  -[_TVImageView setHighlighted:](self->_imageView, "setHighlighted:", a3);
}

- (void)setFocusedStateEnabled:(BOOL)a3
{
  self->_focusedStateEnabled = a3;
  -[_TVMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_isSelected = a3;
  -[_TVMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", 0, a4);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  self->_isSelected = a3;
  -[_TVMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", a5, a4);
}

- (void)setPressed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v8;

  v5 = a4;
  v7 = a3 | (8 * self->_isSelected);
  v8 = a5;
  -[_UIFloatingContentView setControlState:animated:](self, "setControlState:animated:", v7, v5);
  -[_TVMonogramView setPressCompletionBlock:](self, "setPressCompletionBlock:", v8);

}

- (void)setOverlayView:(id)a3
{
  UIView *v5;
  UIView **p_overlayView;
  UIView *overlayView;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_overlayView = &self->_overlayView;
  overlayView = self->_overlayView;
  v9 = v5;
  if (overlayView != v5)
  {
    -[UIView removeFromSuperview](overlayView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_overlayView, a3);
    if (*p_overlayView)
    {
      -[_UIFloatingContentView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", *p_overlayView);

    }
  }
  -[_TVMonogramView setNeedsLayout](self, "setNeedsLayout");

}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  void *v5;
  void (**v6)(void);

  -[_TVMonogramView pressCompletionBlock](self, "pressCompletionBlock", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_TVMonogramView pressCompletionBlock](self, "pressCompletionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[_TVMonogramView setPressCompletionBlock:](self, "setPressCompletionBlock:", 0);
  }
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  if (a3.width == 0.0 || (height = a3.height, a3.height == 0.0))
  {
    -[_TVMonogramView bounds](self, "bounds");
    width = v6;
    height = v7;
  }
  else
  {
    width = a3.width;
  }
  -[_UIFloatingContentView focusedSizeIncrease](self, "focusedSizeIncrease");
  v9 = width / height;
  if (width <= height)
  {
    v11 = height + v8;
    v10 = ceil(v9 * v11);
  }
  else
  {
    v10 = width + v8;
    v11 = ceil((width + v8) / v9);
  }
  v12 = floor((v10 - width) * 0.5);
  v13 = floor((v11 - height) * 0.5);
  v14 = v13;
  v15 = v12;
  result.right = v15;
  result.bottom = v14;
  result.left = v12;
  result.top = v13;
  return result;
}

- (void)_loadWithMonogramDescription:(id)a3 imageProxy:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  _TVMonogramDecorator *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  TVImageProxy *v17;
  TVImageProxy *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  double v24;
  double v25;
  _TVImageView *imageView;
  _QWORD v27[4];
  id v28;
  id v29;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "preferedMonogramType") || v7 || !self->_placeholderImage)
  {
    objc_msgSend(v6, "size");
    v10 = -[TVImageScaleDecorator initWithScaleToSize:scaleMode:]([_TVMonogramDecorator alloc], "initWithScaleToSize:scaleMode:", objc_msgSend(v6, "scaleMode"), v8, v9);
    objc_msgSend(v6, "imageURL");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v6, "imageURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "tv_isResourceURL");

      if ((v14 & 1) == 0)
      {
        objc_msgSend(v6, "padding");
        -[TVImageScaleDecorator setPadding:](v10, "setPadding:");
        objc_msgSend(v6, "upscaleAdjustment");
        -[TVImageScaleDecorator setFocusedSizeIncrease:](v10, "setFocusedSizeIncrease:");
        objc_msgSend(v6, "backgroundColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVImageScaleDecorator setBgColor:](v10, "setBgColor:", v15);

        objc_msgSend(v6, "borderColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_TVMonogramDecorator setBorderColor:](v10, "setBorderColor:", v16);

        objc_msgSend(v6, "borderWidth");
        -[_TVMonogramDecorator setBorderWidth:](v10, "setBorderWidth:");
      }
    }
    if (v7)
    {
      v17 = (TVImageProxy *)v7;
    }
    else
    {
      v18 = [TVImageProxy alloc];
      +[_TVMonogramImageLoader sharedInstance](_TVMonogramImageLoader, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[TVImageProxy initWithObject:imageLoader:groupType:](v18, "initWithObject:imageLoader:groupType:", v6, v19, 0);

    }
    -[TVImageProxy setCacheOnLoad:](v17, "setCacheOnLoad:", +[TVMLUtilities canHandleDecodingOnRenderThread](TVMLUtilities, "canHandleDecodingOnRenderThread") ^ 1);
    -[TVImageProxy setDecorator:](v17, "setDecorator:", v10);
    objc_msgSend(v6, "imageURL");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20
      && (v21 = (void *)v20,
          objc_msgSend(v6, "imageURL"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = objc_msgSend(v22, "tv_isResourceURL"),
          v22,
          v21,
          (v23 & 1) == 0))
    {
      v25 = 1.0;
      -[_TVImageView setAlpha:](self->_imageView, "setAlpha:", 1.0);
    }
    else
    {
      -[TVMonogramViewConfiguration unfocusedImageAlpha](self->_configuration, "unfocusedImageAlpha");
      v25 = v24;
    }
    self->_unfocusedImageAlpha = v25;
    objc_initWeak(&location, self);
    imageView = self->_imageView;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __59___TVMonogramView__loadWithMonogramDescription_imageProxy___block_invoke;
    v27[3] = &unk_24EB86EF0;
    objc_copyWeak(&v29, &location);
    v28 = v6;
    -[_TVImageView setImageProxy:completion:](imageView, "setImageProxy:completion:", v17, v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    -[UIView setHidden:](self->_placeholderView, "setHidden:", 1);
    -[_TVImageView setHidden:](self->_imageView, "setHidden:", 0);
    -[_TVImageView setImage:](self->_imageView, "setImage:", 0);
    -[_TVMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", 0);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (_TVMonogramDecorator *)objc_claimAutoreleasedReturnValue();
    -[_TVMonogramDecorator postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("TVMonogramViewImageDidUpdateNotification"), self);
  }

}

- (TVMonogramViewConfiguration)configuration
{
  return self->_configuration;
}

- (_TVMonogramDescription)monogramDescription
{
  return self->_monogramDescription;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (double)unfocusedImageAlpha
{
  return self->_unfocusedImageAlpha;
}

- (void)setUnfocusedImageAlpha:(double)a3
{
  self->_unfocusedImageAlpha = a3;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (BOOL)isFocusedStateEnabled
{
  return self->_focusedStateEnabled;
}

- (id)pressCompletionBlock
{
  return self->_pressCompletionBlock;
}

- (void)setPressCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 920);
}

- (_TVImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (TVImageProxy)imageProxy
{
  return self->_imageProxy;
}

- (void)setImageProxy:(id)a3
{
  objc_storeStrong((id *)&self->_imageProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageProxy, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong(&self->_pressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_monogramDescription, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_focusedShadowView, 0);
  objc_storeStrong((id *)&self->_unfocusedShadowView, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
