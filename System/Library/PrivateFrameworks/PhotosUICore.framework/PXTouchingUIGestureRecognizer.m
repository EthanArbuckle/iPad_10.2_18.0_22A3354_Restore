@implementation PXTouchingUIGestureRecognizer

- (void)setTouchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_touchDelegate, a3);
}

- (void)setMaximumTouchMovement:(double)a3
{
  self->_maximumTouchMovement = a3;
}

- (double)maximumTouchMovement
{
  return self->_maximumTouchMovement;
}

- (PXTouchingUIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PXTouchingUIGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTouchingUIGestureRecognizer;
  result = -[PXTouchingUIGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_maximumTouchMovement = 1.79769313e308;
    result->_minimumTouchDuration = 0.0;
  }
  return result;
}

- (CGPoint)initialLocationInView:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  v4 = a3;
  -[PXTouchingUIGestureRecognizer _initialPointInView](self, "_initialPointInView");
  v6 = v5;
  v8 = v7;
  -[PXTouchingUIGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertPoint:fromView:", v9, v6, v8);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  -[PXTouchingUIGestureRecognizer _setTouchCount:](self, "_setTouchCount:", -[PXTouchingUIGestureRecognizer _touchCount](self, "_touchCount") + a3);
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  unint64_t v5;

  if (-[PXTouchingUIGestureRecognizer _touchCount](self, "_touchCount") >= a3)
    v5 = -[PXTouchingUIGestureRecognizer _touchCount](self, "_touchCount") - a3;
  else
    v5 = 0;
  -[PXTouchingUIGestureRecognizer _setTouchCount:](self, "_setTouchCount:", v5);
}

- (void)_setTouchCount:(unint64_t)a3
{
  unint64_t touchCount;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  dispatch_time_t v13;
  PXTouchingUIGestureRecognizer *v14;
  uint64_t v15;
  _QWORD v16[6];

  touchCount = self->__touchCount;
  if (touchCount != a3)
  {
    self->__touchCount = a3;
    if (a3)
    {
      if (touchCount)
        return;
      -[PXTouchingUIGestureRecognizer view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXTouchingUIGestureRecognizer locationInView:](self, "locationInView:", v5);
      v7 = v6;
      v9 = v8;

      -[PXTouchingUIGestureRecognizer _setInitialPointInView:](self, "_setInitialPointInView:", v7, v9);
      -[PXTouchingUIGestureRecognizer minimumTouchDuration](self, "minimumTouchDuration");
      if (v10 > 0.0)
      {
        v11 = -[PXTouchingUIGestureRecognizer _beginRequestID](self, "_beginRequestID") + 1;
        -[PXTouchingUIGestureRecognizer _setBeginRequestID:](self, "_setBeginRequestID:", v11);
        -[PXTouchingUIGestureRecognizer minimumTouchDuration](self, "minimumTouchDuration");
        v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __48__PXTouchingUIGestureRecognizer__setTouchCount___block_invoke;
        v16[3] = &unk_1E5144EB8;
        v16[4] = self;
        v16[5] = v11;
        dispatch_after(v13, MEMORY[0x1E0C80D38], v16);
        return;
      }
      v14 = self;
      v15 = 1;
    }
    else
    {
      -[PXTouchingUIGestureRecognizer _setBeginRequestID:](self, "_setBeginRequestID:", -[PXTouchingUIGestureRecognizer _beginRequestID](self, "_beginRequestID") + 1);
      v14 = self;
      v15 = 3;
    }
    -[PXTouchingUIGestureRecognizer setState:](v14, "setState:", v15);
  }
}

- (void)_beginWithRequestID:(unint64_t)a3
{
  if (-[PXTouchingUIGestureRecognizer _beginRequestID](self, "_beginRequestID") == a3)
    -[PXTouchingUIGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[PXTouchingUIGestureRecognizer _incrementTouchesBy:](self, "_incrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[PXTouchingUIGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  -[PXTouchingUIGestureRecognizer setState:](self, "setState:", 4);
  v6 = objc_msgSend(v5, "count");

  -[PXTouchingUIGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", v6);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXTouchingUIGestureRecognizer;
  -[PXTouchingUIGestureRecognizer touchesMoved:withEvent:](&v14, sel_touchesMoved_withEvent_, a3, a4);
  -[PXTouchingUIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTouchingUIGestureRecognizer locationInView:](self, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[PXTouchingUIGestureRecognizer _initialPointInView](self, "_initialPointInView");
  v12 = sqrt((v9 - v11) * (v9 - v11) + (v7 - v10) * (v7 - v10));
  -[PXTouchingUIGestureRecognizer maximumTouchMovement](self, "maximumTouchMovement");
  if (v12 > v13)
    -[PXTouchingUIGestureRecognizer setState:](self, "setState:", 4);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXTouchingUIGestureRecognizer;
  -[PXTouchingUIGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  if (!a3)
    -[PXTouchingUIGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
}

- (void)_setWillBegin:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  int v7;
  id v8;

  if (self->__willBegin != a3)
  {
    v3 = a3;
    self->__willBegin = a3;
    -[PXTouchingUIGestureRecognizer touchDelegate](self, "touchDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0)
        return;
      -[PXTouchingUIGestureRecognizer touchDelegate](self, "touchDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "touchingUIGestureRecognizerWillBeginTouching:", self);
    }
    else
    {
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0)
        return;
      -[PXTouchingUIGestureRecognizer touchDelegate](self, "touchDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "touchingUIGestureRecognizerWillEndTouching:", self);
    }

  }
}

- (void)_setDidBegin:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  int v7;
  id v8;

  if (self->__didBegin != a3)
  {
    v3 = a3;
    self->__didBegin = a3;
    -[PXTouchingUIGestureRecognizer touchDelegate](self, "touchDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0)
        return;
      -[PXTouchingUIGestureRecognizer touchDelegate](self, "touchDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "touchingUIGestureRecognizerDidBeginTouching:", self);
    }
    else
    {
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0)
        return;
      -[PXTouchingUIGestureRecognizer touchDelegate](self, "touchDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "touchingUIGestureRecognizerDidEndTouching:", self);
    }

  }
}

- (void)setState:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  if ((unint64_t)a3 <= 5 && ((0x3Bu >> a3) & 1) != 0)
  {
    v5 = (6u >> a3) & 1;
    -[PXTouchingUIGestureRecognizer _setWillBegin:](self, "_setWillBegin:", v5);
    v6.receiver = self;
    v6.super_class = (Class)PXTouchingUIGestureRecognizer;
    -[PXTouchingUIGestureRecognizer setState:](&v6, sel_setState_, a3);
    -[PXTouchingUIGestureRecognizer _setDidBegin:](self, "_setDidBegin:", v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXTouchingUIGestureRecognizer;
    -[PXTouchingUIGestureRecognizer setState:](&v6, sel_setState_, a3);
  }
}

- (void)reset
{
  -[PXTouchingUIGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
}

- (double)minimumTouchDuration
{
  return self->_minimumTouchDuration;
}

- (void)setMinimumTouchDuration:(double)a3
{
  self->_minimumTouchDuration = a3;
}

- (PXTouchingUIGestureRecognizerDelegate)touchDelegate
{
  return (PXTouchingUIGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

- (unint64_t)_beginRequestID
{
  return self->__beginRequestID;
}

- (void)_setBeginRequestID:(unint64_t)a3
{
  self->__beginRequestID = a3;
}

- (BOOL)_willBegin
{
  return self->__willBegin;
}

- (BOOL)_didBegin
{
  return self->__didBegin;
}

- (CGPoint)_initialPointInView
{
  double x;
  double y;
  CGPoint result;

  x = self->__initialPointInView.x;
  y = self->__initialPointInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)_setInitialPointInView:(CGPoint)a3
{
  self->__initialPointInView = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_touchDelegate);
}

uint64_t __48__PXTouchingUIGestureRecognizer__setTouchCount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginWithRequestID:", *(_QWORD *)(a1 + 40));
}

@end
