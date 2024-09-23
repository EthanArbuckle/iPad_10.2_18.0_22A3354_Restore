@implementation SBUIPasscodeLockViewInstallTonightWithKeyboard

- (SBUIPasscodeLockViewInstallTonightWithKeyboard)initWithLightStyle:(BOOL)a3
{
  SBUIPasscodeLockViewInstallTonightWithKeyboard *v4;
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
  v15.super_class = (Class)SBUIPasscodeLockViewInstallTonightWithKeyboard;
  v4 = -[SBUIPasscodeLockViewWithKeyboard initWithLightStyle:](&v15, sel_initWithLightStyle_);
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
    -[SBUIButton setTranslatesAutoresizingMaskIntoConstraints:](v4->_actionButton, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
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

    -[SBUIPasscodeLockViewInstallTonightWithKeyboard _configureActionButton](v4, "_configureActionButton");
  }
  return v4;
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  objc_super v6;

  LODWORD(v3) = a3;
  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceClass"))
    v3 = 0;
  else
    v3 = v3;

  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewInstallTonightWithKeyboard;
  -[SBUIPasscodeLockViewWithKeyboard setShowsEmergencyCallButton:](&v6, sel_setShowsEmergencyCallButton_, v3);
  if ((_DWORD)v3)
    -[SBUIPasscodeLockViewInstallTonightWithKeyboard setShowsCancelButton:](self, "setShowsCancelButton:", 0);
  -[SBUIPasscodeLockViewInstallTonightWithKeyboard _configureActionButton](self, "_configureActionButton");
}

- (void)setShowsCancelButton:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewInstallTonightWithKeyboard;
  -[SBUIPasscodeLockViewBase setShowsCancelButton:](&v5, sel_setShowsCancelButton_);
  if (v3)
    -[SBUIPasscodeLockViewInstallTonightWithKeyboard setShowsEmergencyCallButton:](self, "setShowsEmergencyCallButton:", 0);
  -[SBUIPasscodeLockViewInstallTonightWithKeyboard _configureActionButton](self, "_configureActionButton");
}

- (void)_configureActionButton
{
  SBUIButton *actionButton;
  _BOOL4 v4;
  SBUIButton *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  if (-[SBUIPasscodeLockViewBase showsEmergencyCallButton](self, "showsEmergencyCallButton"))
  {
    actionButton = self->_actionButton;
LABEL_6:
    v8 = 1;
    goto LABEL_7;
  }
  v4 = -[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton");
  v5 = self->_actionButton;
  if (!v4)
  {
    actionButton = self->_actionButton;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SOFTWARE_UPDATE_PASSCODE_REMIND_LATER"), &stru_1E4C40DE8, CFSTR("SpringBoardUIServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIButton setTitle:forState:](v5, "setTitle:forState:", v7, 0);

  actionButton = self->_actionButton;
  v8 = 0;
LABEL_7:
  -[SBUIButton setHidden:](actionButton, "setHidden:", v8);
}

- (void)_layoutStatusView
{
  void *v3;
  void *v4;
  objc_super v5;

  -[SBUIPasscodeLockViewWithKeyboard _statusTitleView](self, "_statusTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineBreakMode:", 0);
  objc_msgSend(v3, "setNumberOfLines:", 2);
  -[SBUIPasscodeLockViewWithKeyboard _statusSubtitleView](self, "_statusSubtitleView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNumberOfLines:", 2);
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewInstallTonightWithKeyboard;
  -[SBUIPasscodeLockViewWithKeyboard _layoutStatusView](&v5, sel__layoutStatusView);
  -[SBUIPasscodeLockViewInstallTonightWithKeyboard _layoutActionButton](self, "_layoutActionButton");

}

- (void)_layoutActionButton
{
  void *v2;
  void *v3;
  void *v5;
  int v6;
  char v7;
  int v8;
  char v9;
  CGRect v10;

  -[SBUIButton titleLabel](self->_actionButton, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeToFit");

  -[SBUIButton sizeToFit](self->_actionButton, "sizeToFit");
  -[SBUIPasscodeLockViewInstallTonightWithKeyboard bounds](self, "bounds");
  -[SBUIPasscodeLockViewWithKeyboard _keyboardFrameForInterfaceOrientation:](self, "_keyboardFrameForInterfaceOrientation:", -[SBUIPasscodeLockViewBase _orientation](self, "_orientation"));
  CGRectGetMinY(v10);
  -[SBUIButton frame](self->_actionButton, "frame");
  v6 = __sb__runningInSpringBoard();
  v7 = v6;
  if (v6)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {
LABEL_12:

      goto LABEL_13;
    }
  }
  v8 = __sb__runningInSpringBoard();
  v9 = v8;
  if (v8)
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
  if ((v9 & 1) == 0)

  if ((v7 & 1) == 0)
    goto LABEL_12;
LABEL_13:
  UIRectCenteredXInRectScale();
  -[SBUIButton setFrame:](self->_actionButton, "setFrame:");
}

- (void)_actionButtonHit
{
  void *v3;
  char v4;
  char v5;
  void *v6;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBUIPasscodeLockViewBase showsEmergencyCallButton](self, "showsEmergencyCallButton"))
  {
    v3 = v6;
    if (v6)
    {
      v4 = objc_opt_respondsToSelector();
      v3 = v6;
      if ((v4 & 1) != 0)
      {
        objc_msgSend(v6, "passcodeLockViewEmergencyCallButtonPressed:", self);
LABEL_8:
        v3 = v6;
      }
    }
  }
  else
  {
    v3 = v6;
    if (v6)
    {
      v5 = objc_opt_respondsToSelector();
      v3 = v6;
      if ((v5 & 1) != 0)
      {
        objc_msgSend(v6, "passcodeLockViewCancelButtonPressed:", self);
        goto LABEL_8;
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
}

@end
