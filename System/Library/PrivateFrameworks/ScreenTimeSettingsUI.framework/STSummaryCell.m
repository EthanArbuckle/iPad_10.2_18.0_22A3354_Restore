@implementation STSummaryCell

- (STSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STSummaryCell *v5;
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *v6;
  _TtC20ScreenTimeSettingsUI27STSummaryCellViewController *summaryCellViewController;
  void *v8;
  void *v9;
  void *v10;
  STNoUsageDataView *v11;
  uint64_t v12;
  STNoUsageDataView *noUsageDataView;
  void *v14;
  NSString *v15;
  _BOOL4 IsAccessibilityCategory;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  objc_super v58;
  _QWORD v59[13];

  v59[11] = *MEMORY[0x24BDAC8D0];
  v58.receiver = self;
  v58.super_class = (Class)STSummaryCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v58, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = -[STSummaryCellViewController initWithUserAltDSID:deviceIdentifier:]([_TtC20ScreenTimeSettingsUI27STSummaryCellViewController alloc], "initWithUserAltDSID:deviceIdentifier:", 0, 0);
  summaryCellViewController = v5->_summaryCellViewController;
  v5->_summaryCellViewController = v6;

  -[STTableCell childViewControllers](v5, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5->_summaryCellViewController);

  -[STSummaryCellViewController view](v5->_summaryCellViewController, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STSummaryCell contentView](v5, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);
  v11 = [STNoUsageDataView alloc];
  v12 = -[STNoUsageDataView initWithPreferredFontTextStyle:](v11, "initWithPreferredFontTextStyle:", *MEMORY[0x24BEBE220]);
  noUsageDataView = v5->_noUsageDataView;
  v5->_noUsageDataView = (STNoUsageDataView *)v12;

  -[STNoUsageDataView setTranslatesAutoresizingMaskIntoConstraints:](v5->_noUsageDataView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STNoUsageDataView setHidden:](v5->_noUsageDataView, "setHidden:", 1);
  objc_msgSend(v10, "addSubview:", v5->_noUsageDataView);
  -[STSummaryCellViewController traitCollection](v5->_summaryCellViewController, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v15);

  -[STTableCell contentLayoutGuide](v5, "contentLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v9, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v18;
  v19 = 182.0;
  if (IsAccessibilityCategory)
    v19 = 300.0;
  objc_msgSend(v18, "constraintEqualToConstant:", v19);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v56;
  objc_msgSend(v9, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v54, 2.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v53;
  objc_msgSend(v9, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v49;
  v52 = v9;
  objc_msgSend(v9, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v59[3] = v46;
  objc_msgSend(v10, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v43, 2.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v59[4] = v42;
  -[STNoUsageDataView topAnchor](v5->_noUsageDataView, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v59[5] = v38;
  -[STNoUsageDataView leadingAnchor](v5->_noUsageDataView, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v17;
  objc_msgSend(v17, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v59[6] = v34;
  -[STNoUsageDataView bottomAnchor](v5->_noUsageDataView, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v10;
  objc_msgSend(v10, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v59[7] = v31;
  -[STNoUsageDataView trailingAnchor](v5->_noUsageDataView, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59[8] = v21;
  -[STNoUsageDataView centerXAnchor](v5->_noUsageDataView, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v59[9] = v24;
  -[STNoUsageDataView centerYAnchor](v5->_noUsageDataView, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v59[10] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "activateConstraints:", v28);

  return v5;
}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STSummaryCell;
  -[PSTableCell value](&v3, sel_value);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setValue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STSummaryCell;
  -[PSTableCell value](&v18, sel_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport"), "KVOContextSTSummaryCell");
  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_2550E9DC8) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STSummaryCell.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STRootViewModelCoordinator)]"));

  }
  v17.receiver = self;
  v17.super_class = (Class)STSummaryCell;
  -[PSTableCell setValue:](&v17, sel_setValue_, v5);
  objc_msgSend(v5, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "me");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "altDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "usageDetailsCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedCoreDuetIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE84580], "deviceIdentifierByCoreDuetIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    -[STSummaryCell summaryCellViewController](self, "summaryCellViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateWithUserAltDSID:deviceIdentifier:", v9, v14);

  }
  else
  {
    -[STSummaryCell summaryCellViewController](self, "summaryCellViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateWithUserAltDSID:deviceIdentifier:", 0, 0);
  }

  objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport"), 5, "KVOContextSTSummaryCell");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v16;

  v10 = a5;
  if (a6 == "KVOContextSTSummaryCell")
  {
    v12 = a3;
    -[STSummaryCell value](self, "value");

    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport"));
    if (v13)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STSummaryCell _selectedUsageReportDidChange:](self, "_selectedUsageReportDidChange:", v14);

    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)STSummaryCell;
    v11 = a3;
    -[STSummaryCell observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v11, a4, v10, a6);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[STSummaryCell value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSummaryCell value](self, "value");

  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedWeekUsageReport"), "KVOContextSTSummaryCell");
  v4.receiver = self;
  v4.super_class = (Class)STSummaryCell;
  -[PSTableCell dealloc](&v4, sel_dealloc);
}

- (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController)summaryCellViewController
{
  return (_TtC20ScreenTimeSettingsUI27STSummaryCellViewController *)objc_getProperty(self, a2, 1232, 1);
}

- (STNoUsageDataView)noUsageDataView
{
  return (STNoUsageDataView *)objc_getProperty(self, a2, 1240, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noUsageDataView, 0);
  objc_storeStrong((id *)&self->_summaryCellViewController, 0);
}

@end
