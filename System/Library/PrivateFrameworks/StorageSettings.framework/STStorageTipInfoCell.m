@implementation STStorageTipInfoCell

- (STStorageTipInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  STStorageTipInfoCell *v9;
  STStorageTipInfoCell *v10;
  void *v11;
  id v12;
  uint64_t v13;
  UILabel *infoLabel;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STStorageTipInfoCell;
  v9 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v19, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    -[STStorageTipInfoCell contentView](v9, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x24BDF6B68]);
    v13 = objc_msgSend(v12, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    infoLabel = v10->_infoLabel;
    v10->_infoLabel = (UILabel *)v13;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_infoLabel, "setFont:", v15);

    objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10->_infoLabel, "setTextColor:", v16);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v10->_infoLabel, "setAccessibilityIdentifier:", CFSTR("Info"));
    -[UILabel setNumberOfLines:](v10->_infoLabel, "setNumberOfLines:", 0);
    -[UILabel setLineBreakMode:](v10->_infoLabel, "setLineBreakMode:", 0);
    objc_msgSend(v11, "addSubview:", v10->_infoLabel);
    v20[0] = v10->_infoLabel;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityElements:", v17);

    -[STStorageTipInfoCell refreshCellContentsWithSpecifier:](v10, "refreshCellContentsWithSpecifier:", v8);
  }

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  int v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)STStorageTipInfoCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v22, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", CFSTR("stInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("stTipKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("stActionTip"));

  objc_msgSend(v4, "propertyForKey:", CFSTR("stSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v4, "propertyForKey:", CFSTR("stImmediateGain"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  objc_msgSend(v4, "propertyForKey:", CFSTR("stEventualGain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "unsignedLongLongValue");
  if (v9)
    v14 = v9;
  else
    v14 = v11;
  if (v13 <= 0x3E8)
    v15 = 0;
  else
    v15 = v13;
  if (v15 + v14 >= 0x3E9)
  {
    STFormattedSize();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 > 0x3E8)
      v17 = 1;
    else
      v17 = v7;
    if (v17)
      v18 = CFSTR("ST_UPTO_INFO_FMT %@ %@");
    else
      v18 = CFSTR("ST_SIZE_INFO_FMT %@ %@");
    v19 = (void *)MEMORY[0x24BDD17C8];
    STFrameworkLocStr(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v16, v5, v22.receiver, v22.super_class);
    v21 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v21;
  }
  -[UILabel setText:](self->_infoLabel, "setText:", v5);
  -[STStorageTipInfoCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[STStorageTipInfoCell setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)updateConstraints
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *constraints;
  NSMutableArray *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  objc_super v10;

  _NSDictionaryOfVariableBindings(CFSTR("_infoLabel"), self->_infoLabel, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_constraints, "count"))
    objc_msgSend(MEMORY[0x24BDD1628], "deactivateConstraints:", self->_constraints);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  constraints = self->_constraints;
  self->_constraints = v4;

  v6 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-60-[_infoLabel]-10-|"), 0, 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v7);

  v8 = self->_constraints;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-10-[_infoLabel]-10-|"), 0, 0, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_constraints);
  v10.receiver = self;
  v10.super_class = (Class)STStorageTipInfoCell;
  -[STStorageTipInfoCell updateConstraints](&v10, sel_updateConstraints);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
