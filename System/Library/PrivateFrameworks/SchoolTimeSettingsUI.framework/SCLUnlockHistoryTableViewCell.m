@implementation SCLUnlockHistoryTableViewCell

- (SCLUnlockHistoryTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  SCLUnlockHistoryTableViewCell *v5;
  SCLUnlockHistoryTableViewCell *v6;
  void *v7;
  void *v8;
  SCLHistoryItemView *v9;
  void *v10;
  uint64_t v11;
  SCLHistoryItemView *historyItemView;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
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
  objc_super v36;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v36.receiver = self;
  v36.super_class = (Class)SCLUnlockHistoryTableViewCell;
  v5 = -[PSTableCell initWithStyle:reuseIdentifier:specifier:](&v36, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[SCLUnlockHistoryTableViewCell textLabel](v5, "textLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 1);

    -[SCLUnlockHistoryTableViewCell detailTextLabel](v6, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 1);

    v9 = [SCLHistoryItemView alloc];
    -[SCLUnlockHistoryTableViewCell contentView](v6, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v11 = -[SCLHistoryItemView initWithFrame:](v9, "initWithFrame:");
    historyItemView = v6->_historyItemView;
    v6->_historyItemView = (SCLHistoryItemView *)v11;

    -[SCLHistoryItemView setTranslatesAutoresizingMaskIntoConstraints:](v6->_historyItemView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SCLUnlockHistoryTableViewCell contentView](v6, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addSubview:", v6->_historyItemView);

    v14 = objc_alloc(MEMORY[0x24BDF6A80]);
    v15 = (void *)objc_msgSend(v14, "initForTextStyle:", *MEMORY[0x24BDF77B0]);
    -[SCLUnlockHistoryTableViewCell contentView](v6, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLHistoryItemView bottomAnchor](v6->_historyItemView, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "setIdentifier:", CFSTR("contentView.bottom"));
    LODWORD(v20) = 1148829696;
    objc_msgSend(v19, "setPriority:", v20);
    -[SCLHistoryItemView leadingAnchor](v6->_historyItemView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryTableViewCell contentView](v6, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setIdentifier:", CFSTR("contentView.leading"));
    -[SCLHistoryItemView firstBaselineAnchor](v6->_historyItemView, "firstBaselineAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryTableViewCell contentView](v6, "contentView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scaledValueForValue:", 30.0);
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "setIdentifier:", CFSTR("historyView.baselineDifference"));
    -[SCLHistoryItemView trailingAnchor](v6->_historyItemView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCLUnlockHistoryTableViewCell contentView](v6, "contentView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setIdentifier:", CFSTR("contentView.trailing"));
    v33 = (void *)MEMORY[0x24BDD1628];
    v37[0] = v28;
    v37[1] = v19;
    v37[2] = v24;
    v37[3] = v32;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "activateConstraints:", v34);

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
  v8.super_class = (Class)SCLUnlockHistoryTableViewCell;
  v4 = a3;
  -[PSTableCell refreshCellContentsWithSpecifier:](&v8, sel_refreshCellContentsWithSpecifier_, v4);
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0], v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCLUnlockHistoryTableViewCell historyItemView](self, "historyItemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHistoryGroup:", v5);

  -[SCLUnlockHistoryTableViewCell historyItemView](self, "historyItemView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

}

- (SCLHistoryItemView)historyItemView
{
  return self->_historyItemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyItemView, 0);
}

@end
