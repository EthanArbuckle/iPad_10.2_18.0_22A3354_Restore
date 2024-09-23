@implementation PBUIWallpaperEffectViewBase

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
  BOOL v12;
  CGRect v13;
  CGRect v14;

  -[PBUIWallpaperEffectViewBase bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_blurMaskingContainer, "setFrame:");
  -[UIView setFrame:](self->_tintMaskingContainer, "setFrame:", v4, v6, v8, v10);
  -[UIImageView setFrame:](self->_maskImageView, "setFrame:", v4, v6, v8, v10);
  if (!self->_shouldMatchWallpaperPosition)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "deviceClass") != 2)
  {
    -[PBUIFakeBluring bounds](self->_blurView, "bounds");
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    v12 = CGRectEqualToRect(v13, v14);

    if (v12)
      goto LABEL_7;
LABEL_6:
    -[PBUIFakeBluring setFrame:](self->_blurView, "setFrame:", v4, v6, v8, v10);
    -[PBUIFakeBluring setFrame:](self->_transitionBlurView, "setFrame:", v4, v6, v8, v10);
    goto LABEL_7;
  }

LABEL_7:
  -[UIView setFrame:](self->_grayscaleTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_colorTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_transitionGrayscaleTintView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_transitionColorTintView, "setFrame:", v4, v6, v8, v10);
}

- (void)willMoveToWindow:(id)a3
{
  -[PBUIWallpaperEffectViewBase offsetWallpaperBy:](self, "offsetWallpaperBy:", a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)offsetWallpaperBy:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[PBUIFakeBluring offsetWallpaperBy:](self->_blurView, "offsetWallpaperBy:");
  -[PBUIFakeBluring offsetWallpaperBy:](self->_transitionBlurView, "offsetWallpaperBy:", x, y);
}

- (void)_configureFromScratch
{
  _BOOL8 v3;
  void *v4;
  char v5;
  void *v6;
  PBUIFakeBluring *v7;
  PBUIFakeBluring *blurView;
  unint64_t startStyle;
  void *v10;
  char v11;
  void *v12;
  PBUIFakeBluring *v13;
  PBUIFakeBluring *transitionBlurView;
  unint64_t endStyle;

  v3 = -[PBUIWallpaperEffectViewBase _shouldEffectivelyMatchWallpaperPosition](self, "_shouldEffectivelyMatchWallpaperPosition");
  if (-[PBUIWallpaperEffectViewBase _needsBlurViewForStyle:](self, "_needsBlurViewForStyle:", self->_startStyle)
    && (-[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    if (!self->_blurView)
    {
      -[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PBUIFakeBluring *)objc_msgSend(v6, "newFakeBlurViewForVariant:style:transformOptions:", self->_variant, self->_startStyle, self->_transformOptions);
      blurView = self->_blurView;
      self->_blurView = v7;

      -[PBUIFakeBluring setObserver:](self->_blurView, "setObserver:", self);
      -[PBUIFakeBluring setShouldMatchWallpaperPosition:](self->_blurView, "setShouldMatchWallpaperPosition:", v3);
    }
    startStyle = self->_startStyle;
    if (_WallpaperStyleHasTint(startStyle) && self->_shouldMaskTint != self->_shouldMaskBlur)
      startStyle = _WallpaperStyleByRemovingTintFromStyle(self->_startStyle);
    -[PBUIFakeBluring requestStyle:](self->_blurView, "requestStyle:", startStyle);
  }
  else
  {
    -[PBUIFakeBluring setObserver:](self->_blurView, "setObserver:", 0);
    -[PBUIFakeBluring removeFromSuperview](self->_blurView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setBlurView:](self, "setBlurView:", 0);
  }
  if (self->_startStyle != self->_endStyle
    && -[PBUIWallpaperEffectViewBase _needsBlurViewForStyle:](self, "_needsBlurViewForStyle:")
    && (-[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    if (!self->_transitionBlurView)
    {
      -[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (PBUIFakeBluring *)objc_msgSend(v12, "newFakeBlurViewForVariant:style:transformOptions:", self->_variant, self->_endStyle, self->_transformOptions);
      transitionBlurView = self->_transitionBlurView;
      self->_transitionBlurView = v13;

      -[PBUIFakeBluring setObserver:](self->_transitionBlurView, "setObserver:", self);
      -[PBUIFakeBluring setShouldMatchWallpaperPosition:](self->_transitionBlurView, "setShouldMatchWallpaperPosition:", v3);
    }
    endStyle = self->_endStyle;
    if (_WallpaperStyleHasTint(endStyle) && self->_shouldMaskTint != self->_shouldMaskBlur)
      endStyle = _WallpaperStyleByRemovingTintFromStyle(self->_endStyle);
    -[PBUIFakeBluring requestStyle:](self->_transitionBlurView, "requestStyle:", endStyle);
  }
  else
  {
    -[PBUIFakeBluring setObserver:](self->_transitionBlurView, "setObserver:", 0);
    -[PBUIFakeBluring removeFromSuperview](self->_transitionBlurView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setTransitionBlurView:](self, "setTransitionBlurView:", 0);
  }
  -[PBUIWallpaperEffectViewBase _configureForCurrentBlurStyle](self, "_configureForCurrentBlurStyle");
}

- (PBUIWallpaperPresenting)wallpaperPresenter
{
  return self->_wallpaperPresenter;
}

- (void)setTransitionBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionBlurView, a3);
}

- (BOOL)_shouldEffectivelyMatchWallpaperPosition
{
  return (-[PBUIWallpaperEffectViewBase isHidden](self, "isHidden") & 1) == 0 && self->_shouldMatchWallpaperPosition;
}

- (BOOL)_needsBlurViewForStyle:(int64_t)a3
{
  if (self->_forcesOpaque)
    return 1;
  else
    return _WallpaperStyleHasBlur(a3);
}

- (void)_configureForCurrentBlurStyle
{
  _BOOL4 shouldMaskBlur;
  _BOOL4 v4;
  _BOOL4 shouldMaskTint;
  UIImageView *maskImageView;
  UIImageView *v7;
  UIImageView *v8;
  UIView *tintMaskingContainer;
  _SBMaskingContainerView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  UIView *blurMaskingContainer;
  _SBMaskingContainerView *v16;
  UIView *v17;
  void *v18;
  void *v19;
  void *v20;

  shouldMaskBlur = self->_shouldMaskBlur;
  v4 = !self->_shouldMaskTint;
  if (self->_shouldMaskBlur)
  {
    shouldMaskTint = self->_shouldMaskTint;
  }
  else
  {
    if (!self->_shouldMaskTint)
    {
      -[UIImageView removeFromSuperview](self->_maskImageView, "removeFromSuperview");
      -[PBUIWallpaperEffectViewBase setMaskImageView:](self, "setMaskImageView:", 0);
      LOBYTE(v4) = 0;
      shouldMaskTint = 0;
      goto LABEL_14;
    }
    shouldMaskTint = 0;
    v4 = 0;
  }
  maskImageView = self->_maskImageView;
  if (!maskImageView)
  {
    v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0CEA658]);
    v8 = self->_maskImageView;
    self->_maskImageView = v7;

    maskImageView = self->_maskImageView;
  }
  -[UIImageView setImage:](maskImageView, "setImage:", self->_maskImage);
  if (shouldMaskBlur)
  {
LABEL_14:
    -[UIView removeFromSuperview](self->_tintMaskingContainer, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setTintMaskingContainer:](self, "setTintMaskingContainer:", 0);
    if (!v4)
      goto LABEL_11;
LABEL_15:
    blurMaskingContainer = self->_blurMaskingContainer;
    if (!blurMaskingContainer)
    {
      v16 = objc_alloc_init(_SBMaskingContainerView);
      v17 = self->_blurMaskingContainer;
      self->_blurMaskingContainer = &v16->super;

      blurMaskingContainer = self->_blurMaskingContainer;
    }
    -[PBUIWallpaperEffectViewBase insertSubview:atIndex:](self, "insertSubview:atIndex:", blurMaskingContainer, 0);
    -[UIView layer](self->_blurMaskingContainer, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView layer](self->_maskImageView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMask:", v19);

    if (!shouldMaskTint)
      goto LABEL_12;
LABEL_18:
    -[PBUIWallpaperEffectViewBase layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView layer](self->_maskImageView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMask:", v20);

    goto LABEL_19;
  }
  tintMaskingContainer = self->_tintMaskingContainer;
  if (!tintMaskingContainer)
  {
    v10 = objc_alloc_init(_SBMaskingContainerView);
    v11 = self->_tintMaskingContainer;
    self->_tintMaskingContainer = &v10->super;

    tintMaskingContainer = self->_tintMaskingContainer;
  }
  -[PBUIWallpaperEffectViewBase insertSubview:atIndex:](self, "insertSubview:atIndex:", tintMaskingContainer, 0);
  -[UIView layer](self->_tintMaskingContainer, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView layer](self->_maskImageView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMask:", v13);

  if (v4)
    goto LABEL_15;
LABEL_11:
  -[UIView removeFromSuperview](self->_blurMaskingContainer, "removeFromSuperview");
  -[PBUIWallpaperEffectViewBase setBlurMaskingContainer:](self, "setBlurMaskingContainer:", 0);
  if (shouldMaskTint)
    goto LABEL_18;
LABEL_12:
  -[PBUIWallpaperEffectViewBase layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMask:", 0);
LABEL_19:

  -[PBUIWallpaperEffectViewBase _configureViews](self, "_configureViews");
  -[PBUIWallpaperEffectViewBase _setTransitionFraction:](self, "_setTransitionFraction:", self->_transitionFraction);
}

- (void)setTintMaskingContainer:(id)a3
{
  objc_storeStrong((id *)&self->_tintMaskingContainer, a3);
}

- (void)setMaskImageView:(id)a3
{
  objc_storeStrong((id *)&self->_maskImageView, a3);
}

- (void)setBlurMaskingContainer:(id)a3
{
  objc_storeStrong((id *)&self->_blurMaskingContainer, a3);
}

- (void)_configureViews
{
  PBUIWallpaperEffectViewBase *blurMaskingContainer;
  PBUIFakeBluring *transitionBlurView;
  PBUIFakeBluring *blurView;
  unint64_t endStyle;
  PBUIWallpaperEffectViewBase *v7;

  blurMaskingContainer = (PBUIWallpaperEffectViewBase *)self->_blurMaskingContainer;
  if (!blurMaskingContainer)
    blurMaskingContainer = self;
  v7 = blurMaskingContainer;
  transitionBlurView = self->_transitionBlurView;
  if (transitionBlurView)
    -[PBUIWallpaperEffectViewBase insertSubview:atIndex:](v7, "insertSubview:atIndex:", transitionBlurView, 0);
  blurView = self->_blurView;
  if (blurView)
    -[PBUIWallpaperEffectViewBase insertSubview:atIndex:](v7, "insertSubview:atIndex:", blurView, 0);
  if (_WallpaperStyleHasTint(self->_startStyle)
    && (_WallpaperStyleHasTint(-[PBUIFakeBluring effectiveStyle](self->_blurView, "effectiveStyle")) & 1) == 0)
  {
    -[PBUIWallpaperEffectViewBase _configureGrayscaleAndColorTintViewForStartStyle:](self, "_configureGrayscaleAndColorTintViewForStartStyle:", 1);
  }
  else
  {
    -[UIView removeFromSuperview](self->_grayscaleTintView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setGrayscaleTintView:](self, "setGrayscaleTintView:", 0);
    -[UIView removeFromSuperview](self->_colorTintView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setColorTintView:](self, "setColorTintView:", 0);
  }
  endStyle = self->_endStyle;
  if (self->_startStyle == endStyle
    || !_WallpaperStyleHasTint(endStyle)
    || _WallpaperStyleHasTint(-[PBUIFakeBluring effectiveStyle](self->_transitionBlurView, "effectiveStyle"))
    && self->_endStyle != 2)
  {
    -[UIView removeFromSuperview](self->_transitionGrayscaleTintView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setTransitionGrayscaleTintView:](self, "setTransitionGrayscaleTintView:", 0);
    -[UIView removeFromSuperview](self->_transitionColorTintView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setTransitionColorTintView:](self, "setTransitionColorTintView:", 0);
  }
  else
  {
    -[PBUIWallpaperEffectViewBase _configureGrayscaleAndColorTintViewForStartStyle:](self, "_configureGrayscaleAndColorTintViewForStartStyle:", 0);
  }

}

- (void)setTransitionGrayscaleTintView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionGrayscaleTintView, a3);
}

- (void)setTransitionColorTintView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionColorTintView, a3);
}

- (void)setGrayscaleTintView:(id)a3
{
  objc_storeStrong((id *)&self->_grayscaleTintView, a3);
}

- (void)setColorTintView:(id)a3
{
  objc_storeStrong((id *)&self->_colorTintView, a3);
}

- (PBUIWallpaperEffectViewBase)initWithWallpaperPresenter:(id)a3 variant:(int64_t)a4 transformOptions:(unint64_t)a5
{
  id v9;
  PBUIWallpaperEffectViewBase *v10;
  PBUIWallpaperEffectViewBase *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UIColor *wallpaperAverageColor;
  void *v17;
  objc_super v19;

  v9 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PBUIWallpaperEffectViewBase;
  v10 = -[PBUIWallpaperEffectViewBase initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_wallpaperPresenter, a3);
    v11->_startStyle = -1;
    v11->_variant = a4;
    v11->_transformOptions = a5;
    -[PBUIWallpaperEffectViewBase setClipsToBounds:](v11, "setClipsToBounds:", 1);
    -[PBUIWallpaperEffectViewBase layer](v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAllowsEdgeAntialiasing:", 0);

    -[PBUIWallpaperEffectViewBase layer](v11, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupOpacity:", 1);

    objc_msgSend(v9, "legibilitySettingsForVariant:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentColor");
    v15 = objc_claimAutoreleasedReturnValue();
    wallpaperAverageColor = v11->_wallpaperAverageColor;
    v11->_wallpaperAverageColor = (UIColor *)v15;

    objc_msgSend(v9, "addObserver:forVariant:", v11, v11->_variant);
    -[PBUIWallpaperEffectViewBase setShouldMatchWallpaperPosition:](v11, "setShouldMatchWallpaperPosition:", 1);
    v11->_accessibilityReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v11, sel__accessibilityReduceTransparencyChanged_, *MEMORY[0x1E0CEB098], 0);

  }
  return v11;
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  if (self->_shouldMatchWallpaperPosition != a3)
  {
    self->_shouldMatchWallpaperPosition = a3;
    -[PBUIWallpaperEffectViewBase _configureViewsPositioning](self, "_configureViewsPositioning");
  }
}

- (void)_configureViewsPositioning
{
  _BOOL8 v3;

  v3 = -[PBUIWallpaperEffectViewBase shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
  -[PBUIFakeBluring setShouldMatchWallpaperPosition:](self->_blurView, "setShouldMatchWallpaperPosition:", v3);
  -[PBUIFakeBluring setShouldMatchWallpaperPosition:](self->_transitionBlurView, "setShouldMatchWallpaperPosition:", v3);
  if (!v3)
    -[PBUIWallpaperEffectViewBase offsetWallpaperBy:](self, "offsetWallpaperBy:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (void)setFullscreen:(BOOL)a3
{
  -[PBUIWallpaperEffectViewBase setShouldMatchWallpaperPosition:](self, "setShouldMatchWallpaperPosition:", !a3);
}

- (void)_setTransitionFraction:(double)a3
{
  double v4;
  PBUIFakeBluring *blurView;
  double v6;

  self->_transitionFraction = a3;
  if (self->_startStyle == self->_endStyle)
    v4 = 0.0;
  else
    v4 = a3;
  blurView = self->_blurView;
  if (blurView && self->_transitionBlurView)
  {
    -[PBUIFakeBluring setAlpha:](blurView, "setAlpha:", 1.0);
    -[PBUIFakeBluring setAlpha:](self->_transitionBlurView, "setAlpha:", v4);
    v6 = 1.0 - v4;
  }
  else
  {
    v6 = 1.0 - v4;
    -[PBUIFakeBluring setAlpha:](blurView, "setAlpha:", 1.0 - v4);
    -[PBUIFakeBluring setAlpha:](self->_transitionBlurView, "setAlpha:", v4);
  }
  -[UIView setAlpha:](self->_grayscaleTintView, "setAlpha:", v6);
  -[UIView setAlpha:](self->_colorTintView, "setAlpha:", v6);
  -[UIView setAlpha:](self->_transitionGrayscaleTintView, "setAlpha:", v4);
  -[UIView setAlpha:](self->_transitionColorTintView, "setAlpha:", v4);
}

- (void)setWallpaperStyle:(int64_t)a3
{
  if (a3 == 1)
    a3 = 2;
  -[PBUIWallpaperEffectViewBase setStyle:](self, "setStyle:", a3);
}

- (void)setForcesOpaque:(BOOL)a3
{
  if (self->_forcesOpaque != a3)
  {
    self->_forcesOpaque = a3;
    -[PBUIWallpaperEffectViewBase _configureFromScratch](self, "_configureFromScratch");
  }
}

- (void)setStyle:(int64_t)a3
{
  int64_t startStyle;
  int64_t endStyle;
  void *v8;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBUIWallpaperEffectViewBase.m"), 144, CFSTR("PBUIWallpaperEffectView does not support style Hidden"));

  }
  if (self->_startStyle != a3 || self->_endStyle != a3)
  {
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      startStyle = self->_startStyle;
      if (startStyle != a3 && (!a3 || !startStyle))
      {
        -[PBUIFakeBluring setObserver:](self->_blurView, "setObserver:", 0);
        -[PBUIFakeBluring removeFromSuperview](self->_blurView, "removeFromSuperview");
        -[PBUIWallpaperEffectViewBase setBlurView:](self, "setBlurView:", 0);
      }
      endStyle = self->_endStyle;
      if (endStyle != a3 && (!a3 || !endStyle))
      {
        -[PBUIFakeBluring setObserver:](self->_transitionBlurView, "setObserver:", 0);
        -[PBUIFakeBluring removeFromSuperview](self->_transitionBlurView, "removeFromSuperview");
        -[PBUIWallpaperEffectViewBase setTransitionBlurView:](self, "setTransitionBlurView:", 0);
      }
    }
    self->_startStyle = a3;
    self->_endStyle = a3;
    -[PBUIWallpaperEffectViewBase _configureFromScratch](self, "_configureFromScratch");
  }
}

- (PBUIWallpaperEffectViewBase)initWithFrame:(CGRect)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-initWithFrame: unavailable"), 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (PBUIWallpaperEffectViewBase)initWithCoder:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This class does not support unarchiving from a nib"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PBUIWallpaperPresenting removeObserver:forVariant:](self->_wallpaperPresenter, "removeObserver:forVariant:", self, self->_variant);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);
  -[PBUIFakeBluring setObserver:](self->_blurView, "setObserver:", 0);
  -[PBUIFakeBluring setObserver:](self->_transitionBlurView, "setObserver:", 0);

  v4.receiver = self;
  v4.super_class = (Class)PBUIWallpaperEffectViewBase;
  -[PBUIWallpaperEffectViewBase dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t startStyle;
  int64_t endStyle;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBUIStringForWallpaperVariant(self->_variant);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("variant"));

  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_shouldMatchWallpaperPosition, CFSTR("shouldMatchWallpaperPosition"));
  startStyle = self->_startStyle;
  endStyle = self->_endStyle;
  PBUIWallpaperStyleDescription(startStyle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (startStyle == endStyle)
  {
    v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("style"));

  }
  else
  {
    v11 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("startStyle"));

    PBUIWallpaperStyleDescription(self->_endStyle);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v3, "appendObject:withName:", v12, CFSTR("endStyle"));

    v14 = (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("transitionFraction"), 2, self->_transitionFraction);
  }
  v15 = (id)objc_msgSend(v3, "appendSuper");
  objc_msgSend(v3, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[PBUIWallpaperEffectViewBase isHidden](self, "isHidden");
  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperEffectViewBase;
  -[PBUIWallpaperEffectViewBase setHidden:](&v6, sel_setHidden_, v3);
  if (v5 != -[PBUIWallpaperEffectViewBase isHidden](self, "isHidden"))
    -[PBUIWallpaperEffectViewBase _configureViewsPositioning](self, "_configureViewsPositioning");
}

- (BOOL)isFullscreen
{
  return !-[PBUIWallpaperEffectViewBase shouldMatchWallpaperPosition](self, "shouldMatchWallpaperPosition");
}

- (void)setTransformOptions:(unint64_t)a3
{
  if (self->_transformOptions != a3)
  {
    self->_transformOptions = a3;
    -[PBUIFakeBluring setTransformOptions:](self->_blurView, "setTransformOptions:");
    -[PBUIFakeBluring setTransformOptions:](self->_transitionBlurView, "setTransformOptions:", a3);
  }
}

- (void)setExternalDisplayConfiguration:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[PBUIExternalDisplayConfiguration isEqual:](self->_externalDisplayConfiguration, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_externalDisplayConfiguration, a3);
    -[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExternalDisplayConfiguration:", v8);

    }
  }

}

- (double)zoomScale
{
  double result;

  -[PBUIFakeBluring zoomScale](self->_blurView, "zoomScale");
  return result;
}

- (void)setZoomScale:(double)a3
{
  -[PBUIFakeBluring setZoomScale:](self->_blurView, "setZoomScale:", a3);
}

- (BOOL)prepareToAnimateToTransitionState:(id *)a3
{
  int64_t var1;
  int64_t var0;
  int64_t startStyle;
  int64_t endStyle;
  double v12;
  int64_t v13;
  _BYTE *v14;
  _BYTE v16[24];
  _BYTE v17[24];
  _BYTE v18[24];
  __int128 v19;
  double v20;

  var0 = a3->var0;
  var1 = a3->var1;
  startStyle = self->_startStyle;
  endStyle = self->_endStyle;
  if (startStyle != endStyle && var0 != var1)
  {
    if (startStyle == var0 && endStyle == var1)
      return 1;
    if (startStyle != var1 || endStyle != var0)
      return 0;
    v12 = 1.0 - a3->var2;
    v13 = a3->var1;
    goto LABEL_25;
  }
  if (startStyle == endStyle)
  {
    if (var0 == var1)
    {
      PBUIWallpaperStyleTransitionStateMake(self->_startStyle, a3->var0, (uint64_t)v16, 0.0);
      -[PBUIWallpaperEffectViewBase setTransitionState:](self, "setTransitionState:", v16);
LABEL_24:
      v12 = 1.0;
      v13 = startStyle;
LABEL_25:
      endStyle = var0;
      goto LABEL_26;
    }
    if (startStyle == var0)
    {
      PBUIWallpaperStyleTransitionStateMake(a3->var0, a3->var1, (uint64_t)v18, 0.0);
      v14 = v18;
LABEL_31:
      -[PBUIWallpaperEffectViewBase setTransitionState:](self, "setTransitionState:", v14);
      return 1;
    }
    if (startStyle == var1)
    {
      PBUIWallpaperStyleTransitionStateMake(a3->var0, a3->var1, (uint64_t)v17, 1.0);
      v14 = v17;
      goto LABEL_31;
    }
  }
  else
  {
    if (startStyle == var0 && self->_transitionFraction < 1.0)
    {
      v12 = 0.0;
      v13 = a3->var0;
LABEL_26:
      PBUIWallpaperStyleTransitionStateMake(v13, endStyle, (uint64_t)&v19, v12);
      *(_OWORD *)&a3->var0 = v19;
      a3->var2 = v20;
      return 1;
    }
    if (endStyle == var0 && self->_transitionFraction > 0.0)
      goto LABEL_24;
  }
  return 0;
}

- (void)setTransitionState:(id *)a3
{
  if (a3->var0 != self->_startStyle || a3->var1 != self->_endStyle)
  {
    self->_startStyle = a3->var0;
    self->_endStyle = a3->var1;
    -[PBUIWallpaperEffectViewBase _configureFromScratch](self, "_configureFromScratch");
  }
  -[PBUIWallpaperEffectViewBase _setTransitionFraction:](self, "_setTransitionFraction:", a3->var2);
}

- (BOOL)currentTransitionStateIsOpaque
{
  uint64_t v3;
  int HasBlur;

  if (BSFloatEqualToFloat())
  {
    v3 = 432;
    goto LABEL_5;
  }
  if (BSFloatEqualToFloat())
  {
    v3 = 440;
LABEL_5:
    if ((_WallpaperStyleHasBlur(*(unint64_t *)((char *)&self->super.super.super.isa + v3)) & 1) == 0)
    {
      LOBYTE(HasBlur) = self->_forcesOpaque;
      return HasBlur;
    }
LABEL_8:
    LOBYTE(HasBlur) = 1;
    return HasBlur;
  }
  if (self->_forcesOpaque)
    goto LABEL_8;
  HasBlur = _WallpaperStyleHasBlur(self->_startStyle);
  if (HasBlur)
    LOBYTE(HasBlur) = _WallpaperStyleHasBlur(self->_endStyle);
  return HasBlur;
}

- (void)setMaskImage:(id)a3 masksBlur:(BOOL)a4 masksTint:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  UIImage *v8;
  UIImage *maskImage;
  BOOL v10;
  UIImage *v11;
  BOOL v12;
  UIImage *v13;

  v5 = a5;
  v6 = a4;
  v8 = (UIImage *)a3;
  maskImage = self->_maskImage;
  if (maskImage != v8 || self->_shouldMaskBlur != v6 || self->_shouldMaskTint != v5)
  {
    v10 = 0;
    v11 = 0;
    v13 = v8;
    v12 = 0;
    if (v8 && (v6 || v5))
    {
      v11 = v8;
      maskImage = self->_maskImage;
      v10 = v6;
      v12 = v5;
    }
    self->_maskImage = v11;

    self->_shouldMaskBlur = v10;
    self->_shouldMaskTint = v12;
    -[PBUIWallpaperEffectViewBase _configureFromScratch](self, "_configureFromScratch");
    v8 = v13;
  }

}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  id v5;

  if (self->_variant == a4)
  {
    objc_msgSend(a3, "contentColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PBUIWallpaperEffectViewBase _updateWallpaperAverageColor:](self, "_updateWallpaperAverageColor:", v5);

  }
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_variant == a3)
  {
    -[PBUIWallpaperEffectViewBase wallpaperPresenter](self, "wallpaperPresenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "legibilitySettingsForVariant:", self->_variant);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[PBUIWallpaperEffectViewBase _updateWallpaperAverageColor:](self, "_updateWallpaperAverageColor:", v6);
  }
}

- (void)_updateWallpaperAverageColor:(id)a3
{
  UIColor *v4;
  void *v5;
  UIColor *wallpaperAverageColor;
  UIColor *v7;
  void *v8;

  v4 = (UIColor *)a3;
  v5 = _BackdropRenderingHintForWallpaperAverageColor(self->_wallpaperAverageColor);
  wallpaperAverageColor = self->_wallpaperAverageColor;
  self->_wallpaperAverageColor = v4;
  v7 = v4;

  v8 = _BackdropRenderingHintForWallpaperAverageColor(self->_wallpaperAverageColor);
  if (v8 != v5)
    -[PBUIWallpaperEffectViewBase _configureFromScratch](self, "_configureFromScratch");
}

- (int64_t)wallpaperStyle
{
  return self->_startStyle;
}

- (void)_configureGrayscaleAndColorTintViewForStartStyle:(BOOL)a3
{
  _BOOL4 v3;
  PBUIWallpaperEffectViewBase *tintMaskingContainer;
  PBUIWallpaperEffectViewBase *v6;
  int *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _SBTintView *v18;
  _SBTintView *v19;
  void *v20;
  _SBTintView *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _SBTintView *v28;
  _SBTintView *v29;
  void *v30;
  id v31;
  _SBTintView *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t);
  void *v36;
  _SBTintView *v37;
  id v38;
  _QWORD v39[4];
  _SBTintView *v40;
  id v41;
  __int128 v42[4];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v3 = a3;
  tintMaskingContainer = (PBUIWallpaperEffectViewBase *)self->_tintMaskingContainer;
  if (!tintMaskingContainer)
    tintMaskingContainer = self;
  v6 = tintMaskingContainer;
  v7 = &OBJC_IVAR___PBUIWallpaperEffectViewBase__endStyle;
  if (v3)
    v7 = &OBJC_IVAR___PBUIWallpaperEffectViewBase__startStyle;
  v8 = *(unint64_t *)((char *)&self->super.super.super.isa + *v7);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  _WallpaperBackdropParametersForStyleAndAverageColor(v8, self->_wallpaperAverageColor, (uint64_t)&v43);
  v42[0] = v43;
  v42[1] = v44;
  v42[2] = v45;
  v42[3] = v46;
  PBUIBackdropOutputSettingsForWallpaperBackdropParameters(v42);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "grayscaleTintAlpha");
    if (v12 <= 0.00000011920929)
    {
LABEL_12:
      if (v3)
      {
        -[PBUIWallpaperEffectViewBase grayscaleTintView](self, "grayscaleTintView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeFromSuperview");

        -[PBUIWallpaperEffectViewBase setGrayscaleTintView:](self, "setGrayscaleTintView:", 0);
      }
      else
      {
        -[PBUIWallpaperEffectViewBase transitionGrayscaleTintView](self, "transitionGrayscaleTintView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeFromSuperview");

        -[PBUIWallpaperEffectViewBase setTransitionGrayscaleTintView:](self, "setTransitionGrayscaleTintView:", 0);
      }
      v17 = 0;
      goto LABEL_22;
    }
    v13 = (void *)MEMORY[0x1E0CEA478];
    objc_msgSend(v10, "grayscaleTintLevel");
    objc_msgSend(v13, "colorWithWhite:alpha:");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
  if (!v11)
    goto LABEL_12;
  if (v3)
    -[PBUIWallpaperEffectViewBase grayscaleTintView](self, "grayscaleTintView");
  else
    -[PBUIWallpaperEffectViewBase transitionGrayscaleTintView](self, "transitionGrayscaleTintView");
  v18 = (_SBTintView *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v19 = [_SBTintView alloc];
    -[PBUIWallpaperEffectViewBase bounds](self, "bounds");
    v18 = -[_SBTintView initWithFrame:](v19, "initWithFrame:");
    if (v3)
      -[PBUIWallpaperEffectViewBase setGrayscaleTintView:](self, "setGrayscaleTintView:", v18);
    else
      -[PBUIWallpaperEffectViewBase setTransitionGrayscaleTintView:](self, "setTransitionGrayscaleTintView:", v18);
  }
  v20 = (void *)MEMORY[0x1E0CEABB0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke;
  v39[3] = &unk_1E6B94BC8;
  v40 = v18;
  v17 = v14;
  v41 = v17;
  v21 = v18;
  objc_msgSend(v20, "performWithoutAnimation:", v39);
  -[PBUIWallpaperEffectViewBase addSubview:](v6, "addSubview:", v21);

LABEL_22:
  objc_msgSend(v10, "colorTintAlpha");
  v23 = v22;
  if (v22 > 0.00000011920929
    && (objc_msgSend(v10, "colorTint"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "colorWithAlphaComponent:", v23),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v24,
        v25))
  {
    if (v3)
      -[PBUIWallpaperEffectViewBase colorTintView](self, "colorTintView");
    else
      -[PBUIWallpaperEffectViewBase transitionColorTintView](self, "transitionColorTintView");
    v28 = (_SBTintView *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      v29 = [_SBTintView alloc];
      -[PBUIWallpaperEffectViewBase bounds](self, "bounds");
      v28 = -[_SBTintView initWithFrame:](v29, "initWithFrame:");
      if (v3)
        -[PBUIWallpaperEffectViewBase setColorTintView:](self, "setColorTintView:", v28);
      else
        -[PBUIWallpaperEffectViewBase setTransitionColorTintView:](self, "setTransitionColorTintView:", v28);
    }
    v30 = (void *)MEMORY[0x1E0CEABB0];
    v33 = MEMORY[0x1E0C809B0];
    v34 = 3221225472;
    v35 = __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke_2;
    v36 = &unk_1E6B94BC8;
    v37 = v28;
    v38 = v25;
    v31 = v25;
    v32 = v28;
    objc_msgSend(v30, "performWithoutAnimation:", &v33);
    -[PBUIWallpaperEffectViewBase addSubview:](v6, "addSubview:", v32, v33, v34, v35, v36);

  }
  else if (v3)
  {
    -[PBUIWallpaperEffectViewBase colorTintView](self, "colorTintView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeFromSuperview");

    -[PBUIWallpaperEffectViewBase setColorTintView:](self, "setColorTintView:", 0);
  }
  else
  {
    -[PBUIWallpaperEffectViewBase transitionColorTintView](self, "transitionColorTintView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeFromSuperview");

    -[PBUIWallpaperEffectViewBase setTransitionColorTintView:](self, "setTransitionColorTintView:", 0);
  }

}

uint64_t __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__PBUIWallpaperEffectViewBase__configureGrayscaleAndColorTintViewForStartStyle___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
}

- (void)_accessibilityReduceTransparencyChanged:(id)a3
{
  _BOOL4 IsReduceTransparencyEnabled;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (self->_accessibilityReduceTransparencyEnabled != IsReduceTransparencyEnabled)
  {
    self->_accessibilityReduceTransparencyEnabled = IsReduceTransparencyEnabled;
    -[PBUIFakeBluring setObserver:](self->_blurView, "setObserver:", 0);
    -[PBUIFakeBluring removeFromSuperview](self->_blurView, "removeFromSuperview");
    -[PBUIWallpaperEffectViewBase setBlurView:](self, "setBlurView:", 0);
    -[PBUIWallpaperEffectViewBase _configureFromScratch](self, "_configureFromScratch");
  }
}

- (id)appearanceStorage
{
  return 0;
}

- (BOOL)forcesOpaque
{
  return self->_forcesOpaque;
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (PBUIExternalDisplayConfiguration)externalDisplayConfiguration
{
  return self->_externalDisplayConfiguration;
}

- (PBUIFakeBluring)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIView)grayscaleTintView
{
  return self->_grayscaleTintView;
}

- (UIView)colorTintView
{
  return self->_colorTintView;
}

- (PBUIFakeBluring)transitionBlurView
{
  return self->_transitionBlurView;
}

- (UIView)transitionGrayscaleTintView
{
  return self->_transitionGrayscaleTintView;
}

- (UIView)transitionColorTintView
{
  return self->_transitionColorTintView;
}

- (UIImageView)maskImageView
{
  return self->_maskImageView;
}

- (UIView)blurMaskingContainer
{
  return self->_blurMaskingContainer;
}

- (UIView)tintMaskingContainer
{
  return self->_tintMaskingContainer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_wallpaperPresenter, 0);
  objc_storeStrong((id *)&self->_maskImage, 0);
  objc_storeStrong((id *)&self->_tintMaskingContainer, 0);
  objc_storeStrong((id *)&self->_blurMaskingContainer, 0);
  objc_storeStrong((id *)&self->_maskImageView, 0);
  objc_storeStrong((id *)&self->_transitionColorTintView, 0);
  objc_storeStrong((id *)&self->_transitionGrayscaleTintView, 0);
  objc_storeStrong((id *)&self->_transitionBlurView, 0);
  objc_storeStrong((id *)&self->_colorTintView, 0);
  objc_storeStrong((id *)&self->_grayscaleTintView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_wallpaperAverageColor, 0);
}

@end
