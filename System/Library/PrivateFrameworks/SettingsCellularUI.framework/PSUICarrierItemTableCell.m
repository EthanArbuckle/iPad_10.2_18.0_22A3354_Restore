@implementation PSUICarrierItemTableCell

+ (int64_t)cellStyle
{
  return 1;
}

- (PSUICarrierItemTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUICarrierItemTableCell *v4;
  PSUICarrierItemTableCell *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
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
  uint64_t v26;
  UIActivityIndicatorView *spinner;
  objc_super v29;
  objc_super v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PSUICarrierItemTableCell;
  v4 = -[PSUICarrierItemTableCell initWithStyle:reuseIdentifier:](&v31, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v30.receiver = v4;
    v30.super_class = (Class)PSUICarrierItemTableCell;
    -[PSUICarrierItemTableCell textLabel](&v30, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v29.receiver = v5;
    v29.super_class = (Class)PSUICarrierItemTableCell;
    -[PSUICarrierItemTableCell detailTextLabel](&v29, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v10);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICarrierItemTableCell contentView](v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5->_titleLabel);

    -[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierItemTableCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierItemTableCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[UILabel widthAnchor](v5->_titleLabel, "widthAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICarrierItemTableCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:multiplier:", v24, 0.6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v26;

    -[UIActivityIndicatorView startAnimating](v5->_spinner, "startAnimating");
    -[PSUICarrierItemTableCell setAccessoryView:](v5, "setAccessoryView:", v5->_spinner);
    -[PSUICarrierItemTableCell setAccessoryType:](v5, "setAccessoryType:", 1);
  }
  return v5;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 0;
}

- (void)_setTitle:(id)a3
{
  UILabel *titleLabel;
  id v5;

  titleLabel = self->_titleLabel;
  v5 = a3;
  -[UILabel setHidden:](titleLabel, "setHidden:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

  -[UILabel setEnabled:](self->_titleLabel, "setEnabled:", 0);
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSUICarrierItemTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v6, sel_refreshCellContentsWithSpecifier_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CARRIER_ITEM"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUICarrierItemTableCell _setTitle:](self, "_setTitle:", v5);

  -[PSUICarrierItemTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
