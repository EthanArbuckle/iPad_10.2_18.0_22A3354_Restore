@implementation _UIPopoverLegacyChromeView

+ (double)arrowHeight
{
  return 13.0;
}

+ (double)arrowBase
{
  return 37.0;
}

- (double)minNonPinnedOffset
{
  double v3;
  double v4;
  unint64_t v5;
  double result;
  double v7;
  double v8;
  double v9;

  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v4 = floor(v3 * 0.5);
  v5 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
  if (v5 - 1 < 2)
  {
    -[UIView bounds](self, "bounds");
    v8 = floor(v9 * 0.5) + -8.0 - v4;
    return -v8;
  }
  if (v5 == 4 || (result = 0.0, v5 == 8))
  {
    -[UIView bounds](self, "bounds");
    v8 = floor(v7 * 0.5) + -24.0 + 16.0 - v4 + -2.0;
    return -v8;
  }
  return result;
}

- (double)maxNonPinnedOffset
{
  double v3;
  double v4;
  unint64_t v5;
  double result;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend((id)objc_opt_class(), "arrowBase");
  v4 = floor(v3 * 0.5);
  v5 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");
  if (v5 - 1 < 2)
  {
    -[UIView bounds](self, "bounds");
    v8 = floor(v10 * 0.5);
    v9 = -8.0;
    return v8 + v9 - v4;
  }
  if (v5 == 4 || (result = 0.0, v5 == 8))
  {
    -[UIView bounds](self, "bounds");
    v8 = floor(v7 * 0.5);
    v9 = -10.0;
    return v8 + v9 - v4;
  }
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPopoverLegacyChromeView;
  -[UIView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45___UIPopoverLegacyChromeView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v4[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  }
}

- (void)_layoutArrowViewsUpOrDown
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double MidX;
  UIView *arrowView;
  double v11;
  UIView *maskView;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIView *leftCapView;
  double v21;
  UIView *rightCapView;
  double MaxX;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CATransform3D v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  -[UIView bounds](self->_arrowView, "bounds");
  v4 = v3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  -[UIView bounds](self, "bounds");
  MidX = CGRectGetMidX(v40);
  if (-[_UIPopoverLegacyChromeView isPinned](self, "isPinned"))
  {
    -[UIView setFrame:](self->_leftCapView, "setFrame:", 0.0, 0.0, v8 - v4, v6);
    arrowView = self->_arrowView;
    -[UIView frame](self->_leftCapView, "frame");
    -[UIView setFrame:](arrowView, "setFrame:", CGRectGetMaxX(v41), 0.0, v4, v6);
    -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
    if (v11 < 0.0)
    {
      maskView = self->_maskView;
      CATransform3DMakeScale(&v38, -1.0, 1.0, 1.0);
      CATransform3DGetAffineTransform(&v39, &v38);
      -[UIView setTransform:](maskView, "setTransform:", &v39);
    }
  }
  else
  {
    v13 = floor(MidX);
    -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
    if (v14 >= 0.0)
    {
      -[_UIPopoverLegacyChromeView maxNonPinnedOffset](self, "maxNonPinnedOffset");
      v19 = v18;
      -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
      if (v19 < v17)
        v17 = v19;
    }
    else
    {
      -[_UIPopoverLegacyChromeView minNonPinnedOffset](self, "minNonPinnedOffset");
      v16 = v15;
      -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
      if (v16 >= v17)
        v17 = v16;
    }
    -[UIView setFrame:](self->_arrowView, "setFrame:", v13 + v17 - floor(v4 * 0.5), 0.0, v4, v6);
    leftCapView = self->_leftCapView;
    -[UIView frame](self->_arrowView, "frame");
    -[UIView setFrame:](leftCapView, "setFrame:", 0.0, 0.0, v21, v6);
    rightCapView = self->_rightCapView;
    -[UIView frame](self->_arrowView, "frame");
    MaxX = CGRectGetMaxX(v42);
    -[UIView bounds](self, "bounds");
    v25 = v24 - v4;
    -[UIView frame](self->_leftCapView, "frame");
    -[UIView setFrame:](rightCapView, "setFrame:", MaxX, 0.0, v25 - v26, v6);
  }
  -[UIView frame](self->_arrowView, "frame");
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  +[_UIPopoverLegacyChromeView arrowHeight](_UIPopoverLegacyChromeView, "arrowHeight");
  v36 = v35;
  if (-[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection") == 2)
    v37 = v34 - v36;
  else
    v37 = v30;
  -[UIView setFrame:](self->_arrowBackgroundView, "setFrame:", v28, v37, v32, v36);
}

- (void)_layoutArrowViewsLeftOrRight
{
  double v3;
  double MaxY;
  double v5;
  double v6;
  double v7;
  double v8;
  double MidY;
  UIView *rightCapView;
  double MinY;
  UIView *leftCapView;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIView *v22;
  UIView *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UIView *maskView;
  CATransform3D v32;
  CGAffineTransform v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[UIView bounds](self->_arrowView, "bounds");
  MaxY = v3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  -[UIView bounds](self, "bounds");
  v8 = v7;
  -[UIView bounds](self, "bounds");
  MidY = CGRectGetMidY(v34);
  if (-[_UIPopoverStandardChromeView isRightArrowPinnedToTop](self, "isRightArrowPinnedToTop"))
  {
    -[UIView setFrame:](self->_arrowView, "setFrame:", 0.0, 0.0, v8, MaxY);
    rightCapView = self->_rightCapView;
    MinY = v6 - MaxY;
LABEL_16:
    v13 = MaxY;
    goto LABEL_17;
  }
  if (-[_UIPopoverStandardChromeView isRightArrowPinnedToBottom](self, "isRightArrowPinnedToBottom"))
  {
    -[UIView setFrame:](self->_arrowView, "setFrame:", 0.0, v6 - MaxY, v8, MaxY);
    leftCapView = self->_leftCapView;
    -[UIView frame](self->_arrowView, "frame");
    MinY = CGRectGetMinY(v35);
    v13 = 0.0;
    rightCapView = leftCapView;
LABEL_17:
    v14 = v8;
    goto LABEL_18;
  }
  if (!-[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode"))
  {
    v15 = floor(MidY);
    -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
    if (v16 >= 0.0)
    {
      -[_UIPopoverLegacyChromeView maxNonPinnedOffset](self, "maxNonPinnedOffset");
      v21 = v20;
      -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
      if (v21 < v19)
        v19 = v21;
    }
    else
    {
      -[_UIPopoverLegacyChromeView minNonPinnedOffset](self, "minNonPinnedOffset");
      v18 = v17;
      -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
      if (v18 >= v19)
        v19 = v18;
    }
    -[UIView setFrame:](self->_arrowView, "setFrame:", 0.0, v15 + v19 - floor(MaxY * 0.5), v8, MaxY);
    v22 = self->_leftCapView;
    -[UIView frame](self->_arrowView, "frame");
    -[UIView setFrame:](v22, "setFrame:", 0.0, 0.0, v8, CGRectGetMinY(v36));
    v23 = self->_rightCapView;
    -[UIView frame](self->_arrowView, "frame");
    MaxY = CGRectGetMaxY(v37);
    -[UIView frame](self->_arrowView, "frame");
    MinY = v6 - CGRectGetMaxY(v38);
    rightCapView = v23;
    goto LABEL_16;
  }
  rightCapView = self->_arrowView;
  v13 = 2.0;
  if (self->_blurView)
    v13 = 0.0;
  v14 = v8;
  MinY = MaxY;
LABEL_18:
  -[UIView setFrame:](rightCapView, "setFrame:", 0.0, v13, v14, MinY);
  -[UIView frame](self->_arrowView, "frame");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  +[_UIPopoverLegacyChromeView arrowHeight](_UIPopoverLegacyChromeView, "arrowHeight");
  -[UIView setFrame:](self->_arrowBackgroundView, "setFrame:", v27 - v30, v25, v30, v29);
  if (-[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection") == 4)
  {
    maskView = self->_maskView;
    CATransform3DMakeScale(&v32, -1.0, 1.0, 1.0);
    CATransform3DGetAffineTransform(&v33, &v32);
    -[UIView setTransform:](maskView, "setTransform:", &v33);
  }
}

- (void)_layoutArrowViewsNone
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *rightCapView;
  CGRect v8;
  CGRect v9;

  -[UIView bounds](self, "bounds");
  CGRectGetMidX(v8);
  UIRoundToViewScale(self);
  v4 = v3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  -[UIView setFrame:](self->_leftCapView, "setFrame:", 0.0, 0.0, v4);
  rightCapView = self->_rightCapView;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](rightCapView, "setFrame:", v4, 0.0, CGRectGetWidth(v9) - v4, v6);
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
  void *v11;
  _BOOL4 wasPinned;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  UIView *maskView;
  void *v18;
  objc_super v19;

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_blurView, "setFrame:");
  -[UIView bounds](self->_blurView, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView maskView](self->_blurView, "maskView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (-[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection") != -1)
  {
    wasPinned = self->_wasPinned;
    -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
    if (wasPinned != -[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
    {
      -[_UIPopoverLegacyChromeView _resetComponentViews](self, "_resetComponentViews");
      -[_UIPopoverLegacyChromeView _loadNecessaryViews](self, "_loadNecessaryViews");
    }
  }
  self->_wasPinned = -[_UIPopoverLegacyChromeView isPinned](self, "isPinned");
  switch(-[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection"))
  {
    case 0uLL:
      -[_UIPopoverLegacyChromeView _layoutArrowViewsNone](self, "_layoutArrowViewsNone");
      break;
    case 1uLL:
    case 2uLL:
      -[_UIPopoverLegacyChromeView _layoutArrowViewsUpOrDown](self, "_layoutArrowViewsUpOrDown");
      break;
    case 4uLL:
    case 8uLL:
      -[_UIPopoverLegacyChromeView _layoutArrowViewsLeftOrRight](self, "_layoutArrowViewsLeftOrRight");
      break;
    default:
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v14 = *MEMORY[0x1E0C99778];
      _NSFullMethodName();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "raise:format:", v14, CFSTR("%@: Cannot lay out popover chrome with unrecognized direction or UIPopoverArrowDirectionUnknown."), v15);

      break;
  }
  v19.receiver = self;
  v19.super_class = (Class)_UIPopoverLegacyChromeView;
  -[UIPopoverBackgroundView layoutSubviews](&v19, sel_layoutSubviews);
  -[_UIPopoverLegacyChromeView _updateBackgroundStyle](self, "_updateBackgroundStyle");
  -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    maskView = self->_maskView;
    -[UIVisualEffectView contentView](self->_blurView, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    -[UIView setFrame:](maskView, "setFrame:");

  }
}

- (double)arrowOffset
{
  BOOL v3;
  double result;
  objc_super v5;

  v3 = -[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode");
  result = 0.0;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPopoverLegacyChromeView;
    -[_UIPopoverStandardChromeView arrowOffset](&v5, sel_arrowOffset, 0.0);
  }
  return result;
}

- (void)setArrowOffset:(double)a3
{
  objc_super v5;

  if (!-[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPopoverLegacyChromeView;
    -[_UIPopoverStandardChromeView setArrowOffset:](&v5, sel_setArrowOffset_, a3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }
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

- (void)_updateChrome
{
  _BOOL4 v3;
  double v4;
  id v5;

  v3 = -[UIPopoverBackgroundView _chromeHidden](self, "_chromeHidden");
  v4 = 1.0;
  if (v3)
    v4 = 0.0;
  -[UIView setAlpha:](self->_blurView, "setAlpha:", v4);
  -[_UIPopoverLegacyChromeView backgroundEffect](self, "backgroundEffect");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UIVisualEffectView setEffect:](self->_blurView, "setEffect:", v5);

}

- (BOOL)useShortMode
{
  objc_super v4;

  if (-[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection") == 1
    || -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection") == 2)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIPopoverLegacyChromeView;
  return -[_UIPopoverStandardChromeView useShortMode](&v4, sel_useShortMode);
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

  if (self->_blurView)
  {
    -[_UIPopoverLegacyChromeView _updateChrome](self, "_updateChrome");
  }
  else
  {
    v3 = [UIVisualEffectView alloc];
    -[_UIPopoverLegacyChromeView backgroundEffect](self, "backgroundEffect");
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

- (id)backgroundEffect
{
  int64_t backgroundStyle;
  void *v3;
  uint64_t v4;
  void *v5;

  backgroundStyle = self->_backgroundStyle;
  switch(backgroundStyle)
  {
    case 100:
      -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 1200;
      break;
    case 7:
      -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 99;
      break;
    case 6:
      -[_UIPopoverStandardChromeView popoverBackgroundColor](self, "popoverBackgroundColor");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0;
      break;
    default:
      v5 = 0;
      return v5;
  }
  +[_UIPopoverBackgroundVisualEffect effectWithStyle:tint:](_UIPopoverBackgroundVisualEffect, "effectWithStyle:tint:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)backgroundStyle
{
  return self->_requestedBackgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_requestedBackgroundStyle = a3;
  -[_UIPopoverLegacyChromeView _updateBackgroundStyle](self, "_updateBackgroundStyle");
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
  UIView *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  UIView *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  _UIPopoverViewArtworkLoader *v24;

  v3 = -[_UIPopoverLegacyChromeView _resolvedBackgroundStyle](self, "_resolvedBackgroundStyle");
  if (v3 != self->_backgroundStyle)
  {
    v4 = v3;
    self->_backgroundStyle = v3;
    -[UIView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v24 = -[_UIPopoverViewArtworkLoader initWithBackgroundStyle:]([_UIPopoverViewArtworkLoader alloc], "initWithBackgroundStyle:", v4);
      v6 = self->_leftCapView;
      -[UIView directionSelector](v6, "directionSelector");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode");
      -[UIView traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPopoverViewArtworkLoader templateImageForDirection:shortArtwork:traitCollection:](v24, "templateImageForDirection:shortArtwork:traitCollection:", v7, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView layer](v6, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setContents:", objc_msgSend(v10, "CGImage"));

      v12 = self->_arrowView;
      -[UIView directionSelector](v12, "directionSelector");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode");
      -[UIView traitCollection](self, "traitCollection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPopoverViewArtworkLoader templateImageForDirection:shortArtwork:traitCollection:](v24, "templateImageForDirection:shortArtwork:traitCollection:", v13, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView layer](v12, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setContents:", objc_msgSend(v16, "CGImage"));

      v18 = self->_rightCapView;
      -[UIView directionSelector](v18, "directionSelector");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode");
      -[UIView traitCollection](self, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPopoverViewArtworkLoader templateImageForDirection:shortArtwork:traitCollection:](v24, "templateImageForDirection:shortArtwork:traitCollection:", v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView layer](v18, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setContents:", objc_msgSend(v22, "CGImage"));
      if ((unint64_t)(v4 - 6) < 2 || v4 == 100)
        -[_UIPopoverLegacyChromeView _configureEffectView](self, "_configureEffectView");
      else
        -[_UIPopoverLegacyChromeView _removeEffectView](self, "_removeEffectView");

    }
  }
}

- (void)_resetComponentViews
{
  UIView *leftCapView;
  UIView *rightCapView;
  UIView *arrowView;

  -[UIView removeFromSuperview](self->_leftCapView, "removeFromSuperview");
  leftCapView = self->_leftCapView;
  self->_leftCapView = 0;

  -[UIView removeFromSuperview](self->_rightCapView, "removeFromSuperview");
  rightCapView = self->_rightCapView;
  self->_rightCapView = 0;

  -[UIView removeFromSuperview](self->_arrowView, "removeFromSuperview");
  arrowView = self->_arrowView;
  self->_arrowView = 0;

}

- (void)_loadNecessaryViews
{
  objc_class *v3;
  UIView *v4;
  UIView *leftCapView;
  uint64_t v6;
  UIView *v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  objc_class *v15;
  uint64_t v16;
  double v17;
  UIView *v18;
  UIView *v19;
  UIView *v20;
  UIView *v21;
  void *v22;
  UIView *v23;
  UIView *arrowView;
  UIView *v25;
  UIView *v26;
  int64_t backgroundStyle;
  _UIPopoverLegacyChromeView *v28;
  UIView *v29;
  void *v30;
  _UIPopoverLegacyChromeView *v31;
  UIView *arrowBackgroundView;
  UIView *v33;
  UIView *v34;
  void *v35;
  void *v36;
  void *v37;
  UIView *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  _UIPopoverLegacyChromeView *v44;
  _UIPopoverLegacyChromeView *v45;
  void *v46;
  void *v47;
  UIView *v48;
  void *v49;
  UIView *v50;
  void *v51;
  UIView *rightCapView;
  void *v53;
  _UIPopoverViewArtworkLoader *v54;

  if (!-[_UIPopoverLegacyChromeView hasComponentViews](self, "hasComponentViews"))
  {
    v54 = -[_UIPopoverViewArtworkLoader initWithBackgroundStyle:]([_UIPopoverViewArtworkLoader alloc], "initWithBackgroundStyle:", self->_backgroundStyle);
    switch(-[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection"))
    {
      case 0uLL:
        -[_UIPopoverViewArtworkLoader bottomArrowLeftEndCapView](v54, "bottomArrowLeftEndCapView");
        v4 = (UIView *)objc_claimAutoreleasedReturnValue();
        leftCapView = self->_leftCapView;
        self->_leftCapView = v4;

        -[_UIPopoverViewArtworkLoader bottomArrowRightEndCapView](v54, "bottomArrowRightEndCapView");
        v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v6 = 568;
        goto LABEL_23;
      case 1uLL:
        -[_UIPopoverViewArtworkLoader topArrowLeftEndCapView](v54, "topArrowLeftEndCapView");
        v7 = (UIView *)objc_claimAutoreleasedReturnValue();
        v8 = self->_leftCapView;
        self->_leftCapView = v7;

        -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
        if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
        {
          -[_UIPopoverViewArtworkLoader topArrowPinnedView](v54, "topArrowPinnedView");
          v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        -[_UIPopoverViewArtworkLoader topArrowView](v54, "topArrowView");
        v23 = (UIView *)objc_claimAutoreleasedReturnValue();
        arrowView = self->_arrowView;
        self->_arrowView = v23;

        -[_UIPopoverViewArtworkLoader topArrowRightEndCapView](v54, "topArrowRightEndCapView");
        v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 2uLL:
        -[_UIPopoverViewArtworkLoader bottomArrowLeftEndCapView](v54, "bottomArrowLeftEndCapView");
        v9 = (UIView *)objc_claimAutoreleasedReturnValue();
        v10 = self->_leftCapView;
        self->_leftCapView = v9;

        -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
        if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
        {
          -[_UIPopoverViewArtworkLoader bottomArrowPinnedView](v54, "bottomArrowPinnedView");
          v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        -[_UIPopoverViewArtworkLoader bottomArrowView](v54, "bottomArrowView");
        v25 = (UIView *)objc_claimAutoreleasedReturnValue();
        v26 = self->_arrowView;
        self->_arrowView = v25;

        -[_UIPopoverViewArtworkLoader bottomArrowRightEndCapView](v54, "bottomArrowRightEndCapView");
        v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      case 4uLL:
      case 8uLL:
        if (-[_UIPopoverLegacyChromeView useShortMode](self, "useShortMode"))
        {
          -[_UIPopoverViewArtworkLoader shortRightArrowView](v54, "shortRightArrowView");
          v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
LABEL_10:
          v6 = 552;
        }
        else
        {
          -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
          if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:")
            && (-[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset"), v14 < 0.0))
          {
            -[_UIPopoverViewArtworkLoader rightArrowPinnedTopView](v54, "rightArrowPinnedTopView");
            v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v16 = 552;
          }
          else
          {
            -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
            if (-[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:"))
            {
              -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
              if (v17 > 0.0)
              {
                -[_UIPopoverViewArtworkLoader rightArrowPinnedBottomView](v54, "rightArrowPinnedBottomView");
                v18 = (UIView *)objc_claimAutoreleasedReturnValue();
                v19 = self->_arrowView;
                self->_arrowView = v18;

                -[_UIPopoverViewArtworkLoader rightArrowTopEndCapView](v54, "rightArrowTopEndCapView");
                v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
                v6 = 560;
                goto LABEL_23;
              }
            }
            -[_UIPopoverViewArtworkLoader rightArrowView](v54, "rightArrowView");
            v20 = (UIView *)objc_claimAutoreleasedReturnValue();
            v21 = self->_arrowView;
            self->_arrowView = v20;

            -[_UIPopoverViewArtworkLoader rightArrowTopEndCapView](v54, "rightArrowTopEndCapView");
            v15 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v16 = 560;
          }
          v22 = *(Class *)((char *)&self->super.super.super.super.super.isa + v16);
          *(Class *)((char *)&self->super.super.super.super.super.isa + v16) = v15;

          -[_UIPopoverViewArtworkLoader rightArrowBottomEndCapView](v54, "rightArrowBottomEndCapView");
          v3 = (objc_class *)objc_claimAutoreleasedReturnValue();
LABEL_22:
          v6 = 568;
        }
LABEL_23:
        v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v6);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = v3;
LABEL_24:

        backgroundStyle = self->_backgroundStyle;
        if ((unint64_t)(backgroundStyle - 6) < 2 || backgroundStyle == 100)
        {
          v28 = self;
          -[_UIPopoverLegacyChromeView _configureEffectView](v28, "_configureEffectView");
          -[UIView bounds](v28, "bounds");
          -[UIView setFrame:](v28->_blurView, "setFrame:");
          v29 = [UIView alloc];
          -[UIVisualEffectView contentView](v28->_blurView, "contentView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "frame");
          v31 = -[UIView initWithFrame:](v29, "initWithFrame:");

          -[UIView setUserInteractionEnabled:](v31, "setUserInteractionEnabled:", 0);
          arrowBackgroundView = v28->_arrowBackgroundView;
          if (!arrowBackgroundView)
          {
            v33 = objc_alloc_init(UIView);
            v34 = v28->_arrowBackgroundView;
            v28->_arrowBackgroundView = v33;

            arrowBackgroundView = v28->_arrowBackgroundView;
          }
          -[UIView superview](arrowBackgroundView, "superview");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIVisualEffectView contentView](v28->_blurView, "contentView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35 != v36)
          {
            -[UIVisualEffectView contentView](v28->_blurView, "contentView");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addSubview:", v28->_arrowBackgroundView);

          }
          v38 = v28->_arrowBackgroundView;
          -[_UIPopoverStandardChromeView arrowBackgroundColor](v28, "arrowBackgroundColor");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v39);

          v40 = 1;
        }
        else
        {
          v31 = self;
          v40 = 0;
        }
        -[UIView superview](self->_arrowView, "superview");
        v41 = objc_claimAutoreleasedReturnValue();
        if ((_UIPopoverLegacyChromeView *)v41 == v31)
        {

        }
        else
        {
          v42 = (void *)v41;
          v43 = -[_UIPopoverStandardChromeView arrowDirection](self, "arrowDirection");

          if (v43)
            -[UIView addSubview:](v31, "addSubview:", self->_arrowView);
        }
        -[UIView superview](self->_leftCapView, "superview");
        v44 = (_UIPopoverLegacyChromeView *)objc_claimAutoreleasedReturnValue();

        if (v44 != v31)
          -[UIView addSubview:](v31, "addSubview:", self->_leftCapView);
        -[UIView superview](self->_rightCapView, "superview");
        v45 = (_UIPopoverLegacyChromeView *)objc_claimAutoreleasedReturnValue();

        if (v45 != v31)
          -[UIView addSubview:](v31, "addSubview:", self->_rightCapView);
        if (v40)
        {
          -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            -[_UIPopoverStandardChromeView viewToMaskWhenContentExtendsOverArrow](self, "viewToMaskWhenContentExtendsOverArrow");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setMaskView:", v31);

          }
          else
          {
            -[UIView setMaskView:](self->_blurView, "setMaskView:", v31);
          }
        }
        objc_storeStrong((id *)&self->_maskView, v31);
        if (-[_UIPopoverStandardChromeView isDebugModeEnabled](self, "isDebugModeEnabled"))
        {
          v48 = self->_arrowView;
          +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 0.0, 0.0, 0.5);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v48, "setBackgroundColor:", v49);

          v50 = self->_leftCapView;
          +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 1.0, 0.0, 0.5);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](v50, "setBackgroundColor:", v51);

          rightCapView = self->_rightCapView;
          +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.5);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView setBackgroundColor:](rightCapView, "setBackgroundColor:", v53);

        }
        break;
      default:
        v11 = (void *)MEMORY[0x1E0C99DA0];
        v12 = *MEMORY[0x1E0C99778];
        _NSFullMethodName();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "raise:format:", v12, CFSTR("%@: Cannot load popover chrome with unrecognized direction or UIPopoverArrowDirectionUnknown."), v13);
        goto LABEL_24;
    }
  }
}

- (BOOL)hasComponentViews
{
  return self->_arrowView || self->_leftCapView || self->_rightCapView != 0;
}

- (BOOL)isPinned
{
  _BOOL4 v3;
  UIView *rightCapView;
  BOOL v5;
  BOOL v6;
  _BOOL8 v7;

  -[_UIPopoverLegacyChromeView arrowOffset](self, "arrowOffset");
  v3 = -[_UIPopoverStandardChromeView wouldPinForOffset:](self, "wouldPinForOffset:");
  if (v3)
  {
    if (self->_arrowView)
    {
      rightCapView = self->_rightCapView;
      v5 = self->_leftCapView == 0;
      v6 = rightCapView == 0;
      if (rightCapView)
        LOBYTE(v7) = 1;
      else
        v7 = self->_leftCapView == 0;
      if (v6)
        v5 = 0;
      LOBYTE(v3) = !v7 || v5;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)setPopoverBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  UIVisualEffectView *blurView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIPopoverLegacyChromeView;
  v4 = a3;
  -[_UIPopoverStandardChromeView setPopoverBackgroundColor:](&v8, sel_setPopoverBackgroundColor_, v4);
  if (self->_blurView)
  {
    -[_UIPopoverLegacyChromeView backgroundEffect](self, "backgroundEffect", v8.receiver, v8.super_class);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_blurView, "setEffect:", v5);
    self->_popoverBackgroundColorIsOpaque = objc_msgSend(v5, "tintColorIsTranslucent") ^ 1;

    blurView = self->_blurView;
  }
  else
  {
    blurView = 0;
  }
  -[UIVisualEffectView contentView](blurView, "contentView", v8.receiver, v8.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v4);

}

- (void)setArrowBackgroundColor:(id)a3
{
  id v4;
  UIView *arrowBackgroundView;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_UIPopoverLegacyChromeView;
  -[_UIPopoverStandardChromeView setArrowBackgroundColor:](&v6, sel_setArrowBackgroundColor_, v4);
  arrowBackgroundView = self->_arrowBackgroundView;
  if (arrowBackgroundView)
    -[UIView setBackgroundColor:](arrowBackgroundView, "setBackgroundColor:", v4);

}

- (UIView)arrowView
{
  return self->_arrowView;
}

- (UIView)leftCapView
{
  return self->_leftCapView;
}

- (UIView)rightCapView
{
  return self->_rightCapView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCapView, 0);
  objc_storeStrong((id *)&self->_leftCapView, 0);
  objc_storeStrong((id *)&self->_arrowView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
}

@end
