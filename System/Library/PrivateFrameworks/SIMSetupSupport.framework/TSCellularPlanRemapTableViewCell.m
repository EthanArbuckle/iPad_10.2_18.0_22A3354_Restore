@implementation TSCellularPlanRemapTableViewCell

- (TSCellularPlanRemapTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSCellularPlanRemapTableViewCell *v4;
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
  void *v22;
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
  objc_super v42;
  _QWORD v43[6];

  v43[4] = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)TSCellularPlanRemapTableViewCell;
  v4 = -[TSCellularPlanRemapTableViewCell initWithStyle:reuseIdentifier:](&v42, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[TSCellularPlanRemapTableViewCell setTitleLabel:](v4, "setTitleLabel:", v6);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[TSCellularPlanRemapTableViewCell contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLayoutMargins:", 0.0, 25.0, 0.0, 25.0);

    -[TSCellularPlanRemapTableViewCell contentView](v4, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    v32 = (void *)MEMORY[0x24BDD1628];
    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell contentView](v4, "contentView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "scaledValueForValue:", 20.0);
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v36;
    -[TSCellularPlanRemapTableViewCell contentView](v4, "contentView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "scaledValueForValue:", 20.0);
    objc_msgSend(v33, "constraintEqualToAnchor:constant:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v29;
    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell contentView](v4, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "layoutMarginsGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v14;
    -[TSCellularPlanRemapTableViewCell titleLabel](v4, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell contentView](v4, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutMarginsGuide");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "scaledValueForValue:", -30.0);
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v22);

  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanRemapTableViewCell;
  -[TSCellularPlanRemapTableViewCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[TSCellularPlanRemapTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (UILabel)titleLabel
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTitleLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
