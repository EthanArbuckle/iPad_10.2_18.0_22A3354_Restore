@implementation SCLUnlockCountTableViewCell

- (SCLUnlockCountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SCLUnlockCountTableViewCell *v5;
  SCLUnlockCountTableViewCell *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SCLUnlockCountTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v10, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[SCLUnlockCountTableViewCell detailTextLabel](v5, "detailTextLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[SCLUnlockCountTableViewCell textLabel](v6, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumberOfLines:", 0);

  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCLUnlockCountTableViewCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v8, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0], v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLUnlockCountTableViewCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLUnlockCountTableViewCell attributedStringForUnlockCount:](self, "attributedStringForUnlockCount:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedText:", v7);

}

- (id)attributedStringForUnlockCount:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16F0];
  v4 = a3;
  objc_msgSend(v3, "localizedStringFromNumber:numberStyle:", v4, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DAILY_UNLOCK_COUNT"), &stru_24E712518, CFSTR("StringsDict"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v7, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%lu"), 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BEBB360];
  v10 = v27;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v11;
  v28 = *MEMORY[0x24BEBB368];
  v12 = v28;
  objc_msgSend(MEMORY[0x24BDF6950], "tableCellGrayTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v27, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:attributes:", v9, v14);
  v16 = (void *)v5;
  v17 = objc_msgSend(v9, "rangeOfString:", v5);
  v19 = v18;
  v25[0] = v10;
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF7800]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  v26[0] = v20;
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAttributes:range:", v22, v17, v19);
  return v15;
}

@end
