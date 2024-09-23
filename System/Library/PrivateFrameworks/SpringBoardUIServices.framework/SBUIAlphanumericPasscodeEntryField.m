@implementation SBUIAlphanumericPasscodeEntryField

- (SBUIAlphanumericPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  void *v3;
  SBUIAlphanumericPasscodeEntryField *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  int v20;
  char v21;
  _BOOL4 v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  UIView *springViewParent;
  id v28;
  uint64_t v29;
  UIView *springView;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  v4 = -[SBUIPasscodeEntryField initWithDefaultSizeAndLightStyle:](&v32, sel_initWithDefaultSizeAndLightStyle_, a3);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CEA5E8];
    v6 = __sb__runningInSpringBoard();
    v7 = v6;
    v8 = (void *)0x1E0CEA000;
    if (v6)
    {
      v9 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "userInterfaceIdiom") == 1;
    }
    v10 = 17.0;
    if (v9)
      v10 = 27.0;
    objc_msgSend(v5, "systemFontOfSize:", SBUIScaledFontSizeWithMaxSizeCategory((void *)*MEMORY[0x1E0CEB3D0], v10));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v7 & 1) == 0)

    if (__sb__runningInSpringBoard())
    {
      v12 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "userInterfaceIdiom") == 1;

    }
    objc_msgSend(v11, "_bodyLeading");
    v15 = v14 + 12.0;
    v16 = 38.0;
    if (v12)
      v16 = 74.0;
    if (v16 >= v15)
      v17 = v16;
    else
      v17 = v15;
    -[SBUIAlphanumericPasscodeEntryField setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    -[SBUIAlphanumericPasscodeEntryField setFrame:](v4, "setFrame:", 0.0, 0.0);

    -[SBUIAlphanumericPasscodeEntryField setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[SBUIPasscodeEntryField _textField](v4, "_textField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = __sb__runningInSpringBoard();
    v21 = v20;
    if (v20)
    {
      v22 = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v8, "userInterfaceIdiom") == 1;
    }
    if (v22)
      v23 = 526.0;
    else
      v23 = 314.0;
    objc_msgSend(v19, "setFrame:", 0.0, 0.0, v23, v17);
    if ((v21 & 1) == 0)

    objc_msgSend(v19, "setTextAlignment:", 0);
    objc_msgSend(v19, "setClearButtonMode:", 0);
    objc_msgSend(v19, "setEmptyContentReturnKeyType:", 1);
    objc_msgSend(v19, "setReturnKeyType:", 9);
    objc_msgSend(v19, "setFont:", v11);
    objc_msgSend(v19, "textInputTraits");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAcceptsSplitKeyboard:", 0);
    objc_msgSend(v24, "setAcceptsFloatingKeyboard:", 0);
    objc_msgSend(v24, "setUseInterfaceLanguageForLocalization:", 1);
    objc_msgSend(v24, "setReturnKeyType:", 9);
    v25 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUIAlphanumericPasscodeEntryField bounds](v4, "bounds");
    v26 = objc_msgSend(v25, "initWithFrame:");
    springViewParent = v4->_springViewParent;
    v4->_springViewParent = (UIView *)v26;

    v28 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUIAlphanumericPasscodeEntryField bounds](v4, "bounds");
    v29 = objc_msgSend(v28, "initWithFrame:");
    springView = v4->_springView;
    v4->_springView = (UIView *)v29;

    -[UIView setAutoresizingMask:](v4->_springView, "setAutoresizingMask:", 2);
    -[UIView setAutoresizingMask:](v4->_springViewParent, "setAutoresizingMask:", 2);
    -[SBUIAlphanumericPasscodeEntryField addSubview:](v4, "addSubview:", v4->_springViewParent);
    -[UIView addSubview:](v4->_springViewParent, "addSubview:", v4->_springView);
    -[UIView addSubview:](v4->_springView, "addSubview:", v19);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  -[SBUIAlphanumericPasscodeEntryField layoutSubviews](&v13, sel_layoutSubviews);
  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  -[SBUIAlphanumericPasscodeEntryField bounds](self, "bounds");
  UIRectCenteredXInRectScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBUIPasscodeEntryField _textField](self, "_textField", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (UITextInputTraits)textInputTraits
{
  void *v2;
  void *v3;

  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextInputTraits *)v3;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", CFSTR("0000000000"));
  v6.receiver = self;
  v6.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  -[SBUIPasscodeEntryField _autofillForBiometricAuthenticationWithCompletion:](&v6, sel__autofillForBiometricAuthenticationWithCompletion_, v4);

}

- (void)notePasscodeFieldTextDidChange
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateReturnKey:", 0);

  v4.receiver = self;
  v4.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  -[SBUIPasscodeEntryField notePasscodeFieldTextDidChange](&v4, sel_notePasscodeFieldTextDidChange);
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  objc_super v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", 1.20000005);
  objc_msgSend(v5, "setStiffness:", 1200.0);
  objc_msgSend(v5, "setDamping:", 12.0);
  LODWORD(v6) = 1028389654;
  LODWORD(v7) = 990057071;
  LODWORD(v8) = 1059712716;
  LODWORD(v9) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v10);

  objc_msgSend(v5, "setDuration:", 0.666999996);
  objc_msgSend(v5, "setVelocity:", 0.0);
  v11 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[UIView layer](self->_springView, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "position");
  v15 = v14 + 75.0;
  *(float *)&v15 = v15;
  objc_msgSend(v12, "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromValue:", v16);

  -[UIView layer](self->_springView, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAnimation:forKey:", v5, CFSTR("shake"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = 1054276898;
  LODWORD(v20) = 1058305108;
  LODWORD(v21) = 0;
  LODWORD(v22) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v19, v21, v20, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimingFunction:", v23);

  objc_msgSend(v18, "setDuration:", 0.100000001);
  objc_msgSend(v18, "setFillMode:", v11);
  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[UIView layer](self->_springViewParent, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "position");
  v27 = v26 + -75.0;
  *(float *)&v27 = v27;
  objc_msgSend(v24, "numberWithFloat:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFromValue:", v28);

  -[UIView layer](self->_springViewParent, "layer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addAnimation:forKey:", v18, CFSTR("force-off-center"));

  v30.receiver = self;
  v30.super_class = (Class)SBUIAlphanumericPasscodeEntryField;
  -[SBUIPasscodeEntryField _resetForFailedPasscode:](&v30, sel__resetForFailedPasscode_, v3);

}

- (CGSize)_viewSize
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (__sb__runningInSpringBoard())
  {
    v4 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "userInterfaceIdiom") == 1;

  }
  objc_msgSend(v3, "_bodyLeading");
  v7 = v6 + 12.0;
  v8 = 38.0;
  if (v4)
    v8 = 74.0;
  if (v8 >= v7)
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;

  v13 = v12;
  v14 = v9;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springViewParent, 0);
  objc_storeStrong((id *)&self->_springView, 0);
}

@end
