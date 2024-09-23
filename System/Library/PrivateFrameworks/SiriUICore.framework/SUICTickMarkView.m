@implementation SUICTickMarkView

+ (void)initialize
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___SUICTickMarkView;
  objc_msgSendSuper2(&v6, sel_initialize);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.96875, 0.25390625, 0.36328125, 1.0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)__redColor;
  __redColor = v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.15625, 0.52734375, 0.9921875, 1.0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)__blueColor;
  __blueColor = v4;

}

- (SUICTickMarkView)init
{
  SUICTickMarkView *v2;
  SUICTickMarkView *v3;
  CADisplayLink *displayLink;
  NSTimer *safetyTimer;
  NSLock *v6;
  NSLock *completionLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUICTickMarkView;
  v2 = -[SUICTickMarkView init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shown = 0;
    v2->_currentPreferredFrameRate = 3;
    v2->_animState = 0;
    v2->_currentFrame = 0;
    displayLink = v2->_displayLink;
    v2->_displayLink = 0;

    safetyTimer = v3->_safetyTimer;
    v3->_safetyTimer = 0;

    -[SUICTickMarkView setOpaque:](v3, "setOpaque:", 0);
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    completionLock = v3->_completionLock;
    v3->_completionLock = v6;

    -[SUICTickMarkView setUpDisplayLink](v3, "setUpDisplayLink");
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v9;
  int animState;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  double v21;
  float v22;
  float v23;
  id v24;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGContextClearRect(CurrentContext, v28);
  animState = self->_animState;
  switch(animState)
  {
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0 - (float)((float)self->_currentFrame / (float)self->_fadeOutFrames));
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor"));
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      CGContextFillRect(CurrentContext, v32);
      v26 = self->_currentFrame + 1;
      self->_currentFrame = v26;
      if (v26 == self->_fadeOutFrames)
      {
        self->_animState = 0;
        if (self->_completionBlock)
        {
          -[NSLock lock](self->_completionLock, "lock");
          if (self->_completionCalled)
          {
            -[NSLock unlock](self->_completionLock, "unlock");
          }
          else
          {
            self->_completionCalled = 1;
            -[NSLock unlock](self->_completionLock, "unlock");
            (*((void (**)(void))self->_completionBlock + 2))();
          }
        }
      }
      goto LABEL_12;
    case 2:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor"));
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      CGContextFillRect(CurrentContext, v33);
      v27 = self->_currentFrame + 1;
      self->_currentFrame = v27;
      if (v27 == self->_pauseFrames)
      {
        self->_animState = 3;
        self->_currentFrame = 0;
      }
      goto LABEL_12;
    case 1:
      v11 = width;
      v12 = (float)self->_currentFrame / (float)self->_fadeInFrames;
      *(float *)&v9 = (float)(v12 + -0.4) / 0.8;
      +[SUICSigmoid sigmoid_norm:](SUICSigmoid, "sigmoid_norm:", v9);
      v14 = v13 * v11;
      *(float *)&v15 = (float)(v12 + -0.6) / 0.3;
      +[SUICSigmoid sigmoid_norm:](SUICSigmoid, "sigmoid_norm:", v15);
      v17 = 1.0 - v16;
      *(float *)&v18 = (float)(v12 + -0.35) / 0.6;
      +[SUICSigmoid sigmoid_norm:](SUICSigmoid, "sigmoid_norm:", v18);
      v20 = v19 * v11;
      *(float *)&v21 = (float)(v12 + -0.3) / 0.4;
      +[SUICSigmoid sigmoid_norm:](SUICSigmoid, "sigmoid_norm:", v21);
      v23 = v22 * v11;
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)__redColor, "CGColor"));
      v29.size.width = v23;
      v29.origin.x = x;
      v29.origin.y = y;
      v29.size.height = height;
      CGContextFillRect(CurrentContext, v29);
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend((id)__blueColor, "CGColor"));
      v30.size.width = v20;
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.height = height;
      CGContextFillRect(CurrentContext, v30);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (float)(v17 * 0.37891), (float)(v17 * 0.98828), (float)(v17 * 0.67578), 1.0);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v24, "CGColor"));
      v31.size.width = v14;
      v31.origin.x = x;
      v31.origin.y = y;
      v31.size.height = height;
      CGContextFillRect(CurrentContext, v31);
      v25 = self->_currentFrame + 1;
      self->_currentFrame = v25;
      if (v25 == self->_fadeInFrames)
      {
        self->_animState = 2;
        self->_currentFrame = 0;
      }
LABEL_12:

      break;
  }
  -[SUICTickMarkView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)startAnimationsForTickMark:(BOOL)a3 fadeInFrames:(int64_t)a4 pauseFrames:(int64_t)a5 fadeOutFrames:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  BOOL v17;

  v12 = a7;
  self->_fadeInFrames = a4;
  self->_pauseFrames = a5;
  self->_fadeOutFrames = a6;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__SUICTickMarkView_startAnimationsForTickMark_fadeInFrames_pauseFrames_fadeOutFrames_completion___block_invoke;
  v14[3] = &unk_1E4A54CE0;
  v17 = a3;
  v14[4] = self;
  v15 = v12;
  v16 = a4;
  v13 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v14);

}

void __97__SUICTickMarkView_startAnimationsForTickMark_fadeInFrames_pauseFrames_fadeOutFrames_completion___block_invoke(uint64_t a1)
{
  double Width;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  CGRect v15;
  CGRect v16;

  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  Width = CGRectGetWidth(v15);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v16));
  objc_msgSend(v14, "setContents:", objc_msgSend(*(id *)(a1 + 32), "imageMask:", *(unsigned __int8 *)(a1 + 56)));
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMask:", v14);

  v4 = v14;
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v5 + 448))
  {
    *(_BYTE *)(v5 + 464) = 0;
    v6 = MEMORY[0x1A8593D14](*(_QWORD *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 472);
    *(_QWORD *)(v7 + 472) = v6;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = 30;
    v9 = *(_QWORD **)(a1 + 32);
    v10 = (void *)v9[52];
    if (v10)
    {
      objc_msgSend(v10, "setPreferredFramesPerSecond:", v9[54]);
      v9 = *(_QWORD **)(a1 + 32);
    }
    v9[55] = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 448) = 1;
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_handleSafetyTimer_, 0, 0, (double)*(uint64_t *)(a1 + 48) * 60.0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 456);
    *(_QWORD *)(v12 + 456) = v11;

    v4 = v14;
  }

}

- (CGImage)imageMask:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;
  CGImage *v8;
  CGRect v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0DC3888];
  -[SUICTickMarkView bounds](self, "bounds");
  objc_msgSend(v4, "configurationWithPointSize:", CGRectGetHeight(v10));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("checkmark");
  else
    v6 = CFSTR("xmark");
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v6, v5);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (CGImage *)objc_msgSend(v7, "CGImage");

  return v8;
}

- (void)handleSafetyTimer:(id)a3
{
  NSTimer *safetyTimer;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SUICTickMarkView_handleSafetyTimer___block_invoke;
  block[3] = &unk_1E4A54D08;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[NSTimer invalidate](self->_safetyTimer, "invalidate");
  safetyTimer = self->_safetyTimer;
  self->_safetyTimer = 0;

}

uint64_t __38__SUICTickMarkView_handleSafetyTimer___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v1 + 448))
  {
    v2 = result;
    *(_DWORD *)(v1 + 448) = 0;
    v3 = *(_QWORD *)(result + 32);
    if (*(_QWORD *)(v3 + 472))
    {
      objc_msgSend(*(id *)(v3 + 480), "lock");
      v4 = *(_QWORD *)(v2 + 32);
      if (*(_BYTE *)(v4 + 464))
      {
        objc_msgSend(*(id *)(v4 + 480), "unlock");
      }
      else
      {
        *(_BYTE *)(v4 + 464) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 480), "unlock");
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 472) + 16))();
      }
    }
    return objc_msgSend(*(id *)(v2 + 32), "setNeedsDisplay");
  }
  return result;
}

- (void)setUpDisplayLink
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_setNeedsDisplay);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_currentPreferredFrameRate);
    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x1E0C99748]);

  }
}

- (void)tearDownDisplayLink
{
  CADisplayLink *displayLink;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  NSTimer *safetyTimer;
  NSTimer *v6;
  objc_super v7;

  v3 = a3;
  NSLog(CFSTR("TickMarkView:setHidden:%d"), a2, a3);
  v7.receiver = self;
  v7.super_class = (Class)SUICTickMarkView;
  -[SUICTickMarkView setHidden:](&v7, sel_setHidden_, v3);
  if (v3)
  {
    safetyTimer = self->_safetyTimer;
    if (safetyTimer)
    {
      -[NSTimer invalidate](safetyTimer, "invalidate");
      v6 = self->_safetyTimer;
      self->_safetyTimer = 0;

    }
    self->_animState = 0;
    -[SUICTickMarkView tearDownDisplayLink](self, "tearDownDisplayLink");
  }
  else
  {
    -[SUICTickMarkView setUpDisplayLink](self, "setUpDisplayLink");
  }
}

- (void)didMoveToSuperview
{
  void *v3;

  NSLog(CFSTR("TickMarkView:didMoveToSuperview"), a2);
  -[SUICTickMarkView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[SUICTickMarkView tearDownDisplayLink](self, "tearDownDisplayLink");
}

- (void)layoutSubviews
{
  NSLog(CFSTR("TickMarkView:layoutSubviews"), a2);
  -[SUICTickMarkView setUpDisplayLink](self, "setUpDisplayLink");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionLock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_safetyTimer, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
