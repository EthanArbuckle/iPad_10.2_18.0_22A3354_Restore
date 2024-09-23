@implementation _UIForceClickInteractionDriver

- (_UIForceClickInteractionDriver)init
{
  _UIForceClickInteractionDriver *v2;
  UITouchForceGestureRecognizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIForceClickInteractionDriver;
  v2 = -[_UIForceClickInteractionDriver init](&v5, sel_init);
  if (v2)
  {
    v3 = -[UITouchForceGestureRecognizer initWithTarget:action:]([UITouchForceGestureRecognizer alloc], "initWithTarget:action:", v2, sel__handleGestureRecognizer_);
    -[UIGestureRecognizer setName:](v3, "setName:", CFSTR("kUIClickInteractionForceGestureRecognizer"));
    -[UITouchForceGestureRecognizer setMaximumNumberOfTouches:](v3, "setMaximumNumberOfTouches:", 1);
    -[UITouchForceGestureRecognizer setAutomaticTouchForce:](v3, "setAutomaticTouchForce:", 0.0);
    -[UIGestureRecognizer setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);
    -[UIGestureRecognizer setDelegate:](v3, "setDelegate:", v2);
    -[UIGestureRecognizer _setKeepTouchesOnContinuation:](v3, "_setKeepTouchesOnContinuation:", 1);
    -[_UIForceClickInteractionDriver setGestureRecognizer:](v2, "setGestureRecognizer:", v3);

  }
  return v2;
}

- (double)touchForce
{
  void *v2;
  double v3;
  double v4;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchForce");
  v4 = v3;

  return v4;
}

- (void)setAllowableMovement:(double)a3
{
  id v4;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowableMovement:", a3);

}

- (double)allowableMovement
{
  void *v2;
  double v3;
  double v4;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allowableMovement");
  v4 = v3;

  return v4;
}

+ (BOOL)requiresForceCapability
{
  return 1;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 1;
}

- (double)maximumEffectProgress
{
  return 1.0;
}

- (double)touchDuration
{
  void *v2;
  double v3;
  double v4;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "touchDuration");
  v4 = v3;

  return v4;
}

- (BOOL)hasExceededAllowableMovement
{
  void *v2;
  char v3;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasExceededAllowableMovement");

  return v3;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 1;
}

- (void)setView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  v5 = obj;
  if (WeakRetained != obj)
  {
    -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v6);

    v8 = objc_storeWeak((id *)&self->_view, obj);
    if (obj)
    {
      self->_currentState = 1;
      v9 = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(v9, "addGestureRecognizer:", v6);

    }
    v5 = obj;
  }

}

- (void)cancelInteraction
{
  void *v3;
  id v4;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  CGPoint result;

  v4 = a3;
  -[_UIForceClickInteractionDriver view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v5);
    v8 = v7;
    v10 = v9;

    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v4, v8, v10);
    v12 = v11;
    v14 = v13;
  }
  else
  {
    v12 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (unint64_t)inputPrecision
{
  _QWORD *v2;
  unint64_t v3;

  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[23];
  else
    v3 = 0;

  return v3;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return 0;
}

- (BOOL)allowsRepeatedClicks
{
  return 1;
}

- (void)_handleGestureRecognizer:(id)a3
{
  uint64_t *p_currentState;
  unint64_t currentState;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  _QWORD v16[5];

  p_currentState = (uint64_t *)&self->_currentState;
  currentState = self->_currentState;
  -[_UIForceClickInteractionDriver touchForce](self, "touchForce", a3);
  v7 = v6;
  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "state");

  if ((unint64_t)(v9 - 4) < 2)
  {
LABEL_7:
    v11 = self->_currentState;
    v12 = 3;
LABEL_8:
    handleEvent(stateMachineSpec_8, v11, v12, (uint64_t)self, p_currentState);
    goto LABEL_9;
  }
  if (v9 == 3)
  {
    if (currentState == 3)
      handleEvent(stateMachineSpec_8, self->_currentState, 2, (uint64_t)self, p_currentState);
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    -[_UIForceClickInteractionDriver delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59___UIForceClickInteractionDriver__handleGestureRecognizer___block_invoke;
    v16[3] = &unk_1E16C3F48;
    v16[4] = self;
    objc_msgSend(v10, "clickDriver:shouldBegin:", self, v16);

    goto LABEL_9;
  }
  if (currentState == 3)
  {
    if (v7 <= 2.2)
    {
      v11 = self->_currentState;
      v12 = 2;
      goto LABEL_8;
    }
  }
  else if (currentState == 2 && v7 >= 2.6)
  {
    v11 = self->_currentState;
    v12 = 1;
    goto LABEL_8;
  }
LABEL_9:
  if (*p_currentState == 2)
  {
    -[_UIForceClickInteractionDriver delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[_UIForceClickInteractionDriver delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clickDriver:didUpdateHighlightProgress:", self, v7 / 2.6 + 0.0);

    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a3;
  v7 = a4;
  -[_UIForceClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
    goto LABEL_2;
  objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (v12)
  {
    objc_msgSend(v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
      v9 = 1;
    else
      v9 = objc_msgSend(v13, "isDescendantOfView:", v14);

    goto LABEL_10;
  }
  -[_UIForceClickInteractionDriver delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[_UIForceClickInteractionDriver delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "clickDriver:shouldDelayGestureRecognizer:", self, v7);
LABEL_10:

    goto LABEL_11;
  }
LABEL_2:
  v9 = 0;
LABEL_11:

  return v9;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  handleEvent(stateMachineSpec_8, self->_currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
}

- (_UIClickInteractionDriverDelegate)delegate
{
  return (_UIClickInteractionDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (UITouchForceGestureRecognizer)gestureRecognizer
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
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
