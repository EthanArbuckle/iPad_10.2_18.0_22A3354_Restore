@implementation CarCollectionListCardViewController

- (CarCollectionListCardViewController)initWithCollections:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CarCollectionListCardViewController *v9;
  CarCollectionListCardViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CarCollectionListCardViewController;
  v9 = -[CarCollectionListCardViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collections, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  CarTableView *tableView;
  double v6;
  double v7;
  void *v8;
  CarTableView *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CarTableView *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CarCollectionListCardViewController;
  -[CarCollectionListCardViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarCollectionListCard"));

  v4 = objc_alloc_init(CarTableView);
  tableView = self->_tableView;
  self->_tableView = v4;

  -[CarTableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CarCollectionListCardTableView"));
  -[CarTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v6) = 1148846080;
  -[CarTableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 0, v6);
  LODWORD(v7) = 1148846080;
  -[CarTableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
  -[CarTableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[CarTableView setDelegate:](self->_tableView, "setDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[CarTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v8);

  -[CarTableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
  v9 = self->_tableView;
  v10 = objc_opt_class(CarCollectionCell);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarCollectionCell reuseIdentifier](CarCollectionCell, "reuseIdentifier"));
  -[CarTableView registerClass:forCellReuseIdentifier:](v9, "registerClass:forCellReuseIdentifier:", v10, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_tableView);

  v13 = self->_tableView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _maps_constraintsForCenteringInView:](v13, "_maps_constraintsForCenteringInView:", v14));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

- (void)setCollections:(id)a3
{
  NSArray *v5;
  id v6;
  NSObject *v7;
  CarCollectionListCardViewController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  NSUInteger v19;
  __int16 v20;
  NSUInteger v21;

  v5 = (NSArray *)a3;
  if (self->_collections != v5)
  {
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      objc_storeStrong((id *)&self->_collections, a3);
      -[CarTableView reloadData](self->_tableView, "reloadData");
      goto LABEL_10;
    }
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    v15 = -[NSArray count](self->_collections, "count");
    *(_DWORD *)buf = 138543874;
    v17 = v14;
    v18 = 2048;
    v19 = v15;
    v20 = 2048;
    v21 = -[NSArray count](v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] CarSearchCategoriesCardVC didUpdate collections, previously: %ld, now: %ld", buf, 0x20u);

    goto LABEL_9;
  }
LABEL_10:

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_collections, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarCollectionCell reuseIdentifier](CarCollectionCell, "reuseIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController collections](self, "collections"));
  v11 = objc_msgSend(v6, "row");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v11));
  objc_msgSend(v9, "setupWithCollectionHandler:", v12);

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarCollectionListCardViewController collections](self, "collections"));
  v8 = objc_msgSend(v6, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  objc_msgSend(v10, "collectionListCard:didSelectCollection:", self, v9);

}

- (NSArray)focusOrderSubItems
{
  void *v3;

  if (-[CarCollectionListCardViewController isViewLoaded](self, "isViewLoaded"))
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarTableView _car_visibleCells](self->_tableView, "_car_visibleCells"));
  else
    v3 = &__NSArray0__struct;
  return (NSArray *)v3;
}

- (CarCollectionListCardViewControllerDelegate)delegate
{
  return (CarCollectionListCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)collections
{
  return self->_collections;
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
  objc_storeStrong((id *)&self->_collections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
