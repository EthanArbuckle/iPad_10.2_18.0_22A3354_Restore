@implementation BFFComplexPasscodeInputView

- (BFFComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4
{
  _BOOL4 v4;
  BFFComplexPasscodeInputView *v5;
  UITextField *v6;
  UITextField *passcodeField;
  void *v8;
  UITextField *v9;
  void *v10;
  void *v11;
  void *v12;
  BFFComplexPasscodeInputView *v13;
  void *v14;
  UITextField *v15;
  void *v16;
  _QWORD v18[4];
  BFFComplexPasscodeInputView *v19;
  objc_super v20;

  v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)BFFComplexPasscodeInputView;
  v5 = -[BFFPasscodeInputView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = v6;

    -[UITextField setDelegate:](v5->_passcodeField, "setDelegate:", v5);
    -[UITextField setSecureTextEntry:](v5->_passcodeField, "setSecureTextEntry:", 1);
    -[UITextField setReturnKeyType:](v5->_passcodeField, "setReturnKeyType:", 4);
    if (v4)
      -[UITextField setKeyboardType:](v5->_passcodeField, "setKeyboardType:", 4);
    -[UITextField textInputTraits](v5->_passcodeField, "textInputTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDevicePasscodeEntry:", 1);
    -[UITextField setTextAlignment:](v5->_passcodeField, "setTextAlignment:", 1);
    v9 = v5->_passcodeField;
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v9, "setFont:", v10);

    -[UITextField layer](v5->_passcodeField, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 1.0);

    -[BFFComplexPasscodeInputView traitCollection](v5, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __57__BFFComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke;
    v18[3] = &unk_24D2341B8;
    v13 = v5;
    v19 = v13;
    objc_msgSend(v12, "performAsCurrentTraitCollection:", v18);

    -[UITextField layer](v5->_passcodeField, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCornerRadius:", 10.0);

    -[UITextField sizeToFit](v5->_passcodeField, "sizeToFit");
    v15 = v5->_passcodeField;
    objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v15, "setTextColor:", v16);

    -[BFFComplexPasscodeInputView addSubview:](v13, "addSubview:", v5->_passcodeField);
  }
  return v5;
}

void __57__BFFComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BFFComplexPasscodeInputView;
  -[BFFPasscodeInputView layoutSubviews](&v3, sel_layoutSubviews);
  -[BFFComplexPasscodeInputView _layout](self, "_layout");
}

- (void)setPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BFFComplexPasscodeInputView passcodeField](self, "passcodeField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)passcode
{
  void *v2;
  void *v3;

  -[BFFComplexPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  -[UITextField setEnabled:](self->_passcodeField, "setEnabled:", a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BFFComplexPasscodeInputView;
  -[BFFComplexPasscodeInputView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[BFFComplexPasscodeInputView passcodeField](self, "passcodeField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "_labelColor");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[BFFPasscodeInputView delegate](self, "delegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[BFFPasscodeInputView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v9, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[BFFPasscodeInputView delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "passcodeInput:willChangeContents:", self, v16);

    }
  }

  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[BFFPasscodeInputView delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[BFFPasscodeInputView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[BFFPasscodeInputView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[BFFComplexPasscodeInputView passcode](self, "passcode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "passcodeInput:enteredPasscode:", self, v9);

    }
  }
  return 1;
}

- (void)_layout
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double MaxY;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  id v44;
  CGRect v45;
  CGRect v46;

  -[BFFComplexPasscodeInputView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[BFFComplexPasscodeInputView passcodeField](self, "passcodeField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeThatFits:", v4, v6);

  UIRectCenteredIntegralRect();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[BFFComplexPasscodeInputView convertRect:fromView:](self, "convertRect:fromView:", v27, v20, v22, v24, v26);
    MaxY = CGRectGetMaxY(v45);
    -[BFFPasscodeInputView instructionsLinkButton](self, "instructionsLinkButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "titleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_baselineOffsetFromBottom");
    v32 = MaxY - v31 + 36.0 + -11.0;

    if (v11 < v32)
      v11 = v32;
  }
  else
  {
    -[BFFPasscodeInputView instructions](self, "instructions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v41 = v40;

    v46.origin.x = v35;
    v46.origin.y = v37;
    v46.size.width = v39;
    v46.size.height = v41;
    v42 = CGRectGetMaxY(v46) + 10.0;
    if (v11 < v42)
      v11 = v42;
    -[BFFPasscodeInputView instructions](self, "instructions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setFrame:", v35, v37, v39, v41);

  }
  -[BFFComplexPasscodeInputView passcodeField](self, "passcodeField");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setFrame:", v9, v11, v13, v15);

}

- (UITextField)passcodeField
{
  return self->_passcodeField;
}

- (void)setPasscodeField:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end
