@implementation TSCellularPlanItemCell

- (TSCellularPlanItemCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TSCellularPlanItemCell *v4;
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
  void *v36;
  void *v37;
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
  objc_super v78;
  _QWORD v79[9];

  v79[7] = *MEMORY[0x24BDAC8D0];
  v78.receiver = self;
  v78.super_class = (Class)TSCellularPlanItemCell;
  v4 = -[TSCellularPlanItemCell initWithStyle:reuseIdentifier:](&v78, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BEBD708]);
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v10 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], v7, v8, v9);
    -[TSCellularPlanItemCell setTitle:](v4, "setTitle:", v10);

    objc_msgSend(MEMORY[0x24BEBB520], "boldSystemFontOfSize:", 17.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell title](v4, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    -[TSCellularPlanItemCell title](v4, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 0);

    -[TSCellularPlanItemCell title](v4, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", v6, v7, v8, v9);
    -[TSCellularPlanItemCell setPlanInfo:](v4, "setPlanInfo:", v15);

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 17.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFont:", v16);

    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNumberOfLines:", 0);

    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);

    -[TSCellularPlanItemCell setSeparatorInset:](v4, "setSeparatorInset:", 0.0, 50.0, 0.0, 0.0);
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLayoutMargins:", 0.0, 0.0, 0.0, 40.0);

    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell title](v4, "title");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSubview:", v26);

    v60 = (void *)MEMORY[0x24BDD1628];
    -[TSCellularPlanItemCell title](v4, "title");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "topAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "layoutMarginsGuide");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "topAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "scaledValueForValue:", 0.0);
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v72);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = v71;
    -[TSCellularPlanItemCell title](v4, "title");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "leadingAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "layoutMarginsGuide");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "leadingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "scaledValueForValue:", 30.0);
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v65);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v64;
    -[TSCellularPlanItemCell title](v4, "title");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "trailingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "layoutMarginsGuide");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "scaledValueForValue:", 24.0);
    objc_msgSend(v59, "constraintEqualToAnchor:constant:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v79[2] = v56;
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell title](v4, "title");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v52);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v79[3] = v51;
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "layoutMarginsGuide");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scaledValueForValue:", 30.0);
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v79[4] = v44;
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "trailingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "layoutMarginsGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "trailingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scaledValueForValue:", 24.0);
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v79[5] = v28;
    -[TSCellularPlanItemCell contentView](v4, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanItemCell planInfo](v4, "planInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD5F0], "defaultMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scaledValueForValue:", 13.0);
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v79[6] = v34;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 7);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "activateConstraints:", v35);

    v36 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setBackgroundColor:", v37);

    -[TSCellularPlanItemCell setSelectedBackgroundView:](v4, "setSelectedBackgroundView:", v36);
  }
  return v4;
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanItemCell;
  -[TSCellularPlanItemCell setSelected:animated:](&v5, sel_setSelected_animated_, a3, a4);
  -[TSCellularPlanItemCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setIcon:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[TSCellularPlanItemCell imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("simcard");
  else
    v6 = CFSTR("esim");
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

  -[TSCellularPlanItemCell imageView](self, "imageView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v8);

}

- (void)setDisable
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TSCellularPlanItemCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[TSCellularPlanItemCell title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  -[TSCellularPlanItemCell planInfo](self, "planInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[TSCellularPlanItemCell imageView](self, "imageView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (UILabel)title
{
  return (UILabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UILabel)planInfo
{
  return (UILabel *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setPlanInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
