@implementation TSCellularPlanUsesTableViewCell

- (TSCellularPlanUsesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSCellularPlanUsesTableViewCell *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  objc_super v58;
  _QWORD v59[7];

  v59[5] = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)TSCellularPlanUsesTableViewCell;
  v4 = -[TSCellularPlanUsesTableViewCell initWithStyle:reuseIdentifier:](&v58, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    -[TSCellularPlanUsesTableViewCell setTitleLabel:](v4, "setTitleLabel:", v10);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell titleLabel](v4, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    -[TSCellularPlanUsesTableViewCell titleLabel](v4, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 0);

    -[TSCellularPlanUsesTableViewCell titleLabel](v4, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
    -[TSCellularPlanUsesTableViewCell setDescriptionLabel:](v4, "setDescriptionLabel:", v15);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTextColor:", v18);

    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", 0);

    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLayoutMargins:", 0.0, 25.0, 0.0, 25.0);

    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell titleLabel](v4, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

    v46 = (void *)MEMORY[0x24BDD1628];
    -[TSCellularPlanUsesTableViewCell titleLabel](v4, "titleLabel");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "scaledValueForValue:", 12.0);
    objc_msgSend(v55, "constraintEqualToAnchor:constant:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v52;
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell titleLabel](v4, "titleLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v59[1] = v47;
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "layoutMarginsGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v59[2] = v40;
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trailingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v59[3] = v28;
    -[TSCellularPlanUsesTableViewCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell descriptionLabel](v4, "descriptionLabel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scaledValueForValue:", 12.0);
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v59[4] = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "activateConstraints:", v35);

  }
  return v4;
}

- (void)setLabel:(id)a3 description:(id)a4 badge:(id)a5
{
  id v8;
  id v9;
  id v10;
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
  float v34;
  double v35;
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
  _QWORD v51[4];
  uint64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[TSCellularPlanUsesTableViewCell titleLabel](self, "titleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TSCellularPlanUsesTableViewCell badge](self, "badge");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeFromSuperview");

  }
  v49 = v9;
  objc_msgSend(MEMORY[0x24BDBAD28], "badgeForText:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell setBadge:](self, "setBadge:", v14);

  v52 = *MEMORY[0x24BEBB320];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setViewAttributes:", v16);

  -[TSCellularPlanUsesTableViewCell contentView](self, "contentView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v19);

  v48 = v8;
  if (v8)
  {
    -[TSCellularPlanUsesTableViewCell descriptionLabel](self, "descriptionLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v8);
  }
  else
  {
    -[TSCellularPlanUsesTableViewCell titleLabel](self, "titleLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextAlignment:", 1);

    -[TSCellularPlanUsesTableViewCell contentView](self, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanUsesTableViewCell titleLabel](self, "titleLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v22);

  }
  -[TSCellularPlanUsesTableViewCell contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "layoutMarginsGuide");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v42;
  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "trailingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell titleLabel](self, "titleLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "scaledValueForValue:", -4.0);
  objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v36;
  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell titleLabel](self, "titleLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v27;
  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "widthAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintLessThanOrEqualToConstant:", 300.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v51[3] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "addConstraints:", v31);

  -[TSCellularPlanUsesTableViewCell badge](self, "badge");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesTableViewCell titleLabel](self, "titleLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "contentHuggingPriorityForAxis:", 0);
  *(float *)&v35 = v34 + 1.0;
  objc_msgSend(v32, "setContentHuggingPriority:forAxis:", 0, v35);

}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UILabel)descriptionLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setDescriptionLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (CNGeminiBadge)badge
{
  return (CNGeminiBadge *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setBadge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
