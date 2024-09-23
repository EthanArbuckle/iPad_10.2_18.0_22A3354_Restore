@implementation SBUIPasscodeViewWithLockScreenStyle

- (SBUIPasscodeViewWithLockScreenStyle)initWithFrame:(CGRect)a3 includeBlur:(BOOL)a4 passcodeViewGenerator:(id)a5
{
  _BOOL4 v5;
  double height;
  double width;
  double y;
  double x;
  void (**v11)(_QWORD);
  SBUIPasscodeViewWithLockScreenStyle *v12;
  id v13;
  uint64_t v14;
  SBUIBackgroundView *backgroundView;
  void *v16;
  void *v17;
  uint64_t v18;
  SBUIPasscodeLockView *passcodeView;
  SBUIPasscodeLockView *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v5 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (void (**)(_QWORD))a5;
  v27.receiver = self;
  v27.super_class = (Class)SBUIPasscodeViewWithLockScreenStyle;
  v12 = -[SBUIPasscodeViewWithLockScreenStyle initWithFrame:](&v27, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    if (v5)
    {
      v13 = objc_alloc(MEMORY[0x1E0DAC270]);
      -[SBUIPasscodeViewWithLockScreenStyle bounds](v12, "bounds");
      v14 = objc_msgSend(v13, "initWithFrame:");
      backgroundView = v12->_backgroundView;
      v12->_backgroundView = (SBUIBackgroundView *)v14;

      -[SBUIBackgroundView setAutoresizingMask:](v12->_backgroundView, "setAutoresizingMask:", 18);
      -[SBUIBackgroundView setBackgroundStyle:](v12->_backgroundView, "setBackgroundStyle:", 3);
      -[SBUIPasscodeViewWithLockScreenStyle addSubview:](v12, "addSubview:", v12->_backgroundView);
      -[SBUIPasscodeViewWithLockScreenStyle sendSubviewToBack:](v12, "sendSubviewToBack:", v12->_backgroundView);
    }
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2030);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "combinedTintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v11[2](v11);
    v18 = objc_claimAutoreleasedReturnValue();
    passcodeView = v12->_passcodeView;
    v12->_passcodeView = (SBUIPasscodeLockView *)v18;

    v20 = v12->_passcodeView;
    objc_msgSend(v17, "alphaComponent");
    objc_msgSend(v17, "colorWithAlphaComponent:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockView setCustomBackgroundColor:](v20, "setCustomBackgroundColor:", v21);

    -[SBUIPasscodeLockView setShowsEmergencyCallButton:](v12->_passcodeView, "setShowsEmergencyCallButton:", 0);
    -[SBUIPasscodeViewWithLockScreenStyle addSubview:](v12, "addSubview:", v12->_passcodeView);
    v22 = objc_alloc(MEMORY[0x1E0DA9DA8]);
    -[SBUIBackgroundView backdropView](v12->_backgroundView, "backdropView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithBackdropView:", v23);

    -[SBUIPasscodeLockView setBackgroundLegibilitySettingsProvider:](v12->_passcodeView, "setBackgroundLegibilitySettingsProvider:", v24);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeViewWithLockScreenStyle setBackgroundColor:](v12, "setBackgroundColor:", v25);

  }
  return v12;
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

  -[SBUIPasscodeViewWithLockScreenStyle bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUIPasscodeLockView setFrame:](self->_passcodeView, "setFrame:");
  -[SBUIBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
}

- (void)setBlurEnabled:(BOOL)a3
{
  SBUIBackgroundView *backgroundView;
  uint64_t v4;

  backgroundView = self->_backgroundView;
  if (a3)
    v4 = 3;
  else
    v4 = 1;
  -[SBUIBackgroundView setBackgroundStyle:](backgroundView, "setBackgroundStyle:", v4);
}

- (SBUIPasscodeLockView)passcodeView
{
  return self->_passcodeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_passcodeView, 0);
}

@end
