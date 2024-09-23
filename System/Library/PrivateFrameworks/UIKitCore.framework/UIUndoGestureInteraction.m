@implementation UIUndoGestureInteraction

- (void)willMoveToView:(id)a3
{
  id v4;

  if (!a3)
  {
    -[UIUndoGestureInteraction _removeGestureRecognizers](self, "_removeGestureRecognizers");
    -[UIUndoGestureInteraction clearHUDViews](self, "clearHUDViews");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

  }
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  p_view = &self->_view;
  objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    self->_previousRecognizedPanDirection = 0;
    self->_undoStateHUDIsAnimating = 0;
    self->_panDownStateChangedCounter = 0;
    self->_lastTapTimestamp = 0.0;
    -[UIUndoGestureInteraction _addGestureRecognizers](self, "_addGestureRecognizers");
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "actualSceneBounds");
    self->_currentActuallSceneBounds.origin.x = v8;
    self->_currentActuallSceneBounds.origin.y = v9;
    self->_currentActuallSceneBounds.size.width = v10;
    self->_currentActuallSceneBounds.size.height = v11;

    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_removeAllHUDOnContainerChange, CFSTR("UIKeyboardWillChangeFrameNotification"), 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_applicationWillSuspend, CFSTR("UIApplicationSuspendedNotification"), 0);

  }
}

- (void)_addGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  -[UIUndoGestureInteraction _createGestureRecognizersIfNecessary](self, "_createGestureRecognizersIfNecessary");
  -[UIUndoGestureInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addGestureRecognizer:", v4);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[UIUndoGestureInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", v6);

    -[UIUndoGestureInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addGestureRecognizer:", v8);

    -[UIUndoGestureInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addGestureRecognizer:", v10);

    -[UIUndoGestureInteraction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addGestureRecognizer:", v12);

    -[UIUndoGestureInteraction view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v14);

    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requireGestureRecognizerToFail:", v16);

    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requireGestureRecognizerToFail:", v18);

    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "requireGestureRecognizerToFail:", v20);

    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requireGestureRecognizerToFail:", v22);

    -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "requireGestureRecognizerToFail:", v24);

    -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "requireGestureRecognizerToFail:", v26);

    -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "requireGestureRecognizerToFail:", v28);

    -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "requireGestureRecognizerToFail:", v30);

    -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "requireGestureRecognizerToFail:", v31);

  }
}

- (BOOL)editingInteractionOptionsAllowGestureRecognizerToBegin:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v15;

  v4 = a3;
  -[UIUndoGestureInteraction currentResponder](self, "currentResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_15;
  -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((id)v7 == v4)
    {
      v13 = 6;
    }
    else
    {
      v8 = (void *)v7;
      -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v4)
      {
        v13 = 6;
        goto LABEL_13;
      }
      -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
      v10 = objc_claimAutoreleasedReturnValue();
      if ((id)v10 != v4)
      {
        v11 = (void *)v10;
        -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = 2;
LABEL_13:
          v14 = (-[UIUndoGestureInteraction privateEditingInteractionOptions](self, "privateEditingInteractionOptions") & v13) != 0;
          goto LABEL_16;
        }
        -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15 == v4)
        {
          v13 = 4;
          goto LABEL_13;
        }
LABEL_15:
        v14 = 0;
        goto LABEL_16;
      }
      v13 = 2;
    }

    goto LABEL_13;
  }
  v14 = -[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible");
LABEL_16:

  return v14;
}

- (_UIKBUndoGestureObserver)observerGesture
{
  return self->_observerGesture;
}

- (void)removeAllHUDOnContainerChange
{
  void *v3;
  void *v4;
  void *v5;

  if (-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
    -[UIUndoGestureInteraction setUndoInteractiveHUDVisibility:](self, "setUndoInteractiveHUDVisibility:", 0);
  if (-[UIUndoGestureInteraction currentStateHUDVisible](self, "currentStateHUDVisible"))
    -[UIUndoGestureInteraction setUndoStateHUDVisibility:withType:available:](self, "setUndoStateHUDVisibility:withType:available:", 0, 1, 1);
  -[UIUndoGestureInteraction clearHUDViews](self, "clearHUDViews");
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIUndoGestureInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeLayoutGuide:", v5);

    -[UIUndoGestureInteraction setLayoutGuide:](self, "setLayoutGuide:", 0);
  }
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)clearHUDViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIUndoGestureInteraction setUndoInteractiveHUD:](self, "setUndoInteractiveHUD:", 0);
  }
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[UIUndoGestureInteraction setUndoStateHUD:](self, "setUndoStateHUD:", 0);
  }
}

- (BOOL)currentInteractiveHUDVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alpha");
      v7 = v9 > 0.0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIKBUndoInteractionHUD)undoInteractiveHUD
{
  return self->_undoInteractiveHUD;
}

- (BOOL)currentStateHUDVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  double v9;

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alpha");
      v7 = v9 > 0.0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (UIKBUndoStateHUD)undoStateHUD
{
  return self->_undoStateHUD;
}

- (id)currentResponder
{
  return +[UIResponder _globalFirstResponder](UIResponder, "_globalFirstResponder");
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)_createGestureRecognizersIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[_UIKBUndoGestureObserver undoGestureObserverWithTarget:action:delegate:](_UIKBUndoGestureObserver, "undoGestureObserverWithTarget:action:delegate:", self, sel_observerGestureHandler_, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction setObserverGesture:](self, "setObserverGesture:", v4);

  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      +[_UIKBProductivitySingleTapGesture productivitySingleTapGestureRecognizerWithTarget:action:delegate:](_UIKBProductivitySingleTapGesture, "productivitySingleTapGestureRecognizerWithTarget:action:delegate:", self, sel_threeFingerSingleTap_, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIUndoGestureInteraction setThreeFingerSingleTap:](self, "setThreeFingerSingleTap:", v6);

    }
    -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      +[_UIKBProductivityDoubleTapGesture productivityDoubleTapGestureRecognizerWithTarget:action:delegate:](_UIKBProductivityDoubleTapGesture, "productivityDoubleTapGestureRecognizerWithTarget:action:delegate:", self, sel_threeFingerDoubleTap_, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIUndoGestureInteraction setThreeFingerDoubleTap:](self, "setThreeFingerDoubleTap:", v8);

    }
    -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[_UIKBProductivityPanGestureRecognizer productivityPanGestureRecognizerWithTarget:action:delegate:](_UIKBProductivityPanGestureRecognizer, "productivityPanGestureRecognizerWithTarget:action:delegate:", self, sel_threeFingerSlide_, self);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIUndoGestureInteraction setThreeFingerSlide:](self, "setThreeFingerSlide:", v10);

    }
    -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      +[_UIKBProductivityLongPressGestureRecognizer productivityLongPressGestureRecognizerWithTarget:action:delegate:](_UIKBProductivityLongPressGestureRecognizer, "productivityLongPressGestureRecognizerWithTarget:action:delegate:", self, sel_threeFingerLongPress_, self);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIUndoGestureInteraction setThreeFingerLongPress:](self, "setThreeFingerLongPress:", v12);

    }
    -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      +[_UIKBProductivityPinchGestureRecognizer productivityPinchGestureRecognizerWithTarget:action:delegate:](_UIKBProductivityPinchGestureRecognizer, "productivityPinchGestureRecognizerWithTarget:action:delegate:", self, sel_threeFingerPinch_, self);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[UIUndoGestureInteraction setThreeFingerPinch:](self, "setThreeFingerPinch:", v14);

    }
  }
}

- (void)setObserverGesture:(id)a3
{
  objc_storeStrong((id *)&self->_observerGesture, a3);
}

- (void)applicationWillSuspend
{
  -[UIUndoGestureInteraction clearUndoStateHUDDismissTimer](self, "clearUndoStateHUDDismissTimer");
  -[UIUndoGestureInteraction clearMultiPinchTimer](self, "clearMultiPinchTimer");
  -[UIUndoGestureInteraction clearHUDViews](self, "clearHUDViews");
}

- (int64_t)keyboardAppearance
{
  void *v2;
  void *v3;
  int64_t v4;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardAppearance");

  return v4;
}

- (double)currentTime
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (CGRect)actualSceneBounds
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UIUndoGestureInteraction view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actualSceneBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isRTLMode
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "characterDirectionForLanguage:", v3) == 2;

  return (char)v2;
}

- (void)layoutUndoInteractiveHUD
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIKBUndoInteractionHUD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILayoutGuide *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSLayoutConstraint *v36;
  NSLayoutConstraint *undoHUDContainerWidthConstraint;
  void *v38;
  void *v39;
  NSLayoutConstraint *v40;
  NSLayoutConstraint *undoHUDContainerHeightConstraint;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  void *v63;
  id v64;

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIUndoGestureInteraction setUndoInteractiveHUD:](self, "setUndoInteractiveHUD:", 0);
  }
  -[UIUndoGestureInteraction actualSceneBounds](self, "actualSceneBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIUndoGestureInteraction setCurrentActuallSceneBounds:](self, "setCurrentActuallSceneBounds:");
  v13 = -[UIKBUndoInteractionHUD initWithKeyboardAppearance:isRTL:mode:sceneBounds:]([UIKBUndoInteractionHUD alloc], "initWithKeyboardAppearance:isRTL:mode:sceneBounds:", -[UIUndoGestureInteraction keyboardAppearance](self, "keyboardAppearance"), -[UIUndoGestureInteraction isRTLMode](self, "isRTLMode"), self->_interactiveHUDMode, v6, v8, v10, v12);
  -[UIUndoGestureInteraction setUndoInteractiveHUD:](self, "setUndoInteractiveHUD:", v13);

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActionDelegate:", self);

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAlpha:", 0.0);

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIUndoGestureInteraction view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v18);

  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v20 = objc_alloc_init(UILayoutGuide);
    -[UIUndoGestureInteraction setLayoutGuide:](self, "setLayoutGuide:", v20);

    -[UIUndoGestureInteraction view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addLayoutGuide:", v22);

    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leftAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction view](self, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "safeAreaLayoutGuide");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);

    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToConstant:", v10);
    v36 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    undoHUDContainerWidthConstraint = self->_undoHUDContainerWidthConstraint;
    self->_undoHUDContainerWidthConstraint = v36;

    -[NSLayoutConstraint setActive:](self->_undoHUDContainerWidthConstraint, "setActive:", 1);
    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "heightAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToConstant:", v12);
    v40 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    undoHUDContainerHeightConstraint = self->_undoHUDContainerHeightConstraint;
    self->_undoHUDContainerHeightConstraint = v40;

    -[NSLayoutConstraint setActive:](self->_undoHUDContainerHeightConstraint, "setActive:", 1);
  }
  -[UIUndoGestureInteraction currentActuallSceneBounds](self, "currentActuallSceneBounds");
  v43 = v42;
  -[UIUndoGestureInteraction undoHUDContainerWidthConstraint](self, "undoHUDContainerWidthConstraint");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setConstant:", v43);

  -[UIUndoGestureInteraction currentActuallSceneBounds](self, "currentActuallSceneBounds");
  v46 = v45;
  -[UIUndoGestureInteraction undoHUDContainerHeightConstraint](self, "undoHUDContainerHeightConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setConstant:", v46);

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "centerXAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "centerXAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction view](self, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "topAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v56, 31.0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "topAnchor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "topAnchor");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "constraintEqualToAnchor:constant:", v61, 7.0);
  v64 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v62) = 1144750080;
  objc_msgSend(v64, "setPriority:", v62);
  objc_msgSend(v64, "setActive:", 1);
  -[UIUndoGestureInteraction view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "layoutIfNeeded");

}

- (void)layoutUndoStateHUD
{
  void *v3;
  void *v4;
  UIKBUndoStateHUD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  UILayoutGuide *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *undoHUDContainerWidthConstraint;
  void *v33;
  void *v34;
  NSLayoutConstraint *v35;
  NSLayoutConstraint *undoHUDContainerHeightConstraint;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSLayoutConstraint *v47;
  NSLayoutConstraint *undoStateHUDTopConstraint;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSLayoutConstraint *v58;
  NSLayoutConstraint *undoStateHUDCenterConstraint;
  void *v60;
  id v61;

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[UIUndoGestureInteraction setUndoStateHUD:](self, "setUndoStateHUD:", 0);
  }
  v5 = -[UIKBUndoStateHUD initWithKeyboardAppearance:]([UIKBUndoStateHUD alloc], "initWithKeyboardAppearance:", -[UIUndoGestureInteraction keyboardAppearance](self, "keyboardAppearance"));
  -[UIUndoGestureInteraction setUndoStateHUD:](self, "setUndoStateHUD:", v5);

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[UIUndoGestureInteraction view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

  -[UIUndoGestureInteraction actualSceneBounds](self, "actualSceneBounds");
  v11 = v10;
  v13 = v12;
  -[UIUndoGestureInteraction setCurrentActuallSceneBounds:](self, "setCurrentActuallSceneBounds:");
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc_init(UILayoutGuide);
    -[UIUndoGestureInteraction setLayoutGuide:](self, "setLayoutGuide:", v15);

    -[UIUndoGestureInteraction view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addLayoutGuide:", v17);

    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToConstant:", v11);
    v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    undoHUDContainerWidthConstraint = self->_undoHUDContainerWidthConstraint;
    self->_undoHUDContainerWidthConstraint = v31;

    -[NSLayoutConstraint setActive:](self->_undoHUDContainerWidthConstraint, "setActive:", 1);
    -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToConstant:", v13);
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    undoHUDContainerHeightConstraint = self->_undoHUDContainerHeightConstraint;
    self->_undoHUDContainerHeightConstraint = v35;

    -[NSLayoutConstraint setActive:](self->_undoHUDContainerHeightConstraint, "setActive:", 1);
  }
  -[UIUndoGestureInteraction currentActuallSceneBounds](self, "currentActuallSceneBounds");
  v38 = v37;
  -[UIUndoGestureInteraction undoHUDContainerWidthConstraint](self, "undoHUDContainerWidthConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setConstant:", v38);

  -[UIUndoGestureInteraction currentActuallSceneBounds](self, "currentActuallSceneBounds");
  v41 = v40;
  -[UIUndoGestureInteraction undoHUDContainerHeightConstraint](self, "undoHUDContainerHeightConstraint");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setConstant:", v41);

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:constant:", v46, 45.0);
  v47 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  undoStateHUDTopConstraint = self->_undoStateHUDTopConstraint;
  self->_undoStateHUDTopConstraint = v47;

  -[NSLayoutConstraint setActive:](self->_undoStateHUDTopConstraint, "setActive:", 1);
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "centerYAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "topAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "constraintEqualToAnchor:constant:", v52, 21.0);
  v61 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v53) = 1144750080;
  objc_msgSend(v61, "setPriority:", v53);
  objc_msgSend(v61, "setActive:", 1);
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "centerXAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "centerXAnchor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToAnchor:constant:", v57, 0.0);
  v58 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  undoStateHUDCenterConstraint = self->_undoStateHUDCenterConstraint;
  self->_undoStateHUDCenterConstraint = v58;

  -[NSLayoutConstraint setActive:](self->_undoStateHUDCenterConstraint, "setActive:", 1);
  -[UIUndoGestureInteraction view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layoutIfNeeded");

}

- (BOOL)needUpdateHUDForContainerChange
{
  int64_t v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  BOOL v17;
  CGRect v19;
  CGRect v20;

  v3 = -[UIUndoGestureInteraction currentAppearance](self, "currentAppearance");
  if (v3 != -[UIUndoGestureInteraction keyboardAppearance](self, "keyboardAppearance"))
    return 1;
  -[UIUndoGestureInteraction currentActuallSceneBounds](self, "currentActuallSceneBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIUndoGestureInteraction actualSceneBounds](self, "actualSceneBounds");
  v20.origin.x = v12;
  v20.origin.y = v13;
  v20.size.width = v14;
  v20.size.height = v15;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
    return 1;
  -[UIUndoGestureInteraction layoutGuide](self, "layoutGuide");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  return v17;
}

- (void)_createAndUpdateUndoInteractiveHUDIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  int64_t interactiveHUDMode;
  id v7;

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 || -[UIUndoGestureInteraction needUpdateHUDForContainerChange](self, "needUpdateHUDForContainerChange"))
  {

LABEL_5:
    -[UIUndoGestureInteraction layoutUndoInteractiveHUD](self, "layoutUndoInteractiveHUD");
    -[UIUndoGestureInteraction setCurrentAppearance:](self, "setCurrentAppearance:", -[UIUndoGestureInteraction keyboardAppearance](self, "keyboardAppearance"));
    goto LABEL_6;
  }
  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mode");
  interactiveHUDMode = self->_interactiveHUDMode;

  if (v5 != interactiveHUDMode)
    goto LABEL_5;
LABEL_6:
  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

}

- (id)currentInteractionHUD
{
  return self->_undoInteractiveHUD;
}

- (void)_createAndUpdateUndoStateHUDIfNecessary
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  id v6;

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        v5 = -[UIUndoGestureInteraction needUpdateHUDForContainerChange](self, "needUpdateHUDForContainerChange"),
        v4,
        v5))
  {
    -[UIUndoGestureInteraction layoutUndoStateHUD](self, "layoutUndoStateHUD");
    -[UIUndoGestureInteraction setCurrentAppearance:](self, "setCurrentAppearance:", -[UIUndoGestureInteraction keyboardAppearance](self, "keyboardAppearance"));
  }
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

}

- (void)animateInStateHUD
{
  void *v3;
  uint64_t v4;
  NSLayoutConstraint *undoStateHUDCenterConstraint;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlType");

  if (v4 != 1)
  {
    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "controlType");

    if (v8 == 2)
    {
      undoStateHUDCenterConstraint = self->_undoStateHUDCenterConstraint;
      v6 = -15.0;
      goto LABEL_5;
    }
    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "controlType") == 4)
    {

    }
    else
    {
      -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "controlType");

      if (v11 != 3)
      {
        -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "controlType");

        if (v20 != 5)
          goto LABEL_11;
        -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "undoStateHUDWidthConstraint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setConstant:", -30.0);

        -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "undoStateHUDHeightConstraint");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        v17 = -30.0;
        goto LABEL_10;
      }
    }
    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "undoStateHUDWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", 30.0);

    -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "undoStateHUDHeightConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 30.0;
LABEL_10:
    objc_msgSend(v15, "setConstant:", v17);

    goto LABEL_11;
  }
  undoStateHUDCenterConstraint = self->_undoStateHUDCenterConstraint;
  v6 = 15.0;
LABEL_5:
  -[NSLayoutConstraint setConstant:](undoStateHUDCenterConstraint, "setConstant:", v6);
LABEL_11:
  -[UIUndoGestureInteraction view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

  v23[4] = self;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke;
  v24[3] = &unk_1E16B1B28;
  v24[4] = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke_2;
  v23[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v24, v23, 0.7, 0.0, 0.5, 0.0);
}

void __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "controlType") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "controlType");

    if (v5 == 2)
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "controlType") != 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "controlType") != 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "controlType");

        if (v13 != 5)
          goto LABEL_10;
        goto LABEL_9;
      }

    }
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoStateHUDWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "undoStateHUDHeightConstraint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConstant:", 0.0);

    goto LABEL_10;
  }

LABEL_4:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setConstant:", 0.0);
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "view");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "layoutIfNeeded");

}

uint64_t __45__UIUndoGestureInteraction_animateInStateHUD__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 0);
}

- (void)animateDisplayingStateHUD
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v15;
  uint64_t v16;
  _QWORD v17[7];
  _QWORD v18[5];
  __int128 v19;

  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlType");

  if (v4 == 1)
  {
    _Q0 = xmmword_186681A60;
LABEL_9:
    v17[6] = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke;
    v18[3] = &unk_1E16B4E70;
    v18[4] = self;
    v19 = _Q0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_2;
    v17[3] = &unk_1E16B2290;
    v17[4] = self;
    v17[5] = 0;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v18, v17, 0.1);
    return;
  }
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "controlType");

  if (v7 == 2)
  {
    _Q0 = xmmword_186681A70;
    goto LABEL_9;
  }
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "controlType") == 4)
  {

LABEL_8:
    __asm { FMOV            V0.2D, #-3.75 }
    goto LABEL_9;
  }
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "controlType");

  if (v10 == 3)
    goto LABEL_8;
  -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "controlType");

  if (v16 == 5)
  {
    __asm { FMOV            V0.2D, #3.75 }
    goto LABEL_9;
  }
}

void __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "controlType") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "controlType");

    if (v4 == 2)
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "controlType") != 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "controlType") != 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "controlType");

        if (v14 != 5)
          goto LABEL_10;
        goto LABEL_9;
      }

    }
LABEL_9:
    v7 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoStateHUDWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v7);

    v10 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "undoStateHUDHeightConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v10);

    goto LABEL_10;
  }

LABEL_4:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setConstant:", *(double *)(a1 + 40));
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

uint64_t __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_2(uint64_t a1)
{
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_3;
  v4[3] = &unk_1E16B4E70;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_4;
  v3[3] = &unk_1E16B3FD8;
  v3[4] = v5;
  return +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v3, 0.2);
}

void __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "controlType") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "controlType");

    if (v4 == 2)
      goto LABEL_4;
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "controlType") != 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "controlType") != 3)
      {
        objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "controlType");

        if (v14 != 5)
          goto LABEL_10;
        goto LABEL_9;
      }

    }
LABEL_9:
    v7 = *(double *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "undoStateHUDWidthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setConstant:", v7);

    v10 = *(double *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "undoStateHUDHeightConstraint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setConstant:", v10);

    goto LABEL_10;
  }

LABEL_4:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setConstant:", *(double *)(a1 + 40));
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

uint64_t __53__UIUndoGestureInteraction_animateDisplayingStateHUD__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 0);
}

- (void)_installUndoManagerObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateHUDControlState, *MEMORY[0x1E0CB33B8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateHUDControlState, *MEMORY[0x1E0CB33B0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateHUDControlState, *MEMORY[0x1E0CB33A0], 0);

}

- (void)_uninstallUndoManagerObservers
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33B0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CB33A0], 0);

}

- (void)setUndoHUDType:(int64_t)a3 visibility:(BOOL)a4
{
  int v4;
  _BOOL4 v7;
  int v8;
  double v9;
  void *v10;
  uint64_t *v11;
  uint64_t *v12;
  BOOL v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  UIUndoGestureInteraction *v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  UIUndoGestureInteraction *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  UIUndoGestureInteraction *v38;
  _QWORD v39[5];
  _QWORD v40[6];

  v4 = a4;
  v7 = -[UIUndoGestureInteraction currentStateHUDVisible](self, "currentStateHUDVisible");
  v8 = -[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible");
  if (a3)
  {
    if (a3 == 1)
    {
      if (v4)
      {
        -[UIUndoGestureInteraction touchUndoStateHUDDismissTimer](self, "touchUndoStateHUDDismissTimer");
        if (v7)
          -[UIUndoGestureInteraction animateDisplayingStateHUD](self, "animateDisplayingStateHUD");
        else
          -[UIUndoGestureInteraction animateInStateHUD](self, "animateInStateHUD");
      }
      else
      {
        v13 = !-[UIUndoGestureInteraction undoStateHUDIsAnimating](self, "undoStateHUDIsAnimating");
        v14 = 0.0;
        if (!v13)
          v14 = 0.2;
        v39[4] = self;
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke;
        v40[3] = &unk_1E16B1888;
        v40[4] = self;
        v40[5] = 0;
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_2;
        v39[3] = &unk_1E16B3FD8;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v40, v39, 0.2, v14);
      }
    }
  }
  else if (v8 != v4)
  {
    if (v4)
      v9 = 1.0;
    else
      v9 = 0.0;
    if (v4)
    {
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateHUDControlState");

    }
    if (v7)
    {
      -[UIUndoGestureInteraction _uninstallUndoManagerObservers](self, "_uninstallUndoManagerObservers");
      -[UIUndoGestureInteraction touchUndoStateHUDDismissTimer](self, "touchUndoStateHUDDismissTimer");
      v34 = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_3;
      v37 = &unk_1E16B1B28;
      v38 = self;
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_4;
      v30 = &unk_1E16D9340;
      v31 = self;
      v32 = v9;
      LOBYTE(v33) = v4;
      v11 = &v34;
      v12 = &v27;
    }
    else
    {
      -[UIUndoGestureInteraction _installUndoManagerObservers](self, "_installUndoManagerObservers");
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_9;
      v24 = &unk_1E16B1888;
      v25 = self;
      v26 = v9;
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_10;
      v19 = &__block_descriptor_33_e8_v12__0B8l;
      LOBYTE(v20) = v4;
      v11 = &v21;
      v12 = &v16;
    }
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v12, 0.2, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, *(_QWORD *)&v26, v27, v28, v29,
      v30,
      v31,
      *(_QWORD *)&v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38);
  }
  -[UIUndoGestureInteraction view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

uint64_t __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 0);
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUDTopConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 60.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

}

uint64_t __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_4(uint64_t a1)
{
  _QWORD v2[5];
  char v3;
  _QWORD v4[4];
  uint64_t v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_5;
  v4[3] = &unk_1E16B1888;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_6;
  v2[3] = &unk_1E16B7F38;
  v2[4] = v5;
  v3 = *(_BYTE *)(a1 + 48);
  return +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v2, 0.2);
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_5(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

}

uint64_t __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_6(uint64_t a1)
{
  _QWORD v2[5];
  char v3;
  _QWORD v4[4];
  uint64_t v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_7;
  v4[3] = &unk_1E16B1B28;
  v5 = *(_QWORD *)(a1 + 32);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_8;
  v2[3] = &unk_1E16B7F38;
  v2[4] = v5;
  v3 = *(_BYTE *)(a1 + 40);
  return +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v4, v2, 0.2);
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 1);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 0);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUDTopConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 31.0);

  objc_msgSend(*(id *)(a1 + 32), "clearUndoStateHUDDismissTimer");
  if (!*(_BYTE *)(a1 + 40))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "set_mimicShiftBeingHeld:", 0);

  }
}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_9(uint64_t a1)
{
  double v1;
  id v2;

  v1 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", v1);

}

void __54__UIUndoGestureInteraction_setUndoHUDType_visibility___block_invoke_10(uint64_t a1)
{
  id v1;

  if (!*(_BYTE *)(a1 + 32))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "set_mimicShiftBeingHeld:", 0);

  }
}

- (void)setUndoInteractiveHUDVisibility:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (a3)
  {
    self->_interactiveHUDMode = 0;
    -[UIUndoGestureInteraction _createAndUpdateUndoInteractiveHUDIfNecessary](self, "_createAndUpdateUndoInteractiveHUDIfNecessary");
    -[UIUndoGestureInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIEditMenuSceneComponent sceneComponentForView:](_UIEditMenuSceneComponent, "sceneComponentForView:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissCurrentMenu");

  }
  -[UIUndoGestureInteraction setUndoHUDType:visibility:](self, "setUndoHUDType:visibility:", 0, v3);
}

- (void)setPasteConfirmationHUDVisibility:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (a3)
  {
    self->_interactiveHUDMode = 1;
    -[UIUndoGestureInteraction _createAndUpdateUndoInteractiveHUDIfNecessary](self, "_createAndUpdateUndoInteractiveHUDIfNecessary");
  }
  -[UIUndoGestureInteraction setUndoHUDType:visibility:](self, "setUndoHUDType:visibility:", 0, v3);
}

- (void)setUndoStateHUDVisibility:(BOOL)a3 withType:(int64_t)a4 available:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  void *v9;

  v5 = a5;
  v7 = a3;
  if (!-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    if (v7)
    {
      -[UIUndoGestureInteraction _createAndUpdateUndoStateHUDIfNecessary](self, "_createAndUpdateUndoStateHUDIfNecessary");
      -[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "updateUndoStateHUDControlType:available:", a4, v5);

    }
    -[UIUndoGestureInteraction setUndoHUDType:visibility:](self, "setUndoHUDType:visibility:", 1, v7);
  }
}

- (void)touchUndoStateHUDDismissTimer
{
  void *v3;
  UIDelayedAction *v4;

  -[UIUndoGestureInteraction undoStateHUDDismissTimer](self, "undoStateHUDDismissTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIUndoGestureInteraction undoStateHUDDismissTimer](self, "undoStateHUDDismissTimer");
    v4 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction touch](v4, "touch");
  }
  else
  {
    v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_undoStateHUDDismissTimerElaspsed_, 0, 2.0);
    -[UIUndoGestureInteraction setUndoStateHUDDismissTimer:](self, "setUndoStateHUDDismissTimer:");
  }

}

- (void)clearUndoStateHUDDismissTimer
{
  void *v3;

  -[UIUndoGestureInteraction undoStateHUDDismissTimer](self, "undoStateHUDDismissTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UIUndoGestureInteraction setUndoStateHUDDismissTimer:](self, "setUndoStateHUDDismissTimer:", 0);
}

- (void)undoStateHUDDismissTimerElaspsed:(id)a3
{
  id v4;

  if (-[UIUndoGestureInteraction currentStateHUDVisible](self, "currentStateHUDVisible", a3)
    && -[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    -[UIUndoGestureInteraction touchUndoStateHUDDismissTimer](self, "touchUndoStateHUDDismissTimer");
  }
  else
  {
    -[UIUndoGestureInteraction setUndoStateHUDVisibility:withType:available:](self, "setUndoStateHUDVisibility:withType:available:", 0, 0, 1);
    -[UIUndoGestureInteraction undoStateHUDTopConstraint](self, "undoStateHUDTopConstraint");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConstant:", 31.0);

  }
}

- (void)_removeGestureRecognizers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[UIUndoGestureInteraction view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeGestureRecognizer:", v4);

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[UIUndoGestureInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeGestureRecognizer:", v6);

    -[UIUndoGestureInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeGestureRecognizer:", v8);

    -[UIUndoGestureInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeGestureRecognizer:", v10);

    -[UIUndoGestureInteraction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeGestureRecognizer:", v12);

    -[UIUndoGestureInteraction view](self, "view");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeGestureRecognizer:", v13);

  }
}

- (id)_undoManager
{
  void *v2;
  void *v3;

  -[UIUndoGestureInteraction currentResponder](self, "currentResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)privateEditingInteractionOptions
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[UIUndoGestureInteraction currentResponder](self, "currentResponder");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 6;
  v3 = (void *)v2;
  v4 = 6;
  while (1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v3, "editingInteractionConfiguration"))
        v5 = 6;
      else
        v5 = 0;
      v4 &= v5;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
      break;
    objc_msgSend(v3, "nextResponder");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
    if (!v6)
      return v4;
  }

  return v4;
}

- (id)_undoManagerFlattenedGroupingInfo
{
  return 0;
}

- (BOOL)undoManagerOperationsUndoRedoAvailable
{
  return -[UIUndoGestureInteraction canUndo](self, "canUndo") || -[UIUndoGestureInteraction canRedo](self, "canRedo");
}

- (BOOL)undoManagerOperationsCutCopyPasteAvailable
{
  return -[UIUndoGestureInteraction canCut](self, "canCut")
      || -[UIUndoGestureInteraction canCopy](self, "canCopy")
      || -[UIUndoGestureInteraction canPaste](self, "canPaste");
}

- (BOOL)textEditingOperationsAvailableWithGestureRecognizer:(id)a3
{
  id v4;
  id v5;
  UIUndoGestureInteraction *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  BOOL v13;

  v4 = a3;
  if (!-[UIUndoGestureInteraction editingInteractionOptionsAllowGestureRecognizerToBegin:](self, "editingInteractionOptionsAllowGestureRecognizerToBegin:", v4))goto LABEL_9;
  -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = self;
  if (v5 == v4)
    goto LABEL_13;
  -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    if (-[UIUndoGestureInteraction interactiveHUDIsVisible](self, "interactiveHUDIsVisible"))
    {
LABEL_9:
      v12 = 0;
      goto LABEL_16;
    }
    v6 = self;
LABEL_13:
    if (-[UIUndoGestureInteraction undoManagerOperationsUndoRedoAvailable](v6, "undoManagerOperationsUndoRedoAvailable"))
    {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
  -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v4)
  {

    goto LABEL_11;
  }
  v9 = (void *)v8;
  -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v4)
  {
LABEL_11:
    v13 = -[UIUndoGestureInteraction undoManagerOperationsUndoRedoAvailable](self, "undoManagerOperationsUndoRedoAvailable");
LABEL_15:
    v12 = v13;
    goto LABEL_16;
  }
  -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
LABEL_14:
    v13 = -[UIUndoGestureInteraction undoManagerOperationsCutCopyPasteAvailable](self, "undoManagerOperationsCutCopyPasteAvailable");
    goto LABEL_15;
  }
LABEL_7:
  v12 = 1;
LABEL_16:

  return v12;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  BOOL v11;

  v4 = a3;
  +[UIWindowScene _keyWindowScene]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_visibleWindows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIUndoGestureInteraction view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count") && objc_msgSend(v6, "containsObject:", v8))
  {
    -[UIUndoGestureInteraction observerGesture](self, "observerGesture");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 == v4)
      v10 = -[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible");
    else
      v10 = -[UIUndoGestureInteraction textEditingOperationsAvailableWithGestureRecognizer:](self, "textEditingOperationsAvailableWithGestureRecognizer:", v4);
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)iWorkFamily
{
  if (_MergedGlobals_1160 != -1)
    dispatch_once(&_MergedGlobals_1160, &__block_literal_global_392);
  return (id)qword_1ECD7F318;
}

void __39__UIUndoGestureInteraction_iWorkFamily__block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ECD7F318;
  qword_1ECD7F318 = (uint64_t)&unk_1E1A944D8;

}

- (BOOL)bundleIniWorkFamily:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "iWorkFamily", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqualToString:", v3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  int v15;
  char isKindOfClass;
  char v17;
  void *v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
  v8 = objc_claimAutoreleasedReturnValue();
  if ((id)v8 == v6)
  {

    goto LABEL_7;
  }
  v9 = (void *)v8;
  -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v6)
  {
LABEL_7:
    v15 = objc_msgSend(v7, "_isGestureType:", 0);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v15)
    {
      v17 = isKindOfClass;
      _UIMainBundleIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[UIUndoGestureInteraction bundleIniWorkFamily:](self, "bundleIniWorkFamily:", v18);

      v20 = objc_msgSend(v7, "numberOfTouchesRequired");
      -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "numberOfTouchesRequired");

      if ((v17 & 1) == 0)
      {
        v14 = (v20 == v22) & ~v19;
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
  -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v6 || !objc_msgSend(v7, "_isGestureType:", 8))
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v12 = objc_msgSend(v7, "minimumNumberOfTouches");
  -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 == objc_msgSend(v13, "minimumNumberOfTouches");

LABEL_10:
  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  BOOL v16;
  int v17;
  int v18;
  id v19;

  v9 = a3;
  v10 = a4;
  -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v9)
  {
    -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v10)
    {
      v16 = 1;
      v4 = v10;
LABEL_21:

      goto LABEL_22;
    }
  }
  -[UIUndoGestureInteraction threeFingerSlide](self, "threeFingerSlide");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v9)
  {
    v17 = 0;
    v18 = 0;
  }
  else
  {
    -[UIUndoGestureInteraction threeFingerSingleTap](self, "threeFingerSingleTap");
    v13 = objc_claimAutoreleasedReturnValue();
    if ((id)v13 == v9)
    {
      v17 = 0;
      v18 = 0;
      v5 = v9;
    }
    else
    {
      v5 = (void *)v13;
      -[UIUndoGestureInteraction threeFingerDoubleTap](self, "threeFingerDoubleTap");
      v14 = objc_claimAutoreleasedReturnValue();
      if ((id)v14 == v9)
      {
        v18 = 0;
        v17 = 1;
        v6 = v9;
      }
      else
      {
        v6 = (void *)v14;
        -[UIUndoGestureInteraction threeFingerLongPress](self, "threeFingerLongPress");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 != v9)
        {

          v16 = 0;
          goto LABEL_18;
        }
        v17 = 1;
        v18 = 1;
      }
    }
  }
  -[UIUndoGestureInteraction threeFingerPinch](self, "threeFingerPinch");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v19 == v10;

  if (v18)
  {

    if ((v17 & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v17)
LABEL_14:

LABEL_15:
  if (v12 != v9)

LABEL_18:
  if (v11 == v9)
    goto LABEL_21;
LABEL_22:

  return v16;
}

- (void)touchMultiPansTimer
{
  void *v3;
  UIDelayedAction *v4;

  -[UIUndoGestureInteraction multiPansTimer](self, "multiPansTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIUndoGestureInteraction multiPansTimer](self, "multiPansTimer");
    v4 = (UIDelayedAction *)objc_claimAutoreleasedReturnValue();
    -[UIDelayedAction touch](v4, "touch");
  }
  else
  {
    v4 = -[UIDelayedAction initWithTarget:action:userInfo:delay:]([UIDelayedAction alloc], "initWithTarget:action:userInfo:delay:", self, sel_multiPansTimerElaspsed_, 0, 0.5);
    -[UIUndoGestureInteraction setMultiPansTimer:](self, "setMultiPansTimer:");
  }

}

- (void)clearMultiPansTimer
{
  void *v3;

  -[UIUndoGestureInteraction setPreviousRecognizedPanDirection:](self, "setPreviousRecognizedPanDirection:", 0);
  -[UIUndoGestureInteraction setPanDownStateChangedCounter:](self, "setPanDownStateChangedCounter:", 0);
  -[UIUndoGestureInteraction multiPansTimer](self, "multiPansTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[UIUndoGestureInteraction setMultiPansTimer:](self, "setMultiPansTimer:", 0);
}

- (void)multiPansTimerElaspsed:(id)a3
{
  -[UIUndoGestureInteraction setPreviousRecognizedPanDirection:](self, "setPreviousRecognizedPanDirection:", 0);
  -[UIUndoGestureInteraction setPanDownStateChangedCounter:](self, "setPanDownStateChangedCounter:", 0);
}

- (void)observerGestureHandler:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  _QWORD block[5];

  v4 = a3;
  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v10, "pointInside:withEvent:", 0, v7, v9);

  if ((v5 & 1) == 0 && -[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    -[UIUndoGestureInteraction setUndoInteractiveHUDVisibility:](self, "setUndoInteractiveHUDVisibility:", 0);
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logBlock:domain:", &__block_literal_global_53_2, CFSTR("com.apple.keyboard.UIKit"));

  }
  v12 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__UIUndoGestureInteraction_observerGestureHandler___block_invoke_2;
  block[3] = &unk_1E16B1B28;
  block[4] = self;
  dispatch_after(v12, MEMORY[0x1E0C80D38], block);
}

id __51__UIUndoGestureInteraction_observerGestureHandler___block_invoke()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("KeyboardEventType");
  v1[1] = CFSTR("Operation");
  v2[0] = CFSTR("TextEditing");
  v2[1] = CFSTR("Hide editing HUD");
  v1[2] = CFSTR("TriggerType");
  v2[2] = CFSTR("Tap to dismiss");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __51__UIUndoGestureInteraction_observerGestureHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearMultiPinchTimer");
}

- (void)deactiveActiveKeysIfNeeded:(id)a3
{
  id v3;

  if (objc_msgSend(a3, "state") >= 3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deactiveActiveKeys");

  }
}

- (void)threeFingerSingleTap:(id)a3
{
  -[UIUndoGestureInteraction deactiveActiveKeysIfNeeded:](self, "deactiveActiveKeysIfNeeded:", a3);
  -[UIUndoGestureInteraction _threeFingerSingleTapAction](self, "_threeFingerSingleTapAction");
}

- (void)_threeFingerSingleTapAction
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BOOL v14;

  -[UIUndoGestureInteraction currentTime](self, "currentTime");
  v4 = v3;
  -[UIUndoGestureInteraction lastTapTimestamp](self, "lastTapTimestamp");
  v6 = v4 - v5;
  if (v6 < 1.2
    && -[UIUndoGestureInteraction currentStateHUDVisible](self, "currentStateHUDVisible")
    && (-[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "controlType"),
        v7,
        v8 == 1))
  {
    -[UIUndoGestureInteraction threeFingerDoubleTapUndoAction](self, "threeFingerDoubleTapUndoAction");
    +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Undo"), CFSTR("UndoHUDGestureDoubleTapShortHand"));
  }
  else
  {
    if (!-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible")
      && (!-[UIUndoGestureInteraction currentStateHUDVisible](self, "currentStateHUDVisible")
       || -[UIUndoGestureInteraction currentStateHUDVisible](self, "currentStateHUDVisible")
       && ((-[UIUndoGestureInteraction undoStateHUD](self, "undoStateHUD"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "controlType"),
            v12,
            v6 >= 1.2)
         ? (v14 = v13 == 1)
         : (v14 = 0),
           v14)))
    {
      -[UIUndoGestureInteraction setUndoInteractiveHUDVisibility:](self, "setUndoInteractiveHUDVisibility:", 1);
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = &__block_literal_global_56_2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = &__block_literal_global_57_1;
    }
    objc_msgSend(v9, "logBlock:domain:", v11, CFSTR("com.apple.keyboard.UIKit"));

  }
  -[UIUndoGestureInteraction currentTime](self, "currentTime");
  -[UIUndoGestureInteraction setLastTapTimestamp:](self, "setLastTapTimestamp:");
}

id __55__UIUndoGestureInteraction__threeFingerSingleTapAction__block_invoke()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("KeyboardEventType");
  v1[1] = CFSTR("Operation");
  v2[0] = CFSTR("TextEditing");
  v2[1] = CFSTR("Show editing HUD");
  v1[2] = CFSTR("TriggerType");
  v2[2] = CFSTR("Three finger tap gesture");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __55__UIUndoGestureInteraction__threeFingerSingleTapAction__block_invoke_2()
{
  _QWORD v1[3];
  _QWORD v2[4];

  v2[3] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("KeyboardEventType");
  v1[1] = CFSTR("Operation");
  v2[0] = CFSTR("TextEditing");
  v2[1] = CFSTR("Editing HUD already shown");
  v1[2] = CFSTR("TriggerType");
  v2[2] = CFSTR("Three finger tap gesture");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)threeFingerDoubleTapUndoAction
{
  -[UIUndoGestureInteraction setUndoStateHUDVisibility:withType:available:](self, "setUndoStateHUDVisibility:withType:available:", 1, 1, -[UIUndoGestureInteraction canUndo](self, "canUndo"));
  -[UIUndoGestureInteraction undo:](self, "undo:", 0);
  -[UIUndoGestureInteraction currentTime](self, "currentTime");
  -[UIUndoGestureInteraction setLastTapTimestamp:](self, "setLastTapTimestamp:");
}

- (void)threeFingerDoubleTap:(id)a3
{
  -[UIUndoGestureInteraction deactiveActiveKeysIfNeeded:](self, "deactiveActiveKeysIfNeeded:", a3);
  -[UIUndoGestureInteraction threeFingerDoubleTapUndoAction](self, "threeFingerDoubleTapUndoAction");
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", CFSTR("Undo"), CFSTR("UndoHUDGestureDoubleTap"));
}

- (void)threeFingerSlide:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  -[UIUndoGestureInteraction deactiveActiveKeysIfNeeded:](self, "deactiveActiveKeysIfNeeded:", v7);
  if (objc_msgSend(v7, "state") == 1)
    -[UIUndoGestureInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
  v4 = objc_msgSend(v7, "state");
  if ((unint64_t)(v4 - 3) < 2)
  {
    -[UIUndoGestureInteraction _endPan:](self, "_endPan:", v7);
  }
  else if (v4 == 2)
  {
    -[UIUndoGestureInteraction _updateUndoPan:](self, "_updateUndoPan:", v7);
  }
  else
  {
    v5 = v4 == 1;
    v6 = v7;
    if (!v5)
      goto LABEL_11;
    -[UIUndoGestureInteraction _startUndoPan:](self, "_startUndoPan:", v7);
  }
  v6 = v7;
LABEL_11:

}

- (void)threeFingerLongPress:(id)a3
{
  -[UIUndoGestureInteraction deactiveActiveKeysIfNeeded:](self, "deactiveActiveKeysIfNeeded:", a3);
  if (!-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
    -[UIUndoGestureInteraction setUndoInteractiveHUDVisibility:](self, "setUndoInteractiveHUDVisibility:", 1);
}

- (void)clearMultiPinchTimer
{
  if (-[UIUndoGestureInteraction multiPinchTimerOn](self, "multiPinchTimerOn"))
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_tooSlow_, 0);
  -[UIUndoGestureInteraction setMultiPinchTimerOn:](self, "setMultiPinchTimerOn:", 0);
}

- (void)startMultiPinchTimer:(double)a3
{
  -[UIUndoGestureInteraction clearMultiPinchTimer](self, "clearMultiPinchTimer");
  -[UIUndoGestureInteraction setMultiPinchTimerOn:](self, "setMultiPinchTimerOn:", 1);
  -[UIUndoGestureInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_tooSlow_, 0, a3);
}

- (void)threeFingerPinch:(id)a3
{
  id v4;

  v4 = a3;
  -[UIUndoGestureInteraction deactiveActiveKeysIfNeeded:](self, "deactiveActiveKeysIfNeeded:", v4);
  if (objc_msgSend(v4, "state") == 1)
    -[UIUndoGestureInteraction disableEnclosingScrollViewScrolling](self, "disableEnclosingScrollViewScrolling");
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[UIUndoGestureInteraction _startPinch:](self, "_startPinch:", v4);
      break;
    case 2:
      -[UIUndoGestureInteraction _updatePinch:](self, "_updatePinch:", v4);
      break;
    case 3:
      -[UIUndoGestureInteraction _endPinch:](self, "_endPinch:", v4);
      break;
    case 4:
    case 5:
      -[UIUndoGestureInteraction _cancelPinch:](self, "_cancelPinch:", v4);
      break;
    default:
      break;
  }

}

- (id)interactiveHUDButtonForDirection:(int64_t)a3
{
  void *v3;
  BOOL v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  v3 = 0;
  switch(a3)
  {
    case 2:
      v5 = -[UIUndoGestureInteraction isRTLMode](self, "isRTLMode");
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_5;
      goto LABEL_3;
    case 3:
      v8 = -[UIUndoGestureInteraction isRTLMode](self, "isRTLMode");
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
LABEL_5:
        objc_msgSend(v6, "leftButtonView");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
LABEL_3:
        objc_msgSend(v6, "rightButtonView");
        v7 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_9;
    case 8:
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aCopyButtonView");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 9:
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aCutButtonView");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 10:
      -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aPasteButtonView");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v3 = (void *)v7;

      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_startPinch:(id)a3
{
  objc_msgSend(a3, "avgTouchesToCentroidDistance");
  -[UIUndoGestureInteraction setInitPinchableDistance:](self, "setInitPinchableDistance:");
}

- (void)_updatePinch:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[6];

  v4 = a3;
  if (-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    -[UIUndoGestureInteraction setPotentialPinchDirection:](self, "setPotentialPinchDirection:", objc_msgSend(v4, "pinchDirection"));
    objc_msgSend(v4, "avgTouchesToCentroidDistance");
    v6 = v5;
    if (-[UIUndoGestureInteraction multiPinchTimerOn](self, "multiPinchTimerOn"))
    {
      v7 = 9;
    }
    else
    {
      -[UIUndoGestureInteraction initPinchableDistance](self, "initPinchableDistance");
      if (v6 <= v8)
        v7 = 8;
      else
        v7 = 10;
    }
    -[UIUndoGestureInteraction setPotentialPinchDirection:](self, "setPotentialPinchDirection:", v7);
    if (-[UIUndoGestureInteraction potentialPinchDirection](self, "potentialPinchDirection"))
    {
      if (!-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible")
        || (-[UIUndoGestureInteraction interactiveHUDButtonForDirection:](self, "interactiveHUDButtonForDirection:", -[UIUndoGestureInteraction potentialPinchDirection](self, "potentialPinchDirection")), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "state"), v9, v10 != 2))
      {
        -[UIUndoGestureInteraction initPinchableDistance](self, "initPinchableDistance");
        v12 = vabdd_f64(v6, v11);
        -[UIUndoGestureInteraction initPinchableDistance](self, "initPinchableDistance");
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __41__UIUndoGestureInteraction__updatePinch___block_invoke;
        v14[3] = &unk_1E16B1888;
        v14[4] = self;
        v14[5] = fmin(v12 / (v13 * 0.1), 1.0);
        +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v14, 0.2);
      }
    }
  }

}

void __41__UIUndoGestureInteraction__updatePinch___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateControlWithDirection:travelProgress:isRTL:", objc_msgSend(*(id *)(a1 + 32), "potentialPinchDirection"), objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), *(double *)(a1 + 40));

}

- (void)_endPinch:(id)a3
{
  -[UIUndoGestureInteraction _endPinchWithDirection:](self, "_endPinchWithDirection:", objc_msgSend(a3, "pinchDirection"));
}

- (void)_endPinchWithDirection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  UIUndoGestureInteraction *v8;
  int64_t v9;

  if (-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    -[UIUndoGestureInteraction interactiveHUDButtonForDirection:](self, "interactiveHUDButtonForDirection:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "state");

    if (v6 == 2)
      goto LABEL_9;
  }
  if (a3 != 8)
  {
    -[UIUndoGestureInteraction clearMultiPinchTimer](self, "clearMultiPinchTimer");
    if (a3)
    {
      v7 = -[UIUndoGestureInteraction performActionWithDirection:](self, "performActionWithDirection:", a3);
      v8 = self;
      v9 = a3;
      goto LABEL_8;
    }
LABEL_9:
    -[UIUndoGestureInteraction fullyCloseCoverWithComplete:](self, "fullyCloseCoverWithComplete:", 0);
    return;
  }
  -[UIUndoGestureInteraction setUndoStateHUDVisibility:withType:available:](self, "setUndoStateHUDVisibility:withType:available:", 1, -[UIUndoGestureInteraction undoControlTypeWithDirection:](self, "undoControlTypeWithDirection:", 8), -[UIUndoGestureInteraction performActionWithDirection:](self, "performActionWithDirection:", 8));
  if (-[UIUndoGestureInteraction multiPinchTimerOn](self, "multiPinchTimerOn"))
  {
    -[UIUndoGestureInteraction clearMultiPinchTimer](self, "clearMultiPinchTimer");
    a3 = 9;
    v7 = -[UIUndoGestureInteraction performActionWithDirection:](self, "performActionWithDirection:", 9);
    v8 = self;
    v9 = 9;
LABEL_8:
    -[UIUndoGestureInteraction setUndoStateHUDVisibility:withType:available:](self, "setUndoStateHUDVisibility:withType:available:", 1, -[UIUndoGestureInteraction undoControlTypeWithDirection:](v8, "undoControlTypeWithDirection:", v9), v7);
    goto LABEL_11;
  }
  -[UIUndoGestureInteraction startMultiPinchTimer:](self, "startMultiPinchTimer:", 2.0);
  a3 = 8;
LABEL_11:
  -[UIUndoGestureInteraction fullyOpenAndCloseCoverWithBeginDirection:](self, "fullyOpenAndCloseCoverWithBeginDirection:", a3);
  if (!-[UIUndoGestureInteraction multiPinchTimerOn](self, "multiPinchTimerOn"))
  {
    -[UIUndoGestureInteraction setInitPinchableDistance:](self, "setInitPinchableDistance:", 0.0);
    -[UIUndoGestureInteraction setPotentialPinchDirection:](self, "setPotentialPinchDirection:", 0);
  }
}

- (void)_cancelPinch:(id)a3
{
  _QWORD v4[5];
  _QWORD v5[5];

  -[UIUndoGestureInteraction fullyCloseCoverWithComplete:](self, "fullyCloseCoverWithComplete:", 0);
  if (!-[UIUndoGestureInteraction multiPinchTimerOn](self, "multiPinchTimerOn"))
  {
    -[UIUndoGestureInteraction setInitPinchableDistance:](self, "setInitPinchableDistance:", 0.0);
    -[UIUndoGestureInteraction setPotentialPinchDirection:](self, "setPotentialPinchDirection:", 0);
    if (-[UIUndoGestureInteraction undoStateHUDIsAnimating](self, "undoStateHUDIsAnimating"))
    {
      v4[4] = self;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __41__UIUndoGestureInteraction__cancelPinch___block_invoke;
      v5[3] = &unk_1E16B1B28;
      v5[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __41__UIUndoGestureInteraction__cancelPinch___block_invoke_2;
      v4[3] = &unk_1E16B3FD8;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v5, v4, 0.2);
    }
  }
}

void __41__UIUndoGestureInteraction__cancelPinch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setConstant:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoStateHUDWidthConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "undoStateHUD");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoStateHUDHeightConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

uint64_t __41__UIUndoGestureInteraction__cancelPinch___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUndoStateHUDIsAnimating:", 0);
}

- (int64_t)slideDirectionWithGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;

  v4 = a3;
  -[UIUndoGestureInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "translationInView:", v5);
  v7 = v6;

  v8 = fabs(v7);
  v9 = 2;
  if (v7 > 0.0)
    v9 = 3;
  if (v8 >= 5.0)
    return v9;
  else
    return 0;
}

- (BOOL)undoGestureIsMoving:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a3, "_allActiveTouches", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "phase") == 2)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (id)scrollViewForInputDelegate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegateAsResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_scroller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v3, "conformsToProtocol:", &unk_1EDE22B80)
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v3, "textInputView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_scroller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

LABEL_10:
  return v5;
}

- (void)disableEnclosingScrollViewScrolling
{
  void *v2;
  void *v3;
  id v4;

  -[UIUndoGestureInteraction scrollViewForInputDelegate](self, "scrollViewForInputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "panGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEnabled"))
    {
      objc_msgSend(v3, "setEnabled:", 0);
      objc_msgSend(v3, "setEnabled:", 1);
    }

    v2 = v4;
  }

}

- (void)_startUndoPan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[UIUndoGestureInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UIUndoGestureInteraction setPreviousPanLocation:](self, "setPreviousPanLocation:", v7, v9);
  -[UIUndoGestureInteraction setBeginPanDirection:](self, "setBeginPanDirection:", 0);
  -[UIUndoGestureInteraction setPanDownStateChangedCounter:](self, "setPanDownStateChangedCounter:", -[UIUndoGestureInteraction panDownStateChangedCounter](self, "panDownStateChangedCounter") + 1);
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__UIUndoGestureInteraction__startUndoPan___block_invoke;
  v12[3] = &unk_1E16B4878;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "logBlock:domain:", v12, CFSTR("com.apple.keyboard.UIKit"));

}

id __42__UIUndoGestureInteraction__startUndoPan___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("TextEditing");
  v4[0] = CFSTR("KeyboardEventType");
  v4[1] = CFSTR("Operation");
  UIKBAnalyticsUndoPanForState(objc_msgSend(*(id *)(a1 + 32), "state"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2] = CFSTR("TriggerType");
  v5[1] = v1;
  v5[2] = CFSTR("Three finger pan gesture");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_updateUndoPan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[6];

  v4 = a3;
  if (-[UIUndoGestureInteraction undoGestureIsMoving:](self, "undoGestureIsMoving:", v4))
  {
    -[UIUndoGestureInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    v10 = -[UIUndoGestureInteraction slideDirectionWithGesture:](self, "slideDirectionWithGesture:", v4);
    if (v10)
    {
      v11 = v10;
      if (!-[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection"))
      {
        if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          -[UIUndoGestureInteraction setRemainingDistanceToTravel:](self, "setRemainingDistanceToTravel:", 100.0);
          -[UIUndoGestureInteraction setPreviousPanLocation:](self, "setPreviousPanLocation:", v7, v9);
        }
        -[UIUndoGestureInteraction setBeginPanDirection:](self, "setBeginPanDirection:", v11);
      }
      if (-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
      {
        -[UIUndoGestureInteraction interactiveHUDButtonForDirection:](self, "interactiveHUDButtonForDirection:", -[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "state");

        if (v13 != 2)
        {
          if (-[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") == 2)
          {
            -[UIUndoGestureInteraction previousPanLocation](self, "previousPanLocation");
            v15 = vabdd_f64(v7, v14);
            if (v11 != 3)
            {
              if (v11 != 2)
                goto LABEL_23;
              goto LABEL_16;
            }
LABEL_19:
            -[UIUndoGestureInteraction remainingDistanceToTravel](self, "remainingDistanceToTravel");
            v18 = 100.0;
            if (v15 + v21 <= 100.0)
            {
              -[UIUndoGestureInteraction remainingDistanceToTravel](self, "remainingDistanceToTravel");
              v18 = v15 + v22;
            }
            goto LABEL_21;
          }
          if (-[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") != 3)
          {
            v18 = 0.0;
            v20 = 1.0;
LABEL_22:
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __43__UIUndoGestureInteraction__updateUndoPan___block_invoke;
            v24[3] = &unk_1E16B1888;
            v24[4] = self;
            *(double *)&v24[5] = v20;
            +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v24, 0.2);
            -[UIUndoGestureInteraction setRemainingDistanceToTravel:](self, "setRemainingDistanceToTravel:", v18);
            -[UIUndoGestureInteraction setPreviousPanLocation:](self, "setPreviousPanLocation:", v7, v9);
            -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "layoutIfNeeded");

            goto LABEL_23;
          }
          -[UIUndoGestureInteraction previousPanLocation](self, "previousPanLocation");
          v15 = vabdd_f64(v7, v16);
          if (v11 == 2)
            goto LABEL_19;
          if (v11 == 3)
          {
LABEL_16:
            -[UIUndoGestureInteraction remainingDistanceToTravel](self, "remainingDistanceToTravel");
            v18 = 0.0;
            if (v17 - v15 >= 0.0)
            {
              -[UIUndoGestureInteraction remainingDistanceToTravel](self, "remainingDistanceToTravel");
              v18 = v19 - v15;
            }
LABEL_21:
            v20 = v18 / 100.0;
            goto LABEL_22;
          }
        }
      }
    }
  }
LABEL_23:

}

void __43__UIUndoGestureInteraction__updateUndoPan___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateControlWithDirection:travelProgress:isRTL:", objc_msgSend(*(id *)(a1 + 32), "beginPanDirection"), objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 1.0 - *(double *)(a1 + 40));

}

- (void)_endPan:(id)a3
{
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "state") == 3)
    -[UIUndoGestureInteraction clearMultiPinchTimer](self, "clearMultiPinchTimer");
  if (-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    v4 = 0.8;
    if (-[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") == 2
      || -[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") == 3)
    {
      v5 = 0x4059000000000000;
    }
    else
    {
      if (-[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") != 4
        && -[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") != 5
        && -[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") != 6)
      {
        v6 = 0.0;
        v4 = 0.0;
        if (-[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection") != 7)
          goto LABEL_15;
      }
      v4 = 0.95;
      v5 = 0x4049000000000000;
    }
    v6 = *(double *)&v5;
LABEL_15:
    -[UIUndoGestureInteraction remainingDistanceToTravel](self, "remainingDistanceToTravel");
    v8 = v7 / v6;
    v9 = -[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection");
    -[UIUndoGestureInteraction remainingDistanceToTravel](self, "remainingDistanceToTravel");
    -[UIUndoGestureInteraction animateSpringCoverWithSuccess:direction:remainingDistanceToTravel:](self, "animateSpringCoverWithSuccess:direction:remainingDistanceToTravel:", v8 < v4, v9);
    goto LABEL_16;
  }
  if (objc_msgSend(v10, "state") == 3)
    -[UIUndoGestureInteraction _endPanWithDirection:](self, "_endPanWithDirection:", -[UIUndoGestureInteraction beginPanDirection](self, "beginPanDirection"));
LABEL_16:

}

- (BOOL)_endPanWithDirection:(int64_t)a3
{
  _BOOL8 v5;
  int64_t v6;
  void *v7;
  _QWORD v9[5];

  if (!a3)
    return 0;
  v5 = -[UIUndoGestureInteraction performActionWithDirection:](self, "performActionWithDirection:");
  v6 = -[UIUndoGestureInteraction undoControlTypeWithDirection:](self, "undoControlTypeWithDirection:", a3);
  -[UIUndoGestureInteraction setUndoStateHUDVisibility:withType:available:](self, "setUndoStateHUDVisibility:withType:available:", 1, v6, v5);
  if (!v5)
    return 0;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__UIUndoGestureInteraction__endPanWithDirection___block_invoke;
  v9[3] = &__block_descriptor_40_e5__8__0l;
  v9[4] = v6;
  objc_msgSend(v7, "logBlock:domain:", v9, CFSTR("com.apple.keyboard.UIKit"));

  return 1;
}

id __49__UIUndoGestureInteraction__endPanWithDirection___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("TextEditing");
  v5[0] = CFSTR("KeyboardEventType");
  v5[1] = CFSTR("Operation");
  UIKBAnalyticsOperationForControlType(*(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v6[2] = CFSTR("Three finger pan gesture");
  v5[2] = CFSTR("TriggerType");
  v5[3] = CFSTR("GestureState");
  _UIGestureRecognizerStateString(3uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)undoControlTypeWithDirection:(int64_t)a3
{
  int64_t result;

  result = 4;
  switch(a3)
  {
    case 2:
      if (-[UIUndoGestureInteraction isRTLMode](self, "isRTLMode"))
        result = 2;
      else
        result = 1;
      break;
    case 3:
      if (-[UIUndoGestureInteraction isRTLMode](self, "isRTLMode"))
        result = 1;
      else
        result = 2;
      break;
    case 8:
      return result;
    case 9:
      result = 3;
      break;
    case 10:
      result = 5;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)performActionWithDirection:(int64_t)a3
{
  BOOL v3;
  __CFString **v5;

  v3 = 0;
  switch(a3)
  {
    case 2:
      if (!-[UIUndoGestureInteraction isRTLMode](self, "isRTLMode"))
        goto LABEL_5;
      goto LABEL_3;
    case 3:
      if (-[UIUndoGestureInteraction isRTLMode](self, "isRTLMode"))
      {
LABEL_5:
        v3 = -[UIUndoGestureInteraction canUndo](self, "canUndo");
        -[UIUndoGestureInteraction undo:](self, "undo:", 0);
        v5 = UIKBAnalyticsTextEditingOperationUndo;
      }
      else
      {
LABEL_3:
        v3 = -[UIUndoGestureInteraction canRedo](self, "canRedo");
        -[UIUndoGestureInteraction redo:](self, "redo:", 0);
        v5 = UIKBAnalyticsTextEditingOperationRedo;
      }
      goto LABEL_9;
    case 8:
      v3 = -[UIUndoGestureInteraction canCopy](self, "canCopy");
      -[UIUndoGestureInteraction copyOperation](self, "copyOperation");
      v5 = UIKBAnalyticsTextEditingOperationCopy;
      goto LABEL_9;
    case 9:
      v3 = -[UIUndoGestureInteraction canCut](self, "canCut");
      -[UIUndoGestureInteraction cutOperation](self, "cutOperation");
      v5 = UIKBAnalyticsTextEditingOperationCut;
      goto LABEL_9;
    case 10:
      v3 = -[UIUndoGestureInteraction canPaste](self, "canPaste");
      -[UIUndoGestureInteraction pasteOperation](self, "pasteOperation");
      v5 = UIKBAnalyticsTextEditingOperationPaste;
LABEL_9:
      +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:trigger:](UIKBAnalyticsDispatcher, "analyticsDispatchEventTextEditingOperation:trigger:", *v5, CFSTR("UndoHUDGesturePan"));
      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)performGestureWithDirection:(int64_t)a3
{
  return -[UIUndoGestureInteraction performGestureWithDirection:authenticationMessage:](self, "performGestureWithDirection:authenticationMessage:", a3, 0);
}

- (BOOL)performGestureWithDirection:(int64_t)a3 authenticationMessage:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  if (a3 != 1)
  {
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (-[UIUndoGestureInteraction undoManagerOperationsUndoRedoAvailable](self, "undoManagerOperationsUndoRedoAvailable"))
      {
        v7 = -[UIUndoGestureInteraction _endPanWithDirection:](self, "_endPanWithDirection:", a3);
        goto LABEL_16;
      }
    }
    else if ((a3 | 2) == 0xA
           && -[UIUndoGestureInteraction undoManagerOperationsCutCopyPasteAvailable](self, "undoManagerOperationsCutCopyPasteAvailable"))
    {
      if (a3 == 10 && v6)
        +[UIPasteboard _attemptAuthenticationWithMessage:](UIPasteboard, "_attemptAuthenticationWithMessage:", v6);
      -[UIUndoGestureInteraction _endPinchWithDirection:](self, "_endPinchWithDirection:", a3);
      goto LABEL_5;
    }
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  if (!-[UIUndoGestureInteraction undoManagerOperationsUndoRedoAvailable](self, "undoManagerOperationsUndoRedoAvailable")&& !-[UIUndoGestureInteraction undoManagerOperationsCutCopyPasteAvailable](self, "undoManagerOperationsCutCopyPasteAvailable"))
  {
    goto LABEL_15;
  }
  -[UIUndoGestureInteraction _threeFingerSingleTapAction](self, "_threeFingerSingleTapAction");
LABEL_5:
  v7 = 1;
LABEL_16:

  return v7;
}

- (void)fullyOpenAndCloseCoverWithBeginDirection:(int64_t)a3
{
  _QWORD v3[5];
  _QWORD v4[6];

  v3[4] = self;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke;
  v4[3] = &unk_1E16B1888;
  v4[4] = self;
  v4[5] = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke_2;
  v3[3] = &unk_1E16B3FD8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v4, v3, 0.1, 0.0);
}

void __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  void *v5;
  id v6;

  v3 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) == 10)
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(v2, "undoInteractiveHUD");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateControlWithDirection:travelProgress:isRTL:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), v4);

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

uint64_t __69__UIUndoGestureInteraction_fullyOpenAndCloseCoverWithBeginDirection___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fullyCloseCoverWithComplete:", 0);
}

- (void)fullyCloseCoverWithComplete:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__UIUndoGestureInteraction_fullyCloseCoverWithComplete___block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v3, a3, 0.1, 0.0);
}

void __56__UIUndoGestureInteraction_fullyCloseCoverWithComplete___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateControlWithDirection:travelProgress:isRTL:", 2, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateControlWithDirection:travelProgress:isRTL:", 3, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateControlWithDirection:travelProgress:isRTL:", 8, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateControlWithDirection:travelProgress:isRTL:", 9, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 0.0);

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateControlWithDirection:travelProgress:isRTL:", 10, objc_msgSend(*(id *)(a1 + 32), "isRTLMode"), 1.0);

  objc_msgSend(*(id *)(a1 + 32), "undoInteractiveHUD");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (void)animateSpringCoverWithSuccess:(BOOL)a3 direction:(int64_t)a4 remainingDistanceToTravel:(double)a5
{
  if (a3
    && (-[UIUndoGestureInteraction performActionWithDirection:](self, "performActionWithDirection:", a4), a5 > 0.0))
  {
    -[UIUndoGestureInteraction fullyOpenAndCloseCoverWithBeginDirection:](self, "fullyOpenAndCloseCoverWithBeginDirection:", a4);
  }
  else
  {
    -[UIUndoGestureInteraction fullyCloseCoverWithComplete:](self, "fullyCloseCoverWithComplete:", 0, a4, a5);
  }
}

- (BOOL)canUndo
{
  void *v2;
  char v3;

  -[UIUndoGestureInteraction _undoManager](self, "_undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canUndo");

  return v3;
}

- (BOOL)canRedo
{
  void *v2;
  char v3;

  -[UIUndoGestureInteraction _undoManager](self, "_undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canRedo");

  return v3;
}

- (void)_updateHUDControlState
{
  void *v3;
  id v4;

  if (-[UIUndoGestureInteraction currentInteractiveHUDVisible](self, "currentInteractiveHUDVisible"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditingTraitsMarkedDirty:", 1);

    -[UIUndoGestureInteraction undoInteractiveHUD](self, "undoInteractiveHUD");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateHUDControlState");

  }
}

- (void)undo:(BOOL)a3
{
  id v3;

  -[UIUndoGestureInteraction _undoManager](self, "_undoManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canUndo"))
    objc_msgSend(v3, "undo");

}

- (void)redo:(BOOL)a3
{
  id v3;

  -[UIUndoGestureInteraction _undoManager](self, "_undoManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canRedo"))
    objc_msgSend(v3, "redo");

}

- (id)responderForOperation:(SEL)a3 withSender:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  -[UIUndoGestureInteraction currentResponder](self, "currentResponder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "canPerformAction:withSender:", a3, v6) & 1) != 0)
    goto LABEL_4;
  objc_msgSend((id)UIApp, "_unswizzledTargetInChainForAction:sender:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

    v7 = v8;
LABEL_4:
    v7 = v7;
    v8 = v7;
  }

  return v8;
}

- (UIKBTextEditingTraits)editingTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  UIKBTextEditingTraits *v8;
  UIKBTextEditingTraits *editingTraits;
  UIKBTextEditingTraits *v10;
  _QWORD v12[5];

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIUndoGestureInteraction currentResponder](self, "currentResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKBTextEditingTraits firstResponder](self->_editingTraits, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _UIMainBundleIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIUndoGestureInteraction bundleIniWorkFamily:](self, "bundleIniWorkFamily:", v6);

  if (v4
    && (!self->_editingTraits
     || v5 != v4
     || !v3
     || (objc_msgSend(v3, "editingTraitsMarkedDirty") | v7) == 1))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__UIUndoGestureInteraction_editingTraits__block_invoke;
    v12[3] = &unk_1E16D7178;
    v12[4] = self;
    +[UIKBTextEditingTraits traitsForEditingInteractionWithFirstResponder:canRespondBlock:keyMaskFlags:](UIKBTextEditingTraits, "traitsForEditingInteractionWithFirstResponder:canRespondBlock:keyMaskFlags:", v4, v12, 2);
    v8 = (UIKBTextEditingTraits *)objc_claimAutoreleasedReturnValue();
    editingTraits = self->_editingTraits;
    self->_editingTraits = v8;

    if (v3 && self->_editingTraits)
      objc_msgSend(v3, "setEditingTraitsMarkedDirty:", 0);
  }
  v10 = self->_editingTraits;

  return v10;
}

BOOL __41__UIUndoGestureInteraction_editingTraits__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "responderForOperation:withSender:", a2, 0x1E174E1C0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canCut
{
  void *v3;
  void *v4;
  char v5;

  -[UIUndoGestureInteraction editingTraits](self, "editingTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIUndoGestureInteraction editingTraits](self, "editingTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canCut");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canCopy
{
  void *v3;
  void *v4;
  char v5;

  -[UIUndoGestureInteraction editingTraits](self, "editingTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIUndoGestureInteraction editingTraits](self, "editingTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canCopy");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canPaste
{
  void *v3;
  void *v4;
  char v5;

  -[UIUndoGestureInteraction editingTraits](self, "editingTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[UIUndoGestureInteraction editingTraits](self, "editingTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canPaste");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)cutOperation
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;

  -[UIUndoGestureInteraction responderForOperation:withSender:](self, "responderForOperation:withSender:", sel_cut_, 0x1E174E1C0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = objc_msgSend(v4, "_dataOwnerForCopy");
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __40__UIUndoGestureInteraction_cutOperation__block_invoke;
    v9 = &unk_1E16B1B28;
    v10 = v4;
    +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v3, &v6);

  }
  -[UIUndoGestureInteraction _updateHUDControlState](self, "_updateHUDControlState", v4, v6, v7, v8, v9);

}

uint64_t __40__UIUndoGestureInteraction_cutOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cut:", *(_QWORD *)(a1 + 32));
}

- (void)copyOperation
{
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;

  -[UIUndoGestureInteraction responderForOperation:withSender:](self, "responderForOperation:withSender:", sel_copy_, 0x1E174E1C0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = objc_msgSend(v4, "_dataOwnerForCopy");
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __41__UIUndoGestureInteraction_copyOperation__block_invoke;
    v9 = &unk_1E16B1B28;
    v10 = v4;
    +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v3, &v6);

  }
  -[UIUndoGestureInteraction _updateHUDControlState](self, "_updateHUDControlState", v4, v6, v7, v8, v9);

}

uint64_t __41__UIUndoGestureInteraction_copyOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "copy:", *(_QWORD *)(a1 + 32));
}

- (void)pasteOperation
{
  id pasteConfirmationAction;
  void (**v4)(_QWORD);
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;

  pasteConfirmationAction = self->_pasteConfirmationAction;
  if (pasteConfirmationAction)
  {
    v4 = (void (**)(_QWORD))_Block_copy(pasteConfirmationAction);
    v5 = self->_pasteConfirmationAction;
    self->_pasteConfirmationAction = 0;

    v4[2](v4);
    -[UIUndoGestureInteraction setPasteConfirmationHUDVisibility:](self, "setPasteConfirmationHUDVisibility:", 0);

  }
  -[UIUndoGestureInteraction responderForOperation:withSender:](self, "responderForOperation:withSender:", sel_paste_, 0x1E174E1C0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6 = objc_msgSend(v7, "_dataOwnerForPaste");
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __42__UIUndoGestureInteraction_pasteOperation__block_invoke;
    v12 = &unk_1E16B1B28;
    v13 = v7;
    +[UIPasteboard _performAsDataOwner:block:](UIPasteboard, "_performAsDataOwner:block:", v6, &v9);

  }
  -[UIUndoGestureInteraction _updateHUDControlState](self, "_updateHUDControlState", v7, v9, v10, v11, v12);

}

uint64_t __42__UIUndoGestureInteraction_pasteOperation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "paste:", *(_QWORD *)(a1 + 32));
}

+ (void)showSecurePasteConfirmationWithCompletionHandler:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)UIApp;
  v4 = a3;
  objc_msgSend(v3, "keyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "editingOverlayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "undoInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPasteConfirmationAction:", v4);
  objc_msgSend(v8, "setPasteConfirmationHUDVisibility:", 1);

}

+ (BOOL)_isKeyWindowSceneSessionRoleValidForTutorial
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("SBSUIWindowSceneSessionRoleSystemNotes")) ^ 1;
  else
    LOBYTE(v6) = 1;

  return v6;
}

+ (void)presentProductivityGestureTutorialIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD block[4];
  void (**v10)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  _UIMainBundleIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferencesActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "oneTimeActionCompleted:", *MEMORY[0x1E0DBE2A0]) & 1) != 0)
  {

  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if ((v8 & 1) == 0 && objc_msgSend(a1, "_isKeyWindowSceneSessionRoleValidForTutorial"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__UIUndoGestureInteraction_presentProductivityGestureTutorialIfNeededWithCompletion___block_invoke;
      block[3] = &unk_1E16B1BF8;
      v10 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      goto LABEL_8;
    }
  }
  if (v4)
    v4[2](v4);
LABEL_8:

}

void __85__UIUndoGestureInteraction_presentProductivityGestureTutorialIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  UIUndoTutorialViewController *v5;

  v5 = -[UIUndoTutorialViewController initWithCompletionHandler:]([UIUndoTutorialViewController alloc], "initWithCompletionHandler:", *(_QWORD *)(a1 + 32));
  -[UIViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 5);
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", v5, (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1, 0);

  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferencesActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didTriggerOneTimeAction:", *MEMORY[0x1E0DBE2A0]);

}

+ (void)presentProductivityGestureTutorialInlineWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void (**v10)(void);

  v10 = (void (**)(void))a3;
  if (!+[UIKeyboard isOnScreen](UIKeyboard, "isOnScreen")
    || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || +[UIKeyboardImpl isFloating](UIKeyboardImpl, "isFloating"))
  {
    objc_msgSend((id)objc_opt_class(), "presentProductivityGestureTutorialIfNeededWithCompletion:", v10);
    goto LABEL_5;
  }
  _UIMainBundleIdentifier();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferencesActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DBE2A0];
  if ((objc_msgSend(v6, "oneTimeActionCompleted:", *MEMORY[0x1E0DBE2A0]) & 1) == 0)
  {
    v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

    if ((v8 & 1) != 0 || !objc_msgSend(a1, "_isKeyWindowSceneSessionRoleValidForTutorial"))
      goto LABEL_11;
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentEditingIntroductionView");

    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferencesActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTriggerOneTimeAction:", v7);
  }

LABEL_11:
  if (v10)
    v10[2]();

LABEL_5:
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (_UIKBProductivitySingleTapGesture)threeFingerSingleTap
{
  return self->_threeFingerSingleTap;
}

- (void)setThreeFingerSingleTap:(id)a3
{
  objc_storeStrong((id *)&self->_threeFingerSingleTap, a3);
}

- (_UIKBProductivityDoubleTapGesture)threeFingerDoubleTap
{
  return self->_threeFingerDoubleTap;
}

- (void)setThreeFingerDoubleTap:(id)a3
{
  objc_storeStrong((id *)&self->_threeFingerDoubleTap, a3);
}

- (_UIKBProductivityPanGestureRecognizer)threeFingerSlide
{
  return self->_threeFingerSlide;
}

- (void)setThreeFingerSlide:(id)a3
{
  objc_storeStrong((id *)&self->_threeFingerSlide, a3);
}

- (_UIKBProductivityLongPressGestureRecognizer)threeFingerLongPress
{
  return self->_threeFingerLongPress;
}

- (void)setThreeFingerLongPress:(id)a3
{
  objc_storeStrong((id *)&self->_threeFingerLongPress, a3);
}

- (_UIKBProductivityPinchGestureRecognizer)threeFingerPinch
{
  return self->_threeFingerPinch;
}

- (void)setThreeFingerPinch:(id)a3
{
  objc_storeStrong((id *)&self->_threeFingerPinch, a3);
}

- (void)setUndoInteractiveHUD:(id)a3
{
  objc_storeStrong((id *)&self->_undoInteractiveHUD, a3);
}

- (int64_t)interactiveHUDMode
{
  return self->_interactiveHUDMode;
}

- (void)setInteractiveHUDMode:(int64_t)a3
{
  self->_interactiveHUDMode = a3;
}

- (id)pasteConfirmationAction
{
  return self->_pasteConfirmationAction;
}

- (void)setPasteConfirmationAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setUndoStateHUD:(id)a3
{
  objc_storeStrong((id *)&self->_undoStateHUD, a3);
}

- (NSLayoutConstraint)undoStateHUDTopConstraint
{
  return self->_undoStateHUDTopConstraint;
}

- (void)setUndoStateHUDTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoStateHUDTopConstraint, a3);
}

- (NSLayoutConstraint)undoStateHUDCenterConstraint
{
  return self->_undoStateHUDCenterConstraint;
}

- (void)setUndoStateHUDCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoStateHUDCenterConstraint, a3);
}

- (NSLayoutConstraint)undoHUDContainerWidthConstraint
{
  return self->_undoHUDContainerWidthConstraint;
}

- (void)setUndoHUDContainerWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoHUDContainerWidthConstraint, a3);
}

- (NSLayoutConstraint)undoHUDContainerHeightConstraint
{
  return self->_undoHUDContainerHeightConstraint;
}

- (void)setUndoHUDContainerHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_undoHUDContainerHeightConstraint, a3);
}

- (UIDelayedAction)undoStateHUDDismissTimer
{
  return self->_undoStateHUDDismissTimer;
}

- (void)setUndoStateHUDDismissTimer:(id)a3
{
  objc_storeStrong((id *)&self->_undoStateHUDDismissTimer, a3);
}

- (int64_t)currentAppearance
{
  return self->_currentAppearance;
}

- (void)setCurrentAppearance:(int64_t)a3
{
  self->_currentAppearance = a3;
}

- (CGRect)currentActuallSceneBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentActuallSceneBounds.origin.x;
  y = self->_currentActuallSceneBounds.origin.y;
  width = self->_currentActuallSceneBounds.size.width;
  height = self->_currentActuallSceneBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentActuallSceneBounds:(CGRect)a3
{
  self->_currentActuallSceneBounds = a3;
}

- (void)setLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGuide, a3);
}

- (BOOL)interactiveHUDIsVisible
{
  return self->_interactiveHUDIsVisible;
}

- (void)setInteractiveHUDIsVisible:(BOOL)a3
{
  self->_interactiveHUDIsVisible = a3;
}

- (int64_t)previousRecognizedPanDirection
{
  return self->_previousRecognizedPanDirection;
}

- (void)setPreviousRecognizedPanDirection:(int64_t)a3
{
  self->_previousRecognizedPanDirection = a3;
}

- (UIDelayedAction)multiPansTimer
{
  return self->_multiPansTimer;
}

- (void)setMultiPansTimer:(id)a3
{
  objc_storeStrong((id *)&self->_multiPansTimer, a3);
}

- (double)remainingDistanceToTravel
{
  return self->_remainingDistanceToTravel;
}

- (void)setRemainingDistanceToTravel:(double)a3
{
  self->_remainingDistanceToTravel = a3;
}

- (CGPoint)previousPanLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_previousPanLocation.x;
  y = self->_previousPanLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPreviousPanLocation:(CGPoint)a3
{
  self->_previousPanLocation = a3;
}

- (CGPoint)beginPanLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_beginPanLocation.x;
  y = self->_beginPanLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBeginPanLocation:(CGPoint)a3
{
  self->_beginPanLocation = a3;
}

- (int64_t)beginPanDirection
{
  return self->_beginPanDirection;
}

- (void)setBeginPanDirection:(int64_t)a3
{
  self->_beginPanDirection = a3;
}

- (unint64_t)panDownStateChangedCounter
{
  return self->_panDownStateChangedCounter;
}

- (void)setPanDownStateChangedCounter:(unint64_t)a3
{
  self->_panDownStateChangedCounter = a3;
}

- (BOOL)undoStateHUDIsAnimating
{
  return self->_undoStateHUDIsAnimating;
}

- (void)setUndoStateHUDIsAnimating:(BOOL)a3
{
  self->_undoStateHUDIsAnimating = a3;
}

- (double)lastTapTimestamp
{
  return self->_lastTapTimestamp;
}

- (void)setLastTapTimestamp:(double)a3
{
  self->_lastTapTimestamp = a3;
}

- (BOOL)multiPinchTimerOn
{
  return self->_multiPinchTimerOn;
}

- (void)setMultiPinchTimerOn:(BOOL)a3
{
  self->_multiPinchTimerOn = a3;
}

- (double)initPinchableDistance
{
  return self->_initPinchableDistance;
}

- (void)setInitPinchableDistance:(double)a3
{
  self->_initPinchableDistance = a3;
}

- (double)previousPinchPerimeter
{
  return self->_previousPinchPerimeter;
}

- (void)setPreviousPinchPerimeter:(double)a3
{
  self->_previousPinchPerimeter = a3;
}

- (int64_t)potentialPinchDirection
{
  return self->_potentialPinchDirection;
}

- (void)setPotentialPinchDirection:(int64_t)a3
{
  self->_potentialPinchDirection = a3;
}

- (void)setEditingTraits:(id)a3
{
  objc_storeStrong((id *)&self->_editingTraits, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingTraits, 0);
  objc_storeStrong((id *)&self->_multiPansTimer, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_undoStateHUDDismissTimer, 0);
  objc_storeStrong((id *)&self->_undoHUDContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_undoHUDContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUDCenterConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUDTopConstraint, 0);
  objc_storeStrong((id *)&self->_undoStateHUD, 0);
  objc_storeStrong(&self->_pasteConfirmationAction, 0);
  objc_storeStrong((id *)&self->_undoInteractiveHUD, 0);
  objc_storeStrong((id *)&self->_threeFingerPinch, 0);
  objc_storeStrong((id *)&self->_threeFingerLongPress, 0);
  objc_storeStrong((id *)&self->_threeFingerSlide, 0);
  objc_storeStrong((id *)&self->_threeFingerDoubleTap, 0);
  objc_storeStrong((id *)&self->_threeFingerSingleTap, 0);
  objc_storeStrong((id *)&self->_observerGesture, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end
