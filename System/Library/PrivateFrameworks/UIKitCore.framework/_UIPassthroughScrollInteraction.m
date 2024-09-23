@implementation _UIPassthroughScrollInteraction

- (_UIPassthroughScrollInteraction)init
{
  _UIPassthroughScrollInteraction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIPassthroughScrollInteraction;
  result = -[_UIPassthroughScrollInteraction init](&v3, sel_init);
  if (result)
    result->_eatsTouches = 1;
  return result;
}

+ (BOOL)_shouldEventBePassedThrough:(id)a3
{
  return +[_UIPassthroughScrollGestureRecognizer canHandleEventForPassthrough:](_UIPassthroughScrollGestureRecognizer, "canHandleEventForPassthrough:", a3);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p view: %@>"), v5, self, WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)setEatsTouches:(BOOL)a3
{
  if (self->_eatsTouches != a3)
  {
    self->_eatsTouches = a3;
    -[_UIPassthroughScrollInteraction _updateGesturesEatTouches](self, "_updateGesturesEatTouches");
  }
}

- (BOOL)hitTestsAsOpaque
{
  void *v2;
  void *v3;
  char v4;

  -[_UIPassthroughScrollInteraction _touchFallbackView](self, "_touchFallbackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hitTestsAsOpaque");

  return v4;
}

- (void)setHitTestsAsOpaque:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UIPassthroughScrollInteraction _touchFallbackView](self, "_touchFallbackView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHitTestsAsOpaque:", v3);

}

- (UIView)_touchFallbackView
{
  _UITouchFallbackView *v3;
  UIView *touchFallbackView;

  if (!self->_touchFallbackView
    && !-[_UIPassthroughScrollInteraction configuredForInactiveInteractionEventsOnly](self, "configuredForInactiveInteractionEventsOnly"))
  {
    v3 = objc_alloc_init(_UITouchFallbackView);
    touchFallbackView = self->_touchFallbackView;
    self->_touchFallbackView = &v3->super;

    -[UIView setAutoresizingMask:](self->_touchFallbackView, "setAutoresizingMask:", 18);
  }
  return self->_touchFallbackView;
}

- (_UIPassthroughScrollGestureRecognizer)_passthroughScrollGestureRecognizer
{
  _UIPassthroughScrollGestureRecognizer *passthroughScrollGestureRecognizer;
  _UIPassthroughScrollGestureRecognizer *v4;
  _UIPassthroughScrollGestureRecognizer *v5;

  passthroughScrollGestureRecognizer = self->_passthroughScrollGestureRecognizer;
  if (!passthroughScrollGestureRecognizer)
  {
    v4 = -[_UIPassthroughScrollGestureRecognizer initWithTarget:action:]([_UIPassthroughScrollGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePassthroughRecognizer_);
    v5 = self->_passthroughScrollGestureRecognizer;
    self->_passthroughScrollGestureRecognizer = v4;

    -[UIGestureRecognizer setDelegate:](self->_passthroughScrollGestureRecognizer, "setDelegate:", self);
    passthroughScrollGestureRecognizer = self->_passthroughScrollGestureRecognizer;
  }
  return passthroughScrollGestureRecognizer;
}

- (_UIPassthroughGateGestureRecognizer)_gestureGate
{
  _UIPassthroughGateGestureRecognizer *gestureGate;
  _UIPassthroughGateGestureRecognizer *v4;
  _UIPassthroughGateGestureRecognizer *v5;

  gestureGate = self->_gestureGate;
  if (!gestureGate)
  {
    v4 = objc_alloc_init(_UIPassthroughGateGestureRecognizer);
    v5 = self->_gestureGate;
    self->_gestureGate = v4;

    -[UIGestureRecognizer setDelegate:](self->_gestureGate, "setDelegate:", self);
    gestureGate = self->_gestureGate;
  }
  return gestureGate;
}

- (void)setRecognizeOnPrimaryButtonDown:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_recognizeOnPrimaryButtonDown = a3;
  -[_UIPassthroughScrollInteraction _passthroughScrollGestureRecognizer](self, "_passthroughScrollGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndForPrimaryButtonDown:", v3);

}

- (void)setRecognizeOnSecondaryButtonDown:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_recognizeOnSecondaryButtonDown = a3;
  -[_UIPassthroughScrollInteraction _passthroughScrollGestureRecognizer](self, "_passthroughScrollGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEndForSecondaryButtonDown:", v3);

}

- (void)_setUpForWindow:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  if (-[_UIPassthroughScrollInteraction configuredForInactiveInteractionEventsOnly](self, "configuredForInactiveInteractionEventsOnly"))
  {
    -[_UIPassthroughScrollInteraction _passthroughScrollGestureRecognizer](self, "_passthroughScrollGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setAcceptsFailureRequiments:", 0);

    -[_UIPassthroughScrollInteraction _gestureGate](self, "_gestureGate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setAcceptsFailureRequiments:", 0);
  }
  else
  {
    objc_msgSend(v17, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[_UIPassthroughScrollInteraction _touchFallbackView](self, "_touchFallbackView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    -[_UIPassthroughScrollInteraction _touchFallbackView](self, "_touchFallbackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertSubview:atIndex:", v5, 0);
  }

  -[_UIPassthroughScrollInteraction _passthroughScrollGestureRecognizer](self, "_passthroughScrollGestureRecognizer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addGestureRecognizer:", v15);

  -[_UIPassthroughScrollInteraction _gestureGate](self, "_gestureGate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addGestureRecognizer:", v16);

  -[_UIPassthroughScrollInteraction _updateGesturesEatTouches](self, "_updateGesturesEatTouches");
}

- (void)_updateGesturesEatTouches
{
  _UIPassthroughScrollGestureRecognizer *v3;
  _BOOL8 v4;
  id v5;

  v3 = self->_passthroughScrollGestureRecognizer;
  -[UIGestureRecognizer setCancelsTouchesInView:](v3, "setCancelsTouchesInView:", 0);
  -[UIGestureRecognizer setDelaysTouchesBegan:](v3, "setDelaysTouchesBegan:", 0);
  -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);

  v4 = -[_UIPassthroughScrollInteraction eatsTouches](self, "eatsTouches");
  -[_UIPassthroughScrollInteraction _gestureGate](self, "_gestureGate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCancelsTouchesInView:", 1);
  objc_msgSend(v5, "setDelaysTouchesBegan:", v4);
  objc_msgSend(v5, "setDelaysTouchesEnded:", v4);

}

- (void)dealloc
{
  objc_super v3;

  -[_UIPassthroughScrollInteraction _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)_UIPassthroughScrollInteraction;
  -[_UIPassthroughScrollInteraction dealloc](&v3, sel_dealloc);
}

+ (BOOL)_isPassthroughGestureRecognizer:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)_tearDown
{
  void *v3;
  id v4;

  -[UIView removeFromSuperview](self->_touchFallbackView, "removeFromSuperview");
  -[UIGestureRecognizer view](self->_passthroughScrollGestureRecognizer, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", self->_passthroughScrollGestureRecognizer);

  -[UIGestureRecognizer view](self->_gestureGate, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", self->_gestureGate);

}

- (void)didMoveToView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeWeak((id *)&self->_view, a3);
  -[_UIPassthroughScrollInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIPassthroughScrollInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPassthroughScrollInteraction.m"), 176, CFSTR("The view should already be in the window before adding a _UIPassthroughScrollInteraction"));

    }
    -[_UIPassthroughScrollInteraction view](self, "view");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPassthroughScrollInteraction _setUpForWindow:](self, "_setUpForWindow:", v8);

  }
}

- (void)_handlePassthroughRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[6];

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    v5 = objc_msgSend(v4, "endReason");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __64___UIPassthroughScrollInteraction__handlePassthroughRecognizer___block_invoke;
    v6[3] = &unk_1E16B1888;
    v6[4] = self;
    v6[5] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v6);
  }

}

- (void)_handlePassthroughGestureRecognizerEndWithReason:(unint64_t)a3
{
  void *v4;
  int v5;
  _UIPassthroughGateGestureRecognizer *gestureGate;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  int v12;
  id v13;

  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_9;
    case 2uLL:
      -[_UIPassthroughScrollInteraction delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "passthroughScrollInteractionDidRecognize:", self);

      if (!v12 || -[_UIPassthroughScrollInteraction eatsTouches](self, "eatsTouches"))
      {
LABEL_9:
        gestureGate = self->_gestureGate;
        goto LABEL_10;
      }
      gestureGate = self->_gestureGate;
      goto LABEL_17;
    case 3uLL:
      -[_UIPassthroughScrollInteraction delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "passthroughScrollInteractionDidRecognize:", self);

      v10 = !-[_UIPassthroughScrollInteraction configuredForInactiveInteractionEventsOnly](self, "configuredForInactiveInteractionEventsOnly")&& -[_UIPassthroughScrollInteraction eatsTouches](self, "eatsTouches");
      if (!v9 || v10)
      {
        gestureGate = self->_gestureGate;
LABEL_10:
        -[_UIPassthroughGateGestureRecognizer endClosed](gestureGate, "endClosed");
      }
      else
      {
        gestureGate = self->_gestureGate;
LABEL_17:
        -[_UIPassthroughGateGestureRecognizer open](gestureGate, "open");
      }
      return;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      -[_UIPassthroughScrollInteraction delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "passthroughScrollInteractionDidRecognize:", self);

      gestureGate = self->_gestureGate;
      if (v5)
        goto LABEL_17;
      goto LABEL_10;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPassthroughScrollInteraction.m"), 253, CFSTR("Unknown end reason received when handling end of a passthrough gesture recognizer"));

      return;
  }
}

- (BOOL)_delegateShouldInteractAtLocation:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  char v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIPassthroughScrollInteraction delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[_UIPassthroughScrollInteraction delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "passthroughScrollInteraction:shouldInteractAtLocation:withEvent:", self, v7, x, y);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_setOverrideAllowsHitTestingOnTouchFallbackView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIView layer](self->_touchFallbackView, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsHitTesting:", v3);

}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  _UIPassthroughScrollGestureRecognizer *v7;
  id v8;
  _BOOL4 v9;
  _UIPassthroughScrollGestureRecognizer *passthroughScrollGestureRecognizer;

  v6 = a3;
  v7 = (_UIPassthroughScrollGestureRecognizer *)a4;
  -[_UIPassthroughScrollInteraction _gestureGate](self, "_gestureGate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {
    passthroughScrollGestureRecognizer = self->_passthroughScrollGestureRecognizer;

    if (passthroughScrollGestureRecognizer != v7)
    {
      v9 = !-[_UIPassthroughScrollInteraction _passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:](self, "_passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:", v7);
      goto LABEL_6;
    }
  }
  else
  {

  }
  LOBYTE(v9) = 0;
LABEL_6:

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  _UIPassthroughScrollGestureRecognizer *v6;
  id v7;
  id v8;
  BOOL v9;

  v6 = (_UIPassthroughScrollGestureRecognizer *)a4;
  v7 = a3;
  -[_UIPassthroughScrollInteraction _gestureGate](self, "_gestureGate");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v8 == v7
    && self->_passthroughScrollGestureRecognizer != v6
    && -[_UIPassthroughScrollInteraction _passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:](self, "_passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:", v6);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return objc_msgSend(a4, "_isGestureType:", 1) ^ 1;
}

- (BOOL)_passthroughGestureRecognizer:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  objc_msgSend(a3, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPassthroughScrollInteraction view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertPoint:toView:", v11, x, y);
  v13 = v12;
  v15 = v14;

  LOBYTE(v10) = -[_UIPassthroughScrollInteraction _delegateShouldInteractAtLocation:withEvent:](self, "_delegateShouldInteractAtLocation:withEvent:", v9, v13, v15);
  return (char)v10;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  -[_UIPassthroughScrollInteraction _handlePassthroughGestureRecognizerEndWithReason:](self, "_handlePassthroughGestureRecognizerEndWithReason:", 1);
}

- (BOOL)_passthroughScrollGestureRecognizerShouldRequireFailureOfGestureRecognizer:(id)a3
{
  _UIPassthroughScrollGestureRecognizer *v4;
  BOOL v5;
  _UIPassthroughScrollGestureRecognizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _UIPassthroughScrollGestureRecognizer *v18;
  _UIPassthroughScrollGestureRecognizer *v19;
  _UIPassthroughScrollGestureRecognizer *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (_UIPassthroughScrollGestureRecognizer *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = 1;
    goto LABEL_7;
  }
  v7 = self->_passthroughScrollGestureRecognizer;
  if (self->_passthroughScrollGestureRecognizer == v4
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (-[UIGestureRecognizer view](v4, "view"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[UIGestureRecognizer view](self->_passthroughScrollGestureRecognizer, "view"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v8 != v9))
  {
    v5 = 0;
    goto LABEL_12;
  }
  -[UIGestureRecognizer delegate](v4, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "configuredForInactiveInteractionEventsOnly") & 1) != 0)
  {
    v5 = 1;
    goto LABEL_30;
  }
  -[UIGestureRecognizer view](v7, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "gestureRecognizers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v14)
  {
    v19 = 0;
    goto LABEL_29;
  }
  v15 = v14;
  v16 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v22 != v16)
        objc_enumerationMutation(v13);
      v18 = *(_UIPassthroughScrollGestureRecognizer **)(*((_QWORD *)&v21 + 1) + 8 * i);
      if (v18 == v7)
      {
        v20 = v7;
LABEL_28:
        v19 = v20;
        goto LABEL_29;
      }
      if (v18 == v4)
      {
        v20 = v4;
        goto LABEL_28;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v19 = 0;
    if (v15)
      continue;
    break;
  }
LABEL_29:

  v5 = v19 == v7;
LABEL_30:

LABEL_12:
LABEL_7:

  return v5;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (_UIPassthroughScrollInteractionDelegate)delegate
{
  return (_UIPassthroughScrollInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)recognizeOnPrimaryButtonDown
{
  return self->_recognizeOnPrimaryButtonDown;
}

- (BOOL)recognizeOnSecondaryButtonDown
{
  return self->_recognizeOnSecondaryButtonDown;
}

- (BOOL)eatsTouches
{
  return self->_eatsTouches;
}

- (BOOL)configuredForInactiveInteractionEventsOnly
{
  return self->_configuredForInactiveInteractionEventsOnly;
}

- (void)setConfiguredForInactiveInteractionEventsOnly:(BOOL)a3
{
  self->_configuredForInactiveInteractionEventsOnly = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureGate, 0);
  objc_storeStrong((id *)&self->_passthroughScrollGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchFallbackView, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
