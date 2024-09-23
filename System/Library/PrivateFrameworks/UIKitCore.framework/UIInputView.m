@implementation UIInputView

+ (void)_setupAppearanceIfNecessary
{
  if ((dyld_program_sdk_at_least() & 1) == 0 && _setupAppearanceIfNecessary_onceToken != -1)
    dispatch_once(&_setupAppearanceIfNecessary_onceToken, &__block_literal_global_311);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.size.height;
  width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)UIInputView;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y);
  -[UIInputView _updateWithSize:](self, "_updateWithSize:", width, height);
}

- (UIInputView)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle
{
  UIInputView *v5;
  UIInputView *v6;
  _UIInputViewContent *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  _UIInputViewContent *leftContentView;
  _UIInputViewContent *v14;
  _UIInputViewContent *rightContentView;
  UIInputView *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UIInputView;
  v5 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_disableSplitSupport = -[UIInputView conformsToProtocol:](v5, "conformsToProtocol:", &unk_1EDED9CB8) ^ 1;
    v6->_style = inputViewStyle;
    objc_msgSend((id)objc_opt_class(), "_setupAppearanceIfNecessary");
    v6->_contentRatio = 0.5;
    v7 = [_UIInputViewContent alloc];
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = -[_UIInputViewContent initWithFrame:inputView:](v7, "initWithFrame:inputView:", v6, *MEMORY[0x1E0C9D648], v9, v10, v11);
    leftContentView = v6->_leftContentView;
    v6->_leftContentView = (_UIInputViewContent *)v12;

    v14 = -[_UIInputViewContent initWithFrame:inputView:]([_UIInputViewContent alloc], "initWithFrame:inputView:", v6, v8, v9, v10, v11);
    rightContentView = v6->_rightContentView;
    v6->_rightContentView = v14;

    -[UIView setAutoresizingMask:](v6->_rightContentView, "setAutoresizingMask:", 1);
    -[_UIInputViewContent set_unclippableCorners:](v6->_leftContentView, "set_unclippableCorners:", 5);
    -[_UIInputViewContent set_unclippableCorners:](v6->_rightContentView, "set_unclippableCorners:", 10);
    *(_OWORD *)&v6->_backgroundEdgeInsets.top = 0u;
    *(_OWORD *)&v6->_backgroundEdgeInsets.bottom = 0u;
    -[UIView addSubview:](v6, "addSubview:", v6->_leftContentView);
    -[UIView addSubview:](v6, "addSubview:", v6->_rightContentView);
    -[UIInputView _setLeftOffset:gapWidth:](v6, "_setLeftOffset:gapWidth:", 0.0, 0.0);
    v16 = v6;
  }

  return v6;
}

- (double)contentRatio
{
  return self->_contentRatio;
}

- (void)_updateWithSize:(CGSize)a3
{
  if (self->_gapWidth == 0.0)
    -[UIInputView _setLeftOffset:gapWidth:](self, "_setLeftOffset:gapWidth:", 0.0, 0.0);
}

- (void)_updateClipCorners
{
  double gapWidth;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[_UIInputViewContent _updateCornerClipping](self->_leftContentView, "_updateCornerClipping");
  -[_UIInputViewContent _updateCornerClipping](self->_rightContentView, "_updateCornerClipping");
  gapWidth = self->_gapWidth;
  -[UIView _inheritedRenderConfig](self, "_inheritedRenderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "lightKeyboard");

  if (gapWidth <= 0.0)
  {
    if (v5)
    {
      -[UIInputView _toolbarBorderedBackground](self, "_toolbarBorderedBackground");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIInputViewContent _setToolbarBackgroundViewWithImage:](self->_leftContentView, "_setToolbarBackgroundViewWithImage:", v7);
      -[_UIInputViewContent _setToolbarBackgroundViewWithImage:](self->_rightContentView, "_setToolbarBackgroundViewWithImage:", v7);
      goto LABEL_6;
    }
  }
  else if (v5)
  {
    -[UIInputView _splitBorderedBackgroundWithCorners:](self, "_splitBorderedBackgroundWithCorners:", 2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIInputViewContent _setToolbarBackgroundViewWithImage:](self->_leftContentView, "_setToolbarBackgroundViewWithImage:", v7);
    -[UIInputView _splitBorderedBackgroundWithCorners:](self, "_splitBorderedBackgroundWithCorners:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIInputViewContent _setToolbarBackgroundViewWithImage:](self->_rightContentView, "_setToolbarBackgroundViewWithImage:", v6);

LABEL_6:
    return;
  }
  -[_UIInputViewContent _setToolbarBackgroundViewWithImage:](self->_leftContentView, "_setToolbarBackgroundViewWithImage:", 0);
  -[_UIInputViewContent _setToolbarBackgroundViewWithImage:](self->_rightContentView, "_setToolbarBackgroundViewWithImage:", 0);
}

- (id)_toolbarBorderedBackground
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _UIBackdropViewSettingsUltraLight *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  CGRect v28;

  -[UIView frame](self, "frame");
  if (CGRectIsEmpty(v28))
  {
    v3 = 0;
  }
  else
  {
    if (qword_1ECD7B1D8 != -1)
      dispatch_once(&qword_1ECD7B1D8, &__block_literal_global_120_0);
    v4 = (void *)qword_1ECD7B1D0;
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[UIView frame](self, "frame");
    objc_msgSend(v5, "numberWithDouble:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[UIView frame](self, "frame");
      v9 = v8;
      v10 = 1.0 / UIKBScale();
      +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", 0.0, 0.0, 1.0, v9, 0.0, v10 + 0.0, 1.0, v9 - v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[_UIBackdropViewSettings initWithDefaultValues]([_UIBackdropViewSettingsUltraLight alloc], "initWithDefaultValues");
      -[_UIBackdropViewSettings grayscaleTintLevel](v13, "grayscaleTintLevel");
      v15 = v14;
      -[_UIBackdropViewSettings grayscaleTintAlpha](v13, "grayscaleTintAlpha");
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBColorGradient gradientWithUIColor:](UIKBColorGradient, "gradientWithUIColor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundGradient:", v18);

      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha30"), 1, -v10, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addRenderEffect:", v19);

      v20 = UIKBScale();
      +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 7, UIKeyboardGetCurrentIdiom(), 1.0, v9, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "renderBackgroundTraits:", v12);
      objc_msgSend(v21, "renderedImage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "resizableImageWithCapInsets:", 0.0, 0.0, 0.0, 0.0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)qword_1ECD7B1D0;
      v24 = (void *)MEMORY[0x1E0CB37E8];
      -[UIView frame](self, "frame");
      objc_msgSend(v24, "numberWithDouble:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v3, v26);

    }
  }
  return v3;
}

- (void)_setLeftOffset:(double)a3 gapWidth:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double height;
  double v13;
  double MaxX;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  self->_gapWidth = a4;
  self->_leftOffset = a3;
  if (!self->_disableSplitSupport)
  {
    if (self->_gapWidth == 0.0)
    {
      -[UIInputView contentRatio](self, "contentRatio");
      v7 = v6;
      -[UIView frame](self, "frame");
      v9 = ceil(v7 * v8);
      -[UIView frame](self, "frame");
      v11 = floor((1.0 - v7) * v10);
      -[UIView frame](self, "frame");
      height = v29.size.height;
      v13 = 0.0;
      v29.origin.x = 0.0;
      v29.origin.y = 0.0;
      v29.size.width = v9;
      MaxX = CGRectGetMaxX(v29);
      v15 = height;
      v16 = 0.0;
    }
    else
    {
      -[UIView frame](self, "frame");
      v19 = v18 - a3 - a4;
      -[UIInputView leftContentViewSize](self, "leftContentViewSize");
      v15 = v20;
      -[UIInputView rightContentViewSize](self, "rightContentViewSize");
      height = v21;
      if (v15 - v21 > 0.0)
        v22 = v15 - v21;
      else
        v22 = 0.0;
      if (v15 - v21 < 0.0)
        v13 = 0.0;
      else
        v13 = v22;
      if (v15 - v21 < 0.0)
        v16 = -(v15 - v21);
      else
        v16 = 0.0;
      v23 = 1.0 / UIKBScale();
      v9 = a3 - v23;
      -[UIView bounds](self, "bounds");
      MaxX = v23 + v24 - v19;
      v11 = v19 - v23;
    }
    -[UIView setFrame:](self->_leftContentView, "setFrame:", 0.0, v16, v9, v15);
    -[UIView setFrame:](self->_rightContentView, "setFrame:", MaxX, v13, v11, height);
    -[UIInputView _updateClipCorners](self, "_updateClipCorners");
    v30.origin.x = 0.0;
    v30.origin.y = v16;
    v30.size.width = v9;
    v30.size.height = v15;
    v25 = CGRectGetHeight(v30);
    v31.origin.x = MaxX;
    v31.origin.y = v13;
    v31.size.width = v11;
    v31.size.height = height;
    v26 = CGRectGetHeight(v31);
    if (v25 >= v26)
      v27 = v25;
    else
      v27 = v26;
    -[UIView frame](self, "frame");
    if (v27 != v28)
    {
      -[UIView frame](self, "frame");
      -[UIInputView setFrame:](self, "setFrame:");
    }
  }
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;

  if (self->_gapWidth == 0.0)
    return 0;
  v5 = a3;
  -[UIView superview](self, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_clipCornersOfView:", v5);

  return v7;
}

- (double)_additionalClipHeight
{
  return 0.0;
}

- (UIInputView)initWithFrame:(CGRect)a3
{
  return -[UIInputView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIInputView)initWithCoder:(NSCoder *)coder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIInputView;
  return -[UIView initWithCoder:](&v4, sel_initWithCoder_, coder);
}

void __42__UIInputView__setupAppearanceIfNecessary__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  _UIBackdropViewSettingsUltraLight *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v8[0] = +[UIPeripheralHost hostViewClass](UIPeripheralHost, "hostViewClass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceMatchingProperties:whenContainedInInstancesOfClasses:](UIPickerView, "appearanceMatchingProperties:whenContainedInInstancesOfClasses:", &unk_1E1A9B388, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIView appearanceMatchingProperties:whenContainedInInstancesOfClasses:](UIDatePicker, "appearanceMatchingProperties:whenContainedInInstancesOfClasses:", &unk_1E1A9B388, v0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[_UIBackdropViewSettings initWithDefaultValues]([_UIBackdropViewSettingsUltraLight alloc], "initWithDefaultValues");
  -[_UIBackdropViewSettings grayscaleTintLevel](v3, "grayscaleTintLevel");
  v5 = v4;
  -[_UIBackdropViewSettings grayscaleTintAlpha](v3, "grayscaleTintAlpha");
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v7);
  objc_msgSend(v2, "setBackgroundColor:", v7);

}

- (void)setAllowsSelfSizing:(BOOL)allowsSelfSizing
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = self->_allowsSelfSizing;
  self->_allowsSelfSizing = allowsSelfSizing;
  if (v3 != allowsSelfSizing)
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelfSizingChanged:", 1);
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didChangeKeyplaneWithContext:", v6);

  }
}

- (void)setAssertSizingWithPredictionBar:(BOOL)a3
{
  _BOOL4 assertSizingWithPredictionBar;
  void *v5;
  id v6;

  assertSizingWithPredictionBar = self->_assertSizingWithPredictionBar;
  self->_assertSizingWithPredictionBar = a3;
  if (assertSizingWithPredictionBar != a3)
  {
    +[UIKBKeyplaneChangeContext keyplaneChangeContext](UIKBKeyplaneChangeContext, "keyplaneChangeContext");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSelfSizingChanged:", 1);
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_didChangeKeyplaneWithContext:", v6);

  }
}

- (id)tintColor
{
  if (-[UIView _lightStyleRenderConfig](self, "_lightStyleRenderConfig"))
    +[UIColor whiteColor](UIColor, "whiteColor");
  else
    +[UIColor blackColor](UIColor, "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_suppressBackgroundStyling
{
  return self->_suppressBackgroundStyling;
}

- (void)_setSuppressBackgroundStyling:(BOOL)a3
{
  self->_suppressBackgroundStyling = a3;
}

- (BOOL)_disableSplitSupport
{
  return self->_disableSplitSupport;
}

- (void)_setDisableSplitSupport:(BOOL)a3
{
  self->_disableSplitSupport = a3;
}

- (void)_setRenderConfig:(id)a3
{
  UIKBRenderConfig *renderConfig;
  _BOOL4 v6;
  int v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v11 = a3;
  renderConfig = self->_renderConfig;
  if (renderConfig)
  {
    v6 = -[UIKBRenderConfig lightKeyboard](renderConfig, "lightKeyboard");
    v7 = v6 ^ objc_msgSend(v11, "lightKeyboard");
  }
  else
  {
    v7 = 1;
  }
  objc_storeStrong((id *)&self->_renderConfig, a3);
  -[UIView _setRenderConfig:](self->_leftContentView, "_setRenderConfig:", v11);
  -[UIView _setRenderConfig:](self->_rightContentView, "_setRenderConfig:", v11);
  if (v7)
    -[UIInputView _updateClipCorners](self, "_updateClipCorners");
  -[UIView _rootInputWindowController](self, "_rootInputWindowController", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_inputAssistantView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[UIView isDescendantOfView:](self, "isDescendantOfView:", v9);

  if (!v10)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __32__UIInputView__setRenderConfig___block_invoke;
    v13[3] = &unk_1E16B1B28;
    v13[4] = self;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v13);
  }

}

void __32__UIInputView__setRenderConfig___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_screen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didChangeFromIdiom:onScreen:traverseHierarchy:", objc_msgSend(v2, "_userInterfaceIdiom"), 0, 1);

}

- (void)setInputViewStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  unsigned __int8 v8;
  BOOL v9;
  _UIInputViewContent *leftContentView;
  _UIInputViewContent *rightContentView;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!self->_disableSplitSupport && (leftContentView = self->_leftContentView) != 0 && self->_rightContentView)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", self->_leftContentView, x, y);
    if (-[UIView pointInside:withEvent:](leftContentView, "pointInside:withEvent:", v7))
    {
      v9 = 1;
      goto LABEL_4;
    }
    rightContentView = self->_rightContentView;
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", rightContentView, x, y);
    v8 = -[UIView pointInside:withEvent:](rightContentView, "pointInside:withEvent:", v7);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIInputView;
    v8 = -[UIView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  }
  v9 = v8;
LABEL_4:

  return v9;
}

- (BOOL)_isToolbars
{
  double v3;
  _BOOL4 v4;
  double v5;

  -[UIInputView leftContentViewSize](self, "leftContentViewSize");
  if (v3 == 0.0 || (v4 = -[_UIInputViewContent _isToolbar](self->_leftContentView, "_isToolbar")))
  {
    -[UIInputView rightContentViewSize](self, "rightContentViewSize");
    LOBYTE(v4) = v5 == 0.0 || -[_UIInputViewContent _isToolbar](self->_rightContentView, "_isToolbar");
  }
  return v4;
}

- (BOOL)_isSplit
{
  return self->_gapWidth > 0.0;
}

- (void)_setNeedsContentSizeUpdate
{
  -[UIInputView _setLeftOffset:gapWidth:](self, "_setLeftOffset:gapWidth:", self->_leftOffset, self->_gapWidth);
}

- (BOOL)_supportsSplit
{
  double v3;
  double v5;

  -[UIInputView leftContentViewSize](self, "leftContentViewSize");
  if (v3 != 0.0)
    return 1;
  -[UIInputView rightContentViewSize](self, "rightContentViewSize");
  return v5 != 0.0;
}

- (void)_setProgress:(double)a3 boundedBy:(double)a4
{
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  if (a3 >= 0.0)
  {
    v5 = a3;
    -[UIInputView contentRatio](self, "contentRatio");
    self->_transitionRatio = v7;
    if (a4 <= 0.0)
    {
      v11 = v7;
    }
    else
    {
      if (1.0 / (1.0 - a4) * v5 - 1.0 / (1.0 - a4) * a4 >= 0.0)
        v8 = 1.0 / (1.0 - a4) * v5 - 1.0 / (1.0 - a4) * a4;
      else
        v8 = 0.0;
      if (v5 < a4)
        v9 = 1.0 / a4 * v5;
      else
        v9 = 1.0;
      -[UIInputView contentRatio](self, "contentRatio");
      v11 = (1.0 - v9) * (v10 + -0.5) + 0.5;
      self->_transitionRatio = v11;
      v5 = v8;
    }
    v12 = round(v5 * self->_transitionGap);
    -[UIView frame](self, "frame");
    -[UIInputView _setLeftOffset:gapWidth:](self, "_setLeftOffset:gapWidth:", round(self->_transitionLeftOffset + (1.0 - v5) * (ceil(v11 * v13) - self->_transitionLeftOffset)), v12);
  }
}

- (BOOL)_isTransitioning
{
  return self->_isTransitioning;
}

- (void)_beginSplitTransitionIfNeeded:(double)a3 gapWidth:(double)a4
{
  if (!-[UIInputView _isTransitioning](self, "_isTransitioning"))
  {
    self->_transitionGap = a4;
    self->_transitionLeftOffset = a3;
    self->_isTransitioning = 1;
    -[UIInputView willBeginSplitTransition](self, "willBeginSplitTransition");
  }
}

- (void)_endSplitTransitionIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  double transitionLeftOffset;
  double transitionGap;

  v3 = a3;
  if (-[UIInputView _isTransitioning](self, "_isTransitioning"))
  {
    self->_isTransitioning = 0;
    if (v3)
    {
      -[UIInputView _setLeftOffset:gapWidth:](self, "_setLeftOffset:gapWidth:", self->_transitionLeftOffset, self->_transitionGap);
      -[UIInputView didEndSplitTransition](self, "didEndSplitTransition");
      transitionLeftOffset = self->_transitionLeftOffset;
      transitionGap = self->_transitionGap;
    }
    else
    {
      -[UIInputView _setLeftOffset:gapWidth:](self, "_setLeftOffset:gapWidth:", 0.0, 0.0);
      -[UIInputView didEndSplitTransition](self, "didEndSplitTransition");
      transitionLeftOffset = 0.0;
      transitionGap = 0.0;
    }
    -[UIInputView _setLeftOffset:gapWidth:](self, "_setLeftOffset:gapWidth:", transitionLeftOffset, transitionGap);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  objc_super v6;

  height = a3.size.height;
  width = a3.size.width;
  v6.receiver = self;
  v6.super_class = (Class)UIInputView;
  -[UIView setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y);
  -[UIInputView _updateWithSize:](self, "_updateWithSize:", width, height);
}

- (id)_splitBorderedBackgroundWithCorners:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _UIBackdropViewSettingsUltraLight *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  CGRect v42;

  -[UIView frame](self, "frame");
  if (CGRectIsEmpty(v42))
  {
    v5 = 0;
  }
  else
  {
    if (qword_1ECD7B1C8 != -1)
      dispatch_once(&qword_1ECD7B1C8, &__block_literal_global_112_0);
    v6 = (void *)_MergedGlobals_7_7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v5 = v8;
    }
    else
    {
      +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferencesActions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "rivenSizeFactor:", 10.0);
      v12 = v11;

      v13 = v12 + v12;
      -[UIView frame](self, "frame");
      v15 = v14;
      v16 = UIKBScale();
      if (a3 == 1)
        v17 = 2;
      else
        v17 = 8 * (a3 == 2);
      v18 = 1.0 / v16;
      v19 = UIRectInsetEdges(v17 | 1u, 0.0, 0.0, v12 + v12, v15, 1.0 / v16);
      +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", 0.0, 0.0, v12 + v12, v15, v19, v20, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRoundRectRadius:", v12);
      objc_msgSend(v23, "setRoundRectCorners:", a3);
      +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[_UIBackdropViewSettings initWithDefaultValues]([_UIBackdropViewSettingsUltraLight alloc], "initWithDefaultValues");
      -[_UIBackdropViewSettings grayscaleTintLevel](v25, "grayscaleTintLevel");
      v27 = v26;
      -[_UIBackdropViewSettings grayscaleTintAlpha](v25, "grayscaleTintAlpha");
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIKBColorGradient gradientWithUIColor:](UIKBColorGradient, "gradientWithUIColor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setBackgroundGradient:", v30);

      +[UIKBEdgeEffect effectWithColor:edges:inset:weight:](UIKBEdgeEffect, "effectWithColor:edges:inset:weight:", CFSTR("UIKBColorBlack_Alpha30"), v17 | 1, -v18, v18);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addRenderEffect:", v31);

      v32 = UIKBScale();
      +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 7, UIKeyboardGetCurrentIdiom(), v13, v15, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "renderBackgroundTraits:", v24);
      objc_msgSend(v33, "renderedImage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v35 = v34;
        if ((v17 & 2) != 0)
          v36 = v13;
        else
          v36 = 0.0;
        if (v17 >= 8)
          v37 = v13;
        else
          v37 = 0.0;
        objc_msgSend(v34, "resizableImageWithCapInsets:", 0.0, v36, 0.0, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = (void *)_MergedGlobals_7_7;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setObject:forKey:", v38, v40);

      }
      else
      {
        v38 = 0;
      }
      v5 = v38;

    }
  }
  return v5;
}

void __51__UIInputView__splitBorderedBackgroundWithCorners___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_MergedGlobals_7_7;
  _MergedGlobals_7_7 = (uint64_t)v0;

}

void __41__UIInputView__toolbarBorderedBackground__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)qword_1ECD7B1D0;
  qword_1ECD7B1D0 = (uint64_t)v0;

}

- (CGSize)_defaultSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UIView frame](self, "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGSize)leftContentViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_leftContentSize.width;
  height = self->_leftContentSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    -[_UIInputViewContent _contentSize](self->_leftContentView, "_contentSize");
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)rightContentViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_rightContentSize.width;
  height = self->_rightContentSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    -[_UIInputViewContent _contentSize](self->_rightContentView, "_contentSize");
  result.height = height;
  result.width = width;
  return result;
}

- (UIInputViewStyle)inputViewStyle
{
  return self->_style;
}

- (BOOL)allowsSelfSizing
{
  return self->_allowsSelfSizing;
}

- (BOOL)assertSizingWithPredictionBar
{
  return self->_assertSizingWithPredictionBar;
}

- (UIView)leftContentView
{
  return &self->_leftContentView->super;
}

- (UIView)rightContentView
{
  return &self->_rightContentView->super;
}

- (void)setContentRatio:(double)a3
{
  self->_contentRatio = a3;
}

- (void)setLeftContentViewSize:(CGSize)a3
{
  self->_leftContentSize = a3;
}

- (void)setRightContentViewSize:(CGSize)a3
{
  self->_rightContentSize = a3;
}

- (UIImage)_mergedImage
{
  return self->_mergedImage;
}

- (void)set_mergedImage:(id)a3
{
  objc_storeStrong((id *)&self->_mergedImage, a3);
}

- (UIImage)_splitImage
{
  return self->_splitImage;
}

- (void)set_splitImage:(id)a3
{
  objc_storeStrong((id *)&self->_splitImage, a3);
}

- (NSMutableDictionary)_mergedSliceMap
{
  return self->_mergedSliceMap;
}

- (void)set_mergedSliceMap:(id)a3
{
  objc_storeStrong((id *)&self->_mergedSliceMap, a3);
}

- (NSMutableDictionary)_splitSliceMap
{
  return self->_splitSliceMap;
}

- (void)set_splitSliceMap:(id)a3
{
  objc_storeStrong((id *)&self->_splitSliceMap, a3);
}

- (UIEdgeInsets)backgroundEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_backgroundEdgeInsets.top;
  left = self->_backgroundEdgeInsets.left;
  bottom = self->_backgroundEdgeInsets.bottom;
  right = self->_backgroundEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBackgroundEdgeInsets:(UIEdgeInsets)a3
{
  self->_backgroundEdgeInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionLayer, 0);
  objc_storeStrong((id *)&self->_visibleLayers, 0);
  objc_storeStrong((id *)&self->_splitSliceMap, 0);
  objc_storeStrong((id *)&self->_mergedSliceMap, 0);
  objc_storeStrong((id *)&self->_splitImage, 0);
  objc_storeStrong((id *)&self->_mergedImage, 0);
  objc_storeStrong((id *)&self->_rightContentView, 0);
  objc_storeStrong((id *)&self->_leftContentView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

@end
