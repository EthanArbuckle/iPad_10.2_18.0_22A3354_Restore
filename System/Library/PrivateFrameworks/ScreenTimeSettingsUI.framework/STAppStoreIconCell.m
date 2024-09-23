@implementation STAppStoreIconCell

- (STAppStoreIconCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STAppStoreIconCell *v5;
  STAppStoreIconCell *v6;
  void *v7;
  uint64_t v8;
  UIImageView *appIconView;
  uint64_t v10;
  UILabel *nameLabel;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  objc_super v45;
  _QWORD v46[11];

  v46[9] = *MEMORY[0x24BDAC8D0];
  v45.receiver = self;
  v45.super_class = (Class)STAppStoreIconCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v45, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[STAppStoreIconCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_new();
    appIconView = v6->_appIconView;
    v6->_appIconView = (UIImageView *)v8;

    -[UIImageView setContentMode:](v6->_appIconView, "setContentMode:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v6->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v7, "addSubview:", v6->_appIconView);
    v10 = objc_opt_new();
    nameLabel = v6->_nameLabel;
    v6->_nameLabel = (UILabel *)v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_nameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_nameLabel, "setFont:", v12);

    objc_msgSend(v7, "addSubview:", v6->_nameLabel);
    -[UIImageView heightAnchor](v6->_appIconView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToConstant:", 44.0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v14) = 1144750080;
    objc_msgSend(v44, "setPriority:", v14);
    -[STTableCell contentLayoutGuide](v6, "contentLayoutGuide");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)MEMORY[0x24BDD1628];
    v46[0] = v44;
    -[UIImageView topAnchor](v6->_appIconView, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v42, 1.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v40;
    -[UIImageView leadingAnchor](v6->_appIconView, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v37;
    objc_msgSend(v7, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView bottomAnchor](v6->_appIconView, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v35, 1.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v34;
    -[UIImageView widthAnchor](v6->_appIconView, "widthAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](v6->_appIconView, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v30;
    -[UIImageView centerYAnchor](v6->_appIconView, "centerYAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v7;
    objc_msgSend(v7, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v26;
    -[UILabel leadingAnchor](v6->_nameLabel, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v6->_appIconView, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v15, 2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v16;
    -[UILabel centerYAnchor](v6->_nameLabel, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView centerYAnchor](v6->_appIconView, "centerYAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = v19;
    -[UILabel trailingAnchor](v6->_nameLabel, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintLessThanOrEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46[8] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v23);

  }
  return v6;
}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STAppStoreIconCell;
  -[PSTableCell value](&v3, sel_value);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  id v5;
  unint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAppStoreIconCell.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(usageItem == nil) || [usageItem isKindOfClass:[STUsageItem class]]"));

    }
  }
  v6 = objc_msgSend(v5, "itemType");
  if (v6 > 6 || ((1 << v6) & 0x54) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STAppStoreIconCell.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isAppItem || (itemType == STUsageItemTypeWebsite)"));

  }
  -[STAppStoreIconCell value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15.receiver = self;
  v15.super_class = (Class)STAppStoreIconCell;
  -[PSTableCell setValue:](&v15, sel_setValue_, v5);
  objc_msgSend(v5, "budgetItemIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "budgetItemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v11)
  {
    objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "itemType") & 0xFFFFFFFFFFFFFFFBLL) == 2)
    {
      if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
      {
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(v12, "removeObserver:bundleIdentifier:", self, v11);
      objc_msgSend(v13, "removeObserver:bundleIdentifier:", self, v11);
    }
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 2)
    {
      objc_msgSend(v12, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfoOrIcon_, v10);
      objc_msgSend(v13, "addObserver:selector:bundleIdentifier:", self, sel__didFetchAppInfoOrIcon_, v10);
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STAppStoreIconCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v13, sel_refreshCellContentsWithSpecifier_, a3);
  -[STAppStoreIconCell value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "budgetItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "itemType") == 4)
    {
      objc_msgSend(v4, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appInfoForBundleIdentifier:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageForBundleIdentifier:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  -[STAppStoreIconCell nameLabel](self, "nameLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v6);

  -[STAppStoreIconCell appIconView](self, "appIconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImage:", v7);

  -[STAppStoreIconCell setNeedsLayout](self, "setNeedsLayout");
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
    -[STAppStoreIconCell refreshCellContentsWithSpecifier:](self, "refreshCellContentsWithSpecifier:", v4);
    v4 = v5;
  }

}

- (UIImageView)appIconView
{
  return self->_appIconView;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
}

@end
