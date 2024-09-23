@implementation PRXPickerContentView

- (PRXPickerContentView)initWithCardStyle:(int64_t)a3
{
  PRXPickerContentView *v3;
  PRXPickerView *v4;
  UIPickerView *pickerView;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PRXPickerContentView *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)PRXPickerContentView;
  v3 = -[PRXCardContentView initWithCardStyle:](&v20, sel_initWithCardStyle_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(PRXPickerView);
    pickerView = v3->_pickerView;
    v3->_pickerView = &v4->super;

    -[UIPickerView setTranslatesAutoresizingMaskIntoConstraints:](v3->_pickerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXPickerContentView addSubview:](v3, "addSubview:", v3->_pickerView);
    -[PRXCardContentView mainContentGuide](v3, "mainContentGuide");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1628];
    -[UIPickerView leadingAnchor](v3->_pickerView, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v7;
    -[UIPickerView trailingAnchor](v3->_pickerView, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v10;
    -[UIPickerView bottomAnchor](v3->_pickerView, "bottomAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v14);

    v15 = v3;
  }

  return v3;
}

- (void)updateConstraints
{
  UITextField *textField;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  void *pickerTopConstraint;
  NSLayoutConstraint *v8;
  NSLayoutConstraint *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PRXPickerContentView;
  -[PRXCardContentView updateConstraints](&v10, sel_updateConstraints);
  if (!self->_pickerTopConstraint)
  {
    textField = self->_textField;
    -[UIPickerView topAnchor](self->_pickerView, "topAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (textField)
    {
      -[UITextField bottomAnchor](self->_textField, "bottomAnchor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5, 10.0);
      v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      pickerTopConstraint = self->_pickerTopConstraint;
      self->_pickerTopConstraint = v6;
    }
    else
    {
      -[PRXCardContentView mainContentGuide](self, "mainContentGuide");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "topAnchor");
      pickerTopConstraint = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "constraintEqualToAnchor:", pickerTopConstraint);
      v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
      v9 = self->_pickerTopConstraint;
      self->_pickerTopConstraint = v8;

    }
    -[NSLayoutConstraint setActive:](self->_pickerTopConstraint, "setActive:", 1);
  }
}

- (void)setTextField:(id)a3
{
  UITextField *v5;
  UITextField **p_textField;
  UITextField *textField;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *pickerTopConstraint;
  NSLayoutConstraint *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x24BDAC8D0];
  v5 = (UITextField *)a3;
  p_textField = &self->_textField;
  textField = self->_textField;
  if (textField != v5)
  {
    -[UITextField removeFromSuperview](textField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_textField, a3);
    if (*p_textField)
    {
      -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](*p_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXPickerContentView addSubview:](self, "addSubview:", *p_textField);
      -[PRXCardContentView mainContentGuide](self, "mainContentGuide");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x24BDD1628];
      -[UITextField topAnchor](*p_textField, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "constraintEqualToAnchor:", v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v19;
      -[UITextField leadingAnchor](*p_textField, "leadingAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "leadingAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22[1] = v11;
      -[UITextField trailingAnchor](*p_textField, "trailingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "activateConstraints:", v15);

    }
    pickerTopConstraint = self->_pickerTopConstraint;
    if (pickerTopConstraint)
    {
      -[NSLayoutConstraint setActive:](pickerTopConstraint, "setActive:", 0);
      v17 = self->_pickerTopConstraint;
      self->_pickerTopConstraint = 0;

    }
    -[PRXPickerContentView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

}

- (UITextField)textField
{
  return self->_textField;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_pickerTopConstraint, 0);
}

@end
