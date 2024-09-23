@implementation SBFloatyFolderView

+ (unint64_t)countOfAdditionalPagesToKeepVisibleInOneDirection
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___SBFloatyFolderView;
  return (unint64_t)objc_msgSendSuper2(&v3, sel_countOfAdditionalPagesToKeepVisibleInOneDirection) + 1;
}

+ (id)defaultIconLocation
{
  return CFSTR("SBIconLocationFolder");
}

- (double)_titleFontSize
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatyFolderView floatyFolderConfiguration](self, "floatyFolderConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "titleFontSize");
  v4 = v3;

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UILongPressGestureRecognizer *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if ((UILongPressGestureRecognizer *)self->_tapGesture == v6)
  {
    LOBYTE(self) = -[SBFloatyFolderView _tapToCloseGestureRecognizer:shouldReceiveTouch:](self, "_tapToCloseGestureRecognizer:shouldReceiveTouch:", v6, v7);
  }
  else if (self->_longPressGesture == v6)
  {
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolderView _titleTextField](self, "_titleTextField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
      LODWORD(self) = !-[SBFolderView isEditing](self, "isEditing");
    else
      LOBYTE(self) = 0;

  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)_tapToCloseGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  char v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  CGPoint v15;
  CGRect v16;

  v5 = a4;
  objc_msgSend(v5, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  -[SBFloatyFolderView _frameForScalingView](self, "_frameForScalingView");
  v15.x = v7;
  v15.y = v9;
  if (CGRectContainsPoint(v16, v15))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v10 = isKindOfClass ^ 1;
  }

  return v10 & 1;
}

- (void)_updateScalingViewFrame
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView _updateScalingViewFrame](&v3, sel__updateScalingViewFrame);
  -[SBFloatyFolderView enumeratePageBackgroundViewsUsingBlock:](self, "enumeratePageBackgroundViewsUsingBlock:", &__block_literal_global_33);
}

- (void)enumeratePageBackgroundViewsUsingBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, SBFloatyFolderBackgroundClipView *, char *))a3 + 2))(a3, self->_scrollClipView, &v3);
}

void __45__SBFloatyFolderView__updateScalingViewFrame__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTintEffectColor");

}

- (void)_layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double MinY;
  CGFloat v48;
  void *v49;
  double v50;
  double v51;
  CGFloat rect;
  double v53;
  double v54;
  double v55;
  double v56;
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect remainder;
  CGRect slice;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  -[SBFloatyFolderView floatyFolderConfiguration](self, "floatyFolderConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatyFolderView bounds](self, "bounds");
  v53 = v5;
  v54 = v4;
  v55 = v6;
  v56 = v7;
  -[SBFloatyFolderView traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v57 = v9;

  -[SBFolderView scalingView](self, "scalingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SBFloatyFolderBackgroundClipView setFrame:](self->_scrollClipView, "setFrame:");
  -[SBFloatyFolderBackgroundClipView convertRect:fromView:](self->_scrollClipView, "convertRect:fromView:", v10, v12, v14, v16, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[SBFolderView scrollView](self, "scrollView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

  -[SBFolderView pageControl](self, "pageControl");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pageControlAreaHeight");
  v30 = v29;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v62.origin.x = v12;
  v62.origin.y = v14;
  v62.size.width = v16;
  v62.size.height = v18;
  CGRectDivide(v62, &slice, &remainder, v30, CGRectMaxYEdge);
  objc_msgSend(v28, "sizeToFit");
  UIRectGetCenter();
  objc_msgSend(v28, "setCenter:");
  -[SBFloatyFolderView _frameForScalingView](self, "_frameForScalingView");
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  rect = v37;
  -[SBFloatyFolderView safeAreaInsets](self, "safeAreaInsets");
  v40 = v54 + v39;
  v42 = v53 + v41;
  v44 = v55 - (v39 + v43);
  memset(&v59, 0, sizeof(v59));
  v46 = v56 - (v41 + v45);
  memset(&v58, 0, sizeof(v58));
  v63.origin.x = v32;
  v63.origin.y = v34;
  v63.size.width = v36;
  v63.size.height = v38;
  MinY = CGRectGetMinY(v63);
  v64.origin.x = v40;
  v64.origin.y = v42;
  v64.size.width = v44;
  v64.size.height = v46;
  v48 = MinY - CGRectGetMinY(v64);
  v65.origin.x = v40;
  v65.origin.y = v42;
  v65.size.width = v44;
  v65.size.height = v46;
  CGRectDivide(v65, &v59, &v58, v48, CGRectMinYEdge);
  -[SBFolderView _titleTextField](self, "_titleTextField");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "sizeThatFits:", v59.size.width, v59.size.height);
  v51 = v50;
  objc_msgSend(v3, "titleHorizontalInset");
  v66.origin.x = v32;
  v66.origin.y = v34;
  v66.size.width = v36;
  v66.size.height = rect;
  CGRectGetWidth(v66);
  if (v51 > CGRectGetHeight(v59))
    CGRectGetHeight(v59);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  BSRectWithSize();
  objc_msgSend(v49, "setBounds:", v57);
  UIRectGetCenter();
  objc_msgSend(v49, "setCenter:");

}

- (CGRect)_pageBackgroundFrameForPageRect:(CGRect)a3
{
  void *v4;
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  -[SBFloatyFolderView floatyFolderConfiguration](self, "floatyFolderConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatyFolderView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");

  objc_msgSend(v4, "contentBackgroundSize");
  UIRectCenteredIntegralRectScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  BSFloatFloorForScale();
  v13 = v12;

  v14 = v7;
  v15 = v13;
  v16 = v9;
  v17 = v11;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)floatyFolderConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  SBHFloatyFolderVisualConfiguration *v6;
  SBHFloatyFolderVisualConfiguration *v7;

  -[SBFolderView listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView iconLocation](self, "iconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "floatyFolderVisualConfiguration");
    v6 = (SBHFloatyFolderVisualConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(SBHFloatyFolderVisualConfiguration);
  }
  v7 = v6;

  return v7;
}

- (CGRect)_frameForScalingView
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[SBFloatyFolderView bounds](self, "bounds");
  -[SBFloatyFolderView _pageBackgroundFrameForPageRect:](self, "_pageBackgroundFrameForPageRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

void __51__SBFloatyFolderView_updateAccessibilityTintColors__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTintEffectColor");

}

- (void)updateAccessibilityTintColors
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView updateAccessibilityTintColors](&v3, sel_updateAccessibilityTintColors);
  -[SBFloatyFolderView enumeratePageBackgroundViewsUsingBlock:](self, "enumeratePageBackgroundViewsUsingBlock:", &__block_literal_global_22_0);
}

- (id)legibilitySettingsForIconListViews
{
  void *v3;
  objc_super v5;

  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[SBFloatyFolderView _frameForScalingView](self, "_frameForScalingView");
    -[SBFolderView accessibilityLegibilitySettingsForRect:tintStyle:](self, "accessibilityLegibilitySettingsForRect:tintStyle:", 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFloatyFolderView;
    -[SBFolderView legibilitySettingsForIconListViews](&v5, sel_legibilitySettingsForIconListViews);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (SBFloatyFolderView)initWithConfiguration:(id)a3
{
  id v4;
  SBFloatyFolderView *v5;
  void *v6;
  char isKindOfClass;
  SBFloatyFolderBackgroundClipView *v8;
  SBFloatyFolderBackgroundClipView *scrollClipView;
  void *v10;
  SBFloatyFolderBackgroundClipView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  UIScribbleInteraction *titleScribbleInteraction;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SBHFolderSettings *folderSettings;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBFloatyFolderView;
  v5 = -[SBFolderView initWithConfiguration:](&v30, sel_initWithConfiguration_, v4);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v5->_backgroundEffect = objc_msgSend(v4, "backgroundEffect");
    v8 = objc_alloc_init(SBFloatyFolderBackgroundClipView);
    scrollClipView = v5->_scrollClipView;
    v5->_scrollClipView = v8;

    -[SBFloatyFolderBackgroundClipView setBackgroundEffect:](v5->_scrollClipView, "setBackgroundEffect:", v5->_backgroundEffect);
    -[SBFloatyFolderBackgroundClipView backgroundView](v5->_scrollClipView, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v5);

    v11 = v5->_scrollClipView;
    -[SBFolderView scrollView](v5, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatyFolderBackgroundClipView addSubview:](v11, "addSubview:", v12);

    -[SBFolderView scalingView](v5, "scalingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5->_scrollClipView);
    -[SBFolderView pageControl](v5, "pageControl");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v14);

    -[SBFolderView _titleTextField](v5, "_titleTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C08]), "initWithDelegate:", v5);
    titleScribbleInteraction = v5->_titleScribbleInteraction;
    v5->_titleScribbleInteraction = (UIScribbleInteraction *)v16;

    objc_msgSend(v15, "addInteraction:", v5->_titleScribbleInteraction);
    -[SBFloatyFolderView addSubview:](v5, "addSubview:", v15);
    -[SBFloatyFolderView floatyFolderConfiguration](v5, "floatyFolderConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pageControlCustomPadding");
    v20 = v19;
    v22 = v21;

    -[SBFolderView pageControl](v5, "pageControl");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v20 > 0.0)
      objc_msgSend(v23, "_setCustomHorizontalPadding:", v20);
    if (v22 > 0.0)
      objc_msgSend(v24, "_setCustomVerticalPadding:", v22);
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "folderSettings");
    v26 = objc_claimAutoreleasedReturnValue();
    folderSettings = v5->_folderSettings;
    v5->_folderSettings = (SBHFolderSettings *)v26;

    -[PTSettings addKeyObserver:](v5->_folderSettings, "addKeyObserver:", v5);
    -[SBFloatyFolderView _configureGesturesIfNecessary](v5, "_configureGesturesIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel_accessibilityReduceTransparencyDidChange_, *MEMORY[0x1E0DC45B8], 0);

  }
  return v5;
}

- (void)_configureGesturesIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapGesture;
  _BOOL4 v5;
  UIPinchGestureRecognizer *pinchGesture;
  UIPinchGestureRecognizer *v7;
  UIPinchGestureRecognizer *v8;
  UIPinchGestureRecognizer *v9;
  UILongPressGestureRecognizer *v10;
  UILongPressGestureRecognizer *longPressGesture;

  if (!self->_tapGesture)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleOutsideTap_);
    tapGesture = self->_tapGesture;
    self->_tapGesture = v3;

    -[UITapGestureRecognizer setDelegate:](self->_tapGesture, "setDelegate:", self);
    -[SBFloatyFolderView addGestureRecognizer:](self, "addGestureRecognizer:", self->_tapGesture);
  }
  v5 = -[SBHFolderSettings pinchToClose](self->_folderSettings, "pinchToClose");
  pinchGesture = self->_pinchGesture;
  if (v5)
  {
    if (!pinchGesture)
    {
      v7 = (UIPinchGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", self, sel__handlePinchGesture_);
      v8 = self->_pinchGesture;
      self->_pinchGesture = v7;

      -[UIPinchGestureRecognizer setDelegate:](self->_pinchGesture, "setDelegate:", self);
      -[SBFloatyFolderView addGestureRecognizer:](self, "addGestureRecognizer:", self->_pinchGesture);
    }
  }
  else if (pinchGesture)
  {
    -[UIPinchGestureRecognizer setDelegate:](pinchGesture, "setDelegate:", 0);
    -[SBFloatyFolderView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_pinchGesture);
    v9 = self->_pinchGesture;
    self->_pinchGesture = 0;

  }
  if (!self->_longPressGesture)
  {
    v10 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPressGesture_);
    longPressGesture = self->_longPressGesture;
    self->_longPressGesture = v10;

    -[UILongPressGestureRecognizer setDelegate:](self->_longPressGesture, "setDelegate:", self);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_longPressGesture, "setMinimumPressDuration:", 0.75);
    -[SBFloatyFolderView addGestureRecognizer:](self, "addGestureRecognizer:", self->_longPressGesture);
  }
}

- (void)fadeContentForMinificationFraction:(double)a3
{
  void *v5;
  double v6;
  id v7;

  -[SBFolderView pageControl](self, "pageControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1.0 - a3;
  objc_msgSend(v5, "setAlpha:", v6);

  -[SBFolderView _titleTextField](self, "_titleTextField");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

}

- (BOOL)_showsTitle
{
  return 1;
}

- (BOOL)_shouldUseScrollableIconViewInteraction
{
  return 1;
}

+ (Class)_scrollViewClass
{
  return (Class)objc_opt_self();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBFloatyFolderView *v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, v7, x, y);
  v8 = (SBFloatyFolderView *)objc_claimAutoreleasedReturnValue();
  if (v8 == self)
  {
    if (objc_msgSend(v7, "type") == 9)
    {
      -[SBFolderView currentIconListView](self, "currentIconListView");
      v8 = (SBFloatyFolderView *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = self;
    }
  }

  return v8;
}

- (void)_didAddIconListView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView _didAddIconListView:](&v4, sel__didAddIconListView_, a3);
  -[SBFolderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)dealloc
{
  objc_super v3;

  -[PTSettings removeKeyObserver:](self->_folderSettings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView dealloc](&v3, sel_dealloc);
}

- (void)setBackgroundAlpha:(double)a3
{
  id v4;

  -[SBFloatyFolderBackgroundClipView backgroundView](self->_scrollClipView, "backgroundView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)setCornerRadius:(double)a3
{
  -[SBFloatyFolderBackgroundClipView setCornerRadius:](self->_scrollClipView, "setCornerRadius:", a3);
}

+ (double)defaultCornerRadius
{
  double result;

  +[SBFolderBackgroundView cornerRadiusToInsetContent](SBFolderBackgroundView, "cornerRadiusToInsetContent");
  return result;
}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatyFolderView floatyFolderConfiguration](self, "floatyFolderConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "continuousCornerRadius");
  v4 = v3;

  return v4;
}

- (CGPoint)visibleFolderRelativeImageCenterForIcon:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v4 = a3;
  -[SBFolderView currentIconListView](self, "currentIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsIcon:", v4))
  {
    objc_msgSend(v5, "centerForIcon:", v4);
    v7 = v6;
    v9 = v8;
    -[SBFolderView scalingView](self, "scalingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:fromView:", v5, v7, v9);
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView setLegibilitySettings:](&v4, sel_setLegibilitySettings_, a3);
  -[SBFloatyFolderView enumeratePageBackgroundViewsUsingBlock:](self, "enumeratePageBackgroundViewsUsingBlock:", &__block_literal_global_31);
}

void __44__SBFloatyFolderView_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTintEffectColor");

}

- (void)setBackgroundEffect:(unint64_t)a3
{
  _QWORD v5[5];

  if (-[SBFloatyFolderView backgroundEffect](self, "backgroundEffect") != a3)
  {
    self->_backgroundEffect = a3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __42__SBFloatyFolderView_setBackgroundEffect___block_invoke;
    v5[3] = &__block_descriptor_40_e46_v24__0__SBFloatyFolderBackgroundClipView_8_B16l;
    v5[4] = a3;
    -[SBFloatyFolderView enumeratePageBackgroundViewsUsingBlock:](self, "enumeratePageBackgroundViewsUsingBlock:", v5);
  }
}

uint64_t __42__SBFloatyFolderView_setBackgroundEffect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBackgroundEffect:", *(_QWORD *)(a1 + 32));
}

- (id)_newPageBackgroundView
{
  SBFloatyFolderBackgroundClipView *v3;
  void *v4;

  v3 = objc_alloc_init(SBFloatyFolderBackgroundClipView);
  -[SBFloatyFolderBackgroundClipView backgroundView](v3, "backgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[SBFloatyFolderBackgroundClipView setBackgroundEffect:](v3, "setBackgroundEffect:", -[SBFloatyFolderView backgroundEffect](self, "backgroundEffect"));
  return v3;
}

- (BOOL)locationCountsAsInsideFolder:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SBFloatyFolderView _frameForScalingView](self, "_frameForScalingView");
  v8 = CGRectInset(v7, -80.0, 0.0);
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v8, v6);
}

- (double)_rubberBandIntervalForOverscroll
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatyFolderView floatyFolderConfiguration](self, "floatyFolderConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rubberBandIntervalForOverscroll");
  v4 = v3;

  return v4;
}

- (void)fadeContentForMagnificationFraction:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  id v8;

  -[SBFloatyFolderBackgroundClipView backgroundView](self->_scrollClipView, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1.0 - a3;
  objc_msgSend(v5, "setAlpha:", v6);

  -[SBFolderView pageControl](self, "pageControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", v6);

  -[SBFolderView _titleTextField](self, "_titleTextField");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v6);

}

- (void)_setScrollViewNeedsToClipCorners:(BOOL)a3
{
  double v4;

  v4 = 0.0;
  if (a3)
    -[SBFloatyFolderView cornerRadius](self, "cornerRadius", 0.0);
  -[SBFloatyFolderBackgroundClipView _setContinuousCornerRadius:](self->_scrollClipView, "_setContinuousCornerRadius:", v4);
}

- (void)_updateScrollingState:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBFloatyFolderView;
  -[SBFolderView _updateScrollingState:](&v5, sel__updateScrollingState_);
  -[SBFolderView _updateScrollingInteractionIsScrolling:](self, "_updateScrollingInteractionIsScrolling:", v3);
  -[SBFloatyFolderView _setScrollViewNeedsToClipCorners:](self, "_setScrollViewNeedsToClipCorners:", v3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFloatyFolderView;
  v4 = a3;
  -[SBFolderView scrollViewDidScroll:](&v5, sel_scrollViewDidScroll_, v4);
  -[SBFolderView _scrollingInteractionScrollViewDidScroll:](self, "_scrollingInteractionScrollViewDidScroll:", v4, v5.receiver, v5.super_class);

}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  CGFloat y;
  double x;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  objc_msgSend(v12, "contentSize");
  v14 = v13;
  objc_msgSend(v12, "bounds");
  v16 = v15;

  if (x >= 0.0)
  {
    v18 = v14 - v16;
    if (x > v18)
    {
      -[SBFloatyFolderView _rubberBandIntervalForOverscroll](self, "_rubberBandIntervalForOverscroll");
      BSUIConstrainValueToIntervalWithRubberBand();
      x = v18 + v19;
    }
  }
  else
  {
    -[SBFloatyFolderView _rubberBandIntervalForOverscroll](self, "_rubberBandIntervalForOverscroll");
    BSUIConstrainValueToIntervalWithRubberBand();
    x = v17;
  }
  v20 = x;
  v21 = y;
  result.y = v21;
  result.x = v20;
  return result;
}

- (void)_handleOutsideTap:(id)a3
{
  double v4;
  double v5;
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

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  -[SBFloatyFolderView _frameForScalingView](self, "_frameForScalingView");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  if (!-[SBFolderView isEditing](self, "isEditing")
    || (v15.origin.x = v7, v15.origin.y = v9, v15.size.width = v11, v15.size.height = v13, v5 >= CGRectGetMinY(v15)))
  {
    -[SBFolderView delegate](self, "delegate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "folderViewShouldClose:withPinchGesture:", self, 0);

  }
}

- (void)_handlePinchGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "state") == 1)
  {
    -[SBFolderView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folderViewShouldClose:withPinchGesture:", self, v5);

  }
}

- (void)_handleLongPressGesture:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    -[SBFolderView delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "folderViewShouldBeginEditing:", self);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFolderView _titleTextField](self, "_titleTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    return !-[SBFolderView isEditing](self, "isEditing");
  else
    return 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_folderSettings == a3)
  {
    if (objc_msgSend(a4, "isEqualToString:", CFSTR("pinchToClose")))
      -[SBFloatyFolderView _configureGesturesIfNecessary](self, "_configureGesturesIfNecessary");
  }
}

- (id)accessibilityTintColorForBackgroundView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFloatyFolderView convertRect:fromView:](self, "convertRect:fromView:", v13, v6, v8, v10, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  return -[SBFolderView accessibilityTintColorForRect:tintStyle:](self, "accessibilityTintColorForRect:tintStyle:", 2, v15, v17, v19, v21);
}

- (BOOL)scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  -[SBFloatyFolderView titleScribbleInteraction](self, "titleScribbleInteraction");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    -[SBFolderView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "folderViewShouldBeginEditing:", self);

  }
  return 1;
}

- (unint64_t)backgroundEffect
{
  return self->_backgroundEffect;
}

- (UIScribbleInteraction)titleScribbleInteraction
{
  return self->_titleScribbleInteraction;
}

- (void)setTitleScribbleInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_titleScribbleInteraction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleScribbleInteraction, 0);
  objc_storeStrong((id *)&self->_folderSettings, 0);
  objc_storeStrong((id *)&self->_longPressGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_scrollClipView, 0);
}

@end
