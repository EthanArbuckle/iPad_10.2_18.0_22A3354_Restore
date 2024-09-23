@implementation SBUIPasscodeLockViewInstallTonightLongNumericKeypad

- (SBUIPasscodeLockViewInstallTonightLongNumericKeypad)initWithLightStyle:(BOOL)a3
{
  SBUIPasscodeLockViewInstallTonightLongNumericKeypad *v4;
  uint64_t v5;
  SBUIButton *actionButton;
  SBUIButton *v7;
  void *v8;
  SBUIButton *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  v4 = -[SBUIPasscodeLockViewLongNumericKeypad initWithLightStyle:](&v15, sel_initWithLightStyle_);
  if (v4)
  {
    +[SBUIButton buttonWithType:](SBUIButton, "buttonWithType:", 1);
    v5 = objc_claimAutoreleasedReturnValue();
    actionButton = v4->_actionButton;
    v4->_actionButton = (SBUIButton *)v5;

    -[SBUIButton setUserInteractionEnabled:](v4->_actionButton, "setUserInteractionEnabled:", 1);
    -[SBUIButton setClipsToBounds:](v4->_actionButton, "setClipsToBounds:", 1);
    v7 = v4->_actionButton;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setBackgroundColor:](v7, "setBackgroundColor:", v8);

    v9 = v4->_actionButton;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIButton setTitleColor:forState:](v9, "setTitleColor:forState:", v10, 0);

    -[SBUIButton addTarget:action:forControlEvents:](v4->_actionButton, "addTarget:action:forControlEvents:", v4, sel__actionButtonHit, 64);
    -[SBUIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBUIButton titleLabel](v4->_actionButton, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 16.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v12);

    objc_msgSend(v11, "setLineBreakMode:", 5);
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v11, "setMinimumScaleFactor:", 2.0);
    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v4, "passcodeAuthenticationView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v4->_actionButton);

    -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad setShowsCancelButton:](v4, "setShowsCancelButton:", 1);
  }
  return v4;
}

- (void)_layoutStatusView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  -[SBUIPasscodeLockViewWithKeypad _layoutStatusView](&v3, sel__layoutStatusView);
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _layoutActionButton](self, "_layoutActionButton");
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _setShowsEmergencyCallButton:fromCancelButton:](self, "_setShowsEmergencyCallButton:fromCancelButton:", a3, 0);
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
  v8.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  -[SBUIPasscodeLockViewWithKeypad setShowsEmergencyCallButton:](&v8, sel_setShowsEmergencyCallButton_, v5);
  if (!a4)
    -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _setShowsCancelButton:fromEmergencyCallButton:](self, "_setShowsCancelButton:fromEmergencyCallButton:", v5 ^ 1, 1);
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _configureActionButton](self, "_configureActionButton");
}

- (void)setShowsCancelButton:(BOOL)a3
{
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _setShowsCancelButton:fromEmergencyCallButton:](self, "_setShowsCancelButton:fromEmergencyCallButton:", a3, 0);
}

- (void)_setShowsCancelButton:(BOOL)a3 fromEmergencyCallButton:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  objc_super v8;

  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
  -[SBUIPasscodeLockViewWithKeypad setShowsCancelButton:](&v8, sel_setShowsCancelButton_);
  -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShowsCancelButton:", 0);

  if (!a4)
    -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _setShowsEmergencyCallButton:fromCancelButton:](self, "_setShowsEmergencyCallButton:fromCancelButton:", !v5, 1);
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _configureActionButton](self, "_configureActionButton");
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;

  v4 = a3;
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[SBUIButton setHidden:](self->_actionButton, "setHidden:", 1);
    -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 1;
  }
  else
  {
    -[SBUIButton setHidden:](self->_actionButton, "setHidden:", -[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton") ^ 1);
    -[SBUIPasscodeLockViewWithKeypad _numberPad](self, "_numberPad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = 0;
  }
  objc_msgSend(v7, "setShowsBackspaceButton:", v9);

  objc_msgSend(v4, "setShowsOkButton:", v6 != 0);
  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v13 = (void *)v10;
    v12 = objc_opt_respondsToSelector();
    v11 = v13;
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v13, "passcodeLockViewPasscodeDidChange:", self);
      v11 = v13;
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
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad passcodeEntryFieldTextDidChange:](self, "passcodeEntryFieldTextDidChange:", v9);

}

- (void)_sizeLabel:(id)a3
{
  CGFloat v4;
  id v5;
  CGRect v6;

  v5 = a3;
  objc_msgSend(v5, "setLineBreakMode:", 0);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad bounds](self, "bounds");
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
  -[SBUIPasscodeLockViewInstallTonightLongNumericKeypad _sizeLabel:](self, "_sizeLabel:", v3);

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
