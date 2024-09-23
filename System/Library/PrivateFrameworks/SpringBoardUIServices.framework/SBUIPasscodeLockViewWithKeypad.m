@implementation SBUIPasscodeLockViewWithKeypad

- (SBUIPasscodeLockViewWithKeypad)init
{
  return -[SBUIPasscodeLockViewWithKeypad initWithLightStyle:](self, "initWithLightStyle:", 0);
}

- (SBUIPasscodeLockViewWithKeypad)initWithLightStyle:(BOOL)a3
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
  SBUIPasscodeLockViewWithKeypad *v14;
  SBUIPasscodeLockViewWithKeypad *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  SBUIPasscodeLockNumberPad *v26;
  SBUIPasscodeLockNumberPad *numberPad;
  void *v28;
  objc_super v30;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v30.receiver = self;
  v30.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  v14 = -[SBUIPasscodeLockViewBase initWithFrame:](&v30, sel_initWithFrame_, v7, v9, v11, v13);
  v15 = v14;
  if (v14)
  {
    v14->_useLightStyle = a3;
    v16 = -[SBUIPasscodeLockViewWithKeypad _newStatusTitleView](v14, "_newStatusTitleView");
    -[SBUIPasscodeLockViewWithKeypad setStatusTitleView:](v15, "setStatusTitleView:", v16);

    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v15, "passcodeAuthenticationView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewWithKeypad statusTitleView](v15, "statusTitleView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    -[SBUIPasscodeLockViewBase _statusSubtitleText](v15, "_statusSubtitleText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (v20)
    {
      v21 = -[SBUIPasscodeLockViewWithKeypad _newStatusSubtitleView](v15, "_newStatusSubtitleView");
      -[SBUIPasscodeLockViewWithKeypad setStatusSubtitleView:](v15, "setStatusSubtitleView:", v21);

      -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v15, "passcodeAuthenticationView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPasscodeLockViewWithKeypad statusSubtitleView](v15, "statusSubtitleView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v23);

    }
    v24 = -[SBUIPasscodeLockViewWithKeypad _newEntryField](v15, "_newEntryField");
    objc_msgSend(v24, "setDelegate:", v15);
    -[SBUIPasscodeLockViewBase _setEntryField:](v15, "_setEntryField:", v24);
    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v15, "passcodeAuthenticationView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v24);

    v26 = -[SBUIPasscodeLockNumberPad initWithDefaultSizeAndLightStyle:]([SBUIPasscodeLockNumberPad alloc], "initWithDefaultSizeAndLightStyle:", v15->_useLightStyle);
    numberPad = v15->_numberPad;
    v15->_numberPad = v26;

    -[SBUIPasscodeLockNumberPad setDelegate:](v15->_numberPad, "setDelegate:", v15);
    -[SBUIPasscodeLockNumberPad setShowsBackspaceButton:](v15->_numberPad, "setShowsBackspaceButton:", 0);
    -[SBUIPasscodeLockNumberPad setShowsEmergencyCallButton:](v15->_numberPad, "setShowsEmergencyCallButton:", -[SBUIPasscodeLockViewBase showsEmergencyCallButton](v15, "showsEmergencyCallButton"));
    -[SBUIPasscodeLockViewBase passcodeAuthenticationView](v15, "passcodeAuthenticationView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v15->_numberPad);

    -[SBUIPasscodeLockViewWithKeypad _setHasInput:](v15, "_setHasInput:", 0);
    v15->_undoInputOnTouchCancellation = 1;

  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[SBUIPasscodeLockViewBase setPlaysKeypadSounds:](self, "setPlaysKeypadSounds:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase dealloc](&v3, sel_dealloc);
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
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase layoutSubviews](&v10, sel_layoutSubviews);
  if (!self->_hasPerformedLayoutOnce)
    self->_hasPerformedLayoutOnce = 1;
  -[SBUIPasscodeLockViewWithKeypad bounds](self, "bounds");
  -[SBUIPasscodeLockNumberPad frame](self->_numberPad, "frame");
  UIRectCenteredXInRectScale();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  -[SBUIPasscodeLockViewBase _numberPadOffsetFromTopOfScreen:](self, "_numberPadOffsetFromTopOfScreen:", self->_numberPad, 0);
  -[SBUIPasscodeLockNumberPad setFrame:](self->_numberPad, "setFrame:", v4, v9, v6, v8);
  -[SBUIPasscodeLockViewWithKeypad _layoutEntryField](self, "_layoutEntryField");
  -[SBUIPasscodeLockViewWithKeypad _layoutStatusView](self, "_layoutStatusView");
  if (self->_statusTitleView)
    -[SBUIPasscodeLockViewWithKeypad bringSubviewToFront:](self, "bringSubviewToFront:");
}

- (id)passcode
{
  void *v2;
  void *v3;

  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resetForFailedPasscode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase resetForFailedPasscode](&v3, sel_resetForFailedPasscode);
  -[SBUIPasscodeLockViewWithKeypad _setHasInput:](self, "_setHasInput:", 0);
  -[SBUIPasscodeLockViewWithKeypad setLastCharacterBeforeBackspace:](self, "setLastCharacterBeforeBackspace:", 0);
}

- (void)reset
{
  objc_super v3;

  -[SBUIPasscodeLockViewWithKeypad setLastCharacterBeforeBackspace:](self, "setLastCharacterBeforeBackspace:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase reset](&v3, sel_reset);
  -[SBUIPasscodeLockViewWithKeypad _setHasInput:](self, "_setHasInput:", 0);
}

- (void)setShowsEmergencyCallButton:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setShowsEmergencyCallButton:](&v5, sel_setShowsEmergencyCallButton_);
  -[SBUIPasscodeLockNumberPad setShowsEmergencyCallButton:](self->_numberPad, "setShowsEmergencyCallButton:", v3);
}

- (void)setShowsCancelButton:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setShowsCancelButton:](&v5, sel_setShowsCancelButton_);
  -[SBUIPasscodeLockNumberPad setShowsCancelButton:](self->_numberPad, "setShowsCancelButton:", v3);
}

- (void)setShowsStatusField:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setShowsStatusField:](&v4, sel_setShowsStatusField_, a3);
  -[SBUIPasscodeLockViewWithKeypad _toggleForStatusField](self, "_toggleForStatusField");
}

- (void)setKeypadVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase setKeypadVisible:animated:](&v7, sel_setKeypadVisible_animated_);
  -[SBUIPasscodeLockNumberPad setVisible:animated:](self->_numberPad, "setVisible:animated:", v5, v4);
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
  v9.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewWithKeypad traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  if (v4)
  {
    -[SBUIPasscodeLockViewWithKeypad traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredContentSizeCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "preferredContentSizeCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
    {
      -[SBUIPasscodeLockViewWithKeypad _updateFonts](self, "_updateFonts");
      -[SBUIPasscodeLockViewWithKeypad setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)willTransitionToPasscodeView
{
  -[SBUIPasscodeLockViewWithKeypad setKeypadVisible:animated:](self, "setKeypadVisible:animated:", 0, 0);
}

- (void)updateForTransitionToPasscodeView:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  SBUIPasscodeLockViewWithKeypad *v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase updateForTransitionToPasscodeView:animated:](&v10, sel_updateForTransitionToPasscodeView_animated_);
  if (v5)
  {
    v7 = self;
    v8 = 1;
    v9 = v4;
  }
  else
  {
    if (!v4)
      return;
    v7 = self;
    v8 = 0;
    v9 = 1;
  }
  -[SBUIPasscodeLockViewWithKeypad setKeypadVisible:animated:](v7, "setKeypadVisible:animated:", v8, v9);
}

- (id)_statusTitleView
{
  return self->_statusTitleView;
}

- (id)_statusSubtitleView
{
  return self->_statusSubtitleView;
}

- (id)_numberPad
{
  return self->_numberPad;
}

- (id)_newEntryField
{
  return 0;
}

- (BOOL)_includesStatusView
{
  return 1;
}

- (void)_setHasInput:(BOOL)a3
{
  -[SBUIPasscodeLockNumberPad setShowsBackspaceButton:](self->_numberPad, "setShowsBackspaceButton:", a3);
}

- (double)_entryFieldBottomYDistanceFromNumberPadTopButton
{
  return 20.0;
}

- (id)_statusTitleViewTitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusTitleViewTitleFont");
}

- (id)_statusSubtitleViewTitleFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusSubtitleViewTitleFont");
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
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  objc_super v33;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SBUIPasscodeLockViewWithKeypad;
  -[SBUIPasscodeLockViewBase updateStatusText:subtitle:animated:](&v33, sel_updateStatusText_subtitle_animated_, v8, v9, v5);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (unint64_t)(-[SBUIPasscodeLockViewBase _orientation](self, "_orientation") - 3) > 1)
  {
    -[SBUIPasscodeLockViewWithKeypad statusTitleView](self, "statusTitleView");
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
      v15 = -[SBUIPasscodeLockViewWithKeypad _newStatusTitleView](self, "_newStatusTitleView");
      objc_msgSend(v15, "setText:", v8);
      -[SBUIPasscodeLockViewWithKeypad setStatusTitleView:](self, "setStatusTitleView:", v15);
    }
    -[SBUIPasscodeLockViewWithKeypad statusSubtitleView](self, "statusSubtitleView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[SBUIPasscodeLockViewBase _setStatusSubtitleText:](self, "_setStatusSubtitleText:", v9);
      v17 = -[SBUIPasscodeLockViewWithKeypad _newStatusSubtitleView](self, "_newStatusSubtitleView");
      -[SBUIPasscodeLockViewWithKeypad setStatusSubtitleView:](self, "setStatusSubtitleView:", v17);
      -[SBUIPasscodeLockViewBase passcodeAuthenticationView](self, "passcodeAuthenticationView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "insertSubview:belowSubview:", v17, v19);

    }
    else
    {
      -[SBUIPasscodeLockViewWithKeypad setStatusSubtitleView:](self, "setStatusSubtitleView:", 0);
      v17 = 0;
    }
    -[SBUIPasscodeLockViewWithKeypad setNeedsLayout](self, "setNeedsLayout");
    if (v12 && v15)
    {
      -[SBUIPasscodeLockViewBase passcodeAuthenticationView](self, "passcodeAuthenticationView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "insertSubview:aboveSubview:", v15, v12);

    }
    if (self->_hasPerformedLayoutOnce && v5)
    {
      objc_msgSend(v15, "setAlpha:", 0.0);
      objc_msgSend(v17, "setAlpha:", 0.0);
      v21 = (void *)MEMORY[0x1E0CEABB0];
      v22 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke;
      v30[3] = &unk_1E4C3E6A0;
      v31 = v12;
      v32 = v16;
      v27[0] = v22;
      v27[1] = 3221225472;
      v27[2] = __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_2;
      v27[3] = &unk_1E4C3F0C0;
      v28 = v31;
      v29 = v32;
      objc_msgSend(v21, "animateWithDuration:animations:completion:", v30, v27, 0.22);
      v23 = (void *)MEMORY[0x1E0CEABB0];
      v24[0] = v22;
      v24[1] = 3221225472;
      v24[2] = __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_3;
      v24[3] = &unk_1E4C3E6A0;
      v25 = v15;
      v26 = v17;
      objc_msgSend(v23, "animateWithDuration:delay:options:animations:completion:", 0, v24, 0, 0.4, 0.17);

    }
    else
    {
      objc_msgSend(v12, "removeFromSuperview");
      objc_msgSend(v16, "removeFromSuperview");
    }

  }
  else
  {
    -[SBUIPasscodeLockViewWithKeypad setStatusTitleView:](self, "setStatusTitleView:", 0);
    -[SBUIPasscodeLockViewWithKeypad setStatusSubtitleView:](self, "setStatusSubtitleView:", 0);
  }

}

uint64_t __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

uint64_t __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
}

uint64_t __69__SBUIPasscodeLockViewWithKeypad_updateStatusText_subtitle_animated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

- (double)_statusTitleWidth
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3 + -40.0;

  return v4;
}

- (id)_newStatusTitleView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  -[SBUIPasscodeLockViewWithKeypad _statusTitleViewTitleFont](self, "_statusTitleViewTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setLineBreakMode:", 4);
  -[SBUIPasscodeLockViewBase _statusText](self, "_statusText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "font");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v3, "setMinimumScaleFactor:", 12.0 / v7);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v8);

  if (self->_useLightStyle)
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v9);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(v3, "setNumberOfLines:", 1);
  return v3;
}

- (id)_newStatusSubtitleView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  -[SBUIPasscodeLockViewWithKeypad _statusSubtitleViewTitleFont](self, "_statusSubtitleViewTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

  objc_msgSend(v3, "setLineBreakMode:", 4);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "setMinimumScaleFactor:", 0.8);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  if (self->_useLightStyle)
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(v3, "setTextAlignment:", 1);
  -[SBUIPasscodeLockViewBase _statusSubtitleText](self, "_statusSubtitleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v7);
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
    v10 = 0;
  else
    v10 = v9;
  objc_msgSend(v3, "setNumberOfLines:", v10);

  return v3;
}

- (double)_offsetForCenteringTitleAndEntryFieldFrame:(CGRect)a3 withTopYvalue:(double)a4 bottomYvalue:(double)a5
{
  double height;
  double y;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  height = a3.size.height;
  y = a3.origin.y;
  -[SBUIPasscodeLockViewWithKeypad _entryFieldBottomYDistanceFromNumberPadTopButton](self, "_entryFieldBottomYDistanceFromNumberPadTopButton", a3.origin.x, a3.origin.y, a3.size.width);
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1 && SBFEffectiveHomeButtonType() == 2)
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1 || SBFEffectiveHomeButtonType() != 2)
    goto LABEL_12;
  v17 = SBFEffectiveArtworkSubtype();
  if (v17 > 2795)
  {
    if (v17 != 2796 && v17 != 2868)
      goto LABEL_3;
LABEL_12:
    -[SBUIPasscodeLockViewWithKeypad _topBoundingOffset](self, "_topBoundingOffset");
    return SBUIFloatFloorForMainScreenScale((height + y + v11 - v14 - (a5 - a4)) * 0.5) - (height + y + v11 - a5);
  }
  if (v17 == 2556 || v17 == 2622)
    goto LABEL_12;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockOffsetFromTopOfScreen");
  return SBUIFloatFloorForMainScreenScale((height + y + v11 - v14 - (a5 - a4)) * 0.5) - (height + y + v11 - a5);
}

- (double)_topBoundingOffset
{
  void *v2;
  void *v3;
  int v4;
  char v5;
  char IsD94Like;
  int v7;
  char v8;
  char v9;
  double v10;
  int v11;
  char v12;
  int v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double result;
  int v19;
  char v20;
  char v21;
  int v22;
  char v23;
  int v24;
  char v25;
  int v26;
  char v27;
  char IsD93Like;
  double v29;
  double v30;
  double v31;
  double v32;

  v4 = __sb__runningInSpringBoard();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom"))
    {
      IsD94Like = _SBF_Private_IsD94Like();

      if ((IsD94Like & 1) != 0)
        return 42.0;
      goto LABEL_22;
    }
LABEL_9:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      v9 = _SBF_Private_IsD94Like();
      goto LABEL_19;
    }
    v7 = __sb__runningInSpringBoard();
    v8 = v7;
    if (v7)
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
    if (v10 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      v9 = 0;
      if ((v8 & 1) != 0)
        goto LABEL_19;
    }
    else
    {
      v9 = _SBF_Private_IsD94Like();
      if ((v8 & 1) != 0)
      {
LABEL_19:
        if ((v5 & 1) == 0)

        if ((v9 & 1) != 0)
          return 42.0;
        goto LABEL_22;
      }
    }

    goto LABEL_19;
  }
  if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
    goto LABEL_9;
  if ((_SBF_Private_IsD94Like() & 1) != 0)
    return 42.0;
LABEL_22:
  v11 = __sb__runningInSpringBoard();
  v12 = v11;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_40;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v12 & 1) != 0)
        goto LABEL_40;
LABEL_32:

      goto LABEL_40;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
      goto LABEL_32;
  }
  v13 = __sb__runningInSpringBoard();
  v14 = v13;
  if (v13)
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
  v16 = v15;
  v17 = *(double *)(MEMORY[0x1E0DAB260] + 200);
  if ((v14 & 1) == 0)

  if ((v12 & 1) == 0)
  if (v16 >= v17)
    return 87.3333333;
LABEL_40:
  v19 = __sb__runningInSpringBoard();
  v20 = v19;
  if (v19)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      if ((_SBF_Private_IsD93Like() & 1) != 0)
        return 42.0;
      goto LABEL_47;
    }
LABEL_58:
    if (SBFEffectiveHomeButtonType() != 2)
    {
      IsD93Like = _SBF_Private_IsD93Like();
      goto LABEL_68;
    }
    v26 = __sb__runningInSpringBoard();
    v27 = v26;
    if (v26)
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
    if (v29 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      IsD93Like = 0;
      if ((v27 & 1) != 0)
        goto LABEL_68;
    }
    else
    {
      IsD93Like = _SBF_Private_IsD93Like();
      if ((v27 & 1) != 0)
      {
LABEL_68:
        if ((v20 & 1) == 0)

        if ((IsD93Like & 1) != 0)
          return 42.0;
        goto LABEL_47;
      }
    }

    goto LABEL_68;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "userInterfaceIdiom"))
    goto LABEL_58;
  v21 = _SBF_Private_IsD93Like();

  if ((v21 & 1) != 0)
    return 42.0;
LABEL_47:
  v22 = __sb__runningInSpringBoard();
  v23 = v22;
  if (v22)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_79;
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if ((v23 & 1) != 0)
        goto LABEL_79;
      goto LABEL_57;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_57:

      goto LABEL_79;
    }
  }
  v24 = __sb__runningInSpringBoard();
  v25 = v24;
  if (v24)
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
  v31 = v30;
  v32 = *(double *)(MEMORY[0x1E0DAB260] + 184);
  if ((v25 & 1) == 0)

  if ((v23 & 1) == 0)
  if (v31 >= v32)
    return 86.0;
LABEL_79:
  objc_msgSend(MEMORY[0x1E0DA9E68], "proudLockOffsetFromTopOfScreen");
  return result;
}

- (CGRect)_defaultEntryFieldPosition
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat Width;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect result;

  -[SBUIPasscodeLockViewWithKeypad bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;
  -[SBUIPasscodeLockNumberPad frame](self->_numberPad, "frame");
  v15 = v14;
  -[SBUIPasscodeLockNumberPad _distanceToTopOfFirstButton](self->_numberPad, "_distanceToTopOfFirstButton");
  v17 = v15 + v16;
  -[SBUIPasscodeLockViewWithKeypad _entryFieldBottomYDistanceFromNumberPadTopButton](self, "_entryFieldBottomYDistanceFromNumberPadTopButton");
  v19 = v17 - v18 - v13;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  Width = CGRectGetWidth(v25);

  v21 = 0.0;
  v22 = v19;
  v23 = Width;
  v24 = v13;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (void)_layoutStatusView
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double MaxY;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  int v51;
  char v52;
  BOOL v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  id v71;
  CGRect v72;
  CGRect v73;

  -[SBUIPasscodeLockViewWithKeypad statusTitleView](self, "statusTitleView");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewWithKeypad statusSubtitleView](self, "statusSubtitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }
  -[SBUIPasscodeLockViewWithKeypad bounds](self, "bounds");
  v8 = v7;
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewWithKeypad _defaultEntryFieldPosition](self, "_defaultEntryFieldPosition");
  v67 = v10;
  v68 = v11;
  v13 = v12;
  v69 = v14;
  -[SBUIPasscodeLockViewWithKeypad _statusTitleWidth](self, "_statusTitleWidth");
  v16 = v15;
  v17 = (double *)MEMORY[0x1E0C9D648];
  v18 = *MEMORY[0x1E0C9D648];
  v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v71, "setLineBreakMode:", 0);
  objc_msgSend(v71, "setNumberOfLines:", 2);
  v70 = v8;
  objc_msgSend(v71, "sizeThatFits:", v16, v8);
  v21 = v20;
  v23 = v22;
  objc_msgSend(v71, "setBounds:", v18, v19, v20, v22);
  if (v6)
  {
    objc_msgSend(v4, "setLineBreakMode:", 0);
    objc_msgSend(v4, "setNumberOfLines:", 2);
    v25 = *MEMORY[0x1E0C9D538];
    v24 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v4, "sizeThatFits:", v16, v70);
    v64 = v13;
    objc_msgSend(v4, "setBounds:", v25, v24, v26, v27);
    v17 = (double *)0x1E0DA9000;
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusTitleBaselineOffsetFromEntryFieldIncludingSubtitle");
    v28 = v23;
    v30 = v13 - v29;
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusTitleBaselineOffsetFromTitle");
    objc_msgSend(v71, "_lastLineBaseline");
    v32 = v31;
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusTitleExtraOffsetIncludingSubtitle");
    v34 = v30 - (v32 + v33);
    objc_msgSend(v4, "_firstLineBaselineOffsetFromBoundsTop");
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusSubtitleTitleExtraOffset");
    v35 = fmax(v34, 0.0);
    if (SBUIPasscodeScreenShouldNotWrapSubtitle(-[SBUIPasscodeLockViewBase _orientation](self, "_orientation")))
      v35 = v35 + 20.0;
    v72.origin.x = v18;
    v72.origin.y = v35;
    v72.size.width = v21;
    v72.size.height = v28;
    CGRectGetMaxY(v72);
    UIRectCenteredXInRectScale();
    v37 = v36;
    v19 = v38;
    v40 = v39;
    v42 = v41;
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadEntryFieldOffsetForSubtitle", 0);
    v44 = v64 + v43;
    v73.origin.x = v37;
    v73.origin.y = v19;
    v66 = v40;
    v73.size.width = v40;
    v73.size.height = v42;
    MaxY = CGRectGetMaxY(v73);
    if (v44 >= MaxY)
      v46 = v44;
    else
      v46 = MaxY;
    v47 = v35;
  }
  else
  {
    v42 = v17[3];
    v66 = v17[2];
    objc_msgSend(MEMORY[0x1E0DA9E68], "pinKeypadStatusTitleBaselineOffsetFromEntryField");
    v46 = v13;
    v49 = v13 - v48;
    objc_msgSend(v71, "_lastLineBaseline");
    v47 = v49 - v50;
    v37 = v18;
  }
  v51 = __sb__runningInSpringBoard();
  v65 = v42;
  if (v51)
  {
    v52 = v51;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_26;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      if (!-[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"))
        goto LABEL_26;
      goto LABEL_21;
    }
    if ((v52 & 1) != 0)
      goto LABEL_26;
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v17 = (double *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
    goto LABEL_25;
  v53 = -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented");

  if (!v53)
    goto LABEL_26;
LABEL_21:
  objc_msgSend(v71, "_capOffsetFromBoundsTop");
  -[SBUIPasscodeLockViewWithKeypad _offsetForCenteringTitleAndEntryFieldFrame:withTopYvalue:bottomYvalue:](self, "_offsetForCenteringTitleAndEntryFieldFrame:withTopYvalue:bottomYvalue:", v67, v46, v69, v68, v47 + v54, v68 + v46);
  v46 = v46 - v55;
  if (!v6)
    v55 = 0.0;
  v19 = v19 - v55;
LABEL_26:
  UIRectCenteredXInRectScale();
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  objc_msgSend(v71, "setPreferredMaxLayoutWidth:", v60, 0);
  objc_msgSend(v71, "setFrame:", v57, v59, v61, v63);
  objc_msgSend(v9, "setFrame:", v67, v46, v69, v68);
  if (v6)
    objc_msgSend(v4, "setFrame:", v37, v19, v66, v65);

}

- (void)_toggleForStatusField
{
  uint64_t v3;

  v3 = -[SBUIPasscodeLockViewBase showsStatusField](self, "showsStatusField") ^ 1;
  -[UILabel setHidden:](self->_statusTitleView, "setHidden:", v3);
  -[UILabel setHidden:](self->_statusSubtitleView, "setHidden:", v3);
}

- (void)_notifyDelegatePasscodeEntered
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "passcodeLockViewPasscodeEntered:", self);
      v4 = v6;
    }
  }

}

- (void)_notifyDelegatePasscodeCancelled
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v6 = (void *)v3;
    v5 = objc_opt_respondsToSelector();
    v4 = v6;
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v6, "passcodeLockViewCancelButtonPressed:", self);
      v4 = v6;
    }
  }

}

- (void)_noteStringEntered:(id)a3 eligibleForPlayingSounds:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v9 = v6;
    if (v4 && -[SBUIPasscodeLockViewBase playsKeypadSounds](self, "playsKeypadSounds"))
    {
      -[SBUIPasscodeLockViewBase keyboardFeedbackBehavior](self, "keyboardFeedbackBehavior");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "actionOccurred:", 1);

    }
    -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendString:", v9);

    v6 = v9;
  }

}

- (void)_noteBackspaceHit
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "substringFromIndex:", v5 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewWithKeypad setLastCharacterBeforeBackspace:](self, "setLastCharacterBeforeBackspace:", v8);

    -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteLastCharacter");

  }
}

- (void)_noteKeyUp:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;

  if (objc_msgSend(a3, "characterType") == 1)
    -[SBUIPasscodeLockViewBase _sendDelegateKeypadKeyUp](self, "_sendDelegateKeypadKeyUp");
  -[SBUIPasscodeLockViewWithKeypad setLastCharacterBeforeBackspace:](self, "setLastCharacterBeforeBackspace:", 0);
  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SBUIPasscodeLockViewWithKeypad _numericEntryFieldIfExists](self, "_numericEntryFieldIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v7, "length");
    if (v6 >= objc_msgSend(v5, "maxNumbersAllowed"))
      -[SBUIPasscodeLockViewWithKeypad _notifyDelegatePasscodeEntered](self, "_notifyDelegatePasscodeEntered");
  }

}

- (id)_numericEntryFieldIfExists
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[SBUIPasscodeLockViewBase _entryField](self, "_entryField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)_usesLightStyle
{
  return self->_useLightStyle;
}

- (void)_updateFonts
{
  UILabel *statusTitleView;
  void *v4;
  UILabel *statusSubtitleView;
  id v6;

  statusTitleView = self->_statusTitleView;
  -[SBUIPasscodeLockViewWithKeypad _statusTitleViewTitleFont](self, "_statusTitleViewTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](statusTitleView, "setFont:", v4);

  statusSubtitleView = self->_statusSubtitleView;
  -[SBUIPasscodeLockViewWithKeypad _statusSubtitleViewTitleFont](self, "_statusSubtitleViewTitleFont");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](statusSubtitleView, "setFont:", v6);

}

- (void)passcodeLockNumberPad:(id)a3 keyDown:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SBUIPasscodeLockViewWithKeypad _numericEntryFieldIfExists](self, "_numericEntryFieldIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoAcceptWhenMaxNumbersMet:", 0);

  v6 = objc_msgSend(v8, "characterType");
  if (v6 == 1)
  {
    -[SBUIPasscodeLockViewBase _sendDelegateKeypadKeyDown](self, "_sendDelegateKeypadKeyDown");
    objc_msgSend(v8, "stringCharacter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewWithKeypad _noteStringEntered:eligibleForPlayingSounds:](self, "_noteStringEntered:eligibleForPlayingSounds:", v7, 1);

  }
  else if (v6 == 2)
  {
    -[SBUIPasscodeLockViewWithKeypad _noteBackspaceHit](self, "_noteBackspaceHit");
  }

}

- (void)passcodeLockNumberPad:(id)a3 keyUp:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBUIPasscodeLockViewWithKeypad _numericEntryFieldIfExists](self, "_numericEntryFieldIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoAcceptWhenMaxNumbersMet:", 1);

  -[SBUIPasscodeLockViewWithKeypad _noteKeyUp:](self, "_noteKeyUp:", v6);
}

- (void)passcodeLockNumberPad:(id)a3 keyCancelled:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a4;
  -[SBUIPasscodeLockViewWithKeypad _numericEntryFieldIfExists](self, "_numericEntryFieldIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutoAcceptWhenMaxNumbersMet:", 1);

  v6 = objc_msgSend(v7, "characterType");
  if (v6 == 2)
  {
    if (self->_lastCharacterBeforeBackspace)
    {
      if (self->_undoInputOnTouchCancellation)
        -[SBUIPasscodeLockViewWithKeypad _noteStringEntered:eligibleForPlayingSounds:](self, "_noteStringEntered:eligibleForPlayingSounds:");
      goto LABEL_8;
    }
  }
  else if (v6 == 1)
  {
    if (self->_undoInputOnTouchCancellation)
      -[SBUIPasscodeLockViewWithKeypad _noteBackspaceHit](self, "_noteBackspaceHit");
LABEL_8:
    -[SBUIPasscodeLockViewWithKeypad _noteKeyUp:](self, "_noteKeyUp:", v7);
  }

}

- (void)passcodeLockNumberPadEmergencyCallButtonHit:(id)a3
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
      objc_msgSend(v7, "passcodeLockViewEmergencyCallButtonPressed:", self);
      v5 = v7;
    }
  }

}

- (void)passcodeEntryFieldDidCancelEntry:(id)a3
{
  if (-[SBUIPasscodeLockViewBase showsCancelButton](self, "showsCancelButton", a3))
    -[SBUIPasscodeLockViewWithKeypad _notifyDelegatePasscodeCancelled](self, "_notifyDelegatePasscodeCancelled");
}

- (BOOL)passcodeEntryField:(id)a3 shouldInsertText:(id)a4
{
  return 1;
}

- (void)passcodeEntryFieldTextDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIPasscodeLockViewWithKeypad _setHasInput:](self, "_setHasInput:", objc_msgSend(v4, "length") != 0);

  -[SBUIPasscodeLockViewBase delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v8 = (void *)v5;
    v7 = objc_opt_respondsToSelector();
    v6 = v8;
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v8, "passcodeLockViewPasscodeDidChange:", self);
      v6 = v8;
    }
  }

}

- (BOOL)_undoInputOnTouchCancellation
{
  return self->_undoInputOnTouchCancellation;
}

- (void)_setUndoInputOnTouchCancellation:(BOOL)a3
{
  self->_undoInputOnTouchCancellation = a3;
}

- (NSString)lastCharacterBeforeBackspace
{
  return self->_lastCharacterBeforeBackspace;
}

- (void)setLastCharacterBeforeBackspace:(id)a3
{
  objc_storeStrong((id *)&self->_lastCharacterBeforeBackspace, a3);
}

- (UILabel)statusTitleView
{
  return self->_statusTitleView;
}

- (void)setStatusTitleView:(id)a3
{
  objc_storeStrong((id *)&self->_statusTitleView, a3);
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
  objc_storeStrong((id *)&self->_lastCharacterBeforeBackspace, 0);
  objc_storeStrong((id *)&self->_numberPad, 0);
  objc_storeStrong((id *)&self->_statusSubtitleView, 0);
  objc_storeStrong((id *)&self->_statusTitleView, 0);
}

@end
