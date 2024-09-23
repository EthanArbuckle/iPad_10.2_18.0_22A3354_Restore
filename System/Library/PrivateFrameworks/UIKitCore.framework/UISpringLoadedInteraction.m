@implementation UISpringLoadedInteraction

- (void)didMoveToView:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UISpringLoadedInteraction *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_storeWeak((id *)&self->_view, v4);
  if (!v4 && WeakRetained)
  {
    objc_opt_class();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(WeakRetained, "gestureRecognizers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v11, "delegate");
            v12 = (UISpringLoadedInteraction *)objc_claimAutoreleasedReturnValue();

            if (v12 == self)
              objc_msgSend(WeakRetained, "removeGestureRecognizer:", v11);
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UISpringLoadedInteraction)initWithInteractionBehavior:(id)interactionBehavior interactionEffect:(id)interactionEffect activationHandler:(void *)handler
{
  id v8;
  id v9;
  void *v10;
  UISpringLoadedInteraction *v11;
  void *v12;
  id v13;
  UISpringLoadedInteractionBehavior *v14;
  UISpringLoadedInteractionBehavior *v15;
  void *v16;
  UISpringLoadedInteractionEffect *v17;
  UISpringLoadedInteractionEffect *v18;
  objc_super v20;

  v8 = interactionBehavior;
  v9 = interactionEffect;
  v10 = handler;
  v20.receiver = self;
  v20.super_class = (Class)UISpringLoadedInteraction;
  v11 = -[UISpringLoadedInteraction init](&v20, sel_init);
  if (v11)
  {
    v12 = _Block_copy(v10);
    v13 = v11->_handler;
    v11->_handler = v12;

    if (v8)
    {
      v14 = (UISpringLoadedInteractionBehavior *)v8;
      v15 = v11->_interactionBehavior;
      v11->_interactionBehavior = v14;
    }
    else
    {
      +[UISpringLoadedInteraction _defaultInteractionBehavior](UISpringLoadedInteraction, "_defaultInteractionBehavior");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setDelegate:", v11);
      v15 = v11->_interactionBehavior;
      v11->_interactionBehavior = (UISpringLoadedInteractionBehavior *)v16;
    }

    if (v9)
    {
      v17 = (UISpringLoadedInteractionEffect *)v9;
    }
    else
    {
      +[UISpringLoadedInteraction _blinkEffect](UISpringLoadedInteraction, "_blinkEffect");
      v17 = (UISpringLoadedInteractionEffect *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v11->_interactionEffect;
    v11->_interactionEffect = v17;

    v11->_possibleStateDuration = 0.8;
  }

  return v11;
}

+ (id)hysteresisBehaviorWithBeginningVelocity:(double)a3 cancelingVelocity:(double)a4
{
  _UISpringLoadedHysteresisBehavior *v6;

  v6 = objc_alloc_init(_UISpringLoadedHysteresisBehavior);
  -[_UISpringLoadedHysteresisBehavior setBeginningVelocityThreshold:](v6, "setBeginningVelocityThreshold:", a3);
  -[_UISpringLoadedHysteresisBehavior setCancelingVelocityThreshold:](v6, "setCancelingVelocityThreshold:", a4);
  return v6;
}

+ (id)_defaultInteractionBehavior
{
  return (id)objc_msgSend(a1, "hysteresisBehaviorWithBeginningVelocity:cancelingVelocity:", 20.0, 40.0);
}

+ (id)_blinkEffect
{
  return objc_alloc_init(_UISpringLoadedBlinkingEffect);
}

- (UISpringLoadedInteraction)initWithActivationHandler:(void *)handler
{
  return -[UISpringLoadedInteraction initWithInteractionBehavior:interactionEffect:activationHandler:](self, "initWithInteractionBehavior:interactionEffect:activationHandler:", 0, 0, handler);
}

- (void)_setPossibleStateDuration:(double)a3
{
  self->_possibleStateDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activateAction, 0);
  objc_storeStrong((id *)&self->_emphasizeAction, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_storeStrong((id *)&self->_interactionBehavior, 0);
  objc_destroyWeak((id *)&self->_view);
}

+ (UISpringLoadedInteraction)springLoadedInteractionWithHandler:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__UISpringLoadedInteraction_springLoadedInteractionWithHandler___block_invoke;
  v9[3] = &unk_1E16C4260;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_msgSend(v5, "initWithActivationHandler:", v9);

  return (UISpringLoadedInteraction *)v7;
}

uint64_t __64__UISpringLoadedInteraction_springLoadedInteractionWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_dynamicGestureRecognizersForEvent:(id)a3
{
  UISpringLoadedGestureRecognizer *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = -[UIDragGestureRecognizer initWithTarget:action:]([UISpringLoadedGestureRecognizer alloc], "initWithTarget:action:", self, sel__springloadedStateChanged_);
  -[UIGestureRecognizer setDelegate:](v4, "setDelegate:", self);
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_springloadedStateChanged:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;
  UISpringLoadedInteraction *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  -[UISpringLoadedInteraction context](self, "context");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCurrentRecognizer:", v4);
  v5 = objc_msgSend(v4, "state");

  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (v5 == 3)
      v9 = 3;
    else
      v9 = 0;
    -[UISpringLoadedInteraction setState:](self, "setState:", v9);
    -[UISpringLoadedInteraction _resetBehavior](self, "_resetBehavior");
    -[UISpringLoadedInteraction setContext:](self, "setContext:", 0);
  }
  else
  {
    v6 = -[UISpringLoadedInteraction _shouldAllowInteractionWithContext:](self, "_shouldAllowInteractionWithContext:", v10);
    if (objc_msgSend(v10, "state") <= 0 && v6)
    {
      v7 = self;
      v8 = 1;
LABEL_9:
      -[UISpringLoadedInteraction setState:](v7, "setState:", v8);
      goto LABEL_12;
    }
    if (!v6)
    {
      v7 = self;
      v8 = 0;
      goto LABEL_9;
    }
  }
LABEL_12:

}

- (void)setState:(int64_t)a3
{
  void *v5;
  void (**handler)(id, UISpringLoadedInteraction *, void *);
  void *v7;
  id v8;

  -[UISpringLoadedInteraction context](self, "context");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "state") == a3)
  {
    if (a3 == 1)
LABEL_5:
      -[UISpringLoadedInteraction _startEmphasizeAction](self, "_startEmphasizeAction");
  }
  else
  {
    objc_msgSend(v8, "setState:", a3);
    -[UISpringLoadedInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTargetView:", v5);

    -[UISpringLoadedInteractionEffect interaction:didChangeWithContext:](self->_interactionEffect, "interaction:didChangeWithContext:", self, v8);
    switch(a3)
    {
      case 0:
        goto LABEL_9;
      case 1:
        goto LABEL_5;
      case 2:
        -[UISpringLoadedInteraction _startActivateAction](self, "_startActivateAction");
        break;
      case 3:
        handler = (void (**)(id, UISpringLoadedInteraction *, void *))self->_handler;
        if (handler)
        {
          -[UISpringLoadedInteraction context](self, "context");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          handler[2](handler, self, v7);

        }
LABEL_9:
        -[UISpringLoadedInteraction _cancelActions](self, "_cancelActions");
        break;
      default:
        break;
    }
  }

}

- (void)_reloadSpringLoadedInteractionBehavior
{
  void *v3;
  id v4;

  -[UISpringLoadedInteraction context](self, "context");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISpringLoadedInteraction _springloadedStateChanged:](self, "_springloadedStateChanged:", v3);

}

- (void)_startEmphasizeAction
{
  void *v3;
  UIDelayedAction *v4;

  -[UISpringLoadedInteraction emphasizeAction](self, "emphasizeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISpringLoadedInteraction emphasizeAction](self, "emphasizeAction");
    v4 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction touch](v4, "touch");
  }
  else
  {
    v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__emphasizeSpringLoading_, 0, self->_possibleStateDuration);
    -[UISpringLoadedInteraction setEmphasizeAction:](self, "setEmphasizeAction:");
  }

}

- (void)_emphasizeSpringLoading:(id)a3
{
  -[UISpringLoadedInteraction setState:](self, "setState:", 2);
}

- (void)_startActivateAction
{
  void *v3;
  UIDelayedAction *v4;

  -[UISpringLoadedInteraction activateAction](self, "activateAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UISpringLoadedInteraction activateAction](self, "activateAction");
    v4 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction touch](v4, "touch");
  }
  else
  {
    v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel__activateSpringLoading_, 0, 0.4);
    -[UISpringLoadedInteraction setActivateAction:](self, "setActivateAction:");
  }

}

- (void)_activateSpringLoading:(id)a3
{
  void *v3;
  id v4;

  -[UISpringLoadedInteraction context](self, "context", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spring");

}

- (void)_cancelActions
{
  void *v3;
  void *v4;

  -[UISpringLoadedInteraction emphasizeAction](self, "emphasizeAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UISpringLoadedInteraction setEmphasizeAction:](self, "setEmphasizeAction:", 0);
  -[UISpringLoadedInteraction activateAction](self, "activateAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[UISpringLoadedInteraction setActivateAction:](self, "setActivateAction:", 0);
}

- (UISpringLoadedInteractionContextImpl)context
{
  UISpringLoadedInteractionContextImpl *context;
  UISpringLoadedInteractionContextImpl *v4;
  UISpringLoadedInteractionContextImpl *v5;
  void *v6;

  context = self->_context;
  if (!context)
  {
    v4 = (UISpringLoadedInteractionContextImpl *)objc_opt_new();
    v5 = self->_context;
    self->_context = v4;

    -[UISpringLoadedInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISpringLoadedInteractionContextImpl setTargetView:](self->_context, "setTargetView:", v6);

    context = self->_context;
  }
  return context;
}

- (void)_resetBehavior
{
  UISpringLoadedInteractionBehavior *v3;

  v3 = self->_interactionBehavior;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UISpringLoadedInteractionBehavior interactionDidFinish:](v3, "interactionDidFinish:", self);

}

- (BOOL)_shouldAllowInteractionWithContext:(id)a3
{
  id v4;
  UISpringLoadedInteractionBehavior *v5;
  char v6;

  v4 = a3;
  v5 = self->_interactionBehavior;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = -[UISpringLoadedInteractionBehavior shouldAllowInteraction:withContext:](v5, "shouldAllowInteraction:withContext:", self, v4);
  else
    v6 = 1;

  return v6;
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (double)_possibleStateDuration
{
  return self->_possibleStateDuration;
}

- (id)interactionBehavior
{
  return self->_interactionBehavior;
}

- (id)interactionEffect
{
  return self->_interactionEffect;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIDelayedAction)emphasizeAction
{
  return self->_emphasizeAction;
}

- (void)setEmphasizeAction:(id)a3
{
  objc_storeStrong((id *)&self->_emphasizeAction, a3);
}

- (UIDelayedAction)activateAction
{
  return self->_activateAction;
}

- (void)setActivateAction:(id)a3
{
  objc_storeStrong((id *)&self->_activateAction, a3);
}

@end
