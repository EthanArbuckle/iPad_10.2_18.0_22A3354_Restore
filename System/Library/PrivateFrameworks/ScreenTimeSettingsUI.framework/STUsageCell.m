@implementation STUsageCell

- (STUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  STUsageCell *v9;
  STUsageCell *v10;
  void *v11;
  uint64_t v12;
  UIImageView *trustWarningImageView;
  void *v14;
  uint64_t v15;
  UILabel *itemNameLabel;
  void *v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UILabel *usageLabel;
  void *v24;
  void *v25;
  STCandyBarView *v26;
  STCandyBarView *usageBarView;
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
  uint64_t v59;
  NSLayoutConstraint *usageBarWidthConstraint;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  NSString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  objc_super v89;
  void *v90;
  _QWORD v91[3];

  v91[2] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v89.receiver = self;
  v89.super_class = (Class)STUsageCell;
  v9 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v89, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[STUsageCell contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("exclamationmark.triangle.fill"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v86);
    trustWarningImageView = v10->_trustWarningImageView;
    v10->_trustWarningImageView = (UIImageView *)v12;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemYellowColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10->_trustWarningImageView, "setTintColor:", v14);

    -[UIImageView setHidden:](v10->_trustWarningImageView, "setHidden:", 1);
    v15 = objc_opt_new();
    itemNameLabel = v10->_itemNameLabel;
    v10->_itemNameLabel = (UILabel *)v15;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_itemNameLabel, "setFont:", v17);

    LODWORD(v18) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v10->_itemNameLabel, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    v19 = objc_alloc(MEMORY[0x24BEBD978]);
    v91[0] = v10->_trustWarningImageView;
    v91[1] = v10->_itemNameLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v91, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithArrangedSubviews:", v20);

    objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v21, "setSpacing:", 1.17549435e-38);
    objc_msgSend(v11, "addSubview:", v21);
    v22 = objc_opt_new();
    usageLabel = v10->_usageLabel;
    v10->_usageLabel = (UILabel *)v22;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_usageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_usageLabel, "setFont:", v24);

    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_usageLabel, "setTextColor:", v25);

    objc_msgSend(v11, "addSubview:", v10->_usageLabel);
    v26 = -[STCandyBarView initWithVibrancy:]([STCandyBarView alloc], "initWithVibrancy:", 0);
    usageBarView = v10->_usageBarView;
    v10->_usageBarView = v26;

    -[STCandyBarView setTranslatesAutoresizingMaskIntoConstraints:](v10->_usageBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v28 = (void *)objc_opt_new();
    objc_msgSend(v28, "setTotalUsage:", &unk_24DBBED30);
    v87 = v8;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("STUsageBarColorKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v28, "setColor:", v29);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemGray4Color");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setColor:", v30);

    }
    v85 = v28;
    v90 = v28;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v90, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCandyBarView setUsageItems:](v10->_usageBarView, "setUsageItems:", v31);

    objc_msgSend(v11, "addSubview:", v10->_usageBarView);
    -[STTableCell contentLayoutGuide](v10, "contentLayoutGuide");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_opt_new();
    objc_msgSend(v11, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCandyBarView bottomAnchor](v10->_usageBarView, "bottomAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintGreaterThanOrEqualToAnchor:constant:", v34, 7.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v35);

    objc_msgSend(v11, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v10->_usageLabel, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:constant:", v37, 7.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v38);

    objc_msgSend(v21, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 7.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v41);

    objc_msgSend(v21, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCandyBarView topAnchor](v10->_usageBarView, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintLessThanOrEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v44);

    objc_msgSend(v21, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v10->_usageLabel, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintLessThanOrEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v47);

    -[STCandyBarView leadingAnchor](v10->_usageBarView, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leadingAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v50);

    -[STCandyBarView heightAnchor](v10->_usageBarView, "heightAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToConstant:", 5.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v52);

    -[STCandyBarView widthAnchor](v10->_usageBarView, "widthAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintGreaterThanOrEqualToConstant:", 5.0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v54);

    -[STCandyBarView bottomAnchor](v10->_usageBarView, "bottomAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintLessThanOrEqualToAnchor:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v57);

    -[STCandyBarView widthAnchor](v10->_usageBarView, "widthAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToConstant:", 5.0);
    v59 = objc_claimAutoreleasedReturnValue();
    usageBarWidthConstraint = v10->_usageBarWidthConstraint;
    v10->_usageBarWidthConstraint = (NSLayoutConstraint *)v59;

    LODWORD(v61) = 1132068864;
    -[NSLayoutConstraint setPriority:](v10->_usageBarWidthConstraint, "setPriority:", v61);
    objc_msgSend(v32, "addObject:", v10->_usageBarWidthConstraint);
    -[STCandyBarView centerYAnchor](v10->_usageBarView, "centerYAnchor");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "centerYAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "constraintEqualToAnchor:constant:", v63, 12.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v65) = 1144750080;
    objc_msgSend(v64, "setPriority:", v65);
    objc_msgSend(v32, "addObject:", v64);
    -[UILabel centerYAnchor](v10->_usageLabel, "centerYAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCandyBarView centerYAnchor](v10->_usageBarView, "centerYAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "constraintEqualToAnchor:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v68);

    -[UILabel leadingAnchor](v10->_usageLabel, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCandyBarView trailingAnchor](v10->_usageBarView, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v70, 6.0);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v71);

    -[UILabel trailingAnchor](v10->_usageLabel, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "constraintEqualToAnchor:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v75) = 1132068864;
    objc_msgSend(v74, "setPriority:", v75);
    objc_msgSend(v32, "addObject:", v74);
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
    v76 = (NSString *)objc_claimAutoreleasedReturnValue();
    LODWORD(v71) = UIContentSizeCategoryIsAccessibilityCategory(v76);

    objc_msgSend(v21, "leadingAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v71)
    {
      -[PSTableCell iconImageView](v10, "iconImageView");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "trailingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v79, 2.0);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v80);

    }
    else
    {
      objc_msgSend(v88, "leadingAnchor");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "constraintEqualToAnchor:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v79);
    }

    -[UIImageView widthAnchor](v10->_trustWarningImageView, "widthAnchor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v10->_trustWarningImageView, "heightAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "constraintEqualToAnchor:multiplier:", v82, 1.0);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v83);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v32);
    v8 = v87;
  }

  return v10;
}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUsageCell;
  -[PSTableCell value](&v3, sel_value);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  id *v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  objc_super v27;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageCell.m"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(usageItem == nil) || [usageItem isKindOfClass:[STUsageItem class]]"));

    }
  }
  -[STUsageCell value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)STUsageCell;
  -[PSTableCell setValue:](&v27, sel_setValue_, v5);
  v7 = objc_msgSend(v6, "itemType");
  v8 = (id *)MEMORY[0x24BE847C8];
  if (v7 == 4)
  {
    v9 = (id)*MEMORY[0x24BE847C8];
  }
  else
  {
    objc_msgSend(v6, "budgetItemIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v11 = objc_msgSend(v5, "itemType");
  if (v11 == 4)
  {
    v12 = *v8;
  }
  else
  {
    objc_msgSend(v5, "budgetItemIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
  if (v12 != v10)
  {
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 1;
    if (v7 <= 6 && ((1 << v7) & 0x74) != 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", v10) & 1) != 0)
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v14, "removeObserver:bundleIdentifier:", self, v10);
        if (v7 != 4)
          objc_msgSend(v15, "removeObserver:bundleIdentifier:", self, v10);
        v16 = 1;
      }
    }
    if (v11 <= 6 && ((1 << v11) & 0x74) != 0)
    {
      if (v16)
      {
        objc_msgSend(v14, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfoOrIcon_, v13);
        if (v11 != 4)
          objc_msgSend(v15, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfoOrIcon_, v13);
      }
    }

  }
  objc_msgSend(v5, "maxUsage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  if (v19 < 1.0)
    v19 = 1.0;
  objc_msgSend(v5, "totalUsage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21 / v19 * 198.0;

  if (v22 < 5.0)
    v22 = 5.0;
  -[STUsageCell usageBarWidthConstraint](self, "usageBarWidthConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setConstant:", v22);

  v24 = objc_msgSend(v5, "usageTrusted");
  -[STUsageCell trustWarningImageView](self, "trustWarningImageView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", v24);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUsageCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v9, sel_refreshCellContentsWithSpecifier_, a3);
  -[STUsageCell value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "budgetItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  -[STUsageCell itemNameLabel](self, "itemNameLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  -[PSTableCell setIcon:](self, "setIcon:", v7);
  -[STUsageCell setNeedsLayout](self, "setNeedsLayout");

}

- (void)_didFetchAppInfoOrIcon:(id)a3
{
  void *v4;
  void *v5;

  -[PSTableCell specifier](self, "specifier", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[STUsageCell refreshCellContentsWithSpecifier:](self, "refreshCellContentsWithSpecifier:", v4);
    v4 = v5;
  }

}

- (UILabel)itemNameLabel
{
  return self->_itemNameLabel;
}

- (STCandyBarView)usageBarView
{
  return self->_usageBarView;
}

- (UILabel)usageLabel
{
  return self->_usageLabel;
}

- (UIImageView)trustWarningImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1256, 1);
}

- (NSLayoutConstraint)usageBarWidthConstraint
{
  return self->_usageBarWidthConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageBarWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trustWarningImageView, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
  objc_storeStrong((id *)&self->_usageBarView, 0);
  objc_storeStrong((id *)&self->_itemNameLabel, 0);
}

@end
