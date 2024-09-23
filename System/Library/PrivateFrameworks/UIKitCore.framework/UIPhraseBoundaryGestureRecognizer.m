@implementation UIPhraseBoundaryGestureRecognizer

- (UIPhraseBoundaryGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIPhraseBoundaryGestureRecognizer *v4;
  UIPhraseBoundaryGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
  v4 = -[UILongPressGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
    -[UILongPressGestureRecognizer set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:](v4, "set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:", 1);
  return v5;
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  objc_storeWeak(&self->_userData, 0);
  self->_secondDelayElapsed = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
  -[UILongPressGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void)setState:(int64_t)a3
{
  UIDelayedAction *v5;
  UIDelayedAction *v6;
  UIDelayedAction *secondDelayTimer;
  objc_super v8;

  if (a3 == 1)
  {
    v5 = [UIDelayedAction alloc];
    -[UIPhraseBoundaryGestureRecognizer secondDelay](self, "secondDelay");
    v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v5, "initWithTarget:action:userInfo:delay:mode:", self, sel_secondDelayElapsed_, 0, *MEMORY[0x1E0C99860]);
    secondDelayTimer = self->_secondDelayTimer;
    self->_secondDelayTimer = v6;

  }
  v8.receiver = self;
  v8.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
  -[UIGestureRecognizer setState:](&v8, sel_setState_, a3);
}

- (void)secondDelayElapsed:(id)a3
{
  if (-[UIGestureRecognizer state](self, "state", a3) == UIGestureRecognizerStateBegan
    || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
  {
    self->_secondDelayElapsed = 1;
    -[UIPhraseBoundaryGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (void)_startEnoughTimeElapsedTimer
{
  void *v3;
  char v4;
  void *v5;
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
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;

  -[UIPhraseBoundaryGestureRecognizer textInput](self, "textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_hasMarkedText");

  if ((v4 & 1) == 0)
  {
    NSLog(CFSTR("Warning: phrase boundary gesture handler was called when there is no marked text"));
    v28.receiver = self;
    v28.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
    -[UIGestureRecognizer setState:](&v28, sel_setState_, 1);
    return;
  }
  -[UIPhraseBoundaryGestureRecognizer textInput](self, "textInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILongPressGestureRecognizer centroid](self, "centroid");
  v8 = v7;
  v10 = v9;
  -[UIGestureRecognizer view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
  v13 = v12;
  v15 = v14;

  if (!objc_msgSend(v5, "_usesAsynchronousProtocol"))
  {
    objc_msgSend(v5, "markedTextRange");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "closestPositionToPoint:withinRange:", v16, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "caretRectForPosition:", v17);
    v22 = v21 + v20 * 0.5 - v13;
    if (v22 >= 0.0)
      v23 = v22;
    else
      v23 = -v22;
    v24 = v18 - v15;
    if (v18 - v15 < 0.0)
      v24 = -(v18 - v15);
    v25 = v18 + v19 - v15;
    if (v25 < 0.0)
      v25 = -v25;
    if (v23 > 66.0 || v24 > 66.0 || v25 > 66.0)
    {
      -[UIPhraseBoundaryGestureRecognizer setState:](self, "setState:", 5, v24, v25);
    }
    else
    {
      v26.receiver = self;
      v26.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
      -[UILongPressGestureRecognizer _startEnoughTimeElapsedTimer](&v26, sel__startEnoughTimeElapsedTimer);
    }

    goto LABEL_25;
  }
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    if (objc_msgSend(v5, "pointIsNearMarkedText:", v13, v15))
      goto LABEL_22;
LABEL_24:
    -[UIPhraseBoundaryGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_25;
  }
  if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1EE0CE288))
  {
    if ((objc_msgSend(v5, "pointIsNearMarkedText:", v13, v15) & 1) != 0)
      goto LABEL_22;
    goto LABEL_24;
  }
  if ((objc_msgSend(v5, "isPointNearMarkedText:", v13, v15) & 1) == 0)
    goto LABEL_24;
LABEL_22:
  v27.receiver = self;
  v27.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
  -[UILongPressGestureRecognizer _startEnoughTimeElapsedTimer](&v27, sel__startEnoughTimeElapsedTimer);
LABEL_25:

}

- (void)clearAllTimers
{
  UIDelayedAction *secondDelayTimer;
  UIDelayedAction *v4;
  objc_super v5;

  secondDelayTimer = self->_secondDelayTimer;
  if (secondDelayTimer)
  {
    -[UIDelayedAction unschedule](secondDelayTimer, "unschedule");
    v4 = self->_secondDelayTimer;
    self->_secondDelayTimer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)UIPhraseBoundaryGestureRecognizer;
  -[UILongPressGestureRecognizer clearAllTimers](&v5, sel_clearAllTimers);
}

- (UITextInput)textInput
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->_textInput);
}

- (void)setTextInput:(id)a3
{
  objc_storeWeak((id *)&self->_textInput, a3);
}

- (double)secondDelay
{
  return self->_secondDelay;
}

- (void)setSecondDelay:(double)a3
{
  self->_secondDelay = a3;
}

- (BOOL)secondDelayElapsed
{
  return self->_secondDelayElapsed;
}

- (id)userData
{
  return objc_loadWeakRetained(&self->_userData);
}

- (void)setUserData:(id)a3
{
  objc_storeWeak(&self->_userData, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_userData);
  objc_destroyWeak((id *)&self->_textInput);
  objc_storeStrong((id *)&self->_secondDelayTimer, 0);
}

@end
