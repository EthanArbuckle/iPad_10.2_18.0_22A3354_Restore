@implementation PSUICellularPlanAddOnPlanSpecifier

- (PSUICellularPlanAddOnPlanSpecifier)initWithTarget:(id)a3 action:(SEL)a4 displayPlan:(id)a5
{
  id v9;
  id v10;
  PSUICellularPlanAddOnPlanSpecifier *v11;
  PSUICellularPlanAddOnPlanSpecifier *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  UIButton *addButton;
  UILabel *v17;
  UILabel *nameLabel;
  UILabel *v19;
  UILabel *numberLabel;
  objc_super v22;
  objc_super v23;
  objc_super v24;
  SEL v25;

  v9 = a3;
  v25 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
  v11 = -[PSUICellularPlanAddOnPlanSpecifier initWithName:target:set:get:detail:cell:edit:](&v24, sel_initWithName_target_set_get_detail_cell_edit_, 0, 0, 0, 0, 0, 4, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_target, a3);
    objc_storeStrong((id *)&v12->_displayPlan, a5);
    v23.receiver = v12;
    v23.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
    -[PSUICellularPlanAddOnPlanSpecifier setUserInfo:](&v23, sel_setUserInfo_, v10);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v25, ":");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BE75900];
    v22.receiver = v12;
    v22.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
    -[PSUICellularPlanAddOnPlanSpecifier setProperty:forKey:](&v22, sel_setProperty_forKey_, v13, v14);

    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v15 = objc_claimAutoreleasedReturnValue();
    addButton = v12->_addButton;
    v12->_addButton = (UIButton *)v15;

    v17 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    nameLabel = v12->_nameLabel;
    v12->_nameLabel = v17;

    v19 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = v12->_numberLabel;
    v12->_numberLabel = v19;

  }
  return v12;
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  __objc2_class **v8;
  UIButton *addButton;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  UIButton *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_class *v65;
  id v66;
  objc_super v67;
  objc_super v68;
  uint64_t v69;

  v6 = a3;
  v7 = a4;
  v8 = &classRef_TransferBackPlanCache;
  if (objc_msgSend((id)*MEMORY[0x24BE75D18], "isEqualToString:", v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      addButton = self->_addButton;
      v66 = v6;
      v10 = v6;
      -[UIButton titleLabel](addButton, "titleLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x24BEBE1D0];
      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setFont:", v13);

      v14 = self->_addButton;
      v15 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ADD_ADD_ON_PLAN"), &stru_24D5028C8, CFSTR("Cellular"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setTitle:forState:](v14, "setTitle:forState:", v18, 0);

      v69 = 0;
      v19 = *MEMORY[0x24BE75900];
      v68.receiver = self;
      v68.super_class = (Class)PSUICellularPlanAddOnPlanSpecifier;
      -[PSUICellularPlanAddOnPlanSpecifier propertyForKey:](&v68, sel_propertyForKey_, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "getValue:", &v69);

      -[UIButton addTarget:action:forEvents:](self->_addButton, "addTarget:action:forEvents:", self->_target, v69, 64);
      objc_msgSend(v10, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", self->_addButton);

      -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_addButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIButton rightAnchor](self->_addButton, "rightAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "rightAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setActive:", 1);

      -[UIButton centerYAnchor](self->_addButton, "centerYAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "centerYAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setActive:", 1);

      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ADD_ON_PLAN_CARRIER_%@"), &stru_24D5028C8, CFSTR("Cellular"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTDisplayPlan carrierName](self->_displayPlan, "carrierName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_nameLabel, "setText:", v34);

      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v12);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_nameLabel, "setFont:", v35);

      -[UILabel setAdjustsFontForContentSizeCategory:](self->_nameLabel, "setAdjustsFontForContentSizeCategory:", 1);
      -[UILabel setNumberOfLines:](self->_nameLabel, "setNumberOfLines:", 0);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v10, "contentView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addSubview:", self->_nameLabel);

      -[UILabel firstBaselineAnchor](self->_nameLabel, "firstBaselineAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "topAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v39, 1.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setActive:", 1);

      -[UILabel leadingAnchor](self->_nameLabel, "leadingAnchor");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "layoutMarginsGuide");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "constraintEqualToAnchor:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setActive:", 1);

      objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](self->_numberLabel, "setFont:", v46);

      -[CTDisplayPlan phoneNumber](self->_displayPlan, "phoneNumber");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](self->_numberLabel, "setText:", v47);

      -[UILabel setNumberOfLines:](self->_numberLabel, "setNumberOfLines:", 0);
      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_numberLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](self->_numberLabel, "setTextColor:", v48);

      objc_msgSend(v10, "contentView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addSubview:", self->_numberLabel);

      -[UILabel firstBaselineAnchor](self->_numberLabel, "firstBaselineAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel lastBaselineAnchor](self->_nameLabel, "lastBaselineAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v51, 1.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setActive:", 1);

      -[UILabel leadingAnchor](self->_numberLabel, "leadingAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel leadingAnchor](self->_nameLabel, "leadingAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setActive:", 1);

      -[UILabel trailingAnchor](self->_numberLabel, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "contentView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "layoutMarginsGuide");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "trailingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "constraintLessThanOrEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setActive:", 1);

      objc_msgSend(v10, "contentView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v61, "bottomAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = &classRef_TransferBackPlanCache;
      -[UILabel lastBaselineAnchor](self->_numberLabel, "lastBaselineAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v63, 1.0);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setActive:", 1);

      v6 = v66;
    }
  }
  v65 = (objc_class *)v8[78];
  v67.receiver = self;
  v67.super_class = v65;
  -[PSUICellularPlanAddOnPlanSpecifier setProperty:forKey:](&v67, sel_setProperty_forKey_, v6, v7);

}

- (UIButton)addButton
{
  return self->_addButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addButton, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_displayPlan, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
