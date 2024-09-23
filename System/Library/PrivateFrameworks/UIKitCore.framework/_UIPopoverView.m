@implementation _UIPopoverView

+ (id)popoverViewContainingView:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (v3)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "superview");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
    }
    while (v4);
  }
  return v3;
}

- (_UIPopoverView)initWithFrame:(CGRect)a3 backgroundViewClass:(Class)a4
{
  return -[_UIPopoverView initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:](self, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", a4, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIPopoverView)initWithFrame:(CGRect)a3 backgroundViewClass:(Class)a4 embeddedInView:(BOOL)a5 contentExtendsOverArrow:(BOOL)a6
{
  double height;
  double width;
  double y;
  double x;
  _UIPopoverView *v13;
  _UIPopoverView *v14;
  uint64_t v15;
  UIPopoverBackgroundView *backgroundView;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIView *v24;
  uint64_t v25;
  UIView *contentView;
  UIView *v27;
  uint64_t v28;
  UIView *clipView;
  void *v30;
  _UIPopoverView *v31;
  void *v32;
  void *v33;
  id v34;
  void *v37;
  objc_super v38;
  _QWORD v39[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39[1] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPopoverView.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("backgroundViewClass"));

  }
  v38.receiver = self;
  v38.super_class = (Class)_UIPopoverView;
  v13 = -[UIView initWithFrame:](&v38, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_backgroundViewClass = a4;
    v15 = objc_msgSend([a4 alloc], "initWithFrame:", x, y, width, height);
    backgroundView = v14->_backgroundView;
    v14->_backgroundView = (UIPopoverBackgroundView *)v15;

    v14->_contentExtendsOverArrow = a6;
    -[objc_class cornerRadius](v14->_backgroundViewClass, "cornerRadius");
    v14->_customCornerRadius = v17;
    -[_UIPopoverView standardChromeView](v14, "standardChromeView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[UIView frame](v14, "frame");
      v20 = v19;
      +[_UIPopoverStandardChromeView contentViewInsets](_UIPopoverLegacyChromeView, "contentViewInsets");
      v22 = v21 + 44.0;
      +[_UIPopoverStandardChromeView contentViewInsets](_UIPopoverLegacyChromeView, "contentViewInsets");
      if (v20 <= v22 + v23)
      {
        -[UIPopoverBackgroundView setUseShortMode:](v14->_backgroundView, "setUseShortMode:", 1);
        -[UIPopoverBackgroundView setArrowOffset:](v14->_backgroundView, "setArrowOffset:", 0.0);
      }
    }
    v24 = [UIView alloc];
    -[UIPopoverBackgroundView _contentViewFrame](v14->_backgroundView, "_contentViewFrame");
    v25 = -[UIView initWithFrame:](v24, "initWithFrame:");
    contentView = v14->_contentView;
    v14->_contentView = (UIView *)v25;

    -[UIView _setContinuousCornerRadius:](v14->_contentView, "_setContinuousCornerRadius:", v14->_customCornerRadius);
    v14->_contentSize = (CGSize)*MEMORY[0x1E0C9D820];
    -[UIView _setOverrideVibrancyTrait:](v14->_contentView, "_setOverrideVibrancyTrait:", 1);
    -[UIView setClipsToBounds:](v14->_contentView, "setClipsToBounds:", 1);
    if (-[_UIPopoverView contentExtendsOverArrow](v14, "contentExtendsOverArrow"))
    {
      v27 = [UIView alloc];
      -[UIView bounds](v14, "bounds");
      v28 = -[UIView initWithFrame:](v27, "initWithFrame:");
      clipView = v14->_clipView;
      v14->_clipView = (UIView *)v28;

      -[UIView setClipsToBounds:](v14->_clipView, "setClipsToBounds:", 1);
      -[UIView addSubview:](v14, "addSubview:", v14->_clipView);
      -[UIView addSubview:](v14->_clipView, "addSubview:", v14->_backgroundView);
      -[UIView addSubview:](v14->_clipView, "addSubview:", v14->_contentView);
      -[_UIPopoverView standardChromeView](v14, "standardChromeView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setViewToMaskWhenContentExtendsOverArrow:", v14->_clipView);

      v31 = (_UIPopoverView *)v14->_clipView;
    }
    else
    {
      -[UIView addSubview:](v14, "addSubview:", v14->_backgroundView);
      -[UIView addSubview:](v14, "addSubview:", v14->_contentView);
      v31 = v14;
    }
    -[UIView layer](v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAllowsGroupOpacity:", 1);

    v39[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[UIView registerForTraitChanges:withHandler:](v14, "registerForTraitChanges:withHandler:", v33, &__block_literal_global_672);

  }
  return v14;
}

- (_UIPopoverView)initWithFrame:(CGRect)a3
{
  return -[_UIPopoverView initWithFrame:backgroundViewClass:](self, "initWithFrame:backgroundViewClass:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  UIPopoverBackgroundView *backgroundView;
  void *v7;
  UIView *contentView;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    if (self->_showsBackgroundComponentHighlights)
    {
      -[_UIPopoverView standardChromeView](self, "standardChromeView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDebugModeEnabled:", 1);

    }
    if (self->_showsBackgroundViewHighlight)
    {
      backgroundView = self->_backgroundView;
      +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.5, 0.5, 0.0, 0.5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](backgroundView, "setBackgroundColor:", v7);

    }
    if (self->_showsContentViewHighlight)
    {
      contentView = self->_contentView;
      +[UIColor grayColor](UIColor, "grayColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](contentView, "setBackgroundColor:", v9);

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35___UIPopoverView_willMoveToWindow___block_invoke;
    v12[3] = &unk_1E16B1B28;
    v12[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12, v10);
    v4 = v11;
  }

}

- (void)setShadowView:(id)a3
{
  _UIRoundedRectShadowView **p_shadowView;
  id v6;

  p_shadowView = &self->_shadowView;
  objc_storeStrong((id *)&self->_shadowView, a3);
  v6 = a3;
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_shadowView, 0);

}

- (UIEdgeInsets)safeAreaInsetsForContentView
{
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

  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsetsForContentView");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v9 + self->_animationOvershootHeight;
  v13 = v5;
  v14 = v7;
  v15 = v11;
  result.right = v15;
  result.bottom = v12;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)layoutSubviews
{
  UIView *clipView;
  UIPopoverBackgroundView *backgroundView;
  double v5;
  BOOL v6;
  UIView *v7;
  double width;
  double height;
  double v10;
  double v11;
  UIView *contentView;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[_UIPopoverView contentExtendsOverArrow](self, "contentExtendsOverArrow"))
  {
    clipView = self->_clipView;
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](clipView, "setFrame:");
  }
  backgroundView = self->_backgroundView;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](backgroundView, "setFrame:");
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v6 = *MEMORY[0x1E0C9D820] == self->_contentSize.width && v5 == self->_contentSize.height;
  if (v6 || !-[_UIPopoverView contentExtendsOverArrow](self, "contentExtendsOverArrow", *MEMORY[0x1E0C9D820], v5))
  {
    contentView = self->_contentView;
    -[UIPopoverBackgroundView _contentViewFrame](self->_backgroundView, "_contentViewFrame");
    v7 = contentView;
  }
  else
  {
    v7 = self->_contentView;
    width = self->_contentSize.width;
    height = self->_contentSize.height;
    v10 = 0.0;
    v11 = 0.0;
  }
  -[UIView setFrame:](v7, "setFrame:", v10, v11, width, height);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[UIView subviews](self->_contentView, "subviews", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[UIView bounds](self->_contentView, "bounds");
        objc_msgSend(v18, "setFrame:");
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  if (self->_shadowView)
  {
    -[UIView bounds](self, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    switch(-[_UIPopoverView arrowDirection](self, "arrowDirection"))
    {
      case 0uLL:
      case 2uLL:
        objc_msgSend((id)objc_opt_class(), "arrowHeight");
        v20 = v20 + 0.0;
        v22 = v22 + 0.0;
        goto LABEL_21;
      case 1uLL:
        objc_msgSend((id)objc_opt_class(), "arrowHeight");
        v20 = v20 + 0.0;
        v22 = v22 + v27;
LABEL_21:
        v26 = v26 - (v27 + 0.0);
        break;
      case 4uLL:
        objc_msgSend((id)objc_opt_class(), "arrowHeight");
        v20 = v20 + v28;
        goto LABEL_24;
      case 8uLL:
        objc_msgSend((id)objc_opt_class(), "arrowHeight");
        v20 = v20 + 0.0;
LABEL_24:
        v24 = v24 - (v28 + 0.0);
        v22 = v22 + 0.0;
        break;
      default:
        break;
    }
    -[_UIRoundedRectShadowView frameWithContentWithFrame:](self->_shadowView, "frameWithContentWithFrame:", v20, v22, v24, v26);
    -[UIView _setFrameIgnoringLayerTransform:](self->_shadowView, "_setFrameIgnoringLayerTransform:");
  }
}

- (int)_style
{
  return 1;
}

- (BOOL)_needsLayoutOnAnimatedFrameChangeForNewFrame:(CGRect)a3
{
  return 1;
}

- (id)contentView
{
  return self->_contentView;
}

- (id)backgroundView
{
  return self->_backgroundView;
}

- (id)standardChromeView
{
  UIPopoverBackgroundView *v3;

  if (self->_backgroundView && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = self->_backgroundView;
  else
    v3 = 0;
  return v3;
}

- (CGRect)_snapshotBounds
{
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
  double v16;
  double v17;
  double v18;
  void *v19;
  CGRect result;

  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[UIPopoverController _popoverControllerStyle](self->_popoverController, "_popoverControllerStyle") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPopoverView.m"), 232, CFSTR("-_snapshotBounds is only supported for popover views of slide style popover controllers"));

  }
  -[UIPopoverBackgroundView _shadowOffset](self->_backgroundView, "_shadowOffset");
  v13 = v12;
  -[UIPopoverBackgroundView _shadowRadius](self->_backgroundView, "_shadowRadius");
  v15 = v9 + v13 + v14;
  v16 = v5;
  v17 = v7;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v15;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)_setPopoverContentView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[UIView addSubview:](self->_contentView, "addSubview:", v9);
  if ((objc_msgSend(v9, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 9, 0, v9, 9, 1.0, 0.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 10, 0, v9, 10, 1.0, 0.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 7, 0, v9, 7, 1.0, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_contentView, 8, 0, v9, 8, 1.0, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v4);
  }

}

- (BOOL)_allowsCustomizationOfContent
{
  return 0;
}

- (void)setChromeHidden:(BOOL)a3
{
  self->_chromeHidden = a3;
  -[_UIPopoverView _updateAlphaForChromeHidden](self, "_updateAlphaForChromeHidden");
}

- (void)setChromeHiddenForSizeTransition:(BOOL)a3
{
  self->_chromeHiddenForSizeTransition = a3;
  -[_UIPopoverView _updateAlphaForChromeHidden](self, "_updateAlphaForChromeHidden");
}

- (void)_updateAlphaForChromeHidden
{
  double v2;

  v2 = 0.0;
  if (!self->_chromeHidden && !self->_chromeHiddenForSizeTransition)
    v2 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", v2);
}

- (double)arrowOffset
{
  double result;

  -[UIPopoverBackgroundView arrowOffset](self->_backgroundView, "arrowOffset");
  return result;
}

- (void)setArrowOffset:(double)a3
{
  -[UIPopoverBackgroundView setArrowOffset:](self->_backgroundView, "setArrowOffset:", a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (unint64_t)arrowDirection
{
  return -[UIPopoverBackgroundView arrowDirection](self->_backgroundView, "arrowDirection");
}

- (void)setArrowDirection:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  UIPopoverBackgroundView *v11;
  UIPopoverBackgroundView *backgroundView;
  UIPopoverBackgroundView *v13;
  _QWORD v14[5];
  UIPopoverBackgroundView *v15;

  if (-[UIPopoverBackgroundView arrowDirection](self->_backgroundView, "arrowDirection") != a3)
  {
    if (self->_backgroundView
      && (-[UIView window](self, "window"), (v5 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v6 = (void *)v5,
          -[_UIPopoverView standardChromeView](self, "standardChromeView"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      v8 = objc_alloc(self->_backgroundViewClass);
      -[UIView bounds](self, "bounds");
      v9 = (void *)objc_msgSend(v8, "initWithFrame:");
      -[_UIPopoverView arrowOffset](self, "arrowOffset");
      objc_msgSend(v9, "setArrowOffset:");
      objc_msgSend(v9, "setArrowDirection:", a3);
      objc_msgSend(v9, "setBackgroundStyle:", -[_UIPopoverView backgroundStyle](self, "backgroundStyle"));
      objc_msgSend(v9, "_setBackgroundBlurEffectStyle:", -[_UIPopoverView backgroundBlurEffectStyle](self, "backgroundBlurEffectStyle"));
      -[_UIPopoverView popoverBackgroundColor](self, "popoverBackgroundColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPopoverBackgroundColor:", v10);

      -[_UIPopoverView _customCornerRadius](self, "_customCornerRadius");
      objc_msgSend(v9, "_setCustomCornerRadius:");
      if (-[_UIPopoverView contentExtendsOverArrow](self, "contentExtendsOverArrow"))
        objc_msgSend(v9, "setViewToMaskWhenContentExtendsOverArrow:", self->_clipView);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __36___UIPopoverView_setArrowDirection___block_invoke;
      v14[3] = &unk_1E16B1B50;
      v14[4] = self;
      v11 = v9;
      v15 = v11;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v14);
      backgroundView = self->_backgroundView;
      self->_backgroundView = v11;
      v13 = v11;

    }
    else
    {
      -[UIPopoverBackgroundView setArrowDirection:](self->_backgroundView, "setArrowDirection:", a3);
    }
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (int64_t)backgroundStyle
{
  return -[UIPopoverBackgroundView backgroundStyle](self->_backgroundView, "backgroundStyle");
}

- (void)setBackgroundStyle:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37___UIPopoverView_setBackgroundStyle___block_invoke;
  v3[3] = &unk_1E16B1888;
  v3[4] = self;
  v3[5] = a3;
  -[_UIPopoverView _performBlockCheckingDefinesTintColor:](self, "_performBlockCheckingDefinesTintColor:", v3);
}

- (UIColor)popoverBackgroundColor
{
  void *v2;
  void *v3;

  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "popoverBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44___UIPopoverView_setPopoverBackgroundColor___block_invoke;
  v6[3] = &unk_1E16B1B50;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_UIPopoverView _performBlockCheckingDefinesTintColor:](self, "_performBlockCheckingDefinesTintColor:", v6);

}

- (UIColor)arrowBackgroundColor
{
  void *v2;
  void *v3;

  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrowBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setArrowBackgroundColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArrowBackgroundColor:", v4);

  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackgroundBlurEffectStyle:(int64_t)a3
{
  id v4;

  self->_backgroundBlurEffectStyle = a3;
  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setBackgroundBlurEffectStyle:", self->_backgroundBlurEffectStyle);

}

- (void)_setFrame:(CGRect)a3 arrowOffset:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  UIPopoverBackgroundView *v18;
  UIPopoverBackgroundView *backgroundView;
  UIPopoverBackgroundView *v20;
  id v21;
  _QWORD v22[5];
  UIPopoverBackgroundView *v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "usesImagesForShapeMasking"))
  {
    v13 = 0;
    if (objc_msgSend(v21, "useShortMode"))
    {
      +[_UIPopoverStandardChromeView contentViewInsets](_UIPopoverLegacyChromeView, "contentViewInsets");
      v11 = v10 + 44.0;
      +[_UIPopoverStandardChromeView contentViewInsets](_UIPopoverLegacyChromeView, "contentViewInsets");
      if (height > v11 + v12)
        v13 = 1;
    }
    if (objc_msgSend(v21, "isPinned")
      && (-[UIView frame](self, "frame"),
          v25.origin.x = x,
          v25.origin.y = y,
          v25.size.width = width,
          v25.size.height = height,
          !CGRectEqualToRect(v24, v25))
      && (objc_msgSend(v21, "arrowOffset"), vabdd_f64(a4, v14) >= 2.22044605e-16))
    {
      -[UIView _setFrameIgnoringLayerTransform:](self, "_setFrameIgnoringLayerTransform:", x, y, width, height);
    }
    else
    {
      -[UIView _setFrameIgnoringLayerTransform:](self, "_setFrameIgnoringLayerTransform:", x, y, width, height);
      if (!v13)
        goto LABEL_16;
    }
    v15 = objc_alloc(+[_UIPopoverStandardChromeView standardChromeViewClass](_UIPopoverStandardChromeView, "standardChromeViewClass"));
    -[UIView bounds](self, "bounds");
    v16 = (void *)objc_msgSend(v15, "initWithFrame:");
    objc_msgSend(v16, "setArrowOffset:", a4);
    objc_msgSend(v16, "setArrowDirection:", -[_UIPopoverView arrowDirection](self, "arrowDirection"));
    objc_msgSend(v16, "setBackgroundStyle:", -[_UIPopoverView backgroundStyle](self, "backgroundStyle"));
    objc_msgSend(v16, "_setBackgroundBlurEffectStyle:", -[_UIPopoverView backgroundBlurEffectStyle](self, "backgroundBlurEffectStyle"));
    -[_UIPopoverView popoverBackgroundColor](self, "popoverBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPopoverBackgroundColor:", v17);

    objc_msgSend(v16, "_setCustomCornerRadius:", self->_customCornerRadius);
    if (-[_UIPopoverView contentExtendsOverArrow](self, "contentExtendsOverArrow"))
      objc_msgSend(v16, "setViewToMaskWhenContentExtendsOverArrow:", self->_clipView);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __40___UIPopoverView__setFrame_arrowOffset___block_invoke;
    v22[3] = &unk_1E16B1B50;
    v22[4] = self;
    v18 = v16;
    v23 = v18;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v22);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v18;
    v20 = v18;

  }
  else
  {
    -[UIView _setFrameIgnoringLayerTransform:](self, "_setFrameIgnoringLayerTransform:", x, y, width, height);
  }
LABEL_16:
  -[_UIPopoverView setArrowOffset:](self, "setArrowOffset:", a4);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)_setCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", a3 + -1.0);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_setCustomCornerRadius:(double)a3
{
  if (self->_customCornerRadius != a3)
  {
    self->_customCornerRadius = a3;
    -[UIPopoverBackgroundView _setCustomCornerRadius:](self->_backgroundView, "_setCustomCornerRadius:");
    -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", self->_customCornerRadius);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_showArrow
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIPopoverBackgroundView _showArrow](self->_backgroundView, "_showArrow");
}

- (void)_hideArrow
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIPopoverBackgroundView _hideArrow](self->_backgroundView, "_hideArrow");
}

- (id)_traitCollectionForChildEnvironment:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIPopoverView;
  -[UIView _traitCollectionForChildEnvironment:](&v9, sel__traitCollectionForChildEnvironment_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIPopoverView popoverController](self, "popoverController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_managingSplitViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v4);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
  }
  return v4;
}

- (id)_normalInheritedTintColor
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_UIPopoverView;
  -[UIView _normalInheritedTintColor](&v14, sel__normalInheritedTintColor);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverView popoverBackgroundColor](self, "popoverBackgroundColor");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    goto LABEL_3;
  }
  -[_UIPopoverView standardChromeView](self, "standardChromeView");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_UIPopoverView standardChromeView](self, "standardChromeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "_resolvedBackgroundStyle");

    if (v10 == 100)
    {
      +[UIColor systemBlueColor](UIColor, "systemBlueColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v3;
      v12 = v11;
      if (v3 == v12)
      {

      }
      else
      {
        v5 = v12;
        if (!v3 || !v12)
        {

          goto LABEL_3;
        }
        v13 = objc_msgSend(v3, "isEqual:", v12);

        if (!v13)
          return v3;
      }
      +[UIColor _systemBlueColor2](UIColor, "_systemBlueColor2");
      v5 = v3;
      v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:

    }
  }
  return v3;
}

- (BOOL)_definesTintColor
{
  BOOL v3;
  void *v4;
  void *v5;
  objc_super v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIPopoverView;
  if (-[UIView _definesTintColor](&v8, sel__definesTintColor))
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverView;
  -[UIView _normalInheritedTintColor](&v7, sel__normalInheritedTintColor);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverView _normalInheritedTintColor](self, "_normalInheritedTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != v5;

  return v3;
}

- (void)_performBlockCheckingDefinesTintColor:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 v5;

  v4 = (void (**)(_QWORD))a3;
  v5 = -[_UIPopoverView _definesTintColor](self, "_definesTintColor");
  v4[2](v4);

  if (v5 != -[_UIPopoverView _definesTintColor](self, "_definesTintColor"))
    -[UIView _dispatchTintColorVisitorWithReasons:](self, 1);
}

- (BOOL)showsBackgroundComponentHighlights
{
  return self->_showsBackgroundComponentHighlights;
}

- (void)setShowsBackgroundComponentHighlights:(BOOL)a3
{
  self->_showsBackgroundComponentHighlights = a3;
}

- (BOOL)showsBackgroundViewHighlight
{
  return self->_showsBackgroundViewHighlight;
}

- (void)setShowsBackgroundViewHighlight:(BOOL)a3
{
  self->_showsBackgroundViewHighlight = a3;
}

- (BOOL)showsContentViewHighlight
{
  return self->_showsContentViewHighlight;
}

- (void)setShowsContentViewHighlight:(BOOL)a3
{
  self->_showsContentViewHighlight = a3;
}

- (double)_customCornerRadius
{
  return self->_customCornerRadius;
}

- (UIActionSheet)presentedActionSheet
{
  return self->_presentedActionSheet;
}

- (void)setPresentedActionSheet:(id)a3
{
  objc_storeStrong((id *)&self->_presentedActionSheet, a3);
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (void)setPopoverController:(id)a3
{
  self->_popoverController = (UIPopoverController *)a3;
}

- (BOOL)contentExtendsOverArrow
{
  return self->_contentExtendsOverArrow;
}

- (int64_t)backgroundBlurEffectStyle
{
  return self->_backgroundBlurEffectStyle;
}

- (BOOL)chromeHidden
{
  return self->_chromeHidden;
}

- (BOOL)chromeHiddenForSizeTransition
{
  return self->_chromeHiddenForSizeTransition;
}

- (_UIRoundedRectShadowView)shadowView
{
  return self->_shadowView;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (double)animationOvershootHeight
{
  return self->_animationOvershootHeight;
}

- (void)setAnimationOvershootHeight:(double)a3
{
  self->_animationOvershootHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_presentedActionSheet, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
