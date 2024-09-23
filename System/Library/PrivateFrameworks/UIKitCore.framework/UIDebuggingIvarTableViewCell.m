@implementation UIDebuggingIvarTableViewCell

- (UIDebuggingIvarTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  UIDebuggingIvarTableViewCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UIDebuggingIvarTableViewCell;
  v4 = -[UITableViewCell initWithStyle:reuseIdentifier:](&v15, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v7 = (void *)objc_opt_new();
    objc_msgSend(off_1E167A828, "systemFontOfSize:", 12.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v8);

    objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Menlo"), 9.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v9);

    objc_msgSend(off_1E167A828, "fontWithName:size:", CFSTR("Menlo"), 12.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFont:", v10);

    objc_msgSend(v7, "setTextAlignment:", 2);
    objc_msgSend(v7, "setNumberOfLines:", 2);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIDebuggingIvarTableViewCell setNameLabel:](v4, "setNameLabel:", v5);
    -[UIDebuggingIvarTableViewCell setTypeLabel:](v4, "setTypeLabel:", v6);
    -[UIDebuggingIvarTableViewCell setValueLabel:](v4, "setValueLabel:", v7);
    -[UITableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5);

    -[UITableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v6);

    -[UITableViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v7);

    -[UIDebuggingIvarTableViewCell _prepareConstraints](v4, "_prepareConstraints");
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIDebuggingIvarTableViewCell;
  -[UITableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[UITableViewCell setAccessoryType:](self, "setAccessoryType:", 0);
}

- (void)_prepareConstraints
{
  void *v3;
  void *v4;
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
  id v56;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  -[UITableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMarginsGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell nameLabel](self, "nameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell nameLabel](self, "nameLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell nameLabel](self, "nameLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingIvarTableViewCell typeLabel](self, "typeLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v19);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell typeLabel](self, "typeLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell typeLabel](self, "typeLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell typeLabel](self, "typeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v29);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell typeLabel](self, "typeLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v32);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v38);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintEqualToAnchor:", v41);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "addObject:", v55);
  objc_msgSend(v56, "addObject:", v54);
  objc_msgSend(v56, "addObject:", v15);
  objc_msgSend(v56, "addObject:", v53);
  objc_msgSend(v56, "addObject:", v52);
  objc_msgSend(v56, "addObject:", v51);
  objc_msgSend(v56, "addObject:", v50);
  objc_msgSend(v56, "addObject:", v49);
  objc_msgSend(v56, "addObject:", v48);
  objc_msgSend(v56, "addObject:", v47);
  objc_msgSend(v56, "addObject:", v46);
  objc_msgSend(v56, "addObject:", v45);
  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v56);

}

- (void)setIvar:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_ivar, a3);
  -[UIDebuggingIvarTableViewCell nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[UIDebuggingIvarTableViewCell typeLabel](self, "typeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "typeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

  objc_msgSend(v13, "valueDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isObject"))
  {
    objc_msgSend(v13, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p\n%@"), v10, objc_opt_class());
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  -[UIDebuggingIvarTableViewCell valueLabel](self, "valueLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v9);

}

- (UIDebuggingIvar)ivar
{
  return self->_ivar;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_typeLabel, a3);
}

- (UILabel)valueLabel
{
  return self->_valueLabel;
}

- (void)setValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_valueLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_ivar, 0);
}

@end
