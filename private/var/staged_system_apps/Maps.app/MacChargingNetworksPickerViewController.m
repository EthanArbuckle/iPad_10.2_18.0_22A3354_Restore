@implementation MacChargingNetworksPickerViewController

- (MacChargingNetworksPickerViewController)initWithExcludedNetworks:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MacChargingNetworksPickerViewController *v8;
  MacChargingNetworksPickerViewController *v9;
  _TtC4Maps26ChargingNetworksDataSource *v10;
  _TtC4Maps26ChargingNetworksDataSource *dataSource;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MacChargingNetworksPickerViewController;
  v8 = -[MacChargingNetworksPickerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = -[ChargingNetworksDataSource initWithExcludedNetworks:context:delegate:]([_TtC4Maps26ChargingNetworksDataSource alloc], "initWithExcludedNetworks:context:delegate:", v6, 2, v9);
    dataSource = v9->_dataSource;
    v9->_dataSource = v10;

  }
  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MacChargingNetworksPickerViewController;
  -[MacChargingNetworksPickerViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setNavigationBarHidden:", 1);

  -[MacChargingNetworksPickerViewController _setupSubviews](self, "_setupSubviews");
  -[MacChargingNetworksPickerViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MacChargingNetworksPickerViewController;
  -[MacChargingNetworksPickerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[MacFooterView layoutIfNeeded](self->_footerView, "layoutIfNeeded");
  -[MacFooterView frame](self->_footerView, "frame");
  -[MacChargingNetworksPickerViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", 0.0, 0.0, v4, 0.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  objc_msgSend(v5, "bringSubviewToFront:", self->_footerView);

}

- (void)_setupSubviews
{
  UISearchBar *v3;
  UISearchBar *searchBar;
  UIImage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UITableView *v13;
  UITableView *tableView;
  double v15;
  void *v16;
  UITableView *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  MacFooterView *v23;
  MacFooterView *footerView;
  id v25;

  v3 = (UISearchBar *)objc_alloc_init((Class)UISearchBar);
  searchBar = self->_searchBar;
  self->_searchBar = v3;

  -[UISearchBar setTranslatesAutoresizingMaskIntoConstraints:](self->_searchBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UISearchBar setDelegate:](self->_searchBar, "setDelegate:", self);
  v5 = objc_opt_new(UIImage);
  -[UISearchBar setBackgroundImage:](self->_searchBar, "setBackgroundImage:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UISearchBar setBackgroundColor:](self->_searchBar, "setBackgroundColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar layer](self->_searchBar, "layer"));
  objc_msgSend(v7, "setCornerRadius:", 10.0);

  -[UISearchBar setClipsToBounds:](self->_searchBar, "setClipsToBounds:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Networks picker"), CFSTR("localized string not found"), 0));
  -[UISearchBar setPlaceholder:](self->_searchBar, "setPlaceholder:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar searchTextField](self->_searchBar, "searchTextField"));
  objc_msgSend(v10, "setControlSize:", 2);

  -[UISearchBar setReturnKeyType:](self->_searchBar, "setReturnKeyType:", 9);
  -[UISearchBar setContentInset:](self->_searchBar, "setContentInset:", 16.0, 16.0, 10.0, 16.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar searchTextField](self->_searchBar, "searchTextField"));
  objc_msgSend(v11, "setDelegate:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_searchBar);

  v13 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v13;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setAllowsMultipleSelection:](self->_tableView, "setAllowsMultipleSelection:", 1);
  LODWORD(v15) = 1148846080;
  -[UITableView setContentCompressionResistancePriority:forAxis:](self->_tableView, "setContentCompressionResistancePriority:forAxis:", 1, v15);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_dataSource);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self->_dataSource);
  -[UITableView setDirectionalLayoutMargins:](self->_tableView, "setDirectionalLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v16);

  v17 = self->_tableView;
  v18 = objc_opt_class(UITableViewCell);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[ChargingNetworkPickerViewController reuseIdentifier](_TtC4Maps35ChargingNetworkPickerViewController, "reuseIdentifier"));
  -[UITableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v18, v19);

  v20 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 0.0, 2.22507386e-308);
  -[UITableView setTableHeaderView:](self->_tableView, "setTableHeaderView:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[UITableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  objc_msgSend(v22, "addSubview:", self->_tableView);

  v23 = -[MacFooterView initWithNoBlurRightSideButtonsOfType:]([MacFooterView alloc], "initWithNoBlurRightSideButtonsOfType:", 1);
  footerView = self->_footerView;
  self->_footerView = v23;

  -[MacFooterView setTranslatesAutoresizingMaskIntoConstraints:](self->_footerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MacFooterView setDelegate:](self->_footerView, "setDelegate:", self);
  -[MacFooterView setRightButtonEnabled:](self->_footerView, "setRightButtonEnabled:", 0);
  v25 = (id)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  objc_msgSend(v25, "addSubview:", self->_footerView);

}

- (void)_setupConstraints
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
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
  _QWORD v46[10];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar topAnchor](self->_searchBar, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v46[0] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar leadingAnchor](self->_searchBar, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v46[1] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar trailingAnchor](self->_searchBar, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v46[2] = v34;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchBar bottomAnchor](self->_searchBar, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v46[3] = v31;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "safeAreaLayoutGuide"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v27));
  v46[4] = v26;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "safeAreaLayoutGuide"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v22));
  v46[5] = v21;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "safeAreaLayoutGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v17));
  v46[6] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView leadingAnchor](self->_footerView, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v46[7] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView trailingAnchor](self->_footerView, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v46[8] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacFooterView bottomAnchor](self->_footerView, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacChargingNetworksPickerViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v46[9] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 10));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)_updateContent
{
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_updateAddButton
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChargingNetworksDataSource selectedNetworks](self->_dataSource, "selectedNetworks"));
  v4 = objc_msgSend(v3, "count") != 0;

  -[MacFooterView setRightButtonEnabled:](self->_footerView, "setRightButtonEnabled:", v4);
}

- (void)didSelectNetwork:(id)a3 isSuggested:(BOOL)a4
{
  uint64_t v5;
  void *v6;

  if (a4)
    v5 = 455;
  else
    v5 = 443;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v5, 122, 0);

  -[MacChargingNetworksPickerViewController _updateAddButton](self, "_updateAddButton");
}

- (void)didDeselectNetwork:(id)a3 isSuggested:(BOOL)a4
{
  uint64_t v5;
  void *v6;

  if (a4)
    v5 = 439;
  else
    v5 = 448;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", v5, 122, 0);

  -[MacChargingNetworksPickerViewController _updateAddButton](self, "_updateAddButton");
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
  -[MacChargingNetworksPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)macFooterViewRightButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  -[MacChargingNetworksPickerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ChargingNetworksDataSource selectedNetworks](self->_dataSource, "selectedNetworks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(WeakRetained, "networkPickerControllerDidSelectNetworks:", v5);

}

- (void)macFooterViewBackButtonTapped:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v3 = sub_1004318FC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315650;
    v9 = "-[MacChargingNetworksPickerViewController macFooterViewBackButtonTapped:]";
    v10 = 2080;
    v11 = "MacChargingNetworksPickerViewController.m";
    v12 = 1024;
    v13 = 172;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v8, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v5 = sub_1004318FC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[ChargingNetworksDataSource setSearchString:](self->_dataSource, "setSearchString:", a4);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v3;
  _QWORD block[4];
  id v5;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003AF5CC;
  block[3] = &unk_1011AC860;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_)delegate
{
  return (_TtP4Maps43ChargingNetworkPickerViewControllerDelegate_ *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_TtC4Maps26ChargingNetworksDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
