@implementation PasscodeFieldCell

- (PasscodeFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PasscodeFieldCell *v9;
  PasscodeFieldCell *v10;
  void *v11;
  uint64_t v12;
  PSPasscodeField *v13;
  PSPasscodeField *passcodeField;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PasscodeFieldCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v18, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[PasscodeFieldCell setSelectionStyle:](v9, "setSelectionStyle:", 0);
    objc_msgSend(v8, "propertyForKey:", CFSTR("numberOfPasscodeFields"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

    v13 = -[PSPasscodeField initWithNumberOfEntryFields:]([PSPasscodeField alloc], "initWithNumberOfEntryFields:", v12);
    passcodeField = v10->_passcodeField;
    v10->_passcodeField = v13;

    -[PSPasscodeField setDelegate:](v10->_passcodeField, "setDelegate:", v10);
    -[PasscodeFieldCell contentView](v10, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", v10->_passcodeField);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v10, sel_cellTapped_);
    -[PasscodeFieldCell addGestureRecognizer:](v10, "addGestureRecognizer:", v16);

  }
  return v10;
}

- (void)_setSecureTextEntry:(BOOL)a3
{
  -[PSPasscodeField setSecurePasscodeEntry:](self->_passcodeField, "setSecurePasscodeEntry:", a3);
}

- (void)passcodeField:(id)a3 enteredPasscode:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PasscodeFieldCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "passcodeField:didUpdateEnteredPasscode:", self, v5);

}

- (void)setPasscodeText:(id)a3
{
  -[PSPasscodeField setStringValue:](self->_passcodeField, "setStringValue:", a3);
}

- (BOOL)becomeFirstResponder
{
  return !-[PasscodeFieldCell denyFirstResponder](self, "denyFirstResponder")
      && -[PSPasscodeField becomeFirstResponder](self->_passcodeField, "becomeFirstResponder");
}

- (id)passcodeText
{
  return -[PSPasscodeField stringValue](self->_passcodeField, "stringValue");
}

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  -[PSPasscodeField stringValue](self->_passcodeField, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)passcodeField:(id)a3 shouldInsertText:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  if (-[PasscodeFieldCell convertsNumeralsToASCII](self, "convertsNumeralsToASCII"))
  {
    if (!passcodeField_shouldInsertText__asciiMaker)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v7 = (void *)passcodeField_shouldInsertText__asciiMaker;
      passcodeField_shouldInsertText__asciiMaker = (uint64_t)v6;

    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", objc_msgSend(v5, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v5, "substringWithRange:", v9, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)passcodeField_shouldInsertText__asciiMaker, "numberFromString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "stringValue");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appendString:", v13);

        }
        else
        {
          objc_msgSend(v8, "appendString:", v10);
        }

        ++v9;
      }
      while (v9 < objc_msgSend(v5, "length"));
    }

  }
  else
  {
    v8 = v5;
  }
  return v8;
}

- (void)deleteBackward
{
  -[PSPasscodeField deleteBackward](self->_passcodeField, "deleteBackward");
}

- (int64_t)keyboardType
{
  return 127;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  float v8;
  objc_super v9;

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PasscodeFieldCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  -[PasscodeFieldCell setBackgroundView:](self, "setBackgroundView:", 0);
  v9.receiver = self;
  v9.super_class = (Class)PasscodeFieldCell;
  -[PSTableCell layoutSubviews](&v9, sel_layoutSubviews);
  -[PasscodeFieldCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[PSPasscodeField frame](self->_passcodeField, "frame");
  v8 = (v6 - v7) * 0.5;
  -[PSPasscodeField setFrame:](self->_passcodeField, "setFrame:", floorf(v8));
}

- (KeychainSyncPasscodeFieldDelegate)delegate
{
  return (KeychainSyncPasscodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)convertsNumeralsToASCII
{
  return self->_convertsNumeralsToASCII;
}

- (void)setConvertsNumeralsToASCII:(BOOL)a3
{
  self->_convertsNumeralsToASCII = a3;
}

- (BOOL)denyFirstResponder
{
  return self->_denyFirstResponder;
}

- (void)setDenyFirstResponder:(BOOL)a3
{
  self->_denyFirstResponder = a3;
}

- (PSPasscodeField)passcodeField
{
  return self->_passcodeField;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcodeField, 0);
}

@end
