@implementation PSBulletedPINView

- (PSBulletedPINView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (PSBulletedPINView)initWithFrame:(CGRect)a3 numberOfFields:(int)a4
{
  double height;
  double width;
  PSBulletedPINView *v7;
  void *v8;
  void *v9;
  PSPasscodeField *v10;
  PSPasscodeField *passcodeField;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  UILabel *titleLabel;
  UILabel *v17;
  void *v18;
  UILabel *v19;
  void *v20;
  void *v21;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)PSBulletedPINView;
  v7 = -[PSBulletedPINView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v7)
  {
    +[PSListController appearance](PSListController, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSBulletedPINView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    v10 = -[PSPasscodeField initWithNumberOfEntryFields:]([PSPasscodeField alloc], "initWithNumberOfEntryFields:", a4);
    passcodeField = v7->_passcodeField;
    v7->_passcodeField = v10;

    -[PSPasscodeField frame](v7->_passcodeField, "frame");
    -[PSPasscodeField setFrame:](v7->_passcodeField, "setFrame:", floor((width - v12) * 0.5), floor((height - v13) * 0.5));
    -[PSBulletedPINView addSubview:](v7, "addSubview:", v7->_passcodeField);
    -[PSPasscodeField setDelegate:](v7->_passcodeField, "setDelegate:", v7);
    v14 = objc_alloc(MEMORY[0x1E0CEA700]);
    v15 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v7->super._titleLabel;
    v7->super._titleLabel = (UILabel *)v15;

    v17 = v7->super._titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setOpaque:](v7->super._titleLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v7->super._titleLabel, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v7->super._titleLabel, "setTextAlignment:", 1);
    v19 = v7->super._titleLabel;
    +[PSListController appearance](PSListController, "appearance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "textColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v19, "setTextColor:", v21);

    -[UILabel setNumberOfLines:](v7->super._titleLabel, "setNumberOfLines:", 0);
    -[UILabel accessibilitySetIdentification:](v7->super._titleLabel, "accessibilitySetIdentification:", CFSTR("titleLabel"));
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->super._titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PSBulletedPINView addSubview:](v7, "addSubview:", v7->super._titleLabel);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PSPasscodeField setDelegate:](self->_passcodeField, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PSBulletedPINView;
  -[PSBulletedPINView dealloc](&v3, sel_dealloc);
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
  CGFloat v11;
  CGFloat v12;
  FailureBarView *failureView;
  void *v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[PSPasscodeField frame](self->_passcodeField, "frame");
  v4 = v3;
  v6 = v5;
  -[PSBulletedPINView bounds](self, "bounds");
  v8 = floor((v7 - v4) * 0.5);
  -[PSBulletedPINView bounds](self, "bounds");
  v10 = floor((v9 - v6) * 0.5);
  -[PSPasscodeField setFrame:](self->_passcodeField, "setFrame:", v8, v10, v4, v6);
  v16.origin.x = v8;
  v16.origin.y = v10;
  v16.size.width = v4;
  v16.size.height = v6;
  v11 = CGRectGetMinY(v16) + -22.0;
  -[PINView layoutTopLabel:withMaxY:](self, "layoutTopLabel:withMaxY:", self->super._titleLabel, v11);
  -[PINView layoutTopLabel:withMaxY:](self, "layoutTopLabel:withMaxY:", self->super._errorTitleLabel, v11);
  v15.receiver = self;
  v15.super_class = (Class)PSBulletedPINView;
  -[PINView layoutSubviews](&v15, sel_layoutSubviews);
  if (self->super._pinPolicyLabel)
  {
    v17.origin.x = v8;
    v17.origin.y = v10;
    v17.size.width = v4;
    v17.size.height = v6;
    -[PINView layoutBottomSubview:withLabel:withMinY:](self, "layoutBottomSubview:withLabel:withMinY:", self->super._pinPolicyLabel, self->super._pinPolicyLabel, CGRectGetMaxY(v17) + 10.0);
  }
  if (self->super._failureView)
  {
    v18.origin.x = v8;
    v18.origin.y = v10;
    v18.size.width = v4;
    v18.size.height = v6;
    v12 = CGRectGetMaxY(v18) + 22.0;
    failureView = self->super._failureView;
    -[FailureBarView titleLabel](failureView, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView layoutBottomSubview:withLabel:withMinY:](self, "layoutBottomSubview:withLabel:withMinY:", failureView, v14, v12);

  }
}

- (void)hidePasscodeField:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;

  v3 = a3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x4010000000;
  v15[3] = "";
  v16 = 0u;
  v17 = 0u;
  -[PSPasscodeField frame](self->_passcodeField, "frame");
  *(_QWORD *)&v16 = v5;
  *((_QWORD *)&v16 + 1) = v6;
  *(_QWORD *)&v17 = v7;
  *((_QWORD *)&v17 + 1) = v8;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__PSBulletedPINView_hidePasscodeField___block_invoke;
  v12[3] = &unk_1E4A67A20;
  objc_copyWeak(&v13, &location);
  v12[4] = v15;
  v9 = MEMORY[0x1A8594D10](v12);
  v10 = (void *)v9;
  if (v3)
  {
    v11 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(MEMORY[0x1E0CEAB98], "defaultDurationForTransition:", 7);
    objc_msgSend(v11, "animateWithDuration:animations:", v10);
  }
  else
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(v15, 8);
}

void __39__PSBulletedPINView_hidePasscodeField___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 48);
  objc_msgSend(WeakRetained[61], "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));

}

- (id)stringValue
{
  return -[PSPasscodeField stringValue](self->_passcodeField, "stringValue");
}

- (void)setStringValue:(id)a3
{
  -[PSPasscodeField setStringValue:](self->_passcodeField, "setStringValue:", a3);
  -[PSBulletedPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");
}

- (void)deleteLastCharacter
{
  -[PSPasscodeField deleteBackward](self->_passcodeField, "deleteBackward");
  -[PSBulletedPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");
}

- (void)appendString:(id)a3
{
  -[PSPasscodeField insertText:](self->_passcodeField, "insertText:", a3);
  -[PSBulletedPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");
}

- (BOOL)isFirstResponder
{
  return -[PSPasscodeField isFirstResponder](self->_passcodeField, "isFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[PSPasscodeField canBecomeFirstResponder](self->_passcodeField, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[PSPasscodeField becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSBulletedPINView;
  -[PSBulletedPINView resignFirstResponder](&v4, sel_resignFirstResponder);
  return -[PSPasscodeField resignFirstResponder](self->_passcodeField, "resignFirstResponder");
}

- (void)setBlocked:(BOOL)a3
{
  -[PSPasscodeField setShouldBecomeFirstResponderOnTap:](self->_passcodeField, "setShouldBecomeFirstResponderOnTap:", !a3);
}

- (void)notifyDelegatePINChanged
{
  void *v3;
  id v4;

  -[PINView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PSBulletedPINView stringValue](self, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pinView:pinValueChanged:", self, v3);

  }
}

- (void)notifyDelegatePINEntered
{
  void *v3;
  id v4;

  -[PINView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PSBulletedPINView stringValue](self, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pinView:pinEntered:", self, v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end
