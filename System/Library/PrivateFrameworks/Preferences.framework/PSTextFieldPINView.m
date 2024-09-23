@implementation PSTextFieldPINView

- (PSTextFieldPINView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PSTextFieldPINView *v7;
  AlphanumericPINTableViewCell *v8;
  AlphanumericPINTableViewCell *cell;
  uint64_t v10;
  UITextField *passcodeField;
  void *v12;
  uint64_t v13;
  UITableView *table;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  UILabel *titleLabel;
  UILabel *v20;
  void *v21;
  UILabel *v22;
  void *v23;
  void *v24;
  uint8_t v26[16];
  objc_super v27;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v27.receiver = self;
  v27.super_class = (Class)PSTextFieldPINView;
  v7 = -[PSTextFieldPINView initWithFrame:](&v27, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[AlphanumericPINTableViewCell initWithStyle:reuseIdentifier:]([AlphanumericPINTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1000, 0);
    cell = v7->_cell;
    v7->_cell = v8;

    -[AlphanumericPINTableViewCell setOpaque:](v7->_cell, "setOpaque:", 0);
    -[AlphanumericPINTableViewCell setTextFieldOffset:](v7->_cell, "setTextFieldOffset:", 9.0);
    -[AlphanumericPINTableViewCell pinTextField](v7->_cell, "pinTextField");
    v10 = objc_claimAutoreleasedReturnValue();
    passcodeField = v7->_passcodeField;
    v7->_passcodeField = (UITextField *)v10;

    -[UITextField setDelegate:](v7->_passcodeField, "setDelegate:", v7);
    -[UITextField textInputTraits](v7->_passcodeField, "textInputTraits");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDevicePasscodeEntry:", 1);
    -[UITextField setDevicePasscodeEntry:](v7->_passcodeField, "setDevicePasscodeEntry:", 1);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "set devicePasscodeEntry (PSTextFieldPINView)", v26, 2u);
    }
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA58]), "initWithFrame:style:", 1, x, y, width, height);
    table = v7->_table;
    v7->_table = (UITableView *)v13;

    -[UITableView setDataSource:](v7->_table, "setDataSource:", v7);
    -[UITableView setScrollEnabled:](v7->_table, "setScrollEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7->_table, "setBackgroundColor:", v15);

    -[UITableView _setTopPadding:](v7->_table, "_setTopPadding:", 0.0);
    -[UITableView _setBottomPadding:](v7->_table, "_setBottomPadding:", 0.0);
    -[PSTextFieldPINView addSubview:](v7, "addSubview:", v7->_table);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v7, sel_okButtonPressed_, *MEMORY[0x1E0CEB938], 0);

    v17 = objc_alloc(MEMORY[0x1E0CEA700]);
    v18 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    titleLabel = v7->super._titleLabel;
    v7->super._titleLabel = (UILabel *)v18;

    v20 = v7->super._titleLabel;
    objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v20, "setFont:", v21);

    -[UILabel setOpaque:](v7->super._titleLabel, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v7->super._titleLabel, "setBackgroundColor:", 0);
    -[UILabel setTextAlignment:](v7->super._titleLabel, "setTextAlignment:", 1);
    v22 = v7->super._titleLabel;
    +[PSListController appearance](PSListController, "appearance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v22, "setTextColor:", v24);

    -[UILabel setNumberOfLines:](v7->super._titleLabel, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v7->super._titleLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[PSTextFieldPINView addSubview:](v7, "addSubview:", v7->super._titleLabel);

  }
  return v7;
}

- (void)setUsesNumericKeyboard:(BOOL)a3
{
  UITextField *passcodeField;
  uint64_t v4;

  self->_usesNumericKeyboard = a3;
  passcodeField = self->_passcodeField;
  if (a3)
    v4 = 127;
  else
    v4 = 0;
  -[UITextField setKeyboardType:](passcodeField, "setKeyboardType:", v4);
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MidY;
  double v12;
  double v13;
  double v14;
  double v15;
  UILabel *pinPolicyLabel;
  FailureBarView *failureView;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  -[PSTextFieldPINView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UITableView setFrame:](self->_table, "setFrame:");
  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  MidY = CGRectGetMidY(v20);
  -[AlphanumericPINTableViewCell frame](self->_cell, "frame");
  -[UITableView setContentInset:](self->_table, "setContentInset:", MidY - v12 * 0.5, 0.0, 0.0, 0.0);
  -[AlphanumericPINTableViewCell frame](self->_cell, "frame");
  v14 = v13;
  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  v15 = floor(CGRectGetMidY(v21) - v14 * 0.5);
  -[PINView layoutTopLabel:withMaxY:](self, "layoutTopLabel:withMaxY:", self->super._titleLabel, v15 + -22.0);
  -[PINView layoutTopLabel:withMaxY:](self, "layoutTopLabel:withMaxY:", self->super._errorTitleLabel, v15 + -22.0);
  v19.receiver = self;
  v19.super_class = (Class)PSTextFieldPINView;
  -[PINView layoutSubviews](&v19, sel_layoutSubviews);
  pinPolicyLabel = self->super._pinPolicyLabel;
  if (pinPolicyLabel)
    -[PINView layoutBottomSubview:withLabel:withMinY:](self, "layoutBottomSubview:withLabel:withMinY:", pinPolicyLabel, self->super._pinPolicyLabel, v14 + v15 + 10.0);
  failureView = self->super._failureView;
  if (failureView)
  {
    -[FailureBarView titleLabel](self->super._failureView, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PINView layoutBottomSubview:withLabel:withMinY:](self, "layoutBottomSubview:withLabel:withMinY:", failureView, v18, v14 + v15 + 22.0);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return self->_cell;
}

- (void)setBlocked:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  UIKeyboardDisableAutomaticAppearance();
  -[AlphanumericPINTableViewCell setUserInteractionEnabled:](self->_cell, "setUserInteractionEnabled:", !v3);
  UIKeyboardEnableAutomaticAppearance();
}

- (void)notifyDelegatePINChanged
{
  void *v3;
  id v4;

  -[PINView delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PSTextFieldPINView stringValue](self, "stringValue");
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
    -[PSTextFieldPINView stringValue](self, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pinView:pinEntered:", self, v3);

  }
}

- (BOOL)keyboardInputChanged:(id)a3
{
  void *v4;
  uint64_t v5;

  -[UITextField text](self->_passcodeField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    -[PINView hideError](self, "hideError");
  -[PSTextFieldPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");
  return 1;
}

- (void)setTextFieldKeyboardType:(int64_t)a3
{
  -[UITextField setKeyboardType:](self->_passcodeField, "setKeyboardType:", a3);
}

- (void)setTextFieldKeyboardAppearance:(int64_t)a3
{
  -[UITextField setKeyboardAppearance:](self->_passcodeField, "setKeyboardAppearance:", a3);
}

- (void)showError:(id)a3 animate:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSTextFieldPINView;
  -[PINView showError:animate:](&v4, sel_showError_animate_, a3, a4);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UITableView setDataSource:](self->_table, "setDataSource:", 0);
  v4.receiver = self;
  v4.super_class = (Class)PSTextFieldPINView;
  -[PSTextFieldPINView dealloc](&v4, sel_dealloc);
}

- (id)stringValue
{
  return -[UITextField text](self->_passcodeField, "text");
}

- (void)okButtonPressed:(id)a3
{
  void *v4;
  uint64_t v5;

  -[UITextField text](self->_passcodeField, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    -[PSTextFieldPINView notifyDelegatePINEntered](self, "notifyDelegatePINEntered");
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
  -[AlphanumericPINTableViewCell frame](self->_cell, "frame");
  *(_QWORD *)&v16 = v5;
  *((_QWORD *)&v16 + 1) = v6;
  *(_QWORD *)&v17 = v7;
  *((_QWORD *)&v17 + 1) = v8;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__PSTextFieldPINView_hidePasscodeField___block_invoke;
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

void __40__PSTextFieldPINView_hidePasscodeField___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = -*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 48);
  objc_msgSend(WeakRetained[62], "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));

}

- (BOOL)isFirstResponder
{
  return -[UITextField isFirstResponder](self->_passcodeField, "isFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return -[UITextField canBecomeFirstResponder](self->_passcodeField, "canBecomeFirstResponder");
}

- (BOOL)becomeFirstResponder
{
  return -[UITextField becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSTextFieldPINView;
  if (!-[PSTextFieldPINView isFirstResponder](&v5, sel_isFirstResponder))
    return -[UITextField resignFirstResponder](self->_passcodeField, "resignFirstResponder");
  v4.receiver = self;
  v4.super_class = (Class)PSTextFieldPINView;
  return -[PSTextFieldPINView resignFirstResponder](&v4, sel_resignFirstResponder);
}

- (void)setStringValue:(id)a3
{
  -[UITextField setText:](self->_passcodeField, "setText:", a3);
  -[PSTextFieldPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");
}

- (void)appendString:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UITextField text](self->_passcodeField, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v4);
    objc_msgSend(v5, "appendString:", v6);
    -[UITextField setText:](self->_passcodeField, "setText:", v5);

  }
  else
  {
    -[UITextField setText:](self->_passcodeField, "setText:", v6);
  }
  -[PSTextFieldPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");

}

- (void)deleteLastCharacter
{
  uint64_t v3;
  UITextField *passcodeField;
  void *v5;
  id v6;

  -[UITextField text](self->_passcodeField, "text");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "length");
  if (v3)
  {
    passcodeField = self->_passcodeField;
    objc_msgSend(v6, "substringToIndex:", v3 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setText:](passcodeField, "setText:", v5);

  }
  -[PSTextFieldPINView notifyDelegatePINChanged](self, "notifyDelegatePINChanged");

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)usesNumericKeyboard
{
  return self->_usesNumericKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end
