@implementation _UIPanOrFlickGestureRecognizer

- (void)setMinimumPressDuration:(double)a3
{
  self->_minimumPressDuration = a3;
}

- (void)setAllowedFlickDirections:(unint64_t)a3
{
  self->_allowedFlickDirections = a3;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void)setResponsivenessDelay:(double)a3
{
  self->_responsivenessDelay = a3;
}

- (void)setMinimumFlickDistance:(double)a3
{
  self->_minimumFlickDistance = a3;
}

- (void)setMaximumFlickDuration:(double)a3
{
  self->_maximumFlickDuration = a3;
}

- (_UIPanOrFlickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIPanOrFlickGestureRecognizer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  result = -[UIPanGestureRecognizer initWithTarget:action:](&v5, sel_initWithTarget_action_, a3, a4);
  if (result)
  {
    result->_minimumPressDuration = 0.5;
    result->_allowableMovement = 10.0;
    result->_responsivenessDelay = result->_minimumPressDuration;
  }
  return result;
}

- (void)setLongPressOnly:(BOOL)a3
{
  self->_longPressOnly = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responsivenessAction, 0);
  objc_storeStrong((id *)&self->_elapsedAction, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[UIDelayedAction cancel](self->_elapsedAction, "cancel");
  -[UIDelayedAction cancel](self->_responsivenessAction, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)reset
{
  objc_super v3;

  self->_didLongPress = 0;
  self->_touchCount = 0;
  -[_UIPanOrFlickGestureRecognizer clearTimer](self, "clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
}

- (_UIPanOrFlickGestureRecognizerDelegate)panOrFlickDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[UIGestureRecognizer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EDFC2120);

  if (v4)
  {
    -[UIGestureRecognizer delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (_UIPanOrFlickGestureRecognizerDelegate *)v5;
}

- (unint64_t)recognizedFlickDirection
{
  void *v3;
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
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateEnded)
    return 0;
  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer translationInView:](self, "translationInView:", v3);
  v5 = v4;
  v7 = v6;

  -[_UIPanOrFlickGestureRecognizer timestampOfLastEvent](self, "timestampOfLastEvent");
  v9 = v8;
  -[_UIPanOrFlickGestureRecognizer timestampBeforeGestureBegan](self, "timestampBeforeGestureBegan");
  v11 = v9 - v10;
  -[_UIPanOrFlickGestureRecognizer maximumFlickDuration](self, "maximumFlickDuration");
  if (v11 >= v12
    || (-[_UIPanOrFlickGestureRecognizer minimumFlickDistance](self, "minimumFlickDistance"),
        v14 = v13,
        -[_UIPanOrFlickGestureRecognizer minimumFlickDistance](self, "minimumFlickDistance"),
        v5 * v5 + v7 * v7 <= v14 * v15))
  {
    v20 = 0;
  }
  else
  {
    v16 = fabs(v5);
    v17 = fabs(v7);
    v18 = 4;
    if (v7 <= 0.0)
      v18 = 1;
    v19 = 2;
    if (v5 > 0.0)
      v19 = 8;
    if (v16 > v17)
      v20 = v19;
    else
      v20 = v18;
  }
  return -[_UIPanOrFlickGestureRecognizer allowedFlickDirections](self, "allowedFlickDirections") & v20;
}

- (BOOL)isValidLongPress
{
  void *v3;
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
  unint64_t touchCount;

  -[UIGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer locationInView:](self, "locationInView:", v3);
  v5 = v4;
  v7 = v6;

  -[_UIPanOrFlickGestureRecognizer initialCentroidLocation](self, "initialCentroidLocation");
  v9 = v5 - v8;
  -[_UIPanOrFlickGestureRecognizer initialCentroidLocation](self, "initialCentroidLocation");
  v11 = v9 * v9 + (v7 - v10) * (v7 - v10);
  -[_UIPanOrFlickGestureRecognizer allowableMovement](self, "allowableMovement");
  v13 = v12;
  -[_UIPanOrFlickGestureRecognizer allowableMovement](self, "allowableMovement");
  if (v11 > v13 * v14)
    return 0;
  touchCount = self->_touchCount;
  return touchCount == -[UIPanGestureRecognizer minimumNumberOfTouches](self, "minimumNumberOfTouches");
}

- (void)responsivenessTimeElapsed:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (-[_UIPanOrFlickGestureRecognizer isValidLongPress](self, "isValidLongPress", a3)
    && -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    if (self->_longPressOnly)
      -[UIGestureRecognizer setState:](self, "setState:", 1);
    -[_UIPanOrFlickGestureRecognizer panOrFlickDelegate](self, "panOrFlickDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[_UIPanOrFlickGestureRecognizer panOrFlickDelegate](self, "panOrFlickDelegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gestureRecognizerShouldBeginResponse:", self);

    }
  }
}

- (void)enoughTimeElapsed:(id)a3
{
  uint64_t v4;

  if (-[_UIPanOrFlickGestureRecognizer isValidLongPress](self, "isValidLongPress", a3))
  {
    v4 = 1;
    self->_didLongPress = 1;
    if (-[UIGestureRecognizer state](self, "state"))
    {
      if (-[UIGestureRecognizer state](self, "state") != UIGestureRecognizerStateBegan)
        return;
      v4 = 2;
    }
    -[UIGestureRecognizer setState:](self, "setState:", v4);
  }
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  objc_super v4;

  if (self->_longPressOnly)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  return -[UIPanGestureRecognizer _shouldTryToBeginWithEvent:](&v4, sel__shouldTryToBeginWithEvent_, a3);
}

- (void)clearTimer
{
  UIDelayedAction *elapsedAction;
  UIDelayedAction *responsivenessAction;

  -[UIDelayedAction cancel](self->_elapsedAction, "cancel");
  elapsedAction = self->_elapsedAction;
  self->_elapsedAction = 0;

  -[UIDelayedAction cancel](self->_responsivenessAction, "cancel");
  responsivenessAction = self->_responsivenessAction;
  self->_responsivenessAction = 0;

}

- (void)startTimer
{
  void *v3;
  char v4;
  double v5;
  void *v6;
  double v7;
  UIDelayedAction *v8;
  double v9;
  uint64_t v10;
  UIDelayedAction *v11;
  UIDelayedAction *elapsedAction;
  double v13;
  double v14;
  double v15;
  UIDelayedAction *v16;
  UIDelayedAction *v17;
  UIDelayedAction *responsivenessAction;

  -[_UIPanOrFlickGestureRecognizer clearTimer](self, "clearTimer");
  -[_UIPanOrFlickGestureRecognizer panOrFlickDelegate](self, "panOrFlickDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = 0.0;
  if ((v4 & 1) != 0)
  {
    -[_UIPanOrFlickGestureRecognizer panOrFlickDelegate](self, "panOrFlickDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "additionalPressDurationForTypingCadence:", self);
    v5 = v7;

  }
  v8 = [UIDelayedAction alloc];
  -[_UIPanOrFlickGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  v10 = *MEMORY[0x1E0C99860];
  v11 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v8, "initWithTarget:action:userInfo:delay:mode:", self, sel_enoughTimeElapsed_, 0, *MEMORY[0x1E0C99860], v5 + v9);
  elapsedAction = self->_elapsedAction;
  self->_elapsedAction = v11;

  -[_UIPanOrFlickGestureRecognizer responsivenessDelay](self, "responsivenessDelay");
  v14 = v13;
  -[_UIPanOrFlickGestureRecognizer minimumPressDuration](self, "minimumPressDuration");
  if (v14 != v15)
  {
    v16 = [UIDelayedAction alloc];
    -[_UIPanOrFlickGestureRecognizer responsivenessDelay](self, "responsivenessDelay");
    v17 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v16, "initWithTarget:action:userInfo:delay:mode:", self, sel_responsivenessTimeElapsed_, 0, v10);
    responsivenessAction = self->_responsivenessAction;
    self->_responsivenessAction = v17;

  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "timestamp");
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    objc_msgSend(v6, "timestamp");
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  -[_UIPanOrFlickGestureRecognizer startTimer](self, "startTimer");
  v10.receiver = self;
  v10.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  -[UIPanGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v7, v6);
  v8 = objc_msgSend(v7, "count");

  self->_touchCount += v8;
  -[UIGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPanGestureRecognizer locationInView:](self, "locationInView:", v9);
  -[_UIPanOrFlickGestureRecognizer setInitialCentroidLocation:](self, "setInitialCentroidLocation:");

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "timestamp");
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    objc_msgSend(v7, "timestamp");
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  -[UIPanGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v6, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "timestamp");
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    objc_msgSend(v6, "timestamp");
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  -[_UIPanOrFlickGestureRecognizer clearTimer](self, "clearTimer");
  v9.receiver = self;
  v9.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  -[UIPanGestureRecognizer touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v7, v6);
  v8 = objc_msgSend(v7, "count");

  self->_touchCount -= v8;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "timestamp");
  -[_UIPanOrFlickGestureRecognizer setTimestampOfLastEvent:](self, "setTimestampOfLastEvent:");
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible)
  {
    objc_msgSend(v6, "timestamp");
    -[_UIPanOrFlickGestureRecognizer setTimestampBeforeGestureBegan:](self, "setTimestampBeforeGestureBegan:");
  }
  -[_UIPanOrFlickGestureRecognizer clearTimer](self, "clearTimer");
  v9.receiver = self;
  v9.super_class = (Class)_UIPanOrFlickGestureRecognizer;
  -[UIPanGestureRecognizer touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v7, v6);
  v8 = objc_msgSend(v7, "count");

  self->_touchCount -= v8;
}

- (BOOL)_analyticsIsGestureHandled
{
  return 1;
}

- (BOOL)longPressOnly
{
  return self->_longPressOnly;
}

- (unint64_t)allowedFlickDirections
{
  return self->_allowedFlickDirections;
}

- (double)maximumFlickDuration
{
  return self->_maximumFlickDuration;
}

- (double)minimumFlickDistance
{
  return self->_minimumFlickDistance;
}

- (double)minimumPressDuration
{
  return self->_minimumPressDuration;
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)didLongPress
{
  return self->_didLongPress;
}

- (double)responsivenessDelay
{
  return self->_responsivenessDelay;
}

- (double)timestampBeforeGestureBegan
{
  return self->_timestampBeforeGestureBegan;
}

- (void)setTimestampBeforeGestureBegan:(double)a3
{
  self->_timestampBeforeGestureBegan = a3;
}

- (double)timestampOfLastEvent
{
  return self->_timestampOfLastEvent;
}

- (void)setTimestampOfLastEvent:(double)a3
{
  self->_timestampOfLastEvent = a3;
}

- (UIDelayedAction)elapsedAction
{
  return self->_elapsedAction;
}

- (void)setElapsedAction:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedAction, a3);
}

- (UIDelayedAction)responsivenessAction
{
  return self->_responsivenessAction;
}

- (void)setResponsivenessAction:(id)a3
{
  objc_storeStrong((id *)&self->_responsivenessAction, a3);
}

- (CGPoint)initialCentroidLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialCentroidLocation.x;
  y = self->_initialCentroidLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialCentroidLocation:(CGPoint)a3
{
  self->_initialCentroidLocation = a3;
}

@end
