@implementation STHistoricalScreenTimeCell

- (STHistoricalScreenTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  STHistoricalScreenTimeCell *v5;
  uint64_t v6;
  STHistoricalUsageViewController *historicalUsageViewController;
  void *v8;
  uint64_t v9;
  STHorizontallySegmentedView *topItemsView;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)STHistoricalScreenTimeCell;
  v5 = -[STTableCell initWithStyle:reuseIdentifier:specifier:](&v30, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  +[STHistoricalUsageViewController historicalUsageViewControllerOfType:graphHeight:](STHistoricalUsageViewController, "historicalUsageViewControllerOfType:graphHeight:", 1, 90.0);
  v6 = objc_claimAutoreleasedReturnValue();
  historicalUsageViewController = v5->_historicalUsageViewController;
  v5->_historicalUsageViewController = (STHistoricalUsageViewController *)v6;

  -[STTableCell childViewControllers](v5, "childViewControllers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5->_historicalUsageViewController);

  v9 = objc_opt_new();
  topItemsView = v5->_topItemsView;
  v5->_topItemsView = (STHorizontallySegmentedView *)v9;

  -[STHorizontallySegmentedView setTranslatesAutoresizingMaskIntoConstraints:](v5->_topItemsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[STHistoricalScreenTimeCell contentView](v5, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHistoricalUsageViewController view](v5->_historicalUsageViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addSubview:", v12);
  objc_msgSend(v11, "addSubview:", v5->_topItemsView);
  _NSDictionaryOfVariableBindings(CFSTR("historicalUsageView, _topItemsView"), v12, v5->_topItemsView, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[historicalUsageView][_topItemsView]-11.0-|"), 0, 0, v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[STTableCell contentLayoutGuide](v5, "contentLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v18);

  objc_msgSend(v15, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v21);

  objc_msgSend(v15, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontallySegmentedView leadingAnchor](v5->_topItemsView, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v24);

  objc_msgSend(v15, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[STHorizontallySegmentedView trailingAnchor](v5->_topItemsView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v27);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v14);
  -[STHistoricalUsageViewController addObserver:forKeyPath:options:context:](v5->_historicalUsageViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("titleView.hasMultilineLayout"), 3, "KVOContextHistoricalScreenTimeCell");
  -[STHistoricalUsageViewController addObserver:forKeyPath:options:context:](v5->_historicalUsageViewController, "addObserver:forKeyPath:options:context:", v5, CFSTR("currentViewMode"), 3, "KVOContextHistoricalScreenTimeCell");
  -[STHorizontallySegmentedView addObserver:forKeyPath:options:context:](v5->_topItemsView, "addObserver:forKeyPath:options:context:", v5, CFSTR("numberOfLines"), 3, "KVOContextHistoricalScreenTimeCell");

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STHistoricalUsageViewController removeObserver:forKeyPath:context:](self->_historicalUsageViewController, "removeObserver:forKeyPath:context:", self, CFSTR("titleView.hasMultilineLayout"), "KVOContextHistoricalScreenTimeCell");
  -[STHistoricalUsageViewController removeObserver:forKeyPath:context:](self->_historicalUsageViewController, "removeObserver:forKeyPath:context:", self, CFSTR("currentViewMode"), "KVOContextHistoricalScreenTimeCell");
  -[STHorizontallySegmentedView removeObserver:forKeyPath:context:](self->_topItemsView, "removeObserver:forKeyPath:context:", self, CFSTR("numberOfLines"), "KVOContextHistoricalScreenTimeCell");
  v3.receiver = self;
  v3.super_class = (Class)STHistoricalScreenTimeCell;
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
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextHistoricalScreenTimeCell")
  {
    -[STHistoricalScreenTimeCell historicalUsageViewController](self, "historicalUsageViewController");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentViewMode")))
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
      -[STHistoricalScreenTimeCell _currentViewModeDidChangeFrom:to:](self, "_currentViewModeDidChangeFrom:to:", objc_msgSend(v12, "integerValue"), objc_msgSend(v14, "integerValue"));
    }
    else
    {
      -[STHistoricalScreenTimeCell historicalUsageViewController](self, "historicalUsageViewController");

      if (objc_msgSend(v10, "isEqualToString:", CFSTR("titleView.hasMultilineLayout")))
      {
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
        -[STHistoricalScreenTimeCell _hasMulitlineLayoutDidChangeFrom:to:](self, "_hasMulitlineLayoutDidChangeFrom:to:", objc_msgSend(v12, "BOOLValue"), objc_msgSend(v14, "BOOLValue"));
      }
      else
      {
        -[STHistoricalScreenTimeCell topItemsView](self, "topItemsView");

        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("numberOfLines")))
          goto LABEL_22;
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v18)
        {

          v12 = 0;
        }
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 == v19)
        {

          v14 = 0;
        }
        -[STHistoricalScreenTimeCell _numberOfLinesDidChangeFrom:to:](self, "_numberOfLinesDidChangeFrom:to:", objc_msgSend(v12, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));
      }
    }

    goto LABEL_22;
  }
  v20.receiver = self;
  v20.super_class = (Class)STHistoricalScreenTimeCell;
  -[STHistoricalScreenTimeCell observeValueForKeyPath:ofObject:change:context:](&v20, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_22:

}

- (void)_currentViewModeDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if (a3 != a4)
  {
    -[STHistoricalScreenTimeCell historicalUsageViewController](self, "historicalUsageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasMultilineLayout");

    -[STHistoricalScreenTimeCell topItemsView](self, "topItemsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberOfLines");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    -[STHistoricalScreenTimeCell _handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:", a4, v8, v11);
  }
}

- (void)_hasMulitlineLayoutDidChangeFrom:(BOOL)a3 to:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (a3 != a4)
  {
    v4 = a4;
    -[STHistoricalScreenTimeCell historicalUsageViewController](self, "historicalUsageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "currentViewMode");

    -[STHistoricalScreenTimeCell topItemsView](self, "topItemsView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberOfLines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedIntegerValue");

    -[STHistoricalScreenTimeCell _handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:", v7, v4, v10);
  }
}

- (void)_numberOfLinesDidChangeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (a3 != a4)
  {
    -[STHistoricalScreenTimeCell historicalUsageViewController](self, "historicalUsageViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "currentViewMode");
    objc_msgSend(v9, "titleView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hasMultilineLayout");

    -[STHistoricalScreenTimeCell _handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:](self, "_handleEffectiveChangeForViewMode:hasMultilineLayout:numberOfLines:", v6, v8, a4);
  }
}

- (void)_handleEffectiveChangeForViewMode:(int64_t)a3 hasMultilineLayout:(BOOL)a4 numberOfLines:(unint64_t)a5
{
  _BOOL4 v6;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v6 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("SpecifierIdentifierHistoricalScreenTimeCell-%lu-%d-%lu"), a3, v6, a5);
  v12 = CFSTR("HistoricalScreenTimeSpecifierIdentifier");
  v13[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("HistoricalScreenTimeSpecifierIdentifierDidChange"), self, v11);

  -[STHistoricalScreenTimeCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  objc_msgSend(v9, "postNotificationName:object:", 0x24DB927F0, self);

}

- (id)value
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STHistoricalScreenTimeCell;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  STSegmentItem *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  STSegmentItem *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  STHistoricalScreenTimeCell *v32;
  void *v33;
  id obj;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "conformsToProtocol:", &unk_2550EA810) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STHistoricalScreenTimeCell.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(coordinator == nil) || [coordinator conformsToProtocol:@protocol(STUsageDetailsViewModelCoordinator)]"));

  }
  v40.receiver = self;
  v40.super_class = (Class)STHistoricalScreenTimeCell;
  -[PSTableCell setValue:](&v40, sel_setValue_, v6);
  v32 = self;
  -[STHistoricalScreenTimeCell historicalUsageViewController](self, "historicalUsageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCoordinator:", v6);

  objc_msgSend(v6, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectedUsageReport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 3, 3, 0, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v6;
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(v9, "topUsageItemsWithMaxCount:type:includeAggregateItem:nonAggregateItems:darkColors:", 3, 2, 0, 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v31 = v9;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v16, "totalUsage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        v20 = [STSegmentItem alloc];
        objc_msgSend(v16, "displayName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 >= 60.0)
        {
          v22 = (void *)objc_opt_new();
          objc_msgSend(v22, "setAllowedUnits:", 96);
          objc_msgSend(v22, "setUnitsStyle:", 1);
          v23 = 96;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD14F8], "st_sharedAbbreviatedSecondsDateFormatter");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 128;
        }
        objc_msgSend(v22, "stringFromTimeInterval:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "color");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[STSegmentItem initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:](v20, "initWithTitleText:detailText:titleColor:detailImage:detailImageTintColor:", v21, v24, v25, 0, 0);

        v27 = (void *)objc_opt_new();
        objc_msgSend(v27, "setAllowedUnits:", v23);
        objc_msgSend(v27, "setUnitsStyle:", 3);
        objc_msgSend(v27, "stringFromTimeInterval:", v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        -[STSegmentItem setAccessibilityText:](v26, "setAccessibilityText:", v28);
        objc_msgSend(v35, "addObject:", v26);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v13);
  }

  -[STHistoricalScreenTimeCell topItemsView](v32, "topItemsView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setSegmentItems:", v35);

}

- (STHistoricalUsageViewController)historicalUsageViewController
{
  return (STHistoricalUsageViewController *)objc_getProperty(self, a2, 1232, 1);
}

- (STHorizontallySegmentedView)topItemsView
{
  return (STHorizontallySegmentedView *)objc_getProperty(self, a2, 1240, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topItemsView, 0);
  objc_storeStrong((id *)&self->_historicalUsageViewController, 0);
}

@end
