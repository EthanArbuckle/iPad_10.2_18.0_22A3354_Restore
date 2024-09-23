@implementation UIScrollViewPagingSwipeGestureRecognizer

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  UIDelayedAction *v8;
  UIDelayedAction *v9;
  UIDelayedAction *swipeFailureDelay;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[UIScrollViewPagingSwipeGestureRecognizer scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollViewPagingSwipeGestureRecognizer clearTimer](self, "clearTimer");
  if (((objc_msgSend(v7, "_pagingLeft") & 1) != 0
     || (objc_msgSend(v7, "_pagingRight") & 1) != 0
     || (objc_msgSend(v7, "_pagingUp") & 1) != 0
     || objc_msgSend(v7, "_pagingDown"))
    && objc_msgSend(v14, "count") == 1
    && !self->_swipeFailureDelay)
  {
    v8 = [UIDelayedAction alloc];
    v9 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v8, "initWithTarget:action:userInfo:delay:mode:", self, sel_enoughTimeElapsed_, 0, *MEMORY[0x1E0C99860], 0.0833333333);
    swipeFailureDelay = self->_swipeFailureDelay;
    self->_swipeFailureDelay = v9;

    objc_msgSend(v6, "touchesForGestureRecognizer:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v11, 0);
    self->_startLocation.x = v12;
    self->_startLocation.y = v13;

    self->_lastLocation = self->_startLocation;
    self->_lastTime = CACurrentMediaTime();
  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UIScrollViewPagingSwipeGestureRecognizer clearTimer](self, "clearTimer");
  self->_directionalFailureCount = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewPagingSwipeGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)clearTimer
{
  UIDelayedAction *swipeFailureDelay;

  -[UIDelayedAction unschedule](self->_swipeFailureDelay, "unschedule");
  swipeFailureDelay = self->_swipeFailureDelay;
  self->_swipeFailureDelay = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[UIScrollViewPagingSwipeGestureRecognizer clearTimer](self, "clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewPagingSwipeGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeFailureDelay, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)enoughTimeElapsed:(id)a3
{
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)_processNewLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  CFTimeInterval v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int directionalFailureCount;
  id v20;

  y = a3.y;
  x = a3.x;
  -[UIScrollViewPagingSwipeGestureRecognizer scrollView](self, "scrollView");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CACurrentMediaTime();
  objc_msgSend(v6, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_convertOffsetFromSceneReferenceSpace:", x - self->_lastLocation.x, y - self->_lastLocation.y);
  v11 = -[UIView _convertOffset:fromView:](v6, 0, v9, v10);
  v13 = v12;

  v14 = self->_lastTime - v7;
  objc_msgSend(v20, "_horizontalVelocity");
  v16 = fabs(v15);
  objc_msgSend(v20, "_verticalVelocity");
  if (v16 < 1.0 && fabs(v11 / v14 / 1000.0) >= v16)
    goto LABEL_14;
  v18 = fabs(v17);
  if (v18 < 1.0 && fabs(v13 / v14 / 1000.0) >= v18)
    goto LABEL_14;
  if ((!objc_msgSend(v20, "_pagingLeft") || v11 >= 0.0)
    && (!objc_msgSend(v20, "_pagingRight") || v11 <= 0.0)
    && (!objc_msgSend(v20, "_pagingUp") || v13 >= 0.0)
    && (!objc_msgSend(v20, "_pagingDown") || v13 <= 0.0))
  {
    -[UIDelayedAction touch](self->_swipeFailureDelay, "touch");
    self->_directionalFailureCount = 0;
    goto LABEL_16;
  }
  directionalFailureCount = self->_directionalFailureCount;
  if (directionalFailureCount < 1)
  {
    self->_directionalFailureCount = directionalFailureCount + 1;
    -[UIDelayedAction touch](self->_swipeFailureDelay, "touch");
  }
  else
  {
LABEL_14:
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
LABEL_16:
  self->_lastLocation.x = x;
  self->_lastLocation.y = y;
  self->_lastTime = v7;

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a4, "touchesForGestureRecognizer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v5, 0);
  v7 = v6;
  v9 = v8;

  if (self->_lastLocation.x != v7 || self->_lastLocation.y != v9)
    -[UIScrollViewPagingSwipeGestureRecognizer _processNewLocation:](self, "_processNewLocation:", v7, v9);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  id v21;

  v5 = a4;
  -[UIGestureRecognizer view](self, "view");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchesForGestureRecognizer:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v6, 0);
  v8 = v7;
  v10 = v9;

  objc_msgSend(v21, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_convertOffsetFromSceneReferenceSpace:", v8 - self->_startLocation.x, v10 - self->_startLocation.y);
  v14 = -[UIView _convertOffset:fromView:](v21, 0, v12, v13);
  v16 = v15;

  -[UIScrollViewPagingSwipeGestureRecognizer _processNewLocation:](self, "_processNewLocation:", v8, v10);
  if (!self->_swipeFailureDelay
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateFailed
    || ((v18 = fabs(v16), v17 = 50.0, fabs(v14) <= 50.0) ? (v19 = v18 <= 50.0) : (v19 = 0), v19))
  {
    v20 = 5;
  }
  else
  {
    v20 = 3;
  }
  -[UIGestureRecognizer setState:](self, "setState:", v20, v17, v18);
  -[UIScrollViewPagingSwipeGestureRecognizer clearTimer](self, "clearTimer");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIScrollViewPagingSwipeGestureRecognizer clearTimer](self, "clearTimer", a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

@end
