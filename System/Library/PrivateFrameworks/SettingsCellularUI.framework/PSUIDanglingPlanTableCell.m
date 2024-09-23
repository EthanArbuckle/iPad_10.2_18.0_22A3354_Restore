@implementation PSUIDanglingPlanTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUIDanglingPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  PSUIDanglingPlanTableCell *v4;
  PSUIDanglingPlanTableCell *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *statusLabel;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
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
  UILabel *v26;
  UILabel *nameLabel;
  void *v28;
  void *v29;
  double v30;
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
  UILabel *v49;
  UILabel *numberLabel;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v72;
  objc_super v73;
  objc_super v74;

  v74.receiver = self;
  v74.super_class = (Class)PSUIDanglingPlanTableCell;
  v4 = -[PSUIDanglingPlanTableCell initWithStyle:reuseIdentifier:](&v74, sel_initWithStyle_reuseIdentifier_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v73.receiver = v4;
    v73.super_class = (Class)PSUIDanglingPlanTableCell;
    -[PSUIDanglingPlanTableCell textLabel](&v73, sel_textLabel);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    v72.receiver = v5;
    v72.super_class = (Class)PSUIDanglingPlanTableCell;
    -[PSUIDanglingPlanTableCell detailTextLabel](&v72, sel_detailTextLabel);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    -[PSUIDanglingPlanTableCell setAccessoryType:](v5, "setAccessoryType:", 1);
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v8;

    v10 = *MEMORY[0x24BEBE1D0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_statusLabel, "setFont:", v11);

    -[UILabel setNumberOfLines:](v5->_statusLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_statusLabel, "setTextColor:", v12);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_statusLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v5->_statusLabel);

    LODWORD(v14) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_statusLabel, "setContentCompressionResistancePriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_statusLabel, "setContentHuggingPriority:forAxis:", 0, v15);
    -[UILabel trailingAnchor](v5->_statusLabel, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActive:", 1);

    -[UILabel centerYAnchor](v5->_statusLabel, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "layoutMarginsGuide");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    v26 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v26;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_nameLabel, "setFont:", v28);

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_nameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setNumberOfLines:](v5->_nameLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addSubview:", v5->_nameLabel);

    LODWORD(v30) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_nameLabel, "setContentCompressionResistancePriority:forAxis:", 1, v30);
    -[UILabel topAnchor](v5->_nameLabel, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "layoutMarginsGuide");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "topAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UILabel leadingAnchor](v5->_nameLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "layoutMarginsGuide");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_nameLabel, "trailingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel leadingAnchor](v5->_statusLabel, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "constraintEqualToAnchor:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setActive:", 1);

    -[UILabel trailingAnchor](v5->_nameLabel, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "layoutMarginsGuide");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintLessThanOrEqualToAnchor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setActive:", 1);

    v49 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v49;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_numberLabel, "setFont:", v51);

    -[UILabel setNumberOfLines:](v5->_numberLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_numberLabel, "setTextColor:", v52);

    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "addSubview:", v5->_numberLabel);

    LODWORD(v54) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_numberLabel, "setContentCompressionResistancePriority:forAxis:", 1, v54);
    -[UILabel leadingAnchor](v5->_numberLabel, "leadingAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layoutMarginsGuide");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setActive:", 1);

    -[UILabel bottomAnchor](v5->_numberLabel, "bottomAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUIDanglingPlanTableCell contentView](v5, "contentView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "layoutMarginsGuide");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setActive:", 1);

    -[UILabel firstBaselineAnchor](v5->_numberLabel, "firstBaselineAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel lastBaselineAnchor](v5->_nameLabel, "lastBaselineAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v66, 1.0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setActive:", 1);

    -[UILabel widthAnchor](v5->_numberLabel, "widthAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel widthAnchor](v5->_nameLabel, "widthAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "constraintEqualToAnchor:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setActive:", 1);

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

- (void)_setLabel:(id)a3 andPhoneNumber:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[UILabel setText:](self->_nameLabel, "setText:", a3);
  if (objc_msgSend(v8, "length"))
  {
    -[UILabel setText:](self->_numberLabel, "setText:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NO_NUMBER"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](self->_numberLabel, "setText:", v7);

  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PSUIDanglingPlanTableCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v29, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75958]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "danglingPlanFromReference:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "label");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v11 = -[__CFString length](v10, "length");
    v12 = 0x24BDD1000;
    if (!v11)
    {
      +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "planFromReference:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "planFromReference:", v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v17, "type"))
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_STATUS_SIM_CARD"), &stru_24D5028C8, CFSTR("Cellular"));
          v19 = objc_claimAutoreleasedReturnValue();

          v10 = (__CFString *)v19;
        }

      }
      v12 = 0x24BDD1000uLL;
    }
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(v12 + 1160), "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("USED_AS_%@"), &stru_24D5028C8, CFSTR("Gemini-Gemini"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v23 = v10;
    else
      v23 = &stru_24D5028C8;
    objc_msgSend(v20, "stringWithFormat:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[PSUICoreTelephonyCallCache sharedInstance](PSUICoreTelephonyCallCache, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedPhoneNumber:context:", v26, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "hasValidGetter"))
    {
      objc_msgSend(v4, "performGetter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[UILabel setText:](self->_statusLabel, "setText:", v28);
      }

    }
    -[PSUIDanglingPlanTableCell _setLabel:andPhoneNumber:](self, "_setLabel:andPhoneNumber:", v24, v27);
    -[PSUIDanglingPlanTableCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end
