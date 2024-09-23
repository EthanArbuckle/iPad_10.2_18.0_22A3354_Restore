@implementation STDrillInGraphCell

- (STDrillInGraphCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v9;
  STDrillInGraphCell *v10;
  uint64_t v11;
  STUsageItem *usageItem;
  void *v13;
  uint64_t v14;
  UILabel *usageLabel;
  void *v16;
  void *v17;
  STUsageGraphViewController *v18;
  STUsageGraphViewController *usageGraphViewController;
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
  id v49;
  objc_super v50;
  _QWORD v51[8];

  v51[6] = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v50.receiver = self;
  v50.super_class = (Class)STDrillInGraphCell;
  v10 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v50, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, v9);
  if (v10)
  {
    v49 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SpecifierKeyDrillInItem"));
    v11 = objc_claimAutoreleasedReturnValue();
    usageItem = v10->_usageItem;
    v10->_usageItem = (STUsageItem *)v11;

    if (!v10->_usageItem)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("STDrillInGraphCell.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_usageItem"));

    }
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v14 = objc_opt_new();
    usageLabel = v10->_usageLabel;
    v10->_usageLabel = (UILabel *)v14;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v10->_usageLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE210]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10->_usageLabel, "setFont:", v16);

    objc_msgSend(v13, "addSubview:", v10->_usageLabel);
    v17 = v13;
    v18 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:]([STUsageGraphViewController alloc], "initWithTitleView:graphHeight:includePaddle:useVibrancy:", v13, 1, 0, 90.0);
    usageGraphViewController = v10->_usageGraphViewController;
    v10->_usageGraphViewController = v18;

    -[STUsageGraphViewController view](v10->_usageGraphViewController, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[STTableCell childViewControllers](v10, "childViewControllers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v10->_usageGraphViewController);

    -[STUsageGraphViewController view](v10->_usageGraphViewController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDrillInGraphCell contentView](v10, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v22);
    -[STTableCell contentLayoutGuide](v10, "contentLayoutGuide");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)MEMORY[0x24BDD1628];
    -[UILabel leadingAnchor](v10->_usageLabel, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v17;
    objc_msgSend(v17, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v45;
    -[UILabel bottomAnchor](v10->_usageLabel, "bottomAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v41;
    objc_msgSend(v22, "centerXAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v23;
    objc_msgSend(v23, "centerXAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v36;
    objc_msgSend(v22, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "widthAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v51[3] = v24;
    objc_msgSend(v22, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, 18.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51[4] = v27;
    objc_msgSend(v23, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v29, 2.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v51[5] = v30;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v31);

    v9 = v49;
  }

  return v10;
}

- (void)setValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  objc_super v43;

  v4 = a3;
  -[PSTableCell value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v43.receiver = self;
  v43.super_class = (Class)STDrillInGraphCell;
  -[PSTableCell setValue:](&v43, sel_setValue_, v4);
  -[STDrillInGraphCell usageItem](self, "usageItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSetWithUsageItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "itemType");
  if ((unint64_t)(v8 - 1) < 4)
  {
    -[STDrillInGraphCell usageLabel](self, "usageLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributedText:", 0);
    objc_msgSend(v7, "total");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;
    if (v11 >= 60.0)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setAllowedUnits:", 96);
      objc_msgSend(v13, "setUnitsStyle:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v13, "stringFromTimeInterval:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setText:", v25);
LABEL_13:

    goto LABEL_14;
  }
  if (v8 == 6)
  {
    objc_msgSend(v4, "dateIntervals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    objc_msgSend(v6, "totalUsage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = (double)v15;
    if (!v15)
      v18 = 1.0;
    v19 = v17 / v18;

    v40 = v5;
    v20 = (unint64_t)fmin(round(v19), 1.84467441e19);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v6;
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PickupsCount"), &stru_24DB8A1D0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringWithFormat:", v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "type") == 1)
      v24 = CFSTR("HourlyPickupsFormat");
    else
      v24 = CFSTR("DailyPickupsFormat");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v24, &stru_24DB8A1D0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v25, v20, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[STDrillInGraphCell usageLabel](self, "usageLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setText:", 0);
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE210]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)MEMORY[0x24BDD1688];
    v42 = v27;
    v10 = v23;
    v29 = v26;
    v30 = (void *)objc_msgSend([v28 alloc], "initWithString:", v29);
    objc_msgSend(v30, "beginEditing");
    v31 = *MEMORY[0x24BEBB360];
    objc_msgSend(v30, "addAttribute:value:range:", *MEMORY[0x24BEBB360], v38, 0, objc_msgSend(v29, "length"));
    v32 = objc_msgSend(v29, "rangeOfString:", v10);
    v37 = v33;

    v34 = v31;
    v6 = v41;
    v35 = v32;
    v5 = v40;
    objc_msgSend(v30, "addAttribute:value:range:", v34, v42, v35, v37);

    objc_msgSend(v30, "endEditing");
    objc_msgSend(v39, "setAttributedText:", v30);

    goto LABEL_13;
  }
LABEL_14:
  -[STDrillInGraphCell usageGraphViewController](self, "usageGraphViewController");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setDataSet:animated:", v7, v5 != 0);

}

- (UILabel)usageLabel
{
  return self->_usageLabel;
}

- (STUsageGraphViewController)usageGraphViewController
{
  return self->_usageGraphViewController;
}

- (STUsageItem)usageItem
{
  return self->_usageItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageItem, 0);
  objc_storeStrong((id *)&self->_usageGraphViewController, 0);
  objc_storeStrong((id *)&self->_usageLabel, 0);
}

@end
