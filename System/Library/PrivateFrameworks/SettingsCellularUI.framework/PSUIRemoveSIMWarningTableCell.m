@implementation PSUIRemoveSIMWarningTableCell

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUIRemoveSIMWarningTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("RemoveSIMWarningKey"), v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUIRemoveSIMWarningTableCell _setupView:](self, "_setupView:", v5);
  -[PSUIRemoveSIMWarningTableCell layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)_setupView:(id)a3
{
  objc_class *v4;
  id v5;
  UILabel *v6;
  UILabel *title;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UILabel *v16;
  UILabel *label;
  void *v18;
  void *v19;
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
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  if (!self->_title)
  {
    v4 = (objc_class *)MEMORY[0x24BEBD708];
    v5 = a3;
    v6 = (UILabel *)objc_alloc_init(v4);
    title = self->_title;
    self->_title = v6;

    -[UILabel setNumberOfLines:](self->_title, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_TRANSFERRED"), &stru_24D5028C8, CFSTR("Cellular"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_title, "setText:", v9);

    v10 = (void *)MEMORY[0x24BEBB520];
    -[UILabel font](self->_title, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fontDescriptorWithSymbolicTraits:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel font](self->_title, "font");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pointSize");
    objc_msgSend(v10, "fontWithDescriptor:size:", v13);
    v58 = (id)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](self->_title, "setFont:", v58);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_title, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_title);

    v16 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    label = self->_label;
    self->_label = v16;

    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    -[UILabel setText:](self->_label, "setText:", v5);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", self->_label);

    -[UILabel topAnchor](self->_title, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 8.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    -[UILabel centerXAnchor](self->_title, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    -[UILabel trailingAnchor](self->_title, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutMarginsGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[UILabel leadingAnchor](self->_title, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "layoutMarginsGuide");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setActive:", 1);

    -[UILabel topAnchor](self->_label, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](self->_title, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, 8.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    -[UILabel centerXAnchor](self->_label, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    -[UILabel bottomAnchor](self->_label, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bottomAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46, -8.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[UILabel trailingAnchor](self->_label, "trailingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layoutMarginsGuide");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setActive:", 1);

    -[UILabel leadingAnchor](self->_label, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIRemoveSIMWarningTableCell contentView](self, "contentView");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "layoutMarginsGuide");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "leadingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setActive:", 1);

  }
}

- (UILabel)title
{
  return (UILabel *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1208);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
