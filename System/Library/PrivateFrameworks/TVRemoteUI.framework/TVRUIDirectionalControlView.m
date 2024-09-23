@implementation TVRUIDirectionalControlView

- (TVRUIDirectionalControlView)initWithStyleProvider:(id)a3
{
  id v5;
  TVRUIDirectionalControlView *v6;
  TVRUIDirectionalControlView *v7;
  void *v8;
  UIView *v9;
  UIView *tapHandlingSquareWrapperView;
  UIView *v11;
  UIView *directionControlsWrapperView;
  uint64_t v13;
  UIImageView *upImageView;
  uint64_t v15;
  UIImageView *rightImageView;
  uint64_t v17;
  UIImageView *downImageView;
  uint64_t v19;
  UIImageView *leftImageView;
  UIView *v21;
  UIView *selectIndicator;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSArray *interactionViews;
  NSArray *v34;
  TVRUIDirectionalControlView *v35;
  void *v36;
  uint64_t v37;
  TVRButtonHaptic *haptic;
  _QWORD v40[4];
  TVRUIDirectionalControlView *v41;
  objc_super v42;
  _QWORD v43[6];

  v43[5] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v42.receiver = self;
  v42.super_class = (Class)TVRUIDirectionalControlView;
  v6 = -[TVRUIDirectionalControlView init](&v42, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_styleProvider, a3);
    -[TVRUIStyleProvider touchpadBackgroundColor](v7->_styleProvider, "touchpadBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIDirectionalControlView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    tapHandlingSquareWrapperView = v7->_tapHandlingSquareWrapperView;
    v7->_tapHandlingSquareWrapperView = v9;

    -[TVRUIDirectionalControlView addSubview:](v7, "addSubview:", v7->_tapHandlingSquareWrapperView);
    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    directionControlsWrapperView = v7->_directionControlsWrapperView;
    v7->_directionControlsWrapperView = v11;

    -[TVRUIDirectionalControlView addSubview:](v7, "addSubview:", v7->_directionControlsWrapperView);
    -[TVRUIDirectionalControlView _createDirectionalImageViewWithImageName:](v7, "_createDirectionalImageViewWithImageName:", CFSTR("DirectionalControlArrowUp"));
    v13 = objc_claimAutoreleasedReturnValue();
    upImageView = v7->_upImageView;
    v7->_upImageView = (UIImageView *)v13;

    -[TVRUIDirectionalControlView _createDirectionalImageViewWithImageName:](v7, "_createDirectionalImageViewWithImageName:", CFSTR("DirectionalControlArrowRight"));
    v15 = objc_claimAutoreleasedReturnValue();
    rightImageView = v7->_rightImageView;
    v7->_rightImageView = (UIImageView *)v15;

    -[TVRUIDirectionalControlView _createDirectionalImageViewWithImageName:](v7, "_createDirectionalImageViewWithImageName:", CFSTR("DirectionalControlArrowDown"));
    v17 = objc_claimAutoreleasedReturnValue();
    downImageView = v7->_downImageView;
    v7->_downImageView = (UIImageView *)v17;

    -[TVRUIDirectionalControlView _createDirectionalImageViewWithImageName:](v7, "_createDirectionalImageViewWithImageName:", CFSTR("DirectionalControlArrowLeft"));
    v19 = objc_claimAutoreleasedReturnValue();
    leftImageView = v7->_leftImageView;
    v7->_leftImageView = (UIImageView *)v19;

    v21 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    selectIndicator = v7->_selectIndicator;
    v7->_selectIndicator = v21;

    -[TVRUIDirectionalControlView styleProvider](v7, "styleProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "directionalPadSelectButtonBorderWidth");
    v25 = v24;
    -[UIView layer](v7->_selectIndicator, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setBorderWidth:", v25);

    -[TVRUIDirectionalControlView styleProvider](v7, "styleProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "directionalPadSelectButtonBorderColor");
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = objc_msgSend(v28, "CGColor");
    -[UIView layer](v7->_selectIndicator, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBorderColor:", v29);

    -[UIView setAlpha:](v7->_selectIndicator, "setAlpha:", 0.6);
    -[UIView layer](v7->_selectIndicator, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCornerRadius:", 24.0);

    v43[0] = v7->_upImageView;
    v43[1] = v7->_rightImageView;
    v43[2] = v7->_downImageView;
    v43[3] = v7->_leftImageView;
    v43[4] = v7->_selectIndicator;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 5);
    v32 = objc_claimAutoreleasedReturnValue();
    interactionViews = v7->_interactionViews;
    v7->_interactionViews = (NSArray *)v32;

    v34 = v7->_interactionViews;
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __53__TVRUIDirectionalControlView_initWithStyleProvider___block_invoke;
    v40[3] = &unk_24DE2CD50;
    v35 = v7;
    v41 = v35;
    -[NSArray enumerateObjectsUsingBlock:](v34, "enumerateObjectsUsingBlock:", v40);
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v35);
    -[TVRUIDirectionalControlView addInteraction:](v35, "addInteraction:", v36);

    -[TVRUIDirectionalControlView _configureLongPressGesture:](v35, "_configureLongPressGesture:", v7->_selectIndicator);
    -[TVRUIDirectionalControlView _configureGesture](v35, "_configureGesture");
    +[TVRButtonHaptic hapticForView:](TVRButtonHaptic, "hapticForView:", v7->_tapHandlingSquareWrapperView);
    v37 = objc_claimAutoreleasedReturnValue();
    haptic = v35->_haptic;
    v35->_haptic = (TVRButtonHaptic *)v37;

  }
  return v7;
}

uint64_t __53__TVRUIDirectionalControlView_initWithStyleProvider___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "addSubview:", a2);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat Width;
  double Height;
  double v15;
  CGFloat x;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  NSObject *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  NSObject *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat rect;
  CGFloat y;
  CGFloat v38;
  uint8_t buf[16];
  objc_super v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v40.receiver = self;
  v40.super_class = (Class)TVRUIDirectionalControlView;
  -[TVRUIDirectionalControlView layoutSubviews](&v40, sel_layoutSubviews);
  -[TVRUIDirectionalControlView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setBounds:](self->_tapHandlingSquareWrapperView, "setBounds:", 0.0, 0.0, v7, v7);
  v41.origin.x = v4;
  v41.origin.y = v6;
  v41.size.width = v8;
  v41.size.height = v10;
  v11 = 0.5;
  v12 = CGRectGetWidth(v41) * 0.5;
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  -[UIView setCenter:](self->_tapHandlingSquareWrapperView, "setCenter:", v12, CGRectGetHeight(v42) * 0.5);
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  Width = CGRectGetWidth(v43);
  -[UIView setBounds:](self->_directionControlsWrapperView, "setBounds:", 0.0, 0.0, Width * 0.69, Width * 0.69);
  v44.origin.x = v4;
  v44.origin.y = v6;
  v44.size.width = v8;
  v44.size.height = v10;
  Height = CGRectGetHeight(v44);
  -[UIView bounds](self->_directionControlsWrapperView, "bounds");
  x = v15;
  y = v17;
  v38 = v18;
  v20 = v19;
  if (-[TVRUIDirectionalControlView offsetDirectionalPad](self, "offsetDirectionalPad"))
  {
    _TVRUIViewControllerLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v21, OS_LOG_TYPE_DEFAULT, "Directional view adjusting position for media controls", buf, 2u);
    }

    v45.origin.x = v4;
    v45.origin.y = v6;
    v45.size.width = v8;
    v45.size.height = v10;
    v22 = CGRectGetHeight(v45);
    -[TVRUIDirectionalControlView styleProvider](self, "styleProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "mediaControlsViewHeight");
    v25 = v22 - v24;

    v26 = v25 * 0.5;
    -[TVRUIDirectionalControlView styleProvider](self, "styleProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isSmallDevice");

    if (v28)
    {
      rect = v20;
      _TVRUIViewControllerLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v29, OS_LOG_TYPE_DEFAULT, "Showing the directional controls on a small device so adjusting the insets to ensure the controls fit.", buf, 2u);
      }

      -[TVRUIDirectionalControlView styleProvider](self, "styleProvider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "directionalPadInsetForSmallDevices");
      v32 = v31;
      v34 = v33;

      v46.origin.x = x;
      v46.origin.y = y;
      v46.size.width = v38;
      v46.size.height = rect;
      v47 = CGRectInset(v46, v34, v32);
      x = v47.origin.x;
      y = v47.origin.y;
      v38 = v47.size.width;
      v26 = v26 + v34;
      v20 = v47.size.height;
      v11 = 0.5;
    }
  }
  else
  {
    v26 = Height * 0.5;
  }
  v48.origin.x = v4;
  v48.origin.y = v6;
  v48.size.width = v8;
  v48.size.height = v10;
  -[UIView setCenter:](self->_directionControlsWrapperView, "setCenter:", CGRectGetWidth(v48) * v11, v26);
  -[UIView setBounds:](self->_selectIndicator, "setBounds:", 0.0, 0.0, 88.0, 88.0);
  -[UIView bounds](self->_directionControlsWrapperView, "bounds");
  v35 = CGRectGetWidth(v49) * v11;
  -[UIView bounds](self->_directionControlsWrapperView, "bounds");
  -[UIView setCenter:](self->_selectIndicator, "setCenter:", v35, CGRectGetHeight(v50) * v11);
  -[UIImageView setFrame:](self->_upImageView, "setFrame:", _TVRImageFrameForDirectionalImage_0(self->_upImageView, 1, x, y, v38, v20));
  -[TVRUIDirectionalControlView _layoutHighlightViewForView:](self, "_layoutHighlightViewForView:", self->_upImageView);
  -[UIImageView setFrame:](self->_downImageView, "setFrame:", _TVRImageFrameForDirectionalImage_0(self->_downImageView, 4, x, y, v38, v20));
  -[TVRUIDirectionalControlView _layoutHighlightViewForView:](self, "_layoutHighlightViewForView:", self->_downImageView);
  -[UIImageView setFrame:](self->_leftImageView, "setFrame:", _TVRImageFrameForDirectionalImage_0(self->_leftImageView, 2, x, y, v38, v20));
  -[TVRUIDirectionalControlView _layoutHighlightViewForView:](self, "_layoutHighlightViewForView:", self->_leftImageView);
  -[UIImageView setFrame:](self->_rightImageView, "setFrame:", _TVRImageFrameForDirectionalImage_0(self->_rightImageView, 8, x, y, v38, v20));
  -[TVRUIDirectionalControlView _layoutHighlightViewForView:](self, "_layoutHighlightViewForView:", self->_rightImageView);
}

- (void)setOffsetDirectionalPad:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  if (self->_offsetDirectionalPad != a3)
  {
    self->_offsetDirectionalPad = a3;
    -[TVRUIDirectionalControlView window](self, "window");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TVRUIDirectionalControlView superview](self, "superview");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7[0] = MEMORY[0x24BDAC760];
        v7[1] = 3221225472;
        v7[2] = __55__TVRUIDirectionalControlView_setOffsetDirectionalPad___block_invoke;
        v7[3] = &unk_24DE2C198;
        v7[4] = self;
        objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v7, 0.4);
      }
    }
  }
}

uint64_t __55__TVRUIDirectionalControlView_setOffsetDirectionalPad___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIView *v13;
  UIView *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TVRUIDirectionalControlView;
  v6 = a3;
  -[TVRUIDirectionalControlView touchesBegan:withEvent:](&v15, sel_touchesBegan_withEvent_, v6, a4);
  objc_msgSend(v6, "anyObject", v15.receiver, v15.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  -[TVRUIDirectionalControlView _directionalViewForTouchLocation:](self, "_directionalViewForTouchLocation:", v10, v12);
  v13 = (UIView *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && v13 == self->_selectIndicator)
  {
    objc_storeWeak((id *)&self->_highlightedView, v13);
    -[TVRUIDirectionalControlView _highlightView:enabled:](self, "_highlightView:enabled:", v14, 1);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRUIDirectionalControlView;
  -[TVRUIDirectionalControlView touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_highlightedView);
  -[TVRUIDirectionalControlView _highlightView:enabled:](self, "_highlightView:enabled:", WeakRetained, 0);

  objc_storeWeak((id *)&self->_highlightedView, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRUIDirectionalControlView;
  -[TVRUIDirectionalControlView touchesCancelled:withEvent:](&v6, sel_touchesCancelled_withEvent_, a3, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_highlightedView);
  -[TVRUIDirectionalControlView _highlightView:enabled:](self, "_highlightView:enabled:", WeakRetained, 0);

  objc_storeWeak((id *)&self->_highlightedView, 0);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  CGRect v27;
  CGRect v28;

  v6 = a4;
  -[TVRUIDirectionalControlView interactionViews](self, "interactionViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __81__TVRUIDirectionalControlView_pointerInteraction_regionForRequest_defaultRegion___block_invoke;
  v24[3] = &unk_24DE2CD78;
  v24[4] = self;
  v26 = 0x403E000000000000;
  v8 = v6;
  v25 = v8;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v24);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    -[TVRUIDirectionalControlView interactionViews](self, "interactionViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "bounds");
    v28 = CGRectInset(v27, -30.0, -30.0);
    -[TVRUIDirectionalControlView convertRect:fromView:](self, "convertRect:fromView:", v12, v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = (void *)MEMORY[0x24BEBD838];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "regionWithRect:identifier:", v22, v14, v16, v18, v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

BOOL __81__TVRUIDirectionalControlView_pointerInteraction_regionForRequest_defaultRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v25;
  CGFloat v26;
  CGPoint v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = a2;
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v4, "convertRect:toView:", *(_QWORD *)(a1 + 32), v6, v8, v10, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = v18;
  v29.size.height = v20;
  v30 = CGRectInset(v29, -*(double *)(a1 + 48), -*(double *)(a1 + 48));
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  objc_msgSend(*(id *)(a1 + 40), "location");
  v28.x = v25;
  v28.y = v26;
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  return CGRectContainsPoint(v31, v28);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  UIImageView *v7;
  double Width;
  double Height;
  double v10;
  double v11;
  void *v12;
  double x;
  double y;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDirectionalControlView interactionViews](self, "interactionViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "integerValue"));
  v7 = (UIImageView *)objc_claimAutoreleasedReturnValue();

  -[UIImageView bounds](v7, "bounds");
  Width = CGRectGetWidth(v21);
  -[UIImageView bounds](v7, "bounds");
  Height = CGRectGetHeight(v22);
  if (Width >= Height)
    Height = Width;
  if (v7 == (UIImageView *)self->_selectIndicator)
  {
    -[UIImageView bounds](v7, "bounds", Height);
    v24 = CGRectInset(v23, -10.0, -10.0);
    x = v24.origin.x;
    y = v24.origin.y;
    v10 = v24.size.width;
    v15 = v24.size.height;
    v11 = 24.0;
LABEL_13:
    v16 = objc_alloc_init(MEMORY[0x24BEBD888]);
    objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithRoundedRect:cornerRadius:", x, y, v10, v15, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setVisiblePath:", v17);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:parameters:", v7, v16);
    objc_msgSend(MEMORY[0x24BEBD820], "effectWithPreview:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", v19, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v10 = Height + 20.0;
  v11 = (Height + 20.0) * 0.5;
  if (v7 == self->_leftImageView || v7 == self->_rightImageView)
  {
    y = -10.0;
    x = -25.0;
LABEL_12:
    v15 = Height + 20.0;
    goto LABEL_13;
  }
  if (v7 == self->_upImageView || v7 == self->_downImageView)
  {
    y = -25.0;
    x = -10.0;
    goto LABEL_12;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (id)_createDirectionalImageViewWithImageName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v6);
  objc_msgSend(v7, "setAlpha:", 0.6);
  v8 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v8, "setAlpha:", 0.0);
  objc_msgSend(v7, "insertSubview:atIndex:", v8, 0);

  return v7;
}

- (void)_layoutHighlightViewForView:(id)a3
{
  id v3;
  void *v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v3 = a3;
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setBounds:", 0.0, 0.0, 72.0, 72.0);
  objc_msgSend(v3, "bounds");
  v5 = CGRectGetWidth(v15) * 0.5;
  objc_msgSend(v3, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  objc_msgSend(v14, "setCenter:", v5, CGRectGetHeight(v16) * 0.5);
  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "_setCornerRadius:", CGRectGetWidth(v17) * 0.5);

}

- (id)_directionalViewForTouchLocation:(CGPoint)a3
{
  double y;
  double x;
  UIView **p_selectIndicator;
  UIView *selectIndicator;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  BOOL v23;
  _BOOL4 v24;
  int *v25;
  UIView *v27;
  CGPoint v28;
  CGRect v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  p_selectIndicator = &self->_selectIndicator;
  selectIndicator = self->_selectIndicator;
  -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](selectIndicator, "convertPoint:fromView:", v8, x, y);
  v10 = v9;
  v12 = v11;

  -[UIView bounds](*p_selectIndicator, "bounds");
  v28.x = v10;
  v28.y = v12;
  if (!CGRectContainsPoint(v29, v28))
  {
    -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v30.origin.x = v15;
    v30.origin.y = v17;
    v30.size.width = v19;
    v30.size.height = v21;
    v22 = CGRectGetHeight(v30) - x;
    v23 = y >= v22;
    v24 = y >= x;
    if (y >= x || y >= v22)
    {
      if (y < v22)
        v24 = 1;
      if (v24)
      {
        if (y < x || y < v22)
        {
          if (y < x)
            v23 = 1;
          if (v23)
            return 0;
          v25 = &OBJC_IVAR___TVRUIDirectionalControlView__leftImageView;
        }
        else
        {
          v25 = &OBJC_IVAR___TVRUIDirectionalControlView__downImageView;
        }
      }
      else
      {
        v25 = &OBJC_IVAR___TVRUIDirectionalControlView__rightImageView;
      }
    }
    else
    {
      v25 = &OBJC_IVAR___TVRUIDirectionalControlView__upImageView;
    }
    p_selectIndicator = (UIView **)((char *)self + *v25);
  }
  v27 = *p_selectIndicator;
  return v27;
}

- (void)_highlightView:(id)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  UIImageView *v6;
  double v7;
  UIImageView *v8;

  v4 = a4;
  v6 = (UIImageView *)a3;
  if ((UIImageView *)self->_selectIndicator == v6
    || self->_upImageView == v6
    || self->_downImageView == v6
    || self->_rightImageView == v6
    || self->_leftImageView == v6)
  {
    v7 = 0.6;
    if (v4)
      v7 = 1.0;
    v8 = v6;
    -[UIImageView setAlpha:](v6, "setAlpha:", v7);
    v6 = v8;
  }

}

- (void)_highlightArrowView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "setAlpha:", 1.0);
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 0.4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v6);

  objc_msgSend(v5, "setAlpha:", 1.0);
  v7 = (void *)MEMORY[0x24BEBDB00];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__TVRUIDirectionalControlView__highlightArrowView___block_invoke;
  v10[3] = &unk_24DE2C830;
  v11 = v5;
  v12 = v3;
  v8 = v3;
  v9 = v5;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v10, 0, 0.35);

}

uint64_t __51__TVRUIDirectionalControlView__highlightArrowView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.6);
}

- (void)_configureGesture
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTap_);
  objc_msgSend(v3, "setCancelsTouchesInView:", 0);
  objc_msgSend(v3, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v3, "setDelaysTouchesEnded:", 0);
  -[TVRUIDirectionalControlView addGestureRecognizer:](self, "addGestureRecognizer:", v3);

}

- (void)handleTap:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  UIView *v16;
  void *v17;
  int64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  double v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  _QWORD block[5];
  uint8_t buf[4];
  int64_t v32;
  uint64_t v33;
  CGPoint v34;
  CGRect v35;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[TVRButtonHaptic userInteractionBegan](self->_haptic, "userInteractionBegan");
        objc_msgSend(v4, "locationInView:", self);
        v10 = v9;
        v12 = v11;
        -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "frame");
        v34.x = v10;
        v34.y = v12;
        v14 = CGRectContainsPoint(v35, v34);

        if (v14)
        {
          -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "locationInView:", v15);
          -[TVRUIDirectionalControlView _directionalViewForTouchLocation:](self, "_directionalViewForTouchLocation:");
          v16 = (UIView *)objc_claimAutoreleasedReturnValue();

          if (v16 && v16 != self->_selectIndicator)
            -[TVRUIDirectionalControlView _highlightArrowView:](self, "_highlightArrowView:", v16);
          -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "locationInView:", v17);
          v18 = -[TVRUIDirectionalControlView _buttonTypeForLocation:](self, "_buttonTypeForLocation:");

          +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "generatedButtonEvent:", v19);

          +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, v18);
          v21 = objc_claimAutoreleasedReturnValue();
          -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "generatedButtonEvent:", v21);

          _TVRUIViewControllerLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v32 = v18;
            _os_log_impl(&dword_21B042000, v23, OS_LOG_TYPE_DEFAULT, "Detected directional control tap within bounds of button type %ld", buf, 0xCu);
          }

          goto LABEL_17;
        }
        -[TVRUIDirectionalControlView bounds](self, "bounds");
        if (v12 >= v24 * 0.5)
        {
          +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 13);
          v16 = (UIView *)objc_claimAutoreleasedReturnValue();
          -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "generatedButtonEvent:", v16);

          +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "generatedButtonEvent:", v19);

          _TVRUIViewControllerLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v27 = "Detected directional control tap outside bounds - lower half. Sending arrow down";
            goto LABEL_16;
          }
        }
        else
        {
          +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 12);
          v16 = (UIView *)objc_claimAutoreleasedReturnValue();
          -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "generatedButtonEvent:", v16);

          +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "generatedButtonEvent:", v19);

          _TVRUIViewControllerLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v27 = "Detected directional control tap outside bounds - top half. Sending arrow up";
LABEL_16:
            _os_log_impl(&dword_21B042000, v21, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
          }
        }
LABEL_17:

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __41__TVRUIDirectionalControlView_handleTap___block_invoke;
        block[3] = &unk_24DE2C198;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
  }

}

uint64_t __41__TVRUIDirectionalControlView_handleTap___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "userInteractionEnded");
}

- (int64_t)_buttonTypeForLocation:(CGPoint)a3
{
  double y;
  double x;
  UIView *selectIndicator;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  BOOL v23;
  _BOOL4 v24;
  CGPoint v25;
  CGRect v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  selectIndicator = self->_selectIndicator;
  -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertPoint:fromView:](selectIndicator, "convertPoint:fromView:", v7, x, y);
  v9 = v8;
  v11 = v10;

  -[UIView bounds](self->_selectIndicator, "bounds");
  v25.x = v9;
  v25.y = v11;
  if (CGRectContainsPoint(v26, v25))
    return 1;
  -[TVRUIDirectionalControlView tapHandlingSquareWrapperView](self, "tapHandlingSquareWrapperView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v27.origin.x = v15;
  v27.origin.y = v17;
  v27.size.width = v19;
  v27.size.height = v21;
  v22 = CGRectGetHeight(v27) - x;
  v23 = y >= v22;
  v24 = y >= x;
  if (y < x && y < v22)
    return 12;
  if (y < v22)
    v24 = 1;
  if (!v24)
    return 15;
  if (y >= x && y >= v22)
    return 13;
  if (y < x)
    v23 = 1;
  if (v23)
    return 0;
  else
    return 14;
}

- (void)_configureLongPressGesture:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;

  v4 = (objc_class *)MEMORY[0x24BEBD740];
  v5 = a3;
  v6 = (id)objc_msgSend([v4 alloc], "initWithTarget:action:", self, sel_handleLongPress_);
  objc_msgSend(v6, "setMinimumPressDuration:", 0.3);
  objc_msgSend(v6, "setCancelsTouchesInView:", 1);
  objc_msgSend(v6, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v6, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v5, "addGestureRecognizer:", v6);

}

- (void)handleLongPress:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[TVRUIDirectionalControlView _sendSelectButtonPressBegan](self, "_sendSelectButtonPressBegan");
  }
  else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
  {
    -[TVRUIDirectionalControlView _sendSelectButtonPressEnded](self, "_sendSelectButtonPressEnded");
  }

}

- (void)_sendSelectButtonPressBegan
{
  void *v3;
  id v4;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedButtonEvent:", v4);

}

- (void)_sendSelectButtonPressEnded
{
  void *v3;
  id v4;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDirectionalControlView eventDelegate](self, "eventDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generatedButtonEvent:", v4);

}

- (_TVRUIEventDelegate)eventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (void)setEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventDelegate, a3);
}

- (BOOL)offsetDirectionalPad
{
  return self->_offsetDirectionalPad;
}

- (UIView)selectIndicator
{
  return self->_selectIndicator;
}

- (void)setSelectIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_selectIndicator, a3);
}

- (UIImageView)upImageView
{
  return self->_upImageView;
}

- (void)setUpImageView:(id)a3
{
  objc_storeStrong((id *)&self->_upImageView, a3);
}

- (UIImageView)rightImageView
{
  return self->_rightImageView;
}

- (void)setRightImageView:(id)a3
{
  objc_storeStrong((id *)&self->_rightImageView, a3);
}

- (UIImageView)downImageView
{
  return self->_downImageView;
}

- (void)setDownImageView:(id)a3
{
  objc_storeStrong((id *)&self->_downImageView, a3);
}

- (UIImageView)leftImageView
{
  return self->_leftImageView;
}

- (void)setLeftImageView:(id)a3
{
  objc_storeStrong((id *)&self->_leftImageView, a3);
}

- (NSArray)interactionViews
{
  return self->_interactionViews;
}

- (void)setInteractionViews:(id)a3
{
  objc_storeStrong((id *)&self->_interactionViews, a3);
}

- (UIView)directionControlsWrapperView
{
  return self->_directionControlsWrapperView;
}

- (void)setDirectionControlsWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_directionControlsWrapperView, a3);
}

- (UIView)tapHandlingSquareWrapperView
{
  return self->_tapHandlingSquareWrapperView;
}

- (void)setTapHandlingSquareWrapperView:(id)a3
{
  objc_storeStrong((id *)&self->_tapHandlingSquareWrapperView, a3);
}

- (UIView)highlightedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_highlightedView);
}

- (void)setHighlightedView:(id)a3
{
  objc_storeWeak((id *)&self->_highlightedView, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_haptic, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_destroyWeak((id *)&self->_highlightedView);
  objc_storeStrong((id *)&self->_tapHandlingSquareWrapperView, 0);
  objc_storeStrong((id *)&self->_directionControlsWrapperView, 0);
  objc_storeStrong((id *)&self->_interactionViews, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_downImageView, 0);
  objc_storeStrong((id *)&self->_rightImageView, 0);
  objc_storeStrong((id *)&self->_upImageView, 0);
  objc_storeStrong((id *)&self->_selectIndicator, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end
