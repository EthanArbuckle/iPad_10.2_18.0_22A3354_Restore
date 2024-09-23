@implementation _UIDynamicCaretInput

- (_UIDynamicCaretInput)initWithFrame:(CGRect)a3
{
  double width;
  _UIDynamicCaretInput *v4;
  _UIDynamicCaretInput *v5;
  UIDelayedAction *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  _UIDynamicCaretDot *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[2];

  width = a3.size.width;
  v19[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_UIDynamicCaretInput;
  v4 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
    v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", v5, sel_committedStrokes, 0, 2.0);
    -[_UIDynamicCaretInput setCommittedAction:](v5, "setCommittedAction:", v6);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v7, "setValue:forKey:", &unk_1E1A96130, CFSTR("inputRadius"));
    v19[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFilters:", v8);

    v10 = width * 0.3;
    v11 = -[_UIDynamicCaretDot initWithFrame:]([_UIDynamicCaretDot alloc], "initWithFrame:", 0.0, 0.0, v10, v10);
    -[_UIDynamicCaretInput setDotView:](v5, "setDotView:", v11);

    -[_UIDynamicCaretInput dotView](v5, "dotView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", v10 * 0.5);

    -[_UIDynamicCaretInput dotView](v5, "dotView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.5);

    -[_UIDynamicCaretInput dotView](v5, "dotView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 1);

    -[_UIDynamicCaretInput dotView](v5, "dotView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v5, "addSubview:", v16);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  CGContextRelease(self->_bitmapContext);
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicCaretInput;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)setFrame:(CGRect)a3
{
  double width;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  width = a3.size.width;
  v10.receiver = self;
  v10.super_class = (Class)_UIDynamicCaretInput;
  -[UIView setFrame:](&v10, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UIDynamicCaretInput dotView](self, "dotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBounds:", 0.0, 0.0, width * 0.3, width * 0.3);

  -[_UIDynamicCaretInput dotView](self, "dotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", width * 0.3 * 0.5);

  -[UIView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width * 0.05);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKeyPath:", v9, CFSTR("filters.gaussianBlur.inputRadius"));

}

- (BOOL)hasInk
{
  void *v2;
  BOOL v3;

  -[_UIDynamicCaretInput accumulatedStrokes](self, "accumulatedStrokes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfStrokes") != 0;

  return v3;
}

- (BOOL)isInking
{
  void *v2;
  char v3;

  -[_UIDynamicCaretInput dotView](self, "dotView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (double)inkWidth
{
  return 5.0;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  objc_super v4;

  -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4.receiver = self;
  v4.super_class = (Class)_UIDynamicCaretInput;
  -[UIView setNeedsDisplayInRect:](&v4, sel_setNeedsDisplayInRect_);
}

- (void)clearFadeTimer
{
  void *v3;

  -[_UIDynamicCaretInput fadeTimer](self, "fadeTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[_UIDynamicCaretInput setFadeTimer:](self, "setFadeTimer:", 0);
}

- (void)_fadeInk
{
  void *v3;
  int v4;
  int64_t fadeCount;

  -[_UIDynamicCaretInput dotView](self, "dotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHidden");

  if (v4)
  {
    fadeCount = self->_fadeCount;
    self->_fadeCount = fadeCount - 1;
    if (fadeCount <= 1)
      -[_UIDynamicCaretInput clearFadeTimer](self, "clearFadeTimer");
  }
  CGContextSetRGBFillColor(self->_bitmapContext, 0.13, 0.13, 0.13, 0.1);
  CGContextFillRect(self->_bitmapContext, self->_inkedAreaOfBitmapContext);
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  _QWORD *ContextStack;
  CGContext *v13;
  CGImage *Image;
  CGRect v15;

  if (self->_bitmapContext)
  {
    -[UIView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v13 = 0;
    else
      v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v13);
    Image = CGBitmapContextCreateImage(self->_bitmapContext);
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.width = v9;
    v15.size.height = v11;
    CGContextDrawImage(v13, v15, Image);
    CFRelease(Image);
    CGContextRestoreGState(v13);
  }
}

- (void)drawPoint:(CGPoint)a3
{
  double y;
  double x;
  CGContext *bitmapContext;
  CGColorSpace *DeviceRGB;
  double v8;
  size_t v9;
  double v10;
  CGContext *v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v16;
  CGRect v17;
  NSRect v18;

  y = a3.y;
  x = a3.x;
  bitmapContext = self->_bitmapContext;
  if (!bitmapContext)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    -[UIView bounds](self, "bounds");
    v9 = (unint64_t)v8;
    -[UIView bounds](self, "bounds");
    self->_bitmapContext = CGBitmapContextCreate(0, v9, (unint64_t)v10, 8uLL, 0, DeviceRGB, 0x2002u);
    CFRelease(DeviceRGB);
    v11 = self->_bitmapContext;
    -[UIView bounds](self, "bounds");
    CGContextClearRect(v11, v16);
    bitmapContext = self->_bitmapContext;
  }
  CGContextSetRGBFillColor(bitmapContext, 1.0, 1.0, 1.0, 1.0);
  -[_UIDynamicCaretInput inkWidth](self, "inkWidth");
  v13 = x - v12;
  v14 = y - v12;
  v15 = v12 + v12;
  v17.origin.x = v13;
  v17.origin.y = v14;
  v17.size.width = v15;
  v17.size.height = v15;
  CGContextFillEllipseInRect(self->_bitmapContext, v17);
  v18.origin.x = v13;
  v18.origin.y = v14;
  v18.size.width = v15;
  v18.size.height = v15;
  self->_inkedAreaOfBitmapContext = NSUnionRect(self->_inkedAreaOfBitmapContext, v18);
}

- (void)log
{
  id v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  FILE *v10;
  unint64_t v11;
  unint64_t v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  id v17;

  -[_UIDynamicCaretInput accumulatedStrokes](self, "accumulatedStrokes");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "numberOfStrokes"))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v2, "setDateFormat:", CFSTR("%Y-%m-%d-%H%M%S"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringFromDate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (geteuid())
    {
      NSHomeDirectory();
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = &stru_1E16EDF20;
    }
    -[__CFString stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", CFSTR("/Library/Logs/CrashReporter/HandwritingCapture/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Capture_%@.log"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_retainAutorelease(v8);
    v10 = fopen((const char *)objc_msgSend(v9, "UTF8String"), "w+");
    if (v10
      || *__error() == 2
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0), v15, v16)&& (v10 = fopen((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), "w+")) != 0)
    {
      if (objc_msgSend(v17, "numberOfStrokes"))
      {
        v11 = 0;
        do
        {
          if (objc_msgSend(v17, "numberOfPointsInStrokeAtIndex:", v11))
          {
            v12 = 0;
            do
            {
              objc_msgSend(v17, "pointAtIndex:inStrokeAtIndex:", v12, v11);
              fprintf(v10, "%d %d\n", (int)v13, (int)v14);
              ++v12;
            }
            while (v12 < objc_msgSend(v17, "numberOfPointsInStrokeAtIndex:", v11));
          }
          fwrite(";\n", 2uLL, 1uLL, v10);
          ++v11;
        }
        while (v11 < objc_msgSend(v17, "numberOfStrokes"));
      }
      fclose(v10);
    }

  }
}

- (void)committedStrokes
{
  -[_UIDynamicCaretInput send](self, "send");
  -[_UIDynamicCaretInput clearAndNotify:](self, "clearAndNotify:", 1);
}

- (void)clearAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  CGContext *bitmapContext;
  CGSize v7;
  id v8;
  CGRect v9;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0DBDB88]);
  -[_UIDynamicCaretInput setAccumulatedStrokes:](self, "setAccumulatedStrokes:", v5);

  -[_UIDynamicCaretInput clearFadeTimer](self, "clearFadeTimer");
  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    -[UIView bounds](self, "bounds");
    CGContextClearRect(bitmapContext, v9);
    v7 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    self->_inkedAreaOfBitmapContext.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    self->_inkedAreaOfBitmapContext.size = v7;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  if (v3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "clearInput");

  }
}

- (void)send
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[_UIDynamicCaretInput accumulatedStrokes](self, "accumulatedStrokes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfStrokes");

  if (v4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicCaretInput accumulatedStrokes](self, "accumulatedStrokes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInputObject:", v5);

  }
}

- (void)addInkPoint:(CGPoint)a3 fromLastPoint:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  float v9;
  CGFloat v10;
  __int128 v11;
  int v12;
  float v13;
  double x;
  double y;
  float64x2_t v16;
  id v17[2];
  void *v18;

  v4 = a4;
  x = a3.x;
  y = a3.y;
  -[_UIDynamicCaretInput accumulatedStrokes](self, "accumulatedStrokes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0DBDB88]);
    -[_UIDynamicCaretInput setAccumulatedStrokes:](self, "setAccumulatedStrokes:", v7);

  }
  -[_UIDynamicCaretInput accumulatedStrokes](self, "accumulatedStrokes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addPoint:", x, y);

  if (!v4)
  {
    -[_UIDynamicCaretInput drawPoint:](self, "drawPoint:", x, y);
LABEL_9:
    *(double *)&v11 = x;
    v10 = y;
    goto LABEL_10;
  }
  v9 = sqrt((x - self->_lastViewLoc.x) * (x - self->_lastViewLoc.x)+ (y - self->_lastViewLoc.y) * (y - self->_lastViewLoc.y));
  v10 = y;
  *(double *)&v11 = x;
  if (v9 > 0.0)
  {
    *((double *)&v11 + 1) = y;
    v16 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v9), 0);
    *(_OWORD *)v17 = v11;
    v12 = 1;
    do
    {
      -[_UIDynamicCaretInput drawPoint:](self, "drawPoint:", vcvtq_f64_f32(vcvt_f32_f64(vaddq_f64((float64x2_t)self->_lastViewLoc, vdivq_f64(vmulq_n_f64(vsubq_f64(*(float64x2_t *)v17, (float64x2_t)self->_lastViewLoc), (double)(v12 - 1)), v16)))));
      v13 = (float)v12++;
    }
    while (v13 < v9);
    goto LABEL_9;
  }
LABEL_10:
  *(_QWORD *)&self->_lastViewLoc.x = v11;
  self->_lastViewLoc.y = v10;
  -[_UIDynamicCaretInput committedAction](self, "committedAction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "touch");

}

- (void)startTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  y = a3.y;
  x = a3.x;
  -[_UIDynamicCaretInput dotView](self, "dotView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  -[_UIDynamicCaretInput dotView](self, "dotView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPosition:", x, y);

  -[_UIDynamicCaretInput addInkPoint:fromLastPoint:](self, "addInkPoint:fromLastPoint:", 0, x, y);
  -[_UIDynamicCaretInput fadeTimer](self, "fadeTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__fadeInk, 0, 1, 0.0333333333);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicCaretInput setFadeTimer:](self, "setFadeTimer:", v9);

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[_UIDynamicCaretInput fadeTimer](self, "fadeTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTimer:forMode:", v10, *MEMORY[0x1E0C99748]);

  }
}

- (void)addTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  if ((a3.x - self->_lastViewLoc.x) * (a3.x - self->_lastViewLoc.x)
     + (a3.y - self->_lastViewLoc.y) * (a3.y - self->_lastViewLoc.y) > 0.25)
    -[_UIDynamicCaretInput addInkPoint:fromLastPoint:](self, "addInkPoint:fromLastPoint:", 1, a3.x, a3.y);
  -[_UIDynamicCaretInput dotView](self, "dotView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPosition:", x, y);

}

- (void)endTouchAtPoint:(CGPoint)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[_UIDynamicCaretInput dotView](self, "dotView", a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isHidden");

  if ((v5 & 1) == 0)
  {
    -[_UIDynamicCaretInput dotView](self, "dotView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 1);

    self->_fadeCount = 30;
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    -[_UIDynamicCaretInput committedStrokes](self, "committedStrokes");
    -[_UIDynamicCaretInput committedAction](self, "committedAction");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancel");

  }
}

- (void)cancelTouchAtPoint:(CGPoint)a3
{
  -[_UIDynamicCaretInput endTouchAtPoint:](self, "endTouchAtPoint:", a3.x, a3.y);
  -[_UIDynamicCaretInput clearAndNotify:](self, "clearAndNotify:", 1);
}

- (NSTimer)fadeTimer
{
  return self->_fadeTimer;
}

- (void)setFadeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fadeTimer, a3);
}

- (TIHandwritingStrokes)accumulatedStrokes
{
  return self->_accumulatedStrokes;
}

- (void)setAccumulatedStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_accumulatedStrokes, a3);
}

- (UIDelayedAction)committedAction
{
  return self->_committedAction;
}

- (void)setCommittedAction:(id)a3
{
  objc_storeStrong((id *)&self->_committedAction, a3);
}

- (_UIDynamicCaretDot)dotView
{
  return self->_dotView;
}

- (void)setDotView:(id)a3
{
  objc_storeStrong((id *)&self->_dotView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotView, 0);
  objc_storeStrong((id *)&self->_committedAction, 0);
  objc_storeStrong((id *)&self->_accumulatedStrokes, 0);
  objc_storeStrong((id *)&self->_fadeTimer, 0);
}

@end
