@implementation STUsageSummaryHeaderView

- (STUsageSummaryHeaderView)initWithSpecifier:(id)a3
{
  id v4;
  STUsageSummaryHeaderView *v5;
  id v6;
  void *v7;
  uint64_t v8;
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v10;
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
  id v32;
  objc_super v33;
  _QWORD v34[4];
  _QWORD v35[4];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)STUsageSummaryHeaderView;
  v5 = -[STTableViewHeaderFooterView initWithReuseIdentifier:](&v33, sel_initWithReuseIdentifier_, 0);
  if (v5)
  {
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("WeekTitle"), &stru_24DB8A1D0, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("DayTitle"), &stru_24DB8A1D0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BEBD938]);
    v35[0] = v30;
    v35[1] = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithItems:", v7);
    segmentedControl = v5->_segmentedControl;
    v5->_segmentedControl = (UISegmentedControl *)v8;

    v10 = v5->_segmentedControl;
    objc_msgSend(v4, "target");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", v11, objc_msgSend(v4, "buttonAction"), 4096);

    -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v5->_segmentedControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STUsageSummaryHeaderView contentView](v5, "contentView");
    v32 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v5->_segmentedControl);
    -[STTableViewHeaderFooterView contentLayoutGuide](v5, "contentLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1628];
    -[UISegmentedControl topAnchor](v5->_segmentedControl, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v27, 2.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v26;
    -[UISegmentedControl leadingAnchor](v5->_segmentedControl, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v13;
    -[UISegmentedControl trailingAnchor](v5->_segmentedControl, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v16;
    -[UISegmentedControl bottomAnchor](v5->_segmentedControl, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v20);

    v4 = v32;
  }

  return v5;
}

- (double)preferredHeightForWidth:(double)a3
{
  double v3;

  -[STUsageSummaryHeaderView systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", a3, *(double *)(MEMORY[0x24BEBE588] + 8));
  return v3;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
