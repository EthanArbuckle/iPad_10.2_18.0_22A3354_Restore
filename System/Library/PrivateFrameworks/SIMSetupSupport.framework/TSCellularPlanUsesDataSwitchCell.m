@implementation TSCellularPlanUsesDataSwitchCell

- (TSCellularPlanUsesDataSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSCellularPlanUsesDataSwitchCell *v4;
  TSCellularPlanUsesDataSwitchCell *v5;
  id v6;
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
  UISwitch *v17;
  UISwitch *switchControl;
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
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)TSCellularPlanUsesDataSwitchCell;
  v4 = -[TSCellularPlanUsesDataSwitchCell initWithStyle:reuseIdentifier:](&v44, sel_initWithStyle_reuseIdentifier_, 0, a4);
  v5 = v4;
  if (v4)
    -[TSCellularPlanUsesDataSwitchCell setAccessoryType:](v4, "setAccessoryType:", 0);
  v6 = objc_alloc(MEMORY[0x24BEBD708]);
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[TSCellularPlanUsesDataSwitchCell setTitleLabel:](v5, "setTitleLabel:", v7);

  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_DATA_SWITCH"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setLineBreakMode:", 0);

  -[TSCellularPlanUsesDataSwitchCell contentView](v5, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addSubview:", v5->_titleLabel);

  v17 = (UISwitch *)objc_alloc_init(MEMORY[0x24BEBD9B8]);
  switchControl = v5->_switchControl;
  v5->_switchControl = v17;

  -[TSCellularPlanUsesDataSwitchCell setAccessoryView:](v5, "setAccessoryView:", v5->_switchControl);
  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesDataSwitchCell contentView](v5, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setActive:", 1);

  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesDataSwitchCell contentView](v5, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutMarginsGuide");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setActive:", 1);

  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerXAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesDataSwitchCell contentView](v5, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutMarginsGuide");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "centerXAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[TSCellularPlanUsesDataSwitchCell titleLabel](v5, "titleLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "centerYAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesDataSwitchCell contentView](v5, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "layoutMarginsGuide");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "centerYAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setActive:", 1);

  return v5;
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UISwitch)switchControl
{
  return self->_switchControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switchControl, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
