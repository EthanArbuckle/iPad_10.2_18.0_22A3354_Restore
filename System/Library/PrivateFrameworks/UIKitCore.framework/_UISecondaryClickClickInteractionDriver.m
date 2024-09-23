@implementation _UISecondaryClickClickInteractionDriver

- (void)_gestureRecognizerFailed:(id)a3
{
  handleEvent(stateMachineSpec_7, self->_currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
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
    -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
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

- (_UISecondaryClickDriverGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UISecondaryClickClickInteractionDriver)init
{
  _UISecondaryClickClickInteractionDriver *v2;
  _UISecondaryClickDriverGestureRecognizer *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISecondaryClickClickInteractionDriver;
  v2 = -[_UISecondaryClickClickInteractionDriver init](&v5, sel_init);
  if (v2)
  {
    v3 = -[UIGestureRecognizer initWithTarget:action:]([_UISecondaryClickDriverGestureRecognizer alloc], "initWithTarget:action:", v2, sel__handleGestureRecognizer_);
    -[UIGestureRecognizer setDelegate:](v3, "setDelegate:", v2);
    -[_UISecondaryClickClickInteractionDriver setGestureRecognizer:](v2, "setGestureRecognizer:", v3);

  }
  return v2;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

- (_UIClickInteractionDriverDelegate)delegate
{
  return (_UIClickInteractionDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (BOOL)requiresForceCapability
{
  return 0;
}

+ (BOOL)prefersCancelsTouchesInView
{
  return 1;
}

- (double)maximumEffectProgress
{
  return 0.0;
}

- (double)touchDuration
{
  return 0.0;
}

- (BOOL)hasExceededAllowableMovement
{
  return 0;
}

- (BOOL)isCurrentlyAcceleratedByForce
{
  return 0;
}

- (void)cancelInteraction
{
  void *v3;
  id v4;

  -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
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
  -[_UISecondaryClickClickInteractionDriver view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
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

- (BOOL)allowsFeedback
{
  return 0;
}

- (unint64_t)inputPrecision
{
  _QWORD *v2;
  unint64_t v3;

  -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[23];
  else
    v3 = 0;

  return v3;
}

- (unint64_t)driverStyle
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 == v10)
      v11 = 1;
    else
      v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_handleGestureRecognizer:(id)a3
{
  void *v4;
  uint64_t v5;

  -[_UISecondaryClickClickInteractionDriver gestureRecognizer](self, "gestureRecognizer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  if (v5 == 1)
  {
    -[_UISecondaryClickClickInteractionDriver _attemptSecondaryClick](self, "_attemptSecondaryClick");
  }
  else if (v5 == 4)
  {
    handleEvent(stateMachineSpec_7, self->_currentState, 3, (uint64_t)self, (uint64_t *)&self->_currentState);
  }
}

- (void)_attemptSecondaryClick
{
  void *v3;
  _QWORD v4[5];

  -[_UISecondaryClickClickInteractionDriver delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65___UISecondaryClickClickInteractionDriver__attemptSecondaryClick__block_invoke;
  v4[3] = &unk_1E16C3F48;
  v4[4] = self;
  objc_msgSend(v3, "clickDriver:shouldBegin:", self, v4);

}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (BOOL)cancelsTouchesInView
{
  return self->_cancelsTouchesInView;
}

- (void)setCancelsTouchesInView:(BOOL)a3
{
  self->_cancelsTouchesInView = a3;
}

- (BOOL)clicksUpAutomaticallyAfterTimeout
{
  return self->_clicksUpAutomaticallyAfterTimeout;
}

@end
