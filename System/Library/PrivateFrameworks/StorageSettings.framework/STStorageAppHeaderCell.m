@implementation STStorageAppHeaderCell

+ (id)specifierForStorageApp:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = a3;
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_24C756F10, 0, 0, 0, 0, -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v5, "setProperty:forKey:", v4, CFSTR("stStorageApp"));

  return v5;
}

+ (id)specifierForAppIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BEB1C80];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  +[STStorageAppHeaderCell specifierForStorageApp:](STStorageAppHeaderCell, "specifierForStorageApp:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)specifierForAppProxy:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageAppHeaderCell specifierForAppIdentifier:](STStorageAppHeaderCell, "specifierForAppIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)specifierForAppBundleURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageAppHeaderCell specifierForAppIdentifier:](STStorageAppHeaderCell, "specifierForAppIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (STStorageAppHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  STStorageAppHeaderCell *v9;
  STStorageAppHeaderCell *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  UILabel *titleLabel;
  uint64_t v21;
  UILabel *infoLabel;
  void *v23;
  uint64_t v24;
  UILabel *vendorLabel;
  void *v26;
  uint64_t v27;
  UIImageView *appIconView;
  uint64_t v29;
  UIImageView *cloudIconView;
  void *v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  objc_super v39;
  _QWORD v40[4];
  _QWORD v41[6];

  v41[5] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v39.receiver = self;
  v39.super_class = (Class)STStorageAppHeaderCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v39, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[STStorageAppHeaderCell contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_infoHidden = objc_msgSend(v8, "versionLabelEnabled") ^ 1;
    v14 = objc_alloc(MEMORY[0x24BDF6B68]);
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v19 = objc_msgSend(v14, "initWithFrame:", *MEMORY[0x24BDBF090], v16, v17, v18);
    titleLabel = v10->_titleLabel;
    v10->_titleLabel = (UILabel *)v19;

    v38 = (void *)v12;
    -[UILabel setFont:](v10->_titleLabel, "setFont:", v12);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_titleLabel, "setAccessibilityIdentifier:", CFSTR("Title"));
    -[UILabel setNumberOfLines:](v10->_titleLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v10->_titleLabel, "setLineBreakMode:", 4);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v10->_titleLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v11, "addSubview:", v10->_titleLabel);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v15, v16, v17, v18);
    infoLabel = v10->_infoLabel;
    v10->_infoLabel = (UILabel *)v21;

    -[UILabel setFont:](v10->_infoLabel, "setFont:", v13);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_infoLabel, "setTextColor:", v23);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_infoLabel, "setAccessibilityIdentifier:", CFSTR("Info"));
    -[UILabel setNumberOfLines:](v10->_infoLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v10->_infoLabel, "setLineBreakMode:", 4);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v10->_infoLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v11, "addSubview:", v10->_infoLabel);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", v15, v16, v17, v18);
    vendorLabel = v10->_vendorLabel;
    v10->_vendorLabel = (UILabel *)v24;

    -[UILabel setFont:](v10->_vendorLabel, "setFont:", v13);
    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_vendorLabel, "setTextColor:", v26);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_vendorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_vendorLabel, "setAccessibilityIdentifier:", CFSTR("Creator"));
    -[UILabel setNumberOfLines:](v10->_vendorLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v10->_vendorLabel, "setLineBreakMode:", 4);
    -[UILabel setAllowsDefaultTighteningForTruncation:](v10->_vendorLabel, "setAllowsDefaultTighteningForTruncation:", 1);
    objc_msgSend(v11, "addSubview:", v10->_vendorLabel);
    v27 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v15, v16, v17, v18);
    appIconView = v10->_appIconView;
    v10->_appIconView = (UIImageView *)v27;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_appIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v10->_appIconView, "setAccessibilityIdentifier:", CFSTR("Icon"));
    -[UIImageView setContentMode:](v10->_appIconView, "setContentMode:", 1);
    objc_msgSend(v11, "addSubview:", v10->_appIconView);
    v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", v15, v16, v17, v18);
    cloudIconView = v10->_cloudIconView;
    v10->_cloudIconView = (UIImageView *)v29;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v10->_cloudIconView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setAccessibilityIdentifier:](v10->_cloudIconView, "setAccessibilityIdentifier:", CFSTR("CloudIcon"));
    -[UIImageView setContentMode:](v10->_cloudIconView, "setContentMode:", 1);
    -[UIImageView setHidden:](v10->_cloudIconView, "setHidden:", 1);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("icloud.and.arrow.down"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v10->_cloudIconView, "setImage:", v31);

    objc_msgSend(MEMORY[0x24BDF6950], "systemGray2Color");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v10->_cloudIconView, "setTintColor:", v32);

    objc_msgSend(v11, "addSubview:", v10->_cloudIconView);
    if (v10->_infoHidden)
    {
      v40[0] = v10->_titleLabel;
      v40[1] = v10->_vendorLabel;
      v40[2] = v10->_appIconView;
      v40[3] = v10->_cloudIconView;
      v33 = (void *)MEMORY[0x24BDBCE30];
      v34 = v40;
      v35 = 4;
    }
    else
    {
      v41[0] = v10->_titleLabel;
      v41[1] = v10->_infoLabel;
      v41[2] = v10->_vendorLabel;
      v41[3] = v10->_appIconView;
      v41[4] = v10->_cloudIconView;
      v33 = (void *)MEMORY[0x24BDBCE30];
      v34 = v41;
      v35 = 5;
    }
    objc_msgSend(v33, "arrayWithObjects:count:", v34, v35, 1249);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityElements:", v36);

    -[STStorageAppHeaderCell setNeedsUpdateConstraints](v10, "setNeedsUpdateConstraints");
    -[STStorageAppHeaderCell refreshCellContentsWithSpecifier:](v10, "refreshCellContentsWithSpecifier:", v8);

  }
  return v10;
}

- (void)updateConstraints
{
  UILabel *titleLabel;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *constraints;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  const __CFString *v11;
  NSMutableArray *v12;
  void *v13;
  NSMutableArray *v14;
  const __CFString *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  NSMutableArray *v21;
  void *v22;
  NSMutableArray *v23;
  void *v24;
  objc_super v25;

  titleLabel = self->_titleLabel;
  if (self->_infoHidden)
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _vendorLabel, _appIconView, _cloudIconView"), titleLabel, self->_vendorLabel, self->_appIconView, self->_cloudIconView, 0);
  else
    _NSDictionaryOfVariableBindings(CFSTR("_titleLabel, _infoLabel, _vendorLabel, _appIconView, _cloudIconView"), titleLabel, self->_infoLabel, self->_vendorLabel, self->_appIconView, self->_cloudIconView, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_constraints, "count"))
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v5;

  v7 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-15-[_appIconView(==58)]"), 0, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v7, "addObjectsFromArray:", v8);

  v9 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-16-[_appIconView(==58)]-(>=16)-|"), 0, 0, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v9, "addObjectsFromArray:", v10);

  if (self->_isDemoted)
    v11 = CFSTR("H:|-84-[_cloudIconView(==22)]-5-[_titleLabel]-(>=15)-|");
  else
    v11 = CFSTR("H:|-84-[_titleLabel]-15-|");
  v12 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v11, 0, 0, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:", v13);

  v14 = self->_constraints;
  if (self->_infoHidden)
    v15 = CFSTR("V:|-16-[_titleLabel]-2-[_vendorLabel]-(>=16)-|");
  else
    v15 = CFSTR("V:|-16-[_titleLabel]-2-[_infoLabel]-2-[_vendorLabel]-(>=16)-|");
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", v15, 0, 0, v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v14, "addObjectsFromArray:", v16);

  v17 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cloudIconView, 12, 0, self->_titleLabel, 12, 1.0, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v17, "addObject:", v18);

  v19 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_cloudIconView, 8, 0, 0, 0, 0.0, 22.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](v19, "addObject:", v20);

  if (!self->_infoHidden)
  {
    v21 = self->_constraints;
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-84-[_infoLabel]-15-|"), 0, 0, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](v21, "addObjectsFromArray:", v22);

  }
  v23 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-84-[_vendorLabel]-15-|"), 0, 0, v4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v23, "addObjectsFromArray:", v24);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  v25.receiver = self;
  v25.super_class = (Class)STStorageAppHeaderCell;
  -[STStorageAppHeaderCell updateConstraints](&v25, sel_updateConstraints);

}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  _QWORD v19[5];
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STStorageAppHeaderCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v20, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stStorageApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isDemoted");
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Health"));

    if (v9 && objc_msgSend(v6, "isDemoted"))
    {
      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageForKey:", *MEMORY[0x24BE757D8]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[STStorageAppHeaderCell setIcon:](self, "setIcon:", v11);
      v7 = 0;
    }
    -[STStorageAppHeaderCell icon](self, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __59__STStorageAppHeaderCell_refreshCellContentsWithSpecifier___block_invoke;
      v19[3] = &unk_24C756978;
      v19[4] = self;
      STLoadHeaderIconForApp(v6, v19);
    }
    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STStorageAppHeaderCell setTitle:](self, "setTitle:", v13);

    if ((objc_msgSend(v4, "versionLabelEnabled") & 1) != 0)
    {
      objc_msgSend(v6, "versionString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[STStorageAppHeaderCell setInfo:](self, "setInfo:", v14);

    }
    else
    {
      -[STStorageAppHeaderCell setInfo:](self, "setInfo:", 0);
    }
    objc_msgSend(v6, "vendorName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v6, "appIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hasPrefix:", CFSTR("com.apple."));

      if (v17)
      {
        v18 = (id)*MEMORY[0x24BEB1D28];

        v15 = v18;
      }
    }
    -[STStorageAppHeaderCell setVendor:](self, "setVendor:", v15);
    if (self->_isDemoted != v7)
    {
      self->_isDemoted = v7;
      -[STStorageAppHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    }
    -[UIImageView setHidden:](self->_cloudIconView, "setHidden:", v7 ^ 1u);

  }
  -[STStorageAppHeaderCell setNeedsDisplay](self, "setNeedsDisplay");

}

uint64_t __59__STStorageAppHeaderCell_refreshCellContentsWithSpecifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIcon:", a2);
}

- (void)setIcon:(id)a3
{
  -[UIImageView setImage:](self->_appIconView, "setImage:", a3);
}

- (UIImage)icon
{
  return -[UIImageView image](self->_appIconView, "image");
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
    v4 = v5;
  else
    v4 = 0;
  -[UILabel setText:](self->_titleLabel, "setText:", v4);

}

- (NSString)title
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UILabel text](self->_titleLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C756F10;
  v4 = v2;

  return v4;
}

- (void)setVendor:(id)a3
{
  -[UILabel setText:](self->_vendorLabel, "setText:", a3);
}

- (NSString)vendor
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UILabel text](self->_vendorLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C756F10;
  v4 = v2;

  return v4;
}

- (void)setInfo:(id)a3
{
  -[UILabel setText:](self->_infoLabel, "setText:", a3);
}

- (NSString)info
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[UILabel text](self->_infoLabel, "text");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_24C756F10;
  v4 = v2;

  return v4;
}

- (BOOL)infoHidden
{
  return self->_infoHidden;
}

- (void)setInfoHidden:(BOOL)a3
{
  self->_infoHidden = a3;
  -[STStorageAppHeaderCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIconView, 0);
  objc_storeStrong((id *)&self->_appIconView, 0);
  objc_storeStrong((id *)&self->_vendorLabel, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
