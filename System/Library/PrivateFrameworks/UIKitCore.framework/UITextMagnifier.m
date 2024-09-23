@implementation UITextMagnifier

- (UITextMagnifier)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  UITextMagnifier *v7;
  void *v8;
  UITextMagnifierTimeWeightedPoint *v9;
  UITextMagnifierTimeWeightedPoint *weightedPoint;
  uint64_t v11;
  UIView *magnifierRenderer;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)UITextMagnifier;
  v7 = -[UIView initWithFrame:](&v14, sel_initWithFrame_);
  if (v7)
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = objc_alloc_init(UITextMagnifierTimeWeightedPoint);
    weightedPoint = v7->_weightedPoint;
    v7->_weightedPoint = v9;

    v11 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "renderClass")), "initWithFrame:", x, y, width, height);
    magnifierRenderer = v7->_magnifierRenderer;
    v7->_magnifierRenderer = (UIView *)v11;

    -[UIView addSubview:](v7, "addSubview:", v7->_magnifierRenderer);
  }
  return v7;
}

- (CGPoint)magnificationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_magnificationPoint.x;
  y = self->_magnificationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnificationPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;

  y = a3.y;
  x = a3.x;
  -[UITextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:");
  -[UITextMagnifier adjustMagnificationPoint:](self, "adjustMagnificationPoint:", x, y);
  v8 = v6;
  v9 = v7;
  if (v6 != self->_magnificationPoint.x || v7 != self->_magnificationPoint.y)
  {
    self->_magnificationPoint.x = v6;
    self->_magnificationPoint.y = v7;
    if (!self->_isAnimating)
    {
      -[UITextMagnifier updateFrameAndOffset](self, "updateFrameAndOffset");
      -[UITextMagnifier setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
  self->_animationPoint.x = v8;
  self->_animationPoint.y = v9;
}

- (CGPoint)terminalPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[UITextMagnifierTimeWeightedPoint weightedPoint](self->_weightedPoint, "weightedPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)terminalPointPlacedCarefully
{
  return 1;
}

- (void)postAutoscrollPoint:(CGPoint)a3
{
  -[UITextMagnifierTimeWeightedPoint addPoint:](self->_weightedPoint, "addPoint:", a3.x, a3.y);
}

- (void)animateToAutoscrollRenderer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__UITextMagnifier_animateToAutoscrollRenderer__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.1);
}

uint64_t __46__UITextMagnifier_animateToAutoscrollRenderer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setAlpha:", 0.8);
}

- (void)setToMagnifierRenderer
{
  -[UIView setAlpha:](self->_magnifierRenderer, "setAlpha:", 1.0);
  -[UIView setAlpha:](self->_autoscrollRenderer, "setAlpha:", 0.0);
  -[UIView setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
}

- (void)animateToMagnifierRenderer
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__UITextMagnifier_animateToMagnifierRenderer__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v2, 0.1);
}

uint64_t __45__UITextMagnifier_animateToMagnifierRenderer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setToMagnifierRenderer");
}

- (void)setAutoscrollDirections:(int)a3
{
  double v5;
  id v6;
  UIView *v7;
  UIView *autoscrollRenderer;
  double v9;

  if (a3)
  {
    if (self->_autoscrollDirections != a3 || (-[UIView alpha](self->_autoscrollRenderer, "alpha"), v5 <= 0.0))
    {
      if (!self->_autoscrollRenderer)
      {
        v6 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "renderClass"));
        -[UIView bounds](self, "bounds");
        v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
        autoscrollRenderer = self->_autoscrollRenderer;
        self->_autoscrollRenderer = v7;

        -[UIView addSubview:](self, "addSubview:", self->_autoscrollRenderer);
        -[UIView setAlpha:](self->_autoscrollRenderer, "setAlpha:", 0.0);
      }
      self->_autoscrollDirections = a3;
      -[UIView setNeedsDisplay](self->_autoscrollRenderer, "setNeedsDisplay");
      -[UIView alpha](self->_autoscrollRenderer, "alpha");
      if (v9 == 0.0)
        -[UITextMagnifier animateToAutoscrollRenderer](self, "animateToAutoscrollRenderer");
    }
  }
  else
  {
    -[UITextMagnifier animateToMagnifierRenderer](self, "animateToMagnifierRenderer");
    self->_autoscrollDirections = 0;
  }
}

- (void)autoscrollWillNotStart
{
  self->_autoscrollDirections = 0;
  -[UITextMagnifier animateToMagnifierRenderer](self, "animateToMagnifierRenderer");
}

- (void)setFrame:(CGRect)a3
{
  UIView *magnifierRenderer;
  UIView *autoscrollRenderer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UITextMagnifier;
  -[UIView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  magnifierRenderer = self->_magnifierRenderer;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](magnifierRenderer, "setFrame:");
  autoscrollRenderer = self->_autoscrollRenderer;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](autoscrollRenderer, "setFrame:");
}

- (void)setNeedsDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITextMagnifier;
  -[UIView setNeedsDisplay](&v3, sel_setNeedsDisplay);
  -[UIView setNeedsDisplay](self->_magnifierRenderer, "setNeedsDisplay");
}

- (void)beginZoomUpAnimation:(id)a3 withDuration:(double)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  if (self->_isAnimating)
  {
    self->_delayedAnimationType = 1;
  }
  else
  {
    self->_isAnimating = 1;
    self->_delayedAnimationType = 0;
    v4[4] = self;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke_2;
    v4[3] = &unk_1E16B3FD8;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4, a4);
  }
}

uint64_t __53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

_QWORD *__53__UITextMagnifier_beginZoomUpAnimation_withDuration___block_invoke_2(uint64_t a1)
{
  _QWORD *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 516) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  result = *(_QWORD **)(a1 + 32);
  if (result[65] == 2)
    return (_QWORD *)objc_msgSend(result, "zoomDownAnimation");
  return result;
}

- (void)beginZoomDownAnimation:(id)a3 withDuration:(double)a4 postponeHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (self->_isAnimating)
  {
    self->_delayedAnimationType = 2;
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);
  }
  else
  {
    self->_isAnimating = 1;
    self->_delayedAnimationType = 0;
    -[UITextMagnifier setNeedsDisplay](self, "setNeedsDisplay");
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__UITextMagnifier_beginZoomDownAnimation_withDuration_postponeHandler___block_invoke;
    v11[3] = &unk_1E16B3FD8;
    v11[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v11, a4);
  }

}

_QWORD *__71__UITextMagnifier_beginZoomDownAnimation_withDuration_postponeHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *result;
  __int128 v4;
  _OWORD v5[3];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 516) = 0;
  objc_msgSend(*(id *)(a1 + 32), "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "remove");
  result = *(_QWORD **)(a1 + 32);
  if (result[65] == 1)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v5[0] = *MEMORY[0x1E0C9BAA8];
    v5[1] = v4;
    v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(result, "setTransform:", v5);
    objc_msgSend(*(id *)(a1 + 32), "updateFrameAndOffset");
    return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "zoomUpAnimation");
  }
  return result;
}

- (void)remove
{
  __int128 v3;
  _OWORD v4[3];

  -[UIView removeFromSuperview](self, "removeFromSuperview");
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](self, "setTransform:", v4);
}

- (void)detectLostTouches:(id)a3
{
  void *v4;

  -[UITextMagnifier target](self, "target", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_msgSend((id)UIApp, "_isTrackingAnyTouch") & 1) != 0)
      -[UITextMagnifier performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_detectLostTouches_, 0, 0.75);
    else
      -[UITextMagnifier stopMagnifying:](self, "stopMagnifying:", 0);
  }
}

- (void)windowWillRotate:(id)a3
{
  -[UITextMagnifier stopMagnifying:](self, "stopMagnifying:", 1);
}

- (void)beginMagnifyingTarget:(id)a3 text:(id)a4 magnificationPoint:(CGPoint)a5 offset:(CGPoint)a6 animated:(BOOL)a7
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  y = a5.y;
  x = a5.x;
  v21 = a3;
  v11 = a4;
  -[UITextMagnifier setTarget:](self, "setTarget:", v21);
  -[UITextMagnifier setText:](self, "setText:", v11);

  -[UITextMagnifier performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_detectLostTouches_, 0, 0.75);
  -[UITextMagnifierTimeWeightedPoint clearHistory](self->_weightedPoint, "clearHistory");
  -[UITextMagnifier setToMagnifierRenderer](self, "setToMagnifierRenderer");
  -[UIView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v21, "_window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "windowScene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      +[UIWindowScene _keyWindowScene]();
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v17, "keyboardSceneDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerWindow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "addSubview:", self);
    objc_msgSend(v21, "_convertVisualAltitude:toView:", self, 0.0);
    -[UIView _setVisualAltitude:](self, "_setVisualAltitude:");

  }
  -[UIView update](self->_autoscrollRenderer, "update");
  -[UIView update](self->_magnifierRenderer, "update");
  -[UITextMagnifier setMagnificationPoint:](self, "setMagnificationPoint:", x, y);
  -[UITextMagnifier zoomUpAnimation](self, "zoomUpAnimation");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_windowWillRotate_, CFSTR("UIWindowWillRotateNotification"), 0);

}

- (void)stopMagnifying:(BOOL)a3
{
  _BOOL4 v3;
  id v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_detectLostTouches_, 0);
  if (v3)
    -[UITextMagnifier zoomDownAnimation](self, "zoomDownAnimation");
  else
    -[UITextMagnifier remove](self, "remove");
  -[UITextMagnifier setTarget:](self, "setTarget:", 0);
  -[UITextMagnifier setText:](self, "setText:", 0);
  self->_magnificationPoint = (CGPoint)vdupq_n_s64(0xC08F400000000000);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)zoomUpAnimation
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)zoomDownAnimation
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)updateFrameAndOffset
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

+ (Class)renderClass
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)isHorizontal
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 1;
}

- (double)offsetFromMagnificationPoint
{
  -[UIResponder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (CGPoint)animationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_animationPoint.x;
  y = self->_animationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setAnimationPoint:(CGPoint)a3
{
  self->_animationPoint = a3;
}

- (UIView)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
  objc_storeStrong((id *)&self->_target, a3);
}

- (UITextInput)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscrollRenderer, 0);
  objc_storeStrong((id *)&self->_magnifierRenderer, 0);
  objc_storeStrong((id *)&self->_weightedPoint, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

@end
