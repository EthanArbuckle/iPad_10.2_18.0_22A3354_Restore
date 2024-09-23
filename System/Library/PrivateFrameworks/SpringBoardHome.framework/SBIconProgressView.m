@implementation SBIconProgressView

- (SBIconProgressView)initWithFrame:(CGRect)a3
{
  SBIconProgressView *v3;
  SBIconProgressView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBIconProgressView;
  v3 = -[SBIconProgressView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBIconProgressView setNeedsDisplayOnBoundsChange:](v3, "setNeedsDisplayOnBoundsChange:", 1);
    -[SBIconProgressView setOpaque:](v4, "setOpaque:", 0);
    -[SBIconProgressView setWantsDeepColorDrawing:](v4, "setWantsDeepColorDrawing:", 0);
    v4->_canAnimate = 1;
    v4->_hasOpaqueIconImage = 1;
    -[SBIconProgressView layer](v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", *MEMORY[0x1E0CD2EC0]);

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBIconProgressView;
  -[SBIconProgressView dealloc](&v3, sel_dealloc);
}

- (void)setState:(int64_t)a3 paused:(BOOL)a4 fractionLoaded:(double)a5 animated:(BOOL)a6
{
  self->_modelState = a3;
  self->_modelPaused = a4;
  self->_modelFraction = a5;
  -[SBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", a6);
}

- (void)setCanAnimate:(BOOL)a3
{
  self->_canAnimate = a3;
  if (!a3)
  {
    -[SBIconProgressView _clearDisplayLink](self, "_clearDisplayLink");
    -[SBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", 0);
  }
}

- (void)setHasOpaqueIconImage:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_hasOpaqueIconImage != a3)
  {
    v3 = a3;
    self->_hasOpaqueIconImage = a3;
    -[SBIconProgressView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      v7 = *MEMORY[0x1E0CD2EC0];
    else
      v7 = 0;
    objc_msgSend(v5, "setCompositingFilter:", v7);

    -[SBIconProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;

  if (v6 != self->_iconImageInfo.continuousCornerRadius)
  {
    self->_iconImageInfo.size.width = v3;
    self->_iconImageInfo.size.height = v4;
    self->_iconImageInfo.scale = v5;
    self->_iconImageInfo.continuousCornerRadius = v6;
    -[SBIconProgressView setNeedsDisplay](self, "setNeedsDisplay", a3);
  }
}

- (BOOL)_hasActiveTransitions
{
  return self->_activeStateTransition || self->_activePausedTransition || self->_activeFractionTransition != 0;
}

- (void)_updateTransitionsAnimated:(BOOL)a3
{
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  id WeakRetained;

  v4 = self->_canAnimate && a3;
  if (-[_SBIconProgressPausedTransition isCompleteWithView:](self->_activePausedTransition, "isCompleteWithView:", self))
  {
    -[SBIconProgressView setActivePausedTransition:](self, "setActivePausedTransition:", 0);
  }
  if (-[_SBIconProgressStateTransition isCompleteWithView:](self->_activeStateTransition, "isCompleteWithView:", self))
    -[SBIconProgressView setActiveStateTransition:](self, "setActiveStateTransition:", 0);
  -[SBIconProgressView _updatePausedTransitionAnimated:](self, "_updatePausedTransitionAnimated:", v4);
  -[SBIconProgressView _updateStateTransitionAnimated:](self, "_updateStateTransitionAnimated:", v4);
  v5 = !self->_activePausedTransition
    && !self->_activeStateTransition
    && !self->_displayedState
    && self->_modelState == 0;
  if (-[_SBIconProgressFractionTransition isCompleteWithView:](self->_activeFractionTransition, "isCompleteWithView:", self))
  {
    -[SBIconProgressView setActiveFractionTransition:](self, "setActiveFractionTransition:", 0);
  }
  -[SBIconProgressView _updateFractionTransitionAnimated:](self, "_updateFractionTransitionAnimated:", v4);
  v6 = -[SBIconProgressView _hasActiveTransitions](self, "_hasActiveTransitions");
  if (v4 && v6)
  {
    -[SBIconProgressView _ensureDisplayLink](self, "_ensureDisplayLink");
  }
  else
  {
    v7 = v6;
    -[SBIconProgressView _clearDisplayLink](self, "_clearDisplayLink");
    if (v7)
    {
      -[_SBIconProgressStateTransition completeTransitionAndUpdateView:](self->_activeStateTransition, "completeTransitionAndUpdateView:", self);
      -[_SBIconProgressPausedTransition completeTransitionAndUpdateView:](self->_activePausedTransition, "completeTransitionAndUpdateView:", self);
      -[_SBIconProgressFractionTransition completeTransitionAndUpdateView:](self->_activeFractionTransition, "completeTransitionAndUpdateView:", self);
      -[SBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", 0);
    }
  }
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "progressViewCanBeRemoved:", self);

  }
}

- (void)_updatePausedTransitionAnimated:(BOOL)a3
{
  _SBIconProgressPausedTransition *activePausedTransition;
  _BOOL4 modelPaused;
  _SBIconProgressPausedTransition *v6;
  _SBIconProgressPausedTransition *v7;

  activePausedTransition = self->_activePausedTransition;
  if (activePausedTransition)
  {
    -[_SBIconProgressPausedTransition updateToPaused:](activePausedTransition, "updateToPaused:", self->_modelPaused);
  }
  else
  {
    modelPaused = self->_modelPaused;
    if (self->_displayingPaused != modelPaused)
    {
      v6 = +[_SBIconProgressPausedTransition newTransitionToPaused:](_SBIconProgressPausedTransition, "newTransitionToPaused:", modelPaused);
      v7 = self->_activePausedTransition;
      self->_activePausedTransition = v6;

    }
  }
}

- (void)_updateStateTransitionAnimated:(BOOL)a3
{
  int64_t displayedState;
  int64_t modelState;
  int64_t v6;
  _SBIconProgressStateTransition *v7;
  _SBIconProgressStateTransition *activeStateTransition;

  if (!self->_activeStateTransition)
  {
    displayedState = self->_displayedState;
    modelState = self->_modelState;
    if (displayedState != modelState && (!a3 || !self->_activePausedTransition && !self->_displayingPaused))
    {
      if (displayedState != 2)
      {
        if (displayedState == 1)
        {
          v6 = 1;
        }
        else
        {
          if (displayedState)
            return;
          v6 = 0;
          modelState = 1;
        }
        goto LABEL_15;
      }
      if (modelState)
      {
        v6 = 2;
LABEL_15:
        v7 = +[_SBIconProgressStateTransition newTransitionFromState:toState:](_SBIconProgressStateTransition, "newTransitionFromState:toState:", v6, modelState);
        activeStateTransition = self->_activeStateTransition;
        self->_activeStateTransition = v7;

        return;
      }
      if (BSFloatEqualToFloat())
      {
        v6 = self->_displayedState;
        modelState = self->_modelState;
        goto LABEL_15;
      }
      self->_modelFraction = 1.0;
    }
  }
}

- (void)_updateFractionTransitionAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _SBIconProgressFractionTransition *activeFractionTransition;
  _SBIconProgressFractionTransition *v6;
  _SBIconProgressFractionTransition *v7;
  _SBIconProgressFractionTransition *v8;

  v3 = a3;
  if (a3
    && (self->_activePausedTransition
     || self->_activeStateTransition
     || self->_displayedState != 2
     || self->_displayingPaused))
  {
    activeFractionTransition = self->_activeFractionTransition;
    self->_activeFractionTransition = 0;

  }
  else if ((BSFloatEqualToFloat() & 1) == 0 && (!v3 || (BSFloatGreaterThanFloat() & 1) == 0))
  {
    v6 = self->_activeFractionTransition;
    if (v6)
    {
      -[_SBIconProgressFractionTransition updateToFraction:](v6, "updateToFraction:", self->_modelFraction);
    }
    else
    {
      v7 = +[_SBIconProgressFractionTransition newTransitionToFraction:](_SBIconProgressFractionTransition, "newTransitionToFraction:", self->_modelFraction);
      v8 = self->_activeFractionTransition;
      self->_activeFractionTransition = v7;

    }
  }
}

- (void)_onDisplayLink:(id)a3
{
  double Current;
  double v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  id v9;

  v9 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v5 = Current - self->_lastUpdate;
  self->_lastUpdate = Current;
  v6 = (void *)MEMORY[0x1D17DF4E4]();
  -[_SBIconProgressStateTransition updateView:withElapsedTime:](self->_activeStateTransition, "updateView:withElapsedTime:", self, v5);
  v7 = -[_SBIconProgressStateTransition isCompleteWithView:](self->_activeStateTransition, "isCompleteWithView:", self);
  -[_SBIconProgressPausedTransition updateView:withElapsedTime:](self->_activePausedTransition, "updateView:withElapsedTime:", self, v5);
  v8 = -[_SBIconProgressPausedTransition isCompleteWithView:](self->_activePausedTransition, "isCompleteWithView:", self);
  -[_SBIconProgressFractionTransition updateView:withElapsedTime:](self->_activeFractionTransition, "updateView:withElapsedTime:", self, v5);
  if (-[_SBIconProgressFractionTransition isCompleteWithView:](self->_activeFractionTransition, "isCompleteWithView:", self)|| v8|| v7)
  {
    -[SBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", 1);
  }
  objc_autoreleasePoolPop(v6);

}

- (void)_ensureDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  if (!self->_displayLink)
  {
    self->_lastUpdate = CFAbsoluteTimeGetCurrent();
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 30);
    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99860]);

  }
}

- (void)_clearDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (double)_circleScaleFactor
{
  if (self->_iconImageInfo.continuousCornerRadius == 0.0)
    return 1.0;
  else
    return self->_iconImageInfo.size.width / 60.0;
}

- (void)drawRect:(CGRect)a3
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
  void *v16;
  void *v17;
  double circleRadiusFraction;
  CGRect v19;

  if (fabs(self->_backgroundAlpha) >= 2.22044605e-16)
  {
    -[SBIconProgressView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    UIRectGetCenter();
    v13 = v12;
    v15 = v14;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, self->_backgroundAlpha * 0.7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set");

    if (self->_hasOpaqueIconImage)
    {
      v19.origin.x = v5;
      v19.origin.y = v7;
      v19.size.width = v9;
      v19.size.height = v11;
      UIRectFillUsingBlendMode(v19, kCGBlendModeNormal);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, self->_iconImageInfo.continuousCornerRadius);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fill");

    }
    if (BSFloatEqualToFloat())
    {
      -[SBIconProgressView _drawPieWithCenter:](self, "_drawPieWithCenter:", v13, v15);
    }
    else
    {
      circleRadiusFraction = self->_circleRadiusFraction;
      if (circleRadiusFraction <= 1.0)
      {
        if (circleRadiusFraction > 0.0)
          -[SBIconProgressView _drawIncomingCircleWithCenter:](self, "_drawIncomingCircleWithCenter:", v13, v15);
      }
      else
      {
        -[SBIconProgressView _drawOutgoingCircleWithCenter:](self, "_drawOutgoingCircleWithCenter:", v13, v15);
      }
    }
    if (fabs(self->_pauseRadiusFraction) >= 2.22044605e-16)
      -[SBIconProgressView _drawPauseUIWithCenter:](self, "_drawPauseUIWithCenter:", v13, v15);
  }
}

+ (id)_pieImagesMemoryPool
{
  if (_pieImagesMemoryPool_onceToken != -1)
    dispatch_once(&_pieImagesMemoryPool_onceToken, &__block_literal_global_4);
  return (id)_pieImagesMemoryPool___pool;
}

void __42__SBIconProgressView__pieImagesMemoryPool__block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scale");
  v3 = objc_msgSend(v0, "sbf_bytesNeededForSize:scale:withContextType:", 4, 42.0, 42.0, v2);

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", "iconProgressPieImages", v3);
  v5 = (void *)_pieImagesMemoryPool___pool;
  _pieImagesMemoryPool___pool = v4;

}

+ (id)_pieImageAtFraction:(double)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _QWORD v13[4];
  __int128 v14;
  double v15;

  if (_pieImageAtFraction__onceToken != -1)
    dispatch_once(&_pieImageAtFraction__onceToken, &__block_literal_global_15);
  LODWORD(v3) = vcvtad_u64_f64(a3 * 100.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_pieImageAtFraction__pieImageCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(a1, "_pieImagesMemoryPool");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__SBIconProgressView__pieImageAtFraction___block_invoke_2;
    v13[3] = &__block_descriptor_56_e5_v8__0l;
    v14 = xmmword_1D0190AC0;
    v15 = a3;
    objc_msgSend(v9, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 4, v8, v13, 42.0, 42.0, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend((id)_pieImageAtFraction__pieImageCache, "setObject:forKey:", v7, v6);

  }
  return v7;
}

void __42__SBIconProgressView__pieImageAtFraction___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_pieImageAtFraction__pieImageCache;
  _pieImageAtFraction__pieImageCache = (uint64_t)v0;

}

void __42__SBIconProgressView__pieImageAtFraction___block_invoke_2(double *a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a1[4], a1[5], 18.0, 0.0, 6.28318531);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLineWidth:", 3.0);
  objc_msgSend(v5, "strokeWithBlendMode:alpha:", 17, 1.0);
  v2 = a1[6];
  if (fabs(v2) >= 2.22044605e-16)
  {
    v3 = v2 * 6.28318531 + -1.57079633;
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveToPoint:", a1[4], a1[5]);
    objc_msgSend(v4, "addLineToPoint:", a1[4], a1[5] + -18.0);
    objc_msgSend(v4, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a1[4], a1[5], 18.0, -1.57079633, v3);
    objc_msgSend(v4, "addLineToPoint:", a1[4], a1[5]);
    objc_msgSend(v4, "fillWithBlendMode:alpha:", 17, 1.0);

  }
}

- (void)_drawPieWithCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  y = a3.y;
  x = a3.x;
  objc_msgSend((id)objc_opt_class(), "_pieImageAtFraction:", self->_displayedFraction);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  v7 = v6;
  v9 = v8;
  -[SBIconProgressView _circleScaleFactor](self, "_circleScaleFactor");
  objc_msgSend(v11, "drawInRect:blendMode:alpha:", 16, ceil(x - v7 * v10 * 0.5), ceil(y - v9 * v10 * 0.5), v7 * v10, v9 * v10, 1.0);

}

- (void)_drawOutgoingCircleWithCenter:(CGPoint)a3
{
  double y;
  double x;
  CGContext *CurrentContext;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, self->_foregroundAlpha * 0.2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "set");

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, fmax(self->_circleRadiusFraction * 18.0, 19.5), 0.0, 6.28318531);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fillWithBlendMode:alpha:", 17, 1.0);
  CGContextRestoreGState(CurrentContext);

}

- (void)_drawIncomingCircleWithCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  void *v8;
  double v9;
  id v10;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  v7 = self->_circleRadiusFraction * 18.0;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, v7, 0.0, 6.28318531);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v9 = 3.0;
  if (v7 <= 3.0)
    v9 = v7;
  objc_msgSend(v8, "setLineWidth:", v9);
  objc_msgSend(v10, "strokeWithBlendMode:alpha:", 17, 1.0);

}

- (void)_drawPauseUIWithCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3.x, a3.y, self->_pauseRadiusFraction * 13.0, 0.0, 6.28318531);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addClip");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "set");

  objc_msgSend(v10, "fillWithBlendMode:alpha:", 17, 1.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");

  v7 = y + -6.0;
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x + -5.5, v7, 4.0, 12.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fillWithBlendMode:alpha:", 17, 1.0);

  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x + 1.5, v7, 4.0, 12.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fillWithBlendMode:alpha:", 17, 1.0);

}

- (CGRect)circleBoundingRect
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
  CGRect result;

  -[SBIconProgressView bounds](self, "bounds");
  UIRectGetCenter();
  v4 = v3;
  v6 = v5;
  -[SBIconProgressView _circleScaleFactor](self, "_circleScaleFactor");
  v8 = v7 * 21.0;
  v9 = v4 - v7 * 21.0;
  v10 = v6 - v8;
  v11 = v8 + v8;
  v12 = v11;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)description
{
  return -[SBIconProgressView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", CFSTR("\t"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconProgressView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconProgressView frame](self, "frame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("frame"));
  v6 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_modelState, CFSTR("state"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", self->_modelPaused, CFSTR("paused"));
  v8 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("fraction"), self->_modelFraction);
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconProgressView canAnimate](self, "canAnimate"), CFSTR("canAnimate"));
  return v4;
}

- (SBIconProgressViewDelegate)delegate
{
  return (SBIconProgressViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)canAnimate
{
  return self->_canAnimate;
}

- (BOOL)hasOpaqueIconImage
{
  return self->_hasOpaqueIconImage;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (void)setBackgroundAlpha:(double)a3
{
  self->_backgroundAlpha = a3;
}

- (double)foregroundAlpha
{
  return self->_foregroundAlpha;
}

- (void)setForegroundAlpha:(double)a3
{
  self->_foregroundAlpha = a3;
}

- (double)circleRadiusFraction
{
  return self->_circleRadiusFraction;
}

- (void)setCircleRadiusFraction:(double)a3
{
  self->_circleRadiusFraction = a3;
}

- (double)pauseRadiusFraction
{
  return self->_pauseRadiusFraction;
}

- (void)setPauseRadiusFraction:(double)a3
{
  self->_pauseRadiusFraction = a3;
}

- (int64_t)displayedState
{
  return self->_displayedState;
}

- (void)setDisplayedState:(int64_t)a3
{
  self->_displayedState = a3;
}

- (BOOL)displayingPaused
{
  return self->_displayingPaused;
}

- (void)setDisplayingPaused:(BOOL)a3
{
  self->_displayingPaused = a3;
}

- (double)displayedFraction
{
  return self->_displayedFraction;
}

- (void)setDisplayedFraction:(double)a3
{
  self->_displayedFraction = a3;
}

- (_SBIconProgressStateTransition)activeStateTransition
{
  return self->_activeStateTransition;
}

- (void)setActiveStateTransition:(id)a3
{
  objc_storeStrong((id *)&self->_activeStateTransition, a3);
}

- (_SBIconProgressPausedTransition)activePausedTransition
{
  return self->_activePausedTransition;
}

- (void)setActivePausedTransition:(id)a3
{
  objc_storeStrong((id *)&self->_activePausedTransition, a3);
}

- (_SBIconProgressFractionTransition)activeFractionTransition
{
  return self->_activeFractionTransition;
}

- (void)setActiveFractionTransition:(id)a3
{
  objc_storeStrong((id *)&self->_activeFractionTransition, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_activeFractionTransition, 0);
  objc_storeStrong((id *)&self->_activePausedTransition, 0);
  objc_storeStrong((id *)&self->_activeStateTransition, 0);
}

@end
