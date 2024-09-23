@implementation TVRAlertView

- (TVRAlertView)initWithFrame:(CGRect)a3
{
  TVRAlertView *v3;
  TVRAlertView *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UIView *v10;
  UIView *blendModeView;
  UIView *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *titleLabel;
  UILabel *v18;
  void *v19;
  UILabel *v20;
  void *v21;
  TVRPasscodeField *v22;
  TVRPasscodeField *passcodeField;
  uint64_t v24;
  _TVRMAlertButton *cancelButton;
  _TVRMAlertButton *v26;
  void *v27;
  void *v28;
  _TVRMAlertButton *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  UIView *v44;
  UIView *hairlineView;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  objc_super v57;

  v57.receiver = self;
  v57.super_class = (Class)TVRAlertView;
  v3 = -[TVRAlertView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVRAlertView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

    -[TVRAlertView layer](v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[TVRAlertView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDE58E8];
    objc_msgSend(v7, "setCornerCurve:", *MEMORY[0x24BDE58E8]);

    -[TVRAlertView layer](v4, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", 13.0);

    -[TVRAlertView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    blendModeView = v4->_blendModeView;
    v4->_blendModeView = v10;

    v12 = v4->_blendModeView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.17254902, 0.17254902, 0.180392157, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[UIView layer](v4->_blendModeView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerCurve:", v8);

    -[UIView layer](v4->_blendModeView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCornerRadius:", 13.0);

    -[TVRAlertView addSubview:](v4, "addSubview:", v4->_blendModeView);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v16;

    v18 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v4->_titleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 4);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setPreferredMaxLayoutWidth:](v4->_titleLabel, "setPreferredMaxLayoutWidth:", 270.0);
    -[TVRAlertView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v22 = objc_alloc_init(TVRPasscodeField);
    passcodeField = v4->_passcodeField;
    v4->_passcodeField = v22;

    -[TVRPasscodeField setUseSystemColors:](v4->_passcodeField, "setUseSystemColors:", 0);
    -[TVRPasscodeField setAutoresizingMask:](v4->_passcodeField, "setAutoresizingMask:", 2);
    -[TVRPasscodeField addTarget:action:forControlEvents:](v4->_passcodeField, "addTarget:action:forControlEvents:", v4, sel__pinTextDidChange_, 0x20000);
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v4, sel__passcodeFieldTapped);
    -[TVRPasscodeField addGestureRecognizer:](v4->_passcodeField, "addGestureRecognizer:", v56);
    -[TVRAlertView addSubview:](v4, "addSubview:", v4->_passcodeField);
    +[_TVRMAlertButton buttonWithType:](_TVRMAlertButton, "buttonWithType:", 0);
    v24 = objc_claimAutoreleasedReturnValue();
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (_TVRMAlertButton *)v24;

    v26 = v4->_cancelButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingCancelString"), &stru_24DE30718, CFSTR("Localizable"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRMAlertButton setTitle:forState:](v26, "setTitle:forState:", v28, 0);

    v29 = v4->_cancelButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVRMAlertButton setTitleColor:forState:](v29, "setTitleColor:forState:", v30, 1);

    -[_TVRMAlertButton titleLabel](v4->_cancelButton, "titleLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFont:", v32);

    -[_TVRMAlertButton addTarget:action:forControlEvents:](v4->_cancelButton, "addTarget:action:forControlEvents:", v4, sel__cancelButton_, 0x2000);
    -[_TVRMAlertButton layer](v4->_cancelButton, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setAllowsGroupOpacity:", 0);

    -[_TVRMAlertButton layer](v4->_cancelButton, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAllowsGroupBlending:", 0);

    -[TVRAlertView addSubview:](v4, "addSubview:", v4->_cancelButton);
    v35 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.109803922, 0.109803922, 0.117647059, 1.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBackgroundColor:", v36);

    objc_msgSend(v35, "layer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x24BDE59D8];
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE59D8]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCompositingFilter:", v39);

    -[_TVRMAlertButton setBurnView:](v4->_cancelButton, "setBurnView:", v35);
    v40 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.04);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setBackgroundColor:", v41);

    objc_msgSend(v40, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v38);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCompositingFilter:", v43);

    -[_TVRMAlertButton setPlusDView:](v4->_cancelButton, "setPlusDView:", v40);
    v44 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    hairlineView = v4->_hairlineView;
    v4->_hairlineView = v44;

    -[UIView layer](v4->_hairlineView, "layer");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setAllowsGroupBlending:", 0);

    -[TVRAlertView addSubview:](v4, "addSubview:", v4->_hairlineView);
    v47 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.250980392, 1.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBackgroundColor:", v48);

    objc_msgSend(v47, "setAutoresizingMask:", 18);
    objc_msgSend(v47, "layer");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", v38);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setCompositingFilter:", v50);

    -[UIView addSubview:](v4->_hairlineView, "addSubview:", v47);
    v51 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.0, 0.0, 0.31372549, 0.05);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setBackgroundColor:", v52);

    objc_msgSend(v51, "setAutoresizingMask:", 18);
    objc_msgSend(v51, "layer");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5BD0]);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setCompositingFilter:", v54);

    -[UIView addSubview:](v4->_hairlineView, "addSubview:", v51);
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  width = a3.width;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3.width, 1.79769313e308);
  v6 = v5;
  -[_TVRMAlertButton sizeThatFits:](self->_cancelButton, "sizeThatFits:", width, 1.79769313e308);
  v8 = ceil(v6) + 20.0 + 19.0 + 60.0;
  if (v7 < 44.0)
    v7 = 44.0;
  v9 = v8 + v7;
  v10 = width;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  _TVRMAlertButton *cancelButton;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;

  -[TVRAlertView bounds](self, "bounds");
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  v7 = CGRectGetWidth(v18);
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, 0.0);
  v9 = ceil(v8);
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 0.0, 20.0, v7, v9);
  v10 = v9 + 20.0 + 19.0;
  -[TVRPasscodeField setFrame:](self->_passcodeField, "setFrame:", 0.0, v10, v7, 60.0);
  v11 = v10 + 60.0;
  -[TVRAlertView _screen](self, "_screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scale");
  v14 = v13;

  -[UIView setFrame:](self->_hairlineView, "setFrame:", 0.0, v11 - 1.0 / v14, v7);
  cancelButton = self->_cancelButton;
  -[TVRAlertView bounds](self, "bounds");
  -[_TVRMAlertButton sizeThatFits:](cancelButton, "sizeThatFits:", CGRectGetWidth(v19), 1.79769313e308);
  if (v16 >= 44.0)
    v17 = v16;
  else
    v17 = 44.0;
  -[_TVRMAlertButton setFrame:](self->_cancelButton, "setFrame:", 0.0, v11, v7, v17);
  -[UIView setFrame:](self->_blendModeView, "setFrame:", x, y, width, height);
  -[UIVisualEffectView setFrame:](self->_effectView, "setFrame:", x, y, width, height);
}

- (BOOL)becomeFirstResponder
{
  return -[TVRPasscodeField becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
}

- (BOOL)resignFirstResponder
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRAlertView;
  -[TVRAlertView resignFirstResponder](&v4, sel_resignFirstResponder);
  return -[TVRPasscodeField resignFirstResponder](self->_passcodeField, "resignFirstResponder");
}

- (NSString)text
{
  return -[TVRPasscodeField text](self->_passcodeField, "text");
}

- (void)setText:(id)a3
{
  -[TVRPasscodeField setText:](self->_passcodeField, "setText:", a3);
}

- (TVRCPINEntryAttributes)PINEntryAttributes
{
  return -[TVRPasscodeField PINEntryattributes](self->_passcodeField, "PINEntryattributes");
}

- (void)setPINEntryAttributes:(id)a3
{
  -[TVRPasscodeField setPINEntryattributes:](self->_passcodeField, "setPINEntryattributes:", a3);
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)setTitle:(id)a3
{
  -[UILabel setText:](self->_titleLabel, "setText:", a3);
}

- (void)_cancelButton:(id)a3
{
  TVRAlertViewDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "alertViewDidCancel:", self);

  }
}

- (void)_passcodeFieldTapped
{
  if ((-[TVRPasscodeField isFirstResponder](self->_passcodeField, "isFirstResponder") & 1) == 0)
    -[TVRPasscodeField becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
}

- (void)_pinTextDidChange:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertView:didUpdateText:", self, v7);

  }
}

- (TVRAlertViewDelegate)delegate
{
  return (TVRAlertViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)blendModeView
{
  return self->_blendModeView;
}

- (void)setBlendModeView:(id)a3
{
  objc_storeStrong((id *)&self->_blendModeView, a3);
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (void)setHairlineView:(id)a3
{
  objc_storeStrong((id *)&self->_hairlineView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (TVRPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeField, a3);
}

- (_TVRMAlertButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_passcodeField, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_blendModeView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
