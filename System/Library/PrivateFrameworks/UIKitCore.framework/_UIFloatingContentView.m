@implementation _UIFloatingContentView

- (_UIFloatingContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UIFloatingContentView *v7;
  _UIFloatingContentTransformView *v8;
  _UIFloatingContentTransformView *transformView;
  _UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView *v10;
  _UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView *containerView;
  _UIFloatingContentCornerRadiusAnimatingView *v12;
  _UIFloatingContentCornerRadiusAnimatingView *highlightView;
  _UIFloatingContentView *v14;
  void *v15;
  _QWORD v17[4];
  _UIFloatingContentView *v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v19.receiver = self;
  v19.super_class = (Class)_UIFloatingContentView;
  v7 = -[UIView initWithFrame:](&v19, sel_initWithFrame_);
  if (v7)
  {
    v7->_backgroundColorsByState = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    -[UIView setOpaque:](v7, "setOpaque:", 0);
    v8 = -[UIView initWithFrame:]([_UIFloatingContentTransformView alloc], "initWithFrame:", x, y, width, height);
    transformView = v7->_transformView;
    v7->_transformView = v8;

    -[UIView setClipsToBounds:](v7->_transformView, "setClipsToBounds:", 0);
    -[UIView addSubview:](v7, "addSubview:", v7->_transformView);
    v10 = -[UIView initWithFrame:]([_UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView alloc], "initWithFrame:", x, y, width, height);
    containerView = v7->_containerView;
    v7->_containerView = v10;

    -[UIView setOpaque:](v7->_containerView, "setOpaque:", 0);
    -[UIView setBackgroundColor:](v7->_containerView, "setBackgroundColor:", 0);
    -[UIView addSubview:](v7->_transformView, "addSubview:", v7->_containerView);
    v12 = -[UIView initWithFrame:]([_UIFloatingContentCornerRadiusAnimatingView alloc], "initWithFrame:", x, y, width, height);
    highlightView = v7->_highlightView;
    v7->_highlightView = v12;

    -[UIView addSubview:](v7->_containerView, "addSubview:", v7->_highlightView);
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](v7, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](v7->_transformView, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](v7->_containerView, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    -[UIView setEdgesPreservingSuperviewLayoutMargins:](v7->_highlightView, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40___UIFloatingContentView_initWithFrame___block_invoke;
    v17[3] = &unk_1E16B1B28;
    v14 = v7;
    v18 = v14;
    +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v17);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__updateHighContrastFocusIndicatorView, CFSTR("UIAccessibilityHighContrastFocusIndicatorChangedNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  __CFDictionary *backgroundColorsByState;
  void *v4;
  objc_super v5;

  backgroundColorsByState = self->_backgroundColorsByState;
  if (backgroundColorsByState)
    CFRelease(backgroundColorsByState);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("UIAccessibilityHighContrastFocusIndicatorChangedNotification"), 0);

  v5.receiver = self;
  v5.super_class = (Class)_UIFloatingContentView;
  -[UIView dealloc](&v5, sel_dealloc);
}

- (_UIFloatingContentViewDelegate)floatingContentDelegate
{
  return (_UIFloatingContentViewDelegate *)objc_loadWeakRetained((id *)&self->_floatingContentViewDelegate);
}

- (void)setFloatingContentDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_floatingContentViewDelegate, a3);
}

- (BOOL)_applyKeyPathsAndRelativeValues:(id)a3 forMotionEffect:(id)a4
{
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  void *v9;
  CGFloat v10;

  v5 = a3;
  if (-[_UIFloatingContentView _shouldAppearToFloatForPrimaryState:](self, "_shouldAppearToFloatForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState"))))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("focusDirectionX"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    objc_msgSend(v5, "objectForKey:", CFSTR("focusDirectionY"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    self->_focusDirection.x = v8;
    self->_focusDirection.y = v10;

    -[_UIFloatingContentView _updateTransformForPrimaryState:](self, "_updateTransformForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState")));
  }

  return 1;
}

- (void)setContentMotion:(id)a3
{
  _UIFloatingMotionConfiguration *v5;
  _UIFloatingMotionConfiguration *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  UIInterpolatingMotionEffect *v11;
  UIInterpolatingMotionEffect *v12;
  UIMotionEffectGroup *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (_UIFloatingMotionConfiguration *)a3;
  v6 = v5;
  if (self->_contentMotion != v5 && !-[_UIFloatingMotionConfiguration isEqual:](v5, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_contentMotion, a3);
    -[_UIFloatingMotionConfiguration rotation](v6, "rotation");
    self->_contentRotation.x = v7;
    self->_contentRotation.y = v8;
    -[_UIFloatingMotionConfiguration translation](v6, "translation");
    self->_contentTranslation.x = v9;
    self->_contentTranslation.y = v10;
    -[NSMutableArray removeAllObjects](self->_contentMotionEffects, "removeAllObjects");
    v11 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("focusDirectionX"), 0);
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v11, "setMinimumRelativeValue:", &unk_1E1A95600);
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v11, "setMaximumRelativeValue:", &unk_1E1A95610);
    v12 = -[UIInterpolatingMotionEffect initWithKeyPath:type:]([UIInterpolatingMotionEffect alloc], "initWithKeyPath:type:", CFSTR("focusDirectionY"), 1);
    -[UIInterpolatingMotionEffect setMinimumRelativeValue:](v12, "setMinimumRelativeValue:", &unk_1E1A95600);
    -[UIInterpolatingMotionEffect setMaximumRelativeValue:](v12, "setMaximumRelativeValue:", &unk_1E1A95610);
    v13 = objc_alloc_init(UIMotionEffectGroup);
    v15[0] = v11;
    v15[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIMotionEffectGroup setMotionEffects:](v13, "setMotionEffects:", v14);

    -[_UIFloatingContentView addContentMotionEffect:](self, "addContentMotionEffect:", v13);
  }

}

- (void)setContentMotionRotation:(CGPoint)a3 translation:(CGPoint)a4
{
  id v5;

  v5 = -[_UIFloatingMotionConfiguration _initWithTranslation:rotation:]([_UIFloatingMotionConfiguration alloc], "_initWithTranslation:rotation:", a4.x, a4.y, a3.x, a3.y);
  -[_UIFloatingContentView setContentMotion:](self, "setContentMotion:", v5);

}

- (void)addContentMotionEffect:(id)a3
{
  id v4;
  NSMutableArray *contentMotionEffects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contentMotionEffects = self->_contentMotionEffects;
  v8 = v4;
  if (!contentMotionEffects)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_contentMotionEffects;
    self->_contentMotionEffects = v6;

    v4 = v8;
    contentMotionEffects = self->_contentMotionEffects;
  }
  -[NSMutableArray addObject:](contentMotionEffects, "addObject:", v4);

}

- (void)removeContentMotionEffect:(id)a3
{
  -[NSMutableArray removeObject:](self->_contentMotionEffects, "removeObject:", a3);
}

- (void)_installContentMotionEffects
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_contentMotionEffects;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[UIView motionEffects](self, "motionEffects", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) == 0)
          -[UIView addMotionEffect:](self, "addMotionEffect:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_uninstallContentMotionEffects
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_contentMotionEffects;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[UIView motionEffects](self, "motionEffects", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if (v10)
          -[UIView removeMotionEffect:](self, "removeMotionEffect:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (unint64_t)_primaryStateForState:(unint64_t)a3
{
  return +[UIControl _primaryStateForState:](UIControl, "_primaryStateForState:", a3);
}

- (BOOL)_shouldApplyCornerRadiusForPrimaryState:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 || self->_roundContentWhenDeselected;
}

- (BOOL)_shouldAppearToFloatForPrimaryState:(unint64_t)a3
{
  return a3 == 8 || a3 == 1;
}

- (UIView)contentView
{
  UIView *contentView;
  UIView *v4;
  UIView *v5;
  UIView *v6;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = [UIView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_contentView;
    self->_contentView = v5;

    -[UIView setEdgesPreservingSuperviewLayoutMargins:](self->_contentView, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    -[UIView addSubview:](self->_containerView, "addSubview:", self->_contentView);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
    contentView = self->_contentView;
  }
  return contentView;
}

- (UIView)visualEffectContainerView
{
  _UIFloatingContentCornerRadiusAnimatingView *visualEffectContainerView;
  _UIFloatingContentCornerRadiusAnimatingView *v4;
  _UIFloatingContentCornerRadiusAnimatingView *v5;
  _UIFloatingContentCornerRadiusAnimatingView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  visualEffectContainerView = self->_visualEffectContainerView;
  if (!visualEffectContainerView)
  {
    v4 = [_UIFloatingContentCornerRadiusAnimatingView alloc];
    -[UIView bounds](self, "bounds");
    v5 = -[UIView initWithFrame:](v4, "initWithFrame:");
    v6 = self->_visualEffectContainerView;
    self->_visualEffectContainerView = v5;

    -[UIView setEdgesPreservingSuperviewLayoutMargins:](self->_visualEffectContainerView, "setEdgesPreservingSuperviewLayoutMargins:", 15);
    -[UIView setOpaque:](self->_visualEffectContainerView, "setOpaque:", 0);
    -[UIView setBackgroundColor:](self->_visualEffectContainerView, "setBackgroundColor:", 0);
    -[UIView layer](self->_visualEffectContainerView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", self->_cornerCurve);

    -[UIView layer](self->_visualEffectContainerView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", self->_cornerRadius);

    -[UIView layer](self->_visualEffectContainerView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

    -[UIView layer](self->_visualEffectContainerView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupBlending:", 0);

    -[UIView setClipsToBounds:](self->_visualEffectContainerView, "setClipsToBounds:", 0);
    -[UIView setAlpha:](self->_visualEffectContainerView, "setAlpha:", 1.0);
    -[UIView insertSubview:below:](self->_transformView, "insertSubview:below:", self->_visualEffectContainerView, self->_containerView);
    visualEffectContainerView = self->_visualEffectContainerView;
  }
  return (UIView *)visualEffectContainerView;
}

- (UIView)highlightView
{
  return (UIView *)self->_highlightView;
}

- (UIView)transformView
{
  return (UIView *)self->_transformView;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_UIFloatingContentView _updateCornerRadiusLayers](self, "_updateCornerRadiusLayers");
  }
}

- (void)setCornerCurve:(id)a3
{
  if (self->_cornerCurve != a3)
  {
    self->_cornerCurve = (NSString *)a3;
    -[_UIFloatingContentView _updateCornerRadiusLayers](self, "_updateCornerRadiusLayers");
  }
}

- (BOOL)isContinuousCornerEnabled
{
  return self->_cornerCurve == (NSString *)*MEMORY[0x1E0CD2A68];
}

- (void)setContinuousCornerEnabled:(BOOL)a3
{
  _QWORD *v3;

  v3 = (_QWORD *)MEMORY[0x1E0CD2A68];
  if (!a3)
    v3 = (_QWORD *)MEMORY[0x1E0CD2A60];
  -[_UIFloatingContentView setCornerCurve:](self, "setCornerCurve:", *v3);
}

- (void)_updateCornerRadiusLayers
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  double cornerRadius;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = -[_UIFloatingContentView _shouldApplyCornerRadiusForPrimaryState:](self, "_shouldApplyCornerRadiusForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", self->_controlState));
  -[UIView layer](self->_containerView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerCurve:", self->_cornerCurve);

  -[UIView layer](self->_containerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  cornerRadius = 0.0;
  if (v3)
    cornerRadius = self->_cornerRadius;
  objc_msgSend(v5, "setCornerRadius:", cornerRadius);

  -[UIView layer](self->_highlightView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCornerCurve:", self->_cornerCurve);

  -[UIView layer](self->_highlightView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", self->_cornerRadius);

  -[UIView layer](self->_visualEffectContainerView, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerCurve:", self->_cornerCurve);

  -[UIView layer](self->_visualEffectContainerView, "layer");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerRadius:", self->_cornerRadius);

}

- (void)setRoundContentWhenDeselected:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  double cornerRadius;
  id v8;

  if (self->_roundContentWhenDeselected != a3)
  {
    self->_roundContentWhenDeselected = a3;
    v4 = -[_UIFloatingContentView _shouldApplyCornerRadiusForPrimaryState:](self, "_shouldApplyCornerRadiusForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", self->_controlState));
    -[UIView layer](self->_containerView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerCurve:", self->_cornerCurve);

    -[UIView layer](self->_containerView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    cornerRadius = 0.0;
    if (v4)
      cornerRadius = self->_cornerRadius;
    v8 = v6;
    objc_msgSend(v6, "setCornerRadius:", cornerRadius);

  }
}

+ (id)_defaultFocusAnimationConfiguration
{
  return +[_UIFocusAnimationConfiguration configurationWithStyle:](_UIFocusAnimationConfiguration, "configurationWithStyle:", 0);
}

- (_UIFocusAnimationConfiguration)focusAnimationConfiguration
{
  _UIFocusAnimationConfiguration *focusAnimationConfiguration;
  _UIFocusAnimationConfiguration *v4;
  _UIFocusAnimationConfiguration *v5;

  focusAnimationConfiguration = self->_focusAnimationConfiguration;
  if (!focusAnimationConfiguration)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultFocusAnimationConfiguration");
    v4 = (_UIFocusAnimationConfiguration *)objc_claimAutoreleasedReturnValue();
    v5 = self->_focusAnimationConfiguration;
    self->_focusAnimationConfiguration = v4;

    focusAnimationConfiguration = self->_focusAnimationConfiguration;
  }
  return focusAnimationConfiguration;
}

- (id)backgroundColorForState:(unint64_t)a3
{
  void *v7;

  if (-[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingContentView.m"), 499, CFSTR("_UIFloatingContentView: getting properties for mixed states is unsupported"));

  }
  return (id)CFDictionaryGetValue(self->_backgroundColorsByState, (const void *)a3);
}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  __CFDictionary *backgroundColorsByState;
  void *v8;
  id value;

  value = a3;
  if (-[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", a4) != a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFloatingContentView.m"), 506, CFSTR("_UIFloatingContentView: setting properties for mixed states is unsupported"));

  }
  backgroundColorsByState = self->_backgroundColorsByState;
  if (value)
    CFDictionarySetValue(backgroundColorsByState, (const void *)a4, value);
  else
    CFDictionaryRemoveValue(backgroundColorsByState, (const void *)a4);
  if (-[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", self->_controlState) == a4)
    -[_UIFloatingContentView _updateHighlightViewForPrimaryState:](self, "_updateHighlightViewForPrimaryState:", a4);

}

- (void)setShadowImage:(id)a3 stretchable:(BOOL)a4
{
  UIImage *v6;
  UIImage *shadowImage;

  v6 = (UIImage *)a3;
  self->_useShadowImage = 1;
  self->_stretchableShadowImage = a4;
  if (!a4)
  {
    self->_unfocusedShadowVerticalOffset = 0.0;
    self->_shadowVerticalOffset = 0.0;
  }
  shadowImage = self->_shadowImage;
  self->_shadowImage = v6;

  -[_UIFloatingContentView _updateShadowLayer](self, "_updateShadowLayer");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUseShadowImage:(BOOL)a3
{
  if (self->_useShadowImage != a3)
  {
    self->_useShadowImage = a3;
    -[_UIFloatingContentView _updateShadowLayer](self, "_updateShadowLayer");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShadowEnabled:(BOOL)a3
{
  if (self->_shadowEnabled != a3)
  {
    self->_shadowEnabled = a3;
    -[_UIFloatingContentView _updateShadowLayer](self, "_updateShadowLayer");
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setScalesBackwards:(BOOL)a3
{
  if (self->_scalesBackwards != a3)
    self->_scalesBackwards = a3;
}

- (CGPath)_shadowPathForSize:(CGSize)a3 radius:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  CGPath *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  _QWORD v27[4];
  NSString *v28;

  height = a3.height;
  width = a3.width;
  if (qword_1ECD7AE70 != -1)
    dispatch_once(&qword_1ECD7AE70, &__block_literal_global_44);
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  *(double *)v27 = width;
  *(double *)&v27[1] = height;
  -[_UIFloatingContentView cornerRadius](self, "cornerRadius");
  v27[2] = v16;
  *(double *)&v27[3] = a4;
  v28 = self->_cornerCurve;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v27, "{?={CGSize=dd}dd@}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (CGPath *)objc_msgSend((id)_MergedGlobals_11_2, "objectForKey:", v17);
  if (!v18)
  {
    v19 = round(v9 + (v13 - width) * 0.5);
    v20 = round(v11 + (v15 - height) * 0.5);
    if (-[_UIFloatingContentView isContinuousCornerEnabled](self, "isContinuousCornerEnabled"))
    {
      -[_UIFloatingContentView cornerRadius](self, "cornerRadius");
      v22 = v21;
      -[_UIFloatingContentView cornerRadius](self, "cornerRadius");
      +[UIBezierPath _continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:](UIBezierPath, "_continuousRoundedRectBezierPath:withRoundedCorners:cornerRadius:segments:", -1, 16, v19, v20, width, height, v22, v23);
    }
    else
    {
      -[_UIFloatingContentView cornerRadius](self, "cornerRadius");
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v19, v20, width, height, v25);
    }
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (CGPath *)objc_msgSend(v24, "CGPath");

    if (v18)
      objc_msgSend((id)_MergedGlobals_11_2, "setObject:forKey:", v18, v17);
  }

  return v18;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingContentView;
  v4 = a3;
  -[UIView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  -[UIView traitCollection](self, "traitCollection", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingContentView;
  -[UIView _intrinsicContentSizeInvalidatedForChildView:](&v6, sel__intrinsicContentSizeInvalidatedForChildView_, v4);
  if (-[_UIFloatingContentView forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview](self, "forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview"))
  {
    -[UIView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_intrinsicContentSizeInvalidatedForChildView:", v4);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFloatingContentView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIFloatingContentView _setShadowImageIfNeeded](self, "_setShadowImageIfNeeded");
  -[_UIFloatingContentView _layoutContentView](self, "_layoutContentView");
  -[_UIFloatingContentView _updateScaleFactor](self, "_updateScaleFactor");
  -[_UIFloatingContentView _updateTransformForPrimaryState:](self, "_updateTransformForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState")));
  -[_UIFloatingContentView _layoutShadow](self, "_layoutShadow");
  -[_UIFloatingContentView _layoutHighContrastFocusIndicator](self, "_layoutHighContrastFocusIndicator");
}

- (void)_layoutContentView
{
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  double v9;
  double v10;
  CGRect v12;
  CGRect v13;

  -[UIView bounds](self, "bounds");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  MidY = CGRectGetMidY(v13);
  -[UIView bounds](self->_containerView, "bounds");
  if (width != v10 || height != v9)
  {
    -[UIView setBounds:](self->_transformView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_transformView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_visualEffectContainerView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_visualEffectContainerView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_containerView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_containerView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_contentView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_contentView, "setCenter:", MidX, MidY);
    -[UIView setBounds:](self->_highlightView, "setBounds:", x, y, width, height);
    -[UIView setCenter:](self->_highlightView, "setCenter:", MidX, MidY);
  }
}

- (void)_layoutShadow
{
  unint64_t v3;
  _BOOL4 v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
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
  double v27;
  int64_t v28;
  double v29;
  double v30;
  double v31;
  UIImage *shadowImage;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int64_t highlightStyle;
  double v41;
  double v42;
  double v43;
  double MidX;
  CGPath *v45;
  void *v46;
  NSString *cornerCurve;
  void *v48;
  _BOOL4 v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  id v56;
  CGRect v57;
  CGRect v58;

  if (-[_UIFloatingContentView isShadowEnabled](self, "isShadowEnabled"))
  {
    v3 = -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState"));
    v4 = -[_UIFloatingContentView _shouldAppearToFloatForPrimaryState:](self, "_shouldAppearToFloatForPrimaryState:", v3);
    v5 = -[_UIFloatingContentView useShadowImage](self, "useShadowImage");
    -[UIView bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    if (v5)
    {
      if (self->_stretchableShadowImage)
      {
        -[_UIFloatingContentView shadowSize](self, "shadowSize");
        v14 = v12 == *MEMORY[0x1E0C9D820];
        v15 = v13 == *(double *)(MEMORY[0x1E0C9D820] + 8);
        if (v14 && v15)
          v16 = v11;
        else
          v16 = v13;
        if (v14 && v15)
          v17 = v9;
        else
          v17 = v12;
        -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
        v19 = v18 / 20.0;
        if (v4)
        {
          -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
          v21 = v20;
          -[_UIFloatingContentView shadowExpansion](self, "shadowExpansion");
        }
        else
        {
          -[_UIFloatingContentView unfocusedShadowRadius](self, "unfocusedShadowRadius");
          v21 = v35;
          -[_UIFloatingContentView unfocusedShadowExpansion](self, "unfocusedShadowExpansion");
        }
        v36 = v22;
        v37 = v23;
        v38 = v17 / v19;
        v39 = v16 / v19;
        if (v3 == 1)
        {
          highlightStyle = self->_highlightStyle;
          if (highlightStyle)
          {
            if (highlightStyle == 1)
            {
              -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
              v42 = v41;
              -[_UIFloatingContentView unfocusedShadowRadius](self, "unfocusedShadowRadius");
              v21 = (v42 + v43) * 0.5;
              v36 = v36 * 0.5;
              v37 = v37 * 0.5;
            }
          }
          else
          {
            v21 = v21 * 0.25;
            v36 = v22 * 0.34;
            v37 = v23 * 0.34;
          }
        }
        v49 = -[_UIFloatingContentView _disableOutsetShadowPath](self, "_disableOutsetShadowPath");
        if (v49)
          v50 = v21;
        else
          v50 = v37;
        if (v49)
          v51 = v21;
        else
          v51 = v36;
        v9 = v38 + v51 + v51;
        v11 = v39 + v50 + v50;
      }
      else
      {
        shadowImage = self->_shadowImage;
        if (shadowImage)
        {
          -[UIImage size](shadowImage, "size");
          v9 = v33;
          -[UIImage size](self->_shadowImage, "size");
          v11 = v34;
        }
      }
      -[UIView bounds](self, "bounds");
      -[UIView setFrame:](self->_shadowView, "setFrame:", round(v53 + (v52 - v9) * 0.5), round(v55 + (v54 - v11) * 0.5), v9, v11);
    }
    else
    {
      v24 = v6;
      v25 = v7;
      if (v4)
        -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
      else
        -[_UIFloatingContentView unfocusedShadowRadius](self, "unfocusedShadowRadius");
      v27 = v26;
      if (v3 == 1)
      {
        v28 = self->_highlightStyle;
        if (v28)
        {
          if (v28 == 1)
          {
            -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
            v30 = v29;
            -[_UIFloatingContentView unfocusedShadowRadius](self, "unfocusedShadowRadius");
            v27 = (v30 + v31) * 0.5;
          }
        }
        else
        {
          v27 = v26 * 0.25;
        }
        v9 = v9 - v27;
        v11 = v11 - v27;
      }
      -[UIView setBounds:](self->_shadowView, "setBounds:", v24, v25, v9, v11);
      v57.origin.x = v24;
      v57.origin.y = v25;
      v57.size.width = v9;
      v57.size.height = v11;
      MidX = CGRectGetMidX(v57);
      v58.origin.x = v24;
      v58.origin.y = v25;
      v58.size.width = v9;
      v58.size.height = v11;
      -[UIView setCenter:](self->_shadowView, "setCenter:", MidX, CGRectGetMidY(v58));
      v45 = -[_UIFloatingContentView _shadowPathForSize:radius:](self, "_shadowPathForSize:radius:", v9, v11, v27);
      -[UIView layer](self->_shadowView, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setShadowPath:", v45);

      cornerCurve = self->_cornerCurve;
      -[UIView layer](self->_shadowView, "layer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setCornerCurve:", cornerCurve);

      -[UIView layer](self->_shadowView, "layer");
      v56 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setShadowRadius:", v27);

    }
  }
}

- (void)_layoutHighContrastFocusIndicator
{
  UIView *highContrastFocusIndicatorView;
  void *v4;
  double v5;
  double x;
  void *v7;
  double v8;
  double y;
  CGRect v10;
  CGRect v11;

  highContrastFocusIndicatorView = self->_highContrastFocusIndicatorView;
  if (highContrastFocusIndicatorView)
  {
    -[UIView layer](highContrastFocusIndicatorView, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "borderWidth");
    x = v5 + v5;
    -[UIView layer](self->_highContrastFocusIndicatorView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "borderWidth");
    y = v8 + v8;

    if (self->_highContrastFocusIndicatorOutset.x != *MEMORY[0x1E0C9D538]
      || self->_highContrastFocusIndicatorOutset.y != *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      y = self->_highContrastFocusIndicatorOutset.y;
      x = self->_highContrastFocusIndicatorOutset.x;
    }
    -[UIView bounds](self, "bounds");
    v11 = CGRectInset(v10, -x, -y);
    -[UIView setFrame:](self->_highContrastFocusIndicatorView, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  }
}

- (void)setControlState:(unint64_t)a3
{
  -[_UIFloatingContentView _setControlState:withAnimationCoordinator:](self, "_setControlState:withAnimationCoordinator:", a3, 0);
}

- (void)setControlState:(unint64_t)a3 animated:(BOOL)a4
{
  void *v6;
  id v7;

  if (a4)
  {
    -[_UIFloatingContentView focusAnimationConfiguration](self, "focusAnimationConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a3 & 8) != 0)
      +[UIFocusAnimationCoordinator _focusingAnimationCoordinatorWithConfiguration:inContext:](UIFocusAnimationCoordinator, "_focusingAnimationCoordinatorWithConfiguration:inContext:", v6, 0);
    else
      +[UIFocusAnimationCoordinator _unfocusingAnimationCoordinatorWithConfiguration:inContext:](UIFocusAnimationCoordinator, "_unfocusingAnimationCoordinatorWithConfiguration:inContext:", v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIFloatingContentView _setControlState:withAnimationCoordinator:](self, "_setControlState:withAnimationCoordinator:", a3, v7);
  }
  else
  {
    v7 = 0;
    -[_UIFloatingContentView _setControlState:withAnimationCoordinator:](self, "_setControlState:withAnimationCoordinator:", a3, 0);
  }
  objc_msgSend(v7, "_animate");

}

- (void)_setControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  unint64_t controlState;
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void (**v12)(_QWORD);
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[8];
  BOOL v20;
  _QWORD aBlock[5];
  char v22;

  v6 = a4;
  controlState = self->_controlState;
  if (controlState == a3)
    goto LABEL_18;
  self->_controlState = a3;
  v8 = -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", a3);
  v9 = v8;
  if (!v8)
    goto LABEL_10;
  if (v8 == 1)
  {
    if ((a3 & 8) != 0)
    {
      v9 = 1;
      goto LABEL_8;
    }
    if (dyld_program_sdk_at_least())
    {
      v9 = 4;
      goto LABEL_8;
    }
    v9 = 0;
LABEL_10:
    v10 = 1;
    goto LABEL_11;
  }
LABEL_8:
  -[_UIFloatingContentView _updateContainerLayerQualityForPrimaryState:](self, "_updateContainerLayerQualityForPrimaryState:", v9);
  v10 = 0;
LABEL_11:
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke;
  aBlock[3] = &unk_1E16B1B78;
  aBlock[4] = self;
  v22 = v10;
  v12 = (void (**)(_QWORD))_Block_copy(aBlock);
  v13 = objc_msgSend(v6, "activeFocusAnimation") == 1;
  objc_msgSend(v6, "_activeConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unfocusingBackgroundFadeDurationPercentage");
  v16 = v15;

  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __68___UIFloatingContentView__setControlState_withAnimationCoordinator___block_invoke_2;
  v19[3] = &unk_1E16B55E0;
  v19[4] = self;
  v19[5] = v9;
  v20 = v13;
  v19[6] = v16;
  v19[7] = controlState;
  v17 = _Block_copy(v19);
  v18 = v17;
  if (v6)
  {
    objc_msgSend(v6, "addCoordinatedAnimations:completion:", v17, v12);
  }
  else
  {
    if (v17)
      (*((void (**)(void *))v17 + 2))(v17);
    if (v12)
      v12[2](v12);
  }

LABEL_18:
}

- (void)setClipsContentToBounds:(BOOL)a3
{
  _UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView *containerView;

  containerView = self->_containerView;
  if (containerView)
    -[UIView setClipsToBounds:](containerView, "setClipsToBounds:", a3);
}

- (BOOL)clipsContentToBounds
{
  _UIFloatingContentCornerRadiusAnimatingScreenScaleInheritingView *containerView;

  containerView = self->_containerView;
  if (containerView)
    LOBYTE(containerView) = -[UIView clipsToBounds](containerView, "clipsToBounds");
  return (char)containerView;
}

- (void)setShowsHighContrastFocusIndicator:(BOOL)a3
{
  self->_showsHighContrastFocusIndicator = a3;
  -[_UIFloatingContentView _updateHighContrastFocusIndicatorView](self, "_updateHighContrastFocusIndicatorView");
}

- (void)setHighContrastFocusIndicatorCornerRadius:(double)a3
{
  id v4;

  self->_highContrastFocusIndicatorCornerRadius = a3;
  -[UIView layer](self->_highContrastFocusIndicatorView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (void)_updateHighContrastFocusIndicatorView
{
  UIView *v3;
  UIView *v4;
  UIView *highContrastFocusIndicatorView;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *cornerCurve;
  void *v11;
  double highContrastFocusIndicatorCornerRadius;
  void *v13;
  UIView *v14;
  UIView *v15;

  if (self->_showsHighContrastFocusIndicator && _AXSHighContrastFocusIndicatorsEnabled())
  {
    if (!self->_highContrastFocusIndicatorView)
    {
      v3 = [UIView alloc];
      -[UIView bounds](self, "bounds");
      v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
      highContrastFocusIndicatorView = self->_highContrastFocusIndicatorView;
      self->_highContrastFocusIndicatorView = v4;

      +[UIColor whiteColor](UIColor, "whiteColor");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = objc_msgSend(v6, "CGColor");
      -[UIView layer](self->_highContrastFocusIndicatorView, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBorderColor:", v7);

      -[UIView layer](self->_highContrastFocusIndicatorView, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBorderWidth:", 8.0);

      cornerCurve = self->_cornerCurve;
      -[UIView layer](self->_highContrastFocusIndicatorView, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCornerCurve:", cornerCurve);

      highContrastFocusIndicatorCornerRadius = self->_highContrastFocusIndicatorCornerRadius;
      if (highContrastFocusIndicatorCornerRadius <= 0.0)
        highContrastFocusIndicatorCornerRadius = self->_cornerRadius + 1.0;
      -[UIView layer](self->_highContrastFocusIndicatorView, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCornerRadius:", highContrastFocusIndicatorCornerRadius);

      -[UIView insertSubview:atIndex:](self->_transformView, "insertSubview:atIndex:", self->_highContrastFocusIndicatorView, 0);
      -[_UIFloatingContentView _updateHighContrastFocusIndicatorForPrimaryState:](self, "_updateHighContrastFocusIndicatorForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState")));
    }
  }
  else
  {
    v14 = self->_highContrastFocusIndicatorView;
    if (v14)
    {
      -[UIView removeFromSuperview](v14, "removeFromSuperview");
      v15 = self->_highContrastFocusIndicatorView;
      self->_highContrastFocusIndicatorView = 0;

    }
  }
}

- (double)_effectiveShadowRadius
{
  double v3;
  double shadowRadius;
  double v5;

  -[_UIFloatingContentView scaleFactor](self, "scaleFactor");
  shadowRadius = self->_shadowRadius;
  if (fabs(v3) >= 2.22044605e-16)
  {
    -[_UIFloatingContentView scaleFactor](self, "scaleFactor");
    return shadowRadius / v5;
  }
  return shadowRadius;
}

- (double)_effectiveShadowOpacity
{
  void *v3;
  double v4;
  double v5;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFloatingContentView shadowOpacityForUserInterfaceStyle:](self, "shadowOpacityForUserInterfaceStyle:", objc_msgSend(v3, "userInterfaceStyle"));
  v5 = v4;

  return v5;
}

- (void)_updateShadowOpacityForPrimaryState:(unint64_t)a3
{
  double v5;
  double v6;
  double unfocusedShadowOpacity;
  int64_t highlightStyle;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  -[_UIFloatingContentView _effectiveShadowOpacity](self, "_effectiveShadowOpacity");
  v6 = v5;
  unfocusedShadowOpacity = v5;
  if (!-[_UIFloatingContentView _shouldAppearToFloatForPrimaryState:](self, "_shouldAppearToFloatForPrimaryState:", a3))
    unfocusedShadowOpacity = self->_unfocusedShadowOpacity;
  if (-[_UIFloatingContentView useShadowImage](self, "useShadowImage"))
  {
    if (a3 == 1)
    {
      highlightStyle = self->_highlightStyle;
      if (highlightStyle)
      {
        if (highlightStyle == 1)
          unfocusedShadowOpacity = (v6 + self->_unfocusedShadowOpacity) * 0.5;
      }
      else
      {
        unfocusedShadowOpacity = v6 * 0.75;
      }
    }
    -[UIView layer](self->_shadowView, "layer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v12 = unfocusedShadowOpacity;
    objc_msgSend(v13, "setOpacity:", v12);
  }
  else
  {
    -[UIView layer](self->_shadowView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 1.0;
    objc_msgSend(v9, "setOpacity:", v10);

    -[UIView layer](self->_shadowView, "layer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = unfocusedShadowOpacity;
    objc_msgSend(v13, "setShadowOpacity:", v11);
  }

}

- (void)_updateShadowLayer
{
  _BOOL4 v3;
  UIView *shadowView;
  UIView *v5;
  UIView *v6;
  UIView *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIView *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  unint64_t v20;
  UIView *v21;

  v3 = -[_UIFloatingContentView isShadowEnabled](self, "isShadowEnabled");
  shadowView = self->_shadowView;
  if (v3)
  {
    if (!shadowView)
    {
      v5 = [UIView alloc];
      -[UIView frame](self, "frame");
      v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
      v7 = self->_shadowView;
      self->_shadowView = v6;

      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_shadowView, 0);
      shadowView = self->_shadowView;
    }
    -[UIView layer](shadowView, "layer");
    v21 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setZPosition:](v21, "setZPosition:", -1000.0);
    if (-[_UIFloatingContentView useShadowImage](self, "useShadowImage"))
    {
      -[_UIFloatingContentView shadowImage](self, "shadowImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setOpaque:](self->_shadowView, "setOpaque:", 0);
      -[UIView setBackgroundColor:](self->_shadowView, "setBackgroundColor:", 0);
      v9 = objc_retainAutorelease(v8);
      -[UIView setContents:](v21, "setContents:", objc_msgSend(v9, "CGImage"));
      if (self->_stretchableShadowImage)
      {
        -[_UIFloatingContentView shadowContentsCenter](self, "shadowContentsCenter");
      }
      else
      {
        v12 = 1.0;
        v10 = 0.0;
        v11 = 0.0;
        v13 = 1.0;
      }
      -[UIView setContentsCenter:](v21, "setContentsCenter:", v10, v11, v12, v13);
      LODWORD(v18) = 0;
      -[UIView setShadowOpacity:](v21, "setShadowOpacity:", v18);
      LODWORD(v19) = 0;
      -[UIView setOpacity:](v21, "setOpacity:", v19);
      -[UIView setShadowRadius:](v21, "setShadowRadius:", 0.0);
      -[UIView setZPosition:](v21, "setZPosition:", -1000.0);

    }
    else
    {
      -[UIView setContents:](v21, "setContents:", 0);
      -[UIView setContentsCenter:](v21, "setContentsCenter:", 0.0, 0.0, 1.0, 1.0);
      -[UIView traitCollection](self, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIFloatingContentView shadowOpacityForUserInterfaceStyle:](self, "shadowOpacityForUserInterfaceStyle:", objc_msgSend(v15, "userInterfaceStyle"));
      *(float *)&v16 = v16;
      -[UIView setShadowOpacity:](v21, "setShadowOpacity:", v16);

      -[_UIFloatingContentView cornerCurve](self, "cornerCurve");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setCornerCurve:](v21, "setCornerCurve:", v17);

      -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
      -[UIView setShadowRadius:](v21, "setShadowRadius:");
    }
    -[_UIFloatingContentView _layoutShadow](self, "_layoutShadow");
    v20 = -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState"));
    -[_UIFloatingContentView _updateShadowOpacityForPrimaryState:](self, "_updateShadowOpacityForPrimaryState:", v20);
    -[_UIFloatingContentView _updateTransformForPrimaryState:](self, "_updateTransformForPrimaryState:", v20);
    v14 = v21;
  }
  else
  {
    -[UIView removeFromSuperview](shadowView, "removeFromSuperview");
    v14 = self->_shadowView;
    self->_shadowView = 0;
  }

}

- (void)setShadowImage:(id)a3
{
  -[_UIFloatingContentView setShadowImage:stretchable:](self, "setShadowImage:stretchable:", a3, 1);
}

- (void)setShadowContentsCenter:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_shadowContentsCenter;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_shadowContentsCenter = &self->_shadowContentsCenter;
  if (!CGRectEqualToRect(self->_shadowContentsCenter, a3))
  {
    p_shadowContentsCenter->origin.x = x;
    p_shadowContentsCenter->origin.y = y;
    p_shadowContentsCenter->size.width = width;
    p_shadowContentsCenter->size.height = height;
    if (self->_stretchableShadowImage)
    {
      -[UIView layer](self->_shadowView, "layer");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentsCenter:", x, y, width, height);

    }
  }
}

- (double)shadowOpacity
{
  double result;

  -[_UIFloatingContentView shadowOpacityForUserInterfaceStyle:](self, "shadowOpacityForUserInterfaceStyle:", 1);
  return result;
}

- (void)setShadowOpacity:(double)a3
{
  -[_UIFloatingContentView setShadowOpacity:forUserInterfaceStyle:](self, "setShadowOpacity:forUserInterfaceStyle:", 1, a3);
}

- (void)setShadowOpacity:(double)a3 forUserInterfaceStyle:(int64_t)a4
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65___UIFloatingContentView_setShadowOpacity_forUserInterfaceStyle___block_invoke;
  v5[3] = &unk_1E16B4E70;
  v5[4] = self;
  v5[5] = a4;
  *(double *)&v5[6] = a3;
  +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v5);
  -[_UIFloatingContentView _updateShadowLayer](self, "_updateShadowLayer");
}

- (double)shadowOpacityForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3;
  uint64_t v4;

  v3 = a3 == 2 || a3 == 1000;
  v4 = 31;
  if (v3)
    v4 = 30;
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____UIFloatingContentView__backgroundColorsByState[v4]);
}

- (double)_currentShadowOpacity
{
  void *v2;
  float v3;
  double v4;

  -[UIView layer](self->_shadowView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3;

  return v4;
}

- (void)setUnfocusedShadowOpacity:(double)a3
{
  if (self->_unfocusedShadowOpacity != a3)
  {
    self->_unfocusedShadowOpacity = a3;
    -[_UIFloatingContentView _updateShadowOpacityForPrimaryState:](self, "_updateShadowOpacityForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState")));
  }
}

- (void)setUnfocusedShadowVerticalOffset:(double)a3
{
  if (self->_unfocusedShadowVerticalOffset != a3)
  {
    self->_unfocusedShadowVerticalOffset = a3;
    -[_UIFloatingContentView _updateTransformForPrimaryState:](self, "_updateTransformForPrimaryState:", -[_UIFloatingContentView _primaryStateForState:](self, "_primaryStateForState:", -[_UIFloatingContentView controlState](self, "controlState")));
  }
}

- (void)setUnfocusedShadowRadius:(double)a3
{
  if (self->_unfocusedShadowRadius != a3)
  {
    self->_unfocusedShadowRadius = a3;
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingContentView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIFloatingContentView _layoutContentView](self, "_layoutContentView");
  -[_UIFloatingContentView _updateScaleFactor](self, "_updateScaleFactor");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingContentView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIFloatingContentView _layoutContentView](self, "_layoutContentView");
  -[_UIFloatingContentView _updateScaleFactor](self, "_updateScaleFactor");
}

- (double)scaleFactor
{
  return self->_asymmetricScaleFactor.width;
}

- (void)setScaleFactor:(double)a3
{
  -[_UIFloatingContentView setAsymmetricScaleFactor:](self, "setAsymmetricScaleFactor:", a3, a3);
  self->_symmetricScale = 1;
}

- (double)focusedSizeIncrease
{
  return self->_asymmetricFocusedSizeIncrease.width;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  -[_UIFloatingContentView setAsymmetricFocusedSizeIncrease:](self, "setAsymmetricFocusedSizeIncrease:", a3, a3);
  self->_symmetricScale = 1;
}

- (void)setAsymmetricScaleFactor:(CGSize)a3
{
  self->_asymmetricScaleFactor = a3;
  self->_customScale = 1;
  self->_symmetricScale = 0;
}

- (void)setAsymmetricFocusedSizeIncrease:(CGSize)a3
{
  self->_asymmetricFocusedSizeIncrease = a3;
  self->_customScale = 0;
  self->_symmetricScale = 0;
}

- (void)_updateScaleFactor
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

  if (!self->_customScale)
  {
    -[UIView bounds](self, "bounds");
    v5 = 1.0;
    if (v3 <= 0.0)
    {
      v7 = 1.0;
    }
    else
    {
      v6 = v4;
      v7 = 1.0;
      if (v4 > 0.0)
      {
        v8 = v3;
        if (self->_symmetricScale)
        {
          -[_UIFloatingContentView focusedSizeIncrease](self, "focusedSizeIncrease", 1.0);
          if (v8 <= v6)
            v5 = (v6 + v9) / v6;
          else
            v5 = (v8 + v9) / v8;
          v7 = v5;
        }
        else
        {
          -[_UIFloatingContentView asymmetricFocusedSizeIncrease](self, "asymmetricFocusedSizeIncrease", 1.0);
          v7 = (v8 + v10) / v8;
          -[_UIFloatingContentView asymmetricFocusedSizeIncrease](self, "asymmetricFocusedSizeIncrease");
          v5 = (v6 + v11) / v6;
        }
      }
    }
    if (v7 != self->_asymmetricScaleFactor.width || v5 != self->_asymmetricScaleFactor.height)
    {
      self->_asymmetricScaleFactor.width = v7;
      self->_asymmetricScaleFactor.height = v5;
      -[_UIFloatingContentView _updateFocusedFrameGuideConstraintsIfApplicable](self, "_updateFocusedFrameGuideConstraintsIfApplicable");
    }
  }
}

- (void)_updateContainerLayerQualityForPrimaryState:(unint64_t)a3
{
  _BOOL8 v4;
  void *v5;
  id v6;

  if (-[_UIFloatingContentView _shouldAppearToFloatForPrimaryState:](self, "_shouldAppearToFloatForPrimaryState:", a3))
    v4 = self->_contentRotation.y != *(double *)(MEMORY[0x1E0C9D538] + 8)
      || self->_contentRotation.x != *MEMORY[0x1E0C9D538];
  else
    v4 = 0;
  -[UIView layer](self->_containerView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", v4);

  -[UIView layer](self->_containerView, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldRasterize:", v4);

}

- (void)_updateHighlightViewForPrimaryState:(unint64_t)a3
{
  id v4;

  -[_UIFloatingContentView backgroundColorForState:](self, "backgroundColorForState:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_highlightView, "setBackgroundColor:", v4);

}

- (void)_updateTransformForPrimaryState:(unint64_t)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGFloat v8;
  __int128 v9;
  CGFloat m34;
  double v11;
  CGSize *p_asymmetricScaleFactor;
  double shadowVerticalOffset;
  int64_t highlightStyle;
  double unfocusedShadowVerticalOffset;
  CGFloat v16;
  CGFloat v17;
  float64x2_t v18;
  double height;
  int64_t v21;
  float64x2_t v26;
  float64x2_t v29;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  void *v44;
  void *v45;
  CGFloat sx;
  CGFloat sx_8;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v50;
  CATransform3D v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGFloat m33;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  CGFloat v67;

  v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v64 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v65 = v5;
  v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v66 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v67 = *(double *)(MEMORY[0x1E0CD2610] + 80);
  v7 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v62 = *MEMORY[0x1E0CD2610];
  v63 = v7;
  v8 = *(double *)(MEMORY[0x1E0CD2610] + 88);
  v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v60 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v61 = v9;
  v56 = v64;
  v57 = v5;
  v58 = v66;
  m33 = v67;
  v54 = v62;
  v55 = v7;
  v52 = v60;
  v53 = v9;
  *(_OWORD *)&v51.m31 = v66;
  *(_OWORD *)&v51.m33 = v6;
  *(_OWORD *)&v51.m41 = v60;
  *(_OWORD *)&v51.m43 = v9;
  *(_OWORD *)&v51.m11 = v62;
  *(_OWORD *)&v51.m13 = v7;
  *(_OWORD *)&v51.m21 = v64;
  *(_OWORD *)&v51.m23 = v5;
  m34 = v8;
  if (-[_UIFloatingContentView useShadowImage](self, "useShadowImage"))
  {
    -[_UIFloatingContentView shadowRadius](self, "shadowRadius");
    CATransform3DMakeScale(&v50, v11 / 20.0, v11 / 20.0, 1.0);
    v56 = *(_OWORD *)&v50.m21;
    v57 = *(_OWORD *)&v50.m23;
    v58 = *(_OWORD *)&v50.m31;
    m33 = v50.m33;
    v54 = *(_OWORD *)&v50.m11;
    v55 = *(_OWORD *)&v50.m13;
    m34 = v50.m34;
    v52 = *(_OWORD *)&v50.m41;
    v53 = *(_OWORD *)&v50.m43;
  }
  if (-[_UIFloatingContentView _shouldAppearToFloatForPrimaryState:](self, "_shouldAppearToFloatForPrimaryState:", a3))
  {
    p_asymmetricScaleFactor = &self->_asymmetricScaleFactor;
    if (fabs(self->_asymmetricScaleFactor.width) < 2.22044605e-16
      || fabs(self->_asymmetricScaleFactor.height) < 2.22044605e-16)
    {
      -[_UIFloatingContentView _updateScaleFactor](self, "_updateScaleFactor");
    }
    shadowVerticalOffset = self->_shadowVerticalOffset;
    if (a3 == 1)
    {
      highlightStyle = self->_highlightStyle;
      if (highlightStyle)
      {
        if (highlightStyle == 1)
          shadowVerticalOffset = (shadowVerticalOffset + self->_unfocusedShadowVerticalOffset) * 0.5;
      }
      else
      {
        shadowVerticalOffset = shadowVerticalOffset * 0.4;
      }
    }
    *(_OWORD *)&a.m21 = v56;
    *(_OWORD *)&a.m23 = v57;
    *(_OWORD *)&a.m31 = v58;
    a.m33 = m33;
    *(_OWORD *)&a.m11 = v54;
    *(_OWORD *)&a.m13 = v55;
    a.m34 = m34;
    *(_OWORD *)&a.m41 = v52;
    *(_OWORD *)&a.m43 = v53;
    CATransform3DTranslate(&v50, &a, 0.0, shadowVerticalOffset, 0.0);
    v56 = *(_OWORD *)&v50.m21;
    v57 = *(_OWORD *)&v50.m23;
    v58 = *(_OWORD *)&v50.m31;
    m33 = v50.m33;
    v54 = *(_OWORD *)&v50.m11;
    v55 = *(_OWORD *)&v50.m13;
    v17 = v50.m34;
    v18.f64[0] = p_asymmetricScaleFactor->width;
    _NF = fabs(p_asymmetricScaleFactor->width) < 2.22044605e-16;
    v52 = *(_OWORD *)&v50.m41;
    v53 = *(_OWORD *)&v50.m43;
    if (_NF)
    {
      height = self->_asymmetricScaleFactor.height;
      if (fabs(height) < 2.22044605e-16)
      {
LABEL_27:
        v39 = self->_contentRotation.y * self->_focusDirection.y;
        *(_OWORD *)&a.m21 = v64;
        *(_OWORD *)&a.m23 = v65;
        *(_OWORD *)&a.m31 = v66;
        *(_OWORD *)&a.m11 = v62;
        *(_OWORD *)&a.m13 = v63;
        a.m33 = v67;
        a.m34 = -0.001;
        *(_OWORD *)&a.m41 = v60;
        *(_OWORD *)&a.m43 = v61;
        CATransform3DRotate(&v50, &a, v39, 1.0, 0.0, 0.0);
        v64 = *(_OWORD *)&v50.m21;
        v65 = *(_OWORD *)&v50.m23;
        v66 = *(_OWORD *)&v50.m31;
        v67 = v50.m33;
        v62 = *(_OWORD *)&v50.m11;
        v63 = *(_OWORD *)&v50.m13;
        v60 = *(_OWORD *)&v50.m41;
        v61 = *(_OWORD *)&v50.m43;
        v40 = -(self->_focusDirection.x * self->_contentRotation.x);
        a = v50;
        CATransform3DRotate(&v50, &a, v40, 0.0, 1.0, 0.0);
        v64 = *(_OWORD *)&v50.m21;
        v65 = *(_OWORD *)&v50.m23;
        v66 = *(_OWORD *)&v50.m31;
        v67 = v50.m33;
        v62 = *(_OWORD *)&v50.m11;
        v63 = *(_OWORD *)&v50.m13;
        v60 = *(_OWORD *)&v50.m41;
        v61 = *(_OWORD *)&v50.m43;
        v41 = self->_contentTranslation.x * self->_focusDirection.x;
        v42 = self->_contentTranslation.y * self->_focusDirection.y;
        a = v50;
        CATransform3DTranslate(&v50, &a, v41, v42, 0.0);
        v64 = *(_OWORD *)&v50.m21;
        v65 = *(_OWORD *)&v50.m23;
        v66 = *(_OWORD *)&v50.m31;
        v67 = v50.m33;
        v62 = *(_OWORD *)&v50.m11;
        v63 = *(_OWORD *)&v50.m13;
        v8 = v50.m34;
        v60 = *(_OWORD *)&v50.m41;
        v61 = *(_OWORD *)&v50.m43;
        *(_OWORD *)&a.m21 = v56;
        *(_OWORD *)&a.m23 = v57;
        *(_OWORD *)&a.m31 = v58;
        a.m33 = m33;
        *(_OWORD *)&a.m11 = v54;
        *(_OWORD *)&a.m13 = v55;
        a.m34 = v17;
        *(_OWORD *)&a.m41 = v52;
        *(_OWORD *)&a.m43 = v53;
        b = v50;
        CATransform3DConcat(&v50, &a, &b);
        v56 = *(_OWORD *)&v50.m21;
        v57 = *(_OWORD *)&v50.m23;
        v58 = *(_OWORD *)&v50.m31;
        m33 = v50.m33;
        v54 = *(_OWORD *)&v50.m11;
        v55 = *(_OWORD *)&v50.m13;
        v16 = v50.m34;
        v52 = *(_OWORD *)&v50.m41;
        v53 = *(_OWORD *)&v50.m43;
        CATransform3DMakeScale(&v51, self->_visualEffectContainerViewScaleFactor, self->_visualEffectContainerViewScaleFactor, 1.0);
        goto LABEL_28;
      }
    }
    else
    {
      height = self->_asymmetricScaleFactor.height;
    }
    v18.f64[1] = height;
    if (a3 == 1)
    {
      v21 = self->_highlightStyle;
      if (v21)
      {
        if (v21 != 1)
          goto LABEL_22;
        __asm { FMOV            V1.2D, #-1.0 }
        v26 = vaddq_f64(v18, _Q1);
        __asm { FMOV            V1.2D, #0.5 }
      }
      else
      {
        __asm { FMOV            V1.2D, #-1.0 }
        v26 = vaddq_f64(v18, _Q1);
        __asm { FMOV            V1.2D, #0.25 }
      }
      v29 = vmulq_f64(v26, _Q1);
      __asm { FMOV            V1.2D, #1.0 }
      v18 = vaddq_f64(v29, _Q1);
    }
LABEL_22:
    if (self->_focusScaleAnchorPoint.x == 0.5 && self->_focusScaleAnchorPoint.y == 0.5)
    {
      CATransform3DMakeScale(&v50, v18.f64[0], v18.f64[1], 1.0);
    }
    else
    {
      -[UIView bounds](self, "bounds", *(_OWORD *)&v18);
      v32 = v31 * 0.5;
      v34 = v33 * 0.5;
      -[UIView bounds](self, "bounds");
      v36 = self->_focusScaleAnchorPoint.x * v35 - v32;
      -[UIView bounds](self, "bounds");
      v38 = self->_focusScaleAnchorPoint.y * v37 - v34;
      CATransform3DMakeTranslation(&v50, v36, v38, 0.0);
      v64 = *(_OWORD *)&v50.m21;
      v65 = *(_OWORD *)&v50.m23;
      v66 = *(_OWORD *)&v50.m31;
      v67 = v50.m33;
      v62 = *(_OWORD *)&v50.m11;
      v63 = *(_OWORD *)&v50.m13;
      v60 = *(_OWORD *)&v50.m41;
      v61 = *(_OWORD *)&v50.m43;
      a = v50;
      CATransform3DScale(&v50, &a, sx, sx_8, 1.0);
      v64 = *(_OWORD *)&v50.m21;
      v65 = *(_OWORD *)&v50.m23;
      v66 = *(_OWORD *)&v50.m31;
      v67 = v50.m33;
      v62 = *(_OWORD *)&v50.m11;
      v63 = *(_OWORD *)&v50.m13;
      v60 = *(_OWORD *)&v50.m41;
      v61 = *(_OWORD *)&v50.m43;
      a = v50;
      CATransform3DTranslate(&v50, &a, -v36, -v38, 0.0);
    }
    v64 = *(_OWORD *)&v50.m21;
    v65 = *(_OWORD *)&v50.m23;
    v66 = *(_OWORD *)&v50.m31;
    v67 = v50.m33;
    v62 = *(_OWORD *)&v50.m11;
    v63 = *(_OWORD *)&v50.m13;
    v60 = *(_OWORD *)&v50.m41;
    v61 = *(_OWORD *)&v50.m43;
    goto LABEL_27;
  }
  unfocusedShadowVerticalOffset = self->_unfocusedShadowVerticalOffset;
  *(_OWORD *)&a.m21 = v56;
  *(_OWORD *)&a.m23 = v57;
  *(_OWORD *)&a.m31 = v58;
  a.m33 = m33;
  *(_OWORD *)&a.m11 = v54;
  *(_OWORD *)&a.m13 = v55;
  a.m34 = m34;
  *(_OWORD *)&a.m41 = v52;
  *(_OWORD *)&a.m43 = v53;
  CATransform3DTranslate(&v50, &a, 0.0, unfocusedShadowVerticalOffset, 0.0);
  v56 = *(_OWORD *)&v50.m21;
  v57 = *(_OWORD *)&v50.m23;
  v58 = *(_OWORD *)&v50.m31;
  m33 = v50.m33;
  v54 = *(_OWORD *)&v50.m11;
  v55 = *(_OWORD *)&v50.m13;
  v52 = *(_OWORD *)&v50.m41;
  v53 = *(_OWORD *)&v50.m43;
  v16 = -0.001;
LABEL_28:
  -[UIView layer](self->_transformView, "layer");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v50.m21 = v64;
  *(_OWORD *)&v50.m23 = v65;
  *(_OWORD *)&v50.m31 = v66;
  v50.m33 = v67;
  *(_OWORD *)&v50.m11 = v62;
  *(_OWORD *)&v50.m13 = v63;
  v50.m34 = v8;
  *(_OWORD *)&v50.m41 = v60;
  *(_OWORD *)&v50.m43 = v61;
  objc_msgSend(v43, "setTransform:", &v50);

  -[UIView layer](self->_shadowView, "layer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&v50.m21 = v56;
  *(_OWORD *)&v50.m23 = v57;
  *(_OWORD *)&v50.m31 = v58;
  v50.m33 = m33;
  *(_OWORD *)&v50.m11 = v54;
  *(_OWORD *)&v50.m13 = v55;
  v50.m34 = v16;
  *(_OWORD *)&v50.m41 = v52;
  *(_OWORD *)&v50.m43 = v53;
  objc_msgSend(v44, "setTransform:", &v50);

  -[UIView layer](self->_visualEffectContainerView, "layer");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v51;
  objc_msgSend(v45, "setTransform:", &v50);

}

- (void)_updateHighContrastFocusIndicatorForPrimaryState:(unint64_t)a3
{
  _BOOL4 v4;
  double v5;

  v4 = -[_UIFloatingContentView _shouldAppearToFloatForPrimaryState:](self, "_shouldAppearToFloatForPrimaryState:", a3);
  v5 = 0.0;
  if (v4)
    v5 = 1.0;
  -[UIView setAlpha:](self->_highContrastFocusIndicatorView, "setAlpha:", v5);
}

- (void)_updateShadowContentsScaleForPrimaryState:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = 1.0;
  if (a3 == 1)
    v4 = 2.0;
  if (a3 == 8)
    v5 = 1.05;
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x1E0CD28B0], "animationDuration", v4);
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CD28B0], "animationTimingFunction");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CD28B0];
  +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
  objc_msgSend(v8, "setAnimationDuration:");
  v9 = (void *)MEMORY[0x1E0CD28B0];
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 1.0;
  LODWORD(v13) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAnimationTimingFunction:", v14);

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contentsScale"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", &unk_1E1A96D80);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v16);

  -[UIView layer](self->_shadowView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentsScale:", v5);

  -[UIView layer](self->_shadowView, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v15, CFSTR("ShadowViewContentsScaleAnimation"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationTimingFunction:", v19);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setAnimationDuration:", v7);

}

- (void)_setShadowImageIfNeeded
{
  _QWORD v3[5];

  if (!self->_shadowImage)
  {
    if (-[_UIFloatingContentView useShadowImage](self, "useShadowImage"))
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __49___UIFloatingContentView__setShadowImageIfNeeded__block_invoke;
      v3[3] = &unk_1E16B1B28;
      v3[4] = self;
      +[UIView _performSystemAppearanceModifications:](UIView, "_performSystemAppearanceModifications:", v3);
    }
  }
}

- (id)_focusedFrameGuide
{
  return -[_UIFloatingContentView _focusedFrameGuideCreateIfNecessary:](self, "_focusedFrameGuideCreateIfNecessary:", 1);
}

- (id)_focusedFrameGuideCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  UILayoutGuide *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v3 = a3;
  v15[4] = *MEMORY[0x1E0C80C00];
  objc_getAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey);
  v5 = (UILayoutGuide *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    v5 = objc_alloc_init(UILayoutGuide);
    objc_setAssociatedObject(self, &_focusedFrameGuideCreateIfNecessary__focusedFrameGuideKey, v5, (void *)1);
    -[UIView addLayoutGuide:](self, "addLayoutGuide:", v5);
    -[UILayoutGuide _setLockedToOwningView:](v5, "_setLockedToOwningView:", 1);
    -[UILayoutGuide setIdentifier:](v5, "setIdentifier:", CFSTR("_UIFloatingContentViewFocusedFrameGuide"));
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v5, 3, 0, self, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", v5, 1, 0, self, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self, 4, 0, v5, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:", self, 2, 0, v5, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIdentifier:", CFSTR("focusedFrameGuide-topConstraint"));
    objc_msgSend(v8, "setIdentifier:", CFSTR("focusedFrameGuide-leftConstraint"));
    objc_msgSend(v9, "setIdentifier:", CFSTR("focusedFrameGuide-bottomConstraint"));
    objc_msgSend(v10, "setIdentifier:", CFSTR("focusedFrameGuide-rightConstraint"));
    v15[0] = v7;
    v15[1] = v8;
    v15[2] = v9;
    v15[3] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILayoutGuide _setSystemConstraints:](v5, "_setSystemConstraints:", v11);

    -[_UIFloatingContentView _updateFocusedFrameGuideConstraintsIfApplicable](self, "_updateFocusedFrameGuideConstraintsIfApplicable");
    v12 = (void *)MEMORY[0x1E0D156E0];
    -[UILayoutGuide _systemConstraints](v5, "_systemConstraints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v13);

  }
  return v5;
}

- (void)_updateFocusedFrameGuideConstraintsIfApplicable
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  _BOOL4 v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  id v31;

  -[_UIFloatingContentView _focusedFrameGuideCreateIfNecessary:](self, "_focusedFrameGuideCreateIfNecessary:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v31 = v3;
    -[_UIFloatingContentView asymmetricScaleFactor](self, "asymmetricScaleFactor");
    v5 = v4;
    v7 = v6;
    -[UIView bounds](self, "bounds");
    v10 = v8 > 0.0;
    v11 = v9 > 0.0;
    if (v10 && v11)
      v12 = v8 - v5 * v8;
    else
      v12 = 0.0;
    if (v10 && v11)
      v13 = v9 - v7 * v9;
    else
      v13 = 0.0;
    objc_msgSend(v31, "_systemConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constant");
    v17 = v16;

    if (v17 != v13)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setConstant:", v13);

    }
    objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constant");
    v21 = v20;

    if (v21 != v12)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setConstant:", v12);

    }
    objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constant");
    v25 = v24;

    if (v25 != v13)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setConstant:", v13);

    }
    objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constant");
    v29 = v28;

    if (v29 != v12)
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setConstant:", v12);

    }
    v3 = v31;
  }

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGPoint)focusScaleAnchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_focusScaleAnchorPoint.x;
  y = self->_focusScaleAnchorPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFocusScaleAnchorPoint:(CGPoint)a3
{
  self->_focusScaleAnchorPoint = a3;
}

- (double)visualEffectContainerViewScaleFactor
{
  return self->_visualEffectContainerViewScaleFactor;
}

- (void)setVisualEffectContainerViewScaleFactor:(double)a3
{
  self->_visualEffectContainerViewScaleFactor = a3;
}

- (void)setFocusAnimationConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 616);
}

- (BOOL)useShadowImage
{
  return self->_useShadowImage;
}

- (BOOL)isShadowEnabled
{
  return self->_shadowEnabled;
}

- (CGSize)shadowSize
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowSize.width;
  height = self->_shadowSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowSize:(CGSize)a3
{
  self->_shadowSize = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)shadowVerticalOffset
{
  return self->_shadowVerticalOffset;
}

- (void)setShadowVerticalOffset:(double)a3
{
  self->_shadowVerticalOffset = a3;
}

- (double)unfocusedShadowRadius
{
  return self->_unfocusedShadowRadius;
}

- (double)unfocusedShadowOpacity
{
  return self->_unfocusedShadowOpacity;
}

- (double)unfocusedShadowVerticalOffset
{
  return self->_unfocusedShadowVerticalOffset;
}

- (CGSize)unfocusedShadowExpansion
{
  double width;
  double height;
  CGSize result;

  width = self->_unfocusedShadowExpansion.width;
  height = self->_unfocusedShadowExpansion.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnfocusedShadowExpansion:(CGSize)a3
{
  self->_unfocusedShadowExpansion = a3;
}

- (CGSize)shadowExpansion
{
  double width;
  double height;
  CGSize result;

  width = self->_shadowExpansion.width;
  height = self->_shadowExpansion.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setShadowExpansion:(CGSize)a3
{
  self->_shadowExpansion = a3;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (CGRect)shadowContentsCenter
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_shadowContentsCenter.origin.x;
  y = self->_shadowContentsCenter.origin.y;
  width = self->_shadowContentsCenter.size.width;
  height = self->_shadowContentsCenter.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)controlState
{
  return self->_controlState;
}

- (_UIFloatingMotionConfiguration)contentMotion
{
  return self->_contentMotion;
}

- (int64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (void)setHighlightStyle:(int64_t)a3
{
  self->_highlightStyle = a3;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (void)setContentOpaque:(BOOL)a3
{
  self->_contentOpaque = a3;
}

- (BOOL)forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview
{
  return self->_forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview;
}

- (void)setForwardsSubviewIntrinsicContentSizeInvalidationsToSuperview:(BOOL)a3
{
  self->_forwardsSubviewIntrinsicContentSizeInvalidationsToSuperview = a3;
}

- (BOOL)scalesBackwards
{
  return self->_scalesBackwards;
}

- (BOOL)roundContentWhenDeselected
{
  return self->_roundContentWhenDeselected;
}

- (CGSize)asymmetricScaleFactor
{
  double width;
  double height;
  CGSize result;

  width = self->_asymmetricScaleFactor.width;
  height = self->_asymmetricScaleFactor.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)asymmetricFocusedSizeIncrease
{
  double width;
  double height;
  CGSize result;

  width = self->_asymmetricFocusedSizeIncrease.width;
  height = self->_asymmetricFocusedSizeIncrease.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)_disableOutsetShadowPath
{
  return self->__disableOutsetShadowPath;
}

- (void)set_disableOutsetShadowPath:(BOOL)a3
{
  self->__disableOutsetShadowPath = a3;
}

- (BOOL)showsHighContrastFocusIndicator
{
  return self->_showsHighContrastFocusIndicator;
}

- (double)highContrastFocusIndicatorCornerRadius
{
  return self->_highContrastFocusIndicatorCornerRadius;
}

- (CGPoint)highContrastFocusIndicatorOutset
{
  double x;
  double y;
  CGPoint result;

  x = self->_highContrastFocusIndicatorOutset.x;
  y = self->_highContrastFocusIndicatorOutset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setHighContrastFocusIndicatorOutset:(CGPoint)a3
{
  self->_highContrastFocusIndicatorOutset = a3;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (id)focusAnimationConfigurationHandler
{
  return self->_focusAnimationConfigurationHandler;
}

- (void)setFocusAnimationConfigurationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 704);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_focusAnimationConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_contentMotion, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_focusAnimationConfiguration, 0);
  objc_storeStrong((id *)&self->_contentMotionEffects, 0);
  objc_storeStrong((id *)&self->_highContrastFocusIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_visualEffectContainerView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_transformView, 0);
  objc_destroyWeak((id *)&self->_floatingContentViewDelegate);
}

@end
