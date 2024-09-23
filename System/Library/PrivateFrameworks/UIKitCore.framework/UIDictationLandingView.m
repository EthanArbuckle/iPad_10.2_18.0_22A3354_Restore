@implementation UIDictationLandingView

+ (id)activeInstance
{
  return (id)gSharedInstance_0;
}

+ (double)diameterForLineHeight:(double)a3
{
  return ceil(a3 - a3 * 0.24 - a3 * 0.24);
}

+ (double)widthForLineHeight:(double)a3
{
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "diameterForLineHeight:");
  v6 = v5 * 0.5;
  objc_msgSend(a1, "diameterForLineHeight:", a3);
  return ceil(v6 + v7 + v6);
}

+ (id)sharedInstance
{
  void *v2;
  UIDictationLandingView *v3;
  void *v4;

  v2 = (void *)gSharedInstance_0;
  if (!gSharedInstance_0)
  {
    v3 = -[UIDictationLandingView initWithFrame:]([UIDictationLandingView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    v4 = (void *)gSharedInstance_0;
    gSharedInstance_0 = (uint64_t)v3;

    v2 = (void *)gSharedInstance_0;
  }
  return v2;
}

+ (int64_t)fallbackPlaceholderLength
{
  return objc_msgSend(CFSTR("          "), "length");
}

- (UIDictationLandingView)initWithFrame:(CGRect)a3
{
  UIDictationLandingView *v3;
  UIDictationLandingView *v4;
  CADisplayLink *displayLink;
  UITextRange *range;
  id placeholder;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIDictationLandingView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    displayLink = v3->_displayLink;
    v3->_displayLink = 0;

    range = v4->_range;
    v4->_range = 0;

    placeholder = v4->_placeholder;
    v4->_placeholder = 0;

    v4->_willInsertResult = 0;
    -[UIView setOpaque:](v4, "setOpaque:", 0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v4->_angle = 0.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIDictationLandingView stopLanding](self, "stopLanding");
  v3.receiver = self;
  v3.super_class = (Class)UIDictationLandingView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)clearRotation
{
  CGAffineTransform v3;
  CGAffineTransform v4;

  self->_angle = 0.0;
  CGAffineTransformMakeRotation(&v4, 0.0);
  v3 = v4;
  -[UIView setTransform:](self, "setTransform:", &v3);
}

- (void)rotateBy:(double)a3
{
  double v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  v4 = self->_angle + a3;
  self->_angle = v4;
  CGAffineTransformMakeRotation(&v6, v4 * 0.0174532925);
  v5 = v6;
  -[UIView setTransform:](self, "setTransform:", &v5);
}

- (void)shrinkWithCompletion:(id)a3
{
  NSOperation *v4;
  void *v5;
  double v6;
  NSOperation *afterShrinkCompletionInvocation;
  NSOperation *v8;
  void *v9;
  double v10;
  double v11;
  _QWORD v12[5];

  v4 = (NSOperation *)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s dictation landing view is shrinking"), "-[UIDictationLandingView shrinkWithCompletion:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v5);

  self->_shrinking = 1;
  -[CADisplayLink timestamp](self->_displayLink, "timestamp");
  self->_shrinkStartTime = v6;
  afterShrinkCompletionInvocation = self->_afterShrinkCompletionInvocation;
  self->_afterShrinkCompletionInvocation = v4;
  v8 = v4;

  +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fadeOutDuration");
  v11 = v10;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__UIDictationLandingView_shrinkWithCompletion___block_invoke;
  v12[3] = &unk_1E16B1B28;
  v12[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 393216, v12, 0, v11, 0.0);

}

uint64_t __47__UIDictationLandingView_shrinkWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)advanceLanding:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  _QWORD block[5];
  CGAffineTransform v17;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v20;

  -[CADisplayLink timestamp](self->_displayLink, "timestamp", a3);
  v5 = v4 - self->_startTime;
  +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "circleRPM");
  v8 = v5 * v7 / 60.0;

  self->_angle = v8 * 360.0;
  if (self->_shrinking)
  {
    +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shrinkDuration");
    v11 = v10;

    -[CADisplayLink timestamp](self->_displayLink, "timestamp");
    v13 = v12 - self->_shrinkStartTime;
    CGAffineTransformMakeRotation(&t1, self->_angle * 0.0174532925);
    CGAffineTransformMakeScale(&t2, 1.0 - v13 / v11, 1.0 - v13 / v11);
    CGAffineTransformConcat(&v20, &t1, &t2);
    v17 = v20;
    -[UIView setTransform:](self, "setTransform:", &v17);
    if (v13 > v11)
    {
      self->_shrinking = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__UIDictationLandingView_advanceLanding___block_invoke;
      block[3] = &unk_1E16B1B28;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    CGAffineTransformMakeRotation(&v15, v8 * 360.0 * 0.0174532925);
    v14 = v15;
    -[UIView setTransform:](self, "setTransform:", &v14);
  }
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

void __41__UIDictationLandingView_advanceLanding___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "start");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 488);
  *(_QWORD *)(v2 + 488) = 0;

}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double diameter;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  _QWORD *ContextStack;
  CGContext *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGColorSpace *DeviceRGB;
  CGPath *Mutable;
  const CGPath *v21;
  CGGradient *v22;
  CGPath *v23;
  const CGPath *v24;
  CGGradient *v25;
  CGFloat v26;
  CGAffineTransform v27;
  CGAffineTransform transform;
  CGFloat v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGFloat components[2];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  CGPoint v38;
  CGPoint v39;
  CGPoint v40;
  CGPoint v41;

  height = a3.size.height;
  width = a3.size.width;
  v37 = *MEMORY[0x1E0C80C00];
  diameter = self->_diameter;
  if (+[UIDictationController viewMode](UIDictationController, "viewMode", a3.origin.x, a3.origin.y) == 6)
  {
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "containerWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v6, "scale");
  v10 = v9;
  memset(&transform, 0, sizeof(transform));
  CGAffineTransformMakeScale(&v27, 1.0, -1.0);
  CGAffineTransformTranslate(&transform, &v27, 0.0, -height);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v12 = 0;
  else
    v12 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  v13 = ceil(width * 0.5 * v10) / v10;
  v14 = diameter * 0.5;
  v15 = 2.0;
  if (v10 > 1.0)
    v15 = 1.5;
  v16 = v14 - v15;
  if (v16 >= 0.0)
    v17 = v16;
  else
    v17 = 0.0;
  v26 = v13 - diameter * 0.5;
  v18 = ceil(height * 0.5 * v10) / v10;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGContextSaveGState(v12);
  Mutable = CGPathCreateMutable();
  CGPathAddArc(Mutable, 0, v13, v18, v17, 3.14159265, 0.0, 1);
  CGPathMoveToPoint(Mutable, 0, v13 + v17, v18);
  CGPathAddLineToPoint(Mutable, 0, v14 + v13, v18);
  CGPathAddArc(Mutable, 0, v13, v18, v14, 0.0, 3.14159265, 0);
  CGPathMoveToPoint(Mutable, 0, v26, v18);
  CGPathAddLineToPoint(Mutable, 0, v13 - v17, v18);
  v21 = CGPathCreateMutableCopyByTransformingPath(Mutable, &transform);
  CGContextAddPath(v12, v21);
  CGPathRelease(v21);
  CGPathRelease(Mutable);
  CGContextClip(v12);
  *(_OWORD *)components = xmmword_186680A38;
  v34 = unk_186680A48;
  v35 = xmmword_186680A58;
  v36 = unk_186680A68;
  v22 = CGGradientCreateWithColorComponents(DeviceRGB, components, 0, 2uLL);
  v38.x = v26;
  v38.y = v18;
  v40.x = v14 + v13;
  v40.y = v18;
  CGContextDrawLinearGradient(v12, v22, v38, v40, 0);
  CGGradientRelease(v22);
  CGContextRestoreGState(v12);
  CGContextSaveGState(v12);
  v23 = CGPathCreateMutable();
  CGPathAddArc(v23, 0, v13, v18, v17, 3.14159265, 0.0, 0);
  CGPathMoveToPoint(v23, 0, v13 + v17, v18);
  CGPathAddLineToPoint(v23, 0, v14 + v13, v18);
  CGPathAddArc(v23, 0, v13, v18, v14, 0.0, 3.14159265, 1);
  CGPathMoveToPoint(v23, 0, v26, v18);
  CGPathAddLineToPoint(v23, 0, v13 - v17, v18);
  v24 = CGPathCreateMutableCopyByTransformingPath(v23, &transform);
  CGContextAddPath(v12, v24);
  CGPathRelease(v24);
  CGPathRelease(v23);
  CGContextClip(v12);
  *(_OWORD *)v29 = xmmword_186680A78;
  v30 = unk_186680A88;
  v31 = xmmword_186680A98;
  v32 = unk_186680AA8;
  v25 = CGGradientCreateWithColorComponents(DeviceRGB, v29, 0, 2uLL);
  v39.x = v26;
  v39.y = v18;
  v41.x = v14 + v13;
  v41.y = v18;
  CGContextDrawLinearGradient(v12, v25, v39, v41, 0);
  CGGradientRelease(v25);
  CGContextRestoreGState(v12);
  CGColorSpaceRelease(DeviceRGB);

}

- (id)_currentTextInputView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInteractionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)updatePosition
{
  void *v3;
  void *v4;
  double x;
  double y;
  double width;
  double height;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double angle;
  id v21;
  CGRect v22;
  CGRect v23;

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_textSelectingContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_placeholder && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "frameForDictationResultPlaceholder:", self->_placeholder);
    v23 = CGRectIntegral(v22);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    +[UIDictationLandingView diameterForLineHeight:](UIDictationLandingView, "diameterForLineHeight:", v23.size.height);
    self->_diameter = v9;
    -[UIDictationLandingView _currentTextInputView](self, "_currentTextInputView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textInputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertRect:fromView:", v11, x, y, width, height);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    angle = self->_angle;
    -[UIDictationLandingView clearRotation](self, "clearRotation");
    -[UIView setFrame:](self, "setFrame:", v13, v15, v17, v19);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    -[UIDictationLandingView rotateBy:](self, "rotateBy:", angle);
  }

}

- (BOOL)delegateWasEmpty
{
  return self->_placeholder && !self->_didHaveText;
}

- (void)hideCursor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Landing view hideCursor"), "-[UIDictationLandingView hideCursor]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v3);

  -[UIDictationLandingView hideCursorAssertion](self, "hideCursorAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[UIDictationLandingView setHideCursorAssertion:](self, "setHideCursorAssertion:", 0);
  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_activeAssertionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonVisibleAssertionWithReason:", CFSTR("Dictation Landing View"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationLandingView setHideCursorAssertion:](self, "setHideCursorAssertion:", v7);

  if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInteractionAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectionHighlightMode:", 1);

  }
}

- (void)showCursor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Landing view showCursor"), "-[UIDictationLandingView showCursor]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v3);

  if (!+[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled"))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textInteractionAssistant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSelectionHighlightMode:", 1);

  }
  -[UIDictationLandingView hideCursorAssertion](self, "hideCursorAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[UIDictationLandingView setHideCursorAssertion:](self, "setHideCursorAssertion:", 0);
}

- (void)startDisplayLinkIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  CADisplayLink *v16;
  CADisplayLink *displayLink;
  CADisplayLink *v18;
  void *v19;
  double v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->_displayLink)
  {
    +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "containerWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v4, "screen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "_userInterfaceIdiom");

      if (v7 == 3)
      {
        v21 = v4;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(MEMORY[0x1E0CD2728], "displays");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
              objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
              v14 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13 != v14)
              {
                v15 = v13;

                v5 = v15;
              }
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          }
          while (v10);
        }

        v4 = v21;
      }
    }
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithDisplay:target:selector:", v5, self, sel_advanceLanding_);
    v16 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v16;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 60);
    v18 = self->_displayLink;
    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v18, "addToRunLoop:forMode:", v19, *MEMORY[0x1E0C99860]);

    -[CADisplayLink timestamp](self->_displayLink, "timestamp");
    self->_startTime = v20;

  }
}

- (void)performRemoteSelector:(SEL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (+[UIKeyboard isKeyboardProcess](UIKeyboard, "isKeyboardProcess"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputDelegateManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputSystemSourceSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "textOperations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomInfoType:", 0x1E1750220);
      v10 = CFSTR("selector");
      NSStringFromSelector(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCustomInfo:", v9);

      objc_msgSend(v6, "flushOperations");
    }

  }
}

- (void)_invalidatDisplayLink
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (void)startLandingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  CADisplayLink *displayLink;
  id placeholder;
  void *v10;
  UITextRange *range;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  CGAffineTransform v26;
  CGAffineTransform v27;
  _QWORD v28[4];
  id v29;
  UIDictationLandingView *v30;
  id v31;

  -[UIDictationLandingView performRemoteSelector:](self, "performRemoteSelector:", a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Trying to start the dictation landing view"), "-[UIDictationLandingView startLandingIfNecessary]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v3);

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmpty");

  if ((v7 & 1) != 0)
  {
    self->_didSkipLanding = 0;
    displayLink = self->_displayLink;
    placeholder = self->_placeholder;
    if (displayLink)
    {
      if (!placeholder)
        goto LABEL_8;
    }
    else
    {
      if (placeholder)
      {
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s The landing view was in an unexpected state. _displayLink: %@, _placeholder: %@"), "-[UIDictationLandingView startLandingIfNecessary]", displayLink, placeholder);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v24);

        return;
      }
      -[UIDictationLandingView startDisplayLinkIfNecessary](self, "startDisplayLinkIfNecessary");
      range = self->_range;
      if (range)
      {
        self->_range = 0;

      }
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "inputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "inputDelegateManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasAsyncCapableInputDelegate");

      if ((v16 & 1) == 0)
      {
        objc_msgSend(v13, "_textSelectingContainer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationLandingView hideCursor](self, "hideCursor");
        self->_didHaveText = objc_msgSend(v13, "hasText");
        +[UIDictationController activeInstance](UIDictationController, "activeInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = MEMORY[0x1E0C809B0];
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __49__UIDictationLandingView_startLandingIfNecessary__block_invoke;
        v28[3] = &unk_1E16B47A8;
        v29 = v17;
        v30 = self;
        v20 = v13;
        v31 = v20;
        v21 = v17;
        objc_msgSend(v18, "performIgnoringDocumentChanges:", v28);

        -[UIDictationLandingView updatePosition](self, "updatePosition");
        if (v20)
        {
          if (-[UIDictationLandingView hasActivePlaceholder](self, "hasActivePlaceholder"))
          {
            -[UIDictationLandingView _currentTextInputView](self, "_currentTextInputView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addSubview:", self);

          }
        }
        -[UIView setAlpha:](self, "setAlpha:", 0.0);
        CGAffineTransformMakeScale(&v27, 0.0, 0.0);
        v26 = v27;
        -[UIView setTransform:](self, "setTransform:", &v26);
        +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "fadeInDuration");
        v25[0] = v19;
        v25[1] = 3221225472;
        v25[2] = __49__UIDictationLandingView_startLandingIfNecessary__block_invoke_2;
        v25[3] = &unk_1E16B1B28;
        v25[4] = self;
        +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, self, v25, &__block_literal_global_332);

        -[UIView setNeedsDisplay](self, "setNeedsDisplay");
      }

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Skipping start the dictation landing view"), "-[UIDictationLandingView startLandingIfNecessary]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v10);

    if (!self->_didSkipLanding)
    {
      self->_didSkipLanding = 1;
      -[UIDictationLandingView hideCursor](self, "hideCursor");
      -[UIDictationLandingView startDisplayLinkIfNecessary](self, "startDisplayLinkIfNecessary");
    }
  }
}

void __49__UIDictationLandingView_startLandingIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "insertDictationResultPlaceholder");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 424);
    *(_QWORD *)(v3 + 424) = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "insertText:", CFSTR("          "));
    objc_msgSend(*(id *)(a1 + 32), "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v10 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "positionFromPosition:offset:", v10, -objc_msgSend(CFSTR("          "), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "textRangeFromPosition:toPosition:", v6, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(v8 + 416);
    *(_QWORD *)(v8 + 416) = v7;

    v4 = (void *)v10;
  }

}

uint64_t __49__UIDictationLandingView_startLandingIfNecessary__block_invoke_2(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  v2 = *(void **)(a1 + 32);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

- (void)stopLanding
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[UIDictationLandingView performRemoteSelector:](self, "performRemoteSelector:", a2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dictation is removing the landing view"), "-[UIDictationLandingView stopLanding]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v3);

  if (self->_didSkipLanding)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Skipping removing the landing view for modeless"), "-[UIDictationLandingView stopLanding]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController logDictationString:](UIDictationController, "logDictationString:", v4);

    self->_didSkipLanding = 0;
    -[UIDictationLandingView showCursor](self, "showCursor");
    -[UIDictationLandingView _invalidatDisplayLink](self, "_invalidatDisplayLink");
  }
  else
  {
    -[UIView removeFromSuperview](self, "removeFromSuperview");
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__UIDictationLandingView_stopLanding__block_invoke;
    v6[3] = &unk_1E16B1B28;
    v6[4] = self;
    objc_msgSend(v5, "performIgnoringDocumentChanges:", v6);

    self->_willInsertResult = 0;
    -[UIDictationLandingView showCursor](self, "showCursor");
    -[UIDictationLandingView _invalidatDisplayLink](self, "_invalidatDisplayLink");
  }
}

void __37__UIDictationLandingView_stopLanding__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 424))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_textSelectingContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "removeDictationResultPlaceholder:willInsertResult:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 433));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 424);
    *(_QWORD *)(v5 + 424) = 0;

  }
  else if (*(_QWORD *)(v2 + 416))
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaceRange:withText:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416), &stru_1E16EDF20);

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 416);
    *(_QWORD *)(v9 + 416) = 0;

  }
}

- (BOOL)hasActivePlaceholder
{
  return self->_placeholder || self->_range != 0;
}

- (BOOL)canStopLanding
{
  void *v3;
  BOOL v4;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 || -[UIDictationLandingView hasActivePlaceholder](self, "hasActivePlaceholder") || self->_didSkipLanding;

  return v4;
}

- (void)errorShakeDidFinish
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__UIDictationLandingView_errorShakeDidFinish__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationLandingView shrinkWithCompletion:](self, "shrinkWithCompletion:", v3);

}

uint64_t __45__UIDictationLandingView_errorShakeDidFinish__block_invoke(uint64_t a1)
{
  void *v2;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorAnimationDidFinish");

  return objc_msgSend(*(id *)(a1 + 32), "showCursor");
}

- (void)stopLandingForError
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  -[UIDictationLandingView performRemoteSelector:](self, "performRemoteSelector:", a2);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInteractionAssistant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isValid");

  if ((v5 & 1) != 0)
  {
    -[UIDictationLandingView startLandingIfNecessary](self, "startLandingIfNecessary");
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.translation.x"));
    v39 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setDuration:", 0.6);
    v6 = (void *)MEMORY[0x1E0C99D20];
    LODWORD(v7) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1041865114;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1047904911;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1052266988;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1055622431;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1058642330;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1061997773;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObjects:", v8, v10, v12, v14, v16, v18, v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setKeyTimes:", v21);

    v22 = (void *)MEMORY[0x1E0C99D20];
    LODWORD(v23) = -4.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = 4.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = -4.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = 4.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v31) = -4.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v33) = 4.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v35) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "arrayWithObjects:", v24, v26, v28, v30, v32, v34, v36, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setValues:", v37);

    -[UIView layer](self, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addAnimation:forKey:", v39, CFSTR("shake"));

    -[UIDictationLandingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_errorShakeDidFinish, 0, 0.9);
  }
  else
  {
    -[UIDictationLandingView errorShakeDidFinish](self, "errorShakeDidFinish");
  }
}

- (double)fadeOutDuration
{
  void *v2;
  double v3;
  double v4;

  +[UIDictationLandingViewSettings sharedInstance](UIDictationLandingViewSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fadeOutDuration");
  v4 = v3;

  return v4;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimation
{
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
}

- (BOOL)willInsertResult
{
  return self->_willInsertResult;
}

- (void)setWillInsertResult:(BOOL)a3
{
  self->_willInsertResult = a3;
}

- (BOOL)didSkipLanding
{
  return self->_didSkipLanding;
}

- (void)setDidSkipLanding:(BOOL)a3
{
  self->_didSkipLanding = a3;
}

- (UITextCursorAssertion)hideCursorAssertion
{
  return self->_hideCursorAssertion;
}

- (void)setHideCursorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_hideCursorAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideCursorAssertion, 0);
  objc_storeStrong((id *)&self->_afterShrinkCompletionInvocation, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong(&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_range, 0);
}

@end
