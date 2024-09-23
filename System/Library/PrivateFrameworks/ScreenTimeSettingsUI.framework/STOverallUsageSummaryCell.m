@implementation STOverallUsageSummaryCell

- (STOverallUsageSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STOverallUsageSummaryCell *v5;
  STUsageSummaryTitleView *v6;
  STUsageSummaryTitleView *titleView;
  STUsageGraphViewController *v8;
  STUsageGraphViewController *weekGraphViewController;
  void *v10;
  STUsageReportGraphDataSet *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  STNoUsageDataView *v16;
  uint64_t v17;
  STNoUsageDataView *noUsageDataView;
  void *v19;
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
  id v56;
  objc_super v57;
  _QWORD v58[12];

  v58[10] = *MEMORY[0x24BDAC8D0];
  v57.receiver = self;
  v57.super_class = (Class)STOverallUsageSummaryCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v57, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  v6 = -[STUsageSummaryTitleView initWithVibrancy:usageItemType:truncateAverageLabel:]([STUsageSummaryTitleView alloc], "initWithVibrancy:usageItemType:truncateAverageLabel:", 0, 1, 0);
  titleView = v5->_titleView;
  v5->_titleView = v6;

  -[STUsageSummaryTitleView setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v8 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:]([STUsageGraphViewController alloc], "initWithTitleView:graphHeight:includePaddle:useVibrancy:", v5->_titleView, 1, 0, 90.0);
  weekGraphViewController = v5->_weekGraphViewController;
  v5->_weekGraphViewController = v8;

  -[STUsageGraphViewController view](v5->_weekGraphViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = [STUsageReportGraphDataSet alloc];
  v12 = (void *)objc_opt_new();
  v56 = -[STUsageReportGraphDataSet initEmptyDataSetWithTimePeriod:referenceDate:](v11, "initEmptyDataSetWithTimePeriod:referenceDate:", 2, v12);

  -[STUsageGraphViewController setDataSet:animated:](v5->_weekGraphViewController, "setDataSet:animated:", v56, 0);
  -[STTableCell childViewControllers](v5, "childViewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v5->_weekGraphViewController);

  -[STUsageGraphViewController view](v5->_weekGraphViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[STOverallUsageSummaryCell contentView](v5, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v14;
  objc_msgSend(v15, "addSubview:", v14);
  v16 = [STNoUsageDataView alloc];
  v17 = -[STNoUsageDataView initWithPreferredFontTextStyle:](v16, "initWithPreferredFontTextStyle:", *MEMORY[0x24BEBE220]);
  noUsageDataView = v5->_noUsageDataView;
  v5->_noUsageDataView = (STNoUsageDataView *)v17;

  -[STNoUsageDataView setTranslatesAutoresizingMaskIntoConstraints:](v5->_noUsageDataView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STNoUsageDataView setHidden:](v5->_noUsageDataView, "setHidden:", 1);
  objc_msgSend(v15, "addSubview:", v5->_noUsageDataView);
  -[STTableCell contentLayoutGuide](v5, "contentLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v14, "topAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v54, 2.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v53;
  objc_msgSend(v14, "leadingAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "constraintEqualToAnchor:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v49;
  objc_msgSend(v14, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v46;
  objc_msgSend(v15, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v44, 2.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v43;
  -[STNoUsageDataView topAnchor](v5->_noUsageDataView, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "constraintGreaterThanOrEqualToAnchor:", v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v38;
  -[STNoUsageDataView leadingAnchor](v5->_noUsageDataView, "leadingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v19;
  objc_msgSend(v19, "leadingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v35);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v34;
  -[STNoUsageDataView bottomAnchor](v5->_noUsageDataView, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v31;
  -[STNoUsageDataView trailingAnchor](v5->_noUsageDataView, "trailingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v21;
  -[STNoUsageDataView centerXAnchor](v5->_noUsageDataView, "centerXAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v15;
  objc_msgSend(v15, "centerXAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v24;
  -[STNoUsageDataView centerYAnchor](v5->_noUsageDataView, "centerYAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "activateConstraints:", v28);

  -[STUsageSummaryTitleView addObserver:forKeyPath:options:context:](v5->_titleView, "addObserver:forKeyPath:options:context:", v5, CFSTR("hasMultilineLayout"), 3, "KVOContextOverallUsageSummaryCell");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STUsageSummaryTitleView removeObserver:forKeyPath:context:](self->_titleView, "removeObserver:forKeyPath:context:", self, CFSTR("hasMultilineLayout"), "KVOContextOverallUsageSummaryCell");
  v3.receiver = self;
  v3.super_class = (Class)STOverallUsageSummaryCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v10 = a5;
  if (a6 == "KVOContextOverallUsageSummaryCell")
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("hasMultilineLayout")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
      {

        v11 = 0;
      }
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
      {

        v13 = 0;
      }
      -[STOverallUsageSummaryCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", objc_msgSend(v11, "BOOLValue"), objc_msgSend(v13, "BOOLValue"));

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STOverallUsageSummaryCell;
    -[STOverallUsageSummaryCell observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  id v5;

  if (a3 != a4)
  {
    -[STOverallUsageSummaryCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", 0x24DB927F0, self);

  }
}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STOverallUsageSummaryCell;
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

  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_2550EA810) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STOverallUsageSummaryCell.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]"));

  }
  v17.receiver = self;
  v17.super_class = (Class)STOverallUsageSummaryCell;
  -[PSTableCell setValue:](&v17, sel_setValue_, v6);
  -[STOverallUsageSummaryCell titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STOverallUsageSummaryCell weekGraphViewController](self, "weekGraphViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STOverallUsageSummaryCell noUsageDataView](self, "noUsageDataView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "hasUsageData"))
  {
    objc_msgSend(v6, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedWeekUsageReport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setUsageReport:", v12);
    objc_msgSend(v12, "screenTimeDataSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[STOverallUsageSummaryCell window](self, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDataSet:animated:", v13, v14 != 0);

    objc_msgSend(v7, "setHidden:", 0);
    objc_msgSend(v8, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

  }
  else
  {
    objc_msgSend(v9, "setLocalDevice:", objc_msgSend(v10, "isLocalDevice"));
    objc_msgSend(v7, "setHidden:", 1);
    objc_msgSend(v8, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setHidden:", 1);
  }

  -[STOverallUsageSummaryCell performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__setNoUsageDataViewVisibility, 0, 0.1);
}

- (void)_setNoUsageDataViewVisibility
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[STOverallUsageSummaryCell value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasUsageData");

  -[STOverallUsageSummaryCell noUsageDataView](self, "noUsageDataView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v5);

  -[STOverallUsageSummaryCell weekGraphViewController](self, "weekGraphViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v5 ^ 1);

}

- (STUsageSummaryTitleView)titleView
{
  return (STUsageSummaryTitleView *)objc_getProperty(self, a2, 1232, 1);
}

- (STUsageGraphViewController)weekGraphViewController
{
  return (STUsageGraphViewController *)objc_getProperty(self, a2, 1240, 1);
}

- (STNoUsageDataView)noUsageDataView
{
  return (STNoUsageDataView *)objc_getProperty(self, a2, 1248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noUsageDataView, 0);
  objc_storeStrong((id *)&self->_weekGraphViewController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
