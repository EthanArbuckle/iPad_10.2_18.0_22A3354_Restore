@implementation _UIPopoverShapeLayerChromeView

+ (double)cornerRadius
{
  return 13.0;
}

+ (double)arrowHeight
{
  return 13.0;
}

+ (double)arrowBase
{
  return 26.0;
}

+ (id)visualEffectGroupName
{
  return 0;
}

- (_UIPopoverShapeLayerChromeView)initWithFrame:(CGRect)a3
{
  _UIPopoverShapeLayerChromeView *v3;
  _UIPopoverShapeLayerView *v4;
  _UIPopoverShapeLayerView *shapeLayerMaskView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPopoverShapeLayerChromeView;
  v3 = -[_UIPopoverStandardChromeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_UIPopoverShapeLayerView);
    shapeLayerMaskView = v3->_shapeLayerMaskView;
    v3->_shapeLayerMaskView = v4;

  }
  return v3;
}

- (void)_createStrokeView
{
  _UIPopoverShapeLayerView *v3;
  _UIPopoverShapeLayerView *v4;
  _UIPopoverShapeLayerView *shapeLayerStrokeView;
  id v6;
  void *v7;
  id v8;
  id v9;

  v3 = [_UIPopoverShapeLayerView alloc];
  -[UIView bounds](self, "bounds");
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
  shapeLayerStrokeView = self->_shapeLayerStrokeView;
  self->_shapeLayerStrokeView = v4;

  -[UIView setAutoresizingMask:](self->_shapeLayerStrokeView, "setAutoresizingMask:", 18);
  -[UIView setUserInteractionEnabled:](self->_shapeLayerStrokeView, "setUserInteractionEnabled:", 0);
  -[UIView layer](self->_shapeLayerStrokeView, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineWidth:", 2.0);
  +[UIColor clearColor](UIColor, "clearColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setFillColor:", objc_msgSend(v6, "CGColor"));

  +[UITraitCollection systemTraitsAffectingColorAppearance](UITraitCollection, "systemTraitsAffectingColorAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UIView registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v7, sel__updateStrokeViewColor);

  -[_UIPopoverShapeLayerChromeView _updateStrokeViewColor](self, "_updateStrokeViewColor");
  -[UIView addSubview:](self, "addSubview:", self->_shapeLayerStrokeView);

}

- (void)_updateStrokeViewColor
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_shapeLayerStrokeView)
  {
    -[UIView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");

    v5 = v4 == 1000 || v4 == 2;
    v6 = 0.1;
    if (!v5)
      v6 = 0.16;
    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_shapeLayerStrokeView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_retainAutorelease(v7);
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

  }
}

- (double)minNonPinnedOffset
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
  if (v3 - 1 < 2)
  {
    -[UIView bounds](self, "bounds");
    goto LABEL_6;
  }
  if (v3 == 4 || (result = 0.0, v3 == 8))
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
LABEL_6:
    v7 = floor(v6 * 0.5);
    -[UIPopoverBackgroundView _customCornerRadius](self, "_customCornerRadius");
    return -(v7 - v8 + -15.0);
  }
  return result;
}

- (double)maxNonPinnedOffset
{
  unint64_t v3;
  double result;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
  if (v3 - 1 < 2)
  {
    -[UIView bounds](self, "bounds");
    goto LABEL_6;
  }
  if (v3 == 4 || (result = 0.0, v3 == 8))
  {
    -[UIView bounds](self, "bounds");
    v6 = v5;
LABEL_6:
    v7 = floor(v6 * 0.5);
    -[UIPopoverBackgroundView _customCornerRadius](self, "_customCornerRadius");
    return v7 - v8 + -15.0;
  }
  return result;
}

- (BOOL)usesImagesForShapeMasking
{
  return 0;
}

- (UIEdgeInsets)_shadowInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)_shadowOpacity
{
  return 0.0;
}

- (double)_shadowRadius
{
  return 0.0;
}

- (CGSize)_shadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)_shadowPath
{
  return 0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPopoverShapeLayerChromeView;
  -[UIPopoverBackgroundView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIPopoverShapeLayerChromeView _updateShapeLayerPath](self, "_updateShapeLayerPath");
}

- (void)setArrowDirection:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverShapeLayerChromeView;
  -[_UIPopoverStandardChromeView setArrowDirection:](&v4, sel_setArrowDirection_, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setArrowOffset:(double)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverShapeLayerChromeView;
  -[_UIPopoverStandardChromeView setArrowOffset:](&v4, sel_setArrowOffset_, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)_pinnedArrowSide
{
  unint64_t v3;
  double v4;
  int64_t v5;
  double v6;
  double v7;
  double v8;

  -[_UIPopoverStandardChromeView arrowOffset](self, "arrowOffset");
  if (!-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
    return 0;
  v3 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
  if (v3 - 1 >= 2)
  {
    if (v3 == 4 || v3 == 8)
    {
      -[_UIPopoverStandardChromeView arrowOffset](self, "arrowOffset");
      v5 = v4 < 0.0;
      -[_UIPopoverStandardChromeView arrowOffset](self, "arrowOffset");
      if (v6 > 0.0)
        return 3;
      return v5;
    }
    return 0;
  }
  -[_UIPopoverStandardChromeView arrowOffset](self, "arrowOffset");
  v5 = 4 * (v7 < 0.0);
  -[_UIPopoverStandardChromeView arrowOffset](self, "arrowOffset");
  if (v8 > 0.0)
    return 2;
  return v5;
}

- (id)createShapeLayerPath
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIPopoverShapePathProvider defaultProviderForIdiom:](_UIPopoverShapePathProvider, "defaultProviderForIdiom:", objc_msgSend(v3, "userInterfaceIdiom"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[_UIPopoverShapeLayerChromeView _pathParameters](self, "_pathParameters");
  v7[2] = v10;
  v7[3] = v11;
  v7[4] = v12;
  v7[5] = v13;
  v7[0] = v8;
  v7[1] = v9;
  objc_msgSend(v4, "generatePopoverPathForParameters:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateShapeLayerPath
{
  id v3;
  id v4;

  -[UIView layer](self->_shapeLayerMaskView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPopoverShapeLayerChromeView createShapeLayerPath](self, "createShapeLayerPath");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setPath:", objc_msgSend(v3, "CGPath"));

}

- (void)_configureEffectView
{
  UIVisualEffectView *v3;
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *blurView;
  _BOOL4 v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_blurView)
  {
    -[UIPopoverBackgroundView _updateChrome](self, "_updateChrome");
  }
  else
  {
    v3 = [UIVisualEffectView alloc];
    -[_UIPopoverShapeLayerChromeView backgroundEffect](self, "backgroundEffect");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[UIVisualEffectView initWithEffect:](v3, "initWithEffect:", v4);
    blurView = self->_blurView;
    self->_blurView = v5;

    v7 = -[UIPopoverBackgroundView _chromeHidden](self, "_chromeHidden");
    v8 = 1.0;
    if (v7)
      v8 = 0.0;
    -[UIView setAlpha:](self->_blurView, "setAlpha:", v8);
    -[UIVisualEffectView _setUseLiveMasking:](self->_blurView, "_setUseLiveMasking:", 1);
    -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView contentView](self->_blurView, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

    -[UIView setAutoresizingMask:](self->_blurView, "setAutoresizingMask:", 18);
    -[UIView bounds](self, "bounds");
    -[UIView setFrame:](self->_blurView, "setFrame:");
    objc_msgSend((id)objc_opt_class(), "visualEffectGroupName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend((id)objc_opt_class(), "visualEffectGroupName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setGroupName:](self->_blurView, "_setGroupName:", v12);

    }
  }
  -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_blurView, 0);
}

- (void)_removeEffectView
{
  UIVisualEffectView *blurView;

  -[UIView removeFromSuperview](self->_blurView, "removeFromSuperview");
  blurView = self->_blurView;
  self->_blurView = 0;

}

- (_UIPopoverShapePathParameters)_pathParameters
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _UIPopoverShapePathParameters *result;
  double v14;

  retstr->var0 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
  retstr->var1 = -[_UIPopoverShapeLayerChromeView _pinnedArrowSide](self, "_pinnedArrowSide");
  -[UIView bounds](self, "bounds");
  retstr->var2.origin.x = v5;
  retstr->var2.origin.y = v6;
  retstr->var2.size.width = v7;
  retstr->var2.size.height = v8;
  -[_UIPopoverStandardChromeView arrowOffset](self, "arrowOffset");
  retstr->var3 = v9;
  -[UIPopoverBackgroundView _customCornerRadius](self, "_customCornerRadius");
  retstr->var4 = v10;
  objc_msgSend((id)objc_opt_class(), "arrowHeight");
  retstr->var5 = v11;
  objc_msgSend((id)objc_opt_class(), "arrowBase");
  retstr->var6 = v12;
  retstr->var7 = 30.0;
  result = (_UIPopoverShapePathParameters *)-[UIView _currentScreenScale](self, "_currentScreenScale");
  retstr->var8 = v14;
  return result;
}

- (id)backgroundEffect
{
  int64_t backgroundStyle;
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;

  if (-[UIPopoverBackgroundView _backgroundBlurEffectStyle](self, "_backgroundBlurEffectStyle") == 1000)
  {
    backgroundStyle = self->_backgroundStyle;
    switch(backgroundStyle)
    {
      case 100:
        -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 1200;
        break;
      case 7:
        -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 99;
        break;
      case 6:
        -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = 0;
        break;
      default:
        v7 = 0;
        return v7;
    }
  }
  else
  {
    v6 = -[UIPopoverBackgroundView _backgroundBlurEffectStyle](self, "_backgroundBlurEffectStyle");
    -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
  }
  +[_UIPopoverBackgroundVisualEffect effectWithStyle:tint:](_UIPopoverBackgroundVisualEffect, "effectWithStyle:tint:", v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)backgroundStyle
{
  return self->_requestedBackgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_requestedBackgroundStyle = a3;
  -[_UIPopoverShapeLayerChromeView _updateBackgroundStyle](self, "_updateBackgroundStyle");
}

- (int64_t)_resolvedBackgroundStyle
{
  int64_t result;
  void *v4;
  uint64_t v5;

  result = self->_requestedBackgroundStyle;
  if ((unint64_t)(result - 8) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
      return 100;
    }
    else
    {
      -[UIView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceStyle");

      if (v5 == 2)
        return 7;
      else
        return 6;
    }
  }
  return result;
}

- (void)_updateBackgroundStyle
{
  int64_t v3;
  int64_t v4;
  void *v5;

  v3 = -[_UIPopoverShapeLayerChromeView _resolvedBackgroundStyle](self, "_resolvedBackgroundStyle");
  if (v3 != self->_backgroundStyle)
  {
    v4 = v3;
    self->_backgroundStyle = v3;
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if ((unint64_t)(v4 - 6) < 2 || v4 == 100)
        -[_UIPopoverShapeLayerChromeView _configureEffectView](self, "_configureEffectView");
      else
        -[_UIPopoverShapeLayerChromeView _removeEffectView](self, "_removeEffectView");
    }
  }
}

- (void)_loadNecessaryViews
{
  void *v3;
  _UIPopoverShapeLayerView *shapeLayerMaskView;
  void *v5;

  -[_UIPopoverShapeLayerChromeView _configureEffectView](self, "_configureEffectView");
  -[_UIPopoverShapeLayerChromeView _updateBackgroundStyle](self, "_updateBackgroundStyle");
  -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  shapeLayerMaskView = self->_shapeLayerMaskView;
  if (v3)
  {
    -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskView:", shapeLayerMaskView);

  }
  else
  {
    -[UIView setMaskView:](self, "setMaskView:", self->_shapeLayerMaskView);
  }
  -[_UIPopoverShapeLayerChromeView _updateShapeLayerPath](self, "_updateShapeLayerPath");
}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPopoverShapeLayerChromeView;
  -[UIView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __49___UIPopoverShapeLayerChromeView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shapeLayerStrokeView, 0);
  objc_storeStrong((id *)&self->_shapeLayerMaskView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
}

@end
