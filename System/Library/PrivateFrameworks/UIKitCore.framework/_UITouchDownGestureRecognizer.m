@implementation _UITouchDownGestureRecognizer

- (_UITouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UITouchDownGestureRecognizer *v4;
  _UITouchDownGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UITouchDownGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[_UITouchDownGestureRecognizer setAllowableMovement:](v4, "setAllowableMovement:", 10.0);
  return v5;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationDelay, 0);
}

- (void)reset
{
  UIDelayedAction *activationDelay;

  -[UIDelayedAction cancel](self->_activationDelay, "cancel");
  activationDelay = self->_activationDelay;
  self->_activationDelay = 0;

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  UIDelayedAction *v14;
  UIDelayedAction *activationDelay;
  id v16;

  v16 = a3;
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStatePossible && !self->_activationDelay)
  {
    objc_msgSend(v16, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInView:", v6);
    self->_locationInView.x = v7;
    self->_locationInView.y = v8;

    -[_UITouchDownGestureRecognizer locationInView:](self, "locationInView:", 0);
    self->_initialLocationInScreenSpace.x = v9;
    self->_initialLocationInScreenSpace.y = v10;
    -[UIGestureRecognizer view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_containingScrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dbl_186682880[v12 == 0];

    v14 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_activationDelayHandler, 0, v13);
    activationDelay = self->_activationDelay;
    self->_activationDelay = v14;

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  CGPoint *p_locationInView;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;

  p_locationInView = &self->_locationInView;
  objc_msgSend(a3, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  p_locationInView->x = v8;
  p_locationInView->y = v9;

  if (self->_activationDelay)
  {
    if (!-[_UITouchDownGestureRecognizer gestureIsStillValid](self, "gestureIsStillValid"))
      -[_UITouchDownGestureRecognizer cancelActivationDelay](self, "cancelActivationDelay");
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;

  v5 = a3;
  -[_UITouchDownGestureRecognizer cancelActivationDelay](self, "cancelActivationDelay");
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIGestureRecognizer view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  self->_locationInView.x = v8;
  self->_locationInView.y = v9;

  -[_UITouchDownGestureRecognizer recognizeOrFailForCurrentLocation](self, "recognizeOrFailForCurrentLocation");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v5;

  -[_UITouchDownGestureRecognizer cancelActivationDelay](self, "cancelActivationDelay", a3, a4);
  self->_locationInView = (CGPoint)*MEMORY[0x1E0C9D538];
  if (-[UIGestureRecognizer state](self, "state") > UIGestureRecognizerStatePossible)
    v5 = 4;
  else
    v5 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v5);
}

- (void)activationDelayHandler
{
  UIDelayedAction *activationDelay;

  activationDelay = self->_activationDelay;
  self->_activationDelay = 0;

  -[_UITouchDownGestureRecognizer recognizeOrFailForCurrentLocation](self, "recognizeOrFailForCurrentLocation");
}

- (void)cancelActivationDelay
{
  UIDelayedAction *activationDelay;

  -[UIDelayedAction cancel](self->_activationDelay, "cancel");
  activationDelay = self->_activationDelay;
  self->_activationDelay = 0;

}

- (CGPoint)locationInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v4, self->_locationInView.x, self->_locationInView.y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)gestureIsStillValid
{
  void *v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double y;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  -[UIGestureRecognizer _activeTouchesEvent](self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allTouches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v13 = v5 <= 1
     && (-[_UITouchDownGestureRecognizer locationInView:](self, "locationInView:", 0),
         v7 = v6,
         y = self->_initialLocationInScreenSpace.y,
         v10 = vabdd_f64(v9, self->_initialLocationInScreenSpace.x),
         -[_UITouchDownGestureRecognizer allowableMovement](self, "allowableMovement"),
         v10 <= v11)
     && (-[_UITouchDownGestureRecognizer allowableMovement](self, "allowableMovement"), vabdd_f64(v7, y) <= v12)
     && -[_UITouchDownGestureRecognizer locationIsMostlyInsideView:](self, "locationIsMostlyInsideView:", self->_locationInView.x, self->_locationInView.y);

  return v13;
}

- (BOOL)locationIsMostlyInsideView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  y = a3.y;
  x = a3.x;
  -[UIGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  -[UIGestureRecognizer view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) != 0)
    v10 = objc_msgSend(v8, "pointMostlyInside:withEvent:", 0, x, y);
  else
    v10 = objc_msgSend(v8, "pointInside:forEvent:", 0, x, y);
  v11 = v10;

  return v11;
}

- (void)recognizeOrFailForCurrentLocation
{
  uint64_t v3;

  if (-[_UITouchDownGestureRecognizer gestureIsStillValid](self, "gestureIsStillValid"))
    v3 = 3;
  else
    v3 = 5;
  -[UIGestureRecognizer setState:](self, "setState:", v3);
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

@end
