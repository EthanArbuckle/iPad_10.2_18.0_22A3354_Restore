@implementation PLRoundProgressView

- (PLRoundProgressView)initWithFrame:(CGRect)a3
{
  return -[PLRoundProgressView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  PLRoundProgressView *v5;
  PLRoundProgressView *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLRoundProgressView;
  v5 = -[PLRoundProgressView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_allowFake25PercentProgress = 1;
    v5->_skipResetOnRelayout = 0;
    -[PLRoundProgressView setBackgroundColor:](v5, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E0CEA478], "clearColor"));
    -[PLRoundProgressView _updateSubviews](v6, "_updateSubviews");
  }
  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLRoundProgressView;
  -[PLRoundProgressView layoutSubviews](&v3, sel_layoutSubviews);
  -[PLRoundProgressView _updateSubviews](self, "_updateSubviews");
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_progressTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PLRoundProgressView;
  -[PLRoundProgressView dealloc](&v3, sel_dealloc);
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLRoundProgressView;
  -[PLRoundProgressView didMoveToWindow](&v3, sel_didMoveToWindow);
  objc_msgSend((id)objc_msgSend((id)-[PLRoundProgressView window](self, "window"), "screen"), "scale");
  -[PLRoundProgressView _setContentsScale:](self, "_setContentsScale:");
}

- (void)_setContentsScale:(double)a3
{
  if (self->__contentsScale != a3)
  {
    self->__contentsScale = a3;
    -[PLRoundProgressView _updateSublayersContentsScale](self, "_updateSublayersContentsScale");
  }
}

- (void)_setProgressArcLayer:(id)a3
{
  PLProgressArcLayer *progressArcLayer;

  progressArcLayer = self->__progressArcLayer;
  if (progressArcLayer != a3)
  {

    self->__progressArcLayer = (PLProgressArcLayer *)a3;
    -[PLRoundProgressView _updateSublayersContentsScale](self, "_updateSublayersContentsScale");
  }
}

- (void)_updateSublayersContentsScale
{
  double v3;

  -[PLRoundProgressView _contentsScale](self, "_contentsScale");
  -[PLProgressArcLayer setContentsScale:](-[PLRoundProgressView _progressArcLayer](self, "_progressArcLayer"), "setContentsScale:", v3);
}

- (void)_updateSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *v11;
  id v12;
  CALayer *v13;
  double v14;
  UIColor *v15;
  int v16;
  int v17;
  _BOOL4 v18;
  double v19;
  double v20;
  double v21;
  CAShapeLayer *v22;
  CAShapeLayer *v23;
  double pieRadius;
  CGFloat v25;
  CGFloat v26;
  CGPath *Mutable;
  double v28;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double MidX;
  double MidY;
  PLProgressArcLayer *v35;
  double v36;
  double v37;
  CALayer *v38;
  const __CFString *v39;
  uint64_t v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  CGRect v46;
  CGRect v47;

  -[PLRoundProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[PLRoundProgressView _contentView](self, "_contentView");
  if (!v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v11 = (UIView *)(id)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    -[PLRoundProgressView addSubview:](self, "addSubview:", v11);
    -[PLRoundProgressView _setContentView:](self, "_setContentView:", v11);
  }
  -[UIView setFrame:](v11, "setFrame:", v4, v6, v8, v10);
  v13 = -[UIView layer](v11, "layer");
  v14 = 1.0;
  switch(self->_style)
  {
    case 0:
      v15 = (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v16 = 0;
      v17 = 1;
      goto LABEL_8;
    case 1:
      v15 = (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v16 = 0;
      v18 = 0;
      goto LABEL_10;
    case 2:
      v15 = 0;
      v17 = 0;
      v16 = 1;
LABEL_8:
      v18 = 1;
      break;
    case 3:
      v18 = objc_msgSend((id)-[PLRoundProgressView traitCollection](self, "traitCollection"), "userInterfaceStyle") != 2;
      v15 = (UIColor *)objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v16 = 0;
LABEL_10:
      v17 = 1;
      v14 = 0.5;
      break;
    default:
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      break;
  }
  if (-[PLRoundProgressView manualColor](self, "manualColor"))
  {
    v15 = -[PLRoundProgressView manualColor](self, "manualColor");
    *(double *)&v45 = 1.0;
    if (-[UIColor getRed:green:blue:alpha:](v15, "getRed:green:blue:alpha:", 0, 0, 0, &v45))
      v15 = -[UIColor colorWithAlphaComponent:](v15, "colorWithAlphaComponent:", 1.0);
    v14 = *(double *)&v45;
  }
  -[UIView setAlpha:](v11, "setAlpha:", v14);
  v19 = v8 * 0.5;
  if (v8 * 0.5 >= v10 * 0.5)
    v19 = v10 * 0.5;
  v20 = ceil(v19 / 5.5);
  v21 = v19 - v20 * 0.5;
  -[PLRoundProgressView setPieRadius:](self, "setPieRadius:", v21);
  if (-[PLRoundProgressView skipResetOnRelayout](self, "skipResetOnRelayout"))
  {
    if (v17)
      goto LABEL_19;
LABEL_28:
    if (!v16)
      goto LABEL_24;
LABEL_29:
    v44 = v8;
    -[CALayer bounds](v13, "bounds");
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    MidX = CGRectGetMidX(v46);
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    MidY = CGRectGetMidY(v47);
    v35 = -[PLRoundProgressView _progressArcLayer](self, "_progressArcLayer");
    if (!v35)
    {
      v35 = objc_alloc_init(PLProgressArcLayer);
      -[CALayer addSublayer:](v13, "addSublayer:", v35);
      -[PLRoundProgressView _setProgressArcLayer:](self, "_setProgressArcLayer:", v35);
    }
    -[PLProgressArcLayer setPosition:](v35, "setPosition:", MidX, MidY);
    v36 = *MEMORY[0x1E0C9D538];
    v37 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PLProgressArcLayer setBounds:](v35, "setBounds:", *MEMORY[0x1E0C9D538], v37, width, height);
    -[PLProgressArcLayer setRadius:](v35, "setRadius:", v21);
    -[PLProgressArcLayer setLineWidth:](v35, "setLineWidth:", v20);
    v38 = -[PLRoundProgressView _irisGlyphLayer](self, "_irisGlyphLayer");
    if (!v38)
    {
      v38 = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v39 = CFSTR("-Compact");
      if (v44 >= 30.0)
        v39 = CFSTR("-Regular");
      v40 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLProgressIris%@-PhotoIris"), 30.0, v44, v39);
      v41 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:inBundle:", v40, PLPhotoLibraryFrameworkBundle());
      objc_msgSend(v41, "size");
      -[CALayer setBounds:](v38, "setBounds:", v36, v37, v42, v43);
      -[CALayer setContents:](v38, "setContents:", objc_msgSend(v41, "CGImage"));
      -[PLRoundProgressView _setIrisGlyphLayer:](self, "_setIrisGlyphLayer:", v38);
      -[CALayer addSublayer:](v13, "addSublayer:", v38);
    }
    -[CALayer setPosition:](v38, "setPosition:", MidX, MidY);
    if (v18)
      goto LABEL_25;
    goto LABEL_26;
  }
  -[PLRoundProgressView resetProgress](self, "resetProgress");
  if (!v17)
    goto LABEL_28;
LABEL_19:
  v22 = -[PLRoundProgressView _sliceLayer](self, "_sliceLayer");
  if (!v22)
  {
    v22 = (CAShapeLayer *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    -[CALayer addSublayer:](v13, "addSublayer:", v22);
    -[PLRoundProgressView _setSliceLayer:](self, "_setSliceLayer:", v22);
  }
  -[CAShapeLayer setZPosition:](v22, "setZPosition:", 0.0);
  -[CAShapeLayer setStrokeColor:](v22, "setStrokeColor:", 0);
  -[CAShapeLayer setFillColor:](v22, "setFillColor:", -[UIColor CGColor](v15, "CGColor"));
  v23 = -[PLRoundProgressView _circleLayer](self, "_circleLayer");
  if (!v23)
  {
    v23 = (CAShapeLayer *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    -[CALayer addSublayer:](v13, "addSublayer:", v23);
    -[PLRoundProgressView _setCircleLayer:](self, "_setCircleLayer:", v23);
  }
  -[CAShapeLayer setZPosition:](v23, "setZPosition:", 0.0);
  -[CAShapeLayer setStrokeColor:](v23, "setStrokeColor:", -[UIColor CGColor](v15, "CGColor"));
  -[CAShapeLayer setFillColor:](v23, "setFillColor:", 0);
  -[CAShapeLayer setLineWidth:](v23, "setLineWidth:", v20);
  pieRadius = self->_pieRadius;
  v25 = self->_pieCenter.x;
  v26 = self->_pieCenter.y;
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, v25, v26, pieRadius + -1.0, 0.0, 6.28318531, 0);
  CGPathCloseSubpath(Mutable);
  -[CAShapeLayer setPath:](v23, "setPath:", Mutable);
  CGPathRelease(Mutable);
  if (v16)
    goto LABEL_29;
LABEL_24:
  if (v18)
  {
LABEL_25:
    -[CALayer setShadowColor:](v13, "setShadowColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.75), "CGColor"));
    -[CALayer setShadowOffset:](v13, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    LODWORD(v28) = 1.0;
    -[CALayer setShadowOpacity:](v13, "setShadowOpacity:", v28);
    -[CALayer setShadowRadius:](v13, "setShadowRadius:", 0.5);
  }
LABEL_26:
  -[PLRoundProgressView _updateUIProgress](self, "_updateUIProgress");
}

- (void)setPieRadius:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  CGRect v10;
  CGRect v11;

  self->_pieRadius = a3;
  -[PLRoundProgressView bounds](self, "bounds");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  self->_pieCenter.x = MidX;
  self->_pieCenter.y = MidY;
  objc_msgSend((id)-[PLRoundProgressView layer](self, "layer"), "setCornerRadius:", self->_pieRadius);
}

- (void)stopProgressTimer
{
  NSTimer *progressTimer;

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    -[NSTimer invalidate](progressTimer, "invalidate");

    self->_progressTimer = 0;
  }
}

- (void)startProgressTimer
{
  _QWORD v2[5];
  _QWORD v3[6];

  if (self->_uiProgress < 1.0 && !self->_progressTimer)
  {
    v3[0] = 0;
    v3[1] = v3;
    v3[2] = 0x3052000000;
    v3[3] = __Block_byref_object_copy__2558;
    v3[4] = __Block_byref_object_dispose__2559;
    v3[5] = self;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __41__PLRoundProgressView_startProgressTimer__block_invoke;
    v2[3] = &unk_1E70B5F90;
    v2[4] = v3;
    self->_progressTimer = (NSTimer *)(id)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 1, v2, 0.0166666667);
    _Block_object_dispose(v3, 8);
  }
}

- (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void)increaseUIProgress:(id)a3
{
  double realProgress;
  double uiProgress;
  double increaseRate;
  double v8;
  double v9;

  realProgress = self->_realProgress;
  uiProgress = self->_uiProgress;
  if (realProgress == 0.0 || uiProgress < realProgress)
  {
    increaseRate = self->_increaseRate;
    v8 = 1.0;
    if (realProgress >= 1.0)
    {
      v9 = uiProgress + increaseRate;
      if (v9 <= 1.0)
      {
LABEL_12:
        self->_uiProgress = v9;
        -[PLRoundProgressView _updateUIProgress](self, "_updateUIProgress");
        uiProgress = self->_uiProgress;
        goto LABEL_13;
      }
    }
    else
    {
      if (uiProgress + increaseRate * 1.1 >= 1.0)
      {
LABEL_18:
        -[PLRoundProgressView stopProgressTimer](self, "stopProgressTimer");
        return;
      }
      if (realProgress == 0.0)
      {
        if (uiProgress >= 0.25
          || !-[PLRoundProgressView allowFake25PercentProgress](self, "allowFake25PercentProgress", a3))
        {
          goto LABEL_18;
        }
        uiProgress = self->_uiProgress;
        increaseRate = self->_increaseRate;
      }
      v8 = uiProgress + increaseRate;
    }
    v9 = v8;
    goto LABEL_12;
  }
LABEL_13:
  if (uiProgress >= 1.0)
    goto LABEL_18;
}

- (void)_updateUIProgress
{
  double v3;
  double v4;
  CAShapeLayer *v5;
  CAShapeLayer *v6;
  double pieRadius;
  CGFloat x;
  CGFloat y;
  CGPath *Mutable;
  PLProgressArcLayer *v11;
  PLProgressArcLayer *v12;

  -[PLRoundProgressView toRadian:](self, "toRadian:", self->_uiProgress);
  v4 = v3 + 4.71238898;
  v5 = -[PLRoundProgressView _sliceLayer](self, "_sliceLayer");
  if (v5)
  {
    v6 = v5;
    pieRadius = self->_pieRadius;
    x = self->_pieCenter.x;
    y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    -[CAShapeLayer setPath:](v6, "setPath:", Mutable);
    CFRelease(Mutable);
  }
  v11 = -[PLRoundProgressView _progressArcLayer](self, "_progressArcLayer");
  if (v11)
  {
    v12 = v11;
    -[PLProgressArcLayer setStartAngle:](v11, "setStartAngle:", 4.71238898);
    -[PLProgressArcLayer setEndAngle:](v12, "setEndAngle:", v4);
  }
}

- (void)setInitialIncreaseRatePerFrame:(double)a3
{
  if (!self->_progressTimer)
    self->_increaseRate = a3;
}

- (void)recalculateIncreaseProgress:(double)a3 withTimeDiff:(double)a4
{
  double v4;

  v4 = a3 / a4 / 60.0;
  if (v4 < 0.000166666667)
    v4 = 0.000166666667;
  if (v4 > 0.0166666667)
    v4 = 0.0166666667;
  self->_increaseRate = v4;
}

- (void)setProgress:(double)a3
{
  double realProgress;
  double v7;
  double v8;
  double v9;
  double v10;

  self->_progress = a3;
  if (!self->_progressTimer && self->_realProgress <= 1.0)
    -[PLRoundProgressView startProgressTimer](self, "startProgressTimer");
  if (a3 > 0.0)
  {
    realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < a3)
    {
      if (a3 >= 1.0)
      {
        v9 = 1.0 - self->_uiProgress;
        v10 = 0.1;
      }
      else
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", self->_prevUpdateTime);
        v8 = v7;

        self->_prevUpdateTime = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = 1.0 - self->_uiProgress;
        v10 = v8 * (v9 / (a3 - self->_realProgress));
      }
      -[PLRoundProgressView recalculateIncreaseProgress:withTimeDiff:](self, "recalculateIncreaseProgress:withTimeDiff:", v9, v10);
      self->_realProgress = a3;
    }
  }
}

- (void)resetProgress
{
  self->_uiProgress = 0.0;
  self->_increaseRate = 0.00166666667;
  self->_realProgress = 0.0;

  self->_prevUpdateTime = (NSDate *)(id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
  -[PLRoundProgressView stopProgressTimer](self, "stopProgressTimer");
  -[PLRoundProgressView _updateUIProgress](self, "_updateUIProgress");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLRoundProgressView;
  -[PLRoundProgressView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_);
  if (self->_style == 3)
  {
    if (objc_msgSend((id)-[PLRoundProgressView traitCollection](self, "traitCollection"), "hasDifferentColorAppearanceComparedToTraitCollection:", a3))-[PLRoundProgressView _updateSubviews](self, "_updateSubviews");
  }
}

- (void)setManualColor:(id)a3
{
  UIColor *manualColor;

  manualColor = self->_manualColor;
  if (manualColor != a3)
  {
    self->_manualColor = (UIColor *)a3;

    -[PLRoundProgressView _updateSubviews](self, "_updateSubviews");
  }
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)manualColor
{
  return self->_manualColor;
}

- (BOOL)allowFake25PercentProgress
{
  return self->_allowFake25PercentProgress;
}

- (void)setAllowFake25PercentProgress:(BOOL)a3
{
  self->_allowFake25PercentProgress = a3;
}

- (BOOL)skipResetOnRelayout
{
  return self->_skipResetOnRelayout;
}

- (void)setSkipResetOnRelayout:(BOOL)a3
{
  self->_skipResetOnRelayout = a3;
}

- (double)progress
{
  return self->_progress;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (void)_setContentView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (CAShapeLayer)_sliceLayer
{
  return self->__sliceLayer;
}

- (void)_setSliceLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 520);
}

- (CAShapeLayer)_circleLayer
{
  return self->__circleLayer;
}

- (void)_setCircleLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 528);
}

- (PLProgressArcLayer)_progressArcLayer
{
  return self->__progressArcLayer;
}

- (CALayer)_irisGlyphLayer
{
  return self->__irisGlyphLayer;
}

- (void)_setIrisGlyphLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 544);
}

- (double)_contentsScale
{
  return self->__contentsScale;
}

uint64_t __41__PLRoundProgressView_startProgressTimer__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "increaseUIProgress:", a2);
}

@end
