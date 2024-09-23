@implementation VUIMonogramView

- (VUIMonogramView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  VUIMonogramView *v11;
  VUIMonogramView *v12;
  VUIBaseView *v13;
  uint64_t v14;
  VUIBaseView *placeholderView;
  void *v16;
  id v17;
  uint64_t v18;
  VUIImageView *imageView;
  VUIImageView *v20;
  void *v21;
  void *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VUIMonogramView;
  v11 = -[_UIFloatingContentView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
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
    -[_UIFloatingContentView setContentMotionRotation:translation:](v12, "setContentMotionRotation:translation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 8.0, 8.0);
    -[_UIFloatingContentView setFloatingContentDelegate:](v12, "setFloatingContentDelegate:", v12);
    v13 = [VUIBaseView alloc];
    -[VUIMonogramView bounds](v12, "bounds");
    v14 = -[VUIBaseView initWithFrame:](v13, "initWithFrame:");
    placeholderView = v12->_placeholderView;
    v12->_placeholderView = (VUIBaseView *)v14;

    -[VUIBaseView setHidden:](v12->_placeholderView, "setHidden:", 1);
    -[_UIFloatingContentView contentView](v12, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v12->_placeholderView);

    v17 = objc_alloc(MEMORY[0x1E0DC6A20]);
    -[VUIMonogramView bounds](v12, "bounds");
    v18 = objc_msgSend(v17, "initWithFrame:");
    imageView = v12->_imageView;
    v12->_imageView = (VUIImageView *)v18;

    v20 = v12->_imageView;
    objc_msgSend(v10, "focusedBgColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIImageView _setFocusedColor:](v20, "_setFocusedColor:", v21);

    -[VUIImageView setClipsToBounds:](v12->_imageView, "setClipsToBounds:", 1);
    -[VUIImageView setContentMode:](v12->_imageView, "setContentMode:", 1);
    -[_UIFloatingContentView contentView](v12, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v12->_imageView);

    -[VUIMonogramView updateShadowImage](v12, "updateShadowImage");
  }

  return v12;
}

- (void)updateShadowImage
{
  void *v3;
  VUIBaseView *v4;
  VUIBaseView *v5;
  VUIBaseView *unfocusedShadowView;

  -[VUIMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIFloatingContentView setShadowEnabled:](self, "setShadowEnabled:", 0);
    -[_UIFloatingContentView setClipsContentToBounds:](self, "setClipsContentToBounds:", 0);
    v4 = [VUIBaseView alloc];
    v5 = -[VUIBaseView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[VUIMonogramView setUnFocusedShadowView:](self, "setUnFocusedShadowView:", v5);

    unfocusedShadowView = self->_unfocusedShadowView;
    -[VUIMonogramViewConfiguration unfocusedShadowAlpha](self->_configuration, "unfocusedShadowAlpha");
    -[VUIBaseView setAlpha:](unfocusedShadowView, "setAlpha:");
  }
  else
  {
    -[VUIMonogramView setUnFocusedShadowView:](self, "setUnFocusedShadowView:", 0);
  }
}

- (void)setConfiguration:(id)a3
{
  VUIMonogramViewConfiguration *v5;
  VUIMonogramViewConfiguration *v6;

  v5 = (VUIMonogramViewConfiguration *)a3;
  if (self->_configuration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configuration, a3);
    -[VUIMonogramView updateShadowImage](self, "updateShadowImage");
    v5 = v6;
  }

}

- (void)setFocusedShadowView:(id)a3
{
  VUIBaseView *v5;
  VUIBaseView **p_focusedShadowView;
  VUIBaseView *focusedShadowView;
  void *v8;
  VUIBaseView *v9;

  v5 = (VUIBaseView *)a3;
  p_focusedShadowView = &self->_focusedShadowView;
  focusedShadowView = self->_focusedShadowView;
  v9 = v5;
  if (focusedShadowView != v5)
  {
    -[VUIBaseView removeFromSuperview](focusedShadowView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_focusedShadowView, a3);
    if (*p_focusedShadowView)
    {
      -[_UIFloatingContentView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSubview:atIndex:", *p_focusedShadowView, 0);

    }
  }

}

- (void)setUnFocusedShadowView:(id)a3
{
  VUIBaseView *v5;
  VUIBaseView **p_unfocusedShadowView;
  VUIBaseView *unfocusedShadowView;
  void *v8;
  VUIBaseView *v9;

  v5 = (VUIBaseView *)a3;
  p_unfocusedShadowView = &self->_unfocusedShadowView;
  unfocusedShadowView = self->_unfocusedShadowView;
  v9 = v5;
  if (unfocusedShadowView != v5)
  {
    -[VUIBaseView removeFromSuperview](unfocusedShadowView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_unfocusedShadowView, a3);
    if (*p_unfocusedShadowView)
    {
      -[_UIFloatingContentView contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "insertSubview:atIndex:", *p_unfocusedShadowView, 0);

    }
  }

}

- (void)setImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[VUIImageView setImage:](self->_imageView, "setImage:", v5);
    -[VUIImageView setVuiAlpha:](self->_imageView, "setVuiAlpha:", 1.0);
  }

}

- (void)setPlaceholderImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_placeholderImage != v5)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    -[VUIImageView setPlaceholderImage:](self->_imageView, "setPlaceholderImage:", v5);
    -[VUIMonogramView _updatePlaceholerView](self, "_updatePlaceholerView");
  }

}

- (void)setMonogramDescription:(id)a3
{
  void *v5;
  void *v6;
  VUIMonogramDescription *v7;

  v7 = (VUIMonogramDescription *)a3;
  if (self->_monogramDescription != v7)
  {
    objc_storeStrong((id *)&self->_monogramDescription, a3);
    if (-[VUIMonogramDescription scaleMode](v7, "scaleMode") == 2)
      -[VUIMonogramDescription backgroundColor](v7, "backgroundColor");
    else
      -[VUIMonogramDescription fillColor](v7, "fillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIBaseView setVuiBackgroundColor:](self->_placeholderView, "setVuiBackgroundColor:", v5);
    -[VUIMonogramView _updatePlaceholerView](self, "_updatePlaceholerView");
    -[VUIMonogramView imageProxy](self, "imageProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMonogramView _loadWithMonogramDescription:imageProxy:](self, "_loadWithMonogramDescription:imageProxy:", v7, v6);

  }
}

- (void)_updatePlaceholerView
{
  void *v3;
  _BOOL8 v4;
  _BOOL8 v5;

  -[VUIMonogramView placeholderImage](self, "placeholderImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;
  v5 = v3 != 0;

  -[VUIBaseView setHidden:](self->_placeholderView, "setHidden:", v5);
  -[VUIImageView setHidden:](self->_imageView, "setHidden:", v4);
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
  void *v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v4 = a3.size.width / 130.0;
  -[VUIMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  v10 = floor(v4 * v7);
  v11 = floor(v4 * v9);
  -[VUIMonogramView bounds](self, "bounds");
  v12 = floor((CGRectGetWidth(v17) - v10) * 0.5);
  -[VUIMonogramView bounds](self, "bounds");
  -[VUIBaseView setFrame:](self->_unfocusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v18) - v11) * 0.5), v10, v11);
  -[VUIBaseView layer](self->_unfocusedShadowView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "vuiCGImage"));

  -[VUIBaseView layer](self->_unfocusedShadowView, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramViewConfiguration unfocusedShadowImage](self->_configuration, "unfocusedShadowImage");
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
  void *v14;
  void *v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v4 = a3.size.width / 130.0;
  -[VUIMonogramViewConfiguration focusedShadowImage](self->_configuration, "focusedShadowImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v7 = v6;
  v9 = v8;

  v10 = floor(v4 * v7 * 0.78);
  v11 = floor(v4 * v9 * 0.78);
  -[VUIMonogramView bounds](self, "bounds");
  v12 = floor((CGRectGetWidth(v17) - v10) * 0.5);
  -[VUIMonogramView bounds](self, "bounds");
  -[VUIBaseView setFrame:](self->_focusedShadowView, "setFrame:", v12, floor((CGRectGetHeight(v18) - v11) * 0.5), v10, v11);
  -[VUIBaseView layer](self->_focusedShadowView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramViewConfiguration focusedShadowImage](self->_configuration, "focusedShadowImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setContents:", objc_msgSend(v14, "vuiCGImage"));

  -[VUIBaseView layer](self->_focusedShadowView, "layer");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramViewConfiguration focusedShadowImage](self->_configuration, "focusedShadowImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  objc_msgSend(v16, "setContentsScale:");

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[VUIImageView vui_sizeThatFits:](self->_imageView, "vui_sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height;
  CGFloat width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  VUIImageView *imageView;
  double v19;
  double v20;
  objc_super v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  height = a3.height;
  width = a3.width;
  -[VUIMonogramView bounds](self, "bounds", a4);
  v21.receiver = self;
  v21.super_class = (Class)VUIMonogramView;
  -[VUIMonogramView vui_layoutSubviews:computationOnly:](&v21, sel_vui_layoutSubviews_computationOnly_, 0, v7, v8);
  -[VUIMonogramView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[VUIImageView setFrame:](self->_imageView, "setFrame:");
  -[VUIBaseView setFrame:](self->_placeholderView, "setFrame:", v10, v12, v14, v16);
  -[UIView setFrame:](self->_overlayView, "setFrame:", v10, v12, v14, v16);
  -[VUIBaseView layer](self->_placeholderView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMonogramView bounds](self, "bounds");
  objc_msgSend(v17, "setCornerRadius:", CGRectGetWidth(v23) * 0.5);

  imageView = self->_imageView;
  -[VUIMonogramView bounds](self, "bounds");
  -[VUIImageView setCornerRadius:](imageView, "setCornerRadius:", CGRectGetWidth(v24) * 0.5);
  -[VUIMonogramView _updateUnfocusedShadowFrameAndLayerWithFrame:](self, "_updateUnfocusedShadowFrameAndLayerWithFrame:", v10, v12, v14, v16);
  v19 = width;
  v20 = height;
  result.height = v20;
  result.width = v19;
  return result;
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
  void *v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)VUIMonogramView;
  -[_UIFloatingContentView layoutSubviews](&v14, sel_layoutSubviews);
  -[VUIMonogramView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VUIImageView setFrame:](self->_imageView, "setFrame:");
  -[VUIBaseView setFrame:](self->_placeholderView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_overlayView, "setFrame:", v4, v6, v8, v10);
  -[VUIMonogramView bounds](self, "bounds");
  v11 = CGRectGetWidth(v15) * 0.5;
  -[VUIBaseView layer](self->_placeholderView, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCornerRadius:", v11);

  -[VUIImageView setCornerRadius:](self->_imageView, "setCornerRadius:", v11);
  if (_os_feature_enabled_impl())
  {
    -[VUIMonogramView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", v11);

  }
  -[VUIMonogramView _updateUnfocusedShadowFrameAndLayerWithFrame:](self, "_updateUnfocusedShadowFrameAndLayerWithFrame:", v4, v6, v8, v10);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)setHighlighted:(BOOL)a3
{
  -[VUIImageView setHighlighted:](self->_imageView, "setHighlighted:", a3);
}

- (void)setOverlayView:(id)a3
{
  UIView *v4;
  void *v5;
  UIView *overlayView;

  v4 = (UIView *)a3;
  -[_UIFloatingContentView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vui_addSubview:oldView:", v4, self->_overlayView);

  overlayView = self->_overlayView;
  self->_overlayView = v4;

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v5;

  self->_isSelected = a3;
  if (a3)
    v5 = 8;
  else
    v5 = 0;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self, "setControlState:withAnimationCoordinator:", v5, 0);
  -[VUIMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", 0);
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
  -[VUIMonogramView setPressCompletionBlock:](self, "setPressCompletionBlock:", v8);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  uint64_t v6;
  id v7;

  self->_isSelected = a3;
  if (a3)
    v6 = 8;
  else
    v6 = 0;
  v7 = a5;
  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self, "setControlState:withAnimationCoordinator:", v6, v7);
  -[VUIMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", v7);

}

- (void)floatingContentView:(id)a3 didFinishTransitioningToState:(unint64_t)a4
{
  void *v5;
  void (**v6)(void);

  -[VUIMonogramView pressCompletionBlock](self, "pressCompletionBlock", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VUIMonogramView pressCompletionBlock](self, "pressCompletionBlock");
    v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    -[VUIMonogramView setPressCompletionBlock:](self, "setPressCompletionBlock:", 0);
  }
}

- (void)_updateAppearanceForSelectionStateWithCoordinator:(id)a3
{
  id v4;
  _BOOL4 isSelected;
  void *v6;
  void *v7;
  _QWORD v8[5];
  BOOL v9;

  v4 = a3;
  isSelected = self->_isSelected;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke;
  v8[3] = &unk_1E9F9A5F8;
  v8[4] = self;
  v9 = isSelected;
  v6 = _Block_copy(v8);
  v7 = v6;
  if (v4)
    objc_msgSend(v4, "addCoordinatedAnimationsForAnimation:animations:completion:", !isSelected, v6, 0);
  else
    (*((void (**)(void *))v6 + 2))(v6);

}

uint64_t __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  double v11;
  _QWORD v12[5];
  char v13;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  v3 = *(double *)(v2 + 888);
  if (v3 != 0.0 && v3 != 1.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "inheritedAnimationDuration");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke_2;
    v12[3] = &unk_1E9F9A5F8;
    v12[4] = *(_QWORD *)(v1 + 32);
    v13 = *(_BYTE *)(v1 + 40);
    result = objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 32, v12, 0, v5 * 0.3, 0.0);
    v2 = *(_QWORD *)(v1 + 32);
  }
  v6 = *(void **)(v2 + 912);
  if (v6 && *(_QWORD *)(v2 + 920))
  {
    v7 = 0.0;
    v8 = 0.0;
    if (*(_BYTE *)(v1 + 40))
      objc_msgSend(*(id *)(v2 + 856), "focusedShadowAlpha", 0.0);
    objc_msgSend(v6, "setAlpha:", v8);
    v9 = *(_QWORD *)(v1 + 32);
    v10 = *(void **)(v9 + 920);
    if (!*(_BYTE *)(v1 + 40))
    {
      objc_msgSend(*(id *)(v9 + 856), "unfocusedShadowAlpha");
      v7 = v11;
    }
    return objc_msgSend(v10, "setAlpha:", v7);
  }
  return result;
}

uint64_t __69__VUIMonogramView__updateAppearanceForSelectionStateWithCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 1.0;
  v4 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v4 = *(double *)(v2 + 888);
  objc_msgSend(*(id *)(v2 + 928), "setAlpha:", v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(a1 + 40))
    v3 = *(double *)(v5 + 888);
  return objc_msgSend(*(id *)(v5 + 840), "setAlpha:", v3);
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
    -[VUIMonogramView bounds](self, "bounds");
    width = v6;
    height = v7;
  }
  else
  {
    width = a3.width;
  }
  -[_UIFloatingContentView focusedSizeIncrease](self, "focusedSizeIncrease");
  v9 = 1.0;
  if (height > 0.0)
    v9 = width / height;
  if (width <= height)
  {
    v11 = height + v8;
    v10 = ceil(v11 * v9);
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
  _VUIMonogramDecorator *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  double v29;
  double v30;
  void *v31;
  UIImage *v32;
  UIImage *placeholderImage;
  VUIImageView *imageView;
  _QWORD v35[4];
  id v36;
  id v37;
  id location;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "preferedMonogramType") && !v7 && self->_placeholderImage)
  {
    -[VUIBaseView setHidden:](self->_placeholderView, "setHidden:", 1);
    -[VUIImageView setHidden:](self->_imageView, "setHidden:", 0);
    -[VUIImageView setImage:](self->_imageView, "setImage:", 0);
    -[VUIMonogramView _updateAppearanceForSelectionStateWithCoordinator:](self, "_updateAppearanceForSelectionStateWithCoordinator:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (_VUIMonogramDecorator *)objc_claimAutoreleasedReturnValue();
    -[_VUIMonogramDecorator postNotificationName:object:](v10, "postNotificationName:object:", CFSTR("VUIMonogramViewImageDidUpdateNotification"), self);
    goto LABEL_20;
  }
  objc_msgSend(v6, "size");
  v10 = -[VUIImageScaleDecorator initWithScaleToSize:scaleMode:]([_VUIMonogramDecorator alloc], "initWithScaleToSize:scaleMode:", objc_msgSend(v6, "scaleMode"), v8, v9);
  objc_msgSend(v6, "imageURL");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v6, "imageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "vuicore_isResourceOrSymbolURL");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v6, "padding");
      -[VUIImageScaleDecorator setPadding:](v10, "setPadding:");
      objc_msgSend(v6, "upscaleAdjustment");
      -[VUIImageScaleDecorator setFocusedSizeIncrease:](v10, "setFocusedSizeIncrease:");
      if (!objc_msgSend(v6, "optimizedImageRendering"))
      {
        objc_msgSend(v6, "backgroundColor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIImageScaleDecorator setBgColor:](v10, "setBgColor:", v21);

        objc_msgSend(v6, "borderColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[_VUIMonogramDecorator setBorderColor:](v10, "setBorderColor:", v22);

        objc_msgSend(v6, "borderWidth");
        -[_VUIMonogramDecorator setBorderWidth:](v10, "setBorderWidth:");
        if (v7)
          goto LABEL_7;
        goto LABEL_12;
      }
      -[VUIMonogramView imageView](self, "imageView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "borderWidth");
      objc_msgSend(v15, "setBorderWidth:");

      -[VUIMonogramView imageView](self, "imageView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "borderColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setBorderColor:", v17);

      -[VUIMonogramView imageView](self, "imageView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backgroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPlaceholderColor:", v19);

    }
  }
  if (v7)
  {
LABEL_7:
    v20 = v7;
    goto LABEL_13;
  }
LABEL_12:
  v23 = objc_alloc(MEMORY[0x1E0DC6A10]);
  +[_VUIMonogramImageLoader sharedInstance](_VUIMonogramImageLoader, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v23, "initWithObject:imageLoader:groupType:", v6, v24, 0);

LABEL_13:
  objc_msgSend(v20, "setCacheOnLoad:", objc_msgSend(MEMORY[0x1E0DC69B0], "canHandleDecodingOnRenderThread") ^ 1);
  objc_msgSend(v20, "setDecorator:", v10);
  objc_msgSend(v20, "setOptimizedImageRendering:", objc_msgSend(v6, "optimizedImageRendering"));
  objc_msgSend(v6, "imageURL");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25
    && (v26 = (void *)v25,
        objc_msgSend(v6, "imageURL"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = objc_msgSend(v27, "vuicore_isResourceOrSymbolURL"),
        v27,
        v26,
        (v28 & 1) == 0))
  {
    v30 = 1.0;
    -[VUIImageView setVuiAlpha:](self->_imageView, "setVuiAlpha:", 1.0);
  }
  else
  {
    -[VUIMonogramViewConfiguration unfocusedImageAlpha](self->_configuration, "unfocusedImageAlpha");
    v30 = v29;
  }
  self->_unfocusedImageAlpha = v30;
  objc_msgSend(v6, "placeholderImage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v6, "placeholderImage");
    v32 = (UIImage *)objc_claimAutoreleasedReturnValue();
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = v32;

  }
  objc_initWeak(&location, self);
  imageView = self->_imageView;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke;
  v35[3] = &unk_1E9FA1B08;
  objc_copyWeak(&v37, &location);
  v36 = v6;
  -[VUIImageView setImageProxy:completion:](imageView, "setImageProxy:completion:", v20, v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

LABEL_20:
}

void __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  id *v7;
  id *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;

  v7 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a4)
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "preferedMonogramType");
    if (a2 || !v9)
    {
      objc_msgSend(WeakRetained[105], "setHidden:", 1);
      objc_msgSend(WeakRetained[116], "setHidden:", 0);
      objc_msgSend(WeakRetained, "_updateAppearanceForSelectionStateWithCoordinator:", 0);
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "postNotificationName:object:", CFSTR("VUIMonogramViewImageDidUpdateNotification"), WeakRetained);

      }
    }
    else
    {
      if ((unint64_t)(v9 - 3) >= 3)
        v10 = v9 - 1;
      else
        v10 = 2;
      v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyWithType:", v10);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2;
      v17 = &unk_1E9F9A938;
      objc_copyWeak(&v19, v7);
      v18 = v11;
      v12 = v11;
      dispatch_async(MEMORY[0x1E0C80D38], &v14);

      objc_destroyWeak(&v19);
      objc_msgSend(WeakRetained, "_updateAppearanceForSelectionStateWithCoordinator:", 0, v14, v15, v16, v17);
    }
  }

}

void __59__VUIMonogramView__loadWithMonogramDescription_imageProxy___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_loadWithMonogramDescription:imageProxy:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v3;
  }

}

- (VUIMonogramViewConfiguration)configuration
{
  return self->_configuration;
}

- (VUIMonogramDescription)monogramDescription
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

- (id)pressCompletionBlock
{
  return self->_pressCompletionBlock;
}

- (void)setPressCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 904);
}

- (VUIBaseView)focusedShadowView
{
  return self->_focusedShadowView;
}

- (VUIBaseView)unfocusedShadowView
{
  return self->_unfocusedShadowView;
}

- (void)setUnfocusedShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_unfocusedShadowView, a3);
}

- (VUIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (VUIImageProxy)imageProxy
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
  objc_storeStrong((id *)&self->_unfocusedShadowView, 0);
  objc_storeStrong((id *)&self->_focusedShadowView, 0);
  objc_storeStrong(&self->_pressCompletionBlock, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_monogramDescription, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
