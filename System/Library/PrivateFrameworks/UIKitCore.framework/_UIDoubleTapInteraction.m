@implementation _UIDoubleTapInteraction

- (void)willMoveToView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[_UIDoubleTapInteraction tapGesture](self, "tapGesture", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeGestureRecognizer:", v6);

  objc_storeWeak((id *)&self->_view, 0);
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  void *v6;
  UITapGestureRecognizer *v7;
  id WeakRetained;
  void *v9;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleTap_);
      -[UIGestureRecognizer setName:](v7, "setName:", CFSTR("com.apple.UIKit._UIDoubleTapInteraction.tap"));
      -[UIGestureRecognizer setDelegate:](v7, "setDelegate:", self);
      -[UITapGestureRecognizer setNumberOfTapsRequired:](v7, "setNumberOfTapsRequired:", 1);
      -[UIGestureRecognizer _setAcceptsFailureRequiments:](v7, "_setAcceptsFailureRequiments:", 0);
      -[_UIDoubleTapInteraction setTapGesture:](self, "setTapGesture:", v7);

    }
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v9);

  }
}

- (void)_handleTap:(id)a3
{
  uint64_t v4;
  UITapGestureRecognizer *tapGesture;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v4 = objc_msgSend(a3, "state");
  if (v4 == 4)
  {
    -[_UIDoubleTapInteraction resetState](self, "resetState");
  }
  else if (v4 == 3 && self)
  {
    tapGesture = self->_tapGesture;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    -[UITapGestureRecognizer locationInView:](tapGesture, "locationInView:", WeakRetained);
    v8 = v7;
    v10 = v9;

    -[_UIDoubleTapInteraction doubleTapAction](self, "doubleTapAction");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(WeakRetained) = objc_msgSend(v11, "scheduled");

    if ((_DWORD)WeakRetained)
    {
      -[_UIDoubleTapInteraction initialTapLocationInView](self, "initialTapLocationInView");
      if (sqrt((v12 - v8) * (v12 - v8) + (v13 - v10) * (v13 - v10)) < 45.0)
        -[_UIDoubleTapInteraction doubleTapOccurredAtLocation:](self, "doubleTapOccurredAtLocation:", v8, v10);
      -[_UIDoubleTapInteraction resetState](self, "resetState");
    }
    else if (-[_UIDoubleTapInteraction continueProcessingSecondTapAtLocation:](self, "continueProcessingSecondTapAtLocation:", v8, v10))
    {
      -[_UIDoubleTapInteraction doubleTapAction](self, "doubleTapAction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "touch");

    }
    -[_UIDoubleTapInteraction setInitialTapLocationInView:](self, "setInitialTapLocationInView:", v8, v10);
  }
}

- (void)_invalidateDoubleTap
{
  UIDelayedAction *doubleTapAction;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);

  doubleTapAction = self->_doubleTapAction;
  self->_doubleTapAction = 0;

  -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  -[_UIDoubleTapInteraction didTimeOut](self, "didTimeOut");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIDoubleTapInteraction didTimeOut](self, "didTimeOut");
    v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v7[2]();

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[_UIDoubleTapInteraction doubleTapAction](self, "doubleTapAction", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scheduled");

  if (v6)
  {
    if (self)
    {
      -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCancelsTouchesInView:", 1);

      -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1;
LABEL_6:
      objc_msgSend(v8, "setDelaysTouchesEnded:", v10);

    }
  }
  else if (self)
  {
    -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCancelsTouchesInView:", 0);

    -[_UIDoubleTapInteraction tapGesture](self, "tapGesture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
    goto LABEL_6;
  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a4;
  -[_UIDoubleTapInteraction doubleTapAction](self, "doubleTapAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "scheduled");

  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v5, "locationInView:", WeakRetained);
    v10 = v9;
    v12 = v11;

    if (self)
    {
      -[_UIDoubleTapInteraction initialTapLocationInView](self, "initialTapLocationInView");
      LOBYTE(self) = sqrt((v13 - v10) * (v13 - v10) + (v14 - v12) * (v14 - v12)) < 45.0;
    }
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v4;
  char v5;

  -[_UIDoubleTapInteraction doubleTapAction](self, "doubleTapAction", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "scheduled") ^ 1;

  return v5;
}

- (BOOL)continueProcessingSecondTapAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t (**v7)(double, double);
  char v8;

  y = a3.y;
  x = a3.x;
  -[_UIDoubleTapInteraction shouldContinueProcessingSecondTap](self, "shouldContinueProcessingSecondTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 1;
  -[_UIDoubleTapInteraction shouldContinueProcessingSecondTap](self, "shouldContinueProcessingSecondTap");
  v7 = (uint64_t (**)(double, double))objc_claimAutoreleasedReturnValue();
  v8 = v7[2](x, y);

  return v8;
}

- (void)doubleTapOccurredAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void (**v7)(double, double);

  y = a3.y;
  x = a3.x;
  -[_UIDoubleTapInteraction didDoubleTap](self, "didDoubleTap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIDoubleTapInteraction didDoubleTap](self, "didDoubleTap");
    v7 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
    v7[2](x, y);

  }
}

- (void)resetState
{
  UIDelayedAction *doubleTapAction;

  -[UIDelayedAction cancel](self->_doubleTapAction, "cancel");
  doubleTapAction = self->_doubleTapAction;
  self->_doubleTapAction = 0;

}

- (UIDelayedAction)doubleTapAction
{
  UIDelayedAction *doubleTapAction;
  UIDelayedAction *v4;
  UIDelayedAction *v5;

  doubleTapAction = self->_doubleTapAction;
  if (!doubleTapAction)
  {
    v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__invalidateDoubleTap, 0, 0.35);
    v5 = self->_doubleTapAction;
    self->_doubleTapAction = v4;

    -[UIDelayedAction cancel](self->_doubleTapAction, "cancel");
    doubleTapAction = self->_doubleTapAction;
  }
  return doubleTapAction;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (id)shouldContinueProcessingSecondTap
{
  return self->_shouldContinueProcessingSecondTap;
}

- (void)setShouldContinueProcessingSecondTap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)didDoubleTap
{
  return self->_didDoubleTap;
}

- (void)setDidDoubleTap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)didTimeOut
{
  return self->_didTimeOut;
}

- (void)setDidTimeOut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UITapGestureRecognizer)tapGesture
{
  return self->_tapGesture;
}

- (void)setTapGesture:(id)a3
{
  objc_storeStrong((id *)&self->_tapGesture, a3);
}

- (CGPoint)initialTapLocationInView
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialTapLocationInView.x;
  y = self->_initialTapLocationInView.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialTapLocationInView:(CGPoint)a3
{
  self->_initialTapLocationInView = a3;
}

- (void)setDoubleTapAction:(id)a3
{
  objc_storeStrong((id *)&self->_doubleTapAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleTapAction, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong(&self->_didTimeOut, 0);
  objc_storeStrong(&self->_didDoubleTap, 0);
  objc_storeStrong(&self->_shouldContinueProcessingSecondTap, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
