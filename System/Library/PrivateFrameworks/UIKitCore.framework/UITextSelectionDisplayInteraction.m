@implementation UITextSelectionDisplayInteraction

- (void)_trackingViewportDidLayout:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (self->_needsUpdate && (*(_BYTE *)&self->_textInputRespondsTo & 0x10) != 0)
  {
    v9 = v4;
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(WeakRetained, "textLayoutManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textViewportLayoutController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v8)
    {
      if (objc_msgSend(WeakRetained, "allowsTextAnimations"))
        -[UITextSelectionDisplayInteraction _updateSelectionIfNeededResettingBlinkingAnimation:](self, "_updateSelectionIfNeededResettingBlinkingAnimation:", MEMORY[0x1E0C9AAA0]);
      else
        -[UITextSelectionDisplayInteraction _updateSelectionIfNeeded](self, "_updateSelectionIfNeeded");
    }

    v4 = v9;
  }

}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 8) != 0)
    -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
}

- (void)willMoveToView:(id)a3
{
  -[UITextSelectionDisplayInteraction _removeManagedSubviews](self, "_removeManagedSubviews", a3);
  objc_storeWeak((id *)&self->_view, 0);
}

- (void)_removeManagedSubviews
{
  _QWORD *v3;
  _QWORD *v4;
  NSArray *managedSubviewsBelowText;
  NSArray *managedSubviewsAboveText;

  -[UITextSelectionDisplayInteraction _hostViewAboveText](self, "_hostViewAboveText");
  v3 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView _removeGeometryChangeObserver:](v3, self);

  -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[UIView _removeGeometryChangeObserver:](v4, self);

  -[NSArray makeObjectsPerformSelector:](self->_managedSubviewsBelowText, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  managedSubviewsBelowText = self->_managedSubviewsBelowText;
  self->_managedSubviewsBelowText = 0;

  -[NSArray makeObjectsPerformSelector:](self->_managedSubviewsAboveText, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  managedSubviewsAboveText = self->_managedSubviewsAboveText;
  self->_managedSubviewsAboveText = 0;

  self->_didInstallManagedSubviews = 0;
}

- (CGRect)_textInputRectInSelectionViewCoordinateSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _UITextSelectionRangeAdjustmentContainerView *rangeAdjustmentViewContainer;
  UITextInput **p_textInput;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  p_textInput = &self->_textInput;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(WeakRetained, "textInputView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView convertRect:fromView:](rangeAdjustmentViewContainer, "convertRect:fromView:", v10, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = objc_loadWeakRetained((id *)p_textInput);
  objc_msgSend(v19, "textInputView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentScaleFactor");
  v22 = UIRectIntegralWithScale(v12, v14, v16, v18, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;

  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)layoutManagedSubviews
{
  self->_needsUpdate = 1;
  -[UITextSelectionDisplayInteraction _updateSelectionIfNeeded](self, "_updateSelectionIfNeeded");
}

+ (BOOL)isModernSelectionViewEnabled
{
  return +[UIKeyboard isRedesignedTextCursorEnabled](UIKeyboard, "isRedesignedTextCursorEnabled");
}

- (void)setNeedsSelectionUpdate
{
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdateWithReason:](self, "setNeedsSelectionUpdateWithReason:", 0);
}

- (void)setActivated:(BOOL)activated
{
  void *v4;

  self->_activated = activated;
  if (activated)
  {
    -[UITextSelectionDisplayInteraction _installManagedSubviewsIfNecessary](self, "_installManagedSubviewsIfNecessary");
    -[UITextSelectionDisplayInteraction _activeSelection](self, "_activeSelection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionChanged");

  }
  else
  {
    -[UITextSelectionDisplayInteraction _resetDictationPortalViews](self, "_resetDictationPortalViews");
  }
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
}

- (void)_resetDictationPortalViews
{
  void *v3;
  id v4;

  -[UITextSelectionDisplayInteraction cursorPortalInteraction](self, "cursorPortalInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[UITextSelectionDisplayInteraction trailingPortalInteraction](self, "trailingPortalInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

}

- (_UIContainerWindowPortalInteraction)trailingPortalInteraction
{
  return self->_trailingPortalInteraction;
}

- (_UIContainerWindowPortalInteraction)cursorPortalInteraction
{
  return self->_cursorPortalInteraction;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)didMoveToView:(id)a3
{
  id v4;

  v4 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    -[UITextSelectionDisplayInteraction _updateViewConformance](self, "_updateViewConformance");
    -[UITextSelectionDisplayInteraction _installManagedSubviewsIfNecessary](self, "_installManagedSubviewsIfNecessary");
  }

}

- (void)_installManagedSubviewsIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  _QWORD *v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_activated && !self->_didInstallManagedSubviews)
  {
    -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[UITextSelectionDisplayInteraction _managedSubviewsBelowText](self, "_managedSubviewsBelowText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "addSubview:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

    objc_msgSend(v3, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);

    -[UITextSelectionDisplayInteraction _hostViewAboveText](self, "_hostViewAboveText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UITextSelectionDisplayInteraction _managedSubviewsAboveText](self, "_managedSubviewsAboveText", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "addSubview:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v13);
    }

    -[UITextSelectionDisplayInteraction _hostViewAboveText](self, "_hostViewAboveText");
    v16 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UIView _addGeometryChangeObserver:](v16, self);

    -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
    v17 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[UIView _addGeometryChangeObserver:](v17, self);

    -[_UICursorAccessoryViewController setVisible:](self->_cursorAccessoryViewController, "setVisible:", 0);
    -[_UITextSelectionRangeAdjustmentContainerView setHidden:](self->_rangeAdjustmentViewContainer, "setHidden:", 1);
    -[UITextSelectionHighlightView setHidden:](self->_highlightView, "setHidden:", 1);
    -[UITextCursorView setHidden:](self->_cursorView, "setHidden:", 1);
    self->_didInstallManagedSubviews = 1;
    -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");

  }
}

- (void)_updateViewConformance
{
  UIView **p_view;
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  char v8;
  char v9;
  id v10;

  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  *(_BYTE *)&self->_viewRespondsTo = *(_BYTE *)&self->_viewRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  v5 = objc_loadWeakRetained((id *)p_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_viewRespondsTo = *(_BYTE *)&self->_viewRespondsTo & 0xFD | v6;

  v7 = objc_loadWeakRetained((id *)p_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_viewRespondsTo = *(_BYTE *)&self->_viewRespondsTo & 0xFB | v8;

  v10 = objc_loadWeakRetained((id *)p_view);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = 8;
  else
    v9 = 0;
  *(_BYTE *)&self->_viewRespondsTo = *(_BYTE *)&self->_viewRespondsTo & 0xF7 | v9;

}

- (id)_initWithTextInput:(id)a3 delegate:(id)a4 activated:(BOOL)a5
{
  id v8;
  id v9;
  UITextSelectionDisplayInteraction *v10;
  UITextSelectionDisplayInteraction *v11;
  _UIAssertionController *v12;
  _UIAssertionController *assertionController;
  UITextCursorAssertionController *v14;
  UITextCursorAssertionController *cursorAssertionController;
  void *v16;
  void *v17;
  id WeakRetained;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UITextSelectionDisplayInteraction;
  v10 = -[UITextSelectionDisplayInteraction init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_textInput, v8);
    objc_storeWeak((id *)&v11->_delegate, v9);
    v11->_activated = a5;
    v12 = -[_UIAssertionController initWithAssertionSubject:]([_UIAssertionController alloc], "initWithAssertionSubject:", v11);
    assertionController = v11->_assertionController;
    v11->_assertionController = v12;

    v14 = objc_alloc_init(UITextCursorAssertionController);
    cursorAssertionController = v11->_cursorAssertionController;
    v11->_cursorAssertionController = v14;

    -[UITextCursorAssertionController setSubject:](v11->_cursorAssertionController, "setSubject:", v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__didReceiveApplicationWillSuspendNotification_, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__didReceiveApplicationWillResumeNotification_, CFSTR("UIApplicationWillEnterForegroundNotification"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__trackingViewportDidLayout_, CFSTR("_UITextViewportLayoutControllerDidLayout"), 0);
    objc_msgSend(v16, "addObserver:selector:name:object:", v11, sel__didReceiveAXNonBlinkingDidChangeNotification_, *MEMORY[0x1E0C8EDB8], 0);
    +[_UITextInputImplicitObjectWrapper wrapperForObject:](_UITextInputImplicitObjectWrapper, "wrapperForObject:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&v11->_textInput);
    objc_setAssociatedObject(WeakRetained, &_UITextInputImplicitSelectionDisplayInteractionKey, v17, (void *)1);

    -[UITextSelectionDisplayInteraction _updateDelegateConformance](v11, "_updateDelegateConformance");
    -[UITextSelectionDisplayInteraction _updateTextInputConformance](v11, "_updateTextInputConformance");
    -[UITextSelectionDisplayInteraction _initializeDictationSupport](v11, "_initializeDictationSupport");
    -[UITextSelectionDisplayInteraction _updateAccessibilityNonBlinkingAssertion](v11, "_updateAccessibilityNonBlinkingAssertion");

  }
  return v11;
}

- (void)_initializeDictationSupport
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP")
    || +[UIKeyboard usesInputSystemUI](UIKeyboard, "usesInputSystemUI"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__dictationDidBeginNotification_, CFSTR("UIKeyboardDidBeginDictationNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__dictationDidFinishNotification_, CFSTR("UIDictationControllerDictationDidFinish"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__dictationDidPauseNotification_, CFSTR("UIDictationControllerDidPauseNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__dictationDidResumeNotification_, CFSTR("UIDictationControllerDidResumeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__dictationWillInsertHypothesisNotification_, 0x1E1747B40, 0);

  }
}

- (void)_updateTextInputConformance
{
  UITextInput **p_textInput;
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  char v15;
  id v16;

  p_textInput = &self->_textInput;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  v5 = objc_loadWeakRetained((id *)p_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xFD | v6;

  v7 = objc_loadWeakRetained((id *)p_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xFB | v8;

  v9 = objc_loadWeakRetained((id *)p_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 8;
  else
    v10 = 0;
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xF7 | v10;

  v11 = objc_loadWeakRetained((id *)p_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 16;
  else
    v12 = 0;
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xEF | v12;

  v13 = objc_loadWeakRetained((id *)p_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 32;
  else
    v14 = 0;
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xDF | v14;

  v16 = objc_loadWeakRetained((id *)p_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = 64;
  else
    v15 = 0;
  *(_BYTE *)&self->_textInputRespondsTo = *(_BYTE *)&self->_textInputRespondsTo & 0xBF | v15;

}

- (void)_updateDelegateConformance
{
  UITextSelectionDisplayInteractionDelegate **p_delegate;
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  char v8;
  id v9;
  char v10;
  char v11;
  id v12;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;

  v5 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 2;
  else
    v6 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v6;

  v7 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = 4;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v8;

  v9 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 8;
  else
    v10 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xF7 | v10;

  v12 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = 16;
  else
    v11 = 0;
  *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xEF | v11;

}

- (id)_managedSubviewsBelowText
{
  NSArray *managedSubviewsBelowText;
  NSArray *v4;
  uint64_t i;
  void *v6;
  NSArray *v7;

  managedSubviewsBelowText = self->_managedSubviewsBelowText;
  if (!managedSubviewsBelowText)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i != 3; ++i)
    {
      -[UITextSelectionDisplayInteraction _managedViewForType:](self, "_managedViewForType:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v6);

    }
    v7 = self->_managedSubviewsBelowText;
    self->_managedSubviewsBelowText = v4;

    managedSubviewsBelowText = self->_managedSubviewsBelowText;
  }
  return managedSubviewsBelowText;
}

- (BOOL)_isCursorVisible
{
  void *v3;
  int v4;
  BOOL v5;
  int v6;
  void *v7;

  -[UITextSelectionDisplayInteraction _activeSelection](self, "_activeSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEditableSelection");
  if (self->_activated && !self->_cursorHidden)
  {
    v6 = v4;
    objc_msgSend(v3, "selectedRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v7, "isEmpty") & v6) == 1 && !self->_hiddenForApplicationSuspend;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateSelectionIfNeeded
{
  -[UITextSelectionDisplayInteraction _updateSelectionIfNeededResettingBlinkingAnimation:](self, "_updateSelectionIfNeededResettingBlinkingAnimation:", MEMORY[0x1E0C9AAB0]);
}

- (CGRect)_selectionClipRectAt:(int64_t)a3
{
  double *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect result;

  v5 = (double *)MEMORY[0x1E0C9D628];
  if ((*(_BYTE *)&self->_viewRespondsTo & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "conformsToProtocolCached:", &unk_1EE0CE288);

    v11 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v11, "selectionClipRect");
  }
  else
  {
    if ((*(_BYTE *)&self->_viewRespondsTo & 4) == 0)
    {
      v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v9 = *MEMORY[0x1E0C9D628];
      v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      goto LABEL_7;
    }
    v11 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v11, "_selectionClipRect");
  }
  v9 = v12;
  v8 = v13;
  v7 = v14;
  v6 = v15;

LABEL_7:
  v31.origin.x = v9;
  v31.origin.y = v8;
  v31.size.width = v7;
  v31.size.height = v6;
  if (CGRectIsNull(v31))
  {
    v16 = *v5;
    v17 = v5[1];
    v18 = v5[2];
    v19 = v5[3];
  }
  else
  {
    if (a3)
      -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
    else
      -[UITextSelectionDisplayInteraction _hostViewAboveText](self, "_hostViewAboveText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(v21, "textInputView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertRect:fromView:", v22, v9, v8, v7, v6);
    v16 = v23;
    v17 = v24;
    v18 = v25;
    v19 = v26;

  }
  v27 = v16;
  v28 = v17;
  v29 = v18;
  v30 = v19;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)_hostViewBelowText
{
  id v3;
  void *v4;
  id v5;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) == 0
    || (v3 = objc_loadWeakRetained((id *)&self->_delegate),
        objc_msgSend(v3, "selectionContainerViewBelowTextForSelectionDisplayInteraction:", self),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    if ((*(_BYTE *)&self->_viewRespondsTo & 2) == 0
      || (v5 = objc_loadWeakRetained((id *)&self->_view),
          objc_msgSend(v5, "selectionContainerView"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          !v4))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      objc_msgSend(WeakRetained, "textInputView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v4;
}

- (id)_selectedRange
{
  void *v2;
  void *v3;

  -[UITextSelectionDisplayInteraction _activeSelection](self, "_activeSelection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_activeSelection
{
  UITextSelection *v3;
  id WeakRetained;
  UITextSelection *v5;
  void *v6;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    -[UITextSelectionDisplayInteraction _internalDelegate](self, "_internalDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeSelection");
    v5 = (UITextSelection *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = [UITextSelection alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    v5 = -[UITextSelection initWithDocument:](v3, "initWithDocument:", WeakRetained);

    -[UITextSelection selectionChanged](v5, "selectionChanged");
  }
  return v5;
}

- (id)_internalDelegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_updateDictationUI
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double y;
  double x;
  _BOOL8 v13;
  _BOOL8 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGFloat v21;
  double v22;
  double width;
  double height;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  CGFloat v41;
  CGFloat v42;
  id v43;
  CGRect v44;

  if (-[UITextSelectionDisplayInteraction _isDictationRunning](self, "_isDictationRunning"))
  {
    if (-[UITextSelectionDisplayInteraction _isCursorVisible](self, "_isCursorVisible"))
    {
      -[UITextSelectionDisplayInteraction _caretRectForDictationTrailingGlowView](self, "_caretRectForDictationTrailingGlowView");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled"))
      {
        if (-[UITextSelectionDisplayInteraction _glowViewMode](self, "_glowViewMode") == 2)
        {
          if (self)
          {
            x = self->__previousCursorFrame.origin.x;
            y = self->__previousCursorFrame.origin.y;
          }
          else
          {
            y = 0.0;
            x = 0.0;
          }
          v13 = v4 >= x;
          v14 = v4 < x || v6 != y;
          if (v6 == y)
          {
            v15 = 0;
          }
          else
          {
            -[UITextSelectionDisplayInteraction _caretRectAtStartOfLine](self, "_caretRectAtStartOfLine");
            v14 = v4 < v39 || v6 != v40;
            v15 = v14 ^ 1;
            v13 = v15;
            if (self && !v14)
            {
              v14 = 0;
              self->__previousCursorFrame.origin.x = v39;
              self->__previousCursorFrame.origin.y = v40;
              v15 = 1;
              v13 = 1;
              self->__previousCursorFrame.size.width = v41;
              self->__previousCursorFrame.size.height = v42;
            }
          }
        }
        else
        {
          v15 = 0;
          v13 = 0;
          v14 = -[UITextSelectionDisplayInteraction _glowViewMode](self, "_glowViewMode") == 1;
        }
      }
      else
      {
        v15 = 0;
        v13 = 0;
        v14 = 0;
      }
      -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "tintColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelectionDisplayInteraction _trailingGlowView](self, "_trailingGlowView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTintColor:", v17);

      -[UITextSelectionDisplayInteraction _trailingGlowView](self, "_trailingGlowView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = 0.0;
      v22 = 0.0;
      width = 0.0;
      height = 0.0;
      v25 = 0.0;
      if (self)
      {
        v25 = self->__previousCursorFrame.origin.x;
        v22 = self->__previousCursorFrame.origin.y;
        width = self->__previousCursorFrame.size.width;
        height = self->__previousCursorFrame.size.height;
      }
      objc_msgSend(v19, "cursorDidMoveToFrame:fromPreviousFrame:isNewLine:", v15, v4, v6, v8, v10, v25, v22, width, height);

      v26 = 0.0;
      v27 = 0.0;
      v28 = 0.0;
      if (self)
      {
        v28 = self->__previousCursorFrame.origin.x;
        v21 = self->__previousCursorFrame.origin.y;
        v26 = self->__previousCursorFrame.size.width;
        v27 = self->__previousCursorFrame.size.height;
      }
      v29 = v21;
      v44.origin.x = v4;
      v44.origin.y = v6;
      v44.size.width = v8;
      v44.size.height = v10;
      v30 = CGRectEqualToRect(*(CGRect *)&v28, v44);
      if (self && !v30)
      {
        self->__previousCursorFrame.origin.x = v4;
        self->__previousCursorFrame.origin.y = v6;
        self->__previousCursorFrame.size.width = v8;
        self->__previousCursorFrame.size.height = v10;
      }
      -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_scroller");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v32, "_canScrollY"))
        -[UITextSelectionDisplayInteraction _resetDictationPortalViews](self, "_resetDictationPortalViews");
      else
        -[UITextSelectionDisplayInteraction _enableDictationPortalViews](self, "_enableDictationPortalViews");

    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setGlowEffectEnabled:", v14);

    +[_UIDictationSettingsDomain rootSettings](_UIDictationSettingsDomain, "rootSettings");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "soundReactiveCursorEnabled");

    if (!v14 && v13)
    {
      if (v35)
      {
        -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setGlowEffectEnabled:", 1);

      }
    }
    -[UITextSelectionDisplayInteraction _trailingGlowView](self, "_trailingGlowView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTrailingAnimationEnabled:", v13);

    -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setAudioLevelProvider:", v38);

  }
}

- (BOOL)_isDictationRunning
{
  return self->__isDictationRunning;
}

- (BOOL)_isCursorAccessoryViewEnabled
{
  char v3;
  id WeakRetained;
  void *v5;

  if (!self->_activated || self->_cursorAccessoryViewHidden)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (-[UIView _isInVisibleHierarchy]((uint64_t)WeakRetained))
  {
    -[UITextSelectionDisplayInteraction _activeSelection](self, "_activeSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "hasEditableSelection");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (CGRect)_contentBoundsForPlacement:(int64_t)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  if (a3)
    -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
  else
    -[UITextSelectionDisplayInteraction _hostViewAboveText](self, "_hostViewAboveText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  if (objc_msgSend(v3, "__isKindOfUIScrollView"))
  {
    objc_msgSend(v3, "contentSize");
    v10 = v8 > v5;
    if (v9 > v7)
      v10 = 1;
    if (v10)
    {
      v5 = v8;
      v7 = v9;
    }
  }

  v11 = 0.0;
  v12 = 0.0;
  v13 = v5;
  v14 = v7;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_hostViewAboveText
{
  char viewRespondsTo;
  id WeakRetained;
  void *v4;
  void *v5;

  viewRespondsTo = (char)self->_viewRespondsTo;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = WeakRetained;
  if ((viewRespondsTo & 1) != 0)
    objc_msgSend(WeakRetained, "_selectionContainerViewAboveText");
  else
    objc_msgSend(WeakRetained, "textInputView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_visibleSelectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id WeakRetained;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSRange v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  NSRange v22;
  NSRange v23;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    if ((~*(_BYTE *)&self->_textInputRespondsTo & 6) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
      v8 = objc_msgSend(WeakRetained, "_nsrangeForTextRange:", v6);
      v10 = v9;

      v11 = objc_loadWeakRetained((id *)&self->_textInput);
      v12 = objc_msgSend(v11, "_visibleRangeWithLayout:", 0);
      v14 = v13;

      if (v14)
      {
        v15 = 2000;
        if (v12 > 2000)
          v15 = v12;
        v22.location = v15 - 2000;
        v22.length = v14 + 4000;
        v23.location = v8;
        v23.length = v10;
        v16 = NSIntersectionRange(v22, v23);
        v17 = objc_loadWeakRetained((id *)&self->_textInput);
        objc_msgSend(v17, "_textRangeFromNSRange:", v16.location, v16.length);
        v18 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v18;
      }
    }
    v19 = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(v19, "selectionRectsForRange:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

- (BOOL)_isRangeAdjustmentUIVisible
{
  char v3;
  id WeakRetained;
  char v5;

  if ((*(_BYTE *)&self->_textInputRespondsTo & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    v5 = objc_msgSend(WeakRetained, "_shouldSuppressSelectionHandles");

    v3 = v5 ^ 1;
  }
  else
  {
    v3 = 1;
  }
  if (self->_rangeViewMode)
    return 0;
  else
    return -[UITextSelectionDisplayInteraction _isHighlightVisible](self, "_isHighlightVisible") & v3;
}

- (BOOL)_isHighlightVisible
{
  void *v2;
  char v3;

  if (!self->_activated)
    return 0;
  -[UITextSelectionDisplayInteraction _selectedRange](self, "_selectedRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isRanged");

  return v3;
}

- (CGRect)_caretRect
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UITextSelectionDisplayInteraction _selectedRange](self, "_selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextSelectionDisplayInteraction _caretRectForPosition:](self, "_caretRectForPosition:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_caretRectForPosition:(id)a3
{
  UITextInput **p_textInput;
  id v5;
  id WeakRetained;
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
  double v17;
  double v18;
  CGRect result;

  if (a3)
  {
    p_textInput = &self->_textInput;
    v5 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_textInput);
    objc_msgSend(WeakRetained, "caretRectForPosition:", v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    -[UITextSelectionDisplayInteraction _textInputRectInSelectionViewCoordinateSpace:](self, "_textInputRectInSelectionViewCoordinateSpace:", v8, v10, v12, v14);
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D648];
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGAffineTransform)_caretTransform
{
  uint64_t v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  __int128 v13;
  CGAffineTransform *result;
  _OWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  -[UITextSelectionDisplayInteraction _selectedRange](self, "_selectedRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "end");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(_BYTE *)&self->_textInputRespondsTo & 0x20) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    v10 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "caretTransformForPosition:", v8);
      goto LABEL_8;
    }
LABEL_7:
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    goto LABEL_8;
  }
  if ((*(_BYTE *)&self->_textInputRespondsTo & 0x40) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    v9 = objc_loadWeakRetained((id *)&self->_textInput);
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "_caretTransformForPosition:", v8);
LABEL_8:

      -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v16;
      v15[1] = v17;
      v15[2] = v18;
      -[UITextSelectionDisplayInteraction _transformRelativeToTextInputCoordinateSpace:forView:](self, "_transformRelativeToTextInputCoordinateSpace:forView:", v15, v12);
      v13 = v15[4];
      *(_OWORD *)&retstr->a = v15[3];
      *(_OWORD *)&retstr->c = v13;
      *(_OWORD *)&retstr->tx = v15[5];

      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

  return result;
}

- (id)_tintColorOrDefault:(id)a3 alpha:(double)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  void *v18;

  v6 = a3;
  self = (UITextSelectionDisplayInteraction *)((char *)self + 200);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(WeakRetained, "tintColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained((id *)&self->super.isa);
  +[UIView _defaultInteractionTintColorForIdiom:](UIView, "_defaultInteractionTintColorForIdiom:", objc_msgSend(v9, "_userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {

    v16 = v11;
    v15 = v6;
LABEL_9:

    goto LABEL_10;
  }
  if (!v11 || !v12)
  {

    goto LABEL_8;
  }
  v14 = objc_msgSend(v11, "isEqual:", v12);

  v15 = v6;
  if ((v14 & 1) == 0)
  {
LABEL_8:
    v15 = v11;
    v16 = v6;
    goto LABEL_9;
  }
LABEL_10:
  if (a4 >= 1.0)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v15, "colorWithAlphaComponent:", a4);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  return v18;
}

- (id)_tintColorOrDefault:(id)a3
{
  return -[UITextSelectionDisplayInteraction _tintColorOrDefault:alpha:](self, "_tintColorOrDefault:alpha:", a3, 1.0);
}

+ (BOOL)isTextAccelerationUIEnabled
{
  return _os_feature_enabled_impl();
}

- (_UITextUnderlineView)_existingUnderlineView
{
  return self->_underlineView;
}

- (id)textInput
{
  return objc_loadWeakRetained((id *)&self->_textInput);
}

- (void)_didReceiveApplicationWillResumeNotification:(id)a3
{
  self->_hiddenForApplicationSuspend = 0;
  -[UITextSelectionDisplayInteraction layoutManagedSubviews](self, "layoutManagedSubviews", a3);
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (UITextCursorAssertionController)_cursorAssertionController
{
  return self->_cursorAssertionController;
}

- (void)clearInputModeCursorAssertion
{
  UITextCursorAssertion *showInputModesCursorAssertion;

  -[UITextCursorAssertion invalidate](self->_showInputModesCursorAssertion, "invalidate");
  showInputModesCursorAssertion = self->_showInputModesCursorAssertion;
  self->_showInputModesCursorAssertion = 0;

}

- (void)dealloc
{
  void *v3;
  UITextSelectionDisplayInteraction *v4;
  id WeakRetained;
  objc_super v6;

  objc_getAssociatedObject(self, &_UITextInputImplicitSelectionDisplayInteractionKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "weakObject");
  v4 = (UITextSelectionDisplayInteraction *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    objc_setAssociatedObject(WeakRetained, &_UITextInputImplicitSelectionDisplayInteractionKey, 0, (void *)1);

  }
  v6.receiver = self;
  v6.super_class = (Class)UITextSelectionDisplayInteraction;
  -[UITextSelectionDisplayInteraction dealloc](&v6, sel_dealloc);
}

- (id)_managedSubviewsAboveText
{
  NSArray *managedSubviewsAboveText;
  NSArray *v4;
  uint64_t i;
  void *v6;
  NSArray *v7;

  managedSubviewsAboveText = self->_managedSubviewsAboveText;
  if (!managedSubviewsAboveText)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    for (i = 3; i != 6; ++i)
    {
      -[UITextSelectionDisplayInteraction _managedViewForType:](self, "_managedViewForType:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v4, "addObject:", v6);

    }
    v7 = self->_managedSubviewsAboveText;
    self->_managedSubviewsAboveText = v4;

    managedSubviewsAboveText = self->_managedSubviewsAboveText;
  }
  return managedSubviewsAboveText;
}

- (id)_managedViewForType:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v6;

  switch(a3)
  {
    case 0:
      -[UITextSelectionDisplayInteraction highlightView](self, "highlightView");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[UITextSelectionDisplayInteraction _underlineView](self, "_underlineView");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[UITextSelectionDisplayInteraction _trailingGlowView](self, "_trailingGlowView");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[UITextSelectionDisplayInteraction _rangeAdjustmentViewContainer](self, "_rangeAdjustmentViewContainer");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v3;
      break;
    case 5:
      -[UITextSelectionDisplayInteraction _cursorAccessoryViewController](self, "_cursorAccessoryViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (_UITextCursorTrailingGlowView)_trailingGlowView
{
  _UITextCursorTrailingGlowView *trailingGlowView;
  _UITextCursorTrailingGlowView *v4;
  _UITextCursorTrailingGlowView *v5;
  _UITextCursorTrailingGlowView *v6;
  _QWORD v8[4];
  id v9;
  id location;

  trailingGlowView = self->_trailingGlowView;
  if (!trailingGlowView)
  {
    v4 = [_UITextCursorTrailingGlowView alloc];
    v5 = -[_UITextCursorTrailingGlowView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_trailingGlowView;
    self->_trailingGlowView = v5;

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__UITextSelectionDisplayInteraction_Dictation___trailingGlowView__block_invoke;
    v8[3] = &unk_1E16B3F40;
    objc_copyWeak(&v9, &location);
    -[_UITextCursorTrailingGlowView setTransitionBlock:](self->_trailingGlowView, "setTransitionBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    trailingGlowView = self->_trailingGlowView;
  }
  return trailingGlowView;
}

- (UIView)highlightView
{
  UITextSelectionHighlightView *highlightView;
  _UITextSelectionHighlightView *v4;
  _UITextSelectionHighlightView *v5;

  highlightView = self->_highlightView;
  if (!highlightView)
  {
    v4 = [_UITextSelectionHighlightView alloc];
    v5 = -[_UITextSelectionHighlightView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITextSelectionDisplayInteraction setHighlightView:](self, "setHighlightView:", v5);

    highlightView = self->_highlightView;
  }
  return (UIView *)highlightView;
}

- (void)setHighlightView:(UIView *)highlightView
{
  UIView *v5;
  uint64_t v6;
  UIView *v7;
  _UITextSelectionHighlightView *v8;
  _UITextSelectionHighlightView *concreteHighlightView;
  UIView *v10;

  v5 = highlightView;
  objc_storeStrong((id *)&self->_highlightView, highlightView);
  v6 = objc_opt_class();
  v10 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v10;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  concreteHighlightView = self->_concreteHighlightView;
  self->_concreteHighlightView = v8;

}

- (_UITextUnderlineView)_underlineView
{
  _UITextUnderlineView *underlineView;
  _UITextUnderlineView *v4;
  _UITextUnderlineView *v5;
  _UITextUnderlineView *v6;

  underlineView = self->_underlineView;
  if (!underlineView)
  {
    v4 = [_UITextUnderlineView alloc];
    v5 = -[_UITextUnderlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_underlineView;
    self->_underlineView = v5;

    -[_UITextUnderlineView setUseDirectionalLightEffect:](self->_underlineView, "setUseDirectionalLightEffect:", 0);
    underlineView = self->_underlineView;
  }
  return underlineView;
}

- (_UITextSelectionRangeAdjustmentContainerView)_rangeAdjustmentViewContainer
{
  _UITextSelectionRangeAdjustmentContainerView *rangeAdjustmentViewContainer;
  _UITextSelectionRangeAdjustmentContainerView *v4;
  _UITextSelectionRangeAdjustmentContainerView *v5;
  _UITextSelectionRangeAdjustmentContainerView *v6;

  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  if (!rangeAdjustmentViewContainer)
  {
    v4 = [_UITextSelectionRangeAdjustmentContainerView alloc];
    v5 = -[_UITextSelectionRangeAdjustmentContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_rangeAdjustmentViewContainer;
    self->_rangeAdjustmentViewContainer = v5;

    rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  }
  return rangeAdjustmentViewContainer;
}

- (_UICursorAccessoryViewController)_cursorAccessoryViewController
{
  _UICursorAccessoryViewController *cursorAccessoryViewController;
  _UICursorAccessoryViewController *v4;
  _UICursorAccessoryViewController *v5;

  cursorAccessoryViewController = self->_cursorAccessoryViewController;
  if (!cursorAccessoryViewController)
  {
    v4 = objc_alloc_init(_UICursorAccessoryViewController);
    v5 = self->_cursorAccessoryViewController;
    self->_cursorAccessoryViewController = v4;

    -[_UICursorAccessoryViewController setDelegate:](self->_cursorAccessoryViewController, "setDelegate:", self);
    cursorAccessoryViewController = self->_cursorAccessoryViewController;
  }
  return cursorAccessoryViewController;
}

- (void)setActiveIndicators:(unint64_t)a3 animationStyle:(int64_t)a4
{
  unint64_t v5;
  UITextSelectionDisplayInteraction *v6;
  _UIModifierKeyCursorAccessory *v7;
  uint64_t v8;
  _UIInputModeCursorAccessory *v9;
  _UIInputModeCursorAccessory *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIDictationCursorAccessory *v14;
  _UIDeleteCursorAccessory *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _UIModifierKeyCursorAccessory *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  _UIInputModeCursorAccessory *v28;
  void *v29;
  void *v30;
  _UIModifierKeyCursorAccessory *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  UITextSelectionDisplayInteraction *v40;
  _UIInputModeCursorAccessory *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  _UIInputModeCursorAccessory *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  _UIInputModeCursorAccessory *v63;
  char v64;
  uint64_t v65;
  _BOOL4 v66;
  int64_t v67;
  int64_t v68;
  UITextSelectionDisplayInteraction *obj;
  id obja;
  void *v71;
  _QWORD aBlock[4];
  id v73;
  id v74;
  id location;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v5 = a3;
  v6 = self;
  v86 = *MEMORY[0x1E0C80C00];
  if ((a3 & 4) != 0 || self->_activeIndicators != a3)
  {
    self->_activeIndicators = a3;
    v71 = (void *)objc_opt_new();
    if ((v5 & 8) != 0)
    {
      LODWORD(v8) = a4 == 1;
      if ((v5 & 4) == 0)
      {
        v14 = objc_alloc_init(_UIDictationCursorAccessory);
        -[_UICursorAccessory setIdentifier:](v14, "setIdentifier:", CFSTR("dic"));
        -[_UICursorAccessory setStyle:](v14, "setStyle:", 1);
        -[_UICursorAccessory setInteractive:](v14, "setInteractive:", 1);
        objc_msgSend(v71, "addObject:", v14);

      }
      if ((v5 & 0x10) != 0)
      {
        if (+[UIDictationUtilities shouldAddDeleteMenuElement](UIDictationUtilities, "shouldAddDeleteMenuElement"))
        {
          v15 = objc_alloc_init(_UIDeleteCursorAccessory);
          -[_UICursorAccessory setIdentifier:](v15, "setIdentifier:", CFSTR("del"));
          -[_UICursorAccessory setStyle:](v15, "setStyle:", 1);
          -[_UICursorAccessory setInteractive:](v15, "setInteractive:", 1);
          if ((v5 & 4) != 0)
            -[_UICursorAccessory setStyle:](v15, "setStyle:", 2);
          objc_msgSend(v71, "addObject:", v15);

        }
        else
        {
          -[UITextSelectionDisplayInteraction clearDeleteButtonCursorAssertion](v6, "clearDeleteButtonCursorAssertion");
        }
      }
      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activeDictationLanguage");
      v24 = (_UIModifierKeyCursorAccessory *)objc_claimAutoreleasedReturnValue();

      if ((v5 & 4) != 0)
      {
        v31 = v24;
        v66 = a4 == 1;
        v68 = a4;
        v82 = 0u;
        v83 = 0u;
        v81 = 0u;
        v80 = 0u;
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "enabledDictationLanguages");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        obja = v33;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v81;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v81 != v36)
                objc_enumerationMutation(obja);
              v38 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
              -[UITextSelectionDisplayInteraction inputModeForDictationLanguage:](v6, "inputModeForDictationLanguage:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = v6;
              v41 = objc_alloc_init(_UIInputModeCursorAccessory);
              objc_msgSend(v39, "identifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              -[_UIInputModeCursorAccessory setInputModeIdentifier:](v41, "setInputModeIdentifier:", v42);

              -[_UIInputModeCursorAccessory setDictationLanguage:](v41, "setDictationLanguage:", v38);
              -[_UICursorAccessory setStyle:](v41, "setStyle:", objc_msgSend(v38, "isEqualToString:", v31));
              -[_UICursorAccessory setInteractive:](v41, "setInteractive:", 1);
              -[_UICursorAccessory setLarge:](v41, "setLarge:", 1);
              objc_msgSend(v71, "addObject:", v41);

              v6 = v40;
            }
            v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
          }
          while (v35);
        }

        LODWORD(v8) = v66;
        a4 = v68;
        v24 = v31;
      }
      else
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "enabledDictationLanguages");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (a4 == 1 && v27 >= 2)
        {
          v28 = objc_alloc_init(_UIInputModeCursorAccessory);
          -[UITextSelectionDisplayInteraction inputModeForDictationLanguage:](v6, "inputModeForDictationLanguage:", v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "identifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIInputModeCursorAccessory setInputModeIdentifier:](v28, "setInputModeIdentifier:", v30);

          -[_UIInputModeCursorAccessory setDictationLanguage:](v28, "setDictationLanguage:", v24);
          -[_UICursorAccessory setStyle:](v28, "setStyle:", 1);
          -[_UICursorAccessory setInteractive:](v28, "setInteractive:", 1);
          objc_msgSend(v71, "addObject:", v28);

          LODWORD(v8) = 1;
        }
      }
    }
    else
    {
      if ((v5 & 0x20) != 0)
      {
        v7 = objc_alloc_init(_UIModifierKeyCursorAccessory);
        -[_UIModifierKeyCursorAccessory setModifierType:](v7, "setModifierType:", 3);
        -[_UICursorAccessory setStyle:](v7, "setStyle:", 2);
        objc_msgSend(v71, "addObject:", v7);

      }
      v8 = (v5 >> 1) & 1;
      if ((v5 & 2) != 0)
      {
        v9 = objc_alloc_init(_UIInputModeCursorAccessory);
        v10 = v9;
        if ((v5 & 4) != 0)
        {
          v65 = (v5 >> 1) & 1;
          v67 = a4;
          obj = v6;
          v63 = v9;
          v64 = v5;
          if ((v5 & 0x40) != 0)
          {
            +[UIInputSwitcher sharedInstance](UIInputSwitcher, "sharedInstance");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "selectedInputMode");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            +[UIInputSwitcher sharedInstance](UIInputSwitcher, "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "availableInputModes");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "currentInputMode");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "activeInputModeIdentifiers");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_484);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "filteredArrayUsingPredicate:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          v78 = 0u;
          v79 = 0u;
          v76 = 0u;
          v77 = 0u;
          v44 = v22;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v77;
            do
            {
              for (j = 0; j != v46; ++j)
              {
                if (*(_QWORD *)v77 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
                v50 = objc_alloc_init(_UIInputModeCursorAccessory);
                +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v49);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "identifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UIInputModeCursorAccessory setInputModeIdentifier:](v50, "setInputModeIdentifier:", v52);

                -[_UICursorAccessory setStyle:](v50, "setStyle:", objc_msgSend(v49, "isEqual:", v18));
                -[_UICursorAccessory setInteractive:](v50, "setInteractive:", 1);
                -[_UICursorAccessory setLarge:](v50, "setLarge:", 1);
                objc_msgSend(v71, "addObject:", v50);

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v76, v84, 16);
            }
            while (v46);
          }

          a4 = v67;
          v6 = obj;
          LOBYTE(v5) = v64;
          LODWORD(v8) = v65;
          v10 = v63;
        }
        else
        {
          UIKeyboardGetCurrentInputMode();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIInputModeCursorAccessory setInputModeIdentifier:](v10, "setInputModeIdentifier:", v13);

          -[_UICursorAccessory setStyle:](v10, "setStyle:", 1);
          -[_UICursorAccessory setInteractive:](v10, "setInteractive:", 1);
          objc_msgSend(v71, "addObject:", v10);

        }
      }
      if ((v5 & 5) != 1)
      {
LABEL_44:
        -[UITextSelectionDisplayInteraction textInput](v6, "textInput");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v54 = objc_msgSend(v53, "_systemCursorAccessoriesDisabled") ^ 1;
          if (!(_DWORD)v8)
          {
LABEL_49:
            if (!v54)
            {
LABEL_59:

              return;
            }
            if (objc_msgSend(v71, "count"))
            {
              v57 = -[UITextSelectionDisplayInteraction _isCursorAccessoryViewEnabled](v6, "_isCursorAccessoryViewEnabled");
              -[UITextSelectionDisplayInteraction _cursorAccessoryViewController](v6, "_cursorAccessoryViewController");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v58;
              if (v57)
              {
                v60 = 1;
                objc_msgSend(v58, "setAccessories:animated:", v71, 1);
                v61 = 0;
LABEL_55:
                objc_msgSend(v59, "setTouchFallbackEnabled:", v8 & v60);
                if (a4 == 2)
                  v62 = 2;
                else
                  v62 = a4 == 1;
                objc_msgSend(v59, "setVisible:animationStyle:completion:", v60, v62, v61);

                goto LABEL_59;
              }
            }
            else
            {
              -[UITextSelectionDisplayInteraction _cursorAccessoryViewController](v6, "_cursorAccessoryViewController");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_initWeak(&location, v59);
            aBlock[0] = MEMORY[0x1E0C809B0];
            aBlock[1] = 3221225472;
            aBlock[2] = __84__UITextSelectionDisplayInteraction_Assertions__setActiveIndicators_animationStyle___block_invoke_2;
            aBlock[3] = &unk_1E16B1500;
            objc_copyWeak(&v74, &location);
            v73 = v71;
            v61 = _Block_copy(aBlock);

            objc_destroyWeak(&v74);
            objc_destroyWeak(&location);
            v60 = 0;
            goto LABEL_55;
          }
        }
        else
        {
          v54 = 1;
          if (!(_DWORD)v8)
            goto LABEL_49;
        }
        objc_msgSend(v53, "interactionAssistant");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "_editMenuAssistant");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v56, "_hideSelectionCommandsWithReason:", 0);
        goto LABEL_49;
      }
      v24 = objc_alloc_init(_UIModifierKeyCursorAccessory);
      -[_UIModifierKeyCursorAccessory setModifierType:](v24, "setModifierType:", 2);
      -[_UICursorAccessory setStyle:](v24, "setStyle:", 1);
      -[_UICursorAccessory setInteractive:](v24, "setInteractive:", 1);
      objc_msgSend(v71, "addObject:", v24);
    }

    goto LABEL_44;
  }
}

- (BOOL)ghostAppearance
{
  void *v2;
  char v3;

  -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGhostEffectEnabled");

  return v3;
}

- (BOOL)cursorVisible
{
  return !-[UITextSelectionDisplayInteraction isCursorHidden](self, "isCursorHidden");
}

- (BOOL)cursorBlinks
{
  void *v2;
  char v3;

  -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlinking");

  return v3;
}

- (BOOL)isCursorHidden
{
  return self->_cursorHidden;
}

- (UIStandardTextCursorView)_cursorView
{
  return self->_concreteCursorView;
}

- (void)setCursorBlinks:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlinking:", v3);

}

- (UIView)cursorView
{
  UITextCursorView *cursorView;
  UIStandardTextCursorView *v4;
  UIStandardTextCursorView *v5;

  cursorView = self->_cursorView;
  if (!cursorView)
  {
    v4 = [UIStandardTextCursorView alloc];
    v5 = -[UIStandardTextCursorView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITextSelectionDisplayInteraction setCursorView:](self, "setCursorView:", v5);

    cursorView = self->_cursorView;
  }
  return (UIView *)cursorView;
}

- (void)setCursorView:(UIView *)cursorView
{
  UIView *v5;
  uint64_t v6;
  UIView *v7;
  UIStandardTextCursorView *v8;
  UIStandardTextCursorView *concreteCursorView;
  UIView *v10;

  v5 = cursorView;
  objc_storeStrong((id *)&self->_cursorView, cursorView);
  v6 = objc_opt_class();
  v10 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v10;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  concreteCursorView = self->_concreteCursorView;
  self->_concreteCursorView = v8;

  -[UITextCursorAssertionController _updateSubjectWithAssertionState](self->_cursorAssertionController, "_updateSubjectWithAssertionState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingPortalInteraction, 0);
  objc_storeStrong((id *)&self->_cursorPortalInteraction, 0);
  objc_storeStrong((id *)&self->__dictationBlinkSuppressionAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_textInput);
  objc_storeStrong((id *)&self->_concreteHighlightView, 0);
  objc_storeStrong((id *)&self->_concreteCursorView, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_showDeleteButtonCursorAssertion, 0);
  objc_storeStrong((id *)&self->_showInputModesCursorAssertion, 0);
  objc_storeStrong((id *)&self->_trailingGlowView, 0);
  objc_storeStrong((id *)&self->_activeFloatingCursorSession, 0);
  objc_storeStrong((id *)&self->_accessibilityNonBlinkingAssertion, 0);
  objc_storeStrong((id *)&self->_cursorAssertionController, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_managedSubviewsBelowText, 0);
  objc_storeStrong((id *)&self->_managedSubviewsAboveText, 0);
  objc_storeStrong((id *)&self->_proofreadingUnderlines, 0);
  objc_storeStrong((id *)&self->_cursorAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_proofreadingUnderlineView, 0);
  objc_storeStrong((id *)&self->_underlineView, 0);
  objc_storeStrong((id *)&self->_savedHighlightView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_cursorView, 0);
  objc_storeStrong((id *)&self->_rangeAdjustmentViewContainer, 0);
}

- (void)setCursorVisible:(BOOL)a3
{
  -[UITextSelectionDisplayInteraction setCursorHidden:](self, "setCursorHidden:", !a3);
}

- (void)setCursorHidden:(BOOL)a3
{
  self->_cursorHidden = a3;
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
}

void __65__UITextSelectionDisplayInteraction_Dictation___trailingGlowView__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "_isDictationRunning"))
  {
    objc_msgSend(WeakRetained, "_cursorView");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setGlowEffectEnabled:", 1);

  }
}

- (void)_initializeManagedDictationViewsIfNecessary
{
  _UIContainerWindowPortalInteraction *v3;
  void *v4;
  void *v5;
  _UIContainerWindowPortalInteraction *v6;
  void *v7;
  void *v8;

  if (!self->_didInitializeManagedDictationViews)
  {
    if (-[UITextSelectionDisplayInteraction isActivated](self, "isActivated"))
    {
      v3 = objc_alloc_init(_UIContainerWindowPortalInteraction);
      -[UITextSelectionDisplayInteraction setCursorPortalInteraction:](self, "setCursorPortalInteraction:", v3);

      -[UITextSelectionDisplayInteraction cursorView](self, "cursorView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelectionDisplayInteraction cursorPortalInteraction](self, "cursorPortalInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addInteraction:", v5);

      v6 = objc_alloc_init(_UIContainerWindowPortalInteraction);
      -[UITextSelectionDisplayInteraction setTrailingPortalInteraction:](self, "setTrailingPortalInteraction:", v6);

      -[UITextSelectionDisplayInteraction _trailingGlowView](self, "_trailingGlowView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelectionDisplayInteraction trailingPortalInteraction](self, "trailingPortalInteraction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addInteraction:", v8);

      self->_didInitializeManagedDictationViews = 1;
    }
  }
}

- (void)_enableDictationPortalViews
{
  void *v3;
  id v4;

  -[UITextSelectionDisplayInteraction cursorPortalInteraction](self, "cursorPortalInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 1);

  -[UITextSelectionDisplayInteraction trailingPortalInteraction](self, "trailingPortalInteraction");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

}

- (void)_dictationDidBeginNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UITextSelectionDisplayInteraction set_isDictationRunning:](self, "set_isDictationRunning:", 1);
  if (-[UITextSelectionDisplayInteraction _isCursorVisible](self, "_isCursorVisible"))
  {
    -[UITextSelectionDisplayInteraction _initializeManagedDictationViewsIfNecessary](self, "_initializeManagedDictationViewsIfNecessary");
    if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled"))
    {
      -[UITextSelectionDisplayInteraction _setGlowViewMode:](self, "_setGlowViewMode:", 1);
      -[UITextSelectionDisplayInteraction _enableDictationPortalViews](self, "_enableDictationPortalViews");
      -[UITextSelectionDisplayInteraction obtainBlinkSuppressionAssertionForReason:](self, "obtainBlinkSuppressionAssertionForReason:", CFSTR("dictation"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, v4);

      -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_setNeedsInitialDictationAnimation");

      -[UITextSelectionDisplayInteraction _updateDictationUI](self, "_updateDictationUI");
    }
  }
  else
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentDictationMenu");

    -[UITextSelectionDisplayInteraction obtainBlinkSuppressionAssertionForReason:](self, "obtainBlinkSuppressionAssertionForReason:", CFSTR("dictation"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, v7);

  }
}

- (void)_dictationDidFinishNotification:(id)a3
{
  UITextCursorAssertion *dictationBlinkSuppressionAssertion;
  UITextCursorAssertion *v5;
  void *v6;
  id v7;

  -[UITextSelectionDisplayInteraction set_isDictationRunning:](self, "set_isDictationRunning:", 0);
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled"))
  {
    -[UITextSelectionDisplayInteraction _setGlowViewMode:](self, "_setGlowViewMode:", 0);
    -[UITextSelectionDisplayInteraction _resetDictationPortalViews](self, "_resetDictationPortalViews");
    if (self)
      dictationBlinkSuppressionAssertion = self->__dictationBlinkSuppressionAssertion;
    else
      dictationBlinkSuppressionAssertion = 0;
    v5 = dictationBlinkSuppressionAssertion;
    -[UITextCursorAssertion invalidate](v5, "invalidate");

    -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, 0);
    -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setGlowEffectEnabled:", 0);

    -[UITextSelectionDisplayInteraction _trailingGlowView](self, "_trailingGlowView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTrailingAnimationEnabled:", 0);

  }
}

- (void)_dictationDidPauseNotification:(id)a3
{
  id v4;

  if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled", a3))
  {
    -[UITextSelectionDisplayInteraction _setGlowViewMode:](self, "_setGlowViewMode:", 0);
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearDictationMenuTimer");

  }
}

- (void)_dictationDidResumeNotification:(id)a3
{
  UITextCursorAssertion *dictationBlinkSuppressionAssertion;
  UITextCursorAssertion *v5;
  void *v6;
  id v7;

  if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled", a3)&& -[UITextSelectionDisplayInteraction _isDictationRunning](self, "_isDictationRunning"))
  {
    -[UITextSelectionDisplayInteraction _setGlowViewMode:](self, "_setGlowViewMode:", 1);
    if (self)
      dictationBlinkSuppressionAssertion = self->__dictationBlinkSuppressionAssertion;
    else
      dictationBlinkSuppressionAssertion = 0;
    v5 = dictationBlinkSuppressionAssertion;

    if (!v5)
    {
      -[UITextSelectionDisplayInteraction obtainBlinkSuppressionAssertionForReason:](self, "obtainBlinkSuppressionAssertionForReason:", CFSTR("dictation"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelectionDisplayInteraction set_dictationBlinkSuppressionAssertion:]((uint64_t)self, v6);

    }
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "representDictationMenu");

  }
}

- (void)_dictationWillInsertHypothesisNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (+[UIKeyboard isInlineDictationGlowEffectEnabled](UIKeyboard, "isInlineDictationGlowEffectEnabled")
    && -[UITextSelectionDisplayInteraction _isDictationRunning](self, "_isDictationRunning"))
  {
    objc_msgSend(v8, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v8, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIDictationGlowViewMode"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "intValue");

    }
    else
    {
      v7 = 2;
    }
    -[UITextSelectionDisplayInteraction _setGlowViewMode:](self, "_setGlowViewMode:", v7);
  }

}

- (UITextSelectionDisplayInteraction)initWithTextInput:(id)textInput delegate:(id)delegate
{
  return (UITextSelectionDisplayInteraction *)-[UITextSelectionDisplayInteraction _initWithTextInput:delegate:activated:](self, "_initWithTextInput:delegate:activated:", textInput, delegate, 1);
}

- (void)_updateAccessibilityNonBlinkingAssertion
{
  int v3;
  UITextCursorAssertion *accessibilityNonBlinkingAssertion;
  UITextCursorAssertion *v5;
  UITextCursorAssertion *v6;

  v3 = AXPrefersNonBlinkingTextInsertionIndicator();
  accessibilityNonBlinkingAssertion = self->_accessibilityNonBlinkingAssertion;
  if (v3)
  {
    if (accessibilityNonBlinkingAssertion)
      return;
    -[UITextCursorAssertionController nonBlinkingAssertionWithReason:](self->_cursorAssertionController, "nonBlinkingAssertionWithReason:", CFSTR("AXPrefersNonBlinkingTextInsertionIndicator"));
    v5 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!accessibilityNonBlinkingAssertion)
      return;
    -[UITextCursorAssertion invalidate](accessibilityNonBlinkingAssertion, "invalidate");
    v5 = 0;
  }
  v6 = self->_accessibilityNonBlinkingAssertion;
  self->_accessibilityNonBlinkingAssertion = v5;

}

- (void)_didReceiveApplicationWillSuspendNotification:(id)a3
{
  self->_hiddenForApplicationSuspend = 1;
  -[UITextSelectionDisplayInteraction layoutManagedSubviews](self, "layoutManagedSubviews", a3);
}

- (UIColor)_cursorTintColor
{
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  char v17;
  id v18;
  void *v19;

  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_9;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v4 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  v5 = objc_loadWeakRetained((id *)&self->_textInput);
  NSProtocolFromString(CFSTR("BETextInput"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "conformsToProtocolCached:", v6);

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(v8, "performSelector:", sel_extendedTextInputTraits);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "performSelector:", sel_insertionPointColor);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_18;
  }
LABEL_9:
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_19;
  v9 = objc_loadWeakRetained((id *)&self->_textInput);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_18:

    goto LABEL_19;
  }
  v11 = objc_loadWeakRetained((id *)&self->_textInput);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_18;
  }
  v12 = objc_loadWeakRetained((id *)&self->_textInput);
  v13 = objc_msgSend(v12, "conformsToProtocolCached:", &unk_1EE09F2A0);

  if (v13)
  {
    v14 = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(v14, "extendedTraitsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "insertionPointColor");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v15 = (void *)v10;

      if (v15)
        return (UIColor *)v15;
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_19:
  v16 = objc_loadWeakRetained((id *)&self->_textInput);
  v17 = objc_opt_respondsToSelector();

  if ((v17 & 1) == 0
    || (v18 = objc_loadWeakRetained((id *)&self->_textInput),
        objc_msgSend(v18, "performSelector:", sel_insertionPointColor),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        !v15))
  {
    +[UIColor insertionPointColor](UIColor, "insertionPointColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionDisplayInteraction _tintColorOrDefault:](self, "_tintColorOrDefault:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (UIColor *)v15;
}

- (void)setHandleViews:(NSArray *)handleViews
{
  NSArray *v5;
  void *v6;
  id v7;

  v5 = handleViews;
  if (-[NSArray count](v5, "count") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UITextSelectionDisplayInteraction.m"), 423, CFSTR("You must provide exactly two handle views to UITextSelectionDisplayInteraction, one for the leading selection handle and one for the trailing selection handle."));

  }
  -[UITextSelectionDisplayInteraction _rangeAdjustmentViewContainer](self, "_rangeAdjustmentViewContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectionGrabbers:", v5);

}

- (NSArray)handleViews
{
  void *v2;
  void *v3;

  -[UITextSelectionDisplayInteraction _rangeAdjustmentViewContainer](self, "_rangeAdjustmentViewContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionGrabbers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_proofreadingUnderlineView
{
  _UITextUnderlineView *proofreadingUnderlineView;
  _UITextUnderlineView *v4;
  _UITextUnderlineView *v5;
  _UITextUnderlineView *v6;
  void *v7;

  proofreadingUnderlineView = self->_proofreadingUnderlineView;
  if (!proofreadingUnderlineView)
  {
    v4 = [_UITextUnderlineView alloc];
    v5 = -[_UITextUnderlineView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_proofreadingUnderlineView;
    self->_proofreadingUnderlineView = v5;

    -[_UITextUnderlineView setUseDirectionalLightEffect:](self->_proofreadingUnderlineView, "setUseDirectionalLightEffect:", 1);
    -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_proofreadingUnderlineView);

    proofreadingUnderlineView = self->_proofreadingUnderlineView;
  }
  return proofreadingUnderlineView;
}

- (id)_allManagedSubviews
{
  void *v3;
  void *v4;
  void *v5;

  -[UITextSelectionDisplayInteraction _managedSubviewsAboveText](self, "_managedSubviewsAboveText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionDisplayInteraction _managedSubviewsBelowText](self, "_managedSubviewsBelowText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_updateHighlightViewWithShimmerState
{
  _UITextSelectionHighlightShimmerView *v3;
  _UITextSelectionHighlightShimmerView *v4;
  UITextSelectionHighlightView *v5;
  UITextSelectionHighlightView *savedHighlightView;
  UITextSelectionHighlightView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *managedSubviewsBelowText;
  id v13;
  UITextSelectionHighlightView *v14;

  v14 = self->_highlightView;
  if (self->_shouldDisplayShimmerHighlights)
  {
    v3 = [_UITextSelectionHighlightShimmerView alloc];
    v4 = -[_UITextSelectionHighlightShimmerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v5 = v14;
    savedHighlightView = self->_savedHighlightView;
    self->_savedHighlightView = v5;
  }
  else
  {
    v7 = self->_savedHighlightView;
    if (!v7)
    {
      v4 = 0;
      goto LABEL_6;
    }
    v4 = v7;
    savedHighlightView = self->_savedHighlightView;
    self->_savedHighlightView = 0;
  }

LABEL_6:
  if (self->_activated || self->_didInstallManagedSubviews)
  {
    -[UITextSelectionHighlightView superview](v14, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {
      -[UIView setHidden:](v4, "setHidden:", -[UITextSelectionHighlightView isHidden](v14, "isHidden"));
      -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "insertSubview:belowSubview:", v4, v14);

      -[UITextSelectionHighlightView removeFromSuperview](v14, "removeFromSuperview");
    }
    else
    {
      -[UIView setHidden:](v4, "setHidden:", 1);
      -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "insertSubview:atIndex:", v4, 0);

    }
  }
  -[UITextSelectionDisplayInteraction setHighlightView:](self, "setHighlightView:", v4);
  managedSubviewsBelowText = self->_managedSubviewsBelowText;
  self->_managedSubviewsBelowText = 0;

  v13 = -[UITextSelectionDisplayInteraction _managedSubviewsBelowText](self, "_managedSubviewsBelowText");
  if (self->_activated || self->_didInstallManagedSubviews)
    -[UITextSelectionDisplayInteraction _updateSelectionIfNeededResettingBlinkingAnimation:](self, "_updateSelectionIfNeededResettingBlinkingAnimation:", MEMORY[0x1E0C9AAA0]);

}

- (void)setNeedsSelectionUpdateWithReason:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (!self->_needsUpdate)
  {
    self->_needsUpdate = 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3 == 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = *MEMORY[0x1E0C99860];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionDisplayInteraction performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__updateSelectionIfNeededResettingBlinkingAnimation_, v4, v5, 0.0);

  }
}

- (double)_cursorAlpha
{
  double result;

  if (self->_cursorFadedHiddenForFloatingCursor)
    return 0.0101;
  result = 0.0101;
  if (!self->_selectionUIHiddenForAssertion)
    return 1.0;
  return result;
}

- (double)_highlightAndRangeAdjustmentAlpha
{
  double result;

  result = 0.0;
  if (!self->_selectionUIHiddenForAssertion)
    return 1.0;
  return result;
}

- (BOOL)_isCursorAccessoryViewVisible
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[UITextSelectionDisplayInteraction _isCursorAccessoryViewEnabled](self, "_isCursorAccessoryViewEnabled");
  if (v3)
  {
    -[UITextSelectionDisplayInteraction _cursorAccessoryViewController](self, "_cursorAccessoryViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isVisible");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (CGAffineTransform)_transformRelativeToTextInputCoordinateSpace:(SEL)a3 forView:(CGAffineTransform *)a4
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGAffineTransform *result;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform t1;
  CGAffineTransform v19;

  objc_msgSend(a5, "center");
  v8 = v7;
  v10 = v9;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  CGAffineTransformMakeTranslation(retstr, -v7, -v9);
  v11 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v11;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v17.c = v12;
  *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v19, &t1, &v17);
  v13 = *(_OWORD *)&v19.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v19.tx;
  v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v19, &t1, v8, v10);
  v16 = *(_OWORD *)&v19.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v19.a;
  *(_OWORD *)&retstr->c = v16;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v19.tx;
  return result;
}

- (CGRect)_caretRectForDictationTrailingGlowView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[UITextSelectionDisplayInteraction _caretRect](self, "_caretRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITextSelectionDisplayInteraction _hostViewBelowText](self, "_hostViewBelowText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromView:", self->_rangeAdjustmentViewContainer, v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_caretRectAtStartOfLine
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[UITextSelectionDisplayInteraction _selectedRange](self, "_selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(WeakRetained, "tokenizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "positionFromPosition:toBoundary:inDirection:", v4, 4, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  -[UITextSelectionDisplayInteraction _caretRectForPosition:](self, "_caretRectForPosition:", v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGAffineTransform)_lollipopTransformForSelectionRect:(SEL)a3 view:(id)a4
{
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  CGAffineTransform *result;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C9BAA8];
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v11;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v10 + 32);
  memset(&v16, 0, sizeof(v16));
  if (v8)
    objc_msgSend(v8, "transform");
  v15 = v16;
  if (!CGAffineTransformIsIdentity(&v15))
  {
    v14 = v16;
    -[UITextSelectionDisplayInteraction _transformRelativeToTextInputCoordinateSpace:forView:](self, "_transformRelativeToTextInputCoordinateSpace:forView:", &v14, v9);
    v12 = *(_OWORD *)&v15.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v15.a;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v15.tx;
  }

  return result;
}

- (void)_updateSelectionIfNeededResettingBlinkingAnimation:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  UITextInput **p_textInput;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  UITextSelectionHighlightView *highlightView;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  UITextSelectionHighlightView *v46;
  UITextSelectionDisplayInteraction *v47;
  id v48;
  void *v49;
  char **v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  char **v60;
  id v61;
  int v62;
  id v63;
  id v64;
  id v65;
  char *v66;
  char v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  double v72;
  id v73;
  char v74;
  double v75;
  double v76;
  id v77;
  double v78;
  id v79;
  char v80;
  id v81;
  double v82;
  id v83;
  char v84;
  double v85;
  double v86;
  double v87;
  double v88;
  id v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  id v95;
  char v96;
  id v97;
  uint64_t v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  _UITextSelectionRangeAdjustmentContainerView *rangeAdjustmentViewContainer;
  _UITextSelectionRangeAdjustmentContainerView *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  int v115;
  id v116;
  void *v117;
  uint64_t v118;
  id v119;
  id v120;
  int v121;
  id v122;
  void *v123;
  id v124;
  char v125;
  id v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  int v134;
  id v135;
  void *v136;
  UITextSelectionDisplayInteraction *v137;
  id v138;
  id v139;
  int v140;
  id v141;
  id v142;
  id v143;
  char v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t j;
  void *v153;
  double v154;
  double v155;
  double v156;
  uint64_t v157;
  void *v158;
  void *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  double v164;
  uint64_t v165;
  void *v166;
  double v167;
  double v168;
  double v169;
  double v170;
  CGFloat v171;
  CGFloat v172;
  CGFloat v173;
  CGFloat v174;
  id v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  id v184;
  void *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  id v198;
  double v199;
  double v200;
  double v201;
  CGFloat v202;
  double v203;
  CGFloat v204;
  double v205;
  CGFloat v206;
  CGFloat v207;
  CGFloat v208;
  CGFloat v209;
  CGFloat v210;
  CGFloat v211;
  CGFloat v212;
  CGFloat v213;
  CGFloat v214;
  _BOOL8 v215;
  double MaxY;
  uint64_t v217;
  double v218;
  CGFloat v219;
  double v220;
  CGFloat v221;
  double v222;
  CGFloat v223;
  double v224;
  CGFloat v225;
  void *v226;
  _BOOL4 v227;
  double v228;
  double v229;
  double v230;
  double v231;
  void *v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  void *v241;
  double v242;
  double v243;
  UITextCursorView *cursorView;
  void *v245;
  _UITextFloatingCursorSession *activeFloatingCursorSession;
  uint64_t v247;
  void *v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  void *v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  double v266;
  void *v267;
  void *v268;
  double MinY;
  id v270;
  double v271;
  int dyb;
  CGFloat dy;
  double dya;
  _BOOL4 v275;
  UITextSelectionDisplayInteraction *v276;
  double v277;
  void *v278;
  id obj;
  BOOL IsNull;
  double v281;
  _OWORD v282[6];
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  _OWORD v291[6];
  _OWORD v292[6];
  CGAffineTransform v293;
  CGAffineTransform v294;
  CGAffineTransform v295;
  CGAffineTransform v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  _BYTE v301[128];
  _BYTE v302[128];
  _BYTE v303[128];
  uint64_t v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;
  CGRect v324;
  CGRect v325;

  v304 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_needsUpdate)
  {
    -[UITextSelectionDisplayInteraction _selectionClipRectAt:](self, "_selectionClipRectAt:", 1);
    x = v305.origin.x;
    y = v305.origin.y;
    width = v305.size.width;
    height = v305.size.height;
    IsNull = CGRectIsNull(v305);
    p_textInput = &self->_textInput;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(WeakRetained, "textInputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_scaleFromLayerTransforms");
    v13 = v12;

    v14 = 1.0;
    if (v13 > 1.0)
      v14 = 1.0 / v13;
    v266 = v14;
    -[UITextSelectionDisplayInteraction _activeSelection](self, "_activeSelection");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v267, "selectedRange");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelectionDisplayInteraction _visibleSelectionRectsForRange:](self, "_visibleSelectionRectsForRange:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    v297 = 0u;
    v298 = 0u;
    v299 = 0u;
    v300 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v297, v303, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v298;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v298 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v297 + 1) + 8 * i);
          v21 = (void *)objc_msgSend(v20, "mutableCopy");
          highlightView = self->_highlightView;
          objc_msgSend(v20, "rect");
          v24 = v23;
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v31 = objc_loadWeakRetained((id *)&self->_textInput);
          objc_msgSend(v31, "textInputView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextSelectionHighlightView convertRect:fromView:](highlightView, "convertRect:fromView:", v32, v24, v26, v28, v30);
          v34 = v33;
          v36 = v35;
          v38 = v37;
          v40 = v39;

          if (!IsNull)
          {
            v306.origin.x = x;
            v306.origin.y = y;
            v306.size.width = width;
            v306.size.height = height;
            v322.origin.x = v34;
            v322.origin.y = v36;
            v322.size.width = v38;
            v322.size.height = v40;
            v307 = CGRectIntersection(v306, v322);
            v34 = v307.origin.x;
            v36 = v307.origin.y;
            v38 = v307.size.width;
            v40 = v307.size.height;
          }
          if (UIRectIsDiscrete(v34, v36, v38, v40))
          {
            v41 = objc_loadWeakRetained((id *)&self->_textInput);
            objc_msgSend(v41, "textInputView");
            v42 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "setRect:fromView:", v42, v34, v36, v38, v40);
            objc_msgSend(v21, "_path");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              if (v42)
              {
                objc_msgSend(v42, "transform");
                if (!CGAffineTransformIsIdentity(&v296))
                {
                  memset(&v295, 0, sizeof(v295));
                  objc_msgSend(v42, "transform");
                  goto LABEL_18;
                }
              }
              else
              {
                memset(&v296, 0, sizeof(v296));
                if (!CGAffineTransformIsIdentity(&v296))
                {
                  memset(&v295, 0, sizeof(v295));
                  memset(&v294, 0, sizeof(v294));
LABEL_18:
                  CGAffineTransformInvert(&v295, &v294);
                  v293 = v295;
                  objc_msgSend(v43, "applyTransform:", &v293);
                }
              }
            }
            objc_msgSend(v278, "addObject:", v21);

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v297, v303, 16);
      }
      while (v17);
    }

    objc_msgSend(v278, "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[UITextSelectionDisplayInteraction _isHighlightVisible](self, "_isHighlightVisible");
    v46 = self->_highlightView;
    if (!v45)
    {
      -[UITextSelectionHighlightView setHidden:](v46, "setHidden:", 1);
      goto LABEL_58;
    }
    -[UITextSelectionHighlightView setHidden:](v46, "setHidden:", 0);
    -[UITextSelectionDisplayInteraction _contentBoundsForPlacement:](self, "_contentBoundsForPlacement:", 1);
    -[UITextSelectionHighlightView setFrame:](self->_highlightView, "setFrame:");
    -[UITextSelectionHighlightView setSelectionRects:](self->_highlightView, "setSelectionRects:", v44);
    -[UITextSelectionDisplayInteraction _highlightAndRangeAdjustmentAlpha](self, "_highlightAndRangeAdjustmentAlpha");
    -[UITextSelectionHighlightView setAlpha:](self->_highlightView, "setAlpha:");
    v47 = self;
    v48 = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(v48, "traitCollection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v275 = objc_msgSend(v49, "userInterfaceStyle") == 2;

    v50 = &selRef_scrollYOffset;
    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_32;
    v51 = objc_loadWeakRetained((id *)&self->_textInput);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v52 = objc_loadWeakRetained((id *)&self->_textInput);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = objc_loadWeakRetained((id *)&self->_textInput);
        NSProtocolFromString(CFSTR("BETextInput"));
        v54 = v44;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        dyb = objc_msgSend(v53, "conformsToProtocolCached:", v55);

        v44 = v54;
        v50 = &selRef_scrollYOffset;
        if (dyb)
        {
          v56 = objc_loadWeakRetained((id *)p_textInput);
          objc_msgSend(v56, "performSelector:", sel_extendedTextInputTraits);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v57, "performSelector:", sel_selectionHighlightColor);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            self = v47;
            goto LABEL_38;
          }
          self = v47;
          goto LABEL_42;
        }
LABEL_32:
        self = v47;
        if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_43;
        v57 = objc_loadWeakRetained((id *)p_textInput);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v59 = objc_loadWeakRetained((id *)p_textInput);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v60 = v50;
            v61 = objc_loadWeakRetained((id *)p_textInput);
            v62 = objc_msgSend(v61, "conformsToProtocolCached:", &unk_1EE09F2A0);

            v50 = v60;
            if (!v62)
              goto LABEL_43;
            v63 = objc_loadWeakRetained((id *)p_textInput);
            objc_msgSend(v63, "extendedTraitsDelegate");
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v57, "selectionHighlightColor");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

              if (v58)
              {
                v64 = v58;
                goto LABEL_46;
              }
LABEL_43:
              v65 = objc_loadWeakRetained((id *)p_textInput);
              v66 = v50[428];
              v67 = objc_opt_respondsToSelector();

              if ((v67 & 1) == 0
                || (v68 = objc_loadWeakRetained((id *)p_textInput),
                    objc_msgSend(v68, "performSelector:", v66),
                    v69 = (void *)objc_claimAutoreleasedReturnValue(),
                    v68,
                    !v69))
              {
                v72 = dbl_18667AE20[v275];
                +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                -[UITextSelectionDisplayInteraction _tintColorOrDefault:alpha:](self, "_tintColorOrDefault:alpha:", v70, v72);
                v71 = (id)objc_claimAutoreleasedReturnValue();

LABEL_48:
                -[UITextSelectionHighlightView setTintColor:](self->_highlightView, "setTintColor:", v71);

                if (self->_concreteHighlightView)
                {
                  v73 = objc_loadWeakRetained((id *)p_textInput);
                  v74 = objc_opt_respondsToSelector();

                  v75 = 0.0;
                  v76 = 0.0;
                  if ((v74 & 1) != 0)
                  {
                    v77 = objc_loadWeakRetained((id *)p_textInput);
                    objc_msgSend(v77, "selectionBorderWidth");
                    v76 = v78;

                  }
                  -[_UITextSelectionHighlightView _setSelectionBorderWidth:](self->_concreteHighlightView, "_setSelectionBorderWidth:", v76);
                  v79 = objc_loadWeakRetained((id *)p_textInput);
                  v80 = objc_opt_respondsToSelector();

                  if ((v80 & 1) != 0)
                  {
                    v81 = objc_loadWeakRetained((id *)p_textInput);
                    objc_msgSend(v81, "selectionCornerRadius");
                    v75 = v82;

                  }
                  -[_UITextSelectionHighlightView _setSelectionCornerRadius:](self->_concreteHighlightView, "_setSelectionCornerRadius:", v75);
                  v83 = objc_loadWeakRetained((id *)p_textInput);
                  v84 = objc_opt_respondsToSelector();

                  v85 = 0.0;
                  v86 = 0.0;
                  v87 = 0.0;
                  v88 = 0.0;
                  if ((v84 & 1) != 0)
                  {
                    v89 = objc_loadWeakRetained((id *)p_textInput);
                    objc_msgSend(v89, "selectionEdgeInsets");
                    v88 = v90;
                    v87 = v91;
                    v86 = v92;
                    v85 = v93;

                  }
                  -[_UITextSelectionHighlightView _setSelectionEdgeInsets:](self->_concreteHighlightView, "_setSelectionEdgeInsets:", v88, v87, v86, v85);
                  +[UIColor clearColor](UIColor, "clearColor");
                  v94 = (void *)objc_claimAutoreleasedReturnValue();
                  v95 = objc_loadWeakRetained((id *)p_textInput);
                  v96 = objc_opt_respondsToSelector();

                  if ((v96 & 1) != 0)
                  {
                    v97 = objc_loadWeakRetained((id *)p_textInput);
                    objc_msgSend(v97, "selectionBorderColor");
                    v98 = objc_claimAutoreleasedReturnValue();

                    v94 = (void *)v98;
                  }
                  v99 = v94;

                  -[_UITextSelectionHighlightView _setSelectionBorderColor:](self->_concreteHighlightView, "_setSelectionBorderColor:", v99);
                }
LABEL_58:
                if (!-[UITextSelectionDisplayInteraction _isRangeAdjustmentUIVisible](self, "_isRangeAdjustmentUIVisible")|| !objc_msgSend(v44, "count"))
                {
                  -[_UITextSelectionRangeAdjustmentContainerView setHidden:](self->_rangeAdjustmentViewContainer, "setHidden:", 1);
                  goto LABEL_141;
                }
                -[_UITextSelectionRangeAdjustmentContainerView setHidden:](self->_rangeAdjustmentViewContainer, "setHidden:", 0);
                -[UITextSelectionDisplayInteraction _contentBoundsForPlacement:](self, "_contentBoundsForPlacement:", 0);
                -[UIView setFrame:](self->_rangeAdjustmentViewContainer, "setFrame:");
                -[_UITextSelectionRangeAdjustmentContainerView setShapeScale:](self->_rangeAdjustmentViewContainer, "setShapeScale:", v266);
                objc_msgSend(v44, "firstObject");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                -[_UITextSelectionRangeAdjustmentContainerView setVertical:](self->_rangeAdjustmentViewContainer, "setVertical:", objc_msgSend(v100, "isVertical"));

                -[UITextSelectionDisplayInteraction _highlightAndRangeAdjustmentAlpha](self, "_highlightAndRangeAdjustmentAlpha");
                -[UIView setAlpha:](self->_rangeAdjustmentViewContainer, "setAlpha:");
                +[UITextSelectionRect startRectFromRects:](UITextSelectionRect, "startRectFromRects:", v44);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                +[UITextSelectionRect endRectFromRects:](UITextSelectionRect, "endRectFromRects:", v44);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
                objc_msgSend(v101, "_startEdgeRect");
                -[UIView convertRect:fromView:](rangeAdjustmentViewContainer, "convertRect:fromView:", self->_highlightView);
                -[_UITextSelectionRangeAdjustmentContainerView setStartEdge:](self->_rangeAdjustmentViewContainer, "setStartEdge:");
                v104 = self->_rangeAdjustmentViewContainer;
                objc_msgSend(v102, "_endEdgeRect");
                -[UIView convertRect:fromView:](v104, "convertRect:fromView:", self->_highlightView);
                -[_UITextSelectionRangeAdjustmentContainerView setEndEdge:](self->_rangeAdjustmentViewContainer, "setEndEdge:");
                -[_UITextSelectionRangeAdjustmentContainerView layoutSubviews](self->_rangeAdjustmentViewContainer, "layoutSubviews");
                -[UITextSelectionDisplayInteraction _hostViewAboveText](self, "_hostViewAboveText");
                v105 = objc_claimAutoreleasedReturnValue();
                -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](self->_rangeAdjustmentViewContainer, "leadingLollipopView");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v101, "_startCustomSelectionPath");
                v261 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v261, "bezierPathForHostView:targetView:", v105, v106);
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "setCustomShape:", v107);

                -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](self->_rangeAdjustmentViewContainer, "trailingLollipopView");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v102, "_endCustomSelectionPath");
                v259 = (void *)objc_claimAutoreleasedReturnValue();
                v264 = (void *)v105;
                objc_msgSend(v259, "bezierPathForHostView:targetView:", v105, v108);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "setCustomShape:", v109);

                v265 = v101;
                -[UITextSelectionDisplayInteraction _lollipopTransformForSelectionRect:view:](self, "_lollipopTransformForSelectionRect:view:", v101, v106);
                v292[0] = v292[3];
                v292[1] = v292[4];
                v292[2] = v292[5];
                v262 = v106;
                objc_msgSend(v106, "setTransform:", v292);
                v276 = self;
                v263 = v102;
                -[UITextSelectionDisplayInteraction _lollipopTransformForSelectionRect:view:](self, "_lollipopTransformForSelectionRect:view:", v102, v108);
                v291[0] = v291[3];
                v291[1] = v291[4];
                v291[2] = v291[5];
                v260 = v108;
                objc_msgSend(v108, "setTransform:", v291);
                if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_69;
                v110 = objc_loadWeakRetained((id *)p_textInput);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  v111 = objc_loadWeakRetained((id *)p_textInput);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v112 = objc_loadWeakRetained((id *)p_textInput);
                    NSProtocolFromString(CFSTR("BETextInput"));
                    v113 = v44;
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    v115 = objc_msgSend(v112, "conformsToProtocolCached:", v114);

                    v44 = v113;
                    if (v115)
                    {
                      v116 = objc_loadWeakRetained((id *)p_textInput);
                      objc_msgSend(v116, "performSelector:", sel_extendedTextInputTraits);
                      v117 = (void *)objc_claimAutoreleasedReturnValue();

                      if ((objc_opt_respondsToSelector() & 1) != 0)
                      {
                        objc_msgSend(v117, "performSelector:", sel_selectionHandleColor);
                        v118 = objc_claimAutoreleasedReturnValue();
                        goto LABEL_75;
                      }
                      goto LABEL_78;
                    }
LABEL_69:
                    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_79;
                    v117 = objc_loadWeakRetained((id *)p_textInput);
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      v119 = objc_loadWeakRetained((id *)p_textInput);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v120 = objc_loadWeakRetained((id *)p_textInput);
                        v121 = objc_msgSend(v120, "conformsToProtocolCached:", &unk_1EE09F2A0);

                        if (!v121)
                          goto LABEL_79;
                        v122 = objc_loadWeakRetained((id *)p_textInput);
                        objc_msgSend(v122, "extendedTraitsDelegate");
                        v117 = (void *)objc_claimAutoreleasedReturnValue();

                        if ((objc_opt_respondsToSelector() & 1) != 0)
                        {
                          objc_msgSend(v117, "selectionHandleColor");
                          v118 = objc_claimAutoreleasedReturnValue();
LABEL_75:
                          v123 = (void *)v118;

                          if (v123)
                          {
LABEL_96:
                            v142 = v123;
                            goto LABEL_103;
                          }
LABEL_79:
                          v124 = objc_loadWeakRetained((id *)p_textInput);
                          v125 = objc_opt_respondsToSelector();

                          if ((v125 & 1) != 0)
                          {
                            v126 = objc_loadWeakRetained((id *)p_textInput);
                            objc_msgSend(v126, "performSelector:", sel_selectionHandleColor);
                            v127 = (void *)objc_claimAutoreleasedReturnValue();

                            v128 = v127;
                            if (v127)
                              goto LABEL_106;
                          }
                          if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_89;
                          v129 = objc_loadWeakRetained((id *)p_textInput);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                          {
                            v130 = objc_loadWeakRetained((id *)p_textInput);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v131 = objc_loadWeakRetained((id *)p_textInput);
                              NSProtocolFromString(CFSTR("BETextInput"));
                              v132 = v44;
                              v133 = (void *)objc_claimAutoreleasedReturnValue();
                              v134 = objc_msgSend(v131, "conformsToProtocolCached:", v133);

                              v44 = v132;
                              if (v134)
                              {
                                v135 = objc_loadWeakRetained((id *)p_textInput);
                                objc_msgSend(v135, "performSelector:", sel_extendedTextInputTraits);
                                v136 = (void *)objc_claimAutoreleasedReturnValue();

                                if ((objc_opt_respondsToSelector() & 1) != 0)
                                {
                                  objc_msgSend(v136, "performSelector:", sel_selectionBarColor);
                                  v123 = (void *)objc_claimAutoreleasedReturnValue();
                                  v137 = v276;
                                  goto LABEL_95;
                                }
                                v137 = v276;
                                goto LABEL_99;
                              }
LABEL_89:
                              v137 = v276;
                              if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))goto LABEL_100;
                              v136 = objc_loadWeakRetained((id *)p_textInput);
                              if ((objc_opt_respondsToSelector() & 1) != 0)
                              {
                                v138 = objc_loadWeakRetained((id *)p_textInput);
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v139 = objc_loadWeakRetained((id *)p_textInput);
                                  v140 = objc_msgSend(v139, "conformsToProtocolCached:", &unk_1EE09F2A0);

                                  if (!v140)
                                    goto LABEL_100;
                                  v141 = objc_loadWeakRetained((id *)p_textInput);
                                  objc_msgSend(v141, "extendedTraitsDelegate");
                                  v136 = (void *)objc_claimAutoreleasedReturnValue();

                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                  {
                                    objc_msgSend(v136, "selectionBarColor");
                                    v123 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_95:

                                    if (v123)
                                      goto LABEL_96;
LABEL_100:
                                    v143 = objc_loadWeakRetained((id *)p_textInput);
                                    v144 = objc_opt_respondsToSelector();

                                    if ((v144 & 1) == 0
                                      || (v145 = objc_loadWeakRetained((id *)p_textInput),
                                          objc_msgSend(v145, "performSelector:", sel_selectionBarColor),
                                          v146 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v145,
                                          !v146))
                                    {
                                      +[UIColor selectionGrabberColor](UIColor, "selectionGrabberColor");
                                      v147 = (void *)objc_claimAutoreleasedReturnValue();
                                      -[UITextSelectionDisplayInteraction _tintColorOrDefault:](v137, "_tintColorOrDefault:", v147);
                                      v128 = (id)objc_claimAutoreleasedReturnValue();

                                      goto LABEL_105;
                                    }
                                    v142 = v146;
LABEL_103:
                                    v147 = v142;
                                    v128 = v142;
LABEL_105:

LABEL_106:
                                    v289 = 0u;
                                    v290 = 0u;
                                    v287 = 0u;
                                    v288 = 0u;
                                    -[_UITextSelectionRangeAdjustmentContainerView selectionGrabbers](v276->_rangeAdjustmentViewContainer, "selectionGrabbers");
                                    v148 = (void *)objc_claimAutoreleasedReturnValue();
                                    v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v287, v302, 16);
                                    if (v149)
                                    {
                                      v150 = v149;
                                      v151 = *(_QWORD *)v288;
                                      do
                                      {
                                        for (j = 0; j != v150; ++j)
                                        {
                                          if (*(_QWORD *)v288 != v151)
                                            objc_enumerationMutation(v148);
                                          objc_msgSend(*(id *)(*((_QWORD *)&v287 + 1) + 8 * j), "setTintColor:", v128);
                                        }
                                        v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v287, v302, 16);
                                      }
                                      while (v150);
                                    }

                                    if (-[_UITextSelectionRangeAdjustmentContainerView areSelectionGrabbersConcreteImpl](v276->_rangeAdjustmentViewContainer, "areSelectionGrabbersConcreteImpl"))
                                    {
                                      v258 = v4;
                                      +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle");
                                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v153, "minimumStemLength");
                                      v155 = v154;

                                      objc_msgSend(v265, "_startEdgeRect");
                                      v156 = CGRectGetHeight(v308);
                                      objc_msgSend(v264, "_enclosingScrollerIncludingSelf");
                                      v157 = objc_claimAutoreleasedReturnValue();
                                      v158 = (void *)v157;
                                      if (v157)
                                        v159 = (void *)v157;
                                      else
                                        v159 = v264;
                                      v160 = v159;

                                      v285 = 0u;
                                      v286 = 0u;
                                      v283 = 0u;
                                      v284 = 0u;
                                      -[_UITextSelectionRangeAdjustmentContainerView selectionGrabbers](v276->_rangeAdjustmentViewContainer, "selectionGrabbers");
                                      v270 = (id)objc_claimAutoreleasedReturnValue();
                                      v161 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v283, v301, 16);
                                      if (v161)
                                      {
                                        v162 = v161;
                                        v163 = *(_QWORD *)v284;
                                        v164 = -0.0;
                                        if (v155 - v156 > 0.0)
                                          v164 = (v155 - v156) * -2.0;
                                        dy = v164;
                                        do
                                        {
                                          v165 = 0;
                                          do
                                          {
                                            if (*(_QWORD *)v284 != v163)
                                              objc_enumerationMutation(v270);
                                            v166 = *(void **)(*((_QWORD *)&v283 + 1) + 8 * v165);
                                            objc_msgSend(v160, "visibleBounds");
                                            if ((*(_BYTE *)&v276->_textInputRespondsTo & 8) != 0)
                                            {
                                              v175 = objc_loadWeakRetained((id *)p_textInput);
                                              objc_msgSend(v175, "unobscuredContentRect");
                                              v177 = v176;
                                              v179 = v178;
                                              v181 = v180;
                                              v183 = v182;

                                              v184 = objc_loadWeakRetained((id *)p_textInput);
                                              objc_msgSend(v184, "textInputView");
                                              v185 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v160, "convertRect:fromView:", v185, v177, v179, v181, v183);
                                              v171 = v186;
                                              v172 = v187;
                                              v173 = v188;
                                              v174 = v189;

                                            }
                                            else
                                            {
                                              v171 = v167;
                                              v172 = v168;
                                              v173 = v169;
                                              v174 = v170;
                                            }
                                            objc_msgSend(v166, "dotViewFrame");
                                            objc_msgSend(v160, "convertRect:fromView:", v166);
                                            v191 = v190;
                                            v193 = v192;
                                            v195 = v194;
                                            v197 = v196;
                                            v198 = objc_loadWeakRetained((id *)&v276->_view);
                                            objc_msgSend(v198, "contentScaleFactor");
                                            v200 = UIRectIntegralWithScale(v191, v193, v195, v197, v199);
                                            v202 = v201;
                                            v204 = v203;
                                            v206 = v205;

                                            v309.origin.x = v200;
                                            v309.origin.y = v202;
                                            v309.size.width = v204;
                                            v309.size.height = v206;
                                            v310 = CGRectInset(v309, 0.0, dy);
                                            v207 = v310.origin.x;
                                            v208 = v310.origin.y;
                                            v209 = v310.size.width;
                                            v210 = v310.size.height;
                                            v310.origin.x = v171;
                                            v310.origin.y = v172;
                                            v310.size.width = v173;
                                            v310.size.height = v174;
                                            v323.origin.x = v207;
                                            v323.origin.y = v208;
                                            v323.size.width = v209;
                                            v323.size.height = v210;
                                            if (CGRectContainsRect(v310, v323))
                                              goto LABEL_134;
                                            v311.origin.x = v171;
                                            v311.origin.y = v172;
                                            v311.size.width = v173;
                                            v311.size.height = v174;
                                            v324.origin.x = v207;
                                            v324.origin.y = v208;
                                            v324.size.width = v209;
                                            v324.size.height = v210;
                                            v312 = CGRectIntersection(v311, v324);
                                            v211 = v312.origin.x;
                                            v212 = v312.origin.y;
                                            v213 = v312.size.width;
                                            v214 = v312.size.height;
                                            if (CGRectGetHeight(v312) <= 0.0)
                                            {
                                              v313.origin.x = v211;
                                              v313.origin.y = v212;
                                              v313.size.width = v213;
                                              v313.size.height = v214;
                                              if (CGRectGetWidth(v313) <= 0.0)
                                                goto LABEL_134;
                                            }
                                            if (objc_msgSend(v166, "direction") == 2)
                                              goto LABEL_132;
                                            v314.origin.x = v211;
                                            v314.origin.y = v212;
                                            v314.size.width = v213;
                                            v314.size.height = v214;
                                            MinY = CGRectGetMinY(v314);
                                            v315.origin.x = v207;
                                            v315.origin.y = v208;
                                            v315.size.width = v209;
                                            v315.size.height = v210;
                                            if (MinY == CGRectGetMinY(v315))
                                            {
LABEL_132:
                                              if (objc_msgSend(v166, "direction") == 8)
                                              {
                                                v215 = 1;
                                              }
                                              else
                                              {
                                                v316.origin.x = v211;
                                                v316.origin.y = v212;
                                                v316.size.width = v213;
                                                v316.size.height = v214;
                                                MaxY = CGRectGetMaxY(v316);
                                                v317.origin.x = v207;
                                                v317.origin.y = v208;
                                                v317.size.width = v209;
                                                v317.size.height = v210;
                                                v215 = MaxY == CGRectGetMaxY(v317);
                                              }
                                            }
                                            else
                                            {
LABEL_134:
                                              v215 = 0;
                                            }
                                            objc_msgSend(v166, "setPortalsDotToContainerWindow:", v215);
                                            ++v165;
                                          }
                                          while (v162 != v165);
                                          v217 = objc_msgSend(v270, "countByEnumeratingWithState:objects:count:", &v283, v301, 16);
                                          v162 = v217;
                                        }
                                        while (v217);
                                      }

                                      v4 = v258;
                                    }

                                    self = v276;
LABEL_141:
                                    -[UITextSelectionDisplayInteraction _caretRect](self, "_caretRect");
                                    v219 = v218;
                                    v221 = v220;
                                    v223 = v222;
                                    v225 = v224;
                                    -[UITextSelectionDisplayInteraction _cursorTintColor](self, "_cursorTintColor");
                                    v226 = (void *)objc_claimAutoreleasedReturnValue();
                                    if (IsNull)
                                    {
                                      v227 = 1;
                                      v228 = v219;
                                      v229 = v221;
                                      v230 = v223;
                                      v231 = v225;
                                    }
                                    else
                                    {
                                      -[UITextSelectionDisplayInteraction _selectionClipRectAt:](self, "_selectionClipRectAt:", 0);
                                      v325.origin.x = v219;
                                      v325.origin.y = v221;
                                      v325.size.width = v223;
                                      v325.size.height = v225;
                                      v319 = CGRectIntersection(v318, v325);
                                      v228 = v319.origin.x;
                                      v229 = v319.origin.y;
                                      v230 = v319.size.width;
                                      v231 = v319.size.height;
                                      if (!UIRectIsDiscrete(v319.origin.x, v319.origin.y, v319.size.width, v319.size.height))
                                      {
                                        -[UITextSelectionDisplayInteraction _isCursorVisible](self, "_isCursorVisible");
                                        goto LABEL_155;
                                      }
                                      v320.origin.x = v228;
                                      v320.origin.y = v229;
                                      v320.size.width = v230;
                                      v320.size.height = v231;
                                      v227 = !CGRectIsEmpty(v320);
                                    }
                                    if (-[UITextSelectionDisplayInteraction _isCursorVisible](self, "_isCursorVisible")
                                      && v227)
                                    {
                                      v271 = v225;
                                      dya = v223;
                                      v277 = v221;
                                      v281 = v219;
                                      -[UITextCursorView layer](self->_cursorView, "layer");
                                      v232 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v232, "anchorPoint");
                                      v234 = v233;
                                      v236 = v235;

                                      v237 = *MEMORY[0x1E0C9D538];
                                      v238 = *(double *)(MEMORY[0x1E0C9D538] + 8);
                                      v239 = v228 + v230 * v234;
                                      v240 = v229 + v231 * v236;
                                      if ((*(_BYTE *)&self->_delegateRespondsTo & 0x10) != 0)
                                      {
                                        -[UITextSelectionDisplayInteraction _internalDelegate](self, "_internalDelegate");
                                        v241 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v241, "_selectionViewManager:convertPointToRenderSpace:textRange:", self, v268, v239, v240);
                                        v239 = v242;
                                        v240 = v243;

                                      }
                                      -[UITextCursorView setBounds:](self->_cursorView, "setBounds:", v237, v238, v230, v231);
                                      -[UITextCursorView setCenter:](self->_cursorView, "setCenter:", v239, v240);
                                      -[UITextSelectionDisplayInteraction _caretTransform](self, "_caretTransform");
                                      cursorView = self->_cursorView;
                                      v282[0] = v282[3];
                                      v282[1] = v282[4];
                                      v282[2] = v282[5];
                                      -[UITextCursorView setTransform:](cursorView, "setTransform:", v282);
                                      -[UITextCursorView setHidden:](self->_cursorView, "setHidden:", 0);
                                      -[UITextCursorView setTintColor:](self->_cursorView, "setTintColor:", v226);
                                      -[UITextSelectionDisplayInteraction _cursorAlpha](self, "_cursorAlpha");
                                      -[UITextCursorView setAlpha:](self->_cursorView, "setAlpha:");
                                      -[UIStandardTextCursorView _setShapeScale:](self->_concreteCursorView, "_setShapeScale:", v266);
                                      v245 = v267;
                                      if (objc_msgSend(v4, "BOOLValue"))
                                        -[UITextCursorView resetBlinkAnimation](self->_cursorView, "resetBlinkAnimation");
                                      if (_AXSZoomTouchEnabled())
                                      {
                                        -[UITextCursorView bounds](self->_cursorView, "bounds");
                                        UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint, v321, (UIView *)self->_cursorView);
                                      }
                                      -[UITextSelectionDisplayInteraction _updateDictationUI](self, "_updateDictationUI");
                                      -[UITextSelectionDisplayInteraction _updateUnderlinesIfNeeded](self, "_updateUnderlinesIfNeeded");
                                      -[_UICursorAccessoryViewController setCursorRect:](self->_cursorAccessoryViewController, "setCursorRect:", v281, v277, dya, v271);
                                      -[_UICursorAccessoryViewController setSelectedRange:](self->_cursorAccessoryViewController, "setSelectedRange:", v268);
                                      -[_UICursorAccessoryViewController setSelectionRects:](self->_cursorAccessoryViewController, "setSelectionRects:", v44);
                                      -[_UICursorAccessoryViewController setAccessoryTintColor:](self->_cursorAccessoryViewController, "setAccessoryTintColor:", v226);
                                      goto LABEL_156;
                                    }
LABEL_155:
                                    -[UITextCursorView setHidden:](self->_cursorView, "setHidden:", 1);
                                    -[_UITextFloatingCursorSession _invalidate](self->_activeFloatingCursorSession, "_invalidate");
                                    activeFloatingCursorSession = self->_activeFloatingCursorSession;
                                    self->_activeFloatingCursorSession = 0;

                                    -[UITextSelectionDisplayInteraction _updateDictationUI](self, "_updateDictationUI");
                                    -[UITextSelectionDisplayInteraction _updateUnderlinesIfNeeded](self, "_updateUnderlinesIfNeeded");
                                    v245 = v267;
LABEL_156:
                                    v247 = -[UITextSelectionDisplayInteraction _isCursorAccessoryViewEnabled](self, "_isCursorAccessoryViewEnabled") ^ 1;
                                    -[UIViewController view](self->_cursorAccessoryViewController, "view");
                                    v248 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v248, "setHidden:", v247);

                                    -[UITextSelectionDisplayInteraction _contentBoundsForPlacement:](self, "_contentBoundsForPlacement:", 0);
                                    v250 = v249;
                                    v252 = v251;
                                    v254 = v253;
                                    v256 = v255;
                                    -[UIViewController view](self->_cursorAccessoryViewController, "view");
                                    v257 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v257, "setFrame:", v250, v252, v254, v256);

                                    self->_needsUpdate = 0;
                                    goto LABEL_157;
                                  }
                                }
                                else
                                {

                                }
                              }
LABEL_99:

                              goto LABEL_100;
                            }

                          }
                          goto LABEL_89;
                        }
                      }
                      else
                      {

                      }
                    }
LABEL_78:

                    goto LABEL_79;
                  }

                }
                goto LABEL_69;
              }
              v64 = v69;
LABEL_46:
              v70 = v64;
              v71 = v64;
              goto LABEL_48;
            }
          }
          else
          {

          }
        }
LABEL_42:

        goto LABEL_43;
      }

      v50 = &selRef_scrollYOffset;
    }

    goto LABEL_32;
  }
LABEL_157:

}

- (void)_setGlowViewMode:(int)a3
{
  self->_glowViewMode = a3;
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
}

- (void)setRangeViewMode:(int)a3
{
  self->_rangeViewMode = a3;
  -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
}

- (void)_addInteractiveUnderlines:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UITextSelectionDisplayInteraction _underlineView](self, "_underlineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addUnderlines:animated:", v6, v4);

}

- (void)_removeInteractiveUndelines:(id)a3 animiated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UITextSelectionDisplayInteraction _existingUnderlineView](self, "_existingUnderlineView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeUnderlines:animated:", v6, v4);

}

- (void)_removeAllInteractiveUnderlinesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextSelectionDisplayInteraction _existingUnderlineView](self, "_existingUnderlineView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAllUnderlinesAnimated:", v3);

}

- (id)_underlineRectsForRange:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id obj;
  id v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  objc_msgSend(WeakRetained, "_underlineRectsByDocumentLineForSelectionRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UITextSelectionDisplayInteraction textInput](self, "textInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textInputView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextSelectionDisplayInteraction _proofreadingUnderlineView](self, "_proofreadingUnderlineView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v14, "rect");
        objc_msgSend(v9, "convertRect:fromView:", v8);
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        objc_msgSend(v14, "baselineOffset");
        if (v23 == 0.0)
          v24 = v22 * 0.75;
        else
          v24 = v23;
        if (v14)
          objc_msgSend(v14, "transform");
        else
          memset(v30, 0, sizeof(v30));
        +[_UITextUnderlineRect underlineRectWithRect:offset:transform:](_UITextUnderlineRect, "underlineRectWithRect:offset:transform:", v30, v16, v18, v20, v22, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setAssociatedTextRange:", v4);
        -[UITextSelectionDisplayInteraction defaultUnderlineColor](self, "defaultUnderlineColor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setUnderlineColor:", v26);

        if (v25)
          objc_msgSend(v29, "addObject:", v25);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

  return v29;
}

- (id)_underlineTextInRange:(id)a3 animated:(BOOL)a4
{
  return -[UITextSelectionDisplayInteraction _underlineTextInRange:animated:preferredUUID:](self, "_underlineTextInRange:animated:preferredUUID:", a3, a4, 0);
}

- (id)_underlineTextInRange:(id)a3 animated:(BOOL)a4 preferredUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *proofreadingUnderlines;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (!self->_proofreadingUnderlines)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    proofreadingUnderlines = self->_proofreadingUnderlines;
    self->_proofreadingUnderlines = v10;

  }
  if (v9)
  {
    -[UITextSelectionDisplayInteraction _removeUnderlineWithIdentifier:animated:](self, "_removeUnderlineWithIdentifier:animated:", v9, 0);
    -[UITextSelectionDisplayInteraction _underlineRectsForRange:](self, "_underlineRectsForRange:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
  }
  else
  {
    -[UITextSelectionDisplayInteraction _underlineRectsForRange:](self, "_underlineRectsForRange:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  -[NSMutableDictionary setObject:forKey:](self->_proofreadingUnderlines, "setObject:forKey:", v12, v13);
  -[UITextSelectionDisplayInteraction _proofreadingUnderlineView](self, "_proofreadingUnderlineView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addUnderlines:animated:", v12, v6);

  return v14;
}

- (void)_removeUnderlineWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[NSMutableDictionary objectForKey:](self->_proofreadingUnderlines, "objectForKey:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_proofreadingUnderlines, "removeObjectForKey:", v8);
    -[UITextSelectionDisplayInteraction _proofreadingUnderlineView](self, "_proofreadingUnderlineView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeUnderlines:animated:", v6, v4);

  }
  if (!-[NSMutableDictionary count](self->_proofreadingUnderlines, "count"))
    -[UITextSelectionDisplayInteraction cleanUpProofreading](self, "cleanUpProofreading");

}

- (void)_removeAllProofreadingUnderlinesAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_proofreadingUnderlines, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        -[UITextSelectionDisplayInteraction _proofreadingUnderlineView](self, "_proofreadingUnderlineView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeUnderlines:animated:", v10, v3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSMutableDictionary removeAllObjects](self->_proofreadingUnderlines, "removeAllObjects");
  -[UITextSelectionDisplayInteraction cleanUpProofreading](self, "cleanUpProofreading");
}

- (void)_updateUnderlinesIfNeeded
{
  if (-[NSMutableDictionary count](self->_proofreadingUnderlines, "count"))
    -[UITextSelectionDisplayInteraction _updateAnimatedUnderlinesIfNeeded](self, "_updateAnimatedUnderlinesIfNeeded");
}

- (void)_updateAnimatedUnderlinesIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_proofreadingUnderlines, "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMutableDictionary allKeys](self->_proofreadingUnderlines, "allKeys", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_proofreadingUnderlines, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
          {
            objc_msgSend(v9, "firstObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "associatedTextRange");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            -[UITextSelectionDisplayInteraction _underlineRectsForRange:](self, "_underlineRectsForRange:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v13)
            {
              if ((objc_msgSend(v13, "isEqual:", v10) & 1) == 0)
              {
                -[UITextSelectionDisplayInteraction _proofreadingUnderlineView](self, "_proofreadingUnderlineView");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "removeUnderlines:animated:", v10, 0);

                -[NSMutableDictionary setObject:forKey:](self->_proofreadingUnderlines, "setObject:forKey:", v14, v8);
                -[UITextSelectionDisplayInteraction _proofreadingUnderlineView](self, "_proofreadingUnderlineView");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "addUnderlines:animated:", v14, 0);

              }
            }

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v5);
    }

  }
}

- (void)cleanUpProofreading
{
  _UITextUnderlineView *proofreadingUnderlineView;

  -[UIView removeFromSuperview](self->_proofreadingUnderlineView, "removeFromSuperview");
  proofreadingUnderlineView = self->_proofreadingUnderlineView;
  self->_proofreadingUnderlineView = 0;

}

- (id)defaultUnderlineColor
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[UITextSelectionDisplayInteraction textInput](self, "textInput");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[UITextSelectionDisplayInteraction textInput](self, "textInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertionPointColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[UITextSelectionDisplayInteraction view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_6:
      +[UIColor insertionPointColor](UIColor, "insertionPointColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    -[UITextSelectionDisplayInteraction view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tintColor");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  if (!v8)
    goto LABEL_6;
  return v8;
}

- (NSArray)_preferredLayoutRectsForEditMenu
{
  return 0;
}

- (BOOL)_shouldHitTestSelectionGrabbers
{
  void *v3;
  char v4;

  if ((self->_rangeViewMode & 0xFFFFFFFE) == 4)
    return 0;
  -[UITextSelectionDisplayInteraction _selectedRange](self, "_selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isRanged");

  return v4;
}

- (id)_beginFloatingCursorSessionAtPoint:(CGPoint)a3 inContainer:(id)a4
{
  double y;
  double x;
  id v7;
  _UITextFloatingCursorSession *activeFloatingCursorSession;
  _UITextFloatingCursorSession *v9;
  _UITextFloatingCursorSession *v10;
  _UITextFloatingCursorSession *v11;
  _UITextFloatingCursorSession *v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  activeFloatingCursorSession = self->_activeFloatingCursorSession;
  if (activeFloatingCursorSession)
  {
    -[_UITextFloatingCursorSession _invalidate](activeFloatingCursorSession, "_invalidate");
    v9 = self->_activeFloatingCursorSession;
    self->_activeFloatingCursorSession = 0;

  }
  v10 = -[_UITextFloatingCursorSession initWithCursorView:selectionManager:]([_UITextFloatingCursorSession alloc], "initWithCursorView:selectionManager:", self->_concreteCursorView, self);
  v11 = self->_activeFloatingCursorSession;
  self->_activeFloatingCursorSession = v10;

  -[_UITextFloatingCursorSession updateWithPoint:inContainer:animated:](self->_activeFloatingCursorSession, "updateWithPoint:inContainer:animated:", v7, 1, x, y);
  v12 = self->_activeFloatingCursorSession;

  return v12;
}

- (BOOL)_clientManagesSelectionViewSubviewOrder
{
  UITextInput **p_textInput;
  id WeakRetained;
  id v4;
  void *v5;
  BOOL v6;

  p_textInput = &self->_textInput;
  WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)p_textInput);
    objc_msgSend(v4, "selectionContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_filterArchivedSubviews:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UITextSelectionDisplayInteraction _allManagedSubviews](self, "_allManagedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minusSet:", v5);

  }
}

- (BOOL)_isManagedSelectionSubview:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[UITextSelectionDisplayInteraction _allManagedSubviews](self, "_allManagedSubviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "containsView:", v4) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CGRect)_textRangeAdjustmentRectForEdge:(unint64_t)a3 selectionRects:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (a3)
    +[UITextSelectionRect endEdgeFromRects:](UITextSelectionRect, "endEdgeFromRects:", a4);
  else
    +[UITextSelectionRect startEdgeFromRects:](UITextSelectionRect, "startEdgeFromRects:", a4);
  -[UIView convertRect:fromView:](self->_rangeAdjustmentViewContainer, "convertRect:fromView:", self->_highlightView);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_grabberDotRectForTextRangeAdjustmentEdgeRect:(CGRect)a3 isVertical:(BOOL)a4 direction:(unint64_t)a5
{
  _BOOL4 v6;
  double y;
  double x;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v6 = a4;
  y = a3.origin.y;
  x = a3.origin.x;
  +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dotSizeWithEngagedEffect:", 0);
  v11 = v10;

  +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minimumStemLength");
  v14 = v13;

  v15 = -v14;
  v16 = v11 * 0.5;
  if (a5 == 4)
    v17 = -v14;
  else
    v17 = v14;
  v18 = x + v17;
  if (a5 != 2)
    v15 = v14;
  v19 = y + v15;
  v20 = x - v16;
  if (v6)
    v21 = v19;
  else
    v21 = y - v16;
  if (v6)
    v22 = v20;
  else
    v22 = v18;
  v23 = v11;
  v24 = v11;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v21;
  result.origin.x = v22;
  return result;
}

- (BOOL)_isDisplayingVerticalSelection
{
  return -[_UITextSelectionRangeAdjustmentContainerView isVertical](self->_rangeAdjustmentViewContainer, "isVertical");
}

- (BOOL)_isVisible
{
  _BOOL4 v3;

  v3 = -[UITextSelectionDisplayInteraction _isCursorVisible](self, "_isCursorVisible");
  if (v3)
    LOBYTE(v3) = !self->_selectionUIHiddenForAssertion;
  return v3;
}

- (void)_didBeginRangeAdjustmentInteraction:(id)a3
{
  _BOOL4 v4;
  void *v5;
  char v6;
  _UITextSelectionRangeAdjustmentContainerView *rangeAdjustmentViewContainer;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[_UITextSelectionRangeAdjustmentContainerView areSelectionGrabbersConcreteImpl](self->_rangeAdjustmentViewContainer, "areSelectionGrabbersConcreteImpl");
  v5 = v9;
  if (v4)
  {
    v6 = objc_msgSend(v9, "baseIsStart");
    rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
    if ((v6 & 1) != 0)
      -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](rangeAdjustmentViewContainer, "trailingLollipopView");
    else
      -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](rangeAdjustmentViewContainer, "leadingLollipopView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEngaged:", 1);

    v5 = v9;
  }

}

- (void)_didEndRangeAdjustmentInteraction:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[_UITextSelectionRangeAdjustmentContainerView areSelectionGrabbersConcreteImpl](self->_rangeAdjustmentViewContainer, "areSelectionGrabbersConcreteImpl", a3))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[_UITextSelectionRangeAdjustmentContainerView selectionGrabbers](self->_rangeAdjustmentViewContainer, "selectionGrabbers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setEngaged:", 0);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (UIEdgeInsets)_paddedEdgeInsetsForGrabberDirection:(unint64_t)a3 isVertical:(BOOL)a4 scale:(double)a5
{
  _BOOL4 v6;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  v6 = a4;
  +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "smallPaddedInset");
  v10 = v9;

  +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bigPaddedInset");
  v13 = v12;

  +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "useGrabberDotsForSelection");

  if (!v6)
  {
    v16 = v10 / a5;
    v17 = v13 / a5;
    if ((v15 & 1) == 0)
    {
      if (a3 == 4)
        v19 = v16 + v17;
      else
        v19 = v10 / a5;
      if (a3 != 4)
        v16 = v16 + v17;
      goto LABEL_16;
    }
LABEL_10:
    v19 = v16;
LABEL_16:
    v18 = v17;
    goto LABEL_17;
  }
  v16 = v13 / a5;
  v17 = v10 / a5;
  if ((v15 & 1) != 0)
    goto LABEL_10;
  if (a3 == 2)
    v18 = v17 + v16;
  else
    v18 = v10 / a5;
  if (a3 != 2)
    v17 = v17 + v16;
  v19 = v13 / a5;
LABEL_17:
  result.right = v16;
  result.bottom = v17;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGRect)textRangeAdjustmentRectForEdge:(unint64_t)a3
{
  void *v5;
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
  double v16;
  double v17;
  CGRect result;

  -[UITextSelectionHighlightView selectionRects](self->_highlightView, "selectionRects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelectionDisplayInteraction _textRangeAdjustmentRectForEdge:selectionRects:](self, "_textRangeAdjustmentRectForEdge:selectionRects:", a3, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)paddedTextRangeAdjustmentHitRegionForEdge:(unint64_t)a3 precision:(unint64_t)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id WeakRetained;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double x;
  double y;
  double width;
  double height;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  if (-[UITextSelectionDisplayInteraction _shouldHitTestSelectionGrabbers](self, "_shouldHitTestSelectionGrabbers"))
  {
    -[UITextSelectionDisplayInteraction textRangeAdjustmentRectForEdge:](self, "textRangeAdjustmentRectForEdge:", a3);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[UITextSelectionDisplayInteraction textRangeAdjustmentViewForEdge:](self, "textRangeAdjustmentViewForEdge:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UITextSelectionLollipopView _visualStyle](_UITextSelectionLollipopView, "_visualStyle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "useGrabberDotsForSelection");

    v18 = v14;
    v19 = v12;
    v20 = v10;
    v21 = v8;
    if (v17)
    {
      -[UITextSelectionDisplayInteraction _grabberDotRectForTextRangeAdjustmentEdgeRect:isVertical:direction:](self, "_grabberDotRectForTextRangeAdjustmentEdgeRect:isVertical:direction:", objc_msgSend(v15, "isVertical"), objc_msgSend(v15, "direction"), v8, v10, v12, v14);
      v21 = v22;
      v20 = v23;
    }
    v43 = v19;
    v44 = v18;
    WeakRetained = objc_loadWeakRetained((id *)&self->_textInput);
    objc_msgSend(WeakRetained, "textInputView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_scaleFromLayerTransforms");
    v27 = v26;
    v29 = v28;

    if (v27 < 1.0)
      v27 = 1.0;
    if (a4 == 2)
    {
      if (v29 >= 1.0)
        v30 = -6.0 / v29;
      else
        v30 = -6.0;
      v45.origin.x = v8;
      v45.origin.y = v10;
      v45.size.width = v12;
      v45.size.height = v14;
      v46 = CGRectInset(v45, -6.0 / v27, v30);
      x = v46.origin.x;
      y = v46.origin.y;
      width = v46.size.width;
      height = v46.size.height;
    }
    else
    {
      -[UITextSelectionDisplayInteraction _paddedEdgeInsetsForGrabberDirection:isVertical:scale:](self, "_paddedEdgeInsetsForGrabberDirection:isVertical:scale:", objc_msgSend(v15, "direction"), objc_msgSend(v15, "isVertical"), v27);
      x = v21 + v35;
      y = v20 + v36;
      width = v43 - (v35 + v37);
      height = v44 - (v36 + v38);
    }

  }
  else
  {
    x = *MEMORY[0x1E0C9D628];
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (id)textRangeAdjustmentViewForEdge:(unint64_t)a3
{
  _UITextSelectionRangeAdjustmentContainerView *rangeAdjustmentViewContainer;

  rangeAdjustmentViewContainer = self->_rangeAdjustmentViewContainer;
  if (a3)
    -[_UITextSelectionRangeAdjustmentContainerView trailingLollipopView](rangeAdjustmentViewContainer, "trailingLollipopView");
  else
    -[_UITextSelectionRangeAdjustmentContainerView leadingLollipopView](rangeAdjustmentViewContainer, "leadingLollipopView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setCursorFadedHiddenForFloatingCursor:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_cursorFadedHiddenForFloatingCursor != a3)
  {
    self->_cursorFadedHiddenForFloatingCursor = a3;
    if (a4)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __85__UITextSelectionDisplayInteraction__setCursorFadedHiddenForFloatingCursor_animated___block_invoke;
      v4[3] = &unk_1E16B1B28;
      v4[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 117440512, v4, 0, 0.15, 0.0);
    }
    else
    {
      -[UITextSelectionDisplayInteraction layoutManagedSubviews](self, "layoutManagedSubviews");
    }
  }
}

uint64_t __85__UITextSelectionDisplayInteraction__setCursorFadedHiddenForFloatingCursor_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutManagedSubviews");
}

- (id)_obtainShimmerHighlightAssertion
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 3, 1, CFSTR("Shimmer Highlight assertion"), 0);
}

- (id)_obtainGrabberSuppressionAssertion
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:](self->_assertionController, "vendAssertionOfType:initialState:reason:requiresExplicitInvalidation:", 0, 1, CFSTR("Generic grabber suppression"), 0);
}

- (id)_obtainSelectionUIHiddenAssertionForReason:(id)a3 animated:(BOOL)a4
{
  self->_shouldAnimateSelectionUIHiddenAssertionState = a4;
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:](self->_assertionController, "vendAssertionOfType:initialState:reason:", 4, 1, a3);
}

- (id)_obtainGhostCursorAssertion
{
  void *v2;
  void *v3;

  -[UITextSelectionDisplayInteraction _cursorAssertionController](self, "_cursorAssertionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonBlinkingGhostAssertionWithReason:", CFSTR("Generic ghost assertion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)obtainBlinkSuppressionAssertionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITextSelectionDisplayInteraction _cursorAssertionController](self, "_cursorAssertionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonBlinkingAssertionWithReason:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  BOOL result;
  uint64_t v5;

  result = 0;
  v5 = 21;
  switch(a3)
  {
    case 0uLL:
      if (!-[_UITextSelectionRangeAdjustmentContainerView areSelectionGrabbersHidden](self->_rangeAdjustmentViewContainer, "areSelectionGrabbersHidden"))goto LABEL_4;
      return 1;
    case 1uLL:
      goto LABEL_6;
    case 3uLL:
LABEL_4:
      v5 = 25;
      goto LABEL_6;
    case 4uLL:
      v5 = 26;
LABEL_6:
      result = *((_BYTE *)&self->super.isa + v5) != 0;
      break;
    default:
      return result;
  }
  return result;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  _QWORD v5[5];

  switch(a4)
  {
    case 0uLL:
      -[_UITextSelectionRangeAdjustmentContainerView setSelectionGrabbersHidden:](self->_rangeAdjustmentViewContainer, "setSelectionGrabbersHidden:", a3);
      break;
    case 1uLL:
      self->_cursorAccessoryViewHidden = a3;
      -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
      break;
    case 3uLL:
      self->_shouldDisplayShimmerHighlights = a3;
      -[_UITextSelectionRangeAdjustmentContainerView setSelectionGrabbersHidden:](self->_rangeAdjustmentViewContainer, "setSelectionGrabbersHidden:");
      -[UITextSelectionDisplayInteraction _updateHighlightViewWithShimmerState](self, "_updateHighlightViewWithShimmerState");
      break;
    case 4uLL:
      self->_selectionUIHiddenForAssertion = a3;
      -[UITextSelectionDisplayInteraction setNeedsSelectionUpdate](self, "setNeedsSelectionUpdate");
      if (self->_shouldAnimateSelectionUIHiddenAssertionState)
      {
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __84__UITextSelectionDisplayInteraction_assertionActivationStateChangedToState_forType___block_invoke;
        v5[3] = &unk_1E16B1B28;
        v5[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v5, 0, 0.15, 0.0);
      }
      break;
    default:
      return;
  }
}

uint64_t __84__UITextSelectionDisplayInteraction_assertionActivationStateChangedToState_forType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSelectionIfNeeded");
}

- (id)_obtainHideCursorAccessoriesAssertionWithReason:(id)a3
{
  return -[_UIAssertionController vendAssertionOfType:initialState:reason:](self->_assertionController, "vendAssertionOfType:initialState:reason:", 1, 1, a3);
}

- (int)_glowViewMode
{
  return self->_glowViewMode;
}

- (_UITextSelectionHighlightView)_highlightView
{
  return self->_concreteHighlightView;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (int)rangeViewMode
{
  return self->_rangeViewMode;
}

- (CGRect)textSelectionMenuSourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textSelectionMenuSourceRect.origin.x;
  y = self->_textSelectionMenuSourceRect.origin.y;
  width = self->_textSelectionMenuSourceRect.size.width;
  height = self->_textSelectionMenuSourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)set_dictationBlinkSuppressionAssertion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 240), a2);
}

- (void)setCursorPortalInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_cursorPortalInteraction, a3);
}

- (void)setTrailingPortalInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPortalInteraction, a3);
}

- (void)set_isDictationRunning:(BOOL)a3
{
  self->__isDictationRunning = a3;
}

- (void)setGhostAppearance:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UITextSelectionDisplayInteraction _cursorView](self, "_cursorView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGhostEffectEnabled:", v3);

}

- (unint64_t)activeIndicators
{
  return self->_activeIndicators;
}

- (void)clearDeleteButtonCursorAssertion
{
  UITextCursorAssertion *showDeleteButtonCursorAssertion;

  -[UITextCursorAssertion invalidate](self->_showDeleteButtonCursorAssertion, "invalidate");
  showDeleteButtonCursorAssertion = self->_showDeleteButtonCursorAssertion;
  self->_showDeleteButtonCursorAssertion = 0;

}

- (id)inputModeForDictationLanguage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyboardLanguageForDictationLanguage:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v3;
  v8 = v7;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeInputModes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
LABEL_6:
    v15 = 0;
    v16 = v13;
    while (1)
    {
      if (*(_QWORD *)v21 != v14)
        objc_enumerationMutation(v10);
      v13 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v15);

      objc_msgSend(v13, "languageWithRegion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v8, "isEqualToString:", v17);

      if ((v18 & 1) != 0)
        break;
      ++v15;
      v16 = v13;
      if (v12 == v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          goto LABEL_6;

        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    v13 = 0;
  }

  return v13;
}

- (void)setActiveIndicators:(unint64_t)a3
{
  -[UITextSelectionDisplayInteraction setActiveIndicators:animationStyle:](self, "setActiveIndicators:animationStyle:", a3, 1);
}

uint64_t __84__UITextSelectionDisplayInteraction_Assertions__setActiveIndicators_animationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputModeWithIdentifier:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEmojiInputMode") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "primaryLanguage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((UIKeyboardInputModeIsNonLinguistic(v6) & 1) != 0)
      v5 = 0;
    else
      v5 = objc_msgSend(v4, "isExtensionInputMode") ^ 1;

  }
  return v5;
}

void __84__UITextSelectionDisplayInteraction_Assertions__setActiveIndicators_animationStyle___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  char v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "isVisible");

  if ((v4 & 1) == 0)
  {
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "setAccessories:animated:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)_cursorAccessoryViewController:(id)a3 didActivateCursorAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  UITextCursorAssertion *showInputModesCursorAssertion;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  UITextCursorAssertion *v28;
  UITextCursorAssertion *v29;
  void *v30;
  UITextCursorAssertion *v31;
  UITextCursorAssertion *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t);
  void *v47;
  id v48;
  uint64_t *v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "_inputModeCursorAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "dictationLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    showInputModesCursorAssertion = self->_showInputModesCursorAssertion;
    if (v10)
    {
      if (showInputModesCursorAssertion)
      {
        +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "activeDictationLanguage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "dictationLanguage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v13);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, v16);

          v51 = 0;
          v52 = &v51;
          v53 = 0x3032000000;
          v54 = __Block_byref_object_copy__174;
          v55 = __Block_byref_object_dispose__174;
          v56 = 0;
          v17 = objc_loadWeakRetained(&location);
          objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = MEMORY[0x1E0C809B0];
          v45 = 3221225472;
          v46 = __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke;
          v47 = &unk_1E16D66D0;
          v48 = v9;
          objc_copyWeak(&v50, &location);
          v49 = &v51;
          objc_msgSend(v17, "addObserverForName:object:queue:usingBlock:", CFSTR("UIDictationControllerDictationDidFinish"), 0, v18, &v44);
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v52[5];
          v52[5] = v19;

          if (+[UIDictationController isRunning](UIDictationController, "isRunning", v44, v45, v46, v47))
          {
            +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setSwitchingLanguage:", 1);

            +[UIDictationController activeInstance](UIDictationController, "activeInstance");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setReasonType:", 28);

            +[UIDictationController activeInstance](UIDictationController, "activeInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "cancelDictation");

          }
          _Block_object_dispose(&v51, 8);

          objc_destroyWeak(&v50);
          objc_destroyWeak(&location);
        }
        -[UITextSelectionDisplayInteraction clearInputModeCursorAssertion](self, "clearInputModeCursorAssertion");
      }
      else
      {
        -[UITextSelectionDisplayInteraction _cursorAssertionController](self, "_cursorAssertionController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "inputModeSelectorAssertionWithReason:userInfo:", CFSTR("Show input modes"), MEMORY[0x1E0C9AA70]);
        v28 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
        v29 = self->_showInputModesCursorAssertion;
        self->_showInputModesCursorAssertion = v28;

      }
    }
    else
    {
      if (showInputModesCursorAssertion)
      {
        +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "inputModeIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "inputModeWithIdentifier:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setKeyboardInputMode:userInitiated:", v26, 1);

        -[UITextSelectionDisplayInteraction clearInputModeCursorAssertion](self, "clearInputModeCursorAssertion");
        goto LABEL_14;
      }
      -[UITextSelectionDisplayInteraction _cursorAssertionController](self, "_cursorAssertionController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "inputModeSelectorAssertionWithReason:userInfo:", CFSTR("Show input modes"), MEMORY[0x1E0C9AA70]);
      v31 = (UITextCursorAssertion *)objc_claimAutoreleasedReturnValue();
      v32 = self->_showInputModesCursorAssertion;
      self->_showInputModesCursorAssertion = v31;

      +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "inputModeIndicatorController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "inputModeSelectorDidOpen");

    }
  }
LABEL_14:
  objc_msgSend(v7, "identifier");
  v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v34 == CFSTR("dic"))
  {
    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setReasonType:", 29);

    +[UIDictationController activeInstance](UIDictationController, "activeInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stopDictation");

    -[UITextSelectionDisplayInteraction clearInputModeCursorAssertion](self, "clearInputModeCursorAssertion");
  }
  objc_msgSend(v7, "identifier");
  v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v37 == CFSTR("del"))
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "inputDelegateManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "deleteBackward");

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "dismissDictationMenu");

    -[UITextSelectionDisplayInteraction clearDeleteButtonCursorAssertion](self, "clearDeleteButtonCursorAssertion");
  }
  objc_msgSend(v7, "_modifierKeyCursorAccessory");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "modifierType");

  if (v42 == 2)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "_resetCapsLock");

  }
}

void __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  id WeakRetained;
  _QWORD block[4];
  id v5;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke_2;
  block[3] = &unk_1E16B1B28;
  v5 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "removeObserver:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __107__UITextSelectionDisplayInteraction_Assertions___cursorAccessoryViewController_didActivateCursorAccessory___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dictationLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:](UIDictationInputModeOptions, "dictationInputModeOptionsWithInvocationSource:", CFSTR("UIDictationInputModeInvocationSourceDictationPopUpUILanguageSwitcherIcon"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switchToDictationLanguage:inputOptions:", v3, v4);

  +[UIDictationView sharedInstance](UIDictationView, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSwitchingLanguage:", 0);

}

@end
