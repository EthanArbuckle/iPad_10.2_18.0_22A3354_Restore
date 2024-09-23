@implementation SBUIPresentableCancelSystemDragGestureRecognizer

- (SBUIPresentableCancelSystemDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  SBUIPresentableCancelSystemDragGestureRecognizer *v4;
  SBUIPresentableCancelSystemDragGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIPresentableCancelSystemDragGestureRecognizer;
  v4 = -[SBUIPresentableCancelSystemDragGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[SBUIPresentableCancelSystemDragGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[SBUIPresentableCancelSystemDragGestureRecognizer setDelaysTouchesEnded:](v5, "setDelaysTouchesEnded:", 0);
    -[SBUIPresentableCancelSystemDragGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", MEMORY[0x1E0C9AA60]);
  }
  return v5;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (-[SBUIPresentableCancelSystemDragGestureRecognizer state](self, "state"))
  {
    v7 = 5;
  }
  else
  {
    -[SBUIPresentableCancelSystemDragGestureRecognizer delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "gestureRecognizer:shouldBeginWithTouches:event:", self, v10, v6);

    if (v9)
      v7 = 3;
    else
      v7 = 5;
  }
  -[SBUIPresentableCancelSystemDragGestureRecognizer setState:](self, "setState:", v7);

}

- (SBUIPresentableCancelSystemDragGestureRecognizerDelegate)delegate
{
  return (SBUIPresentableCancelSystemDragGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
