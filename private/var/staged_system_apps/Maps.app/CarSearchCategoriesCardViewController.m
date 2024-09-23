@implementation CarSearchCategoriesCardViewController

- (CarSearchCategoriesCardViewController)initWithCategories:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CarSearchCategoriesCardViewController *v9;
  CarSearchCategoriesCardViewController *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *offlinePlaceholderQueue;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CarSearchCategoriesCardViewController;
  v9 = -[CarSearchCategoriesCardViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_categories, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("com.apple.Maps.search.offline.placeholder", v12);
    offlinePlaceholderQueue = v10->_offlinePlaceholderQueue;
    v10->_offlinePlaceholderQueue = (OS_dispatch_queue *)v13;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CarSearchCategoriesCardViewController;
  -[CarSearchCategoriesCardViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  CarTableView *tableView;
  double v6;
  double v7;
  void *v8;
  void *v9;
  CarTableView *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CarSearchCategoriesCardViewController;
  -[CarSearchCategoriesCardViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarSearchCard"));

  v4 = objc_alloc_init(CarTableView);
  tableView = self->_tableView;
  self->_tableView = v4;

  -[CarTableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CarSearchCardTableView"));
  -[CarTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  -[CarTableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[CarTableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  -[CarTableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[CarTableView setDelegate:](self->_tableView, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v8);

  -[CarTableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(CarSearchCategoryCell), CFSTR("SearchCategoryCellReuseIdentifier"));
  -[CarTableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(CarUserInputCell), CFSTR("UserInputCellReuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_tableView);

  v10 = self->_tableView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController view](self, "view"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _maps_constraintsForCenteringInView:](v10, "_maps_constraintsForCenteringInView:", v11));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

  -[CarSearchCategoriesCardViewController checkFullTextSearchSupport](self, "checkFullTextSearchSupport");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v13, "addObserver:selector:name:object:", self, "_offlineSettingChangeHandler", CFSTR("UsingOfflineMapsStateChangedNotification"), 0);

}

- (void)setCategories:(id)a3
{
  NSArray *v5;
  id v6;
  NSObject *v7;
  CarSearchCategoriesCardViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  CarTableView *tableView;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  NSUInteger v21;
  __int16 v22;
  NSUInteger v23;

  v5 = (NSArray *)a3;
  if (self->_categories != v5)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)&self->_categories, a3);
      tableView = self->_tableView;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", 1));
      -[CarTableView reloadSections:withRowAnimation:](tableView, "reloadSections:withRowAnimation:", v17, 100);

      goto LABEL_10;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    v15 = -[NSArray count](self->_categories, "count");
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2048;
    v21 = v15;
    v22 = 2048;
    v23 = -[NSArray count](v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] CarSearchCategoriesCardVC didUpdate categories, previously: %ld, now: %ld", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  double v6;

  v5 = objc_msgSend(a4, "section", a3);
  if (v5 == (id)1)
    return 44.0;
  v6 = 0.0;
  if (!v5
    && (!-[CarSearchCategoriesCardViewController _isMapsOffline](self, "_isMapsOffline") || self->_supportFullTextSearch))
  {
    return 44.0;
  }
  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t supportFullTextSearch;
  void *v8;

  v6 = a3;
  if (a4 == 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController categories](self, "categories"));
    supportFullTextSearch = (int64_t)objc_msgSend(v8, "count");

  }
  else if (a4)
  {
    supportFullTextSearch = 0;
  }
  else if (-[CarSearchCategoriesCardViewController _isMapsOffline](self, "_isMapsOffline"))
  {
    supportFullTextSearch = self->_supportFullTextSearch;
  }
  else
  {
    supportFullTextSearch = 1;
  }

  return supportFullTextSearch;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  CarSearchCategoriesCardViewController *v14;
  CarSearchCategoriesCardViewController *v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  uint8_t buf[4];
  __CFString *v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("SearchCategoryCellReuseIdentifier"), v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController categories](self, "categories"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));

    objc_msgSend(v9, "setupWithBrowseCategory:", v11);
    goto LABEL_16;
  }
  if (v8)
  {
    v12 = sub_10043364C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
LABEL_15:

      v9 = 0;
      goto LABEL_16;
    }
    v14 = self;
    v15 = v14;
    if (!v14)
    {
      v21 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v16 = (objc_class *)objc_opt_class(v14);
    v17 = NSStringFromClass(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if ((objc_opt_respondsToSelector(v15, "accessibilityIdentifier") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController performSelector:](v15, "performSelector:", "accessibilityIdentifier"));
      v20 = v19;
      if (v19 && !objc_msgSend(v19, "isEqualToString:", v18))
      {
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v18, v15, v20));

        goto LABEL_12;
      }

    }
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v18, v15));
LABEL_12:

LABEL_14:
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}@] CarSearchCategoriesCardViewController tried to dequeue a cell for invalid section.", buf, 0xCu);

    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("UserInputCellReuseIdentifier"), v7));
  objc_msgSend(v9, "setDelegate:", self);
  objc_msgSend(v9, "setSelectionStyle:", 0);
LABEL_16:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v9, 1);
  if (objc_msgSend(v9, "section") == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController categories](self, "categories"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v9, "row")));
    objc_msgSend(v6, "searchCategoriesCard:didSelectCategory:", self, v8);

  }
}

- (void)userInputCell:(id)a3 didSelectAction:(unint64_t)a4 usingInteractionModel:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a3;
  if (a4 == 1)
  {
    v10 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController delegate](self, "delegate"));
    objc_msgSend(v9, "searchCategoriesCardDidSelectKeyboardSearch:usingInteractionModel:", self, a5);
    goto LABEL_5;
  }
  if (!a4)
  {
    v10 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController delegate](self, "delegate"));
    objc_msgSend(v9, "searchCategoriesCardDidSelectSiriSearch:usingInteractionModel:", self, a5);
LABEL_5:

    v8 = v10;
  }

}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[CarSearchCategoriesCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_car_visibleCells"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = objc_opt_class(CarUserInputCell);
    isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    if ((isKindOfClass & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "focusOrderSubItems"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_subarrayFromIndex:", 1));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v10));

    }
    else
    {
      v11 = objc_msgSend(v4, "copy");
    }

  }
  else
  {
    v11 = &__NSArray0__struct;
  }
  return (NSArray *)v11;
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void)_ppt_selectFirstCarplayBrowseCategory
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController categories](self, "categories"));
  if (objc_msgSend(v6, "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController delegate](self, "delegate"));

    if (!v3)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController delegate](self, "delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchCategoriesCardViewController categories](self, "categories"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    objc_msgSend(v6, "searchCategoriesCard:didSelectCategory:", self, v5);

  }
}

- (BOOL)_isMapsOffline
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v3 = objc_msgSend(v2, "isUsingOfflineMaps");

  return v3;
}

- (void)_offlineSettingChangeHandler
{
  void *v3;
  unsigned int v4;
  id WeakRetained;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v4 = objc_msgSend(v3, "isUsingOfflineMaps");

  if (v4)
  {
    -[CarSearchCategoriesCardViewController checkFullTextSearchSupport](self, "checkFullTextSearchSupport");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "updateCardViewTitle:", 1);

    v6 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", 0);
    -[CarTableView reloadSections:withRowAnimation:](self->_tableView, "reloadSections:withRowAnimation:", v6, 100);

  }
}

- (void)checkFullTextSearchSupport
{
  NSObject *offlinePlaceholderQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  offlinePlaceholderQueue = self->_offlinePlaceholderQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B3A338;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(offlinePlaceholderQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)supportFullTextSearch
{
  return self->_supportFullTextSearch;
}

- (void)setSupportFullTextSearch:(BOOL)a3
{
  self->_supportFullTextSearch = a3;
}

- (CarSearchCategoriesCardViewControllerDelegate)delegate
{
  return (CarSearchCategoriesCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)categories
{
  return self->_categories;
}

- (CarTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_offlinePlaceholderQueue, 0);
}

@end
