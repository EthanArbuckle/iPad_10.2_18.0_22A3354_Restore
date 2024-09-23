@implementation VSPSPickerTableViewCell

+ (double)preferredHeight
{
  return 216.0;
}

- (VSPSPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  VSPSPickerTableViewCell *v9;
  VSPSPickerTableViewCell *v10;
  UIPickerView *v11;
  UIPickerView *pickerView;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v8 = a5;
  v26.receiver = self;
  v26.super_class = (Class)VSPSPickerTableViewCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v26, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[PSTableCell setSpecifier:](v9, "setSpecifier:", v8);
    v11 = (UIPickerView *)objc_alloc_init(MEMORY[0x24BDF6C58]);
    pickerView = v10->_pickerView;
    v10->_pickerView = v11;

    -[UIPickerView setTranslatesAutoresizingMaskIntoConstraints:](v10->_pickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIPickerView setDelegate:](v10->_pickerView, "setDelegate:", v10);
    -[UIPickerView setDataSource:](v10->_pickerView, "setDataSource:", v10);
    v13 = objc_alloc(MEMORY[0x24BDF6F90]);
    -[VSPSPickerTableViewCell contentView](v10, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v15 = (void *)objc_msgSend(v13, "initWithFrame:");

    objc_msgSend(v15, "setAutoresizingMask:", 18);
    objc_msgSend(v15, "setClipsToBounds:", 1);
    -[VSPSPickerTableViewCell contentView](v10, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v15);

    objc_msgSend(v15, "addSubview:", v10->_pickerView);
    -[VSPSPickerTableViewCell targetAsDelegate](v10, "targetAsDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "pickerViewCellInitialSelectedRow:", v10);

    -[UIPickerView selectRow:inComponent:animated:](v10->_pickerView, "selectRow:inComponent:animated:", v18, 0, 0);
    -[UIPickerView leadingAnchor](v10->_pickerView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UIPickerView trailingAnchor](v10->_pickerView, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

  }
  return v10;
}

- (id)targetAsDelegate
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[PSTableCell specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_255EB9890);

  if (v5)
  {
    -[PSTableCell specifier](self, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "target");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[VSPSPickerTableViewCell targetAsDelegate](self, "targetAsDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pickerViewCellNumberOfRows:", self);

  return v6;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  void *v7;
  void *v8;

  -[VSPSPickerTableViewCell targetAsDelegate](self, "targetAsDelegate", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerViewCell:titleForRow:", self, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v7;

  -[VSPSPickerTableViewCell targetAsDelegate](self, "targetAsDelegate", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerViewCell:didSelectRow:", self, a4);

}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
}

@end
