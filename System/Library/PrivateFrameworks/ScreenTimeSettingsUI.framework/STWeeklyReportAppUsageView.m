@implementation STWeeklyReportAppUsageView

- (STWeeklyReportAppUsageView)initWithUsageReport:(id)a3 useVibrancy:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  STWeeklyReportAppUsageView *v8;
  STWeeklyReportAppUsageView *v9;
  uint64_t v10;
  UILabel *titleLabel;
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
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  UIStackView *appImageStackView;
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
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  uint64_t i;
  void *v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v76;
  id v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  objc_super v83;
  _BYTE v84[128];
  uint64_t v85;

  v4 = a4;
  v85 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v83.receiver = self;
  v83.super_class = (Class)STWeeklyReportAppUsageView;
  v8 = -[STWeeklyReportAppUsageView initWithFrame:](&v83, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    v77 = v7;
    objc_storeStrong((id *)&v8->_report, a3);
    v10 = objc_opt_new();
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = (UILabel *)v10;

    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v9->_titleLabel, "setFont:", v12);

    objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9->_titleLabel, "setTextColor:", v13);

    v14 = (void *)MEMORY[0x24BDD17C8];
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AppUsageLabel"), &stru_24DB8A1D0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v9->_titleLabel, "setText:", v17);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v9->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel sizeToFit](v9->_titleLabel, "sizeToFit");
    -[STWeeklyReportAppUsageView addSubview:](v9, "addSubview:", v9->_titleLabel);
    v18 = (void *)objc_opt_new();
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BEBDAF0], "widgetEffectForVibrancyStyle:", 102);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", v19);
      objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[STWeeklyReportAppUsageView addSubview:](v9, "addSubview:", v20);
      objc_msgSend(v20, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v9->_titleLabel);
      objc_msgSend(v20, "topAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWeeklyReportAppUsageView topAnchor](v9, "topAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v24);

      objc_msgSend(v20, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWeeklyReportAppUsageView leadingAnchor](v9, "leadingAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v27);

      objc_msgSend(v20, "bottomAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWeeklyReportAppUsageView bottomAnchor](v9, "bottomAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v30);

      objc_msgSend(v20, "trailingAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[STWeeklyReportAppUsageView trailingAnchor](v9, "trailingAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "constraintEqualToAnchor:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v33);

      v34 = 0.0;
      v35 = 0.0;
    }
    else
    {
      v35 = 16.0;
      v34 = -16.0;
    }
    -[UILabel leadingAnchor](v9->_titleLabel, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWeeklyReportAppUsageView leadingAnchor](v9, "leadingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:constant:", v37, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v38);

    -[UILabel topAnchor](v9->_titleLabel, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWeeklyReportAppUsageView topAnchor](v9, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v40, 10.0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v41);

    v42 = objc_opt_new();
    appImageStackView = v9->_appImageStackView;
    v9->_appImageStackView = (UIStackView *)v42;

    -[UIStackView setAlignment:](v9->_appImageStackView, "setAlignment:", 4);
    -[UIStackView setAxis:](v9->_appImageStackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v9->_appImageStackView, "setDistribution:", 3);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v9->_appImageStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STWeeklyReportAppUsageView addSubview:](v9, "addSubview:", v9->_appImageStackView);
    -[UIStackView topAnchor](v9->_appImageStackView, "topAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v9->_titleLabel, "bottomAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 7.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v46);

    -[UIStackView leadingAnchor](v9->_appImageStackView, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWeeklyReportAppUsageView leadingAnchor](v9, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:constant:", v48, v35);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v49);

    -[UIStackView trailingAnchor](v9->_appImageStackView, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[STWeeklyReportAppUsageView trailingAnchor](v9, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, v34);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v52);

    -[STWeeklyReportAppUsageView bottomAnchor](v9, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIStackView bottomAnchor](v9->_appImageStackView, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, 16.0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v55);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v18);
    -[STUsageReport topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:](v9->_report, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 8, 2, 0, 0, 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v18;
    if (objc_msgSend(v56, "count"))
    {
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache", v18);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = 0;
    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v56;
    v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v80;
      v61 = 0.0;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v80 != v60)
            objc_enumerationMutation(obj);
          v63 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if (v61 == 0.0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "totalUsage");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "doubleValue");
            v61 = v65;

          }
          objc_msgSend(v63, "totalUsage", v76);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "doubleValue");
          v68 = v67;

          if (v61 <= 0.0 || (v69 = v68 / v61 * 40.0, v70 = 15.0, v69 >= 15.0) && (v70 = v69, v69 > 40.0))
            v70 = 40.0;
          objc_msgSend(v63, "image");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (v71)
          {
            -[STWeeklyReportAppUsageView _appImageSubviewWithImage:dimension:](v9, "_appImageSubviewWithImage:dimension:", v71, v70);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIStackView addArrangedSubview:](v9->_appImageStackView, "addArrangedSubview:", v72);
            -[NSMutableArray addObject:](v9->_topEightImageItems, "addObject:", v63);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v70);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_dimensionByUsageItem, "setObject:forKeyedSubscript:", v73, v63);

          }
          objc_msgSend(v63, "budgetItemIdentifier");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "addObserver:selector:bundleIdentifier:", v9, sel__didFetchIcon_, v74);

        }
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      }
      while (v59);
    }

    v7 = v77;
  }

  return v9;
}

- (void)_didFetchIcon:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x24BE84840]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[STWeeklyReportAppUsageView topEightImageItems](self, "topEightImageItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
        objc_msgSend(v9, "budgetItemIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          objc_msgSend(v9, "image");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            -[STWeeklyReportAppUsageView topEightImageItems](self, "topEightImageItems");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "indexOfObject:", v9);

            -[STWeeklyReportAppUsageView appImageStackView](self, "appImageStackView");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "arrangedSubviews");
            v16 = v7;
            v17 = v4;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[STWeeklyReportAppUsageView appImageStackView](self, "appImageStackView");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "removeArrangedSubview:", v19);

            objc_msgSend(v19, "removeFromSuperview");
            -[STWeeklyReportAppUsageView dimensionByUsageItem](self, "dimensionByUsageItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;

            -[STWeeklyReportAppUsageView _appImageSubviewWithImage:dimension:](self, "_appImageSubviewWithImage:dimension:", v12, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[STWeeklyReportAppUsageView appImageStackView](self, "appImageStackView");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "insertArrangedSubview:atIndex:", v25, v14);

            v4 = v17;
            v7 = v16;
            v6 = v28;

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

}

- (id)_appImageSubviewWithImage:(id)a3 dimension:(double)a4
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
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v5);

  objc_msgSend(v7, "setSize:", a4, a4);
  objc_msgSend(v6, "addSubview:", v7);
  v8 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v7, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(v7, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activateConstraints:", v15);

  return v6;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIStackView)appImageStackView
{
  return self->_appImageStackView;
}

- (void)setAppImageStackView:(id)a3
{
  objc_storeStrong((id *)&self->_appImageStackView, a3);
}

- (STUsageReport)report
{
  return self->_report;
}

- (void)setReport:(id)a3
{
  objc_storeStrong((id *)&self->_report, a3);
}

- (NSMutableArray)topEightImageItems
{
  return self->_topEightImageItems;
}

- (void)setTopEightImageItems:(id)a3
{
  objc_storeStrong((id *)&self->_topEightImageItems, a3);
}

- (NSMutableDictionary)dimensionByUsageItem
{
  return self->_dimensionByUsageItem;
}

- (void)setDimensionByUsageItem:(id)a3
{
  objc_storeStrong((id *)&self->_dimensionByUsageItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensionByUsageItem, 0);
  objc_storeStrong((id *)&self->_topEightImageItems, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_appImageStackView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
