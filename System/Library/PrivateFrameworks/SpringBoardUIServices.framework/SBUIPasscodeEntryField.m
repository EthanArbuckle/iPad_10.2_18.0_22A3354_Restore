@implementation SBUIPasscodeEntryField

- (SBUIPasscodeEntryField)initWithDefaultSizeAndLightStyle:(BOOL)a3
{
  double v4;
  double v5;
  SBUIPasscodeEntryField *v6;
  SBUIPasscodeEntryField *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBUIPasscodeTextField *v12;
  SBUIPasscodeTextField *textField;
  SBUIPasscodeTextField *v14;
  void *v15;
  uint64_t v16;
  SBUIPasscodeTextField *v17;
  void *v18;
  SBUIPasscodeTextField *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SBUIPasscodeEntryField;
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = -[SBUIPasscodeEntryField initWithFrame:](&v24, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v5, *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    -[SBUIPasscodeEntryField _viewSize](v6, "_viewSize");
    v9 = v8;
    v11 = v10;
    -[SBUIPasscodeEntryField setFrame:](v7, "setFrame:", v4, v5, v8, v10);
    v12 = -[SBUIPasscodeTextField initWithFrame:]([SBUIPasscodeTextField alloc], "initWithFrame:", v4, v5, v9, v11);
    textField = v7->_textField;
    v7->_textField = v12;

    -[SBUIPasscodeTextField setBorderStyle:](v7->_textField, "setBorderStyle:", 3);
    v14 = v7->_textField;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 127;
    }
    -[SBUIPasscodeTextField setTextColor:](v14, "setTextColor:", v15);

    -[SBUIPasscodeTextField setSecureTextEntry:](v7->_textField, "setSecureTextEntry:", 1);
    -[SBUIPasscodeTextField setUndoEnabled:](v7->_textField, "setUndoEnabled:", 0);
    -[SBUIPasscodeTextField setHidden:](v7->_textField, "setHidden:", 0);
    -[SBUIPasscodeTextField setAlpha:](v7->_textField, "setAlpha:", 1.0);
    -[SBUIPasscodeTextField setDelegate:](v7->_textField, "setDelegate:", v7);
    -[SBUIPasscodeTextField setKeyboardAppearance:](v7->_textField, "setKeyboardAppearance:", v16);
    v17 = v7->_textField;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeTextField setInsertionPointColor:](v17, "setInsertionPointColor:", v18);

    v19 = v7->_textField;
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeTextField setBackgroundColor:](v19, "setBackgroundColor:", v20);

    -[SBUIPasscodeEntryField addSubview:](v7, "addSubview:", v7->_textField);
    -[SBUIPasscodeTextField textInputTraits](v7->_textField, "textInputTraits");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setInsertionPointColor:", v22);

    objc_msgSend(v21, "setKeyboardType:", 0);
    objc_msgSend(v21, "setKeyboardAppearance:", v16);
    objc_msgSend(v21, "setAutocorrectionType:", 1);
    objc_msgSend(v21, "setTextLoupeVisibility:", 1);
    objc_msgSend(v21, "setShortcutConversionType:", 1);
    objc_msgSend(v21, "setLearnsCorrections:", 0);
    objc_msgSend(v21, "setSecureTextEntry:", 1);
    objc_msgSend(v21, "setDevicePasscodeEntry:", 1);
    objc_msgSend(v21, "setDisableInputBars:", 1);
    -[SBUIPasscodeEntryField setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 1);

  }
  return v7;
}

- (UIFont)font
{
  return (UIFont *)-[SBUIPasscodeTextField font](self->_textField, "font");
}

- (void)setFont:(id)a3
{
  -[SBUIPasscodeTextField setFont:](self->_textField, "setFont:", a3);
  -[SBUIPasscodeEntryField setNeedsLayout](self, "setNeedsLayout");
}

- (void)appendString:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[SBUIPasscodeEntryField shouldInsertPasscodeText:](self, "shouldInsertPasscodeText:", v4);
    v4 = v6;
    if (v5)
    {
      -[SBUIPasscodeEntryField _appendString:](self, "_appendString:", v6);
      v4 = v6;
    }
  }

}

- (NSString)stringValue
{
  return (NSString *)-[SBUIPasscodeTextField text](self->_textField, "text");
}

- (void)setStringValue:(id)a3
{
  SBUIPasscodeTextField *textField;
  id v5;

  textField = self->_textField;
  v5 = a3;
  -[SBUIPasscodeTextField setText:](textField, "setText:", 0);
  -[SBUIPasscodeEntryField appendString:](self, "appendString:", v5);

}

- (void)reset
{
  void *v3;
  uint64_t v4;

  self->_ignoreCallbacks = 1;
  -[SBUIPasscodeEntryField stringValue](self, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  -[SBUIPasscodeTextField setText:](self->_textField, "setText:", 0);
  self->_ignoreCallbacks = 0;
  if (v4)
    -[SBUIPasscodeEntryField notePasscodeFieldTextDidChange](self, "notePasscodeFieldTextDidChange");
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v4;

  if (objc_msgSend((id)objc_opt_class(), "_usesTextFieldForFirstResponder"))
  {
    if (self->_resigningFirstResponder)
      return 0;
    else
      return -[SBUIPasscodeTextField canBecomeFirstResponder](self->_textField, "canBecomeFirstResponder");
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBUIPasscodeEntryField;
    return -[SBUIPasscodeEntryField canBecomeFirstResponder](&v4, sel_canBecomeFirstResponder);
  }
}

- (BOOL)isFirstResponder
{
  objc_super v4;

  if (objc_msgSend((id)objc_opt_class(), "_usesTextFieldForFirstResponder"))
    return -[SBUIPasscodeTextField isFirstResponder](self->_textField, "isFirstResponder");
  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeEntryField;
  return -[SBUIPasscodeEntryField isFirstResponder](&v4, sel_isFirstResponder);
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  uint64_t v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  -[SBUIPasscodeEntryField delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "passcodeEntryFieldShouldShowSystemKeyboard:", self);
  else
    v4 = 0;
  -[SBUIPasscodeTextField setShowsSystemKeyboard:](self->_textField, "setShowsSystemKeyboard:", v4);
  if (objc_msgSend((id)objc_opt_class(), "_usesTextFieldForFirstResponder"))
  {
    if (!-[SBUIPasscodeEntryField canBecomeFirstResponder](self, "canBecomeFirstResponder"))
    {
      v6 = 0;
      goto LABEL_10;
    }
    v5 = -[SBUIPasscodeTextField becomeFirstResponder](self->_textField, "becomeFirstResponder");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBUIPasscodeEntryField;
    v5 = -[SBUIPasscodeEntryField becomeFirstResponder](&v8, sel_becomeFirstResponder);
  }
  v6 = v5;
LABEL_10:

  return v6;
}

- (BOOL)resignFirstResponder
{
  BOOL result;
  objc_super v4;

  if (objc_msgSend((id)objc_opt_class(), "_usesTextFieldForFirstResponder"))
  {
    self->_resigningFirstResponder = 1;
    result = -[SBUIPasscodeTextField resignFirstResponder](self->_textField, "resignFirstResponder");
    self->_resigningFirstResponder = 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBUIPasscodeEntryField;
    return -[SBUIPasscodeEntryField resignFirstResponder](&v4, sel_resignFirstResponder);
  }
  return result;
}

- (void)_setLuminosityBoost:(double)a3
{
  -[SBUIPasscodeTextField _setPasscodeStyleAlpha:](self->_textField, "_setPasscodeStyleAlpha:", a3);
}

- (void)_appendString:(id)a3
{
  -[SBUIPasscodeTextField insertText:](self->_textField, "insertText:", a3);
  -[SBUIPasscodeEntryField notePasscodeFieldTextDidChange](self, "notePasscodeFieldTextDidChange");
}

- (void)_deleteLastCharacter
{
  -[SBUIPasscodeTextField deleteBackward](self->_textField, "deleteBackward");
  -[SBUIPasscodeEntryField notePasscodeFieldTextDidChange](self, "notePasscodeFieldTextDidChange");
}

- (BOOL)_hasAnyCharacters
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBUIPasscodeEntryField _textField](self, "_textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  if (a3)
    -[SBUIPasscodeEntryField reset](self, "reset");
}

- (UITextField)_textField
{
  return (UITextField *)self->_textField;
}

+ (BOOL)_usesTextFieldForFirstResponder
{
  return 1;
}

- (CGSize)_viewSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 0.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_autofillForBiometricAuthenticationWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)shouldInsertPasscodeText:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (self->_ignoreCallbacks)
  {
    v5 = 0;
  }
  else
  {
    -[SBUIPasscodeEntryField delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = objc_msgSend(v6, "passcodeEntryField:shouldInsertText:", self, v4);
    else
      v5 = 1;

  }
  return v5;
}

- (void)notePasscodeFieldTextDidChange
{
  id v3;

  if (!self->_ignoreCallbacks)
  {
    -[SBUIPasscodeEntryField delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "passcodeEntryFieldTextDidChange:", self);

  }
}

- (void)notePasscodeFieldDidAcceptEntry
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  void *v7;

  if (!self->_ignoreCallbacks)
  {
    -[SBUIPasscodeEntryField delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeEntryField stringValue](self, "stringValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if ((objc_opt_respondsToSelector() & 1) == 0 || v4)
    {
      v5 = objc_opt_respondsToSelector();
      v6 = v7;
      if ((v5 & 1) == 0 || !v4)
        goto LABEL_9;
      objc_msgSend(v7, "passcodeEntryFieldDidAcceptEntry:", self);
    }
    else
    {
      objc_msgSend(v7, "passcodeEntryFieldDidCancelEntry:", self);
    }
    v6 = v7;
LABEL_9:

  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  -[SBUIPasscodeEntryField stringValue](self, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  v11 = objc_msgSend(v8, "length");
  if (v11 && location == v10 && !length)
  {
    -[SBUIPasscodeEntryField appendString:](self, "appendString:", v8);
  }
  else if (!v11 && location == v10 - 1 && length == 1)
  {
    -[SBUIPasscodeEntryField deleteLastCharacter](self, "deleteLastCharacter");
  }

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[SBUIPasscodeEntryField notePasscodeFieldDidAcceptEntry](self, "notePasscodeFieldDidAcceptEntry", a3);
  return 1;
}

- (void)textFieldDidResignFirstResponder:(id)a3
{
  id v4;

  -[SBUIPasscodeEntryField delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "passcodeEntryFieldDidResignFirstResponder:", self);

}

- (SBUIPasscodeEntryFieldDelegate)delegate
{
  return (SBUIPasscodeEntryFieldDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)setCustomBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
  objc_storeStrong((id *)&self->_numericTrimmingSet, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
