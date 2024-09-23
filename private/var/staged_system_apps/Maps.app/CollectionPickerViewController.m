@implementation CollectionPickerViewController

- (CollectionPickerViewController)initWithCollectionEditSession:(id)a3
{
  id v5;
  CollectionPickerViewController *v6;
  CollectionPickerViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CollectionPickerViewController;
  v6 = -[CollectionPickerViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_collectionSession, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  MapsThemeTableView *v4;
  UITableView *tableView;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[4];

  v25.receiver = self;
  v25.super_class = (Class)CollectionPickerViewController;
  -[CollectionPickerViewController viewDidLoad](&v25, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPickerViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CollectionPicker"));

  v4 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = &v4->super;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setSectionHeaderTopPadding:](self->_tableView, "setSectionHeaderTopPadding:", 0.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v6);

  -[UITableView setAccessibilityIdentifier:](self->_tableView, "setAccessibilityIdentifier:", CFSTR("CollectionPickerTable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPickerViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_tableView);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPickerViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
  v26[0] = v21;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPickerViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v26[1] = v17;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPickerViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v26[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionPickerViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v26[3] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  -[CollectionPickerViewController loadDataSource](self, "loadDataSource");
}

- (CGSize)contentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  +[CollectionTableViewCell estimatedCellHeight](CollectionTableViewCell, "estimatedCellHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView visibleCells](self->_tableView, "visibleCells"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (v6)
  {
    objc_msgSend(v6, "frame");
    if (v7 > v4)
    {
      objc_msgSend(v6, "frame");
      v4 = v8;
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)CollectionPickerViewController;
  -[CollectionPickerViewController preferredContentSize](&v14, "preferredContentSize");
  v10 = v9;
  v11 = (double)-[CollectionListDataSource entriesCount](self->_collectionListDataSource, "entriesCount") * v4 + 1.0;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _QWORD block[7];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CollectionPickerViewController;
  -[CollectionPickerViewController viewDidLayoutSubviews](&v11, "viewDidLayoutSubviews");
  -[CollectionPickerViewController contentSize](self, "contentSize");
  v4 = v3;
  v6 = v5;
  -[CollectionPickerViewController preferredContentSize](self, "preferredContentSize");
  if (v4 != v8 || v6 != v7)
    -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v4, v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002E8B8C;
  block[3] = &unk_1011AED30;
  block[4] = self;
  *(double *)&block[5] = v4;
  *(double *)&block[6] = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CollectionPickerViewController;
  -[CollectionPickerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[CollectionPickerViewController contentSize](self, "contentSize");
  -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)loadDataSource
{
  CollectionListDataSource *v3;
  CollectionListDataSource *collectionListDataSource;

  v3 = -[CollectionListDataSource initWithTableView:editSession:showsAddCollection:]([CollectionListDataSource alloc], "initWithTableView:editSession:showsAddCollection:", self->_tableView, self->_collectionSession, 1);
  collectionListDataSource = self->_collectionListDataSource;
  self->_collectionListDataSource = v3;

  -[CollectionListDataSource setCellsSize:](self->_collectionListDataSource, "setCellsSize:", 1);
  -[DataSource setDelegate:](self->_collectionListDataSource, "setDelegate:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self->_collectionListDataSource);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_collectionListDataSource);
  -[DataSource setActive:](self->_collectionListDataSource, "setActive:", 1);
  -[CollectionPickerViewController contentSize](self, "contentSize");
  -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_collectionListDataSource == a3)
  {
    -[UITableView reloadData](self->_tableView, "reloadData");
    -[CollectionPickerViewController contentSize](self, "contentSize");
    -[CollectionPickerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  id WeakRetained;
  id v7;

  v7 = a4;
  v5 = objc_opt_class(CollectionHandler);
  if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "collectionPickerViewController:selectCollection:", self, v7);

  }
}

- (CollectionPickerViewControllerDelegate)delegate
{
  return (CollectionPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionListDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_collectionSession, 0);
}

@end
