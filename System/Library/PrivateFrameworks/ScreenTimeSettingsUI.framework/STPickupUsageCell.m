@implementation STPickupUsageCell

- (STPickupUsageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STPickupUsageCell *v5;
  STPickupUsageCell *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STPickupUsageCell;
  v5 = -[STUsageCell initWithStyle:reuseIdentifier:specifier:](&v13, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[STPickupUsageCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "trailingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUsageCell usageLabel](v6, "usageLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v10, 2.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setActive:", 1);

  }
  return v6;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STPickupUsageCell;
  v4 = a3;
  -[STUsageCell setValue:](&v11, sel_setValue_, v4);
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PickupsCount"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "totalUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedStringWithFormat:", v7, objc_msgSend(v8, "unsignedIntegerValue"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageCell usageLabel](self, "usageLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

}

@end
