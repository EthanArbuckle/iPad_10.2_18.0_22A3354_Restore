@implementation PSUICellularPlanTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUICellularPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUICellularPlanTableCell *v4;
  PSUICellularPlanTableCell *v5;
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
  UILabel *v35;
  UILabel *numberLabel;
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
  PSUIBadgeView *v55;
  PSUIBadgeView *centeredBadgeView;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  UILabel *v63;
  UILabel *centeredNameLabel;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  UILabel *v78;
  UILabel *statusLabel;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v100;
  objc_super v101;
  objc_super v102;
  objc_super v103;
  objc_super v104;
  objc_super v105;
  objc_super v106;
  objc_super v107;

  v107.receiver = self;
  v107.super_class = (Class)PSUICellularPlanTableCell;
  v4 = -[PSUICellularPlanTableCell initWithStyle:reuseIdentifier:](&v107, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v106.receiver = v4;
    v106.super_class = (Class)PSUICellularPlanTableCell;
    -[PSUICellularPlanTableCell textLabel](&v106, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", CFSTR("ABC"));

    v105.receiver = v5;
    v105.super_class = (Class)PSUICellularPlanTableCell;
    -[PSUICellularPlanTableCell detailTextLabel](&v105, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", CFSTR("XYZ"));

    v104.receiver = v5;
    v104.super_class = (Class)PSUICellularPlanTableCell;
    -[PSUICellularPlanTableCell textLabel](&v104, sel_textLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    v103.receiver = v5;
    v103.super_class = (Class)PSUICellularPlanTableCell;
    -[PSUICellularPlanTableCell detailTextLabel](&v103, sel_detailTextLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    v102.receiver = v5;
    v102.super_class = (Class)PSUICellularPlanTableCell;
    -[PSUICellularPlanTableCell textLabel](&v102, sel_textLabel);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

    v101.receiver = v5;
    v101.super_class = (Class)PSUICellularPlanTableCell;
    -[PSUICellularPlanTableCell detailTextLabel](&v101, sel_detailTextLabel);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    -[PSUICellularPlanTableCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v12 = objc_alloc_init(PSUIBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v12;

    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addSubview:", v5->_badgeView);

    -[PSUIBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
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

    v100 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_nameLabel, "setFont:", v22);

    -[UILabel setNumberOfLines:](v5->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v5->_nameLabel);

    -[UILabel firstBaselineAnchor](v5->_nameLabel, "firstBaselineAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
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

    v35 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v35;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_numberLabel, "setFont:", v37);

    -[UILabel setNumberOfLines:](v5->_numberLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_numberLabel, "setTextColor:", v38);

    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addSubview:", v5->_numberLabel);

    -[UILabel firstBaselineAnchor](v5->_numberLabel, "firstBaselineAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_nameLabel, "lastBaselineAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v41, 1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_numberLabel, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView leadingAnchor](v5->_badgeView, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_numberLabel, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "trailingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setActive:", 1);

    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_numberLabel, "lastBaselineAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v53, 1.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActive:", 1);

    v55 = objc_alloc_init(PSUIBadgeView);
    centeredBadgeView = v5->_centeredBadgeView;
    v5->_centeredBadgeView = v55;

    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "addSubview:", v5->_centeredBadgeView);

    -[PSUIBadgeView leadingAnchor](v5->_centeredBadgeView, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "layoutMarginsGuide");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setActive:", 1);

    v63 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    centeredNameLabel = v5->_centeredNameLabel;
    v5->_centeredNameLabel = v63;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v100);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_centeredNameLabel, "setFont:", v65);

    -[UILabel setNumberOfLines:](v5->_centeredNameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_centeredNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addSubview:", v5->_centeredNameLabel);

    -[UILabel centerYAnchor](v5->_centeredNameLabel, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "centerYAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_centeredNameLabel, "leadingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIBadgeView trailingAnchor](v5->_centeredBadgeView, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "scaledValueForValue:", 4.0);
    objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setActive:", 1);

    -[PSUIBadgeView centerYAnchor](v5->_centeredBadgeView, "centerYAnchor");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel centerYAnchor](v5->_centeredNameLabel, "centerYAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "constraintEqualToAnchor:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setActive:", 1);

    v78 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v78;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v100);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_statusLabel, "setFont:", v80);

    -[UILabel setNumberOfLines:](v5->_statusLabel, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_statusLabel, "setTextColor:", v81);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "addSubview:", v5->_statusLabel);

    -[UILabel centerYAnchor](v5->_statusLabel, "centerYAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "centerYAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "constraintEqualToAnchor:", v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_statusLabel, "trailingAnchor");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularPlanTableCell contentView](v5, "contentView");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "layoutMarginsGuide");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "trailingAnchor");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "constraintEqualToAnchor:", v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "setActive:", 1);

    LODWORD(v92) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_statusLabel, "setContentCompressionResistancePriority:forAxis:", 0, v92);
    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_nameLabel, "trailingAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v94, 1.0);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v5->_centeredNameLabel, "trailingAnchor");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:multiplier:", v97, 1.0);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setActive:", 1);

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
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PSUICellularPlanTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v22, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "planFromReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICoreTelephonySubscriberCache sharedInstance](PSUICoreTelephonySubscriberCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shortLabel:", v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &stru_24D5028C8;
  if (v10)
    v12 = (__CFString *)v10;
  v13 = v12;

  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "userLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "label");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedPhoneNumber:context:", v19, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v20, "length"))
    -[PSUICellularPlanTableCell _setBadge:andLabel:andPhoneNumber:](self, "_setBadge:andLabel:andPhoneNumber:", v13, v17, v20);
  else
    -[PSUICellularPlanTableCell _setCenteredBadge:andLabel:](self, "_setCenteredBadge:andLabel:", v13, v17);

  if (objc_msgSend(v4, "hasValidGetter"))
  {
    objc_msgSend(v4, "performGetter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UILabel setText:](self->_statusLabel, "setText:", v21);
    }

  }
  -[PSUICellularPlanTableCell setNeedsLayout](self, "setNeedsLayout");

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
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
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

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
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
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end
