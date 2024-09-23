@implementation EVOnboardingNetworksSelectionViewController

- (EVOnboardingNetworksSelectionViewController)initWithVehicle:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  EVOnboardingNetworksSelectionViewController *v9;
  EVOnboardingNetworksSelectionViewController *v10;
  _TtC4Maps26ChargingNetworksDataSource *v11;
  _TtC4Maps26ChargingNetworksDataSource *dataSource;
  UISearchController *v13;
  UISearchController *searchController;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)EVOnboardingNetworksSelectionViewController;
  v9 = -[EVOnboardingBaseViewController initWithDelegate:](&v21, "initWithDelegate:", v8);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_vehicle, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = -[ChargingNetworksDataSource initWithExcludedNetworks:context:delegate:]([_TtC4Maps26ChargingNetworksDataSource alloc], "initWithExcludedNetworks:context:delegate:", 0, 0, v10);
    dataSource = v10->_dataSource;
    v10->_dataSource = v11;

    v13 = (UISearchController *)objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    searchController = v10->_searchController;
    v10->_searchController = v13;

    v15 = objc_alloc((Class)UIBarButtonItem);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Next"), CFSTR("localized string not found"), 0));
    v18 = objc_msgSend(v15, "initWithTitle:style:target:action:", v17, 2, v10, "_nextPressed");
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksSelectionViewController navigationItem](v10, "navigationItem"));
    objc_msgSend(v19, "setRightBarButtonItem:", v18);

    -[EVOnboardingNetworksSelectionViewController _updateNextButton](v10, "_updateNextButton");
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  UISearchController *searchController;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EVOnboardingNetworksSelectionViewController;
  -[EVOnboardingBaseViewController viewDidLoad](&v7, "viewDidLoad");
  -[UISearchController setSearchResultsUpdater:](self->_searchController, "setSearchResultsUpdater:", self->_dataSource);
  -[UISearchController setObscuresBackgroundDuringPresentation:](self->_searchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[UISearchController setHidesNavigationBarDuringPresentation:](self->_searchController, "setHidesNavigationBarDuringPresentation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](self->_searchController, "searchBar"));
  objc_msgSend(v3, "setContentInset:", 24.0, 24.0, 24.0, 24.0);

  searchController = self->_searchController;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksSelectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setSearchController:", searchController);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksSelectionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setHidesSearchBarWhenScrolling:", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  const char *v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  _BYTE v33[128];

  v26.receiver = self;
  v26.super_class = (Class)EVOnboardingNetworksSelectionViewController;
  -[EVOnboardingBaseViewController viewWillAppear:](&v26, "viewWillAppear:", a3);
  v4 = 40;
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self->_dataSource);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self->_dataSource);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChargingNetworksDataSource selectedNetworks](self->_dataSource, "selectedNetworks"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v23;
    v10 = "-[EVOnboardingNetworksSelectionViewController viewWillAppear:]";
    *(_QWORD *)&v7 = 138412290;
    v21 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v5);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChargingNetworksDataSource indexPathForNetwork:](self->_dataSource, "indexPathForNetwork:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), v21));
        if (v12)
        {
          objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v4), "selectRowAtIndexPath:animated:scrollPosition:", v12, 0, 0);
        }
        else
        {
          v13 = sub_1004318FC();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v28 = v10;
            v29 = 2080;
            v30 = "EVOnboardingNetworksSelectionViewController.m";
            v31 = 1024;
            v32 = 86;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
          }

          if (sub_100A70734())
          {
            v15 = sub_1004318FC();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = v4;
              v18 = v5;
              v19 = v10;
              v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = v21;
              v28 = v20;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

              v10 = v19;
              v5 = v18;
              v4 = v17;
            }

          }
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    }
    while (v8);
  }

  -[EVOnboardingNetworksSelectionViewController _updateContent](self, "_updateContent");
}

- (id)obViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  _TtC4Maps26ChargingNetworksDataSource *dataSource;
  void *v16;
  _TtC4Maps26ChargingNetworksDataSource *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UITableView *v24;
  UITableView *tableView;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Choose Networks Title"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[EV Onboarding] Choose Networks Subtitle"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VGVehicle combinedDisplayName](self->_vehicle, "combinedDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7));

  v9 = objc_msgSend(objc_alloc((Class)OBTableWelcomeController), "initWithTitle:detailText:symbolName:adoptTableViewScrollView:", v4, v8, 0, 1);
  objc_msgSend(v9, "setModalPresentationStyle:", 2);
  v10 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v9, "setTableView:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  objc_msgSend(v11, "setAllowsMultipleSelection:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  LODWORD(v14) = 1148846080;
  objc_msgSend(v13, "setContentCompressionResistancePriority:forAxis:", 1, v14);

  dataSource = self->_dataSource;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  objc_msgSend(v16, "setDataSource:", dataSource);

  v17 = self->_dataSource;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  objc_msgSend(v18, "setDelegate:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  objc_msgSend(v20, "setBackgroundColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(UITableViewCell), CFSTR("reuseIdentifier"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v23, "setBackgroundColor:", v22);

  v24 = (UITableView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tableView"));
  tableView = self->_tableView;
  self->_tableView = v24;

  return v9;
}

- (void)_updateContent
{
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_updateNextButton
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ChargingNetworksDataSource selectedNetworks](self->_dataSource, "selectedNetworks"));
  v3 = objc_msgSend(v6, "count") != 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksSelectionViewController navigationItem](self, "navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rightBarButtonItem"));
  objc_msgSend(v5, "setEnabled:", v3);

}

- (void)_nextPressed
{
  id v3;
  NSObject *v4;
  EVOnboardingNetworksSelectionViewController *v5;
  EVOnboardingNetworksSelectionViewController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  const char *v19;

  v3 = sub_10043173C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[EVOnboardingNetworksSelectionViewController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v17 = v12;
    v18 = 2080;
    v19 = "-[EVOnboardingNetworksSelectionViewController _nextPressed]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] %s", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChargingNetworksDataSource selectedNetworks](self->_dataSource, "selectedNetworks"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
  objc_msgSend(WeakRetained, "networksSelectionViewController:didSelectNetworks:forVehicle:", self, v15, self->_vehicle);

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

  -[EVOnboardingNetworksSelectionViewController _updateNextButton](self, "_updateNextButton");
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

  -[EVOnboardingNetworksSelectionViewController _updateNextButton](self, "_updateNextButton");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
