@implementation TSCellularPlanTableViewCell

- (TSCellularPlanTableViewCell)initWithTag:(int64_t)a3 delegate:(id)a4
{
  id v6;
  TSCellularPlanTableViewCell *v7;
  TSCellularPlanTableViewCell *v8;
  UITextField *v9;
  UITextField *editableTextField;
  void *v11;
  void *v12;
  UITextField *v13;
  void *v14;
  void *v15;
  void *v16;
  UITextField *v17;
  void *v18;
  void *v19;
  void *v20;
  UITextField *v21;
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
  objc_super v33;

  v6 = a4;
  v33.receiver = self;
  v33.super_class = (Class)TSCellularPlanTableViewCell;
  v7 = -[TSCellularPlanTableViewCell initWithStyle:reuseIdentifier:](&v33, sel_initWithStyle_reuseIdentifier_, 1, CFSTR("FAUX_INFO_CELL"));
  v8 = v7;
  if (v7)
  {
    -[TSCellularPlanTableViewCell setTag:](v7, "setTag:", a3);
    v9 = (UITextField *)objc_alloc_init(MEMORY[0x24BEBDA48]);
    editableTextField = v8->_editableTextField;
    v8->_editableTextField = v9;

    -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](v8->_editableTextField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UITextField setTag:](v8->_editableTextField, "setTag:", a3);
    -[UITextField setDelegate:](v8->_editableTextField, "setDelegate:", v6);
    -[UITextField setAutocapitalizationType:](v8->_editableTextField, "setAutocapitalizationType:", 0);
    -[UITextField setAutocorrectionType:](v8->_editableTextField, "setAutocorrectionType:", 1);
    -[UITextField setAdjustsFontSizeToFitWidth:](v8->_editableTextField, "setAdjustsFontSizeToFitWidth:", 1);
    -[TSCellularPlanTableViewCell contentView](v8, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v8->_editableTextField);

    v12 = (void *)MEMORY[0x24BDD1628];
    v13 = v8->_editableTextField;
    -[TSCellularPlanTableViewCell textLabel](v8, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 5, 0, v14, 6, 1.0, 8.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanTableViewCell addConstraint:](v8, "addConstraint:", v15);

    v16 = (void *)MEMORY[0x24BDD1628];
    v17 = v8->_editableTextField;
    -[TSCellularPlanTableViewCell contentView](v8, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v17, 3, 0, v18, 3, 1.0, 8.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanTableViewCell addConstraint:](v8, "addConstraint:", v19);

    v20 = (void *)MEMORY[0x24BDD1628];
    v21 = v8->_editableTextField;
    -[TSCellularPlanTableViewCell contentView](v8, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21, 4, 0, v22, 4, 1.0, -8.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanTableViewCell addConstraint:](v8, "addConstraint:", v23);

    objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v8->_editableTextField, 6, 0, v8, 6, 1.0, -8.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanTableViewCell addConstraint:](v8, "addConstraint:", v24);

    -[TSCellularPlanTableViewCell textLabel](v8, "textLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(v26, "fontDescriptor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "fontDescriptorWithSymbolicTraits:", 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pointSize");
    objc_msgSend(v27, "fontWithDescriptor:size:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    -[TSCellularPlanTableViewCell textLabel](v8, "textLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFont:", v30);

  }
  return v8;
}

+ (double)rowHeight
{
  return 60.0;
}

- (UITextField)editableTextField
{
  return self->_editableTextField;
}

- (void)setEditableTextField:(id)a3
{
  objc_storeStrong((id *)&self->_editableTextField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editableTextField, 0);
}

@end
