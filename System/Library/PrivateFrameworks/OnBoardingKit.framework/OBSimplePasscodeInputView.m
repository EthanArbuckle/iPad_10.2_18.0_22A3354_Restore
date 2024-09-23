@implementation OBSimplePasscodeInputView

- (OBSimplePasscodeInputView)initWithFrame:(CGRect)a3 numberOfEntryFields:(unint64_t)a4
{
  OBSimplePasscodeInputView *v5;
  OBPasscodeField *v6;
  OBPasscodeField *passcodeField;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)OBSimplePasscodeInputView;
  v5 = -[OBSimplePasscodeInputView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = -[OBPasscodeField initWithNumberOfEntryFields:]([OBPasscodeField alloc], "initWithNumberOfEntryFields:", a4);
    passcodeField = v5->_passcodeField;
    v5->_passcodeField = v6;

    -[OBPasscodeField setTranslatesAutoresizingMaskIntoConstraints:](v5->_passcodeField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[OBPasscodeField setDelegate:](v5->_passcodeField, "setDelegate:", v5);
    -[OBSimplePasscodeInputView addSubview:](v5, "addSubview:", v5->_passcodeField);
    v18 = (void *)MEMORY[0x1E0CB3718];
    -[OBPasscodeField leadingAnchor](v5->_passcodeField, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSimplePasscodeInputView leadingAnchor](v5, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    -[OBPasscodeField trailingAnchor](v5->_passcodeField, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSimplePasscodeInputView trailingAnchor](v5, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v9;
    -[OBPasscodeField topAnchor](v5->_passcodeField, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSimplePasscodeInputView topAnchor](v5, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v12;
    -[OBPasscodeField bottomAnchor](v5->_passcodeField, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBSimplePasscodeInputView bottomAnchor](v5, "bottomAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

  }
  return v5;
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
  -[OBSimplePasscodeInputView passcodeField](self, "passcodeField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStringValue:", v4);

}

- (id)passcode
{
  void *v2;
  void *v3;

  -[OBSimplePasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a4;
  -[OBPasscodeInputView delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[OBPasscodeInputView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[OBPasscodeInputView delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "passcodeInput:enteredPasscode:", self, v10);

    }
  }

}

- (BOOL)limitCharactersToNumbers
{
  return self->_limitCharactersToNumbers;
}

- (void)setLimitCharactersToNumbers:(BOOL)a3
{
  self->_limitCharactersToNumbers = a3;
}

- (OBPasscodeField)passcodeField
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
