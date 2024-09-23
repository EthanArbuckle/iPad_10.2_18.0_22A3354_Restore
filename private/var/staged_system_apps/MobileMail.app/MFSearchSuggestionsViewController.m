@implementation MFSearchSuggestionsViewController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4C24;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA380 != -1)
    dispatch_once(&qword_1005AA380, block);
  return (OS_os_log *)(id)qword_1005AA378;
}

+ (id)categoryComparator
{
  return &stru_1005228D0;
}

- (MFSearchSuggestionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[MFSearchSuggestionsViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFSearchSuggestionsViewController initWithNibName:bundle:]", "MFSearchSuggestionsViewController.m", 128, "0");
}

- (MFSearchSuggestionsViewController)initWithStyle:(int64_t)a3
{
  -[MFSearchSuggestionsViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFSearchSuggestionsViewController initWithStyle:]", "MFSearchSuggestionsViewController.m", 129, "0");
}

- (MFSearchSuggestionsViewController)initWithCoder:(id)a3
{
  id v5;

  v5 = a3;
  -[MFSearchSuggestionsViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFSearchSuggestionsViewController initWithCoder:]", "MFSearchSuggestionsViewController.m", 130, "0");
}

- (MFSearchSuggestionsViewController)initWithMainScene:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MFSearchSuggestionsViewController *v8;
  MFSearchSuggestionsViewController *v9;
  NSMutableSet *v10;
  NSMutableSet *touchedCategories;
  MFSearchSuggestionsTableViewModel *v12;
  MFSearchSuggestionsTableViewModel *tableViewModel;
  MessageListCellLayoutValuesHelper *v14;
  MessageListCellLayoutValuesHelper *layoutValuesHelper;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MFSearchSuggestionsViewController;
  v8 = -[MFSearchSuggestionsViewController initWithStyle:](&v17, "initWithStyle:", 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_scene, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    touchedCategories = v9->_touchedCategories;
    v9->_touchedCategories = v10;

    v12 = -[MFSearchSuggestionsViewController _newSearchSuggestionsTableViewModel](v9, "_newSearchSuggestionsTableViewModel");
    tableViewModel = v9->_tableViewModel;
    v9->_tableViewModel = v12;

    v14 = (MessageListCellLayoutValuesHelper *)objc_alloc_init((Class)MessageListCellLayoutValuesHelper);
    layoutValuesHelper = v9->_layoutValuesHelper;
    v9->_layoutValuesHelper = v14;

    -[MFSearchSuggestionsViewController setModalPresentationStyle:](v9, "setModalPresentationStyle:", 3);
  }

  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v3, "unregisterKeyboardAvoidable:", self);

  v4.receiver = self;
  v4.super_class = (Class)MFSearchSuggestionsViewController;
  -[MFSearchSuggestionsViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFSearchSuggestionsViewController;
  -[MFSearchSuggestionsViewController loadView](&v9, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
  objc_msgSend(v3, "setKeyboardDismissMode:", 1);
  objc_msgSend(v3, "setEstimatedRowHeight:", 44.0);
  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "setInsetsLayoutMarginsFromSafeArea:", 0);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  objc_msgSend(v3, "_setHeaderAndFooterViewsFloat:", !IsAccessibilityCategory);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(MFSearchSuggestionsTableViewCell), CFSTR("kMFSearchSuggestionsCellIdentifier"));
  v6 = objc_opt_class(MessageListTableViewCell);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListTableViewCell reusableIdentifier](MessageListTableViewCell, "reusableIdentifier"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", v6, v7);

  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(UITableViewHeaderFooterView), CFSTR("kMFSearchSectionHeaderCellIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v8, "registerKeyboardAvoidable:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchSuggestionsViewController;
  -[MFSearchSuggestionsViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController layoutValuesHelper](self, "layoutValuesHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController traitCollection](self, "traitCollection"));
  objc_msgSend(v4, "setTraitCollection:", v5);

  -[MFSearchSuggestionsViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  objc_msgSend(v4, "setSystemLayoutMargins:");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  _BOOL4 IsAccessibilityCategory;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFSearchSuggestionsViewController;
  -[MFSearchSuggestionsViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController traitCollection](self, "traitCollection"));
  if (objc_msgSend(v5, "mf_traitDifferenceAffectsTextLayout:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController layoutValuesHelper](self, "layoutValuesHelper"));
    objc_msgSend(v6, "setTraitCollection:", v5);

    v7 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "preferredContentSizeCategory"));
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    objc_msgSend(v9, "_setHeaderAndFooterViewsFloat:", !IsAccessibilityCategory);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFSearchSuggestionsViewController;
  -[MFSearchSuggestionsViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFKeyboardAvoidance sharedController](MFKeyboardAvoidance, "sharedController"));
  objc_msgSend(v4, "registerKeyboardAvoidable:", self);

}

- (void)viewLayoutMarginsDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MFSearchSuggestionsViewController;
  -[MFSearchSuggestionsViewController viewLayoutMarginsDidChange](&v12, "viewLayoutMarginsDidChange");
  -[MFSearchSuggestionsViewController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController layoutValuesHelper](self, "layoutValuesHelper"));
  objc_msgSend(v11, "setSystemLayoutMargins:", v4, v6, v8, v10);

}

- (void)keyboardVisibilityDidChange:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double Height;
  double v18;
  id v19;
  id v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", UIKeyboardFrameEndUserInfoKey));
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v20 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v20, "bounds");
  v24.origin.x = v13;
  v24.origin.y = v14;
  v24.size.width = v15;
  v24.size.height = v16;
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  v23 = CGRectIntersection(v22, v24);
  Height = CGRectGetHeight(v23);

  -[MFSearchSuggestionsViewController currentKeyboardHeight](self, "currentKeyboardHeight");
  if (v18 != Height)
  {
    -[MFSearchSuggestionsViewController setCurrentKeyboardHeight:](self, "setCurrentKeyboardHeight:", Height);
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:");

  }
}

- (id)_defaultTableViewCellPopulator
{
  return &stru_100522910;
}

- (id)_defaultTableViewRowHeightCalculator
{
  return &stru_100522950;
}

- (id)_defaultTableViewRowSelector
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A561C;
  v5[3] = &unk_100522978;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (id)_topHitsTableViewCellPopulator
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A574C;
  v5[3] = &unk_1005229A0;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (id)_topHitsTableViewRowHeightCalculator
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A58C8;
  v5[3] = &unk_1005229C8;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (id)_topHitsTableViewRowSelector
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[4];
  id v6;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A5AA4;
  v5[3] = &unk_1005229F0;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)defaultReuseConfiguration
{
  MFSearchSuggestionsTableViewModelReuseConfiguration *defaultReuseConfiguration;
  MFSearchSuggestionsTableViewModelReuseConfiguration *v4;
  MFSearchSuggestionsTableViewModelReuseConfiguration *v5;
  void *v6;
  void *v7;
  void *v8;

  defaultReuseConfiguration = self->_defaultReuseConfiguration;
  if (!defaultReuseConfiguration)
  {
    v4 = -[MFSearchSuggestionsTableViewModelReuseConfiguration initWithReuseIdentifier:]([MFSearchSuggestionsTableViewModelReuseConfiguration alloc], "initWithReuseIdentifier:", CFSTR("kMFSearchSuggestionsCellIdentifier"));
    v5 = self->_defaultReuseConfiguration;
    self->_defaultReuseConfiguration = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController _defaultTableViewCellPopulator](self, "_defaultTableViewCellPopulator"));
    -[MFSearchSuggestionsTableViewModelReuseConfiguration setCellPopulator:](self->_defaultReuseConfiguration, "setCellPopulator:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController _defaultTableViewRowHeightCalculator](self, "_defaultTableViewRowHeightCalculator"));
    -[MFSearchSuggestionsTableViewModelReuseConfiguration setRowHeightCalculator:](self->_defaultReuseConfiguration, "setRowHeightCalculator:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController _defaultTableViewRowSelector](self, "_defaultTableViewRowSelector"));
    -[MFSearchSuggestionsTableViewModelReuseConfiguration setRowSelector:](self->_defaultReuseConfiguration, "setRowSelector:", v8);

    defaultReuseConfiguration = self->_defaultReuseConfiguration;
  }
  return defaultReuseConfiguration;
}

- (MFSearchSuggestionsTableViewModelReuseConfiguration)topHitsReuseConfiguration
{
  void *v3;
  unsigned int v4;
  MFSearchSuggestionsTableViewModelReuseConfiguration *v5;
  void *v6;
  MFSearchSuggestionsTableViewModelReuseConfiguration *v7;
  MFSearchSuggestionsTableViewModelReuseConfiguration *topHitsReuseConfiguration;
  void *v9;
  void *v10;
  void *v11;

  if (!self->_topHitsReuseConfiguration)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController delegate](self, "delegate"));
    v4 = objc_msgSend(v3, "canGenerateTopHitsForSearchSuggestionsViewController:", self);

    if (v4)
    {
      v5 = [MFSearchSuggestionsTableViewModelReuseConfiguration alloc];
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[MessageListTableViewCell reusableIdentifier](MessageListTableViewCell, "reusableIdentifier"));
      v7 = -[MFSearchSuggestionsTableViewModelReuseConfiguration initWithReuseIdentifier:](v5, "initWithReuseIdentifier:", v6);
      topHitsReuseConfiguration = self->_topHitsReuseConfiguration;
      self->_topHitsReuseConfiguration = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController _topHitsTableViewCellPopulator](self, "_topHitsTableViewCellPopulator"));
      -[MFSearchSuggestionsTableViewModelReuseConfiguration setCellPopulator:](self->_topHitsReuseConfiguration, "setCellPopulator:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController _topHitsTableViewRowHeightCalculator](self, "_topHitsTableViewRowHeightCalculator"));
      -[MFSearchSuggestionsTableViewModelReuseConfiguration setRowHeightCalculator:](self->_topHitsReuseConfiguration, "setRowHeightCalculator:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController _topHitsTableViewRowSelector](self, "_topHitsTableViewRowSelector"));
      -[MFSearchSuggestionsTableViewModelReuseConfiguration setRowSelector:](self->_topHitsReuseConfiguration, "setRowSelector:", v11);

    }
  }
  return self->_topHitsReuseConfiguration;
}

- (id)_newSearchSuggestionsTableViewModel
{
  MFSearchSuggestionsTableViewModel *v3;
  id v4;
  void *v5;
  void *v6;
  MFSearchSuggestionsTableViewModel *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = [MFSearchSuggestionsTableViewModel alloc];
  v4 = objc_msgSend((id)objc_opt_class(self), "categoryComparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController defaultReuseConfiguration](self, "defaultReuseConfiguration"));
  v7 = -[MFSearchSuggestionsTableViewModel initWithSectionComparator:defaultReuseConfiguration:](v3, "initWithSectionComparator:defaultReuseConfiguration:", v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController delegate](self, "delegate"));
  LODWORD(v6) = objc_msgSend(v8, "canGenerateTopHitsForSearchSuggestionsViewController:", self);

  if ((_DWORD)v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MUISearchSuggestionCategory topHitsCategory](MUISearchSuggestionCategory, "topHitsCategory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController topHitsReuseConfiguration](self, "topHitsReuseConfiguration"));
    -[MFSearchSuggestionsTableViewModel registerCategory:forReuseConfiguration:](v7, "registerCategory:forReuseConfiguration:", v9, v10);

  }
  return v7;
}

- (void)setTableViewModel:(id)a3
{
  MFSearchSuggestionsTableViewModel *v5;
  void *v6;
  MFSearchSuggestionsTableViewModel *v7;

  v5 = (MFSearchSuggestionsTableViewModel *)a3;
  if (self->_tableViewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_tableViewModel, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

    v5 = v7;
  }

}

- (void)clearSuggestions
{
  id v3;

  -[NSMutableSet removeAllObjects](self->_touchedCategories, "removeAllObjects");
  -[MFSearchSuggestionsViewController setSuggestionsUpdated:](self, "setSuggestionsUpdated:", 0);
  v3 = -[MFSearchSuggestionsViewController _newSearchSuggestionsTableViewModel](self, "_newSearchSuggestionsTableViewModel");
  -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:");

}

- (void)beginUpdatingSuggestions
{
  -[NSMutableSet removeAllObjects](self->_touchedCategories, "removeAllObjects");
  -[MFSearchSuggestionsViewController setSuggestionsUpdated:](self, "setSuggestionsUpdated:", 0);
}

- (void)endUpdatingSuggestions
{
  void *v3;
  id v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, void *);
  void *v8;
  MFSearchSuggestionsViewController *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_1001A61A8;
  v8 = &unk_100522A18;
  v9 = self;
  v4 = objc_msgSend(v3, "copy");
  v10 = v4;
  objc_msgSend(v3, "enumerateSections:", &v5);
  -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:", v4, v5, v6, v7, v8, v9);

}

- (void)updateSuggestionsWithResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *j;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *k;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id obj;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];

  v33 = a3;
  -[MFSearchSuggestionsViewController setSuggestionsUpdated:](self, "setSuggestionsUpdated:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v32 = objc_msgSend(v4, "copy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "categories"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i), "groupingCategory", v32));
        objc_msgSend(v5, "addObject:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v7);
  }

  -[NSMutableSet addObjectsFromArray:](self->_touchedCategories, "addObjectsFromArray:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v42;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v32));
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v15);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    }
    while (v12);
  }

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "suggestions"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v18; k = (char *)k + 1)
      {
        if (*(_QWORD *)v38 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "category", v32));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "groupingCategory"));

        objc_msgSend(v21, "setDelegate:", self);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v23));
        objc_msgSend(v24, "addObject:", v21);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v18);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1001A679C;
  v35[3] = &unk_100522A40;
  v25 = v32;
  v36 = v25;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v35);
  v26 = objc_claimAutoreleasedReturnValue(+[MFSearchSuggestionsViewController log](MFSearchSuggestionsViewController, "log"));
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Update search suggestions with suggestions: %@", buf, 0xCu);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "suggestions"));
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController delegate](self, "delegate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectsByIdentifier"));
    v31 = objc_msgSend(v30, "copy");
    objc_msgSend(v29, "reportSuggestionsFetched:", v31);

  }
  -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:", v25, v32);
  -[MFSearchSuggestionsViewController setSuggestionsUpdated:](self, "setSuggestionsUpdated:", 1);

}

- (BOOL)hasSuggestions
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v3 = objc_msgSend(v2, "numberOfSections") != 0;

  return v3;
}

- (id)searchSuggestionsForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sectionForIdentifier:", v4));

  return v6;
}

- (void)reportVisibleSuggestionResults
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
  -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:");

}

- (void)updateLayoutMargins:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  id v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setLayoutMargins:", top, left, bottom, right);

}

- (void)shouldReloadSearchSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSuggestion:", v4));

  v7 = objc_msgSend(v6, "row");
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL || (v7 = objc_msgSend(v6, "section"), v7 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = MFLogGeneral(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
      sub_100394A74((uint64_t)v4, v10, (uint64_t)&v14);
    }
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    objc_msgSend(v11, "beginUpdates");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    v15 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 5);

    v9 = objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    -[NSObject endUpdates](v9, "endUpdates");
  }

}

- (void)didRemoveSearchSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  MFSearchSuggestionsTableViewModel *tableViewModel;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForSuggestion:", v4));

  v7 = objc_msgSend(v6, "row");
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL || (v7 = objc_msgSend(v6, "section"), v7 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = MFLogGeneral(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
      sub_100394ABC((uint64_t)v4, v10, (uint64_t)&v13);
    }
  }
  else
  {
    tableViewModel = self->_tableViewModel;
    v14 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    v9 = objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsTableViewModel tableViewModelByRemovingItemsAtIndexPaths:](tableViewModel, "tableViewModelByRemovingItemsAtIndexPaths:", v12));

    -[MFSearchSuggestionsViewController setTableViewModel:](self, "setTableViewModel:", v9);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:", a3, 0, 0);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:", a3, 0, 0);
}

- (void)configureReportedVisibleSuggestionsForTableView:(id)a3 alwaysReportItems:(BOOL)a4 keyboardVisibilityDidChange:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;
  MFSearchSuggestionsViewController *v21;

  v5 = a5;
  v6 = a4;
  v17 = a3;
  if (-[MFSearchSuggestionsViewController suggestionsUpdated](self, "suggestionsUpdated") || v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathsForVisibleRows"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001A6F08;
    v19[3] = &unk_100522A68;
    v20 = v17;
    v21 = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ef_filter:", v19));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingSelector:", "compare:"));

    if (objc_msgSend(v11, "count"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController lastVisibleIndexPaths](self, "lastVisibleIndexPaths"));
      v13 = objc_msgSend(v12, "isEqualToArray:", v11);

      if (!v13 || v6)
      {
        v14 = objc_msgSend(v11, "copy");
        -[MFSearchSuggestionsViewController setLastVisibleIndexPaths:](self, "setLastVisibleIndexPaths:", v14);

        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1001A6F64;
        v18[3] = &unk_10051F790;
        v18[4] = self;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_compactMap:", v18));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController delegate](self, "delegate"));
        objc_msgSend(v16, "reportSuggestionsVisible:", v15);

      }
    }

  }
  else
  {
    -[MFSearchSuggestionsViewController setLastVisibleIndexPaths:](self, "setLastVisibleIndexPaths:", 0);
  }

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  objc_msgSend(v8, "tableView:heightForRowAtIndexPath:", v6, v7);
  v10 = v9;

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  objc_msgSend(v7, "tableView:didSelectRowAtIndexPath:", v8, v6);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v6 = objc_msgSend(v5, "numberOfSectionsInTableView:", v4);

  return (int64_t)v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v8 = objc_msgSend(v7, "tableView:numberOfRowsInSection:", v6, a4);

  return (int64_t)v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tableView:titleForHeaderInSection:", v6, a4));

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("kMFSearchSectionHeaderCellIdentifier")));
  if (!v6)
    v6 = objc_msgSend(objc_alloc((Class)UITableViewHeaderFooterView), "initWithReuseIdentifier:", CFSTR("kMFSearchSectionHeaderCellIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentConfiguration"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "defaultContentConfiguration"));
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifierAtIndex:", a4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayName"));
  objc_msgSend(v10, "setText:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textProperties"));
  objc_msgSend(v14, "setNumberOfLines:", 2);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textProperties"));
  objc_msgSend(v15, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v6, "setContentConfiguration:", v10);
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableViewModel](self, "tableViewModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView:cellForRowAtIndexPath:", v6, v7));

  objc_msgSend(v9, "setInsetsLayoutMarginsFromSafeArea:", 0);
  return v9;
}

- (id)viewForKeyboardAvoidance:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView", a3));
}

- (id)transitionCoordinatorForKeyboardAvoidance:(id)a3
{
  return 0;
}

- (void)keyboardAvoidance:(id)a3 adjustForFrameOverlap:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CGRect v10;
  CGRect v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[MFSearchSuggestionsViewController currentKeyboardOverlap](self, "currentKeyboardOverlap", a3);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  if (!CGRectEqualToRect(v10, v11))
  {
    -[MFSearchSuggestionsViewController setCurrentKeyboardOverlap:](self, "setCurrentKeyboardOverlap:", x, y, width, height);
    v9 = (id)objc_claimAutoreleasedReturnValue(-[MFSearchSuggestionsViewController tableView](self, "tableView"));
    -[MFSearchSuggestionsViewController configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:](self, "configureReportedVisibleSuggestionsForTableView:alwaysReportItems:keyboardVisibilityDidChange:");

  }
}

- (MFSearchSuggestionsViewControllerDelegate)delegate
{
  return (MFSearchSuggestionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MFSearchSuggestionsTableViewModel)tableViewModel
{
  return self->_tableViewModel;
}

- (void)setDefaultReuseConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_defaultReuseConfiguration, a3);
}

- (void)setTopHitsReuseConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_topHitsReuseConfiguration, a3);
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (void)setLayoutValuesHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutValuesHelper, a3);
}

- (NSArray)lastVisibleIndexPaths
{
  return self->_lastVisibleIndexPaths;
}

- (void)setLastVisibleIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_lastVisibleIndexPaths, a3);
}

- (double)currentKeyboardHeight
{
  return self->_currentKeyboardHeight;
}

- (void)setCurrentKeyboardHeight:(double)a3
{
  self->_currentKeyboardHeight = a3;
}

- (CGRect)currentKeyboardOverlap
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_currentKeyboardOverlap.origin.x;
  y = self->_currentKeyboardOverlap.origin.y;
  width = self->_currentKeyboardOverlap.size.width;
  height = self->_currentKeyboardOverlap.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCurrentKeyboardOverlap:(CGRect)a3
{
  self->_currentKeyboardOverlap = a3;
}

- (BOOL)suggestionsUpdated
{
  return self->_suggestionsUpdated;
}

- (void)setSuggestionsUpdated:(BOOL)a3
{
  self->_suggestionsUpdated = a3;
}

- (MailMainScene)scene
{
  return (MailMainScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_lastVisibleIndexPaths, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_topHitsReuseConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultReuseConfiguration, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_touchedCategories, 0);
}

@end
