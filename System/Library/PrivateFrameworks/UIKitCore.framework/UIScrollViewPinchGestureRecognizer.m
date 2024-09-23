@implementation UIScrollViewPinchGestureRecognizer

- (void)setScrollView:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_scrollView, obj);
    -[UIScrollViewPinchGestureRecognizer _updateHysteresis]((unsigned __int8 *)self);
    v5 = obj;
  }

}

- (void)setDelegate:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[UIScrollViewPinchGestureRecognizer scrollView](self, "scrollView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && (id)v5 != v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UIScrollView's built-in pinch gesture recognizer must have its scroll view as its delegate."));
  v7.receiver = self;
  v7.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  -[UIGestureRecognizer setDelegate:](&v7, sel_setDelegate_, v4);

}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (UIScrollViewPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIScrollViewPinchGestureRecognizer *v5;
  UIScrollViewPinchGestureRecognizer *v6;
  UIScrollViewPinchGestureRecognizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  v5 = -[UIGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_scrollViewAction = a4;
    v7 = v5;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
}

- (unsigned)_updateHysteresis
{
  unsigned __int8 *v1;
  void *v2;
  void *v3;
  int v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "scrollView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_parentScrollView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v1[297];

      if (!v4)
        return (unsigned __int8 *)objc_msgSend(v1, "_setHysteresis:", 0.0);
    }
    else
    {

    }
    v5.receiver = v1;
    v5.super_class = (Class)UIScrollViewPinchGestureRecognizer;
    objc_msgSendSuper2(&v5, sel__hysteresis);
    return (unsigned __int8 *)objc_msgSend(v1, "_setHysteresis:");
  }
  return result;
}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;
  const char *scrollViewAction;
  objc_super v9;

  v6 = a3;
  -[UIScrollViewPinchGestureRecognizer scrollView](self, "scrollView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 == v6)
  {
    scrollViewAction = self->_scrollViewAction;

    if (scrollViewAction == a4)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You can't remove a scroll view's target/action pair from its built-in pinch gesture recognizer."));
  }
  else
  {

  }
  v9.receiver = self;
  v9.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  -[UIGestureRecognizer removeTarget:action:](&v9, sel_removeTarget_action_, v6, a4);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  objc_super v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  v6 = a3;
  v7 = a4;
  -[UIGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 2)
  {
    -[UIScrollViewPinchGestureRecognizer scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "zoomScale");
    v12 = v11;

    CGAffineTransformMakeScale(&v15, v12, v12);
    v14 = v15;
    -[UIPinchGestureRecognizer setTransform:](self, "setTransform:", &v14);
  }
  v13.receiver = self;
  v13.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  -[UIGestureRecognizer touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, v6, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIScrollViewPinchGestureRecognizer;
  -[UIGestureRecognizer touchesMoved:withEvent:](&v10, sel_touchesMoved_withEvent_, a3, v6);
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan)
  {
    -[UIScrollViewPinchGestureRecognizer scrollView](self, "scrollView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "touchesForGestureRecognizer:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "_canCancelContentTouches:", v8);

    if ((v9 & 1) == 0)
      -[UIGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (BOOL)_analyticsIsGestureHandled
{
  return 1;
}

- (void)_transformChangedWithEvent:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (objc_msgSend(a3, "phase") == 1)
  {
    -[UIScrollViewPinchGestureRecognizer scrollView](self, "scrollView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoomScale");
    v6 = v5;

    CGAffineTransformMakeScale(&v8, v6, v6);
    v7 = v8;
    -[UIPinchGestureRecognizer setTransform:](self, "setTransform:", &v7);
  }
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 18;
}

@end
