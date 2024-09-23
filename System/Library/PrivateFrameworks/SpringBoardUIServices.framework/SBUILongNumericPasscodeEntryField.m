@implementation SBUILongNumericPasscodeEntryField

- (SBUILongNumericPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  SBUILongNumericPasscodeEntryField *v4;
  SBUILongNumericPasscodeEntryField *v5;
  uint64_t v6;
  SBUIButton *okButton;
  SBUIButton *v8;
  void *v9;
  SBUIButton *v10;
  void *v11;
  void *v12;
  SBUIButton *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  uint64_t v22;
  UILabel *promptLabel;
  UILabel *v24;
  void *v25;
  UILabel *v26;
  double v27;
  UILabel *v28;
  void *v29;
  UILabel *v30;
  void *v31;
  id v32;
  uint64_t v33;
  UIView *springViewParent;
  id v35;
  uint64_t v36;
  UIView *springView;
  __int128 v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)SBUILongNumericPasscodeEntryField;
  v4 = -[SBUINumericPasscodeEntryFieldBase initWithDefaultSizeAndLightStyle:](&v40, sel_initWithDefaultSizeAndLightStyle_);
  v5 = v4;
  if (v4)
  {
    -[SBUINumericPasscodeEntryFieldBase setAllowsNewlineAcceptance:](v4, "setAllowsNewlineAcceptance:", 1);
    -[SBUINumericPasscodeEntryFieldBase setAutoAcceptWhenMaxNumbersMet:](v5, "setAutoAcceptWhenMaxNumbersMet:", 0);
    -[SBUILongNumericPasscodeEntryField setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 1);
    -[SBUILongNumericPasscodeEntryField setClipsToBounds:](v5, "setClipsToBounds:", 1);
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    okButton = v5->_okButton;
    v5->_okButton = (SBUIButton *)v6;

    -[SBUIButton setHitAreaAdjustments:](v5->_okButton, "setHitAreaAdjustments:", -15.0, -15.0, -15.0, -15.0);
    v8 = v5->_okButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = v5->_okButton;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("PASSCODE_ENTRY_OK"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](v10, "setTitle:forState:", v12, 0);

    v13 = v5->_okButton;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitleColor:forState:](v13, "setTitleColor:forState:", v14, 0);

    -[SBUIButton addTarget:action:forControlEvents:](v5->_okButton, "addTarget:action:forControlEvents:", v5, sel__okButtonHit, 64);
    -[SBUIButton titleLabel](v5->_okButton, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v16);

    objc_msgSend(v15, "setLineBreakMode:", 4);
    objc_msgSend(v15, "setTextAlignment:", 1);
    -[SBUILongNumericPasscodeEntryField bounds](v5, "bounds");
    v18 = v17;
    v39 = *MEMORY[0x1E0C9D820];
    -[SBUILongNumericPasscodeEntryField _getPasscodeFieldSize:okButtonSize:](v5, "_getPasscodeFieldSize:okButtonSize:", &v39, 0);
    v19 = SBUIFloatFloorForMainScreenScale((v18 - *(double *)&v39) * 0.5);
    -[SBUIPasscodeEntryField _textField](v5, "_textField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", v19, 0.0, v39);
    objc_msgSend(v20, "setTextAlignment:", 1);
    objc_msgSend(v20, "setAutoresizingMask:", 5);
    objc_msgSend(v20, "setText:", 0);
    v21 = objc_alloc(MEMORY[0x1E0CEA700]);
    objc_msgSend(v20, "frame");
    v22 = objc_msgSend(v21, "initWithFrame:");
    promptLabel = v5->_promptLabel;
    v5->_promptLabel = (UILabel *)v22;

    -[UILabel setAutoresizingMask:](v5->_promptLabel, "setAutoresizingMask:", 5);
    v24 = v5->_promptLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 18.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v24, "setFont:", v25);

    -[UILabel setAdjustsFontSizeToFitWidth:](v5->_promptLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setMinimumScaleFactor:](v5->_promptLabel, "setMinimumScaleFactor:", 0.555555556);
    v26 = v5->_promptLabel;
    objc_msgSend(v20, "bounds");
    -[UILabel setPreferredMaxLayoutWidth:](v26, "setPreferredMaxLayoutWidth:", v27);
    -[UILabel setLineBreakMode:](v5->_promptLabel, "setLineBreakMode:", 4);
    v28 = v5->_promptLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v28, "setBackgroundColor:", v29);

    v30 = v5->_promptLabel;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v30, "setTextColor:", v31);

    -[UILabel setTextAlignment:](v5->_promptLabel, "setTextAlignment:", 1);
    v32 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUILongNumericPasscodeEntryField bounds](v5, "bounds");
    v33 = objc_msgSend(v32, "initWithFrame:");
    springViewParent = v5->_springViewParent;
    v5->_springViewParent = (UIView *)v33;

    v35 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[SBUILongNumericPasscodeEntryField bounds](v5, "bounds");
    v36 = objc_msgSend(v35, "initWithFrame:");
    springView = v5->_springView;
    v5->_springView = (UIView *)v36;

    -[UIView setAutoresizingMask:](v5->_springView, "setAutoresizingMask:", 2);
    -[UIView setAutoresizingMask:](v5->_springViewParent, "setAutoresizingMask:", 2);
    -[SBUILongNumericPasscodeEntryField addSubview:](v5, "addSubview:", v5->_springViewParent);
    -[UIView addSubview:](v5->_springViewParent, "addSubview:", v5->_springView);
    -[UIView addSubview:](v5->_springView, "addSubview:", v20);
    -[UIView addSubview:](v5->_springView, "addSubview:", v5->_okButton);
    -[UIView addSubview:](v5->_springView, "addSubview:", v5->_promptLabel);
    -[SBUILongNumericPasscodeEntryField setShowsOkButton:](v5, "setShowsOkButton:", 1);
    -[SBUILongNumericPasscodeEntryField setShowsOkButton:](v5, "setShowsOkButton:", 0);
    -[SBUILongNumericPasscodeEntryField setShowsPromptLabel:](v5, "setShowsPromptLabel:", 1);
    -[SBUILongNumericPasscodeEntryField setShowsPromptLabel:](v5, "setShowsPromptLabel:", 0);

  }
  return v5;
}

- (void)setShowsOkButton:(BOOL)a3
{
  SBUIButton *okButton;
  double v4;

  if (self->_showsOkButton != a3)
  {
    self->_showsOkButton = a3;
    okButton = self->_okButton;
    v4 = 0.0;
    if (a3)
      v4 = 1.0;
    -[SBUIButton setAlpha:](okButton, "setAlpha:", v4);
  }
}

- (void)setShowsPromptLabel:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  int v7;
  double v8;

  if (self->_showsPromptLabel != a3)
  {
    v3 = a3;
    self->_showsPromptLabel = a3;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = v6 & 0xFFFFFFFB;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) != 1)
      v7 = (unint64_t)(objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation") - 5) < 0xFFFFFFFFFFFFFFFELL;
    v8 = 0.0;
    if ((v3 & v7) != 0)
      v8 = 1.0;
    -[UILabel setAlpha:](self->_promptLabel, "setAlpha:", v8);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  BOOL result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUILongNumericPasscodeEntryField;
  result = -[SBUIPasscodeEntryField becomeFirstResponder](&v4, sel_becomeFirstResponder);
  self->_firstResponder = result;
  return result;
}

- (BOOL)isFirstResponder
{
  return self->_firstResponder;
}

- (BOOL)canResignFirstResponder
{
  return self->_firstResponder;
}

- (BOOL)resignFirstResponder
{
  _BOOL4 v3;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBUILongNumericPasscodeEntryField;
  v3 = -[SBUINumericPasscodeEntryFieldBase resignFirstResponder](&v6, sel_resignFirstResponder);
  if (self->_firstResponder && v3)
    self->_firstResponder = 0;
  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double MinX;
  double v13;
  double v14;
  __int128 v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)SBUILongNumericPasscodeEntryField;
  -[SBUILongNumericPasscodeEntryField layoutSubviews](&v16, sel_layoutSubviews);
  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  MinX = CGRectGetMinX(v17);
  v15 = *MEMORY[0x1E0C9D820];
  -[SBUILongNumericPasscodeEntryField _getPasscodeFieldSize:okButtonSize:](self, "_getPasscodeFieldSize:okButtonSize:", 0, &v15);
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
  {
    v13 = *(double *)&v15;
    v14 = MinX + 100.0 + -100.0 - *(double *)&v15 + -16.0;
  }
  else
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    v14 = CGRectGetMaxX(v18) + 16.0;
    v13 = *(double *)&v15;
  }
  -[SBUIButton setFrame:](self->_okButton, "setFrame:", v14, 0.0, v13, *((double *)&v15 + 1));
  -[UIView bringSubviewToFront:](self->_springView, "bringSubviewToFront:", self->_okButton);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBUIButton *okButton;
  BOOL v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (self->_showsOkButton
    && (okButton = self->_okButton,
        -[SBUILongNumericPasscodeEntryField convertPoint:toView:](self, "convertPoint:toView:", okButton, x, y),
        -[SBUIButton pointInside:withEvent:](okButton, "pointInside:withEvent:", v7)))
  {
    v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBUILongNumericPasscodeEntryField;
    v9 = -[SBUILongNumericPasscodeEntryField pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBUIButton *okButton;
  void *v9;
  SBUIButton *v10;
  SBUIButton *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (self->_showsOkButton
    && (okButton = self->_okButton,
        -[SBUILongNumericPasscodeEntryField convertPoint:toView:](self, "convertPoint:toView:", okButton, x, y),
        -[SBUIButton hitTest:withEvent:](okButton, "hitTest:withEvent:", v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = self->_okButton;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBUILongNumericPasscodeEntryField;
    -[SBUILongNumericPasscodeEntryField hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
    v10 = (SBUIButton *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (!objc_msgSend(v4, "_hidEvent"))
  {
    objc_msgSend(v5, "_isKeyDown");
LABEL_9:
    v9.receiver = self;
    v9.super_class = (Class)SBUILongNumericPasscodeEntryField;
    -[SBUILongNumericPasscodeEntryField _handleKeyUIEvent:](&v9, sel__handleKeyUIEvent_, v5);
    goto LABEL_10;
  }
  BKSHIDEventGetBaseAttributes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "source");

  if (!objc_msgSend(v5, "_isKeyDown") || (v7 & 0xFFFFFFFD) != 1)
    goto LABEL_9;
  objc_msgSend(v5, "_modifiedInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("\r")) & 1) == 0
    && !objc_msgSend(v8, "isEqualToString:", CFSTR("\n")))
  {
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("\b")))
      -[SBUIPasscodeEntryField deleteLastCharacter](self, "deleteLastCharacter");
    else
      -[SBUIPasscodeEntryField appendString:](self, "appendString:", v8);

    goto LABEL_9;
  }
  -[SBUILongNumericPasscodeEntryField _okButtonHit](self, "_okButtonHit");

LABEL_10:
}

+ (BOOL)_shouldResetAutoAcceptWhenMaxNumbersMetInResignFirstResponder
{
  return 0;
}

+ (BOOL)_usesTextFieldForFirstResponder
{
  return 0;
}

- (void)_okButtonHit
{
  if (self->_showsOkButton)
    -[SBUIPasscodeEntryField notePasscodeFieldDidAcceptEntry](self, "notePasscodeFieldDidAcceptEntry");
}

- (void)_getPasscodeFieldSize:(CGSize *)a3 okButtonSize:(CGSize *)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  SBUIButton *okButton;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2)
    {
LABEL_3:
      v7 = 14.0;
      v8 = 41.0;
      v9 = 137.0;
      v10 = 169.0;
      v11 = 0x4046000000000000;
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "userInterfaceIdiom");

    if (v13 == 1)
      goto LABEL_3;
  }
  v14 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "activeInterfaceOrientation");
  if ((unint64_t)(v14 - 1) >= 2)
    v8 = 28.0;
  else
    v8 = 38.0;
  if ((unint64_t)(v14 - 1) >= 2)
    v9 = 128.0;
  else
    v9 = 123.0;
  v7 = 10.0;
  v10 = 150.0;
  v11 = 0x4044000000000000;
LABEL_12:
  v15 = *(double *)&v11;
  okButton = self->_okButton;
  -[SBUIButton frame](okButton, "frame");
  -[SBUIButton sizeThatFits:](okButton, "sizeThatFits:", v17, v18);
  v20 = v7 + v19;
  if (v15 >= v20)
    v20 = v15;
  v21 = v20 - v15;
  v22 = v10 - v9 - (v20 - v15);
  v23 = -0.0;
  if (v22 < 0.0)
    v23 = v10 - v9 - (v20 - v15);
  if (a3)
  {
    if (v22 < 0.0)
      v21 = v10 - v9;
    a3->width = v10 - v21;
    a3->height = v8;
  }
  if (a4)
  {
    a4->width = v20 + v23;
    a4->height = v8;
  }
}

- (CGSize)_viewSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  __int128 v8;
  CGSize result;

  v8 = *MEMORY[0x1E0C9D820];
  -[SBUILongNumericPasscodeEntryField _getPasscodeFieldSize:okButtonSize:](self, "_getPasscodeFieldSize:okButtonSize:", &v8, 0);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v5 = *((double *)&v8 + 1);

  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v4 = a3;
  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("000000000"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "textRectForBounds:");
  v8 = v7;
  while (1)
  {
    objc_msgSend(v5, "defaultTextAttributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sizeWithAttributes:", v9);
    v11 = v10;

    if (v11 <= v8)
      break;
    objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
    objc_msgSend(v5, "setText:", v6);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBUILongNumericPasscodeEntryField;
  -[SBUIPasscodeEntryField _autofillForBiometricAuthenticationWithCompletion:](&v12, sel__autofillForBiometricAuthenticationWithCompletion_, v4);

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
  v30.super_class = (Class)SBUILongNumericPasscodeEntryField;
  -[SBUIPasscodeEntryField _resetForFailedPasscode:](&v30, sel__resetForFailedPasscode_, v3);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 0;
}

- (UIButton)okButton
{
  return &self->_okButton->super;
}

- (BOOL)showsOkButton
{
  return self->_showsOkButton;
}

- (UILabel)promptLabel
{
  return self->_promptLabel;
}

- (BOOL)showsPromptLabel
{
  return self->_showsPromptLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springViewParent, 0);
  objc_storeStrong((id *)&self->_springView, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
}

@end
