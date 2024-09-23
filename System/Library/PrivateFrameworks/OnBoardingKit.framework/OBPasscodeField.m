@implementation OBPasscodeField

- (OBPasscodeField)initWithNumberOfEntryFields:(unint64_t)a3
{
  OBPasscodeField *v4;
  NSMutableString *v5;
  NSMutableString *value;
  NSArray *i;
  OBPasscodeFieldDot *v8;
  NSArray *dotViews;
  NSArray *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)OBPasscodeField;
  v4 = -[OBPasscodeField initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    value = v4->_value;
    v4->_value = v5;

    v4->_numberOfEntryFields = a3;
    v4->_enabled = 1;
    for (i = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]); a3; --a3)
    {
      v8 = objc_alloc_init(OBPasscodeFieldDot);
      -[OBPasscodeFieldDot setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[NSArray addObject:](i, "addObject:", v8);
      -[OBPasscodeField addArrangedSubview:](v4, "addArrangedSubview:", v8);

    }
    dotViews = v4->_dotViews;
    v4->_dotViews = i;
    v10 = i;

    -[OBPasscodeField setSpacing:](v4, "setSpacing:", 28.0);
    -[OBPasscodeField setSemanticContentAttribute:](v4, "setSemanticContentAttribute:", 3);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__passcodeFieldTapped_);

    -[OBPasscodeField addGestureRecognizer:](v4, "addGestureRecognizer:", v11);
  }
  return v4;
}

- (NSString)stringValue
{
  void *v2;
  void *v3;

  -[OBPasscodeField value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)setStringValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[OBPasscodeField value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v4);

  -[OBPasscodeField _updateDots](self, "_updateDots");
  -[OBPasscodeField value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = -[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields");

  if (v7 == v8)
  {
    -[OBPasscodeField delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[OBPasscodeField value](self, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v11, "passcodeField:enteredPasscode:", self, v10);

  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PASSCODE"), &stru_1E37AB0D0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PASSCODE_VALUES"), &stru_1E37AB0D0, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBPasscodeField value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, objc_msgSend(v6, "length"), -[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_updateDots
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields"))
  {
    v3 = 0;
    do
    {
      -[OBPasscodeField dotViews](self, "dotViews");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[OBPasscodeField stringValue](self, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFilled:", v3 < objc_msgSend(v6, "length"));

      ++v3;
    }
    while (v3 < -[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields"));
  }
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBPasscodeField;
  v2 = -[OBPasscodeField becomeFirstResponder](&v5, sel_becomeFirstResponder);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3938], "activeKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setReturnKeyEnabled:", 0);

  }
  return v2;
}

- (int64_t)keyboardType
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
    return 11;
  else
    return 127;
}

- (BOOL)hasText
{
  void *v2;
  BOOL v3;

  -[OBPasscodeField stringValue](self, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)insertText:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[OBPasscodeField isEnabled](self, "isEnabled"))
  {
    -[OBPasscodeField stringValue](self, "stringValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    v6 = -[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields");

    if (v5 != v6 && (objc_msgSend(v14, "isEqualToString:", CFSTR("\n")) & 1) == 0)
    {
      if (objc_msgSend(v14, "length"))
      {
        -[OBPasscodeField value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v14);

        -[OBPasscodeField _updateDots](self, "_updateDots");
        -[OBPasscodeField stringValue](self, "stringValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "length");
        v10 = -[OBPasscodeField numberOfEntryFields](self, "numberOfEntryFields");

        if (v9 == v10)
        {
          -[OBPasscodeField delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[OBPasscodeField value](self, "value");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v11, "passcodeField:enteredPasscode:", self, v13);

        }
      }
    }
  }

}

- (void)deleteBackward
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[OBPasscodeField stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[OBPasscodeField value](self, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBPasscodeField stringValue](self, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);

    -[OBPasscodeField _updateDots](self, "_updateDots");
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OBPasscodeFieldDelegate)delegate
{
  return (OBPasscodeFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)numberOfEntryFields
{
  return self->_numberOfEntryFields;
}

- (void)setNumberOfEntryFields:(unint64_t)a3
{
  self->_numberOfEntryFields = a3;
}

- (NSMutableString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (void)setDotViews:(id)a3
{
  objc_storeStrong((id *)&self->_dotViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dotViews, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
