@implementation PUGridPinchGestureRecognizer

- (void)_resetTransitionState
{
  CGPoint v2;

  v2 = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_touch1InitialLocation = (CGPoint)*MEMORY[0x1E0C9D538];
  self->_touch0InitialLocation = v2;
  self->_lastTransitionProgress = 0.0;
  self->_transitionDirection = 0;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUGridPinchGestureRecognizer;
  -[PUGridPinchGestureRecognizer reset](&v3, sel_reset);
  -[PUGridPinchGestureRecognizer _resetTransitionState](self, "_resetTransitionState");
}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  unint64_t v13;
  double v14;
  objc_super v15;

  if (a3 == 2)
  {
    if ((unint64_t)-[PUGridPinchGestureRecognizer numberOfTouches](self, "numberOfTouches") >= 2)
    {
      -[PUGridPinchGestureRecognizer view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUGridPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 0, v6);
      self->_touch0InitialLocation.x = v7;
      self->_touch0InitialLocation.y = v8;

      -[PUGridPinchGestureRecognizer view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUGridPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 1, v10);
      self->_touch1InitialLocation.x = v11;
      self->_touch1InitialLocation.y = v12;

      if (!self->_transitionDirection)
      {
        -[UIPinchGestureRecognizer velocity](self, "velocity");
        v13 = 2;
        if (v14 > 0.0)
          v13 = 1;
        self->_transitionDirection = v13;
      }
    }
  }
  else if (a3 == 1 && (unint64_t)-[PUGridPinchGestureRecognizer numberOfTouches](self, "numberOfTouches") >= 2)
  {
    -[PUGridPinchGestureRecognizer _resetTransitionState](self, "_resetTransitionState");
  }
  v15.receiver = self;
  v15.super_class = (Class)PUGridPinchGestureRecognizer;
  -[PUGridPinchGestureRecognizer setState:](&v15, sel_setState_, a3);
}

- (double)transitionProgress
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double result;

  if ((unint64_t)-[PUGridPinchGestureRecognizer numberOfTouches](self, "numberOfTouches") <= 1)
    return self->_lastTransitionProgress;
  -[PUGridPinchGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUGridPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 0, v4);

  -[PUGridPinchGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUGridPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 1, v6);

  UIDistanceBetweenPoints();
  v8 = v7;
  UIDistanceBetweenPoints();
  result = (v9 - v8) / 150.0;
  self->_lastTransitionProgress = result;
  if (self->_transitionDirection == 2)
  {
    result = -result;
    self->_lastTransitionProgress = result;
  }
  return result;
}

- (CGSize)centerOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  -[PUGridPinchGestureRecognizer view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUGridPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 0, v4);
  v6 = v5;
  v8 = v7;

  -[PUGridPinchGestureRecognizer view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUGridPinchGestureRecognizer locationOfTouch:inView:](self, "locationOfTouch:inView:", 1, v10);
  v12 = v11;
  v14 = v13;

  v15 = (v6 + v12) * 0.5 - (self->_touch0InitialLocation.x + self->_touch1InitialLocation.x) * 0.5;
  v16 = (v8 + v14) * 0.5 - (self->_touch0InitialLocation.y + self->_touch1InitialLocation.y) * 0.5;
  result.height = v16;
  result.width = v15;
  return result;
}

- (BOOL)transitionShouldFinish
{
  double v3;
  double v4;
  double v5;

  -[PUGridPinchGestureRecognizer transitionProgress](self, "transitionProgress");
  v4 = v3;
  -[UIPinchGestureRecognizer velocity](self, "velocity");
  if (self->_transitionDirection == 2)
    v5 = -v5;
  return v5 > 1.0 || v4 > 0.25 && v5 >= -0.2 || v4 > 0.7;
}

- (unint64_t)transitionDirection
{
  return self->_transitionDirection;
}

@end
