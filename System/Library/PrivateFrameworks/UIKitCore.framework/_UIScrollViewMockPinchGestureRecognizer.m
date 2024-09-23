@implementation _UIScrollViewMockPinchGestureRecognizer

- (void)simulateScale:(double)a3 velocity:(double)a4
{
  self->_scale = a3;
  self->_velocity = a4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  UIScrollViewPinchGestureRecognizer *v6;
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    goto LABEL_5;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 156, CFSTR("UIScrollView is calling %@ not implemented on _UIScrollViewMockPinchGestureRecognizer or UIScrollViewPanGestureRecognizer"), v8);

LABEL_5:
    v6 = 0;
    return v6;
  }
  v6 = self->_gestureRecognizer;
  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)scale
{
  return self->_scale;
}

- (double)velocity
{
  return self->_velocity;
}

- (CGPoint)anchorPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "center");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (id)_activeTouchesForEvent:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("fakeTouch1"), CFSTR("fakeTouch2"), 0);
}

- (UIScrollViewPinchGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end
