@implementation SBUIPasscodeLockViewWithKeyboard

- (SBUIPasscodeLockViewWithKeyboard)initWithLightStyle:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  SBUIPasscodeLockViewWithKeyboard *v15;
  SBUIPasscodeLockViewWithKeyboard *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  UIView *v26;
  UIView *statusFieldBackground;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  SBUIAlphanumericPasscodeEntryField *v34;
  SBUIAlphanumericPasscodeEntryField *alphaEntryField;
  void *v36;
  SBUIAlphanumericPasscodeEntryField *v37;
  void *v38;
  int v39;
  char v40;
  _BOOL4 v41;
  double v42;
  int v43;
  int v44;
  void **v45;
  void *v46;
  SBPasscodeKeyboardAnimator *v47;
  SBPasscodeKeyboardAnimator *keyboardAnimator;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v56;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v56.receiver = self;
  v56.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  v15 = -[SBUIPasscodeLockViewBase initWithFrame:](&v56, sel_initWithFrame_, v8, v10, v12, v14);
  v16 = v15;
  if (!v15)
    return v16;
  v15->_usesLightStyle = v4;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[SBUIPasscodeLockViewWithKeyboard setFrame:](v16, "setFrame:", v19, v21, v23, v25);
  v26 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
  statusFieldBackground = v16->_statusFieldBackground;
  v16->_statusFieldBackground = v26;

  -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v16, "passcodeAuthenticationView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", v16->_statusFieldBackground);

  v29 = -[SBUIPasscodeLockViewWithKeyboard _newStatusField](v16, "_newStatusField");
  -[SBUIPasscodeLockViewWithKeyboard setStatusField:](v16, "setStatusField:", v29);
  -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v16, "passcodeAuthenticationView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addSubview:", v29);

  -[SBUIPasscodeLockViewBase _statusSubtitleText](v16, "_statusSubtitleText");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "length");

  if (v32)
  {
    v33 = -[SBUIPasscodeLockViewWithKeyboard _newStatusSubtitleView](v16, "_newStatusSubtitleView");
    -[SBUIPasscodeLockViewWithKeyboard setStatusSubtitleView:](v16, "setStatusSubtitleView:", v33);
    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v16, "passcodeAuthenticationView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addSubview:", v33);

  }
  v34 = -[SBUIAlphanumericPasscodeEntryField initWithDefaultSizeAndLightStyle:]([SBUIAlphanumericPasscodeEntryField alloc], "initWithDefaultSizeAndLightStyle:", v4);
  alphaEntryField = v16->_alphaEntryField;
  v16->_alphaEntryField = v34;

  -[SBUIPasscodeEntryField setDelegate:](v16->_alphaEntryField, "setDelegate:", v16);
  -[SBUIPasscodeLockViewBase _setEntryField:](v16, "_setEntryField:", v16->_alphaEntryField);
  -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v16, "passcodeAuthenticationView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v16->_alphaEntryField);

  v37 = v16->_alphaEntryField;
  v38 = (void *)MEMORY[0x1E0CEA5E8];
  v39 = __sb__runningInSpringBoard();
  v40 = v39;
  if (v39)
  {
    v41 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v32, "userInterfaceIdiom") == 1;
  }
  if (v41)
    v42 = 27.0;
  else
    v42 = 17.0;
  v43 = __sb__runningInSpringBoard();
  if (v43)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v44 = 0;
LABEL_18:
      v45 = (void **)MEMORY[0x1E0CEB3C0];
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "userInterfaceIdiom"))
    {
      v44 = 1;
      goto LABEL_18;
    }
  }
  v44 = v43 ^ 1;
  if (SBFEffectiveHomeButtonType() != 2)
    goto LABEL_18;
  v45 = (void **)MEMORY[0x1E0CEB408];
LABEL_19:
  objc_msgSend(v38, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v45, v42));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeEntryField setFont:](v37, "setFont:", v46);

  if (v44)
  if ((v40 & 1) == 0)

  v16->_keyboardVisible = 1;
  v47 = objc_alloc_init(SBPasscodeKeyboardAnimator);
  keyboardAnimator = v16->_keyboardAnimator;
  v16->_keyboardAnimator = v47;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addObserver:selector:name:object:", v16, sel__hardwareReturnKeyPressed_, CFSTR("SBUIHardwareKeyboardReturnKeyPressedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addObserver:selector:name:object:", v16, sel__keyboardDidHideNotification_, *MEMORY[0x1E0CEB820], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "addObserver:selector:name:object:", v16, sel__keyboardWillShowNotification_, *MEMORY[0x1E0CEB978], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "addObserver:selector:name:object:", v16, sel__keyboardWillChangeFrameNotification_, *MEMORY[0x1E0CEB960], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addObserver:selector:name:object:", v16, sel__keyboardDidRequestDismissalNotification_, CFSTR("UIKeyboardPrivateDidRequestDismissalNotification"), 0);

  -[SBUIPasscodeLockViewWithKeyboard _toggleForEmergencyCall](v16, "_toggleForEmergencyCall");
  if (v16->_usesLightStyle)
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewBase setCustomBackgroundColor:](v16, "setCustomBackgroundColor:", v54);

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase dealloc](&v4, sel_dealloc);
}

- (void)_luminanceBoostDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase _luminanceBoostDidChange](&v4, sel__luminanceBoostDidChange);
  if (!self->_usesLightStyle)
  {
    objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewBase _luminosityBoost](self, "_luminosityBoost");
    objc_msgSend(v3, "_setPasscodeOutlineAlpha:");

  }
}

- (id)passcode
{
  return -[SBUIPasscodeEntryField stringValue](self->_alphaEntryField, "stringValue");
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase setShowsEmergencyCallButton:](&v4, sel_setShowsEmergencyCallButton_, a3);
  -[SBUIPasscodeLockViewWithKeyboard _toggleForEmergencyCall](self, "_toggleForEmergencyCall");
}

- (void)setShowsStatusField:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase setShowsStatusField:](&v4, sel_setShowsStatusField_, a3);
  -[SBUIPasscodeLockViewWithKeyboard _toggleForStatusField](self, "_toggleForStatusField");
}

- (void)beginTransitionToState:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase beginTransitionToState:](&v4, sel_beginTransitionToState_, a3);
  -[SBUIPasscodeLockViewWithKeyboard _setKeyboardTracksLockView:](self, "_setKeyboardTracksLockView:", 1);
}

- (void)didEndTransitionToState:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase didEndTransitionToState:](&v4, sel_didEndTransitionToState_, a3);
  -[SBUIPasscodeLockViewWithKeyboard _setKeyboardTracksLockView:](self, "_setKeyboardTracksLockView:", 0);
}

- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v7 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settingsWithDuration:timingFunction:", v8, 0.15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBPasscodeKeyboardAnimator setAnimationSettings:](self->_keyboardAnimator, "setAnimationSettings:", v9);
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase updateForTransitionToPasscodeView:animated:](&v10, sel_updateForTransitionToPasscodeView_animated_, v5, v4);

}

- (id)_viewForKeyboardTracking
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_currentInputView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setKeyboardTracksLockView:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  UIView *v8;
  UIView *keyboardTrackingView;
  void *v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  void *v25;
  double MinX;
  void *v27;
  void *v28;
  double MaxX;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  UIView *v39;
  void *v40;
  _QWORD v41[4];
  UIView *v42;
  SBUIPasscodeLockViewWithKeyboard *v43;
  _QWORD v44[5];
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = a3;
  v44[4] = *MEMORY[0x1E0C80C00];
  self->_keyboardTracksLockView = a3;
  -[SBUIPasscodeLockViewWithKeyboard _viewForKeyboardTracking](self, "_viewForKeyboardTracking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (!self->_keyboardTrackingView)
    {
      v7 = objc_alloc(MEMORY[0x1E0CEABB0]);
      v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      keyboardTrackingView = self->_keyboardTrackingView;
      self->_keyboardTrackingView = v8;

      -[SBUIPasscodeLockViewBase passcodeAuthenticationView](self, "passcodeAuthenticationView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_keyboardTrackingView);

    }
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __63__SBUIPasscodeLockViewWithKeyboard__setKeyboardTracksLockView___block_invoke;
    v41[3] = &unk_1E4C3E6A0;
    v12 = v6;
    v42 = v12;
    v43 = self;
    objc_msgSend(v11, "performWithoutAnimation:", v41);
    -[UIView layer](v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("KeyboardTracking_MatchMoveAnimation"));

    objc_msgSend(MEMORY[0x1E0CD27C0], "animation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](self->_keyboardTrackingView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceLayer:", v15);

    objc_msgSend(v14, "setDuration:", INFINITY);
    -[UIView layer](self->_keyboardTrackingView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v25 = (void *)MEMORY[0x1E0CB3B18];
    v45.origin.x = v18;
    v45.origin.y = v20;
    v45.size.width = v22;
    v45.size.height = v24;
    MinX = CGRectGetMinX(v45);
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v22;
    v46.size.height = v24;
    objc_msgSend(v25, "valueWithCGPoint:", MinX, CGRectGetMinY(v46));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v27;
    v28 = (void *)MEMORY[0x1E0CB3B18];
    v47.origin.x = v18;
    v47.origin.y = v20;
    v47.size.width = v22;
    v47.size.height = v24;
    MaxX = CGRectGetMaxX(v47);
    v48.origin.x = v18;
    v48.origin.y = v20;
    v48.size.width = v22;
    v48.size.height = v24;
    objc_msgSend(v28, "valueWithCGPoint:", MaxX, CGRectGetMinY(v48));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v30;
    v31 = (void *)MEMORY[0x1E0CB3B18];
    v49.origin.x = v18;
    v49.origin.y = v20;
    v49.size.width = v22;
    v49.size.height = v24;
    v32 = CGRectGetMaxX(v49);
    v50.origin.x = v18;
    v50.origin.y = v20;
    v50.size.width = v22;
    v50.size.height = v24;
    objc_msgSend(v31, "valueWithCGPoint:", v32, CGRectGetMaxY(v50));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v33;
    v34 = (void *)MEMORY[0x1E0CB3B18];
    v51.origin.x = v18;
    v51.origin.y = v20;
    v51.size.width = v22;
    v51.size.height = v24;
    v35 = CGRectGetMinX(v51);
    v52.origin.x = v18;
    v52.origin.y = v20;
    v52.size.width = v22;
    v52.size.height = v24;
    objc_msgSend(v34, "valueWithCGPoint:", v35, CGRectGetMaxY(v52));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v44[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourcePoints:", v37);

    objc_msgSend(v14, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v14, "setRemovedOnCompletion:", 0);
    -[UIView layer](v12, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addAnimation:forKey:", v14, CFSTR("KeyboardTracking_MatchMoveAnimation"));

    v39 = v42;
  }
  else
  {
    objc_msgSend(v5, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "removeAnimationForKey:", CFSTR("KeyboardTracking_MatchMoveAnimation"));

    -[UIView removeFromSuperview](self->_keyboardTrackingView, "removeFromSuperview");
    v39 = self->_keyboardTrackingView;
    self->_keyboardTrackingView = 0;
  }

}

uint64_t __63__SBUIPasscodeLockViewWithKeyboard__setKeyboardTracksLockView___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 880), "setFrame:", 0.0, v6 - v5, v3, v5);
}

- (void)layoutSubviews
{
  objc_super v3;

  -[SBUIPasscodeLockViewWithKeyboard _setKeyboardTracksLockView:](self, "_setKeyboardTracksLockView:", self->_keyboardTracksLockView);
  -[SBUIPasscodeLockViewWithKeyboard _layoutForMinimizationState:](self, "_layoutForMinimizationState:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase layoutSubviews](&v3, sel_layoutSubviews);
}

- (BOOL)becomeFirstResponder
{
  SBUIPasscodeLockViewWithKeyboard *v2;
  uint64_t v3;
  _QWORD v5[6];
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  self->_isResigningResponderStatus = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke;
  v6[3] = &unk_1E4C3E408;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v6);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_2;
  v5[3] = &unk_1E4C3F4E8;
  v5[4] = v2;
  v5[5] = &v7;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 32, v5, 0, 0.0, 0.0);
  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

void __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "window");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "makeKeyAndVisible");

}

uint64_t __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_2(uint64_t a1)
{
  __int128 v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 824);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_3;
  v4[3] = &unk_1E4C3F538;
  v5 = v1;
  return objc_msgSend(v2, "applyToKeyboardOperations:", v4);
}

id __56__SBUIPasscodeLockViewWithKeyboard_becomeFirstResponder__block_invoke_3(uint64_t a1)
{
  id result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  result = objc_msgSendSuper2(&v3, sel_becomeFirstResponder);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (BOOL)resignFirstResponder
{
  SBUIPasscodeLockViewWithKeyboard *v2;
  void *v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  self->_isResigningResponderStatus = 1;
  -[SBUIPasscodeLockViewWithKeyboard _viewForKeyboardTracking](self, "_viewForKeyboardTracking");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke;
  v6[3] = &unk_1E4C3F4E8;
  v6[4] = v2;
  v6[5] = &v7;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 32, v6, 0, 0.0, 0.0);
  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke(uint64_t a1)
{
  __int128 v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;

  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 824);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke_2;
  v4[3] = &unk_1E4C3F538;
  v5 = v1;
  return objc_msgSend(v2, "applyToKeyboardOperations:", v4);
}

id __56__SBUIPasscodeLockViewWithKeyboard_resignFirstResponder__block_invoke_2(uint64_t a1)
{
  id result;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  result = objc_msgSendSuper2(&v3, sel_resignFirstResponder);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

- (void)becomeActiveWithAnimationSettings:(id)a3
{
  -[SBPasscodeKeyboardAnimator setAnimationSettings:](self->_keyboardAnimator, "setAnimationSettings:", a3);
  -[SBUIPasscodeLockViewWithKeyboard becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)resignActiveWithAnimationSettings:(id)a3
{
  -[SBPasscodeKeyboardAnimator setAnimationSettings:](self->_keyboardAnimator, "setAnimationSettings:", a3);
  -[SBUIPasscodeLockViewWithKeyboard resignFirstResponder](self, "resignFirstResponder");
}

- (void)_hardwareReturnKeyPressed:(id)a3
{
  if ((-[SBUIPasscodeLockViewWithKeyboard isFirstResponder](self, "isFirstResponder", a3) & 1) != 0
    || -[SBUIPasscodeEntryField isFirstResponder](self->_alphaEntryField, "isFirstResponder"))
  {
    -[SBUIPasscodeLockViewWithKeyboard _acceptOrCancelReturnKeyPress](self, "_acceptOrCancelReturnKeyPress");
  }
}

- (void)_notifyDelegatePasscodeEntered
{
  id v3;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeLockViewPasscodeEntered:", self);

}

- (void)_notifyDelegateThatEmergencyCallButtonWasPressed
{
  id v3;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeLockViewEmergencyCallButtonPressed:", self);

}

- (void)_notifyDelegatePasscodeCancelled
{
  id v3;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "passcodeLockViewCancelButtonPressed:", self);

}

- (void)passcodeEntryFieldDidCancelEntry:(id)a3
{
  if (-[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton", a3))
    -[SBUIPasscodeLockViewWithKeyboard _notifyDelegatePasscodeCancelled](self, "_notifyDelegatePasscodeCancelled");
}

- (BOOL)passcodeEntryField:(id)a3 shouldInsertText:(id)a4
{
  return 1;
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v7 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "passcodeLockViewPasscodeDidChange:", self);
      v5 = v7;
    }
  }

}

- (BOOL)passcodeEntryFieldShouldShowSystemKeyboard:(id)a3
{
  return 1;
}

- (id)_statusTitleView
{
  return self->_statusField;
}

- (id)_statusSubtitleView
{
  return self->_statusSubtitleView;
}

- (id)_alphanumericPasscodeEntryField
{
  return self->_alphaEntryField;
}

- (id)_newStatusField
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  char v11;
  double v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  double v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  void **v22;
  int v23;
  double v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  char v31;
  int v32;
  char v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v4 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  v5 = 0x1E0CEA000uLL;
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_9:
      v8 = (void *)MEMORY[0x1E0CEA5E8];
      v9 = __sb__runningInSpringBoard();
      if ((_DWORD)v9)
      {
        if (SBFEffectiveDeviceClass() == 2)
        {
          v10 = 0;
          v11 = 0;
          v12 = 27.0;
          goto LABEL_92;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v40, "userInterfaceIdiom") == 1)
        {
          v10 = 0;
          v12 = 27.0;
          v11 = 1;
          goto LABEL_92;
        }
      }
      v11 = v9 ^ 1;
      v16 = __sb__runningInSpringBoard();
      if (v16)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          v10 = 0;
          v12 = 18.0;
          goto LABEL_92;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v9 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)v9, "userInterfaceIdiom"))
        {
          v12 = 18.0;
          v10 = 1;
          goto LABEL_92;
        }
      }
      v10 = v16 ^ 1;
      v35 = SBFEffectiveHomeButtonType();
      v12 = 18.0;
      if (v35 == 2)
        v12 = 22.0;
LABEL_92:
      objc_msgSend(v8, "systemFontOfSize:", v12);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFont:", v36);

      if (v10)
      if ((v11 & 1) == 0)
        goto LABEL_69;
LABEL_68:

      goto LABEL_69;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom"))
    {

    }
    else
    {
      v7 = SBFEffectiveHomeButtonType();

      if (v7 == 2)
        goto LABEL_9;
    }
  }
  v13 = (void *)MEMORY[0x1E0CEA5E8];
  v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      v41 = 0;
      v15 = 27;
      goto LABEL_32;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "userInterfaceIdiom") == 1)
    {
      v15 = 27;
      v41 = 0x100000000;
      goto LABEL_32;
    }
  }
  v2 = __sb__runningInSpringBoard();
  HIDWORD(v41) = v14 ^ 1;
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v41) = 0;
      v15 = 18;
      goto LABEL_32;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v39, "userInterfaceIdiom"))
    {
      v15 = 18;
      LODWORD(v41) = 1;
      goto LABEL_32;
    }
  }
  LODWORD(v41) = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
    v15 = 22;
  else
    v15 = 18;
LABEL_32:
  v17 = (double)v15;
  v18 = (void *)__sb__runningInSpringBoard();
  if ((_DWORD)v18)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v9 = 0;
      goto LABEL_40;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "userInterfaceIdiom"))
    {
      v9 = 1;
      goto LABEL_40;
    }
  }
  v9 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = (void **)MEMORY[0x1E0CEB3F8];
    goto LABEL_57;
  }
LABEL_40:
  v23 = __sb__runningInSpringBoard();
  if (v23)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v19 = 0;
      v20 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "userInterfaceIdiom"))
    {
      v20 = 0;
      v19 = 1;
      goto LABEL_51;
    }
  }
  v19 = v23 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v37 = (void *)v2;
  v20 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v24 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_53;
  v5 = 0x1E0CEA000uLL;
LABEL_51:
  v25 = __sb__runningInSpringBoard();
  if (v25)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_53:
      v21 = 0;
      v22 = (void **)MEMORY[0x1E0CEB3D0];
      goto LABEL_57;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom") == 1)
    {
      v22 = (void **)MEMORY[0x1E0CEB3D0];
      v21 = 1;
      goto LABEL_57;
    }
  }
  v21 = v25 ^ 1;
  v22 = (void **)MEMORY[0x1E0CEB3D8];
LABEL_57:
  objc_msgSend(v13, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v22, v17));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v26);

  if (v21)
  if (v20)

  if (v19)
  if ((_DWORD)v9)

  if ((_DWORD)v41)
  if (HIDWORD(v41))
    goto LABEL_68;
LABEL_69:
  objc_msgSend(v4, "setNumberOfLines:", 0);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  -[SBUIPasscodeLockViewBase _statusText](self, "_statusText");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v27);

  objc_msgSend(v4, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v28);

  if (self->_usesLightStyle)
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v29);

  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  v30 = __sb__runningInSpringBoard();
  v31 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(v4, "setMinimumScaleFactor:", 0.444444444);
      goto LABEL_86;
    }
LABEL_77:
    v32 = __sb__runningInSpringBoard();
    v33 = v32;
    if (v32)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        objc_msgSend(v4, "setMinimumScaleFactor:", 0.666666667);
        goto LABEL_85;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v9, "userInterfaceIdiom"))
      {
        objc_msgSend(v4, "setMinimumScaleFactor:", 0.666666667);
LABEL_84:

LABEL_85:
        if ((v31 & 1) != 0)
          return v4;
LABEL_86:

        return v4;
      }
    }
    objc_msgSend(v4, "setMinimumScaleFactor:", dbl_1A47AEFA0[SBFEffectiveHomeButtonType() == 2]);
    if ((v33 & 1) != 0)
      goto LABEL_85;
    goto LABEL_84;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_77;
  objc_msgSend(v4, "setMinimumScaleFactor:", 0.444444444);
  return v4;
}

- (id)_newStatusSubtitleView
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  char v11;
  double v12;
  void *v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  void **v25;
  uint64_t v26;
  double v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  char v33;
  int v34;
  char v35;
  void *v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SBUIPasscodeLockViewWithKeyboard *v45;

  v4 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  v5 = 0x1E0CEA000uLL;
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_9:
      v8 = (void *)MEMORY[0x1E0CEA5E8];
      v9 = __sb__runningInSpringBoard();
      if ((_DWORD)v9)
      {
        if (SBFEffectiveDeviceClass() == 2)
        {
          v10 = 0;
          v11 = 0;
          v12 = 22.0;
          goto LABEL_92;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v44, "userInterfaceIdiom") == 1)
        {
          v10 = 0;
          v12 = 22.0;
          v11 = 1;
          goto LABEL_92;
        }
      }
      v11 = v9 ^ 1;
      v2 = __sb__runningInSpringBoard();
      if ((_DWORD)v2)
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        {
          v10 = 0;
          v12 = 14.0;
          goto LABEL_92;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v9 = objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)v9, "userInterfaceIdiom"))
        {
          v12 = 14.0;
          v10 = 1;
          goto LABEL_92;
        }
      }
      v10 = v2 ^ 1;
      v38 = SBFEffectiveHomeButtonType();
      v12 = 14.0;
      if (v38 == 2)
        v12 = 15.0;
LABEL_92:
      objc_msgSend(v8, "systemFontOfSize:", v12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFont:", v39);

      if (v10)
      if ((v11 & 1) == 0)
        goto LABEL_69;
LABEL_68:

      goto LABEL_69;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceIdiom"))
    {

    }
    else
    {
      v7 = SBFEffectiveHomeButtonType();

      if (v7 == 2)
        goto LABEL_9;
    }
  }
  v13 = (void *)MEMORY[0x1E0CEA5E8];
  v14 = __sb__runningInSpringBoard();
  v45 = self;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      v15 = 0;
      v16 = 0;
      v17 = 22;
      goto LABEL_32;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "userInterfaceIdiom") == 1)
    {
      v16 = 0;
      v17 = 22;
      v15 = 1;
      goto LABEL_32;
    }
  }
  v15 = v14 ^ 1;
  v18 = __sb__runningInSpringBoard();
  if (v18)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v16 = 0;
      v17 = 14;
      goto LABEL_32;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "userInterfaceIdiom"))
    {
      v17 = 14;
      v16 = 1;
      goto LABEL_32;
    }
  }
  v16 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
    v17 = 15;
  else
    v17 = 14;
LABEL_32:
  v19 = (double)v17;
  v20 = __sb__runningInSpringBoard();
  if (v20)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v21 = 0;
      goto LABEL_40;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v42, "userInterfaceIdiom"))
    {
      v21 = 1;
      goto LABEL_40;
    }
  }
  v21 = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v2 = 0x1E0CEA000uLL;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = (void **)MEMORY[0x1E0CEB400];
    goto LABEL_57;
  }
LABEL_40:
  v26 = __sb__runningInSpringBoard();
  if ((_DWORD)v26)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "userInterfaceIdiom"))
    {
      v23 = 0;
      v22 = 1;
      goto LABEL_51;
    }
  }
  v2 = 0x1E0CEA000uLL;
  v22 = v26 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v26, "_referenceBounds");
  }
  v41 = (void *)v26;
  v23 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v27 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_53;
  v5 = 0x1E0CEA000uLL;
LABEL_51:
  v28 = __sb__runningInSpringBoard();
  if (v28)
  {
    v2 = 0x1E0CEA000uLL;
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_53:
      v24 = 0;
      v25 = (void **)MEMORY[0x1E0CEB3D0];
      goto LABEL_57;
    }
  }
  else
  {
    v2 = 0x1E0CEA000uLL;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom") == 1)
    {
      v25 = (void **)MEMORY[0x1E0CEB3D0];
      v24 = 1;
      goto LABEL_57;
    }
  }
  v24 = v28 ^ 1;
  v25 = (void **)MEMORY[0x1E0CEB3D8];
LABEL_57:
  objc_msgSend(v13, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v25, v19));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v29);

  if (v24)
  if (v23)

  if (v22)
  if (v21)

  self = v45;
  if (v16)

  if (v15)
    goto LABEL_68;
LABEL_69:
  objc_msgSend(v4, "setNumberOfLines:", 0, v40);
  objc_msgSend(v4, "setLineBreakMode:", 0);
  objc_msgSend(v4, "setClipsToBounds:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v30);

  if (self->_usesLightStyle)
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v31);

  objc_msgSend(v4, "setTextAlignment:", 1);
  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  v32 = __sb__runningInSpringBoard();
  v33 = v32;
  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "userInterfaceIdiom") == 1)
    {
      objc_msgSend(v4, "setMinimumScaleFactor:", 0.545454545);
      goto LABEL_86;
    }
LABEL_77:
    v34 = __sb__runningInSpringBoard();
    v35 = v34;
    if (v34)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        objc_msgSend(v4, "setMinimumScaleFactor:", 0.857142857);
        goto LABEL_85;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v2 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v2, "userInterfaceIdiom"))
      {
        objc_msgSend(v4, "setMinimumScaleFactor:", 0.857142857);
LABEL_84:

LABEL_85:
        if ((v33 & 1) != 0)
          goto LABEL_87;
LABEL_86:

        goto LABEL_87;
      }
    }
    objc_msgSend(v4, "setMinimumScaleFactor:", dbl_1A47AEFB0[SBFEffectiveHomeButtonType() == 2]);
    if ((v35 & 1) != 0)
      goto LABEL_85;
    goto LABEL_84;
  }
  if (SBFEffectiveDeviceClass() != 2)
    goto LABEL_77;
  objc_msgSend(v4, "setMinimumScaleFactor:", 0.545454545);
LABEL_87:
  -[SBUIPasscodeLockViewBase _statusSubtitleText](self, "_statusSubtitleText");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v36);

  return v4;
}

- (void)_acceptOrCancelReturnKeyPress
{
  void *v3;
  uint64_t v4;

  -[SBUIPasscodeEntryField stringValue](self->_alphaEntryField, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[SBUIPasscodeLockViewWithKeyboard _notifyDelegatePasscodeEntered](self, "_notifyDelegatePasscodeEntered");
  }
  else if (-[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton"))
  {
    -[SBUIPasscodeLockViewWithKeyboard _notifyDelegatePasscodeCancelled](self, "_notifyDelegatePasscodeCancelled");
  }
}

- (void)_toggleForEmergencyCall
{
  void *v2;
  void *v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  double v11;
  UIControl *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void **v18;
  int v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  UIControl *v29;
  void *v30;
  void *emergencyCallButton;
  SBUIRingViewLabelButton *v32;
  UIControl *v33;
  UIControl *v34;
  UIControl *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  if (-[SBUIPasscodeLockViewBase showsEmergencyCallButton](self, "showsEmergencyCallButton"))
  {
    -[UIView backgroundColor](self->_statusFieldBackground, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView alpha](self->_statusFieldBackground, "alpha");
    if (self->_emergencyCallButton)
    {
LABEL_63:
      -[SBUIPasscodeLockViewBase passcodeAuthenticationView](self, "passcodeAuthenticationView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addSubview:", self->_emergencyCallButton);

      goto LABEL_64;
    }
    v6 = v5;
    v7 = (void *)MEMORY[0x1E0CEA5E8];
    v8 = __sb__runningInSpringBoard();
    v9 = 0x1E0CEA000uLL;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v10 = 0;
        v11 = 12.0;
        goto LABEL_14;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "userInterfaceIdiom"))
      {
        v11 = 12.0;
        v10 = 1;
        goto LABEL_14;
      }
    }
    v10 = v8 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
      v11 = 16.0;
    else
      v11 = 12.0;
LABEL_14:
    v13 = __sb__runningInSpringBoard();
    if (v13)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v14 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "userInterfaceIdiom"))
      {
        v14 = 1;
        goto LABEL_22;
      }
    }
    v14 = v13 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = (void **)MEMORY[0x1E0CEB400];
      goto LABEL_39;
    }
LABEL_22:
    v19 = __sb__runningInSpringBoard();
    if (v19)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v15 = 0;
        v16 = 0;
        goto LABEL_33;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "userInterfaceIdiom"))
      {
        v15 = 0;
        v16 = 1;
        goto LABEL_33;
      }
    }
    v16 = v19 ^ 1;
    v9 = __sb__runningInSpringBoard();
    if ((_DWORD)v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    v15 = v9 ^ 1;
    BSSizeRoundForScale();
    v39 = v2;
    if (v20 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
      goto LABEL_35;
    v9 = 0x1E0CEA000uLL;
LABEL_33:
    v21 = __sb__runningInSpringBoard();
    if (v21)
    {
      if (SBFEffectiveDeviceClass() == 2)
      {
LABEL_35:
        v17 = 0;
        v18 = (void **)MEMORY[0x1E0CEB3C8];
        goto LABEL_39;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v9 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend((id)v9, "userInterfaceIdiom") == 1)
      {
        v18 = (void **)MEMORY[0x1E0CEB3C8];
        v17 = 1;
        goto LABEL_39;
      }
    }
    v17 = v21 ^ 1;
    v18 = (void **)MEMORY[0x1E0CEB3D0];
LABEL_39:
    objc_msgSend(v7, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v18, v11));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)

    if (v15)
    if (v16)

    if (v14)
    if (v10)

    if (self->_usesLightStyle)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("PASSCODE_EMERGENCY"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (__sb__runningInSpringBoard())
    {
      if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
        && SBFEffectiveHomeButtonType() == 2)
      {
        goto LABEL_60;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "userInterfaceIdiom"))
      {

      }
      else
      {
        v27 = SBFEffectiveHomeButtonType();

        if (v27 == 2)
        {
LABEL_60:
          v28 = objc_alloc(MEMORY[0x1E0CEA3A0]);
          v29 = (UIControl *)objc_msgSend(v28, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
          -[UIControl setTitle:forState:](v29, "setTitle:forState:", v25, 0);
          -[UIControl setTitleColor:forState:](v29, "setTitleColor:forState:", v23, 0);
          -[UIControl titleLabel](v29, "titleLabel");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFont:", v22);

          emergencyCallButton = self->_emergencyCallButton;
          self->_emergencyCallButton = v29;
LABEL_62:

          -[UIControl addTarget:action:forControlEvents:](self->_emergencyCallButton, "addTarget:action:forControlEvents:", self, sel__notifyDelegateThatEmergencyCallButtonWasPressed, 64);
          -[UIControl setExclusiveTouch:](self->_emergencyCallButton, "setExclusiveTouch:", 1);

          goto LABEL_63;
        }
      }
    }
    v32 = [SBUIRingViewLabelButton alloc];
    v33 = -[SBUIRingViewLabelButton initWithFrame:](v32, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIControl backgroundRing](v33, "backgroundRing");
    emergencyCallButton = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(emergencyCallButton, "setColorInsideRing:", v4);
    objc_msgSend(emergencyCallButton, "setColorOutsideRing:", v4);
    objc_msgSend(emergencyCallButton, "setAlphaInsideRing:", v6);
    objc_msgSend(emergencyCallButton, "setAlphaOutsideRing:", v6);
    objc_msgSend(emergencyCallButton, "setCornerRadius:", 4.0);
    v34 = self->_emergencyCallButton;
    self->_emergencyCallButton = v33;
    v35 = v33;

    -[UIControl label](v35, "label");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "setFont:", v22);
    objc_msgSend(v36, "setTextColor:", v23);
    objc_msgSend(v36, "setText:", v25);
    objc_msgSend(v36, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v36, "setMinimumScaleFactor:", 0.5);

    goto LABEL_62;
  }
  v12 = self->_emergencyCallButton;
  if (v12)
  {
    -[UIControl removeFromSuperview](v12, "removeFromSuperview");
    v4 = self->_emergencyCallButton;
    self->_emergencyCallButton = 0;
LABEL_64:

  }
  -[SBUIPasscodeLockViewWithKeyboard setNeedsLayout](self, "setNeedsLayout");
}

- (void)_toggleForStatusField
{
  _BOOL4 v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  v3 = -[SBUIPasscodeLockViewBase showsStatusField](self, "showsStatusField");
  -[SBUIPasscodeLockViewWithKeyboard statusField](self, "statusField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = !v3;
  objc_msgSend(v4, "setHidden:", v5);

  -[SBUIPasscodeLockViewWithKeyboard statusSubtitleView](self, "statusSubtitleView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

}

- (void)_layoutForMinimizationState:(BOOL)a3
{
  void *v3;
  _BOOL4 v4;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MinY;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat Height;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  uint64_t v35;
  int v36;
  char v37;
  uint64_t v38;
  int v39;
  char v40;
  double v41;
  BOOL v42;
  double v43;
  void *v44;
  double v45;
  int v46;
  char v47;
  int v48;
  char v49;
  NSString *v50;
  _BOOL4 IsAccessibilityCategory;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  double Width;
  id v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v4 = a3;
  -[SBUIPasscodeLockViewWithKeyboard bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBUIPasscodeLockViewWithKeyboard _keyboardFrameForInterfaceOrientation:](self, "_keyboardFrameForInterfaceOrientation:", -[SBUIPasscodeLockViewBase _orientation](self, "_orientation"));
  MinY = CGRectGetMinY(v58);
  -[SBUIAlphanumericPasscodeEntryField frame](self->_alphaEntryField, "frame");
  v16 = v15;
  v18 = v17;
  v59.origin.x = v7;
  v59.origin.y = v9;
  v59.size.width = v11;
  v59.size.height = v13;
  Width = CGRectGetWidth(v59);
  -[SBUIPasscodeEntryField sizeThatFits:](self->_alphaEntryField, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v20 = v19;
  if (!v4)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
        || SBFEffectiveHomeButtonType() != 2)
      {
        goto LABEL_12;
      }
LABEL_11:
      -[SBUIPasscodeLockViewWithKeyboard _keyboardToEntryFieldOffset](self, "_keyboardToEntryFieldOffset");
      v26 = MinY - v25 - v20;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "userInterfaceIdiom"))
    {

    }
    else
    {
      v24 = SBFEffectiveHomeButtonType();

      if (v24 == 2)
        goto LABEL_11;
    }
LABEL_12:
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeyboardEntryFieldOffset:", -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"));
    goto LABEL_13;
  }
  v60.origin.x = v7;
  v60.origin.y = v9;
  v60.size.width = v11;
  v60.size.height = v13;
  Height = CGRectGetHeight(v60);
  v22 = SBUIFloatFloorForMainScreenScale(Height * 0.5 - v20);
LABEL_13:
  v26 = v22;
LABEL_14:
  -[SBUIPasscodeLockViewWithKeyboard statusSubtitleView](self, "statusSubtitleView");
  v57 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "length");

  if (!v28)
    goto LABEL_36;
  -[SBUIPasscodeLockViewWithKeyboard _statusTitleWidth](self, "_statusTitleWidth");
  v30 = v29;
  v61.size.width = v11;
  v61.origin.x = v7;
  v61.size.height = v13;
  v61.origin.y = v9;
  objc_msgSend(v57, "sizeThatFits:", v30, CGRectGetHeight(v61));
  v32 = v31;
  objc_msgSend(v57, "font");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lineHeight");
  v35 = (uint64_t)(v32 / v34);

  v36 = __sb__runningInSpringBoard();
  v37 = v36;
  if (v36)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2)
    {
      v38 = 2;
      goto LABEL_34;
    }
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
  {
LABEL_21:
    v39 = __sb__runningInSpringBoard();
    v40 = v39;
    if (v39)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    v42 = v41 == *(double *)(MEMORY[0x1E0DAB260] + 272);
    if (v43 != *(double *)(MEMORY[0x1E0DAB260] + 280))
      v42 = 0;
    if (v42)
      v38 = 1;
    else
      v38 = 2;
    if ((v40 & 1) == 0)

    if ((v37 & 1) != 0)
      goto LABEL_34;
    goto LABEL_33;
  }
  v38 = 2;
LABEL_33:

LABEL_34:
  if (v35 > v38)
  {
    objc_msgSend(v57, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lineHeight");
    v26 = v26 + (double)(v35 - v38) * v45;

  }
LABEL_36:
  -[SBUIAlphanumericPasscodeEntryField setFrame:](self->_alphaEntryField, "setFrame:", v16, v26, Width, v18);
  if (self->_emergencyCallButton)
  {
    v46 = __sb__runningInSpringBoard();
    v47 = v46;
    if (v46)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
        goto LABEL_49;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "userInterfaceIdiom"))
        goto LABEL_48;
    }
    v48 = __sb__runningInSpringBoard();
    v49 = v48;
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if ((v49 & 1) == 0)

    if ((v47 & 1) != 0)
    {
LABEL_49:
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
      v50 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v50);

      if (!IsAccessibilityCategory)
        goto LABEL_62;
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
          || SBFEffectiveHomeButtonType() != 2)
        {
          goto LABEL_60;
        }
LABEL_59:
        -[UIControl titleLabel](self->_emergencyCallButton, "titleLabel");
        v54 = objc_claimAutoreleasedReturnValue();
LABEL_61:
        v55 = (void *)v54;
        -[SBUIPasscodeLockViewWithKeyboard _largeTextEmergencyButtonMaxWidth](self, "_largeTextEmergencyButtonMaxWidth");
        objc_msgSend(v55, "sizeThatFits:");

LABEL_62:
        UIRectCenteredXInRectScale();
        -[UIControl setFrame:](self->_emergencyCallButton, "setFrame:", 0);
        goto LABEL_63;
      }
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "userInterfaceIdiom"))
      {

      }
      else
      {
        v53 = SBFEffectiveHomeButtonType();

        if (v53 == 2)
          goto LABEL_59;
      }
LABEL_60:
      -[UIControl label](self->_emergencyCallButton, "label");
      v54 = objc_claimAutoreleasedReturnValue();
      goto LABEL_61;
    }
LABEL_48:

    goto LABEL_49;
  }
LABEL_63:
  -[SBUIPasscodeLockViewWithKeyboard _layoutStatusView](self, "_layoutStatusView");
  -[SBUIPasscodeLockViewWithKeyboard bringSubviewToFront:](self, "bringSubviewToFront:", self->_statusField);

}

- (CGRect)_keyboardFrameForInterfaceOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "keyboardSizeForInterfaceOrientation:");
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0CEA6E8], "deviceSpecificPaddingForInterfaceOrientation:inputMode:", a3, 0);
  v9 = v7 + v8;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  v13 = v12 - v9;
  v14 = 0.0;
  v15 = v5;
  v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (double)_keyboardToEntryFieldOffset
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  int v6;
  char v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double result;
  double v13;
  int v14;
  char v15;
  uint64_t v16;

  v4 = -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented");
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") != 1)
    {

      goto LABEL_15;
    }
  }
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
  }
  BSSizeRoundForScale();
  v9 = v8;
  v10 = *(double *)(MEMORY[0x1E0DAB260] + 264);
  if ((v7 & 1) == 0)

  if ((v5 & 1) == 0)
  if (v9 >= v10)
  {
    v11 = !v4;
    result = 242.0;
    v13 = 430.0;
    goto LABEL_25;
  }
LABEL_15:
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_17;
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend((id)v5, "userInterfaceIdiom");

  if (v16 == 1)
  {
LABEL_24:
    v11 = !v4;
    result = 135.0;
    v13 = 322.0;
LABEL_25:
    if (!v11)
      return v13;
    return result;
  }
LABEL_17:
  v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    v15 = v14;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_33;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      if ((v15 & 1) != 0)
        goto LABEL_34;
      goto LABEL_30;
    }
    if ((v15 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v5, "userInterfaceIdiom") && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_30:

LABEL_34:
      objc_msgSend(MEMORY[0x1E0DA9E68], "pinAlphanumericEntryFieldBottomYDistanceFromKeyboard:", v4, result);
      return result;
    }
  }

LABEL_33:
  result = 4.0;
  if (!v4)
    goto LABEL_34;
  return result;
}

- (double)_statusFieldHeightWithWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBUIPasscodeLockViewWithKeyboard statusField](self, "statusField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", a3, 0.0);
  v6 = v5;

  return v6;
}

- (double)_statusTitleWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 + -40.0;

  return v4;
}

- (double)_largeTextEmergencyButtonMaxWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 + -40.0;

  return v4;
}

- (void)updateStatusText:(id)a3 subtitle:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  objc_super v32;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewBase updateStatusText:subtitle:animated:](&v32, sel_updateStatusText_subtitle_animated_, v8, v9, v5);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1
    && !-[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"))
  {
    goto LABEL_16;
  }
  -[SBUIPasscodeLockViewWithKeyboard statusField](self, "statusField");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "isEqualToString:", v13);

  if (v14)
  {

    v12 = 0;
    v15 = 0;
  }
  else
  {
    v15 = -[SBUIPasscodeLockViewWithKeyboard _newStatusField](self, "_newStatusField");
    objc_msgSend(v15, "setText:", v8);
    -[SBUIPasscodeLockViewWithKeyboard setStatusField:](self, "setStatusField:", v15);
  }
  -[SBUIPasscodeLockViewWithKeyboard statusSubtitleView](self, "statusSubtitleView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SBUIPasscodeLockViewBase _setStatusSubtitleText:](self, "_setStatusSubtitleText:", v9);
    v17 = -[SBUIPasscodeLockViewWithKeyboard _newStatusSubtitleView](self, "_newStatusSubtitleView");
    -[SBUIPasscodeLockViewWithKeyboard setStatusSubtitleView:](self, "setStatusSubtitleView:", v17);
    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](self, "passcodeAuthenticationView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "insertSubview:aboveSubview:", v17, self->_statusFieldBackground);

    if (!v12)
      goto LABEL_12;
LABEL_10:
    if (v15)
    {
      -[SBUIPasscodeLockViewBase passcodeAuthenticationView](self, "passcodeAuthenticationView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertSubview:aboveSubview:", v15, v12);

    }
    goto LABEL_12;
  }
  -[SBUIPasscodeLockViewWithKeyboard setStatusSubtitleView:](self, "setStatusSubtitleView:", 0);
  v17 = 0;
  if (v12)
    goto LABEL_10;
LABEL_12:
  -[SBUIPasscodeLockViewWithKeyboard setNeedsLayout](self, "setNeedsLayout");
  if (v5)
  {
    objc_msgSend(v15, "setAlpha:", 0.0);
    v20 = (void *)MEMORY[0x1E0CEABB0];
    v21 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke;
    v29[3] = &unk_1E4C3E6A0;
    v30 = v12;
    v31 = v16;
    v26[0] = v21;
    v26[1] = 3221225472;
    v26[2] = __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_2;
    v26[3] = &unk_1E4C3F0C0;
    v27 = v30;
    v28 = v31;
    objc_msgSend(v20, "animateWithDuration:animations:completion:", v29, v26, 0.22);
    v22 = (void *)MEMORY[0x1E0CEABB0];
    v23[0] = v21;
    v23[1] = 3221225472;
    v23[2] = __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_3;
    v23[3] = &unk_1E4C3E6A0;
    v24 = v15;
    v25 = v17;
    objc_msgSend(v22, "animateWithDuration:delay:options:animations:completion:", 0, v23, 0, 0.4, 0.17);

  }
  else
  {
    objc_msgSend(v12, "removeFromSuperview");
    objc_msgSend(v16, "removeFromSuperview");
  }

LABEL_16:
}

uint64_t __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

uint64_t __71__SBUIPasscodeLockViewWithKeyboard_updateStatusText_subtitle_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

- (void)_layoutStatusView
{
  void *v2;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
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
  double v33;
  CGFloat MinY;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v40;
  char v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  int v46;
  void *v47;
  int v48;
  char v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat rect;
  void *rect_8;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  -[SBUIPasscodeLockViewWithKeyboard bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBUIAlphanumericPasscodeEntryField frame](self->_alphaEntryField, "frame");
  rect = v12;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SBUIPasscodeLockViewWithKeyboard statusField](self, "statusField");
  rect_8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewWithKeyboard statusSubtitleView](self, "statusSubtitleView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "text");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "length");

  v55 = v14;
  v52 = v5;
  v53 = v9;
  if (v21)
  {
    -[SBUIPasscodeLockViewWithKeyboard _statusTitleWidth](self, "_statusTitleWidth");
    v23 = v22;
    v58.origin.x = v5;
    v58.origin.y = v7;
    v58.size.width = v9;
    v58.size.height = v11;
    objc_msgSend(v19, "sizeThatFits:", v23, CGRectGetHeight(v58));
    v25 = v24;
    UIRectCenteredXInRectScale();
    v27 = v26;
    v28 = v7;
    v30 = v29;
    v59.origin.y = v14;
    v31 = v11;
    v33 = v32;
    v59.origin.x = rect;
    v59.size.width = v16;
    v59.size.height = v18;
    MinY = CGRectGetMinY(v59);
    v35 = v30;
    v7 = v28;
    v36 = v33;
    v11 = v31;
    objc_msgSend(v19, "setFrame:", v27, MinY - v25 + -14.0, v35, v36, 0);
    v37 = v25 + 14.0;
  }
  else
  {
    v37 = 0.0;
  }
  -[SBUIPasscodeLockViewWithKeyboard _statusTitleWidth](self, "_statusTitleWidth");
  -[SBUIPasscodeLockViewWithKeyboard _statusFieldHeightWithWidth:](self, "_statusFieldHeightWithWidth:");
  v39 = v38;
  v40 = __sb__runningInSpringBoard();
  v41 = v40;
  v54 = v11;
  if (!v21)
  {
    if (v40)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        v42 = v16;
        v43 = v52;
        v44 = v53;
        v45 = v7;
        v46 = 13;
        goto LABEL_30;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "userInterfaceIdiom"))
      {
        v42 = v16;
        v43 = v52;
        v44 = v53;
        v45 = v7;
        v46 = 13;
        goto LABEL_29;
      }
    }
    v48 = __sb__runningInSpringBoard();
    v49 = v48;
    if (v48)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_referenceBounds");
    }
    BSSizeRoundForScale();
    if (v50 < *(double *)(MEMORY[0x1E0DAB260] + 40))
      v46 = 13;
    else
      v46 = 24;
    v42 = v16;
    if ((v49 & 1) != 0)
    {
      v43 = v52;
      v44 = v53;
      v45 = v7;
      if ((v41 & 1) != 0)
        goto LABEL_30;
    }
    else
    {
      v43 = v52;
      v44 = v53;
      v45 = v7;

      if ((v41 & 1) != 0)
        goto LABEL_30;
    }
LABEL_29:

    goto LABEL_30;
  }
  v42 = v16;
  if ((v40 & 1) != 0)
  {
    v43 = v52;
    v44 = v53;
    v45 = v7;
    if (SBFEffectiveDeviceClass() == 2)
      v46 = 3;
    else
      v46 = 4;
  }
  else
  {
    v43 = v52;
    v44 = v53;
    v45 = v7;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v47, "userInterfaceIdiom") == 1)
      v46 = 3;
    else
      v46 = 4;

  }
LABEL_30:
  v60.origin.y = v55;
  v60.origin.x = rect;
  v60.size.width = v42;
  v60.size.height = v18;
  v51 = CGRectGetMinY(v60) - v39 - v37 - (double)v46;
  v61.origin.x = v43;
  v61.origin.y = v45;
  v61.size.width = v44;
  v61.size.height = v54;
  -[UIView setFrame:](self->_statusFieldBackground, "setFrame:", 0.0, v51, CGRectGetWidth(v61), v37 + v39 + (double)v46);
  UIRectCenteredXInRectScale();
  objc_msgSend(rect_8, "setFrame:", 0);

}

- (void)_updateFont
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  double v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  void **v18;
  int v19;
  double v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  double v28;
  int v29;
  int v30;
  int v31;
  int v32;
  void **v33;
  int v34;
  double v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  int v43;
  double v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  void **v50;
  double v51;
  int v52;
  void *v53;
  SBUIAlphanumericPasscodeEntryField *alphaEntryField;
  void *v55;
  int v56;
  char v57;
  _BOOL4 v58;
  double v59;
  int v60;
  int v61;
  void **v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  int v68;
  id v69;

  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
      goto LABEL_112;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom"))
    {

    }
    else
    {
      v6 = SBFEffectiveHomeButtonType();

      if (v6 == 2)
        goto LABEL_112;
    }
  }
  -[SBUIPasscodeLockViewWithKeyboard statusField](self, "statusField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CEA5E8];
  v9 = __sb__runningInSpringBoard();
  if (v9)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      v10 = 0;
      v67 = 0;
      v11 = 27;
      goto LABEL_23;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v65, "userInterfaceIdiom") == 1)
    {
      v10 = 0;
      v11 = 27;
      v67 = 1;
      goto LABEL_23;
    }
  }
  v2 = __sb__runningInSpringBoard();
  v67 = v9 ^ 1;
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v10 = 0;
      v11 = 18;
      goto LABEL_23;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "userInterfaceIdiom"))
    {
      v11 = 18;
      v10 = 1;
      goto LABEL_23;
    }
  }
  v10 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
    v11 = 22;
  else
    v11 = 18;
LABEL_23:
  v12 = (double)v11;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v14 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "userInterfaceIdiom"))
    {
      v14 = 1;
      goto LABEL_31;
    }
  }
  v14 = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = (void **)MEMORY[0x1E0CEB3F8];
    goto LABEL_47;
  }
LABEL_31:
  v19 = __sb__runningInSpringBoard();
  if (v19)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v15 = 0;
      v16 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v13 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v13, "userInterfaceIdiom"))
    {
      v15 = 0;
      v16 = 1;
      goto LABEL_41;
    }
  }
  v16 = v19 ^ 1;
  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v15 = v4 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_43;
LABEL_41:
  v21 = __sb__runningInSpringBoard();
  if (v21)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_43:
      v17 = 0;
      v18 = (void **)MEMORY[0x1E0CEB3D0];
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v4, "userInterfaceIdiom") == 1)
    {
      v18 = (void **)MEMORY[0x1E0CEB3D0];
      v17 = 1;
      goto LABEL_47;
    }
  }
  v17 = v21 ^ 1;
  v18 = (void **)MEMORY[0x1E0CEB3D8];
LABEL_47:
  objc_msgSend(v8, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v18, v12));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v22);

  if (v17)
  {

    if (!v15)
      goto LABEL_49;
  }
  else if (!v15)
  {
LABEL_49:
    if (v16)
      goto LABEL_50;
LABEL_54:
    if (!v14)
      goto LABEL_56;
    goto LABEL_55;
  }

  if (!v16)
    goto LABEL_54;
LABEL_50:

  if (v14)
LABEL_55:

LABEL_56:
  if (v10)

  if (v67)
  -[SBUIPasscodeLockViewWithKeyboard statusSubtitleView](self, "statusSubtitleView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0CEA5E8];
  v25 = __sb__runningInSpringBoard();
  if (v25)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
      v68 = 0;
      v26 = 0;
      v27 = 22;
      goto LABEL_74;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v65, "userInterfaceIdiom") == 1)
    {
      v26 = 0;
      v27 = 22;
      v68 = 1;
      goto LABEL_74;
    }
  }
  v2 = __sb__runningInSpringBoard();
  v68 = v25 ^ 1;
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v26 = 0;
      v27 = 14;
      goto LABEL_74;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "userInterfaceIdiom"))
    {
      v27 = 14;
      v26 = 1;
      goto LABEL_74;
    }
  }
  v26 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
    v27 = 15;
  else
    v27 = 14;
LABEL_74:
  v28 = (double)v27;
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v29 = 0;
      goto LABEL_82;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "userInterfaceIdiom"))
    {
      v29 = 1;
      goto LABEL_82;
    }
  }
  v29 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = (void **)MEMORY[0x1E0CEB400];
    goto LABEL_98;
  }
LABEL_82:
  v34 = __sb__runningInSpringBoard();
  if (v34)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v30 = 0;
      v31 = 0;
      goto LABEL_92;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v3, "userInterfaceIdiom"))
    {
      v31 = 0;
      v30 = 1;
      goto LABEL_92;
    }
  }
  v30 = v34 ^ 1;
  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v31 = v4 ^ 1;
  BSSizeRoundForScale();
  if (v35 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_94;
LABEL_92:
  v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_94:
      v32 = 0;
      v33 = (void **)MEMORY[0x1E0CEB3D0];
      goto LABEL_98;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v4, "userInterfaceIdiom") == 1)
    {
      v33 = (void **)MEMORY[0x1E0CEB3D0];
      v32 = 1;
      goto LABEL_98;
    }
  }
  v32 = v36 ^ 1;
  v33 = (void **)MEMORY[0x1E0CEB3D8];
LABEL_98:
  objc_msgSend(v24, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v33, v28));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFont:", v37);

  if (v32)
  {

    if (!v31)
      goto LABEL_100;
  }
  else if (!v31)
  {
LABEL_100:
    if (v30)
      goto LABEL_101;
    goto LABEL_105;
  }

  if (v30)
  {
LABEL_101:

    if (!v29)
      goto LABEL_107;
    goto LABEL_106;
  }
LABEL_105:
  if (v29)
LABEL_106:

LABEL_107:
  if (v26)

  if (v68)
LABEL_112:
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      && SBFEffectiveHomeButtonType() == 2)
    {
      goto LABEL_120;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "userInterfaceIdiom"))
    {

    }
    else
    {
      v39 = SBFEffectiveHomeButtonType();

      if (v39 == 2)
      {
LABEL_120:
        -[UIControl titleLabel](self->_emergencyCallButton, "titleLabel");
        v40 = objc_claimAutoreleasedReturnValue();
        goto LABEL_122;
      }
    }
  }
  -[UIControl label](self->_emergencyCallButton, "label");
  v40 = objc_claimAutoreleasedReturnValue();
LABEL_122:
  v69 = (id)v40;
  v41 = (void *)MEMORY[0x1E0CEA5E8];
  v42 = __sb__runningInSpringBoard();
  if ((_DWORD)v42)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v43 = 0;
      v44 = 12.0;
      goto LABEL_131;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "userInterfaceIdiom"))
    {
      v44 = 12.0;
      v43 = 1;
      goto LABEL_131;
    }
  }
  v43 = v42 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
    v44 = 16.0;
  else
    v44 = 12.0;
LABEL_131:
  v45 = __sb__runningInSpringBoard();
  if ((_DWORD)v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v46 = 0;
      goto LABEL_139;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v42 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v42, "userInterfaceIdiom"))
    {
      v46 = 1;
      goto LABEL_139;
    }
  }
  v46 = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = (void **)MEMORY[0x1E0CEB400];
    goto LABEL_155;
  }
LABEL_139:
  v2 = __sb__runningInSpringBoard();
  if ((_DWORD)v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v47 = 0;
      v48 = 0;
      goto LABEL_149;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v45 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v45, "userInterfaceIdiom"))
    {
      v48 = 0;
      v47 = 1;
      goto LABEL_149;
    }
  }
  v47 = v2 ^ 1;
  v3 = __sb__runningInSpringBoard();
  if ((_DWORD)v3)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v48 = v3 ^ 1;
  BSSizeRoundForScale();
  if (v51 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_151;
LABEL_149:
  v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_151:
      v49 = 0;
      v50 = (void **)MEMORY[0x1E0CEB3C8];
      goto LABEL_155;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v3, "userInterfaceIdiom") == 1)
    {
      v50 = (void **)MEMORY[0x1E0CEB3C8];
      v49 = 1;
      goto LABEL_155;
    }
  }
  v49 = v52 ^ 1;
  v50 = (void **)MEMORY[0x1E0CEB3D0];
LABEL_155:
  objc_msgSend(v41, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v50, v44));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setFont:", v53);

  if (v49)
  {

    if (!v48)
      goto LABEL_157;
  }
  else if (!v48)
  {
LABEL_157:
    if (v47)
      goto LABEL_158;
LABEL_162:
    if (!v46)
      goto LABEL_164;
    goto LABEL_163;
  }

  if (!v47)
    goto LABEL_162;
LABEL_158:

  if (v46)
LABEL_163:

LABEL_164:
  if (v43)

  alphaEntryField = self->_alphaEntryField;
  v55 = (void *)MEMORY[0x1E0CEA5E8];
  v56 = __sb__runningInSpringBoard();
  v57 = v56;
  if (v56)
  {
    v58 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v53, "userInterfaceIdiom") == 1;
  }
  if (v58)
    v59 = 27.0;
  else
    v59 = 17.0;
  v60 = __sb__runningInSpringBoard();
  if (v60)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v61 = 0;
      goto LABEL_180;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v45 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v45, "userInterfaceIdiom"))
    {
      v61 = 1;
      goto LABEL_180;
    }
  }
  v61 = v60 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v62 = (void **)MEMORY[0x1E0CEB408];
    goto LABEL_181;
  }
LABEL_180:
  v62 = (void **)MEMORY[0x1E0CEB3C0];
LABEL_181:
  objc_msgSend(v55, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory(*v62, v59));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeEntryField setFont:](alphaEntryField, "setFont:", v63);

  if (v61)
  if ((v57 & 1) == 0)

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBUIPasscodeLockViewWithKeyboard;
  -[SBUIPasscodeLockViewWithKeyboard traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[SBUIPasscodeLockViewWithKeyboard traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[SBUIPasscodeLockViewWithKeyboard _updateFont](self, "_updateFont");
      -[SBUIPasscodeLockViewWithKeyboard setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)_updateKeyboardHeightOffsetForKeyboardNotification:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;

  if (v7 > 0.0)
    self->_keyboardHeightOffset = v7;
}

- (void)_keyboardWillChangeFrameNotification:(id)a3
{
  -[SBUIPasscodeLockViewWithKeyboard _updateKeyboardHeightOffsetForKeyboardNotification:](self, "_updateKeyboardHeightOffsetForKeyboardNotification:", a3);
  -[SBUIPasscodeLockViewWithKeyboard setNeedsLayout](self, "setNeedsLayout");
}

- (void)_keyboardWillShowNotification:(id)a3
{
  id v4;

  self->_keyboardVisible = 1;
  v4 = a3;
  -[SBUIPasscodeLockViewWithKeyboard _setKeyboardTracksLockView:](self, "_setKeyboardTracksLockView:", 1);
  -[SBUIPasscodeLockViewWithKeyboard _updateKeyboardHeightOffsetForKeyboardNotification:](self, "_updateKeyboardHeightOffsetForKeyboardNotification:", v4);

  -[SBUIPasscodeLockViewWithKeyboard setNeedsLayout](self, "setNeedsLayout");
}

- (void)_keyboardDidHideNotification:(id)a3
{
  -[SBUIPasscodeLockViewWithKeyboard _setKeyboardTracksLockView:](self, "_setKeyboardTracksLockView:", 0);
  if (!self->_isResigningResponderStatus)
  {
    self->_keyboardVisible = 0;
    -[SBUIPasscodeLockViewWithKeyboard setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UILabel)statusField
{
  return self->_statusField;
}

- (void)setStatusField:(id)a3
{
  objc_storeStrong((id *)&self->_statusField, a3);
}

- (UILabel)statusSubtitleView
{
  return self->_statusSubtitleView;
}

- (void)setStatusSubtitleView:(id)a3
{
  objc_storeStrong((id *)&self->_statusSubtitleView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusSubtitleView, 0);
  objc_storeStrong((id *)&self->_statusField, 0);
  objc_storeStrong((id *)&self->_keyboardTrackingView, 0);
  objc_storeStrong((id *)&self->_emergencyCallButton, 0);
  objc_storeStrong((id *)&self->_statusFieldBackground, 0);
  objc_storeStrong((id *)&self->_alphaEntryField, 0);
  objc_storeStrong((id *)&self->_keyboardAnimator, 0);
}

@end
