@implementation STSRoundProgressView

- (STSRoundProgressView)initWithFrame:(CGRect)a3
{
  return -[STSRoundProgressView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (STSRoundProgressView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  STSRoundProgressView *v5;
  STSRoundProgressView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STSRoundProgressView;
  v5 = -[STSRoundProgressView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSRoundProgressView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[STSRoundProgressView _setupSubviews](v6, "_setupSubviews");
  }
  return v6;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSRoundProgressView;
  -[STSRoundProgressView layoutSubviews](&v3, sel_layoutSubviews);
  -[STSRoundProgressView _setupSubviews](self, "_setupSubviews");
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSRoundProgressView;
  -[STSRoundProgressView didMoveToWindow](&v7, sel_didMoveToWindow);
  -[STSRoundProgressView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  -[STSRoundProgressView _setContentsScale:](self, "_setContentsScale:", v6);
}

- (void)_setContentsScale:(double)a3
{
  if (self->__contentsScale != a3)
  {
    self->__contentsScale = a3;
    -[STSRoundProgressView _updateSublayersContentsScale](self, "_updateSublayersContentsScale");
  }
}

- (void)_setProgressArcLayer:(id)a3
{
  STSProgressArcLayer *v5;
  STSProgressArcLayer *v6;

  v5 = (STSProgressArcLayer *)a3;
  if (self->__progressArcLayer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__progressArcLayer, a3);
    -[STSRoundProgressView _updateSublayersContentsScale](self, "_updateSublayersContentsScale");
    v5 = v6;
  }

}

- (void)_updateSublayersContentsScale
{
  double v3;
  double v4;
  id v5;

  -[STSRoundProgressView _contentsScale](self, "_contentsScale");
  v4 = v3;
  -[STSRoundProgressView _progressArcLayer](self, "_progressArcLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentsScale:", v4);

}

- (void)_setupSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  int64_t style;
  double v12;
  int v13;
  int v14;
  double v15;
  double v16;
  NSTimer *progressTimer;
  CAShapeLayer *v18;
  CAShapeLayer *sliceLayer;
  CAShapeLayer *v20;
  id v21;
  CAShapeLayer *v22;
  CAShapeLayer *circleLayer;
  double pieRadius;
  CGFloat x;
  CGFloat y;
  CGPath *Mutable;
  id v28;
  double v29;
  id v30;

  -[STSRoundProgressView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v7, v8, v3, v5);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  -[STSRoundProgressView addSubview:](self, "addSubview:", v9);
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  if (style == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v13 = 1;
    v12 = 0.5;
  }
  else
  {
    v12 = 1.0;
    if (style)
    {
      v30 = 0;
      v13 = 0;
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      v14 = 1;
    }
  }
  objc_msgSend(v9, "setAlpha:", v12);
  v15 = v4 * 0.5;
  if (v4 * 0.5 >= v6 * 0.5)
    v15 = v6 * 0.5;
  v16 = ceil(v15 / 5.5);
  -[STSRoundProgressView setPieRadius:](self, "setPieRadius:", v15 - v16 * 0.5);
  progressTimer = self->_progressTimer;
  self->_progressTimer = 0;

  -[STSRoundProgressView resetProgress](self, "resetProgress");
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v18 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    sliceLayer = self->_sliceLayer;
    self->_sliceLayer = v18;

    -[CAShapeLayer setZPosition:](self->_sliceLayer, "setZPosition:", 0.0);
    -[CAShapeLayer setStrokeColor:](self->_sliceLayer, "setStrokeColor:", 0);
    v20 = self->_sliceLayer;
    v21 = objc_retainAutorelease(v30);
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", objc_msgSend(v21, "CGColor"));
    objc_msgSend(MEMORY[0x24BDE5758], "layer");
    v22 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue();
    circleLayer = self->_circleLayer;
    self->_circleLayer = v22;

    -[CAShapeLayer setZPosition:](self->_circleLayer, "setZPosition:", 0.0);
    -[CAShapeLayer setStrokeColor:](self->_circleLayer, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v21), "CGColor"));
    -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", 0);
    -[CAShapeLayer setLineWidth:](self->_circleLayer, "setLineWidth:", v16);
    pieRadius = self->_pieRadius;
    x = self->_pieCenter.x;
    y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathAddArc(Mutable, 0, x, y, pieRadius + -1.0, 0.0, 6.28318531, 0);
    CGPathCloseSubpath(Mutable);
    -[CAShapeLayer setPath:](self->_circleLayer, "setPath:", Mutable);
    CGPathRelease(Mutable);
    objc_msgSend(v10, "addSublayer:", self->_circleLayer);
    objc_msgSend(v10, "addSublayer:", self->_sliceLayer);
  }
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.75);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v28, "CGColor"));

    objc_msgSend(v10, "setShadowOffset:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
    LODWORD(v29) = 1.0;
    objc_msgSend(v10, "setShadowOpacity:", v29);
    objc_msgSend(v10, "setShadowRadius:", 0.5);
  }
  -[STSRoundProgressView _updateUIProgress](self, "_updateUIProgress");

}

- (void)setPieRadius:(double)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  id v10;
  CGRect v11;
  CGRect v12;

  self->_pieRadius = a3;
  -[STSRoundProgressView bounds](self, "bounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  self->_pieCenter.x = MidX;
  self->_pieCenter.y = MidY;
  -[STSRoundProgressView layer](self, "layer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", self->_pieRadius);

}

- (void)stopProgressTimer
{
  NSTimer *progressTimer;
  NSTimer *v4;

  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    -[NSTimer invalidate](progressTimer, "invalidate");
    v4 = self->_progressTimer;
    self->_progressTimer = 0;

  }
}

- (void)startProgressTimer
{
  NSTimer *v3;
  NSTimer *progressTimer;

  if (self->_uiProgress < 1.0 && !self->_progressTimer)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_increaseUIProgress_, 0, 1, 0.0166666667);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    progressTimer = self->_progressTimer;
    self->_progressTimer = v3;

  }
}

- (double)toRadian:(double)a3
{
  return (a3 + a3) * 3.14159265;
}

- (void)increaseUIProgress:(id)a3
{
  double realProgress;
  double v5;
  double uiProgress;
  double increaseRate;
  double v8;
  double v9;
  id v10;

  v10 = a3;
  realProgress = self->_realProgress;
  if (realProgress == 0.0 || (v5 = self->_uiProgress, v5 < realProgress))
  {
    uiProgress = self->_uiProgress;
    increaseRate = self->_increaseRate;
    v8 = 1.0;
    if (realProgress >= 1.0)
    {
      v9 = uiProgress + increaseRate;
      if (uiProgress + increaseRate <= 1.0)
      {
LABEL_10:
        self->_uiProgress = v9;
        -[STSRoundProgressView _updateUIProgress](self, "_updateUIProgress");
        v5 = self->_uiProgress;
        goto LABEL_11;
      }
    }
    else
    {
      if (uiProgress + increaseRate * 1.1 >= 1.0 || realProgress == 0.0 && uiProgress >= 0.05)
        goto LABEL_12;
      v8 = uiProgress + increaseRate;
    }
    v9 = v8;
    goto LABEL_10;
  }
LABEL_11:
  if (v5 >= 1.0)
LABEL_12:
    -[STSRoundProgressView stopProgressTimer](self, "stopProgressTimer");

}

- (void)_updateUIProgress
{
  double v3;
  double v4;
  double pieRadius;
  CGFloat x;
  CGFloat y;
  CGPath *Mutable;
  void *v9;
  id v10;

  -[STSRoundProgressView toRadian:](self, "toRadian:", self->_uiProgress);
  v4 = v3 + 4.71238898;
  if (self->_sliceLayer)
  {
    pieRadius = self->_pieRadius;
    x = self->_pieCenter.x;
    y = self->_pieCenter.y;
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, x, y);
    CGPathAddArc(Mutable, 0, x, y, pieRadius, 4.71238898, v4, 0);
    CGPathCloseSubpath(Mutable);
    -[CAShapeLayer setPath:](self->_sliceLayer, "setPath:", Mutable);
    CFRelease(Mutable);
  }
  -[STSRoundProgressView _progressArcLayer](self, "_progressArcLayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "setStartAngle:", 4.71238898);
    objc_msgSend(v10, "setEndAngle:", v4);
    v9 = v10;
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
  self->_increaseRate = v4;
}

- (void)setProgress:(double)a3
{
  double realProgress;
  void *v7;
  double v8;
  double v9;
  NSDate *v10;
  NSDate *prevUpdateTime;
  double v12;
  double v13;

  self->_progress = a3;
  if (!self->_progressTimer && self->_realProgress <= 1.0)
    -[STSRoundProgressView startProgressTimer](self, "startProgressTimer");
  if (a3 > 0.0)
  {
    realProgress = self->_realProgress;
    if (realProgress < 1.0 && realProgress < a3)
    {
      if (a3 >= 1.0)
      {
        v12 = 1.0 - self->_uiProgress;
        v13 = 0.1;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceDate:", self->_prevUpdateTime);
        v9 = v8;

        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
        prevUpdateTime = self->_prevUpdateTime;
        self->_prevUpdateTime = v10;

        v12 = 1.0 - self->_uiProgress;
        v13 = v9 * (v12 / (a3 - self->_realProgress));
      }
      -[STSRoundProgressView recalculateIncreaseProgress:withTimeDiff:](self, "recalculateIncreaseProgress:withTimeDiff:", v12, v13);
      self->_realProgress = a3;
    }
  }
}

- (void)resetProgress
{
  NSDate *v3;
  NSDate *prevUpdateTime;

  self->_uiProgress = 0.0;
  self->_increaseRate = 0.00166666667;
  self->_realProgress = 0.0;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  prevUpdateTime = self->_prevUpdateTime;
  self->_prevUpdateTime = v3;

  -[STSRoundProgressView stopProgressTimer](self, "stopProgressTimer");
  -[STSRoundProgressView _updateUIProgress](self, "_updateUIProgress");
}

- (int64_t)style
{
  return self->_style;
}

- (double)progress
{
  return self->_progress;
}

- (STSProgressArcLayer)_progressArcLayer
{
  return self->__progressArcLayer;
}

- (double)_contentsScale
{
  return self->__contentsScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__progressArcLayer, 0);
  objc_storeStrong((id *)&self->_prevUpdateTime, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_sliceLayer, 0);
}

@end
