@implementation VUISBIconProgressView

- (VUISBIconProgressView)initWithFrame:(CGRect)a3
{
  VUISBIconProgressView *v3;
  VUISBIconProgressView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUISBIconProgressView;
  v3 = -[VUISBIconProgressView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[VUISBIconProgressView setNeedsDisplayOnBoundsChange:](v3, "setNeedsDisplayOnBoundsChange:", 1);
    -[VUISBIconProgressView setOpaque:](v4, "setOpaque:", 0);
    v4->_canAnimate = 1;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)VUISBIconProgressView;
  -[VUISBIconProgressView dealloc](&v3, sel_dealloc);
}

- (void)setState:(int64_t)a3 paused:(BOOL)a4 fractionLoaded:(double)a5 animated:(BOOL)a6
{
  self->_modelState = a3;
  self->_modelPaused = a4;
  self->_modelFraction = a5;
  -[VUISBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", a6);
}

- (void)setCanAnimate:(BOOL)a3
{
  self->_canAnimate = a3;
  if (!a3)
  {
    -[VUISBIconProgressView _clearDisplayLink](self, "_clearDisplayLink");
    -[VUISBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", 0);
  }
}

- (void)setOverlayImage:(id)a3
{
  if (self->_overlayImage != a3)
  {

    self->_maskImage = 0;
    self->_overlayImage = (UIImage *)a3;
    -[VUISBIconProgressView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)_hasActiveTransitions
{
  return self->_activeStateTransition || self->_activePausedTransition || self->_activeFractionTransition != 0;
}

- (void)_updateTransitionsAnimated:(BOOL)a3
{
  _BOOL8 v4;
  id *p_activePausedTransition;
  id *p_activeStateTransition;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = self->_canAnimate && a3;
  p_activePausedTransition = (id *)&self->_activePausedTransition;
  -[VUISBIconProgressView _clearTransitionIfComplete:](self, "_clearTransitionIfComplete:", &self->_activePausedTransition);
  p_activeStateTransition = (id *)&self->_activeStateTransition;
  -[VUISBIconProgressView _clearTransitionIfComplete:](self, "_clearTransitionIfComplete:", &self->_activeStateTransition);
  -[VUISBIconProgressView _updatePausedTransitionAnimated:](self, "_updatePausedTransitionAnimated:", v4);
  -[VUISBIconProgressView _updateStateTransitionAnimated:](self, "_updateStateTransitionAnimated:", v4);
  if (!*p_activePausedTransition && !*p_activeStateTransition && !self->_displayedState && !self->_modelState)
    -[VUISBIconProgressViewDelegate progressViewCanBeRemoved:](self->_delegate, "progressViewCanBeRemoved:", self);
  -[VUISBIconProgressView _clearTransitionIfComplete:](self, "_clearTransitionIfComplete:", &self->_activeFractionTransition);
  -[VUISBIconProgressView _updateFractionTransitionAnimated:](self, "_updateFractionTransitionAnimated:", v4);
  v7 = -[VUISBIconProgressView _hasActiveTransitions](self, "_hasActiveTransitions");
  if (v4 && v7)
  {
    -[VUISBIconProgressView _ensureDisplayLink](self, "_ensureDisplayLink");
  }
  else
  {
    v8 = v7;
    -[VUISBIconProgressView _clearDisplayLink](self, "_clearDisplayLink");
    if (v8)
    {
      objc_msgSend(*p_activeStateTransition, "completeTransitionAndUpdateView:", self);
      objc_msgSend(*p_activePausedTransition, "completeTransitionAndUpdateView:", self);
      -[_VUISBIconProgressFractionTransition completeTransitionAndUpdateView:](self->_activeFractionTransition, "completeTransitionAndUpdateView:", self);
      -[VUISBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", 0);
    }
  }
}

- (void)_updatePausedTransitionAnimated:(BOOL)a3
{
  _VUISBIconProgressPausedTransition *activePausedTransition;
  _BOOL4 modelPaused;

  activePausedTransition = self->_activePausedTransition;
  if (activePausedTransition)
  {
    -[_VUISBIconProgressPausedTransition updateToPaused:](activePausedTransition, "updateToPaused:", self->_modelPaused);
  }
  else
  {
    modelPaused = self->_modelPaused;
    if (self->_displayingPaused != modelPaused)
      self->_activePausedTransition = (_VUISBIconProgressPausedTransition *)+[_VUISBIconProgressPausedTransition newTransitionToPaused:](_VUISBIconProgressPausedTransition, "newTransitionToPaused:", modelPaused);
  }
}

- (void)_updateStateTransitionAnimated:(BOOL)a3
{
  int64_t displayedState;
  int64_t modelState;
  uint64_t v5;

  if (!self->_activeStateTransition)
  {
    displayedState = self->_displayedState;
    modelState = self->_modelState;
    if (displayedState != modelState && (!a3 || !self->_activePausedTransition && !self->_displayingPaused))
    {
      if (displayedState == 2)
      {
        if (!modelState && fabs(self->_displayedFraction + -1.0) >= 2.22044605e-16)
        {
          self->_modelFraction = 1.0;
          return;
        }
        v5 = 2;
      }
      else if (displayedState == 1)
      {
        v5 = 1;
      }
      else
      {
        if (displayedState)
          return;
        v5 = 0;
        modelState = 1;
      }
      self->_activeStateTransition = (_VUISBInstallProgressStateTransition *)+[_VUISBInstallProgressStateTransition newTransitionFromState:toState:](_VUISBInstallProgressStateTransition, "newTransitionFromState:toState:", v5, modelState);
    }
  }
}

- (void)_updateFractionTransitionAnimated:(BOOL)a3
{
  double modelFraction;
  double displayedFraction;
  _VUISBIconProgressFractionTransition *activeFractionTransition;

  if (a3
    && (self->_activePausedTransition
     || self->_activeStateTransition
     || self->_displayedState != 2
     || self->_displayingPaused))
  {

    self->_activeFractionTransition = 0;
  }
  else
  {
    modelFraction = self->_modelFraction;
    displayedFraction = self->_displayedFraction;
    if (vabdd_f64(modelFraction, displayedFraction) >= 2.22044605e-16
      && (!a3 || displayedFraction - modelFraction <= 0.00000011920929))
    {
      activeFractionTransition = self->_activeFractionTransition;
      if (activeFractionTransition)
        -[_VUISBIconProgressFractionTransition updateToFraction:](activeFractionTransition, "updateToFraction:");
      else
        self->_activeFractionTransition = (_VUISBIconProgressFractionTransition *)+[_VUISBIconProgressFractionTransition newTransitionToFraction:](_VUISBIconProgressFractionTransition, "newTransitionToFraction:");
    }
  }
}

- (void)_clearTransitionIfComplete:(id *)a3
{
  if (objc_msgSend(*a3, "isCompleteWithView:", self))
  {

    *a3 = 0;
  }
}

- (void)_onDisplayLink:(id)a3
{
  double Current;
  double v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;

  Current = CFAbsoluteTimeGetCurrent();
  v5 = Current - self->_lastUpdate;
  self->_lastUpdate = Current;
  v6 = (void *)MEMORY[0x1DF0999A8]();
  -[_VUISBInstallProgressStateTransition updateView:withElapsedTime:](self->_activeStateTransition, "updateView:withElapsedTime:", self, v5);
  v7 = -[_VUISBInstallProgressStateTransition isCompleteWithView:](self->_activeStateTransition, "isCompleteWithView:", self);
  -[_VUISBIconProgressPausedTransition updateView:withElapsedTime:](self->_activePausedTransition, "updateView:withElapsedTime:", self, v5);
  v8 = -[_VUISBIconProgressPausedTransition isCompleteWithView:](self->_activePausedTransition, "isCompleteWithView:", self);
  -[_VUISBIconProgressFractionTransition updateView:withElapsedTime:](self->_activeFractionTransition, "updateView:withElapsedTime:", self, v5);
  if (-[_VUISBIconProgressFractionTransition isCompleteWithView:](self->_activeFractionTransition, "isCompleteWithView:", self)|| v8|| v7)
  {
    -[VUISBIconProgressView _updateTransitionsAnimated:](self, "_updateTransitionsAnimated:", 1);
  }
  objc_autoreleasePoolPop(v6);
}

- (void)_ensureDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  uint64_t v5;

  if (!self->_displayLink)
  {
    self->_lastUpdate = CFAbsoluteTimeGetCurrent();
    v3 = (CADisplayLink *)(id)objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__onDisplayLink_);
    self->_displayLink = v3;
    -[CADisplayLink setPreferredFramesPerSecond:](v3, "setPreferredFramesPerSecond:", 30);
    displayLink = self->_displayLink;
    v5 = objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    -[CADisplayLink addToRunLoop:forMode:](displayLink, "addToRunLoop:forMode:", v5, *MEMORY[0x1E0C99860]);
  }
}

- (void)_clearDisplayLink
{
  CADisplayLink *v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3 = self->_displayLink;
  self->_displayLink = 0;
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
  UIImage *overlayImage;
  double circleRadiusFraction;
  CGRect v18;

  if (fabs(self->_backgroundAlpha) >= 2.22044605e-16)
  {
    -[VUISBIconProgressView bounds](self, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    UIRectGetCenter();
    v13 = v12;
    v15 = v14;
    overlayImage = self->_overlayImage;
    if (overlayImage)
    {
      -[UIImage drawInRect:blendMode:alpha:](overlayImage, "drawInRect:blendMode:alpha:", 17, v5, v7, v9, v11, self->_backgroundAlpha * 0.7);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, self->_backgroundAlpha * 0.7), "set");
      v18.origin.x = v5;
      v18.origin.y = v7;
      v18.size.width = v9;
      v18.size.height = v11;
      UIRectFill(v18);
    }
    circleRadiusFraction = self->_circleRadiusFraction;
    if (fabs(circleRadiusFraction + -1.0) >= 2.22044605e-16)
    {
      if (circleRadiusFraction <= 1.0)
      {
        if (circleRadiusFraction > 0.0)
          -[VUISBIconProgressView _drawIncomingCircleWithCenter:](self, "_drawIncomingCircleWithCenter:", v13, v15);
      }
      else
      {
        -[VUISBIconProgressView _drawOutgoingCircleWithCenter:](self, "_drawOutgoingCircleWithCenter:", v13, v15);
      }
    }
    else
    {
      -[VUISBIconProgressView _drawPieWithCenter:](self, "_drawPieWithCenter:", v13, v15);
    }
    if (fabs(self->_pauseRadiusFraction) >= 2.22044605e-16)
      -[VUISBIconProgressView _drawPauseUIWithCenter:](self, "_drawPauseUIWithCenter:", v13, v15);
  }
}

+ (id)_pieImagesMemoryPool
{
  if (_pieImagesMemoryPool_onceToken != -1)
    dispatch_once(&_pieImagesMemoryPool_onceToken, &__block_literal_global_25);
  return (id)_pieImagesMemoryPool___pool;
}

uint64_t __45__VUISBIconProgressView__pieImagesMemoryPool__block_invoke()
{
  void *v0;
  double v1;
  uint64_t v2;
  uint64_t result;

  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"), "scale");
  v2 = objc_msgSend(v0, "vui_bytesNeededForSize:scale:withContextType:", 0, 78.0, 78.0, v1);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CFA9A0]), "initWithLabel:slotLength:", "iconProgressPieImages", v2);
  _pieImagesMemoryPool___pool = result;
  return result;
}

+ (id)_pieImageAtFraction:(double)a3
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  _QWORD v12[4];
  int64x2_t v13;
  __int128 v14;
  double v15;

  if (_pieImageAtFraction__onceToken != -1)
    dispatch_once(&_pieImageAtFraction__onceToken, &__block_literal_global_19_1);
  LODWORD(v3) = vcvtad_u64_f64(a3 * 100.0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_msgSend((id)_pieImageAtFraction__pieImageCache, "objectForKey:", v6);
  if (!v7)
  {
    v8 = objc_msgSend(a1, "_pieImagesMemoryPool");
    v9 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"), "scale");
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__VUISBIconProgressView__pieImageAtFraction___block_invoke_2;
    v12[3] = &__block_descriptor_72_e5_v8__0l;
    v13 = vdupq_n_s64(0x4053800000000000uLL);
    v14 = xmmword_1DA1C1C00;
    v15 = a3;
    v7 = (void *)objc_msgSend(v9, "vui_imageFromContextWithSize:scale:type:pool:drawing:", 0, v8, v12, 78.0, 78.0, v10);
    if (v7)
      objc_msgSend((id)_pieImageAtFraction__pieImageCache, "setObject:forKey:", v7, v6);
  }
  return v7;
}

id __45__VUISBIconProgressView__pieImageAtFraction___block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  _pieImageAtFraction__pieImageCache = (uint64_t)result;
  return result;
}

uint64_t __45__VUISBIconProgressView__pieImageAtFraction___block_invoke_2(CGFloat *a1)
{
  void *v2;
  uint64_t result;
  double v4;
  double v5;
  void *v6;
  CGRect v7;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7), "set");
  v7.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v7.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v7.size.width = a1[4];
  v7.size.height = a1[5];
  UIRectFill(v7);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2), "set");
  v2 = (void *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a1[6], a1[7], 36.0, 0.0, 6.28318531);
  objc_msgSend(v2, "setLineWidth:", 3.0);
  result = objc_msgSend(v2, "strokeWithBlendMode:alpha:", 17, 1.0);
  v4 = a1[8];
  if (fabs(v4) >= 2.22044605e-16)
  {
    v5 = v4 * 6.28318531 + -1.57079633;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    objc_msgSend(v6, "moveToPoint:", a1[6], a1[7]);
    objc_msgSend(v6, "addLineToPoint:", a1[6], a1[7] + -36.0);
    objc_msgSend(v6, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, a1[6], a1[7], 36.0, -1.57079633, v5);
    objc_msgSend(v6, "addLineToPoint:", a1[6], a1[7]);
    return objc_msgSend(v6, "fillWithBlendMode:alpha:", 17, 1.0);
  }
  return result;
}

- (void)_drawPieWithCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_msgSend((id)objc_opt_class(), "_pieImageAtFraction:", self->_displayedFraction);
  objc_msgSend(v5, "size");
  objc_msgSend(v5, "drawInRect:blendMode:alpha:", 17, ceil(x - v6 * 0.5), ceil(y - v7 * 0.5), v6, v7, 1.0);
}

- (void)_drawOutgoingCircleWithCenter:(CGPoint)a3
{
  double y;
  double x;
  CGContext *CurrentContext;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIImage *maskImage;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  CGImage *v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (self->_overlayImage)
  {
    -[VUISBIconProgressView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    maskImage = self->_maskImage;
    if (!maskImage
      || ((-[UIImage size](maskImage, "size"),
           v18 = vabdd_f64(v17, v14),
           maskImage = self->_maskImage,
           vabdd_f64(v16, v12) < 2.22044605e-16)
        ? (v19 = v18 < 2.22044605e-16)
        : (v19 = 0),
          !v19))
    {

      maskImage = (UIImage *)-[VUISBIconProgressView _maskImage](self, "_maskImage");
      self->_maskImage = maskImage;
    }
    v20 = -[UIImage CGImage](maskImage, "CGImage");
    v21.origin.x = v8;
    v21.origin.y = v10;
    v21.size.width = v12;
    v21.size.height = v14;
    CGContextClipToMask(CurrentContext, v21, v20);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, self->_foregroundAlpha * 0.2), "set");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, fmax(self->_circleRadiusFraction * 36.0, 37.5), 0.0, 6.28318531), "fillWithBlendMode:alpha:", 17, 1.0);
  CGContextRestoreGState(CurrentContext);
}

- (void)_drawIncomingCircleWithCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  void *v7;
  void *v8;
  double v9;

  y = a3.y;
  x = a3.x;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2), "set");
  v6 = self->_circleRadiusFraction * 36.0;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, x, y, v6, 0.0, 6.28318531);
  v8 = v7;
  v9 = 3.0;
  if (v6 <= 3.0)
    v9 = v6;
  objc_msgSend(v7, "setLineWidth:", v9);
  objc_msgSend(v8, "strokeWithBlendMode:alpha:", 17, 1.0);
}

- (void)_drawPauseUIWithCenter:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, a3.x, a3.y, self->_pauseRadiusFraction * 13.0, 0.0, 6.28318531);
  objc_msgSend(v5, "addClip");
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.7), "set");
  objc_msgSend(v5, "fillWithBlendMode:alpha:", 17, 1.0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.2), "set");
  v6 = y + -6.0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x + -5.5, v6, 4.0, 12.0), "fillWithBlendMode:alpha:", 17, 1.0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", x + 1.5, v6, 4.0, 12.0), "fillWithBlendMode:alpha:", 17, 1.0);
}

- (id)_maskImage
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
  CGFloat v12;
  UIImage *ImageFromCurrentImageContext;
  CGSize v15;

  -[VUISBIconProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen"), "scale");
  v12 = v11;
  v15.width = v8;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  -[UIImage drawInRect:blendMode:alpha:](self->_overlayImage, "drawInRect:blendMode:alpha:", 17, v4, v6, v8, v10, 1.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return ImageFromCurrentImageContext;
}

- (CGRect)circleBoundingRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[VUISBIconProgressView bounds](self, "bounds");
  UIRectGetCenter();
  v3 = v2 + -39.0;
  v5 = v4 + -39.0;
  v6 = 78.0;
  v7 = 78.0;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v3;
  return result;
}

- (VUISBIconProgressViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (VUISBIconProgressViewDelegate *)a3;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (BOOL)canAnimate
{
  return self->_canAnimate;
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

@end
