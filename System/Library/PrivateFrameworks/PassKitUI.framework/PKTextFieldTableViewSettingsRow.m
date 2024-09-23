@implementation PKTextFieldTableViewSettingsRow

- (PKTextFieldTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 formatter:(id)a6 changeHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PKTextFieldTableViewSettingsRow *v17;
  uint64_t v18;
  NSCopying *identifier;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  id value;
  uint64_t v24;
  id changeHandler;
  PKTextFieldTableViewSettingsRowFormatter *formatter;
  uint64_t v27;
  id v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)PKTextFieldTableViewSettingsRow;
  v17 = -[PKTextFieldTableViewSettingsRow init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSCopying *)v18;

    v20 = objc_msgSend(v13, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    value = v17->_value;
    v17->_value = (id)v22;

    objc_storeStrong((id *)&v17->_formatter, a6);
    v24 = objc_msgSend(v16, "copy");
    changeHandler = v17->_changeHandler;
    v17->_changeHandler = (id)v24;

    formatter = v17->_formatter;
    if (formatter)
    {
      -[PKTextFieldTableViewSettingsRowFormatter formattedValueFromInput:](formatter, "formattedValueFromInput:", v17->_value);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v17->_value;
      v17->_value = (id)v27;

    }
  }

  return v17;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_title);
  objc_msgSend(v3, "safelyAddObject:", self->_value);
  objc_msgSend(v3, "safelyAddObject:", self->_formatter);
  objc_msgSend(v3, "safelyAddObject:", self->_placeholder);
  PKCombinedHash();
  PKIntegerHash();
  v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PKTextFieldTableViewSettingsRow *v4;
  PKTextFieldTableViewSettingsRow *v5;
  PKTextFieldTableViewSettingsRow *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *placeholder;
  NSString *v14;
  _BOOL4 v15;

  v4 = (PKTextFieldTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!PKEqualObjects())
          goto LABEL_22;
        title = v6->_title;
        v8 = self->_title;
        v9 = title;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_21;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_22;
        }
        if (!PKEqualObjects()
          || !PKEqualObjects()
          || self->_keyboardType != v6->_keyboardType)
        {
          goto LABEL_22;
        }
        placeholder = v6->_placeholder;
        v8 = self->_placeholder;
        v14 = placeholder;
        if (v8 == v14)
        {

LABEL_26:
          if (self->_changeHandler == v6->_changeHandler)
          {
            v12 = self->_enabled == v6->_enabled;
            goto LABEL_23;
          }
LABEL_22:
          v12 = 0;
LABEL_23:

          goto LABEL_24;
        }
        v10 = v14;
        if (v8 && v14)
        {
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_22;
          goto LABEL_26;
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    v12 = 0;
  }
LABEL_24:

  return v12;
}

+ (id)cellReuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "cellReuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1000, v6);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", self->_title);

  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D68118]);

  objc_msgSend(v7, "editableTextField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setText:", self->_value);
  objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel__textFieldValueChanged_, 0x20000);
  objc_msgSend(v10, "setKeyboardType:", self->_keyboardType);
  objc_msgSend(v10, "setPlaceholder:", self->_placeholder);
  objc_msgSend(v10, "setReturnKeyType:", 9);
  objc_msgSend(v10, "setEnabled:", self->_enabled);
  if (self->_keyboardType == 8)
  {
    v11 = objc_alloc(MEMORY[0x1E0DC3E68]);
    v12 = (void *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v13 = objc_alloc(MEMORY[0x1E0DC34F0]);
    v14 = (void *)MEMORY[0x1E0DC3428];
    PKLocalizedString(CFSTR("DONE"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __73__PKTextFieldTableViewSettingsRow_tableViewCellForTableView_atIndexPath___block_invoke;
    v25 = &unk_1E3E6D580;
    v16 = v10;
    v26 = v16;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v15, 0, 0, &v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v13, "initWithPrimaryAction:", v17, v22, v23, v24, v25);

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v27[0] = v19;
    v27[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setItems:", v20);

    objc_msgSend(v12, "sizeToFit");
    objc_msgSend(v16, "setInputAccessoryView:", v12);

  }
  objc_msgSend(v7, "setAccessibilityIdentifier:", self->_identifier);

  return v7;
}

uint64_t __73__PKTextFieldTableViewSettingsRow_tableViewCellForTableView_atIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resignFirstResponder");
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  uint64_t v5;
  PKTextFieldTableViewSettingsRowFormatter *formatter;
  uint64_t v7;
  id v8;
  id v9;

  if (!a4)
  {
    objc_msgSend(a3, "text");
    v5 = objc_claimAutoreleasedReturnValue();
    formatter = self->_formatter;
    if (formatter)
    {
      v8 = (id)v5;
      -[PKTextFieldTableViewSettingsRowFormatter submissionValueFromFormattedInput:](formatter, "submissionValueFromFormattedInput:");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = v7;
    }
    v9 = (id)v5;
    (*((void (**)(void))self->_changeHandler + 2))();

  }
}

- (void)_textFieldValueChanged:(id)a3
{
  PKTextFieldTableViewSettingsRowFormatter *formatter;
  id v4;
  void *v5;
  id v6;

  formatter = self->_formatter;
  if (formatter)
  {
    v4 = a3;
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextFieldTableViewSettingsRowFormatter formattedValueFromInput:](formatter, "formattedValueFromInput:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setText:", v6);
  }
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end
