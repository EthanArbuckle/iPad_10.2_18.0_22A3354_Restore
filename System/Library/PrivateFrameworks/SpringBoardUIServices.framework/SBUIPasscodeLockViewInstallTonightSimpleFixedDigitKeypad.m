@implementation SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad

- (SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4
{
  SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad *v5;
  uint64_t v6;
  SBUIButton *actionButton;
  SBUIButton *v8;
  void *v9;
  SBUIButton *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad;
  v5 = -[SBUIPasscodeLockViewSimpleFixedDigitKeypad initWithLightStyle:numberOfDigits:](&v16, sel_initWithLightStyle_numberOfDigits_, a3, a4);
  if (v5)
  {
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v6 = objc_claimAutoreleasedReturnValue();
    actionButton = v5->_actionButton;
    v5->_actionButton = (SBUIButton *)v6;

    -[SBUIButton setUserInteractionEnabled:](v5->_actionButton, "setUserInteractionEnabled:", 1);
    -[SBUIButton setClipsToBounds:](v5->_actionButton, "setClipsToBounds:", 1);
    v8 = v5->_actionButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setBackgroundColor:](v8, "setBackgroundColor:", v9);

    v10 = v5->_actionButton;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitleColor:forState:](v10, "setTitleColor:forState:", v11, 0);

    -[SBUIButton addTarget:action:forControlEvents:](v5->_actionButton, "addTarget:action:forControlEvents:", v5, sel__actionButtonHit, 64);
    -[SBUIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBUIButton titleLabel](v5->_actionButton, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v13);

    objc_msgSend(v12, "setLineBreakMode:", 5);
    objc_msgSend(v12, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v12, "setMinimumScaleFactor:", 2.0);
    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v5, "passcodeAuthenticationView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_actionButton);

    -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad setShowsCancelButton:](v5, "setShowsCancelButton:", 1);
  }
  return v5;
}

- (void)_layoutStatusView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad;
  -[SBUIPasscodeLockViewWithKeypad _layoutStatusView](&v3, sel__layoutStatusView);
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _layoutActionButton](self, "_layoutActionButton");
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _setShowsEmergencyCallButton:fromCancelButton:](self, "_setShowsEmergencyCallButton:fromCancelButton:", a3, 0);
}

- (void)_setShowsEmergencyCallButton:(BOOL)a3 fromCancelButton:(BOOL)a4
{
  uint64_t v5;
  void *v7;
  objc_super v8;

  LODWORD(v5) = a3;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "deviceClass"))
    v5 = 0;
  else
    v5 = v5;

  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad;
  -[SBUIPasscodeLockViewWithKeypad setShowsEmergencyCallButton:](&v8, sel_setShowsEmergencyCallButton_, v5);
  if (!a4)
    -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _setShowsCancelButton:fromEmergencyCallButton:](self, "_setShowsCancelButton:fromEmergencyCallButton:", v5 ^ 1, 1);
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _configureActionButton](self, "_configureActionButton");
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _setShowsCancelButton:fromEmergencyCallButton:](self, "_setShowsCancelButton:fromEmergencyCallButton:", a3, 0);
}

- (void)_setShowsCancelButton:(BOOL)a3 fromEmergencyCallButton:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad;
  -[SBUIPasscodeLockViewWithKeypad setShowsCancelButton:](&v8, sel_setShowsCancelButton_);
  -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsCancelButton:", 0);

  if (!a4)
    -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _setShowsEmergencyCallButton:fromCancelButton:](self, "_setShowsEmergencyCallButton:fromCancelButton:", !v5, 1);
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _configureActionButton](self, "_configureActionButton");
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SBUIButton setHidden:](self->_actionButton, "setHidden:", 1);
    -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  else
  {
    -[SBUIButton setHidden:](self->_actionButton, "setHidden:", -[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton") ^ 1);
    -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  objc_msgSend(v6, "setShowsBackspaceButton:", v8);

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    v12 = (void *)v9;
    v11 = objc_opt_respondsToSelector();
    v10 = v12;
    if ((v11 & 1) != 0)
    {
      objc_msgSend(v12, "passcodeLockViewPasscodeDidChange:", self);
      v10 = v12;
    }
  }

}

- (void)_configureActionButton
{
  _BOOL4 v3;
  SBUIButton *actionButton;
  void *v5;
  void *v6;
  SBUIButton *v7;
  uint64_t v8;
  id v9;

  v3 = -[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton");
  actionButton = self->_actionButton;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_PASSCODE_REMIND_LATER"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitle:forState:](actionButton, "setTitle:forState:", v6, 0);

    v7 = self->_actionButton;
    v8 = 0;
  }
  else
  {
    v7 = self->_actionButton;
    v8 = 1;
  }
  -[SBUIButton setHidden:](v7, "setHidden:", v8);
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad passcodeEntryFieldTextDidChange:](self, "passcodeEntryFieldTextDidChange:", v9);

}

- (void)_sizeLabel:(id)a3
{
  CGFloat v4;
  id v5;
  CGRect v6;

  v5 = a3;
  objc_msgSend(v5, "setLineBreakMode:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad bounds](self, "bounds");
  v4 = CGRectGetWidth(v6) + -40.0;
  objc_msgSend(v5, "frame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v5, "setPreferredMaxLayoutWidth:", v4);
  objc_msgSend(v5, "sizeToFit");

}

- (void)_layoutActionButton
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
  uint64_t v12;
  id v13;

  -[SBUIButton titleLabel](self->_actionButton, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad _sizeLabel:](self, "_sizeLabel:", v3);

  -[SBUIButton sizeToFit](self->_actionButton, "sizeToFit");
  -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUIButton centerXAnchor](self->_actionButton, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActive:", 1);

  if (!__sb__runningInSpringBoard())
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userInterfaceIdiom");

    if (v12 != 1)
      goto LABEL_3;
LABEL_5:
    -[SBUIButton topAnchor](self->_actionButton, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);
    goto LABEL_6;
  }
  if (SBFEffectiveDeviceClass() == 2)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v13, "backspaceButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIButton firstBaselineAnchor](self->_actionButton, "firstBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstBaselineAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

LABEL_6:
}

- (void)_actionButtonHit
{
  id v3;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton")
    && v3
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "passcodeLockViewCancelButtonPressed:", self);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
