@implementation _UIClickInteraction

- (void)willMoveToView:(id)a3
{
  UIInteractionEffect *interactionEffect;
  id v5;

  interactionEffect = self->_interactionEffect;
  self->_interactionEffect = 0;

  -[_UIClickInteraction driver](self, "driver");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setView:", 0);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)didMoveToView:(id)a3
{
  id v4;

  v4 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
    -[_UIClickInteraction _updateDriver](self, "_updateDriver");

}

- (_UIClickInteraction)init
{
  _UIClickInteraction *v2;
  _UIClickInteraction *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIClickInteraction;
  v2 = -[_UIClickInteraction init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UIClickInteraction setAllowableMovement:](v2, "setAllowableMovement:", 44.0);
    -[_UIClickInteraction setHapticsEnabled:](v3, "setHapticsEnabled:", 1);
  }
  return v3;
}

- (void)setHapticsEnabled:(BOOL)a3
{
  self->_hapticsEnabled = a3;
}

- (void)setAllowableMovement:(double)a3
{
  id v4;

  if (self->_allowableMovement != a3)
  {
    self->_allowableMovement = a3;
    -[_UIClickInteraction driver](self, "driver");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowableMovement:", a3);

  }
}

- (void)_updateDriver
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = -[_UIClickInteraction _driverClass](self, "_driverClass");
  -[_UIClickInteraction driver](self, "driver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class())
  {

    goto LABEL_5;
  }
  -[_UIClickInteraction driver](self, "driver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  if (v3 != (objc_class *)v6)
  {
LABEL_5:
    -[_UIClickInteraction driver](self, "driver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setView:", 0);

    v9 = (id)objc_opt_new();
    objc_msgSend(v9, "setDelegate:", self);
    -[_UIClickInteraction view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setView:", v8);

    -[_UIClickInteraction allowableMovement](self, "allowableMovement");
    objc_msgSend(v9, "setAllowableMovement:");
    -[_UIClickInteraction setDriver:](self, "setDriver:", v9);

  }
}

- (_UIClickInteractionDriving)driver
{
  return self->_driver;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setDriver:(id)a3
{
  objc_storeStrong((id *)&self->_driver, a3);
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (Class)_driverClass
{
  objc_class *v3;
  void *v4;

  v3 = -[_UIClickInteraction overrideDriverClass](self, "overrideDriverClass");
  if (!v3)
  {
    -[_UIClickInteraction delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "_clickInteractionDefaultDriverType:", self);
    v3 = (objc_class *)_UIClickInteractionDriverForActivationStyle();

  }
  return v3;
}

- (Class)overrideDriverClass
{
  return self->_overrideDriverClass;
}

- (_UIClickInteractionDelegate)delegate
{
  return (_UIClickInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)cancelInteraction
{
  id v2;

  -[_UIClickInteraction driver](self, "driver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelInteraction");

}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[_UIClickInteraction driver](self, "driver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInCoordinateSpace:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_beginInteraction
{
  void *v3;
  UIInteractionEffect *v4;
  UIInteractionEffect *interactionEffect;
  id v6;

  -[_UIClickInteraction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIClickInteraction interactionEffect](self, "interactionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "highlightEffectForClickInteraction:", self);
    v4 = (UIInteractionEffect *)objc_claimAutoreleasedReturnValue();
    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = v4;

  }
  -[_UIClickInteraction _createFeedbackGenerator](self, "_createFeedbackGenerator");

}

- (void)_endInteraction
{
  void *v3;
  void *v4;
  void *v5;
  UIInteractionEffect *interactionEffect;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[_UIClickInteraction interactionEffect](self, "interactionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setProgress:", 0.0);
    objc_msgSend(v4, "setEnded:", 1);
    -[_UIClickInteraction interactionEffect](self, "interactionEffect");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interaction:didChangeWithContext:", self, v4);

    interactionEffect = self->_interactionEffect;
    self->_interactionEffect = 0;

  }
  -[_UIClickInteraction delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[_UIClickInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clickInteractionDidEnd:", self);

  }
  if (-[_UIClickInteraction hapticsEnabled](self, "hapticsEnabled"))
  {
    -[_UIClickInteraction feedbackGenerator](self, "feedbackGenerator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userInteractionEnded");

    -[_UIClickInteraction setFeedbackGenerator:](self, "setFeedbackGenerator:", 0);
  }
}

- (void)_setOverrideDriverClass:(Class)a3
{
  if (self->_overrideDriverClass != a3)
  {
    self->_overrideDriverClass = a3;
    -[_UIClickInteraction _updateDriver](self, "_updateDriver");
  }
}

- (void)_createFeedbackGenerator
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  _UIClickFeedbackGenerator *v6;
  void *v7;
  _UIClickFeedbackGenerator *v8;
  id v9;

  -[_UIClickInteraction view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[_UIClickInteraction hapticsEnabled](self, "hapticsEnabled");

    if (!v5)
      return;
    v6 = [_UIClickFeedbackGenerator alloc];
    -[_UIClickInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_UIClickFeedbackGenerator initWithView:](v6, "initWithView:", v7);
    -[_UIClickInteraction setFeedbackGenerator:](self, "setFeedbackGenerator:", v8);

    -[_UIClickInteraction feedbackGenerator](self, "feedbackGenerator");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userInteractionStarted");
  }

}

- (BOOL)driverCancelsTouchesInView
{
  void *v2;
  char v3;

  -[_UIClickInteraction driver](self, "driver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cancelsTouchesInView");

  return v3;
}

- (void)setDriverCancelsTouchesInView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIClickInteraction driver](self, "driver");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCancelsTouchesInView:", v3);

}

- (void)clickDriver:(id)a3 shouldBegin:(id)a4
{
  void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a4;
  -[_UIClickInteraction delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v5, "clickInteractionShouldBegin:", self))
      v6 = 0;
    else
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }
  v7[2](v7, v6);

}

- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_UIClickInteraction delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a4)
  {
    case 0uLL:
      -[_UIClickInteraction _beginInteraction](self, "_beginInteraction");
      break;
    case 1uLL:
      if (-[_UIClickInteraction hapticsEnabled](self, "hapticsEnabled"))
      {
        -[_UIClickInteraction feedbackGenerator](self, "feedbackGenerator");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pressedDown");

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "clickInteractionDidClickDown:", self);
      break;
    case 2uLL:
      if (-[_UIClickInteraction hapticsEnabled](self, "hapticsEnabled")
        && (objc_msgSend(v9, "clicksUpAutomaticallyAfterTimeout") & 1) == 0)
      {
        -[_UIClickInteraction feedbackGenerator](self, "feedbackGenerator");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pressedUp");

      }
      objc_msgSend(v6, "clickInteractionDidClickUp:", self);
      break;
    case 3uLL:
      -[_UIClickInteraction _endInteraction](self, "_endInteraction");
      break;
    default:
      break;
  }

}

- (void)clickDriver:(id)a3 didUpdateHighlightProgress:(double)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  v6 = a3;
  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setProgress:", a4);
  objc_msgSend(v6, "maximumEffectProgress");
  v8 = v7;

  objc_msgSend(v10, "setMaximumProgress:", v8);
  -[_UIClickInteraction interactionEffect](self, "interactionEffect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "interaction:didChangeWithContext:", self, v10);

}

- (UIInteractionEffect)interactionEffect
{
  return self->_interactionEffect;
}

- (void)setInteractionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_interactionEffect, a3);
}

- (_UIClickFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (BOOL)hapticsEnabled
{
  return self->_hapticsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_driver, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
