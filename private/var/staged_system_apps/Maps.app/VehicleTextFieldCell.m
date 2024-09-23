@implementation VehicleTextFieldCell

- (VehicleTextFieldCell)init
{
  return -[VehicleTextFieldCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
}

- (VehicleTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  VehicleTextFieldCell *v4;
  VehicleTextFieldCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VehicleTextFieldCell;
  v4 = -[VehicleTextFieldCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
  {
    -[VehicleTextFieldCell _commonInit](v4, "_commonInit");
    -[VehicleTextFieldCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("VehicleTextFieldCell"));
  }
  return v5;
}

- (void)_commonInit
{
  UITextField *v3;
  UITextField *textField;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];

  v3 = objc_opt_new(UITextField);
  textField = self->_textField;
  self->_textField = v3;

  -[UITextField setAccessibilityIdentifier:](self->_textField, "setAccessibilityIdentifier:", CFSTR("TextField"));
  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setAccessibilityIdentifier:](self->_textField, "setAccessibilityIdentifier:", CFSTR("TextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UITextField setTextColor:](self->_textField, "setTextColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  -[UITextField setFont:](self->_textField, "setFont:", v6);

  -[UITextField setClearButtonMode:](self->_textField, "setClearButtonMode:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField rightView](self->_textField, "rightView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("RightView"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leftView](self->_textField, "leftView"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("LeftView"));

  -[VehicleTextFieldCell addSubview:](self, "addSubview:", self->_textField);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell contentView](self, "contentView"));
  objc_msgSend(v9, "setUserInteractionEnabled:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_textField, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell leadingAnchor](self, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0));
  v23[0] = v20;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_textField, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell trailingAnchor](self, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -16.0));
  v23[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](self->_textField, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell topAnchor](self, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
  v23[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_textField, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VehicleTextFieldCell bottomAnchor](self, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  v23[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (double)cellHeightWithWidth:(double)a3
{
  return 61.0;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textField, 0);
}

@end
