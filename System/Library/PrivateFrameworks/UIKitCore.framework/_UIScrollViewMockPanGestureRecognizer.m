@implementation _UIScrollViewMockPanGestureRecognizer

- (void)simulateTranslation:(CGPoint)a3 velocity:(CGPoint)a4
{
  self->_translation = a3;
  self->_velocity = a4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  UIScrollViewPanGestureRecognizer *v6;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 81, CFSTR("UIScrollView is calling %@ not implemented on _UIScrollViewMockPanGestureRecognizer or UIScrollViewPanGestureRecognizer"), v8);

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

- (CGPoint)translationInView:(id)a3
{
  id v5;
  id v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  double v10;
  double v11;
  CGPoint result;

  v5 = a3;
  if (v5)
  {
    -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 98, CFSTR("expected different view"));

    }
  }
  x = self->_translation.x;
  y = self->_translation.y;

  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)setTranslation:(CGPoint)a3 inView:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  id v9;
  void *v10;
  id v11;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  if (v8)
  {
    v11 = v8;
    -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v11;
    if (v9 != v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 104, CFSTR("expected different view"));

      v8 = v11;
    }
  }
  self->_translation.x = x;
  self->_translation.y = y;

}

- (CGPoint)velocityInView:(id)a3
{
  id v5;
  id v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  double v10;
  double v11;
  CGPoint result;

  v5 = a3;
  if (v5)
  {
    -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 110, CFSTR("expected different view"));

    }
  }
  x = self->_velocity.x;
  y = self->_velocity.y;

  v10 = x;
  v11 = y;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v5;
  id v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;

  v5 = a3;
  if (v5)
  {
    -[UIGestureRecognizer view](self->_gestureRecognizer, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIScrollView_UIApplicationTesting.m"), 116, CFSTR("expected different view"));

    }
  }
  objc_msgSend(v5, "frame");
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  MidX = CGRectGetMidX(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MidY = CGRectGetMidY(v23);
  objc_msgSend(v5, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:fromView:", v14, MidX, MidY);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (UIScrollViewPanGestureRecognizer)gestureRecognizer
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
