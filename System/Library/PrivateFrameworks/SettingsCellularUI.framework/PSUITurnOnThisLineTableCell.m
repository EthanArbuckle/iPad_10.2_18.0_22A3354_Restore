@implementation PSUITurnOnThisLineTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUITurnOnThisLineTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUITurnOnThisLineTableCell *v4;
  PSUITurnOnThisLineTableCell *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *titleLabel;
  uint64_t v10;
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
  UILabel *v27;
  UILabel *statusLabel;
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
  double v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v46;
  objc_super v47;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)PSUITurnOnThisLineTableCell;
  v4 = -[PSUITurnOnThisLineTableCell initWithStyle:reuseIdentifier:](&v48, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v47.receiver = v4;
    v47.super_class = (Class)PSUITurnOnThisLineTableCell;
    -[PSUITurnOnThisLineTableCell textLabel](&v47, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v46.receiver = v5;
    v46.super_class = (Class)PSUITurnOnThisLineTableCell;
    -[PSUITurnOnThisLineTableCell detailTextLabel](&v46, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[PSUITurnOnThisLineTableCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    v10 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v11);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_titleLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_titleLabel);

    -[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "centerYAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layoutMarginsGuide");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    -[UILabel widthAnchor](v5->_titleLabel, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutMarginsGuide");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "widthAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:multiplier:", v25, 0.6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setActive:", 1);

    v27 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v27;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_statusLabel, "setFont:", v29);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_statusLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_statusLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_statusLabel, "setTextColor:", v30);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v5->_statusLabel);

    -[UILabel centerYAnchor](v5->_statusLabel, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_statusLabel, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUITurnOnThisLineTableCell contentView](v5, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    LODWORD(v41) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_statusLabel, "setContentCompressionResistancePriority:forAxis:", 0, v41);
    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v43, 2.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

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

- (void)_setTitle:(id)a3 andStatus:(id)a4
{
  UILabel *titleLabel;
  id v7;
  id v8;

  titleLabel = self->_titleLabel;
  v8 = a4;
  v7 = a3;
  -[UILabel setHidden:](titleLabel, "setHidden:", 0);
  -[UILabel setText:](self->_titleLabel, "setText:", v7);

  -[UILabel setEnabled:](self->_titleLabel, "setEnabled:", 1);
  -[UILabel setText:](self->_statusLabel, "setText:", v8);

}

- (void)_updateStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = v4;
  if (v4 && objc_msgSend(v4, "transferredStatus"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TURN_ON_THIS_LINE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("CHECKING");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TURN_ON_THIS_LINE"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("ACTIVATING");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSUITurnOnThisLineTableCell _setTitle:andStatus:](self, "_setTitle:andStatus:", v6, v10);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSUITurnOnThisLineTableCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v8, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958], v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSUITurnOnThisLineTableCell _updateStatus:](self, "_updateStatus:", v7);
  -[PSUITurnOnThisLineTableCell setNeedsLayout](self, "setNeedsLayout");

}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
