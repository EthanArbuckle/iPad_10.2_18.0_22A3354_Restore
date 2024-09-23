@implementation _UIPageIndicatorView

- (int64_t)page
{
  return self->_page;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setDefaultModeSize:(CGSize)a3
{
  self->_defaultModeSize = a3;
}

- (double)currentExpandProgress
{
  void *v2;
  double v3;
  double v4;

  -[_UIPageIndicatorView expandProgress](self, "expandProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentationValue");
  v4 = fmax(fmin(v3, 1.0), 0.0);

  return v4;
}

- (UIViewFloatAnimatableProperty)expandProgress
{
  return self->_expandProgress;
}

- (void)setExpandedModeSize:(CGSize)a3
{
  self->_expandedModeSize = a3;
}

- (void)setMode:(int64_t)a3 direction:(int64_t)a4
{
  double v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (self->_mode != a3)
  {
    self->_mode = a3;
    self->_offsetDirection = a4;
    v5 = 0.0;
    if (a3 == 1)
    {
      v5 = 1.0;
      if (!-[_UIPageIndicatorView supportsExpandedIndicator](self, "supportsExpandedIndicator"))
      {
        if (os_variant_has_internal_diagnostics())
        {
          __UIFaultDebugAssertLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_185066000, v9, OS_LOG_TYPE_FAULT, "Cannot change the mode to expanded if the indicator does not support expanded indicators", buf, 2u);
          }

        }
        else
        {
          v7 = setMode_direction____s_category;
          if (!setMode_direction____s_category)
          {
            v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
            atomic_store(v7, (unint64_t *)&setMode_direction____s_category);
          }
          v8 = *(NSObject **)(v7 + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v10 = 0;
            _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Cannot change the mode to expanded if the indicator does not support expanded indicators", v10, 2u);
          }
        }
      }
    }
    -[_UIPageIndicatorView expandProgress](self, "expandProgress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:", v5);

    -[_UIPageIndicatorView _updateImage](self, "_updateImage");
    -[_UIPageIndicatorView _updateProgressBar](self, "_updateProgressBar");
    -[_UIPageIndicatorView _updateIndicatorExpandProgress](self, "_updateIndicatorExpandProgress");
  }
}

- (void)setIndicatorColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_indicatorColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_indicatorColor, a3);
    -[_UIPageIndicatorView _updateImage](self, "_updateImage");
    -[_UIPageIndicatorView _updateProgressBar](self, "_updateProgressBar");
    v5 = v6;
  }

}

- (void)setActiveIndicatorColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_activeIndicatorColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activeIndicatorColor, a3);
    -[_UIPageIndicatorView _updateImage](self, "_updateImage");
    -[_UIPageIndicatorView _updateProgressBar](self, "_updateProgressBar");
    v5 = v6;
  }

}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[_UIPageIndicatorView _updateImage](self, "_updateImage");
    -[_UIPageIndicatorView _updateProgressBar](self, "_updateProgressBar");
    -[_UIPageIndicatorView _updateVibrantColorMatrix](self, "_updateVibrantColorMatrix");
    -[_UIPageIndicatorView _updateIndicatorExpandProgress](self, "_updateIndicatorExpandProgress");
  }
}

- (void)_updateIndicatorExpandProgress
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (-[_UIPageIndicatorView supportsExpandedIndicator](self, "supportsExpandedIndicator"))
  {
    -[_UIPageIndicatorView currentExpandProgress](self, "currentExpandProgress");
    v4 = v3;
    if (-[_UIPageIndicatorView _isDefaultSymbolImage](self, "_isDefaultSymbolImage"))
    {
      -[_UIPageIndicatorView imageView](self, "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", v4 != 0.0);

      -[_UIPageIndicatorView imageView](self, "imageView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlpha:", 1.0);

      -[_UIPageIndicatorView progressView](self, "progressView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", v4 == 0.0);

      -[_UIPageIndicatorView progressView](self, "progressView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAlpha:", 1.0);

      -[_UIPageIndicatorView progressView](self, "progressView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "backgroundView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 1.0);

      if (self->_active)
        v4 = 1.0;
    }
    else
    {
      -[_UIPageIndicatorView imageView](self, "imageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 0);

      -[_UIPageIndicatorView imageView](self, "imageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAlpha:", 1.0 - v4);

      -[_UIPageIndicatorView progressView](self, "progressView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 0);

      -[_UIPageIndicatorView progressView](self, "progressView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAlpha:", v4);

      if (self->_active)
        v15 = v4;
      else
        v15 = 1.0;
      -[_UIPageIndicatorView progressView](self, "progressView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "backgroundView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAlpha:", v15);

      if (self->_active)
        v4 = 1.0;
    }
    -[_UIPageIndicatorView progressView](self, "progressView");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "filledView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAlpha:", v4);

  }
}

- (BOOL)supportsExpandedIndicator
{
  return self->_supportsExpandedIndicator;
}

- (BOOL)isInvalidated
{
  return self->_page == -1;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (CGSize)sizeForImage:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v6 = a4;
  v7 = a3;
  -[_UIPageIndicatorView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeForImage:traits:", v7, v6);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_updateImage
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (!-[_UIPageIndicatorView isActive](self, "isActive") || -[_UIPageIndicatorView mode](self, "mode"))
  {
    v3 = 0;
LABEL_4:
    -[_UIPageIndicatorView image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = 0;
    v7 = 1;
    goto LABEL_5;
  }
  -[_UIPageIndicatorView activeImage](self, "activeImage");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v3 = 1;
    goto LABEL_4;
  }
  v5 = (void *)v12;
  -[_UIPageIndicatorView activeImage](self, "activeImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = 1;
  v6 = 1;
LABEL_5:
  -[_UIPageIndicatorView imageView](self, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v4);

  if (!v7)
  {
    if (!v6)
      goto LABEL_7;
LABEL_10:

    if (v3)
      goto LABEL_8;
LABEL_11:
    -[_UIPageIndicatorView indicatorColor](self, "indicatorColor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  if (v6)
    goto LABEL_10;
LABEL_7:
  if (!v3)
    goto LABEL_11;
LABEL_8:

  -[_UIPageIndicatorView activeIndicatorColor](self, "activeIndicatorColor");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v10 = (void *)v9;
  -[_UIPageIndicatorView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTintColor:", v10);

  -[_UIPageIndicatorView imageView](self, "imageView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

}

- (_UIPageIndicatorImageView)imageView
{
  return self->_imageView;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)_updateProgressBar
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_UIPageIndicatorView indicatorColor](self, "indicatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPageIndicatorView progressView](self, "progressView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  -[_UIPageIndicatorView activeIndicatorColor](self, "activeIndicatorColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPageIndicatorView progressView](self, "progressView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filledView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

  -[_UIPageIndicatorView progressView](self, "progressView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

}

- (_UIPageIndicatorProgressView)progressView
{
  return self->_progressView;
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (UIColor)activeIndicatorColor
{
  return self->_activeIndicatorColor;
}

- (UIImage)activeImage
{
  return self->_activeImage;
}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[_UIPageIndicatorView _updateImage](self, "_updateImage");
    -[_UIPageIndicatorView _updateIndicatorExpandProgress](self, "_updateIndicatorExpandProgress");
    v5 = v6;
  }

}

- (void)setActiveImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_activeImage != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activeImage, a3);
    -[_UIPageIndicatorView _updateImage](self, "_updateImage");
    -[_UIPageIndicatorView _updateIndicatorExpandProgress](self, "_updateIndicatorExpandProgress");
    v5 = v6;
  }

}

- (void)invalidate
{
  self->_page = -1;
  self->_currentProgress = 0.0;
  -[_UIPageIndicatorView setMode:direction:](self, "setMode:direction:", 0, 0);
}

- (int64_t)mode
{
  return self->_mode;
}

- (_UIPageIndicatorView)initWithFrame:(CGRect)a3
{
  _UIPageIndicatorView *v3;
  _UIPageIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIPageIndicatorView prepare](v3, "prepare");
  return v4;
}

- (void)prepare
{
  _UIPageIndicatorImageView *v3;
  _UIPageIndicatorImageView *v4;
  _UIPageIndicatorImageView *imageView;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  UIViewFloatAnimatableProperty *v12;
  UIViewFloatAnimatableProperty *expandProgress;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id location;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[_UIPageIndicatorView setPage:](self, "setPage:", -1);
  -[UIView setMaximumContentSizeCategory:](self, "setMaximumContentSizeCategory:", CFSTR("UICTContentSizeCategoryXXL"));
  v3 = [_UIPageIndicatorImageView alloc];
  v4 = -[_UIPageIndicatorImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

  -[UIView setMaximumContentSizeCategory:](self->_imageView, "setMaximumContentSizeCategory:", CFSTR("UICTContentSizeCategoryXXL"));
  -[_UIPageIndicatorImageView setIndicatorView:](self->_imageView, "setIndicatorView:", self);
  -[UIView addSubview:](self, "addSubview:", self->_imageView);
  v6 = (__int128 *)MEMORY[0x1E0CD2338];
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  *(_OWORD *)&self->_vibrantColorMatrix.m42 = v7;
  v9 = v6[2];
  v8 = v6[3];
  *(_OWORD *)&self->_vibrantColorMatrix.m24 = v9;
  *(_OWORD *)&self->_vibrantColorMatrix.m33 = v8;
  v10 = *v6;
  v11 = v6[1];
  *(_OWORD *)&self->_vibrantColorMatrix.m11 = *v6;
  *(_OWORD *)&self->_vibrantColorMatrix.m15 = v11;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m33 = v8;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m42 = v7;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m15 = v11;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m24 = v9;
  *(_OWORD *)&self->_activeVibrantColorMatrix.m11 = v10;
  self->_imageDisplayScaleFactor = 1.0;
  v12 = (UIViewFloatAnimatableProperty *)objc_opt_new();
  expandProgress = self->_expandProgress;
  self->_expandProgress = v12;

  -[UIViewFloatAnimatableProperty setValue:](self->_expandProgress, "setValue:", 0.0);
  objc_initWeak(&location, self);
  -[_UIPageIndicatorView expandProgress](self, "expandProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __31___UIPageIndicatorView_prepare__block_invoke;
  v16[3] = &unk_1E16B3F40;
  objc_copyWeak(&v17, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:](UIView, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v15, v16);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
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
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;

  v26.receiver = self;
  v26.super_class = (Class)_UIPageIndicatorView;
  -[UIView layoutSubviews](&v26, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIPageIndicatorView _currentImageContentInsets](self, "_currentImageContentInsets");
  -[UIView setFrame:](self->_progressView, "setFrame:", v4 + v14, v6 + v11, v8 - (v14 + v12), v10 - (v11 + v13));
  v15 = -[_UIPageIndicatorView _transitionDirection](self, "_transitionDirection");
  -[_UIPageIndicatorView image](self, "image");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPageIndicatorView sizeForImage:traits:](self, "sizeForImage:traits:", v16, 0);
  v18 = v17;
  v20 = v19;

  v21 = *MEMORY[0x1E0C9D538];
  v22 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v23 = -[_UIPageIndicatorView direction](self, "direction");
  v24 = v21;
  v25 = v22;
  switch(v23)
  {
    case 0:
      v24 = v21;
      v25 = v22;
      if (v15 == 1)
        goto LABEL_5;
      break;
    case 1:
      v24 = v21;
      v25 = v22;
      if (v15 == 2)
      {
LABEL_5:
        v27.origin.x = v4;
        v27.origin.y = v6;
        v27.size.width = v8;
        v27.size.height = v10;
        v24 = CGRectGetWidth(v27) - v18;
        v25 = v22;
      }
      break;
    case 2:
      v24 = v21;
      v25 = v22;
      if (v15 == 1)
        goto LABEL_9;
      break;
    case 3:
      v24 = v21;
      v25 = v22;
      if (v15 == 2)
      {
LABEL_9:
        v28.origin.x = v4;
        v28.origin.y = v6;
        v28.size.width = v8;
        v28.size.height = v10;
        v25 = CGRectGetHeight(v28) - v20;
        v24 = v21;
      }
      break;
    default:
      break;
  }
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v18 * 0.5 + v24, v20 * 0.5 + v25);
  -[UIImageView setBounds:](self->_imageView, "setBounds:", v21, v22, v18, v20);
}

- (int64_t)direction
{
  return self->_direction;
}

- (int64_t)_transitionDirection
{
  if (-[_UIPageIndicatorView _hasOngoingExpandTransition](self, "_hasOngoingExpandTransition"))
    return self->_offsetDirection;
  else
    return 0;
}

- (BOOL)_hasOngoingExpandTransition
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  -[_UIPageIndicatorView expandProgress](self, "expandProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = v4;
  -[_UIPageIndicatorView expandProgress](self, "expandProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationValue");
  v8 = v5 != v7;

  return v8;
}

- (UIEdgeInsets)_currentImageContentInsets
{
  void *v2;
  void *v3;
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
  double v15;
  UIEdgeInsets result;

  -[_UIPageIndicatorView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_currentImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)setSupportsExpandedIndicator:(BOOL)a3
{
  _BOOL4 v3;
  _UIPageIndicatorProgressView *v5;
  _UIPageIndicatorProgressView *v6;
  _UIPageIndicatorProgressView *progressView;
  _UIPageIndicatorProgressView *v8;
  void *v9;
  id v10;

  if (self->_supportsExpandedIndicator != a3)
  {
    v3 = a3;
    self->_supportsExpandedIndicator = a3;
    -[UIImageView _setSuppressPixelAlignment:](self->_imageView, "_setSuppressPixelAlignment:");
    if (v3)
    {
      v5 = [_UIPageIndicatorProgressView alloc];
      v6 = -[_UIPageIndicatorProgressView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      progressView = self->_progressView;
      self->_progressView = v6;

      -[_UIPageIndicatorProgressView setIndicatorView:](self->_progressView, "setIndicatorView:", self);
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_progressView, 0);
      -[_UIPageIndicatorView _updateProgressBar](self, "_updateProgressBar");
      -[_UIPageIndicatorView _updateIndicatorExpandProgress](self, "_updateIndicatorExpandProgress");
    }
    else
    {
      -[UIView removeFromSuperview](self->_progressView, "removeFromSuperview");
      v8 = self->_progressView;
      self->_progressView = 0;

      -[_UIPageIndicatorView imageView](self, "imageView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 0);

      -[_UIPageIndicatorView imageView](self, "imageView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAlpha:", 1.0);

    }
  }
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIPageIndicatorView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeThatFits:", width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setCurrentProgress:(float)a3
{
  id v3;

  if (self->_currentProgress != a3)
  {
    self->_currentProgress = a3;
    -[_UIPageIndicatorView progressView](self, "progressView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsLayout");

  }
}

- (CGSize)expandedModeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_expandedModeSize.width;
  height = self->_expandedModeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)defaultModeSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultModeSize.width;
  height = self->_defaultModeSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (float)currentProgress
{
  return self->_currentProgress;
}

- (BOOL)_isDefaultSymbolImage
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  char v7;

  -[_UIPageIndicatorView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSymbolImage"))
  {
    -[_UIPageIndicatorView image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageName(v4);
    v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 == CFSTR("circlebadge.fill"))
    {
      v7 = 1;
    }
    else if (v5)
    {
      v7 = -[__CFString isEqual:](v5, "isEqual:", CFSTR("circlebadge.fill"));
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGSize)_adjustedExpandedModeSize
{
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
  CGSize result;

  -[_UIPageIndicatorView expandedModeSize](self, "expandedModeSize");
  v4 = v3;
  v6 = v5;
  -[_UIPageIndicatorView _currentImageContentInsets](self, "_currentImageContentInsets");
  v9 = v4 - (v7 + v8);
  v12 = v6 - (v10 + v11);
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (CGSize)_adjustedDefaultModeSize
{
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
  CGSize result;

  -[_UIPageIndicatorView defaultModeSize](self, "defaultModeSize");
  v4 = v3;
  v6 = v5;
  -[_UIPageIndicatorView _currentImageContentInsets](self, "_currentImageContentInsets");
  v9 = v4 - (v7 + v8);
  v12 = v6 - (v10 + v11);
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (_UIPageIndicatorView)initWithCoder:(id)a3
{
  _UIPageIndicatorView *v3;
  _UIPageIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorView;
  v3 = -[UIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_UIPageIndicatorView prepare](v3, "prepare");
  return v4;
}

- (CGAffineTransform)contentTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_imageView;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transform](result, "transform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  -[UIView setTransform:](self->_imageView, "setTransform:", v4);
}

- (void)setImageDisplayScaleFactor:(double)a3
{
  UITraitChangeRegistration *displayScaleTraitChangeRegistration;
  UITraitChangeRegistration *v6;
  void *v7;
  UITraitChangeRegistration *v8;
  UITraitChangeRegistration *v9;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageIndicatorView.m"), 135, CFSTR("imageDisplayScaleFactor (%f) must be greater than 0."), *(_QWORD *)&a3);

  }
  if (self->_imageDisplayScaleFactor != a3)
  {
    self->_imageDisplayScaleFactor = a3;
    displayScaleTraitChangeRegistration = self->_displayScaleTraitChangeRegistration;
    if (fabs(a3 + -1.0) >= 2.22044605e-16)
    {
      if (!displayScaleTraitChangeRegistration)
      {
        v13[0] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v7, sel__updateImageDisplayScaleOverride);
        v8 = (UITraitChangeRegistration *)objc_claimAutoreleasedReturnValue();
        v9 = self->_displayScaleTraitChangeRegistration;
        self->_displayScaleTraitChangeRegistration = v8;

      }
      -[_UIPageIndicatorView _updateImageDisplayScaleOverride](self, "_updateImageDisplayScaleOverride");
    }
    else
    {
      if (displayScaleTraitChangeRegistration)
      {
        -[UIView unregisterForTraitChanges:](self, "unregisterForTraitChanges:");
        v6 = self->_displayScaleTraitChangeRegistration;
        self->_displayScaleTraitChangeRegistration = 0;

      }
      -[UIView traitOverrides](self->_imageView, "traitOverrides");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeTrait:", objc_opt_class());

    }
  }
}

- (void)setVibrantColorMatrix:(CAColorMatrix *)a3
{
  CAColorMatrix *p_vibrantColorMatrix;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[5];
  _OWORD v14[5];

  p_vibrantColorMatrix = &self->_vibrantColorMatrix;
  v6 = *(_OWORD *)&self->_vibrantColorMatrix.m33;
  v14[2] = *(_OWORD *)&self->_vibrantColorMatrix.m24;
  v14[3] = v6;
  v14[4] = *(_OWORD *)&self->_vibrantColorMatrix.m42;
  v7 = *(_OWORD *)&self->_vibrantColorMatrix.m15;
  v14[0] = *(_OWORD *)&self->_vibrantColorMatrix.m11;
  v14[1] = v7;
  v8 = *(_OWORD *)&a3->m33;
  v13[2] = *(_OWORD *)&a3->m24;
  v13[3] = v8;
  v13[4] = *(_OWORD *)&a3->m42;
  v9 = *(_OWORD *)&a3->m15;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v9;
  if (!_UICAColorMatrixIsEqualToCAColorMatrix((float *)v14, (float *)v13, 0.0))
  {
    *(_OWORD *)&p_vibrantColorMatrix->m11 = *(_OWORD *)&a3->m11;
    v10 = *(_OWORD *)&a3->m15;
    v11 = *(_OWORD *)&a3->m24;
    v12 = *(_OWORD *)&a3->m42;
    *(_OWORD *)&p_vibrantColorMatrix->m33 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&p_vibrantColorMatrix->m42 = v12;
    *(_OWORD *)&p_vibrantColorMatrix->m15 = v10;
    *(_OWORD *)&p_vibrantColorMatrix->m24 = v11;
    -[_UIPageIndicatorView _updateVibrantColorMatrix](self, "_updateVibrantColorMatrix");
  }
}

- (void)setActiveVibrantColorMatrix:(CAColorMatrix *)a3
{
  CAColorMatrix *p_activeVibrantColorMatrix;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[5];
  _OWORD v14[5];

  p_activeVibrantColorMatrix = &self->_activeVibrantColorMatrix;
  v6 = *(_OWORD *)&self->_activeVibrantColorMatrix.m33;
  v14[2] = *(_OWORD *)&self->_activeVibrantColorMatrix.m24;
  v14[3] = v6;
  v14[4] = *(_OWORD *)&self->_activeVibrantColorMatrix.m42;
  v7 = *(_OWORD *)&self->_activeVibrantColorMatrix.m15;
  v14[0] = *(_OWORD *)&self->_activeVibrantColorMatrix.m11;
  v14[1] = v7;
  v8 = *(_OWORD *)&a3->m33;
  v13[2] = *(_OWORD *)&a3->m24;
  v13[3] = v8;
  v13[4] = *(_OWORD *)&a3->m42;
  v9 = *(_OWORD *)&a3->m15;
  v13[0] = *(_OWORD *)&a3->m11;
  v13[1] = v9;
  if (!_UICAColorMatrixIsEqualToCAColorMatrix((float *)v14, (float *)v13, 0.0))
  {
    *(_OWORD *)&p_activeVibrantColorMatrix->m11 = *(_OWORD *)&a3->m11;
    v10 = *(_OWORD *)&a3->m15;
    v11 = *(_OWORD *)&a3->m24;
    v12 = *(_OWORD *)&a3->m42;
    *(_OWORD *)&p_activeVibrantColorMatrix->m33 = *(_OWORD *)&a3->m33;
    *(_OWORD *)&p_activeVibrantColorMatrix->m42 = v12;
    *(_OWORD *)&p_activeVibrantColorMatrix->m15 = v10;
    *(_OWORD *)&p_activeVibrantColorMatrix->m24 = v11;
    -[_UIPageIndicatorView _updateVibrantColorMatrix](self, "_updateVibrantColorMatrix");
  }
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t page;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  CGAffineTransform transform;
  CGSize v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  page = self->_page;
  v6 = -[_UIPageIndicatorView isInvalidated](self, "isInvalidated");
  -[UIView center](self, "center");
  v8 = v7;
  -[UIView bounds](self, "bounds");
  v16.width = v9;
  v16.height = v10;
  NSStringFromCGSize(v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView transform](self, "transform");
  NSStringFromCGAffineTransform(&transform);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>, page = %ld, invalidated = %d, position = %.2f, size = %@, transform = %@"), v4, self, page, v6, v8, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_updateVibrantColorMatrix
{
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  if (-[_UIPageIndicatorView isActive](self, "isActive"))
    -[_UIPageIndicatorView activeVibrantColorMatrix](self, "activeVibrantColorMatrix");
  else
    -[_UIPageIndicatorView vibrantColorMatrix](self, "vibrantColorMatrix");
  v19 = v24;
  v20 = v25;
  v21 = v26;
  v17 = v22;
  v18 = v23;
  v3 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  v16[2] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  v16[3] = v3;
  v16[4] = *(_OWORD *)(MEMORY[0x1E0CD2338] + 64);
  v4 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 16);
  v16[0] = *MEMORY[0x1E0CD2338];
  v16[1] = v4;
  if (_UICAColorMatrixIsEqualToCAColorMatrix((float *)&v17, (float *)v16, 0.0))
  {
    -[_UIPageIndicatorView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFilters:", 0);
  }
  else
  {
    v19 = v24;
    v20 = v25;
    v21 = v26;
    v17 = v22;
    v18 = v23;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPageIndicatorView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "filters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2F08]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPageIndicatorView imageView](self, "imageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFilters:", v12);

    }
    -[_UIPageIndicatorView imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setValue:forKeyPath:", v5, CFSTR("filters.vibrantColorMatrix.inputColorMatrix"));

  }
}

- (void)_updateImageDisplayScaleOverride
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayScale");
  v5 = v4;
  -[_UIPageIndicatorView imageDisplayScaleFactor](self, "imageDisplayScaleFactor");
  v7 = ceil(v5 * v6);

  -[UIView traitOverrides](self->_imageView, "traitOverrides");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDisplayScale:", v7);

}

- (CAColorMatrix)vibrantColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[7].m33;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[7].m24;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[7].m42;
  v4 = *(_OWORD *)&self[7].m15;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[7].m11;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (CAColorMatrix)activeVibrantColorMatrix
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[8].m33;
  *(_OWORD *)&retstr->m24 = *(_OWORD *)&self[8].m24;
  *(_OWORD *)&retstr->m33 = v3;
  *(_OWORD *)&retstr->m42 = *(_OWORD *)&self[8].m42;
  v4 = *(_OWORD *)&self[8].m15;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[8].m11;
  *(_OWORD *)&retstr->m15 = v4;
  return self;
}

- (double)imageDisplayScaleFactor
{
  return self->_imageDisplayScaleFactor;
}

- (int64_t)offsetDirection
{
  return self->_offsetDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandProgress, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activeIndicatorColor, 0);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_activeImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_displayScaleTraitChangeRegistration, 0);
}

@end
