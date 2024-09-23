@implementation UIMultiSelectInteraction

- (void)willMoveToView:(id)a3
{
  UIView **p_view;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  id v9;

  if (!a3)
  {
    p_view = &self->_view;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    objc_msgSend(WeakRetained, "removeGestureRecognizer:", self->_multiSelectModePan);

    v6 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v6, "removeGestureRecognizer:", self->_multiFingerPan);

    v7 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v7, "removeGestureRecognizer:", self->_multiFingerTap);

    v8 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v8, "removeGestureRecognizer:", self->_singleFingerExtensionTap);

    v9 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v9, "removeInteraction:", self->_bandSelectionInteraction);

  }
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (UIMultiSelectInteraction)init
{
  UIMultiSelectInteraction *v2;
  _UIMultiSelectOneFingerPanGesture *v3;
  UIPanGestureRecognizer *v4;
  void *v5;
  UITapGestureRecognizer *v6;
  void *v7;
  _UISingleFingerTapExtensionGesture *v8;
  UIBandSelectionInteraction *v9;
  uint64_t v10;
  uint64_t v11;
  UIBandSelectionInteraction *bandSelectionInteraction;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)UIMultiSelectInteraction;
  v2 = -[UIMultiSelectInteraction init](&v21, sel_init);
  if (v2)
  {
    v3 = -[UIPanGestureRecognizer initWithTarget:action:]([_UIMultiSelectOneFingerPanGesture alloc], "initWithTarget:action:", v2, sel__handleCommonPanGestureStateChanged_);
    -[UIGestureRecognizer setName:](v3, "setName:", CFSTR("com.apple.UIKit.multi-select.singleFingerPanGesture"));
    -[UIPanGestureRecognizer setDelegate:](v3, "setDelegate:", v2);
    -[_UIMultiSelectOneFingerPanGesture setOneFingerPanDelegate:](v3, "setOneFingerPanDelegate:", v2);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v3, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer _setHysteresis:](v3, "_setHysteresis:", 5.0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v3, "setDelaysTouchesEnded:", 0);
    objc_storeStrong((id *)&v2->_multiSelectModePan, v3);
    v4 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", v2, sel__handleCommonPanGestureStateChanged_);
    -[UIGestureRecognizer setName:](v4, "setName:", CFSTR("com.apple.UIKit.multi-select.multiFingerPanGesture"));
    -[UIPanGestureRecognizer setDelegate:](v4, "setDelegate:", v2);
    -[UIPanGestureRecognizer setMinimumNumberOfTouches:](v4, "setMinimumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v4, "setMaximumNumberOfTouches:", 2);
    -[UIPanGestureRecognizer _setFailsPastHysteresisWithoutMinTouches:](v4, "_setFailsPastHysteresisWithoutMinTouches:", 1);
    -[UIPanGestureRecognizer _setHysteresis:](v4, "_setHysteresis:", 0.0);
    -[UIGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
    -[UIPanGestureRecognizer _setRequiresImmediateMultipleTouches:](v4, "_setRequiresImmediateMultipleTouches:", 1);
    -[UIPanGestureRecognizer _setAllowableTouchTimeSeparation:](v4, "_setAllowableTouchTimeSeparation:", 0.06);
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allowableSeparation");
    -[UIPanGestureRecognizer _setAllowableSeparation:](v4, "_setAllowableSeparation:");

    -[UIGestureRecognizer _setAnalyticsGestureHandled:](v4, "_setAnalyticsGestureHandled:", 1);
    objc_storeStrong((id *)&v2->_multiFingerPan, v4);
    v6 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", v2, sel__multiFingerTapGesture_);
    -[UIGestureRecognizer setName:](v6, "setName:", CFSTR("com.apple.UIKit.multi-select.multiFingerTapGesture"));
    -[UIGestureRecognizer setDelegate:](v6, "setDelegate:", v2);
    -[UITapGestureRecognizer setAllowableMovement:](v6, "setAllowableMovement:", 60.0);
    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allowableSeparation");
    -[UITapGestureRecognizer _setAllowableSeparation:](v6, "_setAllowableSeparation:");

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v6, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v6, "setNumberOfTouchesRequired:", 2);
    -[UITapGestureRecognizer _setAllowableTouchTimeSeparation:](v6, "_setAllowableTouchTimeSeparation:", 0.06);
    -[UITapGestureRecognizer setMaximumTapDuration:](v6, "setMaximumTapDuration:", 0.13);
    -[UIGestureRecognizer _setAnalyticsGestureHandled:](v6, "_setAnalyticsGestureHandled:", 1);
    objc_storeStrong((id *)&v2->_multiFingerTap, v6);
    v8 = -[UITapGestureRecognizer initWithTarget:action:]([_UISingleFingerTapExtensionGesture alloc], "initWithTarget:action:", v2, sel__handleSelectionExtensionTapGesture_);
    -[UIGestureRecognizer setName:](v8, "setName:", CFSTR("com.apple.UIKit.multi-select.singleFingerExtension"));
    -[UIGestureRecognizer setDelegate:](v8, "setDelegate:", v2);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v8, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v8, "setNumberOfTouchesRequired:", 1);
    objc_storeStrong((id *)&v2->_singleFingerExtensionTap, v8);
    objc_initWeak(&location, v2);
    v9 = [UIBandSelectionInteraction alloc];
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __32__UIMultiSelectInteraction_init__block_invoke;
    v18[3] = &unk_1E16EDAB0;
    objc_copyWeak(&v19, &location);
    v11 = -[UIBandSelectionInteraction initWithSelectionHandler:](v9, "initWithSelectionHandler:", v18);
    bandSelectionInteraction = v2->_bandSelectionInteraction;
    v2->_bandSelectionInteraction = (UIBandSelectionInteraction *)v11;

    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __32__UIMultiSelectInteraction_init__block_invoke_2;
    v16[3] = &unk_1E16EDAD8;
    objc_copyWeak(&v17, &location);
    -[UIBandSelectionInteraction setShouldBeginHandler:](v2->_bandSelectionInteraction, "setShouldBeginHandler:", v16);
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __32__UIMultiSelectInteraction_init__block_invoke_3;
    v14[3] = &unk_1E16E2F28;
    objc_copyWeak(&v15, &location);
    -[UIBandSelectionInteraction _setBandVisibilityHandler:](v2->_bandSelectionInteraction, "_setBandVisibilityHandler:", v14);
    v2->_activeGestureType = 8;
    v2->_enabled = 1;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[UIMultiSelectInteraction _updateDelegateConformance](self, "_updateDelegateConformance");
}

- (void)_updateDelegateConformance
{
  UIMultiSelectInteractionDelegate **p_delegate;
  id WeakRetained;
  id v5;
  id v6;
  __int16 v7;
  id v8;
  id v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  __int16 v31;
  id v32;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    self->_delegateConformsToProtocol = objc_msgSend(v5, "conformsToProtocol:", &unk_1EDF2C8A0);

  }
  else
  {
    self->_delegateConformsToProtocol = 0;
  }

  v6 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = 16;
  else
    v7 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFEF | v7;

  v8 = objc_loadWeakRetained((id *)p_delegate);
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

  v9 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = 2;
  else
    v10 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFFD | v10;

  v11 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = 4;
  else
    v12 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFFB | v12;

  v13 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = 4096;
  else
    v14 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xEFFF | v14;

  v15 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v16 = 8;
  else
    v16 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFF7 | v16;

  v17 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = 512;
  else
    v18 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFDFF | v18;

  v19 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = 1024;
  else
    v20 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFBFF | v20;

  v21 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v22 = 2048;
  else
    v22 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xF7FF | v22;

  v23 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v24 = 0x2000;
  else
    v24 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xDFFF | v24;

  v25 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v26 = 32;
  else
    v26 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFDF | v26;

  v27 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v28 = 64;
  else
    v28 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFBF | v28;

  v29 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v30 = 128;
  else
    v30 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFF7F | v30;

  v32 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = 256;
  else
    v31 = 0;
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFEFF | v31;

}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  id v5;
  id WeakRetained;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  p_view = &self->_view;
  v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(WeakRetained, "addGestureRecognizer:", self->_multiSelectModePan);

    v7 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v7, "addGestureRecognizer:", self->_multiFingerTap);

    v8 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v8, "addGestureRecognizer:", self->_multiFingerPan);

    v9 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v9, "addGestureRecognizer:", self->_singleFingerExtensionTap);

    -[UIGestureRecognizer requireGestureRecognizerToFail:](self->_multiFingerTap, "requireGestureRecognizerToFail:", self->_multiFingerPan);
    v10 = objc_loadWeakRetained((id *)p_view);
    objc_msgSend(v10, "addInteraction:", self->_bandSelectionInteraction);

    v11 = objc_loadWeakRetained((id *)p_view);
    objc_opt_class();
    self->_isScrollView = objc_opt_isKindOfClass() & 1;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bandSelectionInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_singleFingerExtensionTap, 0);
  objc_storeStrong((id *)&self->_multiFingerTap, 0);
  objc_storeStrong((id *)&self->_multiFingerPan, 0);
  objc_storeStrong((id *)&self->_multiSelectModePan, 0);
  objc_storeStrong((id *)&self->_extendToCellLeftCommand, 0);
  objc_storeStrong((id *)&self->_extendToCellRightCommand, 0);
  objc_storeStrong((id *)&self->_extendToCellBelowCommand, 0);
  objc_storeStrong((id *)&self->_extendToCellAboveCommand, 0);
}

- (void)setSingleTouchPanGestureHysteresis:(double)a3
{
  -[UIPanGestureRecognizer _setHysteresis:](self->_multiSelectModePan, "_setHysteresis:", a3);
}

- (id)keyCommandsForSelectionExtension
{
  UIKeyCommand *v3;
  UIKeyCommand *extendToCellAboveCommand;
  UIKeyCommand *v5;
  UIKeyCommand *extendToCellBelowCommand;
  UIKeyCommand *v7;
  UIKeyCommand *extendToCellRightCommand;
  UIKeyCommand *extendToCellLeftCommand;
  UIKeyCommand *v10;
  UIKeyCommand *v11;
  void *v12;
  __int128 v14;
  UIKeyCommand *v15;
  UIKeyCommand *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[UIMultiSelectInteraction _areSelectionExtensionKeyCommandsEnabled](self, "_areSelectionExtensionKeyCommandsEnabled"))
  {
    if (!self->_extendToCellAboveCommand)
    {
      +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputUpArrow"), 0x20000, sel__handleKeyboardSelectionExtensionKeyCommand_);
      v3 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
      extendToCellAboveCommand = self->_extendToCellAboveCommand;
      self->_extendToCellAboveCommand = v3;

    }
    if (!self->_extendToCellBelowCommand)
    {
      +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputDownArrow"), 0x20000, sel__handleKeyboardSelectionExtensionKeyCommand_);
      v5 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
      extendToCellBelowCommand = self->_extendToCellBelowCommand;
      self->_extendToCellBelowCommand = v5;

    }
    if (!self->_extendToCellRightCommand)
    {
      +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputRightArrow"), 0x20000, sel__handleKeyboardSelectionExtensionKeyCommand_);
      v7 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
      extendToCellRightCommand = self->_extendToCellRightCommand;
      self->_extendToCellRightCommand = v7;

    }
    extendToCellLeftCommand = self->_extendToCellLeftCommand;
    if (!extendToCellLeftCommand)
    {
      +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("UIKeyInputLeftArrow"), 0x20000, sel__handleKeyboardSelectionExtensionKeyCommand_);
      v10 = (UIKeyCommand *)objc_claimAutoreleasedReturnValue();
      v11 = self->_extendToCellLeftCommand;
      self->_extendToCellLeftCommand = v10;

      extendToCellLeftCommand = self->_extendToCellLeftCommand;
    }
    v14 = *(_OWORD *)&self->_extendToCellAboveCommand;
    v15 = self->_extendToCellRightCommand;
    v16 = extendToCellLeftCommand;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (BOOL)_areSelectionExtensionKeyCommandsEnabled
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((*(_WORD *)&self->_optionalDelegateFlags & 0x200) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_msgSend(v7, "supportsKeyboardSelectionExtension"))
      v6 = _UIResponderRequiresTextInput(v5) ^ 1;
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

void __32__UIMultiSelectInteraction_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleBandSelectionInteraction:", v3);

}

uint64_t __32__UIMultiSelectInteraction_init__block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  uint64_t v9;

  v6 = (id *)(a1 + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  v9 = objc_msgSend(WeakRetained, "_shouldBeginBandSelectionInteraction:atPoint:", v7, a3, a4);

  return v9;
}

uint64_t __32__UIMultiSelectInteraction_init__block_invoke_3(uint64_t a1, double a2, double a3)
{
  _WORD *WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && (WeakRetained[24] & 0x100) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "multiSelectInteraction:shouldShowBandForSelectionStartingAtPoint:", v6, a2, a3);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[UIBandSelectionInteraction setEnabled:](self->_bandSelectionInteraction, "setEnabled:");
  }
}

- (int64_t)_gestureTypeForGestureInstance:(id)a3
{
  _UISingleFingerTapExtensionGesture *v4;
  _UISingleFingerTapExtensionGesture *v5;
  int64_t v6;
  unint64_t v8;

  v4 = (_UISingleFingerTapExtensionGesture *)a3;
  v5 = v4;
  if ((_UISingleFingerTapExtensionGesture *)self->_multiSelectModePan == v4)
  {
    v6 = 0;
  }
  else if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerPan == v4)
  {
    v6 = 1;
  }
  else if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerTap == v4)
  {
    v6 = 2;
  }
  else
  {
    if (self->_singleFingerExtensionTap != v4)
      goto LABEL_5;
    v8 = -[UIMultiSelectInteraction _currentExtensionTypeForOneFingerTapGesture:](self, "_currentExtensionTypeForOneFingerTapGesture:", v4);
    if (v8 == 1)
    {
      v6 = 4;
      goto LABEL_9;
    }
    if (v8 == 2)
      v6 = 3;
    else
LABEL_5:
      v6 = 8;
  }
LABEL_9:

  return v6;
}

- (id)_interactionDelegate
{
  void *v2;

  if (self->_delegateConformsToProtocol)
  {
    -[UIMultiSelectInteraction delegate](self, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (double)singleTouchPanGestureHysteresis
{
  double result;

  -[UIPanGestureRecognizer _hysteresis](self->_multiSelectModePan, "_hysteresis");
  return result;
}

- (NSArray)gesturesForFailureRequirements
{
  __int128 v3;
  UITapGestureRecognizer *multiFingerTap;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_multiSelectModePan;
  multiFingerTap = self->_multiFingerTap;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v3, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)_viewAsScrollView
{
  id WeakRetained;

  if (self->_isScrollView)
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  else
    WeakRetained = 0;
  return WeakRetained;
}

- (void)_beginObservingScrollViewOffsetUpdates
{
  id v3;

  -[UIMultiSelectInteraction _viewAsScrollView](self, "_viewAsScrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_addScrollViewScrollObserver:", self);

}

- (void)_endObservingScrollViewOffsetUpdates
{
  id v3;

  -[UIMultiSelectInteraction _viewAsScrollView](self, "_viewAsScrollView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeScrollViewScrollObserver:", self);

}

- (BOOL)_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  char v10;
  void *v12;
  char v13;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isInMultiSelectMode");

  if ((v10 & 1) != 0)
    return 1;
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:", self, v7, v6, x, y);

  return v13;
}

- (void)_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t v6;
  id v7;

  v3 = a3;
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isInMultiSelectMode"))
  {

    goto LABEL_5;
  }
  v6 = -[UIMultiSelectInteraction activeGestureType](self, "activeGestureType") - 1;

  if (v6 < 2)
  {
LABEL_5:
    -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:", v3);

  }
}

- (void)_sendWillBeginInteractionAtPoint:(CGPoint)a3 keepingSelection:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  __int16 optionalDelegateFlags;
  void *v9;
  id v10;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((optionalDelegateFlags & 0x2000) != 0)
    objc_msgSend(v9, "willBeginMultiSelectInteraction:atPoint:keepCurrentSelection:", self, v4, x, y);
  else
    objc_msgSend(v9, "willBeginMultiSelectInteraction:atPoint:", self, x, y);

}

- (BOOL)_isShiftKeyBeingHeldWithGesture:(id)a3
{
  BOOL v3;
  void *v4;
  char v5;

  v3 = +[UIKeyboardImpl isHardwareShiftKeyBeingHeld](UIKeyboardImpl, "isHardwareShiftKeyBeingHeld", a3);
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isShiftKeyBeingHeld");

  return v3 | v5;
}

- (BOOL)_isCommandKeyBeingHeldWithGesture:(id)a3
{
  return +[UIKeyboardImpl isHardwareCommandKeyBeingHeld](UIKeyboardImpl, "isHardwareCommandKeyBeingHeld", a3);
}

- (unint64_t)_currentExtensionTypeForOneFingerTapGesture:(id)a3
{
  id v4;
  unint64_t v5;
  _BOOL4 v6;

  v4 = a3;
  if (-[UIMultiSelectInteraction _isShiftKeyBeingHeldWithGesture:](self, "_isShiftKeyBeingHeldWithGesture:", v4))
    v5 = 2;
  else
    v5 = 0;
  v6 = -[UIMultiSelectInteraction _isCommandKeyBeingHeldWithGesture:](self, "_isCommandKeyBeingHeldWithGesture:", v4);

  if (v6)
    return 1;
  else
    return v5;
}

- (BOOL)multiSelectOneFingerPanGestureShouldPreventDragInteractionGesture:(id)a3
{
  UIMultiSelectInteractionDelegate **p_delegate;
  id v5;
  id WeakRetained;
  char v7;

  if ((*(_WORD *)&self->_optionalDelegateFlags & 1) == 0)
    return 0;
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_msgSend(WeakRetained, "multiSelectInteractionGestureShouldPreventDragLiftGesture:", v5);

  return v7;
}

- (BOOL)_triggeredLegacyPathInsteadForGestureRecognizer:(id)a3 velocity:(CGPoint)a4 shouldBegin:(BOOL *)a5
{
  double y;
  double x;
  UIPanGestureRecognizer *v9;
  __int16 optionalDelegateFlags;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  UITapGestureRecognizer *multiFingerTap;
  void *v18;

  y = a4.y;
  x = a4.x;
  v9 = (UIPanGestureRecognizer *)a3;
  optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;
  if ((optionalDelegateFlags & 0x1000) == 0)
  {
    -[UIMultiSelectInteraction view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer locationInView:](v9, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isInMultiSelectMode") & 1) != 0)
    {

LABEL_6:
      -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend(v18, "shouldBeginMultiSelectInteraction:atPoint:withVelocity:", self, v13, v15, x, y);

      goto LABEL_9;
    }
    if (self->_multiFingerPan == v9)
    {

    }
    else
    {
      multiFingerTap = self->_multiFingerTap;

      if (multiFingerTap != (UITapGestureRecognizer *)v9)
        goto LABEL_6;
    }
    *a5 = -[UIMultiSelectInteraction _attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:](self, "_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:", v13, v15, x, y);
  }
LABEL_9:

  return (optionalDelegateFlags & 0x1000) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  _UISingleFingerTapExtensionGesture *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  char v9;
  BOOL v10;
  _UISingleFingerTapExtensionGesture *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v23;

  v4 = (_UISingleFingerTapExtensionGesture *)a3;
  if (self->_singleFingerExtensionTap == v4)
  {
    v10 = 1;
    goto LABEL_16;
  }
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInMultiSelectMode");

  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsMultiSelectInteraction:", self);

  v23 = v8;
  if (v6)
  {
    if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerTap == v4)
      v9 = 0;
    else
      v9 = v8;
    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
  else if (!v8)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_16;
  }
  if (-[UITapGestureRecognizer _isGestureType:](v4, "_isGestureType:", 8))
  {
    v11 = v4;
    -[UIMultiSelectInteraction view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISingleFingerTapExtensionGesture velocityInView:](v11, "velocityInView:", v12);
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v14 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  if (-[UIMultiSelectInteraction _triggeredLegacyPathInsteadForGestureRecognizer:velocity:shouldBegin:](self, "_triggeredLegacyPathInsteadForGestureRecognizer:velocity:shouldBegin:", v4, &v23, v14, v16))
  {
    v10 = v23 != 0;
  }
  else
  {
    -[UIMultiSelectInteraction view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v17);
    v19 = v18;
    v21 = v20;

    v10 = -[UIMultiSelectInteraction _shouldBeginInteractionWithGestureType:location:velocity:](self, "_shouldBeginInteractionWithGestureType:location:velocity:", -[UIMultiSelectInteraction _gestureTypeForGestureInstance:](self, "_gestureTypeForGestureInstance:", v4), v19, v21, v14, v16);
  }
LABEL_16:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  _UIMultiSelectOneFingerPanGesture *v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = (_UIMultiSelectOneFingerPanGesture *)a3;
  v7 = a4;
  v8 = v7;
  v9 = (self->_multiSelectModePan == v6 || (_UIMultiSelectOneFingerPanGesture *)self->_multiFingerPan == v6)
    && (objc_msgSend(v7, "_isGestureType:", 8) & 1) != 0;

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  _UIMultiSelectOneFingerPanGesture *v6;
  UITapGestureRecognizer *v7;
  BOOL v8;
  UITapGestureRecognizer *multiFingerTap;

  v6 = (_UIMultiSelectOneFingerPanGesture *)a3;
  v7 = (UITapGestureRecognizer *)a4;
  if ((_isDragInteractionGestureRecognizer(v7) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    multiFingerTap = self->_multiFingerTap;
    if (self->_multiSelectModePan == v6)
      v8 = multiFingerTap != v7;
    else
      v8 = multiFingerTap == (UITapGestureRecognizer *)v6 || self->_multiFingerPan == (UIPanGestureRecognizer *)v6;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _UISingleFingerTapExtensionGesture *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  __int16 optionalDelegateFlags;
  id WeakRetained;
  char v24;
  char v25;

  v6 = (_UISingleFingerTapExtensionGesture *)a3;
  v7 = a4;
  v8 = v7;
  if (!self->_enabled)
    goto LABEL_14;
  if (self->_singleFingerExtensionTap == v6)
  {
    v15 = -[UIMultiSelectInteraction _currentExtensionTypeForOneFingerTapGesture:](self, "_currentExtensionTypeForOneFingerTapGesture:", v6);
    if (v15)
    {
      v16 = v15;
      -[UIMultiSelectInteraction view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locationInView:", v17);
      v19 = v18;
      v21 = v20;

      optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;
      if (v16 == 1 && (optionalDelegateFlags & 8) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v24 = objc_msgSend(WeakRetained, "shouldAllowSelectionAppendageAtPoint:", v19, v21);
LABEL_19:
        v25 = v24;

        goto LABEL_15;
      }
      if ((optionalDelegateFlags & 2) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        v24 = objc_msgSend(WeakRetained, "shouldAllowSelectionExtensionAtPoint:", v19, v21);
        goto LABEL_19;
      }
    }
LABEL_14:
    v25 = 0;
    goto LABEL_15;
  }
  if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerPan == v6)
  {
    if ((*(_WORD *)&self->_optionalDelegateFlags & 0x20) != 0)
    {
      v14 = objc_msgSend(v7, "_originatesFromPointerEvent");
      goto LABEL_17;
    }
  }
  else if ((_UISingleFingerTapExtensionGesture *)self->_multiSelectModePan == v6
         && objc_msgSend(v7, "_originatesFromPointerEvent"))
  {
    -[UIMultiSelectInteraction view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    v14 = -[UIMultiSelectInteraction _isBandSelectionAllowedAtPoint:](self, "_isBandSelectionAllowedAtPoint:", v11, v13);
LABEL_17:
    v25 = v14 ^ 1;
    goto LABEL_15;
  }
  v25 = 1;
LABEL_15:

  return v25;
}

- (BOOL)_isBandSelectionAllowedAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  int v7;
  id WeakRetained;
  char v10;

  if ((*(_WORD *)&self->_optionalDelegateFlags & 0x20) == 0)
    return 0;
  y = a3.y;
  x = a3.x;
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsMultiSelectInteraction:", self);

  if (!v7)
    return 0;
  if ((*(_WORD *)&self->_optionalDelegateFlags & 0x80) == 0)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_msgSend(WeakRetained, "multiSelectInteraction:shouldStartBandSelectionAtPoint:", self, x, y);

  return v10;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;

  -[_UIMultiSelectOneFingerPanGesture activeTouch](self->_multiSelectModePan, "activeTouch", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[UIMultiSelectInteraction view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v4);
    v6 = v5;
    v8 = v7;

    -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, v6, v8);

  }
}

- (void)_handleBandSelectionInteraction:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  _BOOL8 v21;
  id v22;

  v22 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_locationInView:", v4);
  v6 = v5;
  v8 = v7;

  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v22, "state");
  if (v10 == 3)
  {
    -[UIMultiSelectInteraction _endInteractionAtPoint:canceled:](self, "_endInteractionAtPoint:canceled:", 0, v6, v8);
    goto LABEL_19;
  }
  if (v10 == 2 || v10 == 1 && objc_msgSend(v9, "isInMultiSelectMode"))
  {
    objc_msgSend(v22, "selectionRect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v19 = objc_msgSend(v22, "initialModifierFlags");
    if (!-[UIMultiSelectInteraction _isActive](self, "_isActive"))
    {
      if (!-[UIMultiSelectInteraction _shouldBeginInteractionWithGestureType:location:velocity:](self, "_shouldBeginInteractionWithGestureType:location:velocity:", 5, v6, v8, 1.0, 1.0))goto LABEL_19;
      v21 = v19 == 0x20000 || v19 == 0x100000;
      -[UIMultiSelectInteraction _beginInteractionWithTrigger:point:keepingSelection:](self, "_beginInteractionWithTrigger:point:keepingSelection:", v22, v21, v6, v8);
    }
    if (v19 == 0x100000 && (*(_WORD *)&self->_optionalDelegateFlags & 0x40) != 0)
      objc_msgSend(v9, "multiSelectInteraction:toggleSelectionWithinRect:leadingPoint:", self, v12, v14, v16, v18, v6, v8);
    else
      objc_msgSend(v9, "multiSelectInteraction:selectItemsWithinRect:leadingPoint:", self, v12, v14, v16, v18, v6, v8);
  }
LABEL_19:

}

- (void)_cancelScrollingInScrollView:(id)a3
{
  id v3;

  objc_msgSend(a3, "panGestureRecognizer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEnabled"))
  {
    objc_msgSend(v3, "setEnabled:", 0);
    objc_msgSend(v3, "setEnabled:", 1);
  }

}

- (void)_cancelScrollingInViewForGesture:(id)a3
{
  _UIMultiSelectOneFingerPanGesture *v4;
  id WeakRetained;
  id v6;
  id v7;
  void *v8;
  _UIMultiSelectOneFingerPanGesture *v9;

  v4 = (_UIMultiSelectOneFingerPanGesture *)a3;
  if (self->_isScrollView && self->_multiSelectModePan != v4)
  {
    v9 = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if ((*(_WORD *)&self->_optionalDelegateFlags & 0x800) != 0)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_loadWeakRetained((id *)&self->_view);
      -[UIPanGestureRecognizer locationInView:](v9, "locationInView:", v7);
      objc_msgSend(v6, "childScrollViewAtLocation:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIMultiSelectInteraction _cancelScrollingInScrollView:](self, "_cancelScrollingInScrollView:", v8);
    }
    -[UIMultiSelectInteraction _cancelScrollingInScrollView:](self, "_cancelScrollingInScrollView:", WeakRetained);

    v4 = v9;
  }

}

- (void)_handleCommonPanGestureStateChanged:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "state"))
  {
    case 1:
      -[UIMultiSelectInteraction _beginCommonPan:](self, "_beginCommonPan:", v4);
      break;
    case 2:
      -[UIMultiSelectInteraction _updateCommonPan:](self, "_updateCommonPan:", v4);
      break;
    case 3:
      -[UIMultiSelectInteraction _endCommonPan:](self, "_endCommonPan:", v4);
      break;
    case 4:
      -[UIMultiSelectInteraction _cancelCommonPan:](self, "_cancelCommonPan:", v4);
      break;
    default:
      break;
  }

}

- (void)_beginCommonPan:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  -[UIMultiSelectInteraction _beginInteractionWithTrigger:point:keepingSelection:](self, "_beginInteractionWithTrigger:point:keepingSelection:", v9, 0, v6, v8);
}

- (void)_updateCommonPan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, v7, v9);

}

- (void)_endCommonPan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, v7, v9);

  -[UIMultiSelectInteraction _endInteractionAtPoint:canceled:](self, "_endInteractionAtPoint:canceled:", 0, v7, v9);
}

- (void)_cancelCommonPan:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[UIMultiSelectInteraction _endInteractionAtPoint:canceled:](self, "_endInteractionAtPoint:canceled:", 1, v7, v9);
}

- (void)_didInvokeMultiSelectAppendGestureAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIMultiSelectInteraction _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:](self, "_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:", 1);
  -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", 1, x, y);
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiSelectInteraction:appendSelectionAtPoint:", self, x, y);

  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didEndMultiSelectInteraction:atPoint:", self, x, y);

}

- (void)_didInvokeMultiSelectExtendGestureAtLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[UIMultiSelectInteraction _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:](self, "_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:", 1);
  -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", 1, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8));
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, x, y);

  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didEndMultiSelectInteraction:atPoint:", self, x, y);

}

- (void)_multiFingerTapGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;

  v4 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  v10 = objc_msgSend(v4, "state");
  if (v10 == 3)
    -[UIMultiSelectInteraction _didInvokeMultiSelectAppendGestureAtLocation:](self, "_didInvokeMultiSelectAppendGestureAtLocation:", v7, v9);
}

- (void)_handleSelectionExtensionTapGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  -[UIMultiSelectInteraction view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locationInView:", v4);
  v6 = v5;
  v8 = v7;

  if (objc_msgSend(v10, "state") == 3)
  {
    v9 = -[UIMultiSelectInteraction _currentExtensionTypeForOneFingerTapGesture:](self, "_currentExtensionTypeForOneFingerTapGesture:", v10);
    if (v9 == 2)
    {
      -[UIMultiSelectInteraction _didInvokeMultiSelectExtendGestureAtLocation:](self, "_didInvokeMultiSelectExtendGestureAtLocation:", v6, v8);
    }
    else if (v9 == 1)
    {
      -[UIMultiSelectInteraction _didInvokeMultiSelectAppendGestureAtLocation:](self, "_didInvokeMultiSelectAppendGestureAtLocation:", v6, v8);
    }
  }

}

- (BOOL)_isActive
{
  return self->_activeGestureType != 8;
}

- (void)_beginInteractionWithTrigger:(id)a3 point:(CGPoint)a4 keepingSelection:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  id v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v13 = a3;
  if (!-[UIMultiSelectInteraction _isActive](self, "_isActive"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v13;
      v10 = -[UIMultiSelectInteraction _gestureTypeForGestureInstance:](self, "_gestureTypeForGestureInstance:", v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v13, "initialModifierFlags");
        v9 = 0;
        v12 = 5;
        if (v11 == 0x100000)
          v12 = 7;
        if (v11 == 0x20000)
          v10 = 6;
        else
          v10 = v12;
      }
      else
      {
        v9 = 0;
        v10 = 8;
      }
    }
    self->_activeGestureType = v10;
    -[UIMultiSelectInteraction _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:](self, "_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:", v5);
    -[UIMultiSelectInteraction _cancelScrollingInViewForGesture:](self, "_cancelScrollingInViewForGesture:", v9);
    -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", v5, x, y);
    -[UIMultiSelectInteraction _beginObservingScrollViewOffsetUpdates](self, "_beginObservingScrollViewOffsetUpdates");

  }
}

- (void)_endInteractionAtPoint:(CGPoint)a3 canceled:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (-[UIMultiSelectInteraction _isActive](self, "_isActive"))
  {
    -[UIMultiSelectInteraction _endObservingScrollViewOffsetUpdates](self, "_endObservingScrollViewOffsetUpdates");
    if (v4)
    {
      if ((*(_WORD *)&self->_optionalDelegateFlags & 0x10) == 0)
      {
LABEL_7:
        self->_activeGestureType = 8;
        return;
      }
      -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didCancelMultiSelectInteraction:atPoint:", self, x, y);
    }
    else
    {
      -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "didEndMultiSelectInteraction:atPoint:", self, x, y);
    }

    goto LABEL_7;
  }
}

- (BOOL)_shouldBeginInteractionWithGestureType:(int64_t)a3 location:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y;
  double x;
  double v7;
  double v8;
  void *v11;
  char v12;
  void *v13;
  char v14;

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInMultiSelectMode");

  if ((v12 & 1) == 0 && (unint64_t)a3 <= 5 && ((1 << a3) & 0x26) != 0)
    return -[UIMultiSelectInteraction _attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:](self, "_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:", v8, v7, x, y);
  -[UIMultiSelectInteraction _interactionDelegate](self, "_interactionDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldBeginMultiSelectInteraction:ofType:atPoint:withVelocity:", self, a3, v8, v7, x, y);

  return v14;
}

- (void)_handleKeyboardSelectionExtensionKeyCommand:(id)a3
{
  _BOOL4 v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  id WeakRetained;
  __int16 optionalDelegateFlags;
  double v12;
  double v13;
  id v14;
  id v15;

  v15 = a3;
  v4 = -[UIMultiSelectInteraction _areSelectionExtensionKeyCommandsEnabled](self, "_areSelectionExtensionKeyCommandsEnabled");
  v5 = v15;
  if (v4)
  {
    objc_msgSend(v15, "input");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6 == CFSTR("UIKeyInputUpArrow"))
    {
      v9 = 2;
    }
    else
    {
      objc_msgSend(v15, "input");
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v7 == CFSTR("UIKeyInputDownArrow"))
      {
        v9 = 1;
      }
      else
      {
        objc_msgSend(v15, "input");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == CFSTR("UIKeyInputRightArrow") ? 3 : 0;

      }
    }

    v5 = v15;
    if ((*(_WORD *)&self->_optionalDelegateFlags & 4) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (!objc_msgSend(WeakRetained, "shouldAllowSelectionExtensionAtIndexPath:", 0))
      {
LABEL_15:

        v5 = v15;
        goto LABEL_16;
      }
      optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;

      v5 = v15;
      if ((optionalDelegateFlags & 0x400) != 0)
      {
        -[UIMultiSelectInteraction _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:](self, "_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:", 1);
        v12 = *MEMORY[0x1E0C9D628];
        v13 = *(double *)(MEMORY[0x1E0C9D628] + 8);
        -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", 1, *MEMORY[0x1E0C9D628], v13);
        v14 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v14, "multiSelectInteraction:extendSelectionInDirection:", self, v9);

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "didEndMultiSelectInteraction:atPoint:", self, v12, v13);
        goto LABEL_15;
      }
    }
  }
LABEL_16:

}

- (_UIMultiSelectOneFingerPanGesture)_multiSelectModePan
{
  return self->_multiSelectModePan;
}

- (void)set_multiSelectModePan:(id)a3
{
  objc_storeStrong((id *)&self->_multiSelectModePan, a3);
}

- (UIPanGestureRecognizer)_multiFingerPan
{
  return self->_multiFingerPan;
}

- (void)set_multiFingerPan:(id)a3
{
  objc_storeStrong((id *)&self->_multiFingerPan, a3);
}

- (UITapGestureRecognizer)_multiFingerTap
{
  return self->_multiFingerTap;
}

- (void)set_multiFingerTap:(id)a3
{
  objc_storeStrong((id *)&self->_multiFingerTap, a3);
}

- (_UISingleFingerTapExtensionGesture)_singleFingerExtensionTap
{
  return self->_singleFingerExtensionTap;
}

- (void)set_singleFingerExtensionTap:(id)a3
{
  objc_storeStrong((id *)&self->_singleFingerExtensionTap, a3);
}

- (int64_t)activeGestureType
{
  return self->_activeGestureType;
}

- (UIMultiSelectInteractionDelegate)delegate
{
  return (UIMultiSelectInteractionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (UIBandSelectionInteraction)bandSelectionInteraction
{
  return self->_bandSelectionInteraction;
}

- (void)setBandSelectionInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_bandSelectionInteraction, a3);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end
