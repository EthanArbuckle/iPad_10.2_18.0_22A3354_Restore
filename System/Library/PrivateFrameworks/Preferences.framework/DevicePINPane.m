@implementation DevicePINPane

- (id)specifierLabel
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(WeakRetained, "pinInstructionsPrompt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPlaysKeyboardClicks:(BOOL)a3
{
  int inSpecifier;
  _BOOL4 inPropertyData;

  inPropertyData = a3;
  inSpecifier = 1104;
  AudioServicesSetProperty(0x61637421u, 4u, &inSpecifier, 4u, &inPropertyData);
}

- (DevicePINPane)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DevicePINPane *v7;
  DevicePINPane *v8;
  uint64_t v9;
  uint64_t v10;
  UITransitionView *transitionView;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)DevicePINPane;
  v7 = -[PSEditingPane initWithFrame:](&v16, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    -[DevicePINPane setAutocapitalizationType:](v7, "setAutocapitalizationType:", 0);
    v9 = 1;
    -[DevicePINPane setAutocorrectionType:](v8, "setAutocorrectionType:", 1);
    -[DevicePINPane setAutoresizingMask:](v8, "setAutoresizingMask:", 0);
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAB98]), "initWithFrame:", x, y, width, height);
    transitionView = v8->_transitionView;
    v8->_transitionView = (UITransitionView *)v10;

    -[DevicePINPane addSubview:](v8, "addSubview:", v8->_transitionView);
    -[DevicePINPane setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[UITransitionView setAutoresizingMask:](v8->_transitionView, "setAutoresizingMask:", 18);
    v12 = (void *)CFPreferencesCopyValue(CFSTR("keyboard"), CFSTR("com.apple.preferences.sounds"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v13 = v12;
    if (v12)
    {
      v9 = objc_msgSend(v12, "BOOLValue");
      v8->_playSound = v9;
    }
    else
    {
      v8->_playSound = 1;
    }
    -[DevicePINPane _setPlaysKeyboardClicks:](v8, "_setPlaysKeyboardClicks:", v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel_keyboardWillChangeFrame_, *MEMORY[0x1E0CEB960], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PINEntryView setDelegate:](self->_pinView, "setDelegate:", 0);
  -[DevicePINPane _setPlaysKeyboardClicks:](self, "_setPlaysKeyboardClicks:", 0);
  -[DevicePINPane dismissKeypad](self, "dismissKeypad");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DevicePINPane;
  -[DevicePINPane dealloc](&v4, sel_dealloc);
}

- (void)setKeyboardIsNumeric:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (self->_numericKeyboard != a3)
  {
    v3 = a3;
    self->_numericKeyboard = a3;
    +[PSListController appearance](PSListController, "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "usesDarkTheme");

    v7 = v6;
    if (v3)
    {
      v8 = 127;
      if (PSUsePadStylePIN())
        v7 = 127;
    }
    else
    {
      v8 = 0;
    }
    -[DevicePINPane setKeyboardType:](self, "setKeyboardType:", v8);
    -[DevicePINPane setKeyboardAppearance:](self, "setKeyboardAppearance:", v7);
    if (-[DevicePINPane requiresKeyboard](self, "requiresKeyboard"))
    {
      -[DevicePINPane pinView](self, "pinView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextFieldKeyboardType:", v8);

      -[DevicePINPane pinView](self, "pinView");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextFieldKeyboardAppearance:", v7);

    }
  }
}

- (void)activateKeypadView
{
  DevicePINKeypad *v3;
  UIKeyboard *keypad;
  DevicePINKeypad *v5;
  DevicePINKeypadContainerView *v6;
  DevicePINKeypadContainerView *keypadContainerView;
  void *v8;

  if (!self->_keypadActive)
  {
    if (!self->_keypadContainerView)
    {
      v3 = objc_alloc_init(DevicePINKeypad);
      keypad = self->_keypad;
      self->_keypad = &v3->super;
      v5 = v3;

      v6 = -[DevicePINKeypadContainerView initWithKeypad:]([DevicePINKeypadContainerView alloc], "initWithKeypad:", v5);
      keypadContainerView = self->_keypadContainerView;
      self->_keypadContainerView = v6;

    }
    -[UIKeyboard activate](self->_keypad, "activate");
    -[PINEntryView setBlocked:](self->_pinView, "setBlocked:", 1);
    self->_keypadActive = 1;
    -[DevicePINKeypadContainerView superview](self->_keypadContainerView, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[DevicePINPane addSubview:](self, "addSubview:", self->_keypadContainerView);
  }
}

- (void)deactivateKeypadView
{
  if (self->_keypadActive)
  {
    -[PINEntryView setBlocked:](self->_pinView, "setBlocked:", 0);
    -[UIKeyboard deactivate](self->_keypad, "deactivate");
    self->_keypadActive = 0;
  }
}

- (void)showFailedAttempts:(int64_t)a3
{
  -[PINEntryView showFailedAttempts:](self->_pinView, "showFailedAttempts:", a3);
}

- (void)hideFailedAttempts
{
  -[PINEntryView hideFailedAttempts](self->_pinView, "hideFailedAttempts");
}

- (void)transitionToSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 showsOptions:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  PINEntryView *pinView;
  PINEntryView *v12;
  PSBulletedPINView *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  PSTextFieldPINView *v18;

  v6 = a6;
  v7 = a5;
  pinView = self->_pinView;
  if (pinView)
  {
    -[PINEntryView setDelegate:](pinView, "setDelegate:", 0);
    -[PINEntryView removeFromSuperview](self->_pinView, "removeFromSuperview");
    v12 = self->_pinView;
    self->_pinView = 0;

  }
  self->_simplePIN = a3;
  *((_BYTE *)&self->super + 432) = *((_BYTE *)&self->super + 432) & 0xFE | a4;
  if (!self->_simplePIN)
  {
    v18 = objc_alloc_init(PSTextFieldPINView);
    -[PSTextFieldPINView setUsesNumericKeyboard:](v18, "setUsesNumericKeyboard:", v7);
    if (!v6)
      goto LABEL_6;
    goto LABEL_5;
  }
  v13 = [PSBulletedPINView alloc];
  v14 = -[DevicePINPane PINLength](self, "PINLength");
  v18 = -[PSBulletedPINView initWithFrame:numberOfFields:](v13, "initWithFrame:numberOfFields:", v14, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
LABEL_5:
    -[DevicePINPane passcodeOptionsTitle](self, "passcodeOptionsTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView setOptionsButtonTitle:](v18, "setOptionsButtonTitle:", v15);

    -[DevicePINPane passcodeOptionsHandler](self, "passcodeOptionsHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView setPasscodeOptionsHandler:](v18, "setPasscodeOptionsHandler:", v16);

  }
LABEL_6:
  -[DevicePINPane setPinView:](self, "setPinView:", v18);
  -[DevicePINPane specifierLabel](self, "specifierLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DevicePINPane setTitle:](self, "setTitle:", v17);

  -[DevicePINPane setKeyboardIsNumeric:](self, "setKeyboardIsNumeric:", v7);
  -[DevicePINPane _setKeypadState:animated:](self, "_setKeypadState:animated:", (*((_BYTE *)&self->super + 432) & 1) == 0, 1);
  -[PINEntryView setDelegate:](self->_pinView, "setDelegate:", self);
  -[UITransitionView addSubview:](self->_transitionView, "addSubview:", self->_pinView);
  -[DevicePINPane setNeedsLayout](self, "setNeedsLayout");

}

- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4
{
  -[DevicePINPane setSimplePIN:requiresKeyboard:numericOnly:](self, "setSimplePIN:requiresKeyboard:numericOnly:", a3, a4, a3);
}

- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5
{
  -[DevicePINPane setSimplePIN:requiresKeyboard:numericOnly:showsOptions:](self, "setSimplePIN:requiresKeyboard:numericOnly:showsOptions:", a3, a4, a5, 0);
}

- (void)setSimplePIN:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 showsOptions:(BOOL)a6
{
  if (!self->_pinView)
    -[DevicePINPane transitionToSimplePIN:requiresKeyboard:numericOnly:showsOptions:](self, "transitionToSimplePIN:requiresKeyboard:numericOnly:showsOptions:", a3, a4, a5, a6);
}

- (BOOL)simplePIN
{
  return self->_simplePIN;
}

- (BOOL)requiresKeyboard
{
  return *((_BYTE *)&self->super + 432) & 1;
}

- (void)_setKeypadState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id location;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  const char *v26;
  __int128 v27;
  __int128 v28;

  v4 = a4;
  v5 = a3;
  if (a3)
  {
    -[DevicePINPane activateKeypadView](self, "activateKeypadView");
    if (UIKeyboardAutomaticIsOnScreen())
    {
      if (v4)
        UIKeyboardOrderOutAutomatic();
      else
        UIKeyboardOrderOutAutomaticSkippingAnimation();
    }
  }
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x4010000000;
  v26 = "";
  v27 = 0u;
  v28 = 0u;
  -[DevicePINKeypadContainerView frame](self->_keypadContainerView, "frame");
  *(_QWORD *)&v27 = v7;
  *((_QWORD *)&v27 + 1) = v8;
  *(_QWORD *)&v28 = v9;
  *((_QWORD *)&v28 + 1) = v10;
  if ((PSUsePadStylePIN() & 1) != 0 || !self->_keypadActive)
  {
    if (v5)
      goto LABEL_25;
  }
  else
  {
    if (v5)
    {
      v11 = v24[4];
      v24[5] = v24[5] - v24[7];
      -[DevicePINKeypadContainerView setFrame:](self->_keypadContainerView, "setFrame:", v11);
      objc_initWeak(&location, self);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __42__DevicePINPane__setKeypadState_animated___block_invoke;
      v20[3] = &unk_1E4A67A20;
      objc_copyWeak(&v21, &location);
      v20[4] = &v23;
      v12 = MEMORY[0x1A8594D10](v20);
      v13 = (void *)v12;
      if (v4)
      {
        v14 = (void *)MEMORY[0x1E0CEABB0];
        objc_msgSend(MEMORY[0x1E0CEAB98], "defaultDurationForTransition:", 7);
        objc_msgSend(v14, "animateWithDuration:animations:", v13);
      }
      else
      {
        (*(void (**)(uint64_t))(v12 + 16))(v12);
      }

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
      goto LABEL_25;
    }
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__DevicePINPane__setKeypadState_animated___block_invoke_2;
    v18[3] = &unk_1E4A67A20;
    objc_copyWeak(&v19, &location);
    v18[4] = &v23;
    v15 = MEMORY[0x1A8594D10](v18);
    v16 = (void *)v15;
    if (v4)
    {
      v17 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(MEMORY[0x1E0CEAB98], "defaultDurationForTransition:", 7);
      objc_msgSend(v17, "animateWithDuration:animations:", v16);
    }
    else
    {
      (*(void (**)(uint64_t))(v15 + 16))(v15);
    }

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  if (UIKeyboardAutomaticIsOffScreen())
  {
    if (v4)
      UIKeyboardOrderInAutomatic();
    else
      UIKeyboardOrderInAutomaticSkippingAnimation();
  }
  if (self->_keypadActive)
  {
    -[DevicePINPane dismissKeypad](self, "dismissKeypad");
    -[DevicePINPane setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_25:
  _Block_object_dispose(&v23, 8);
}

void __42__DevicePINPane__setKeypadState_animated___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 56)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 40);
  objc_msgSend(WeakRetained[67], "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));

}

void __42__DevicePINPane__setKeypadState_animated___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 56)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 40);
  objc_msgSend(WeakRetained[67], "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));

}

- (void)dismissKeypad
{
  DevicePINKeypadContainerView *keypadContainerView;
  DevicePINKeypadContainerView *v4;
  UIKeyboard *keypad;

  -[DevicePINPane deactivateKeypadView](self, "deactivateKeypadView");
  keypadContainerView = self->_keypadContainerView;
  if (keypadContainerView)
  {
    -[DevicePINKeypadContainerView removeFromSuperview](keypadContainerView, "removeFromSuperview");
    v4 = self->_keypadContainerView;
    self->_keypadContainerView = 0;

    keypad = self->_keypad;
    self->_keypad = 0;

  }
}

- (BOOL)canBecomeFirstResponder
{
  if ((*((_BYTE *)&self->super + 432) & 1) != 0)
    return -[PINEntryView canBecomeFirstResponder](self->_pinView, "canBecomeFirstResponder");
  else
    return self->_keypadActive;
}

- (BOOL)becomeFirstResponder
{
  BOOL v3;
  objc_super v5;

  if ((*((_BYTE *)&self->super + 432) & 1) != 0)
    return -[PINEntryView becomeFirstResponder](self->_pinView, "becomeFirstResponder");
  if (!self->_keypadActive)
    return 0;
  UIKeyboardDisableAutomaticAppearance();
  v5.receiver = self;
  v5.super_class = (Class)DevicePINPane;
  v3 = -[DevicePINPane becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (!v3)
    UIKeyboardEnableAutomaticAppearance();
  -[DevicePINKeypadContainerView setNeedsLayout](self->_keypadContainerView, "setNeedsLayout");
  return v3;
}

- (BOOL)resignFirstResponder
{
  char v3;
  objc_super v5;

  -[DevicePINPane setKeyboardUserInteractionEnabled:](self, "setKeyboardUserInteractionEnabled:", 1);
  if (-[DevicePINPane isFirstResponder](self, "isFirstResponder"))
  {
    v5.receiver = self;
    v5.super_class = (Class)DevicePINPane;
    if (-[DevicePINPane resignFirstResponder](&v5, sel_resignFirstResponder))
    {
      UIKeyboardEnableAutomaticAppearance();
      return 1;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v3 = -[PINEntryView resignFirstResponder](self->_pinView, "resignFirstResponder");
    if (UIKeyboardAutomaticIsOnScreen())
      UIKeyboardOrderOutAutomatic();
  }
  return v3;
}

- (void)setKeyboardUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[DevicePINPane requiresKeyboard](self, "requiresKeyboard"))
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUserInteractionEnabled:", v3);

  }
  else
  {
    -[UIKeyboard setUserInteractionEnabled:](self->_keypad, "setUserInteractionEnabled:", v3);
  }
}

- (void)showError:(id)a3 error:(id)a4 isBlocked:(BOOL)a5 animate:(BOOL)a6
{
  _BOOL8 v6;
  int v7;
  id v10;
  int isBlocked;
  id v12;

  v6 = a6;
  v7 = a5;
  v12 = a3;
  v10 = a4;
  isBlocked = self->_isBlocked;
  if (isBlocked != v7)
  {
    self->_isBlocked = v7;
    -[DevicePINPane setKeyboardUserInteractionEnabled:](self, "setKeyboardUserInteractionEnabled:", v7 ^ 1u);
    -[PINEntryView setBlocked:](self->_pinView, "setBlocked:", self->_isBlocked);
    isBlocked = self->_isBlocked;
  }
  if (isBlocked)
    -[PINEntryView showError:animate:](self->_pinView, "showError:animate:", v10, v6);
  -[PINEntryView setStringValue:](self->_pinView, "setStringValue:", &stru_1E4A69238);

}

- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4
{
  -[PINEntryView setPINPolicyString:visible:](self->_pinView, "setPINPolicyString:visible:", a3, a4);
  -[PINEntryView setStringValue:](self->_pinView, "setStringValue:", &stru_1E4A69238);
}

- (void)okButtonPressed
{
  -[PINEntryView okButtonPressed:](self->_pinView, "okButtonPressed:", 0);
}

- (void)hideError
{
  -[PINEntryView hideError](self->_pinView, "hideError");
}

- (void)setTitle:(id)a3
{
  PINEntryView *pinView;
  id *p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  pinView = self->_pinView;
  p_delegate = &self->super._delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  objc_msgSend(WeakRetained, "pinInstructionsPromptFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PINEntryView setTitle:font:](pinView, "setTitle:font:", v5, v6);

}

- (void)slideToNewPasscodeField:(BOOL)a3 withKeyboard:(BOOL)a4
{
  -[DevicePINPane slideToNewPasscodeField:requiresKeyboard:numericOnly:](self, "slideToNewPasscodeField:requiresKeyboard:numericOnly:", a3, a4, a3);
}

- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5
{
  -[DevicePINPane slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:](self, "slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:", a3, a4, a5, 1, 0);
}

- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 transition:(int)a6 showsOptionsButton:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  double v10;
  double v11;
  id v12;
  void *v13;
  PSBulletedPINView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PSBulletedPINView *v19;
  PSTextFieldPINView *v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _BOOL4 v31;
  id v32;

  v7 = a7;
  v8 = a5;
  *((_BYTE *)&self->super + 432) = *((_BYTE *)&self->super + 432) & 0xFE | a4;
  self->_simplePIN = a3;
  -[DevicePINPane pinView](self, "pinView");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "getCurrentTitleFontSize");
  v11 = v10;
  if (-[DevicePINPane requiresKeyboard](self, "requiresKeyboard"))
    UIKeyboardDisableAutomaticAppearance();
  v12 = objc_alloc_init(MEMORY[0x1E0CEA9B8]);
  -[UITransitionView addSubview:](self->_transitionView, "addSubview:", v12);
  objc_msgSend(v32, "frame");
  objc_msgSend(v12, "setFrame:");
  objc_msgSend(v12, "captureSnapshotOfView:withSnapshotType:", v32, 1);
  objc_msgSend(v32, "removeFromSuperview");
  -[DevicePINPane hideFailedAttempts](self, "hideFailedAttempts");
  -[DevicePINPane setPINPolicyString:visible:](self, "setPINPolicyString:visible:", 0, 0);
  self->_transitioning = 1;
  -[UITransitionView setDelegate:](self->_transitionView, "setDelegate:", self);
  -[DevicePINPane pinView](self, "pinView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", 0);

  v31 = v8;
  if (self->_simplePIN)
  {
    v14 = [PSBulletedPINView alloc];
    objc_msgSend(v32, "frame");
    v19 = -[PSBulletedPINView initWithFrame:numberOfFields:](v14, "initWithFrame:numberOfFields:", -[DevicePINPane PINLength](self, "PINLength"), v15, v16, v17, v18);
  }
  else
  {
    v20 = [PSTextFieldPINView alloc];
    objc_msgSend(v32, "frame");
    v19 = -[PSTextFieldPINView initWithFrame:](v20, "initWithFrame:");
    -[PSBulletedPINView setUsesNumericKeyboard:](v19, "setUsesNumericKeyboard:", v8);
  }
  -[PINView setDelegate:](v19, "setDelegate:", self);
  -[PSBulletedPINView setBlocked:](v19, "setBlocked:", (*((_BYTE *)&self->super + 432) & 1) == 0);
  v21 = (void *)MEMORY[0x1E0CEA5E8];
  WeakRetained = objc_loadWeakRetained(&self->super._delegate);
  objc_msgSend(WeakRetained, "pinInstructionsPromptFont");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "fontDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fontWithDescriptor:size:", v24, v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[DevicePINPane specifierLabel](self, "specifierLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PINView setTitle:font:](v19, "setTitle:font:", v26, v25);

  -[PINView setShowsOptionsButton:](v19, "setShowsOptionsButton:", v7);
  if (v7)
  {
    -[DevicePINPane passcodeOptionsTitle](self, "passcodeOptionsTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView setOptionsButtonTitle:](v19, "setOptionsButtonTitle:", v27);

    -[DevicePINPane passcodeOptionsHandler](self, "passcodeOptionsHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView setPasscodeOptionsHandler:](v19, "setPasscodeOptionsHandler:", v28);

  }
  -[PSBulletedPINView layoutIfNeeded](v19, "layoutIfNeeded");
  -[DevicePINPane setPinView:](self, "setPinView:", v19);
  -[UITransitionView transition:fromView:toView:](self->_transitionView, "transition:fromView:toView:", a6, v12, v19);
  -[DevicePINPane setKeyboardIsNumeric:](self, "setKeyboardIsNumeric:", v31);
  v29 = PSUsePadStylePIN();
  -[DevicePINPane _setKeypadState:animated:](self, "_setKeypadState:animated:", (*((_BYTE *)&self->super + 432) & 1) == 0, v29);
  if ((_DWORD)v29)
    -[DevicePINPane becomeFirstResponder](self, "becomeFirstResponder");
  -[DevicePINPane setNeedsLayout](self, "setNeedsLayout");

}

- (void)transitionViewDidComplete:(id)a3
{
  void *v4;
  int v5;

  self->_transitioning = 0;
  if (-[DevicePINPane requiresKeyboard](self, "requiresKeyboard", a3))
    UIKeyboardEnableAutomaticAppearance();
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sf_isiPhone");

  if (v5)
    -[DevicePINPane becomeFirstResponder](self, "becomeFirstResponder");
}

- (id)password
{
  return (id)-[PINEntryView stringValue](self->_pinView, "stringValue");
}

- (void)clearPassword
{
  -[PINEntryView setStringValue:](self->_pinView, "setStringValue:", &stru_1E4A69238);
}

- (id)text
{
  return (id)-[PINEntryView stringValue](self->_pinView, "stringValue");
}

- (void)setText:(id)a3
{
  -[PINEntryView setStringValue:](self->_pinView, "setStringValue:", a3);
}

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  -[PINEntryView stringValue](self->_pinView, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  _BOOL4 simplePIN;
  id v8;

  v4 = a3;
  if (!self->_isBlocked)
  {
    v8 = v4;
    -[PINEntryView stringValue](self->_pinView, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    if (v6 < -[DevicePINPane PINLength](self, "PINLength"))
    {

LABEL_5:
      -[PINEntryView hideError](self->_pinView, "hideError");
      -[PINEntryView appendString:](self->_pinView, "appendString:", v8);
      v4 = v8;
      goto LABEL_6;
    }
    simplePIN = self->_simplePIN;

    v4 = v8;
    if (!simplePIN)
      goto LABEL_5;
  }
LABEL_6:

}

- (void)deleteBackward
{
  -[PINEntryView deleteLastCharacter](self->_pinView, "deleteLastCharacter");
}

- (void)delayForTextEntryAnimationsWithCompletion:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PINEntryView recursivelyForceDisplayIfNeeded](self->_pinView, "recursivelyForceDisplayIfNeeded");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  -[DevicePINPane setKeyboardUserInteractionEnabled:](self, "setKeyboardUserInteractionEnabled:", 0);
  v5 = dispatch_time(0, 76000000);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__DevicePINPane_delayForTextEntryAnimationsWithCompletion___block_invoke;
  v7[3] = &unk_1E4A65758;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v7);

}

uint64_t __59__DevicePINPane_delayForTextEntryAnimationsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setKeyboardUserInteractionEnabled:", 1);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pinView:(id)a3 pinValueChanged:(id)a4
{
  id *p_delegate;
  id v5;
  uint64_t v6;
  id WeakRetained;

  if (!self->_simplePIN)
  {
    p_delegate = &self->super._delegate;
    v5 = a4;
    WeakRetained = objc_loadWeakRetained(p_delegate);
    v6 = objc_msgSend(v5, "length");

    objc_msgSend(WeakRetained, "adjustButtonsForPasswordLength:", v6);
  }
}

- (void)pinView:(id)a3 pinEntered:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  DevicePINPane *v13;
  id v14;

  v5 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __36__DevicePINPane_pinView_pinEntered___block_invoke;
  v12 = &unk_1E4A655B8;
  v13 = self;
  v14 = v5;
  v6 = v5;
  v7 = MEMORY[0x1A8594D10](&v9);
  v8 = (void *)v7;
  if (self->_simplePIN)
    -[DevicePINPane delayForTextEntryAnimationsWithCompletion:](self, "delayForTextEntryAnimationsWithCompletion:", v7, v9, v10, v11, v12, v13, v14);
  else
    (*(void (**)(uint64_t))(v7 + 16))(v7);

}

void __36__DevicePINPane_pinView_pinEntered___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 424));
  objc_msgSend(WeakRetained, "pinEntered:", *(_QWORD *)(a1 + 40));

}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (void)layoutSubviews
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
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  DevicePINKeypadContainerView *keypadContainerView;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat MaxY;
  double v34;
  double v35;
  double v36;
  double MinY;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  objc_super v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v47.receiver = self;
  v47.super_class = (Class)DevicePINPane;
  -[DevicePINPane layoutSubviews](&v47, sel_layoutSubviews);
  -[DevicePINPane bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PSEditingPane viewController](self, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaLayoutGuide");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutFrame");
  v15 = v14;

  v16 = v6 + v15;
  v17 = v10 - v15;
  v18 = v4;
  -[UITransitionView setFrame:](self->_transitionView, "setFrame:", v4, v16, v8, v10 - v15);
  -[UITransitionView bounds](self->_transitionView, "bounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  keypadContainerView = self->_keypadContainerView;
  if (keypadContainerView)
  {
    v27 = *MEMORY[0x1E0C9D648];
    -[DevicePINKeypadContainerView sizeThatFits:](keypadContainerView, "sizeThatFits:", v8, v17);
    v28 = v16;
    v45 = v16;
    v46 = v21;
    v30 = v29;
    v32 = v31;
    v48.origin.x = v18;
    v48.origin.y = v28;
    v48.size.width = v8;
    v48.size.height = v17;
    MaxY = CGRectGetMaxY(v48);
    v44 = v8;
    v34 = v25;
    v35 = v23;
    v36 = PSRoundToPixel(MaxY - v32);
    -[DevicePINKeypadContainerView setFrame:](self->_keypadContainerView, "setFrame:", v27, v36, v30, v32);
    v49.origin.x = v27;
    v49.origin.y = v36;
    v23 = v35;
    v25 = v34;
    v49.size.width = v30;
    v49.size.height = v32;
    v21 = v46;
    MinY = CGRectGetMinY(v49);
    v50.origin.x = v18;
    v50.size.width = v44;
    v50.origin.y = v45;
    v50.size.height = v17;
    v38 = MinY - CGRectGetMinY(v50);
LABEL_3:
    v39 = PSRoundToPixel(v38);
    goto LABEL_4;
  }
  v39 = v19;
  if (-[DevicePINPane requiresKeyboard](self, "requiresKeyboard") && (PSUsePadStylePIN() & 1) == 0)
  {
    v40 = (void *)MEMORY[0x1E0CEA6C8];
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sizeForInterfaceOrientation:", objc_msgSend(v41, "statusBarOrientation"));
    v43 = v42;

    v38 = v39 - v43;
    goto LABEL_3;
  }
LABEL_4:
  -[PINEntryView setFrame:](self->_pinView, "setFrame:", v21, v23, v25, v39);
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (unsigned)PINLength
{
  return self->_PINLength;
}

- (void)setPINLength:(unsigned int)a3
{
  self->_PINLength = a3;
}

- (PINEntryView)pinView
{
  return self->_pinView;
}

- (void)setPinView:(id)a3
{
  objc_storeStrong((id *)&self->_pinView, a3);
}

- (id)passcodeOptionsHandler
{
  return self->_passcodeOptionsHandler;
}

- (void)setPasscodeOptionsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)numericKeyboard
{
  return self->_numericKeyboard;
}

- (void)setNumericKeyboard:(BOOL)a3
{
  self->_numericKeyboard = a3;
}

- (DevicePINKeypadContainerView)keypadContainerView
{
  return (DevicePINKeypadContainerView *)objc_getProperty(self, a2, 536, 1);
}

- (void)setKeypadContainerView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 536);
}

- (NSString)passcodeOptionsTitle
{
  return self->_passcodeOptionsTitle;
}

- (void)setPasscodeOptionsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeOptionsTitle, 0);
  objc_storeStrong((id *)&self->_keypadContainerView, 0);
  objc_storeStrong(&self->_passcodeOptionsHandler, 0);
  objc_storeStrong((id *)&self->_pinView, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
}

@end
