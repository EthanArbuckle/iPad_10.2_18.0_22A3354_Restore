@implementation PSUICellularPlanOptionTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUICellularPlanOptionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUICellularPlanOptionTableCell *v4;
  PSUICellularPlanOptionTableCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PSUIBadgeView *v12;
  PSUIBadgeView *badgeView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UILabel *v20;
  UILabel *nameLabel;
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
  UILabel *v40;
  UILabel *numberLabel;
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
  void *v58;
  void *v59;
  PSUIBadgeView *v60;
  PSUIBadgeView *centeredBadgeView;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  UILabel *v68;
  UILabel *centeredNameLabel;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v89;
  objc_super v90;
  objc_super v91;
  objc_super v92;
  objc_super v93;
  objc_super v94;
  objc_super v95;
  objc_super v96;

  v96.receiver = self;
  v96.super_class = (Class)PSUICellularPlanOptionTableCell;
  v4 = -[PSUICellularPlanOptionTableCell initWithStyle:reuseIdentifier:](&v96, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v95.receiver = v4;
    v95.super_class = (Class)PSUICellularPlanOptionTableCell;
    -[PSUICellularPlanOptionTableCell textLabel](&v95, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", CFSTR("ABC"));

    v94.receiver = v5;
    v94.super_class = (Class)PSUICellularPlanOptionTableCell;
    -[PSUICellularPlanOptionTableCell detailTextLabel](&v94, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR("XYZ"));

    v93.receiver = v5;
    v93.super_class = (Class)PSUICellularPlanOptionTableCell;
    -[PSUICellularPlanOptionTableCell textLabel](&v93, sel_textLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    v92.receiver = v5;
    v92.super_class = (Class)PSUICellularPlanOptionTableCell;
    -[PSUICellularPlanOptionTableCell detailTextLabel](&v92, sel_detailTextLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    v91.receiver = v5;
    v91.super_class = (Class)PSUICellularPlanOptionTableCell;
    -[PSUICellularPlanOptionTableCell textLabel](&v91, sel_textLabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    v90.receiver = v5;
    v90.super_class = (Class)PSUICellularPlanOptionTableCell;
    -[PSUICellularPlanOptionTableCell detailTextLabel](&v90, sel_detailTextLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    v12 = objc_alloc_init(PSUIBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v12;

    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_badgeView);

    -[PSUIBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutMarginsGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v20;

    v89 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_nameLabel, "setFont:", v22);

    -[UILabel setNumberOfLines:](v5->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v5->_nameLabel);

    -[UILabel firstBaselineAnchor](v5->_nameLabel, "firstBaselineAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v26, 1.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_nameLabel, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView trailingAnchor](v5->_badgeView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scaledValueForValue:", 4.0);
    objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setActive:", 1);

    -[PSUIBadgeView centerYAnchor](v5->_badgeView, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_nameLabel, "centerYAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_nameLabel, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "layoutMarginsGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "trailingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintLessThanOrEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setActive:", 1);

    v40 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v40;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_numberLabel, "setFont:", v42);

    -[UILabel setNumberOfLines:](v5->_numberLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_numberLabel, "setTextColor:", v43);

    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addSubview:", v5->_numberLabel);

    -[UILabel firstBaselineAnchor](v5->_numberLabel, "firstBaselineAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_nameLabel, "lastBaselineAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v46, 1.0);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_numberLabel, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_numberLabel, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "layoutMarginsGuide");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setActive:", 1);

    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_numberLabel, "lastBaselineAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v58, 1.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    v60 = objc_alloc_init(PSUIBadgeView);
    centeredBadgeView = v5->_centeredBadgeView;
    v5->_centeredBadgeView = v60;

    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addSubview:", v5->_centeredBadgeView);

    -[PSUIBadgeView leadingAnchor](v5->_centeredBadgeView, "leadingAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "layoutMarginsGuide");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "leadingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "constraintEqualToAnchor:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setActive:", 1);

    v68 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    centeredNameLabel = v5->_centeredNameLabel;
    v5->_centeredNameLabel = v68;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v89);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_centeredNameLabel, "setFont:", v70);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_centeredNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addSubview:", v5->_centeredNameLabel);

    -[UILabel leadingAnchor](v5->_centeredNameLabel, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView trailingAnchor](v5->_centeredBadgeView, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "scaledValueForValue:", 4.0);
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_centeredNameLabel, "trailingAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "layoutMarginsGuide");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "trailingAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "constraintLessThanOrEqualToAnchor:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setActive:", 1);

    -[UILabel centerYAnchor](v5->_centeredNameLabel, "centerYAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell contentView](v5, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:", v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "setActive:", 1);

    -[PSUIBadgeView centerYAnchor](v5->_centeredBadgeView, "centerYAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_centeredNameLabel, "centerYAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintEqualToAnchor:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setActive:", 1);

  }
  return v5;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 1;
}

- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4
{
  PSUIBadgeView *badgeView;
  id v7;
  void *v8;
  void *v9;
  id v10;

  badgeView = self->_badgeView;
  v10 = a4;
  v7 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 1);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 0);
  -[PSUIBadgeView setText:](self->_badgeView, "setText:", v7);
  -[UILabel setText:](self->_nameLabel, "setText:", v10);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_PHONE_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_numberLabel, "setText:", v9);

  -[PSUIBadgeView setText:](self->_centeredBadgeView, "setText:", v7);
  -[UILabel setText:](self->_centeredNameLabel, "setText:", v10);

}

- (void)_setCenteredText:(id)a3
{
  PSUIBadgeView *badgeView;
  void *v5;
  void *v6;
  id v7;

  badgeView = self->_badgeView;
  v7 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 1);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 0);
  -[UILabel setText:](self->_nameLabel, "setText:", v7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PLACEHOLDER_PHONE_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_numberLabel, "setText:", v6);

  -[UILabel setText:](self->_centeredNameLabel, "setText:", v7);
}

- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5
{
  PSUIBadgeView *badgeView;
  id v9;
  id v10;
  id v11;

  badgeView = self->_badgeView;
  v9 = a5;
  v11 = a4;
  v10 = a3;
  -[PSUIBadgeView setHidden:](badgeView, "setHidden:", 0);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 0);
  -[UILabel setHidden:](self->_numberLabel, "setHidden:", 0);
  -[PSUIBadgeView setHidden:](self->_centeredBadgeView, "setHidden:", 1);
  -[UILabel setHidden:](self->_centeredNameLabel, "setHidden:", 1);
  -[PSUIBadgeView setText:](self->_badgeView, "setText:", v10);
  -[UILabel setText:](self->_nameLabel, "setText:", v11);
  -[UILabel setText:](self->_numberLabel, "setText:", v9);

  -[PSUIBadgeView setText:](self->_centeredBadgeView, "setText:", v10);
  -[UILabel setText:](self->_centeredNameLabel, "setText:", v11);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSUICellularPlanOptionTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v19, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75950]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonySubscriberCache sharedInstance](PSUICoreTelephonySubscriberCache, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortLabel:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24D5028C8;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  if (v6)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "userLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "phoneNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedPhoneNumber:context:", v17, v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "length"))
      -[PSUICellularPlanOptionTableCell _setBadge:andLabel:andPhoneNumber:](self, "_setBadge:andLabel:andPhoneNumber:", v11, v15, v18);
    else
      -[PSUICellularPlanOptionTableCell _setCenteredBadge:andLabel:](self, "_setCenteredBadge:andLabel:", v11, v15);
    -[PSUICellularPlanOptionTableCell setCellEnabled:](self, "setCellEnabled:", objc_msgSend(v6, "isSelected"));

  }
  else
  {
    objc_msgSend(v4, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanOptionTableCell _setCenteredText:](self, "_setCenteredText:", v15);
  }

  -[PSUICellularPlanOptionTableCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCellEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  id v12;

  v3 = a3;
  -[PSUICellularPlanOptionTableCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  -[PSUICellularPlanOptionTableCell badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

  -[PSUICellularPlanOptionTableCell nameLabel](self, "nameLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v3);

  -[PSUICellularPlanOptionTableCell numberLabel](self, "numberLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", v3);

  -[PSUICellularPlanOptionTableCell centeredBadgeView](self, "centeredBadgeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  -[PSUICellularPlanOptionTableCell centeredNameLabel](self, "centeredNameLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

  -[PSUICellularPlanOptionTableCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v11 = 0.5;
  if (v3)
    v11 = 1.0;
  objc_msgSend(v10, "setAlpha:", v11);

}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (PSUIBadgeView)badgeView
{
  return (PSUIBadgeView *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setBadgeView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1200);
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
  objc_storeStrong((id *)&self->_numberLabel, a3);
}

- (PSUIBadgeView)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setCenteredBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_centeredBadgeView, a3);
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_centeredNameLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
