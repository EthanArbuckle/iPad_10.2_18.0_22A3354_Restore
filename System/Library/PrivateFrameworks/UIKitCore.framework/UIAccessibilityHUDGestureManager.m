@implementation UIAccessibilityHUDGestureManager

- (UIAccessibilityHUDGestureManager)initWithView:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  UIAccessibilityHUDGestureManager *v8;
  UIAccessibilityHUDGestureManager *v9;
  _UIAccessibilityHUDLongPressGestureRecognizer *v10;
  _UIAccessibilityHUDLongPressGestureRecognizer *recognizer;
  id WeakRetained;
  uint64_t v13;
  _UIAccessibilityHUDGateGestureRecognizer *gateRecognizer;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)UIAccessibilityHUDGestureManager;
  v8 = -[UIAccessibilityHUDGestureManager init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = -[_UIAccessibilityHUDLongPressGestureRecognizer initWithTarget:action:]([_UIAccessibilityHUDLongPressGestureRecognizer alloc], "initWithTarget:action:", v9, sel__gestureRecognizerChanged_);
    recognizer = v9->_recognizer;
    v9->_recognizer = v10;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v9->_recognizer, "setMinimumPressDuration:", 0.15);
    -[UIGestureRecognizer setDelegate:](v9->_recognizer, "setDelegate:", v9);
    WeakRetained = objc_loadWeakRetained((id *)&v9->_view);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", v9->_recognizer);

    v13 = objc_opt_new();
    gateRecognizer = v9->_gateRecognizer;
    v9->_gateRecognizer = (_UIAccessibilityHUDGateGestureRecognizer *)v13;

    -[UIGestureRecognizer setDelegate:](v9->_gateRecognizer, "setDelegate:", v9);
    v15 = objc_loadWeakRetained((id *)&v9->_view);
    objc_msgSend(v15, "addGestureRecognizer:", v9->_gateRecognizer);

    -[UIAccessibilityHUDGestureManager _setRecognizersEnabled:](v9, "_setRecognizersEnabled:", +[UILargeContentViewerInteraction isEnabled](UILargeContentViewerInteraction, "isEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel__didToggleLargeContentViewer_, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

    v17 = objc_loadWeakRetained((id *)&v9->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&v9->_delegate);
      v9->_delegateDirectlyShowsHUD = objc_opt_respondsToSelector() & 1;

    }
    else
    {
      v9->_delegateDirectlyShowsHUD = 0;
    }

    v19 = objc_loadWeakRetained((id *)&v9->_delegate);
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      v21 = objc_loadWeakRetained((id *)&v9->_delegate);
      -[UIGestureRecognizer setCancelsTouchesInView:](v9->_recognizer, "setCancelsTouchesInView:", objc_msgSend(v21, "_accessibilityHUDGestureManagerCancelsTouchesInView:", v9));

    }
  }

  return v9;
}

- (void)_setRecognizersEnabled:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_isLargeContentViewerEnabled");

  }
  else
  {
    v6 = 0;
  }
  -[UIGestureRecognizer setEnabled:](self->_recognizer, "setEnabled:", v6);
  -[UIGestureRecognizer setEnabled:](self->_gateRecognizer, "setEnabled:", v6);
}

- (void)dealloc
{
  objc_super v3;

  -[UIAccessibilityHUDGestureManager _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityHUDGestureManager;
  -[UIAccessibilityHUDGestureManager dealloc](&v3, sel_dealloc);
}

- (UIGestureRecognizer)_recognizer
{
  return (UIGestureRecognizer *)self->_recognizer;
}

- (void)_invalidate
{
  id WeakRetained;
  id v4;
  id v5;

  if (!self->_isInvalidated)
  {
    self->_isInvalidated = 1;
    -[UIAccessibilityHUDGestureManager _clearButtonItemGestureSubscriptions](self, "_clearButtonItemGestureSubscriptions");
    -[UIAccessibilityHUDGestureManager _setRecognizersEnabled:](self, "_setRecognizersEnabled:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_recognizer);

    v4 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v4, "removeGestureRecognizer:", self->_gateRecognizer);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("UILargeContentViewerInteractionEnabledStatusDidChangeNotification"), 0);

  }
}

- (id)_subscribedConcurrentGestureRecognizers
{
  NSMutableArray *subscribedConcurrentGestureRecognizers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  subscribedConcurrentGestureRecognizers = self->_subscribedConcurrentGestureRecognizers;
  if (!subscribedConcurrentGestureRecognizers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_subscribedConcurrentGestureRecognizers;
    self->_subscribedConcurrentGestureRecognizers = v4;

    subscribedConcurrentGestureRecognizers = self->_subscribedConcurrentGestureRecognizers;
  }
  return subscribedConcurrentGestureRecognizers;
}

- (void)_clearButtonItemGestureSubscriptions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[UIAccessibilityHUDGestureManager _subscribedConcurrentGestureRecognizers](self, "_subscribedConcurrentGestureRecognizers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "removeTarget:action:", self, sel__concurrentGestureRecognizerFired_);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[UIAccessibilityHUDGestureManager _subscribedConcurrentGestureRecognizers](self, "_subscribedConcurrentGestureRecognizers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllObjects");

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _UIAccessibilityHUDLongPressGestureRecognizer *v4;
  id v5;
  char v6;
  id WeakRetained;
  id v8;
  char v9;

  v4 = (_UIAccessibilityHUDLongPressGestureRecognizer *)a3;
  if (self->_recognizer == v4
    && (v5 = objc_loadWeakRetained((id *)&self->_delegate),
        v6 = objc_opt_respondsToSelector(),
        v5,
        (v6 & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_loadWeakRetained((id *)&self->_view);
    -[UILongPressGestureRecognizer locationInView:](v4, "locationInView:", v8);
    v9 = objc_msgSend(WeakRetained, "_accessibilityHUDGestureManager:shouldBeginAtPoint:", self);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UIAccessibilityHUDLongPressGestureRecognizer *v6;
  id v7;
  id WeakRetained;
  int v9;
  id v10;
  char v11;
  id v12;
  int v13;
  void *v14;
  BOOL v15;

  v6 = (_UIAccessibilityHUDLongPressGestureRecognizer *)a3;
  v7 = a4;
  if ((_UIAccessibilityHUDLongPressGestureRecognizer *)self->_gateRecognizer != v6)
  {
    if (self->_recognizer != v6
      || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
          v9 = objc_msgSend(WeakRetained, "_accessibilityHUDGestureManager:shouldRecognizeSimultaneouslyWithGestureRecognizer:", self, v7), WeakRetained, !v9))
    {
      v15 = 0;
      goto LABEL_9;
    }
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0
      || (v12 = objc_loadWeakRetained((id *)&self->_delegate),
          v13 = objc_msgSend(v12, "_accessibilityHUDGestureManager:shouldTerminateHUDGestureForOtherGestureRecognizer:", self, v7), v12, v13))
    {
      objc_msgSend(v7, "addTarget:action:", self, sel__concurrentGestureRecognizerFired_);
      -[UIAccessibilityHUDGestureManager _subscribedConcurrentGestureRecognizers](self, "_subscribedConcurrentGestureRecognizers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v7);

    }
  }
  v15 = 1;
LABEL_9:

  return v15;
}

- (BOOL)_gestureRecognizer:(id)a3 canCancelGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  char v8;
  id WeakRetained;
  char v10;

  v6 = a4;
  if (self->_recognizer == a3
    && (v7 = objc_loadWeakRetained((id *)&self->_delegate),
        v8 = objc_opt_respondsToSelector(),
        v7,
        (v8 & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_msgSend(WeakRetained, "_accessibilityHUDGestureManager:canCancelGestureRecognizer:", self, v6);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_backOff
{
  if (-[UIGestureRecognizer isEnabled](self->_recognizer, "isEnabled"))
  {
    -[UIAccessibilityHUDGestureManager _setRecognizersEnabled:](self, "_setRecognizersEnabled:", 0);
    -[UIAccessibilityHUDGestureManager _setRecognizersEnabled:](self, "_setRecognizersEnabled:", 1);
  }
}

- (void)_showAccessibilityHUDItem:(id)a3
{
  id v5;
  id v6;
  UIViewController **p_viewControllerDisplayingHUD;
  id WeakRetained;
  void *v9;
  id v10;
  id obj;

  if (self->_delegateDirectlyShowsHUD)
  {
    v5 = a3;
    obj = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(obj, "_accessibilityHUDGestureManager:showHUDItem:", self, v5);
  }
  else
  {
    v6 = a3;
    -[UIAccessibilityHUDGestureManager _bestViewControllerForView](self, "_bestViewControllerForView");
    obj = (id)objc_claimAutoreleasedReturnValue();
    p_viewControllerDisplayingHUD = &self->_viewControllerDisplayingHUD;
    WeakRetained = objc_loadWeakRetained((id *)p_viewControllerDisplayingHUD);

    v9 = obj;
    if (obj != WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)p_viewControllerDisplayingHUD);
      objc_msgSend(v10, "_dismissAccessibilityHUD");

      v9 = obj;
    }
    objc_storeWeak((id *)p_viewControllerDisplayingHUD, v9);
    objc_msgSend(obj, "_showAccessibilityHUDItem:", v6);
  }

}

- (void)_dismissAccessibilityHUD
{
  UIViewController **p_viewControllerDisplayingHUD;
  id v4;
  id WeakRetained;

  if (self->_delegateDirectlyShowsHUD)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_dismissAccessibilityHUDForGestureManager:", self);

  }
  else
  {
    p_viewControllerDisplayingHUD = &self->_viewControllerDisplayingHUD;
    v4 = objc_loadWeakRetained((id *)&self->_viewControllerDisplayingHUD);
    objc_msgSend(v4, "_dismissAccessibilityHUD");

    objc_storeWeak((id *)p_viewControllerDisplayingHUD, 0);
  }
}

- (void)_didToggleLargeContentViewer:(id)a3
{
  -[UIAccessibilityHUDGestureManager _setRecognizersEnabled:](self, "_setRecognizersEnabled:", +[UILargeContentViewerInteraction isEnabled](UILargeContentViewerInteraction, "isEnabled", a3));
}

- (id)_bestViewControllerForView
{
  UIAccessibilityHUDGestureDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || (v6 = objc_loadWeakRetained((id *)p_delegate),
        objc_msgSend(v6, "_viewControllerForAccessibilityHUDGestureManager:", self),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    +[UIAccessibilityHUDView preferredHUDSize](UIAccessibilityHUDView, "preferredHUDSize");
    v9 = v8;
    v11 = v10;
    v12 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v12, "_viewControllerForAncestor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (v13)
    {
      v15 = 3.40282347e38;
      while (1)
      {
        objc_msgSend(v13, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "size");
        v18 = v17;
        v20 = v19;

        v21 = v9 - v18 >= v11 - v20 ? v9 - v18 : v11 - v20;
        if (v21 < 0.0)
          break;
        if (v21 < v15)
        {
          v22 = v13;

          v14 = v22;
          v15 = v21;
        }
        objc_msgSend(v13, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "superview");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "_viewControllerForAncestor");
        v25 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v25;
        if (!v25)
          goto LABEL_12;
      }
      v26 = v13;
      v27 = v26;
    }
    else
    {
LABEL_12:
      v26 = v14;
      v14 = v26;
      v27 = 0;
    }
    v7 = v26;

  }
  return v7;
}

- (void)_openGate
{
  -[_UIRelationshipGestureRecognizer _fail](self->_gateRecognizer, "_fail");
}

- (void)_gestureRecognizerChanged:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  p_view = &self->_view;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(v5, "locationInView:", WeakRetained);
  v8 = v7;
  v10 = v9;

  v11 = objc_msgSend(v5, "state");
  if (v11 == 3)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "_accessibilityHUDGestureManager:gestureLiftedAtPoint:", self, v8, v10);

    goto LABEL_8;
  }
  if (v11 == 2)
    goto LABEL_5;
  if (v11 != 1)
  {
LABEL_8:
    -[UIAccessibilityHUDGestureManager _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD");
    -[UIAccessibilityHUDGestureManager _clearButtonItemGestureSubscriptions](self, "_clearButtonItemGestureSubscriptions");
    -[_UIRelationshipGestureRecognizer _fail](self->_gateRecognizer, "_fail");
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__openGate, 0);
    return;
  }
  -[UIAccessibilityHUDGestureManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__openGate, 0, 1.0);
LABEL_5:
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v12, "_accessibilityHUDGestureManager:HUDItemForPoint:", self, v8, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[UIAccessibilityHUDGestureManager _showAccessibilityHUDItem:](self, "_showAccessibilityHUDItem:", v14);

  }
  else
  {
    -[UIAccessibilityHUDGestureManager _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD");
  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedConcurrentGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_gateRecognizer, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
  objc_destroyWeak((id *)&self->_viewControllerDisplayingHUD);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
