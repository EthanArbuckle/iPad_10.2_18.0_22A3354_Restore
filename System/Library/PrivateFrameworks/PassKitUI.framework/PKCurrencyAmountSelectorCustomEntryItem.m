@implementation PKCurrencyAmountSelectorCustomEntryItem

- (PKCurrencyAmountSelectorCustomEntryItem)initWithCurrencyCode:(id)a3
{
  id v4;
  PKCurrencyAmountSelectorCustomEntryItem *v5;
  PKTextfieldTableViewSettingsRowCurrencyFormatter *v6;
  PKTextfieldTableViewSettingsRowCurrencyFormatter *formatter;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCurrencyAmountSelectorCustomEntryItem;
  v5 = -[PKCurrencyAmountSelectorCustomEntryItem init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PKTextfieldTableViewSettingsRowCurrencyFormatter initWithCurrencyCode:]([PKTextfieldTableViewSettingsRowCurrencyFormatter alloc], "initWithCurrencyCode:", v4);
    formatter = v5->_formatter;
    v5->_formatter = v6;

  }
  return v5;
}

- (void)endEditing
{
  id v2;

  -[PKTextFieldTableViewCell textField](self->_cell, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (void)clear
{
  id v2;

  -[PKTextFieldTableViewCell textField](self->_cell, "textField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", 0);

}

- (id)decimalNumberValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  -[PKTextFieldTableViewCell textField](self->_cell, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "length"))
  {
    -[PKTextfieldTableViewSettingsRowCurrencyFormatter submissionValueFromFormattedInput:](self->_formatter, "submissionValueFromFormattedInput:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3598]), "initWithString:", v5);
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToNumber:", v7);

    if ((v8 & 1) != 0)
      v9 = 0;
    else
      v9 = v6;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)cellReuseIdentifier
{
  return CFSTR("CustomOptionEntryCellReuseIdentifier");
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  PKTextFieldTableViewCell *cell;
  id v7;
  id v8;
  void *v9;
  PKTextFieldTableViewCell *v10;
  PKTextFieldTableViewCell *v11;
  void *v12;
  void *v13;

  cell = self->_cell;
  if (!cell)
  {
    v7 = a4;
    v8 = a3;
    objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v7);
    v10 = (PKTextFieldTableViewCell *)objc_claimAutoreleasedReturnValue();

    v11 = self->_cell;
    self->_cell = v10;

    -[PKTextFieldTableViewCell textField](self->_cell, "textField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedMadisonString(CFSTR("CUSTOM_AMOUNT"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPlaceholder:", v13);

    objc_msgSend(v12, "setKeyboardType:", 8);
    objc_msgSend(v12, "setDelegate:", self);
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__textFieldValueChanged_, 0x20000);
    -[PKTextFieldTableViewCell setAccessibilityIdentifier:](self->_cell, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67A70]);

    cell = self->_cell;
  }
  return cell;
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (int64_t)editingStyle
{
  return 0;
}

- (void)_textFieldValueChanged:(id)a3
{
  id v4;
  PKTextfieldTableViewSettingsRowCurrencyFormatter *formatter;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t maximumInput;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  formatter = self->_formatter;
  if (formatter)
  {
    v13 = v4;
    objc_msgSend(v4, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextfieldTableViewSettingsRowCurrencyFormatter formattedValueFromInput:](formatter, "formattedValueFromInput:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setText:", v7);
    -[PKTextfieldTableViewSettingsRowCurrencyFormatter numberFromInput:](self->_formatter, "numberFromInput:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    maximumInput = self->_maximumInput;
    v11 = (void *)MEMORY[0x1E0DC3658];
    self->_inputIsValid = v9 <= maximumInput;
    if (v9 > maximumInput)
      objc_msgSend(v11, "redColor");
    else
      objc_msgSend(v11, "labelColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextColor:", v12);

    (*((void (**)(void))self->_inputValueChangedHandler + 2))();
    v4 = v13;
  }

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  BOOL v15;

  length = a4.length;
  location = a4.location;
  v9 = a5;
  objc_msgSend(a3, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", location, length, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKTextfieldTableViewSettingsRowCurrencyFormatter numberFromInput:](self->_formatter, "numberFromInput:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");
  v15 = self->_inputIsValid || v13 <= self->_maximumInput;

  return v15;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  void (**editingChangedHandler)(id, uint64_t);

  editingChangedHandler = (void (**)(id, uint64_t))self->_editingChangedHandler;
  if (editingChangedHandler)
    editingChangedHandler[2](editingChangedHandler, 1);
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  void (**editingChangedHandler)(id, _QWORD);

  editingChangedHandler = (void (**)(id, _QWORD))self->_editingChangedHandler;
  if (editingChangedHandler)
    editingChangedHandler[2](editingChangedHandler, 0);
}

- (id)editingChangedHandler
{
  return self->_editingChangedHandler;
}

- (void)setEditingChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)inputValueChangedHandler
{
  return self->_inputValueChangedHandler;
}

- (void)setInputValueChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)maximumInput
{
  return self->_maximumInput;
}

- (void)setMaximumInput:(unint64_t)a3
{
  self->_maximumInput = a3;
}

- (BOOL)inputIsValid
{
  return self->_inputIsValid;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inputValueChangedHandler, 0);
  objc_storeStrong(&self->_editingChangedHandler, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
