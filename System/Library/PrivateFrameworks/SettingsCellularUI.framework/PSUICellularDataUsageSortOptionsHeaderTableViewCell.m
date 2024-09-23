@implementation PSUICellularDataUsageSortOptionsHeaderTableViewCell

- (PSUICellularDataUsageSortOptionsHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  PSUICellularDataUsageSortOptionsHeaderTableViewCell *v9;
  uint64_t v10;
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
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v8 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PSUICellularDataUsageSortOptionsHeaderTableViewCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v29, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  if (v9)
  {
    v10 = *MEMORY[0x24BEBE1F0];
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](v9, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell valueLabel](v9, "valueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTextColor:", v13);

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell valueLabel](v9, "valueLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFont:", v15);

    -[PSTableCell valueLabel](v9, "valueLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInteractionEnabled:", 1);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", v9, sel_changeSortTapped_);
    objc_msgSend(v18, "setNumberOfTapsRequired:", 1);
    -[PSTableCell valueLabel](v9, "valueLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addGestureRecognizer:", v18);

    -[PSTableCell valueLabel](v9, "valueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNumberOfLines:", 0);

    -[PSTableCell valueLabel](v9, "valueLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = 1144750080;
    objc_msgSend(v21, "setContentCompressionResistancePriority:forAxis:", 0, v22);

    -[PSTableCell valueLabel](v9, "valueLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSUICellularDataUsageSortOptionsHeaderTableViewCell contentView](v9, "contentView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "widthAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:multiplier:", v26, 0.4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setActive:", 1);

    -[PSUICellularDataUsageSortOptionsHeaderTableViewCell refreshCellContentsWithSpecifier:](v9, "refreshCellContentsWithSpecifier:", v8);
  }

  return v9;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PSUICellularDataUsageSortOptionsHeaderTableViewCell;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v19, sel_refreshCellContentsWithSpecifier_, a3);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", 0x24D506768);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPS_BY_NAME"), &stru_24D5028C8, CFSTR("Cellular"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](self, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v8);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SORT_BY_USAGE");
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPS_BY_USAGE"), &stru_24D5028C8, CFSTR("Cellular"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSTableCell titleLabel](self, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("SORT_BY_NAME");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24D5028C8, CFSTR("Cellular"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell valueLabel](self, "valueLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v15);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSTableCell valueLabel](self, "valueLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTextColor:", v17);

}

- (void)changeSortTapped:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", 0x24D506768) ^ 1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBool:forKey:", v4, 0x24D506768);

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_22);
}

void __72__PSUICellularDataUsageSortOptionsHeaderTableViewCell_changeSortTapped___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x24BE856D8], 0);

}

@end
