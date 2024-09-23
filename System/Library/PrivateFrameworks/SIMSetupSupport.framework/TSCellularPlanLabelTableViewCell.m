@implementation TSCellularPlanLabelTableViewCell

- (TSCellularPlanLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSCellularPlanLabelTableViewCell *v4;
  id v5;
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
  void *v23;
  objc_super v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)TSCellularPlanLabelTableViewCell;
  v4 = -[TSCellularPlanLabelTableViewCell initWithStyle:reuseIdentifier:](&v24, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[TSCellularPlanLabelTableViewCell setLabel:](v4, "setLabel:", v6);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell label](v4, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    -[TSCellularPlanLabelTableViewCell label](v4, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[TSCellularPlanLabelTableViewCell label](v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TSCellularPlanLabelTableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell label](v4, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[TSCellularPlanLabelTableViewCell contentView](v4, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell label](v4, "label");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell contentView](v4, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    -[TSCellularPlanLabelTableViewCell contentView](v4, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintGreaterThanOrEqualToConstant:", 45.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addConstraints:", v21);

  }
  return v4;
}

- (void)setLabelWithNoBadge:(id)a3
{
  id v4;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TSCellularPlanLabelTableViewCell label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TSCellularPlanLabelTableViewCell badge](self, "badge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

  }
  -[TSCellularPlanLabelTableViewCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutMarginsGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addConstraints:", v15);

}

- (void)setLabel:(id)a3 badge:(id)a4
{
  id v6;
  id v7;
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
  float v28;
  double v29;
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
  _QWORD v49[5];
  uint64_t v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  -[TSCellularPlanLabelTableViewCell label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TSCellularPlanLabelTableViewCell badge](self, "badge");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeFromSuperview");

  }
  objc_msgSend(MEMORY[0x24BDBAD28], "badgeForText:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell setBadge:](self, "setBadge:", v11);

  v50 = *MEMORY[0x24BEBB320];
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v47 = v6;
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setViewAttributes:", v13);

  -[TSCellularPlanLabelTableViewCell contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v16);

  -[TSCellularPlanLabelTableViewCell contentView](self, "contentView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell contentView](self, "contentView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutMarginsGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v41;
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell label](self, "label");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "scaledValueForValue:", -4.0);
  objc_msgSend(v38, "constraintEqualToAnchor:constant:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v35;
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell label](self, "label");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstBaselineAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v30;
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "widthAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintLessThanOrEqualToConstant:", 300.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v19;
  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell contentView](self, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "centerYAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addConstraints:", v25);

  -[TSCellularPlanLabelTableViewCell badge](self, "badge");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell label](self, "label");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "contentHuggingPriorityForAxis:", 0);
  *(float *)&v29 = v28 + 1.0;
  objc_msgSend(v26, "setContentHuggingPriority:forAxis:", 0, v29);

}

- (CNGeminiBadge)badge
{
  return (CNGeminiBadge *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setBadge:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UILabel)label
{
  return (UILabel *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_badge, 0);
}

@end
