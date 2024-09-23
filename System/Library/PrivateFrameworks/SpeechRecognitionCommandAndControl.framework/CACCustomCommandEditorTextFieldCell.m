@implementation CACCustomCommandEditorTextFieldCell

- (CACCustomCommandEditorTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CACCustomCommandEditorTextFieldCell *v4;
  UITextField *v5;
  UITextField *textField;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;
  _QWORD v41[10];

  v41[8] = *MEMORY[0x24BDAC8D0];
  v40.receiver = self;
  v40.super_class = (Class)CACCustomCommandEditorTextFieldCell;
  v4 = -[CACCustomCommandEditorTextFieldCell initWithStyle:reuseIdentifier:](&v40, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    textField = v4->_textField;
    v4->_textField = v5;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v4->_textField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setFont:](v4->_textField, "setFont:", v7);

    -[CACCustomCommandEditorTextFieldCell contentView](v4, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v4->_textField);
    v9 = objc_alloc_init(MEMORY[0x24BEBD718]);
    objc_msgSend(v8, "addLayoutGuide:", v9);
    v29 = (void *)MEMORY[0x24BDD1628];
    -[UITextField firstBaselineAnchor](v4->_textField, "firstBaselineAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v38, 1.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v37;
    objc_msgSend(v9, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField lastBaselineAnchor](v4->_textField, "lastBaselineAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v35, 1.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v34;
    -[UITextField leadingAnchor](v4->_textField, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41[2] = v30;
    -[UITextField trailingAnchor](v4->_textField, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutMarginsGuide");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "trailingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v41[3] = v24;
    objc_msgSend(v8, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintGreaterThanOrEqualToConstant:", 44.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41[4] = v22;
    objc_msgSend(v9, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:", v20);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[5] = v10;
    v11 = v9;
    v25 = v9;
    objc_msgSend(v9, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintLessThanOrEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[6] = v14;
    objc_msgSend(v11, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41[7] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "activateConstraints:", v18);

  }
  return v4;
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
