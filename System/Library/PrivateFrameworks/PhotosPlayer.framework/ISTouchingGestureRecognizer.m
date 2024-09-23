@implementation ISTouchingGestureRecognizer

- (ISTouchingGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  ISTouchingGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISTouchingGestureRecognizer;
  result = -[ISTouchingGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_maximumTouchMovement = 1.79769313e308;
    result->_minimumTouchDuration = 0.0;
  }
  return result;
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = -[ISTouchingGestureRecognizer _touchCount](self, "_touchCount");
  v6 = v5 + a3;
  if (!v5 && v6)
  {
    -[ISTouchingGestureRecognizer view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISTouchingGestureRecognizer locationInView:](self, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    -[ISTouchingGestureRecognizer _setInitialPointInView:](self, "_setInitialPointInView:", v9, v11);
  }
  -[ISTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", v6);
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  unint64_t v5;

  if (-[ISTouchingGestureRecognizer _touchCount](self, "_touchCount") >= a3)
    v5 = -[ISTouchingGestureRecognizer _touchCount](self, "_touchCount") - a3;
  else
    v5 = 0;
  -[ISTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", v5);
}

- (void)_setTouchCount:(unint64_t)a3
{
  unint64_t touchCount;
  _BOOL4 v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  _QWORD block[4];
  id v14[2];
  id location;

  touchCount = self->__touchCount;
  if (touchCount != a3)
  {
    self->__touchCount = a3;
    if (!a3 || (v6 = -[ISTouchingGestureRecognizer requireSingleTouch](self, "requireSingleTouch"), a3 != 1) && v6)
    {
      -[ISTouchingGestureRecognizer _setBeginRequestID:](self, "_setBeginRequestID:", -[ISTouchingGestureRecognizer _beginRequestID](self, "_beginRequestID") + 1);
      -[ISTouchingGestureRecognizer setState:](self, "setState:", 3);
    }
    if (a3 && !touchCount)
    {
      -[ISTouchingGestureRecognizer minimumTouchDuration](self, "minimumTouchDuration");
      if (v7 <= 0.0)
      {
        -[ISTouchingGestureRecognizer setState:](self, "setState:", 1);
      }
      else
      {
        v8 = (void *)(-[ISTouchingGestureRecognizer _beginRequestID](self, "_beginRequestID") + 1);
        -[ISTouchingGestureRecognizer _setBeginRequestID:](self, "_setBeginRequestID:", v8);
        objc_initWeak(&location, self);
        -[ISTouchingGestureRecognizer minimumTouchDuration](self, "minimumTouchDuration");
        v10 = v9;
        -[ISTouchingGestureRecognizer extraMinimumTouchDuration](self, "extraMinimumTouchDuration");
        v12 = dispatch_time(0, (uint64_t)((v10 + v11) * 1000000000.0));
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __46__ISTouchingGestureRecognizer__setTouchCount___block_invoke;
        block[3] = &unk_1E9453D60;
        objc_copyWeak(v14, &location);
        v14[1] = v8;
        dispatch_after(v12, MEMORY[0x1E0C80D38], block);
        objc_destroyWeak(v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_beginWithRequestID:(unint64_t)a3
{
  if (-[ISTouchingGestureRecognizer _beginRequestID](self, "_beginRequestID") == a3)
    -[ISTouchingGestureRecognizer setState:](self, "setState:", 1);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[ISTouchingGestureRecognizer _incrementTouchesBy:](self, "_incrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[ISTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  uint64_t v6;

  v5 = a3;
  -[ISTouchingGestureRecognizer setState:](self, "setState:", 4);
  v6 = objc_msgSend(v5, "count");

  -[ISTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", v6);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ISTouchingGestureRecognizer;
  -[ISTouchingGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, a3, a4);
  -[ISTouchingGestureRecognizer _updateDistanceFromInitialPoint](self, "_updateDistanceFromInitialPoint");
  -[ISTouchingGestureRecognizer distanceFromInitialPoint](self, "distanceFromInitialPoint");
  v6 = v5;
  -[ISTouchingGestureRecognizer maximumTouchMovement](self, "maximumTouchMovement");
  if (v6 > v7)
    -[ISTouchingGestureRecognizer setState:](self, "setState:", 4);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  -[ISTouchingGestureRecognizer _incrementTouchesBy:](self, "_incrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  double v5;
  double v6;
  double v7;

  -[ISTouchingGestureRecognizer _updateDistanceFromInitialPoint](self, "_updateDistanceFromInitialPoint", a3, a4);
  -[ISTouchingGestureRecognizer distanceFromInitialPoint](self, "distanceFromInitialPoint");
  v6 = v5;
  -[ISTouchingGestureRecognizer maximumTouchMovement](self, "maximumTouchMovement");
  if (v6 > v7)
    -[ISTouchingGestureRecognizer setState:](self, "setState:", 4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  -[ISTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[ISTouchingGestureRecognizer _decrementTouchesBy:](self, "_decrementTouchesBy:", objc_msgSend(a3, "count"));
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ISTouchingGestureRecognizer;
  -[ISTouchingGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  if (!a3)
  {
    self->_distanceFromInitialPoint = 0.0;
    -[ISTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
  }
}

- (void)reset
{
  self->_distanceFromInitialPoint = 0.0;
  -[ISTouchingGestureRecognizer _setTouchCount:](self, "_setTouchCount:", 0);
}

- (void)_setInitialPointInView:(CGPoint)a3
{
  if (a3.x != self->__initialPointInView.x || a3.y != self->__initialPointInView.y)
  {
    self->__initialPointInView = a3;
    -[ISTouchingGestureRecognizer _updateDistanceFromInitialPoint](self, "_updateDistanceFromInitialPoint");
  }
}

- (void)_updateDistanceFromInitialPoint
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[ISTouchingGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISTouchingGestureRecognizer locationInView:](self, "locationInView:", v3);
  v5 = v4;
  v7 = v6;

  -[ISTouchingGestureRecognizer _initialPointInView](self, "_initialPointInView");
  self->_distanceFromInitialPoint = sqrt((v7 - v9) * (v7 - v9) + (v5 - v8) * (v5 - v8));
}

- (double)minimumTouchDuration
{
  return self->_minimumTouchDuration;
}

- (void)setMinimumTouchDuration:(double)a3
{
  self->_minimumTouchDuration = a3;
}

- (double)extraMinimumTouchDuration
{
  return self->_extraMinimumTouchDuration;
}

- (void)setExtraMinimumTouchDuration:(double)a3
{
  self->_extraMinimumTouchDuration = a3;
}

- (BOOL)requireSingleTouch
{
  return self->_requireSingleTouch;
}

- (void)setRequireSingleTouch:(BOOL)a3
{
  self->_requireSingleTouch = a3;
}

- (double)maximumTouchMovement
{
  return self->_maximumTouchMovement;
}

- (void)setMaximumTouchMovement:(double)a3
{
  self->_maximumTouchMovement = a3;
}

- (double)distanceFromInitialPoint
{
  return self->_distanceFromInitialPoint;
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

void __46__ISTouchingGestureRecognizer__setTouchCount___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_beginWithRequestID:", *(_QWORD *)(a1 + 40));

}

@end
