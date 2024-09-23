@implementation STMostUsedCell

- (STMostUsedCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  STMostUsedCell *v9;
  STMostUsedCell *v10;
  void *v11;
  uint64_t v12;
  UIImageView *allowanceIconView;
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
  objc_super v35;

  v8 = a5;
  v35.receiver = self;
  v35.super_class = (Class)STMostUsedCell;
  v9 = -[STUsageCell initWithStyle:reuseIdentifier:specifier:](&v35, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[STMostUsedCell contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_new();
    allowanceIconView = v10->_allowanceIconView;
    v10->_allowanceIconView = (UIImageView *)v12;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_allowanceIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STAllowanceIconKey"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v10->_allowanceIconView, "setImage:", v14);

    objc_msgSend(v11, "addSubview:", v10->_allowanceIconView);
    v15 = (void *)objc_opt_new();
    -[STUsageCell usageLabel](v10, "usageLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView leadingAnchor](v10->_allowanceIconView, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -8.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v19);

    -[UIImageView centerYAnchor](v10->_allowanceIconView, "centerYAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v22);

    -[UIImageView heightAnchor](v10->_allowanceIconView, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToConstant:", 15.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v24);

    -[UIImageView widthAnchor](v10->_allowanceIconView, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToConstant:", 9.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v26);

    -[UIImageView trailingAnchor](v10->_allowanceIconView, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v29);

    -[UIImageView leadingAnchor](v10->_allowanceIconView, "leadingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageCell itemNameLabel](v10, "itemNameLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "trailingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", v32, 8.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v33);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v15);
  }

  return v10;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STMostUsedCell;
  v4 = a3;
  -[STUsageCell setValue:](&v11, sel_setValue_, v4);
  objc_msgSend(v4, "totalUsage", v11.receiver, v11.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  if (v6 >= 60.0)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setAllowedUnits:", 96);
    objc_msgSend(v8, "setUnitsStyle:", 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "stringFromTimeInterval:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUsageCell usageLabel](self, "usageLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

- (void)reloadWithSpecifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)STMostUsedCell;
  v6 = a3;
  -[PSTableCell reloadWithSpecifier:animated:](&v9, sel_reloadWithSpecifier_animated_, v6, v4);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("STAllowanceIconKey"), v9.receiver, v9.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[STMostUsedCell allowanceIconView](self, "allowanceIconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

}

- (UIImageView)allowanceIconView
{
  return self->_allowanceIconView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowanceIconView, 0);
}

@end
