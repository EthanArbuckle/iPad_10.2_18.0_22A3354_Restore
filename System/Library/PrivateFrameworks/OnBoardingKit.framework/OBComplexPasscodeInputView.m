@implementation OBComplexPasscodeInputView

- (OBComplexPasscodeInputView)initWithFrame:(CGRect)a3 numericOnly:(BOOL)a4
{
  _BOOL4 v4;
  OBComplexPasscodeInputView *v5;
  UITextField *v6;
  UITextField *passcodeField;
  UITextField *v8;
  void *v9;
  void *v10;
  void *v11;
  OBComplexPasscodeInputView *v12;
  void *v13;
  UITextField *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  OBComplexPasscodeInputView *v36;
  objc_super v37;
  _QWORD v38[7];

  v4 = a4;
  v38[5] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)OBComplexPasscodeInputView;
  v5 = -[OBComplexPasscodeInputView initWithFrame:](&v37, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (UITextField *)objc_alloc_init(MEMORY[0x1E0DC3DB8]);
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = v6;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v5->_passcodeField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField setDelegate:](v5->_passcodeField, "setDelegate:", v5);
    -[UITextField setSecureTextEntry:](v5->_passcodeField, "setSecureTextEntry:", 1);
    -[UITextField setReturnKeyType:](v5->_passcodeField, "setReturnKeyType:", 4);
    if (v4)
      -[UITextField setKeyboardType:](v5->_passcodeField, "setKeyboardType:", 4);
    -[UITextField textInputTraits](v5->_passcodeField, "textInputTraits");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDevicePasscodeEntry:", 1);
    -[UITextField setTextAlignment:](v5->_passcodeField, "setTextAlignment:", 1);
    v8 = v5->_passcodeField;
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v8, "setFont:", v9);

    -[UITextField layer](v5->_passcodeField, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBorderWidth:", 1.0);

    -[OBComplexPasscodeInputView traitCollection](v5, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __56__OBComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke;
    v35[3] = &unk_1E37AA900;
    v12 = v5;
    v36 = v12;
    objc_msgSend(v11, "performAsCurrentTraitCollection:", v35);

    -[UITextField layer](v5->_passcodeField, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCornerRadius:", 10.0);

    v14 = v5->_passcodeField;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setTextColor:](v14, "setTextColor:", v15);

    -[OBComplexPasscodeInputView addSubview:](v12, "addSubview:", v5->_passcodeField);
    v28 = (void *)MEMORY[0x1E0CB3718];
    -[UITextField heightAnchor](v5->_passcodeField, "heightAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField intrinsicContentSize](v5->_passcodeField, "intrinsicContentSize");
    objc_msgSend(v33, "constraintEqualToConstant:", v16 + v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v32;
    -[UITextField leadingAnchor](v5->_passcodeField, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBComplexPasscodeInputView leadingAnchor](v12, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v29;
    -[UITextField trailingAnchor](v5->_passcodeField, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBComplexPasscodeInputView trailingAnchor](v12, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v38[2] = v18;
    -[UITextField topAnchor](v5->_passcodeField, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBComplexPasscodeInputView topAnchor](v12, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[3] = v21;
    -[UITextField bottomAnchor](v5->_passcodeField, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBComplexPasscodeInputView bottomAnchor](v12, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38[4] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v25);

  }
  return v5;
}

void __56__OBComplexPasscodeInputView_initWithFrame_numericOnly___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBorderColor:", objc_msgSend(v1, "CGColor"));

}

- (id)passcodeDisplayView
{
  return self->_passcodeField;
}

- (void)setPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[OBComplexPasscodeInputView passcodeField](self, "passcodeField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (id)passcode
{
  void *v2;
  void *v3;

  -[OBComplexPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)OBComplexPasscodeInputView;
  -[OBComplexPasscodeInputView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, a3);
  -[OBComplexPasscodeInputView passcodeField](self, "passcodeField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
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
  -[OBPasscodeInputView delegate](self, "delegate");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[OBPasscodeInputView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v9, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", location, length, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBPasscodeInputView delegate](self, "delegate");
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

  -[OBPasscodeInputView delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[OBPasscodeInputView delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[OBPasscodeInputView delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBComplexPasscodeInputView passcode](self, "passcode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "passcodeInput:enteredPasscode:", self, v9);

    }
  }
  return 1;
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
