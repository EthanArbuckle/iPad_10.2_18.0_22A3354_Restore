@implementation TKDownloadIndicatorView

- (TKDownloadIndicatorView)init
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = *MEMORY[0x24BDBF090];
  v4 = *(double *)(MEMORY[0x24BDBF090] + 8);
  objc_msgSend((id)objc_opt_class(), "_intrinsicDownloadIndicatorViewSize");
  return -[TKDownloadIndicatorView initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (TKDownloadIndicatorView)initWithFrame:(CGRect)a3
{
  TKDownloadIndicatorView *v3;
  TKDownloadIndicatorView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TKDownloadIndicatorView;
  v3 = -[TKDownloadIndicatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TKDownloadIndicatorView setOpaque:](v3, "setOpaque:", 0);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TKDownloadIndicatorView;
  -[TKDownloadIndicatorView dealloc](&v3, sel_dealloc);
}

+ (CGSize)_intrinsicDownloadIndicatorViewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 20.0;
  v3 = 20.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)objc_opt_class(), "_intrinsicDownloadIndicatorViewSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKDownloadIndicatorView;
  -[TKDownloadIndicatorView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TKDownloadIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TKDownloadIndicatorView;
  -[TKDownloadIndicatorView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TKDownloadIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v14;
  double MidY;
  double v16;
  double v17;
  double v18;
  int *v19;
  double v20;
  id v21;
  id v22;
  double v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.56640625, 0.56640625, 0.5859375, 1.0);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFill");
  objc_msgSend(v24, "setStroke");
  -[TKDownloadIndicatorView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  TKFloatGetSafeScaleForValue(v6);
  v8 = v7;

  -[TKDownloadIndicatorView bounds](self, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MidX = CGRectGetMidX(v25);
  v14 = TKFloatRoundForScale(MidX, v8);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MidY = CGRectGetMidY(v26);
  v23 = TKFloatRoundForScale(MidY, v8);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v16 = CGRectGetWidth(v27) * 0.5;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v17 = CGRectGetHeight(v28) * 0.5;
  if (v16 < v17)
    v17 = v16;
  v18 = TKFloatFloorForScale(v17, v8);
  if (self->_isAnimatingProgress)
    v19 = &OBJC_IVAR___TKDownloadIndicatorView__currentAnimatedProgress;
  else
    v19 = &OBJC_IVAR___TKDownloadIndicatorView__progress;
  v20 = *(float *)((char *)&self->super.super.super.isa + *v19) * 6.28318531 + -1.57079633;
  v21 = objc_alloc_init(MEMORY[0x24BDF6870]);
  objc_msgSend(v21, "moveToPoint:", v14, v23);
  objc_msgSend(v21, "addLineToPoint:", v14, 0.0);
  objc_msgSend(v21, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v23, v18, -1.57079633, v20);
  objc_msgSend(v21, "closePath");
  objc_msgSend(v21, "fill");
  v22 = objc_alloc_init(MEMORY[0x24BDF6870]);
  objc_msgSend(v22, "setLineWidth:", 1.0);
  objc_msgSend(v22, "moveToPoint:", v14, 0.0);
  objc_msgSend(v22, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, v23, v18 + -0.5, -1.57079633, 4.71238898);
  objc_msgSend(v22, "stroke");
  CGContextRestoreGState(CurrentContext);

}

- (void)setProgress:(float)a3
{
  -[TKDownloadIndicatorView setProgress:animated:completion:](self, "setProgress:animated:completion:", 0, 0);
}

- (void)setProgress:(float)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(void);
  double v9;
  float v10;
  float progress;
  void *v12;
  void *v13;
  double v14;
  void (**v15)(void);
  CADisplayLink *v16;
  CADisplayLink *displayLink;
  CADisplayLink *v18;
  void *v19;
  CAMediaTimingFunction *v20;
  CAMediaTimingFunction *progressAnimationTimingFunction;
  NSMutableArray *progressAnimationCompletionHandlers;
  void (**v23)(void);
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  void (**v27)(void);

  v5 = a4;
  v8 = (void (**)(void))a5;
  v9 = a3;
  if (a3 < 0.0)
    v9 = 0.0;
  v10 = fmin(v9, 1.0);
  progress = self->_progress;
  v27 = v8;
  if (llroundf(progress * 8388600.0) != llroundf(v10 * 8388600.0))
  {
    self->_progress = v10;
    -[TKDownloadIndicatorView window](self, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v13)
    {
      v14 = CACurrentMediaTime();
      self->_progressAnimationStartTime = v14;
      self->_progressAnimationEndTime = v14 + 1.2;
      if (self->_isAnimatingProgress)
        progress = self->_currentAnimatedProgress;
      self->_initialAnimatedProgress = progress;
      self->_currentAnimatedProgress = progress;
      v15 = v27;
      if (!self->_displayLink)
      {
        objc_msgSend(v13, "displayLinkWithTarget:selector:", self, sel__handleDisplayLinkDidFire_);
        v16 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
        displayLink = self->_displayLink;
        self->_displayLink = v16;

        v18 = self->_displayLink;
        objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CADisplayLink addToRunLoop:forMode:](v18, "addToRunLoop:forMode:", v19, *MEMORY[0x24BDBCB80]);

        v15 = v27;
      }
      if (!self->_progressAnimationTimingFunction)
      {
        objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
        v20 = (CAMediaTimingFunction *)objc_claimAutoreleasedReturnValue();
        progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
        self->_progressAnimationTimingFunction = v20;

        v15 = v27;
      }
      if (v15)
      {
        progressAnimationCompletionHandlers = self->_progressAnimationCompletionHandlers;
        v23 = v27;
        if (!progressAnimationCompletionHandlers)
        {
          v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v25 = self->_progressAnimationCompletionHandlers;
          self->_progressAnimationCompletionHandlers = v24;

          v23 = v27;
          progressAnimationCompletionHandlers = self->_progressAnimationCompletionHandlers;
        }
        v26 = (void *)MEMORY[0x2199E5D50](v23);
        -[NSMutableArray addObject:](progressAnimationCompletionHandlers, "addObject:", v26);

      }
      self->_isAnimatingProgress = 1;
      -[TKDownloadIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
    }
    else
    {
      -[TKDownloadIndicatorView _stopProgressAnimation](self, "_stopProgressAnimation");
      -[TKDownloadIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
      if (v27)
        v27[2]();
    }

    goto LABEL_22;
  }
  if (v8)
  {
    ((void (*)(void (**)(void)))v8[2])(v8);
LABEL_22:
    v8 = v27;
  }

}

- (void)_handleDisplayLinkDidFire:(id)a3
{
  double v4;
  float v5;
  CAMediaTimingFunction *progressAnimationTimingFunction;

  if (llround(self->_progressAnimationStartTime * 8388608.0) != llround(self->_progressAnimationEndTime * 8388608.0))
  {
    objc_msgSend(a3, "timestamp");
    v5 = (v4 - self->_progressAnimationStartTime)
       / (self->_progressAnimationEndTime - self->_progressAnimationStartTime);
    if (v5 >= 0.99)
    {
      -[TKDownloadIndicatorView _stopProgressAnimation](self, "_stopProgressAnimation");
    }
    else
    {
      progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
      if (progressAnimationTimingFunction)
        -[CAMediaTimingFunction _solveForInput:](progressAnimationTimingFunction, "_solveForInput:");
      self->_currentAnimatedProgress = self->_initialAnimatedProgress
                                     + (float)((float)(self->_progress - self->_initialAnimatedProgress) * v5);
    }
    -[TKDownloadIndicatorView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)_stopProgressAnimation
{
  CADisplayLink *displayLink;
  CAMediaTimingFunction *progressAnimationTimingFunction;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  self->_isAnimatingProgress = 0;
  self->_currentAnimatedProgress = 0.0;
  self->_initialAnimatedProgress = 0.0;
  self->_progressAnimationStartTime = 0.0;
  self->_progressAnimationEndTime = 0.0;
  progressAnimationTimingFunction = self->_progressAnimationTimingFunction;
  self->_progressAnimationTimingFunction = 0;

  v5 = (void *)-[NSMutableArray copy](self->_progressAnimationCompletionHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_progressAnimationCompletionHandlers, "removeAllObjects");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (float)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressAnimationTimingFunction, 0);
  objc_storeStrong((id *)&self->_progressAnimationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
