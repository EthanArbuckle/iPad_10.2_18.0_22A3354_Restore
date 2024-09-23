@implementation STDailyAverageSummaryTableViewCell

- (STDailyAverageSummaryTableViewCell)initWithUsageReport:(id)a3
{
  id v4;
  STDailyAverageSummaryTableViewCell *v5;
  STUsageSummaryTitleView *v6;
  STUsageSummaryTitleView *titleView;
  STUsageGraphViewController *v8;
  STUsageGraphViewController *usageGraphViewController;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  STHorizontallySegmentedView *topItemsView;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  STSegmentItem *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  STSegmentItem *v32;
  STDailyAverageSummaryTableViewCell *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id firstValue;
  STDailyAverageSummaryTableViewCell *v42;
  void *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)STDailyAverageSummaryTableViewCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v49, sel_initWithStyle_reuseIdentifier_specifier_, 0, 0, 0);
  v6 = -[STUsageSummaryTitleView initWithVibrancy:usageItemType:truncateAverageLabel:]([STUsageSummaryTitleView alloc], "initWithVibrancy:usageItemType:truncateAverageLabel:", 0, 1, 0);
  titleView = v5->_titleView;
  v5->_titleView = v6;

  -[STUsageSummaryTitleView setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STUsageSummaryTitleView setUsageReport:](v5->_titleView, "setUsageReport:", v4);
  v8 = -[STUsageGraphViewController initWithTitleView:graphHeight:includePaddle:useVibrancy:]([STUsageGraphViewController alloc], "initWithTitleView:graphHeight:includePaddle:useVibrancy:", v5->_titleView, 0, 0, 90.0);
  usageGraphViewController = v5->_usageGraphViewController;
  v5->_usageGraphViewController = v8;

  objc_msgSend(v4, "categoryUsageDataSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUsageGraphViewController setDataSet:](v5->_usageGraphViewController, "setDataSet:", v10);

  -[STTableCell childViewControllers](v5, "childViewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v5->_usageGraphViewController);

  -[STUsageGraphViewController view](v5->_usageGraphViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STDailyAverageSummaryTableViewCell contentView](v5, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  firstValue = v12;
  objc_msgSend(v13, "addSubview:", v12);
  v14 = objc_opt_new();
  topItemsView = v5->_topItemsView;
  v5->_topItemsView = (STHorizontallySegmentedView *)v14;

  -[STHorizontallySegmentedView setTranslatesAutoresizingMaskIntoConstraints:](v5->_topItemsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v42 = v5;
  v40 = v13;
  objc_msgSend(v13, "addSubview:", v5->_topItemsView);
  objc_msgSend(v4, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 3, 3, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v4;
  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(v4, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 3, 2, 0, 0, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v16, "count"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v16;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v46 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v24 = [STSegmentItem alloc];
        objc_msgSend(v23, "displayName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "totalUsage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        v28 = v27;
        if (v27 >= 60.0)
        {
          v29 = (void *)objc_opt_new();
          objc_msgSend(v29, "setAllowedUnits:", 96);
          objc_msgSend(v29, "setUnitsStyle:", 1);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "stringFromTimeInterval:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "color");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[STSegmentItem initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:](v24, "initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:", v25, v30, v31, 0, 0);

        objc_msgSend(v18, "addObject:", v32);
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v20);
  }

  v33 = v42;
  -[STHorizontallySegmentedView setSegmentItems:](v42->_topItemsView, "setSegmentItems:", v18);
  _NSDictionaryOfVariableBindings(CFSTR("graphView, _topItemsView"), firstValue, v42->_topItemsView, 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[graphView]-|"), 0, 0, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[_topItemsView]-|"), 0, 0, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v37);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-14.0-[graphView]-9.0-[_topItemsView]-11.0-|"), 0, 0, v34);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObjectsFromArray:", v38);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v36);
  -[STUsageSummaryTitleView addObserver:forKeyPath:options:context:](v33->_titleView, "addObserver:forKeyPath:options:context:", v33, CFSTR("hasMultilineLayout"), 3, "KVOContextDailyAverageSummaryTableViewCell");
  -[STHorizontallySegmentedView addObserver:forKeyPath:options:context:](v33->_topItemsView, "addObserver:forKeyPath:options:context:", v33, CFSTR("numberOfLines"), 3, "KVOContextDailyAverageSummaryTableViewCell");

  return v42;
}

- (void)dealloc
{
  objc_super v3;

  -[STUsageSummaryTitleView removeObserver:forKeyPath:context:](self->_titleView, "removeObserver:forKeyPath:context:", self, CFSTR("hasMultilineLayout"), "KVOContextDailyAverageSummaryTableViewCell");
  -[STHorizontallySegmentedView removeObserver:forKeyPath:context:](self->_topItemsView, "removeObserver:forKeyPath:context:", self, CFSTR("numberOfLines"), "KVOContextDailyAverageSummaryTableViewCell");
  v3.receiver = self;
  v3.super_class = (Class)STDailyAverageSummaryTableViewCell;
  -[PSTableCell dealloc](&v3, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextDailyAverageSummaryTableViewCell")
  {
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("numberOfLines")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v15)
      {

        v14 = 0;
      }
      -[STDailyAverageSummaryTableViewCell _numberOfLinesDidChangeFrom:to:](self, "_numberOfLinesDidChangeFrom:to:", objc_msgSend(v12, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("hasMultilineLayout")))
        goto LABEL_16;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v16)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 == v17)
      {

        v14 = 0;
      }
      -[STDailyAverageSummaryTableViewCell _layoutDidChangeFrom:to:](self, "_layoutDidChangeFrom:to:", objc_msgSend(v12, "BOOLValue"), objc_msgSend(v14, "BOOLValue"));
    }

    goto LABEL_16;
  }
  v18.receiver = self;
  v18.super_class = (Class)STDailyAverageSummaryTableViewCell;
  -[STDailyAverageSummaryTableViewCell observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_16:

}

- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  id v5;

  if (a3 != a4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("HeightDidChange"), self);

  }
}

- (void)_layoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  id v5;

  if (a3 != a4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("HeightDidChange"), self);

  }
}

- (STDailyAverageView)dailyAverageView
{
  return (STDailyAverageView *)objc_getProperty(self, a2, 1232, 1);
}

- (STUsageSummaryTitleView)titleView
{
  return (STUsageSummaryTitleView *)objc_getProperty(self, a2, 1240, 1);
}

- (STUsageGraphViewController)usageGraphViewController
{
  return (STUsageGraphViewController *)objc_getProperty(self, a2, 1248, 1);
}

- (STHorizontallySegmentedView)topItemsView
{
  return (STHorizontallySegmentedView *)objc_getProperty(self, a2, 1256, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topItemsView, 0);
  objc_storeStrong((id *)&self->_usageGraphViewController, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_dailyAverageView, 0);
}

@end
