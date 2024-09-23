@implementation RAPSearchAutocompleteViewController

+ (id)addressAutocompleteViewControllerWithInitialSearchString:(id)a3
{
  id v3;
  RAPSearchAutocompleteViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  RAPSearchAutocompleteViewController *v8;

  v3 = a3;
  v4 = [RAPSearchAutocompleteViewController alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Enter an Address [RAP]"), CFSTR("localized string not found"), 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteBlockFilter addressAutocompleteFilter](RAPSearchAutocompleteBlockFilter, "addressAutocompleteFilter"));
  v8 = -[RAPSearchAutocompleteViewController initWithPlaceholderText:initialSearchString:allowsFreeformResultText:resultTypes:blockFilter:](v4, "initWithPlaceholderText:initialSearchString:allowsFreeformResultText:resultTypes:blockFilter:", v6, v3, 1, 1, v7);

  return v8;
}

+ (id)poiAutocompleteViewControllerWithBoundedMapRegion:(id)a3 excludedMUIDs:(id)a4
{
  id v5;
  id v6;
  RAPSearchAutocompleteViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  RAPSearchAutocompleteViewController *v11;

  v5 = a4;
  v6 = a3;
  v7 = [RAPSearchAutocompleteViewController alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Enter a Place [RAP]"), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteBlockFilter poiAutocompleteFilterWithExcludedMUIDs:](RAPSearchAutocompleteBlockFilter, "poiAutocompleteFilterWithExcludedMUIDs:", v5));

  v11 = -[RAPSearchAutocompleteViewController initWithPlaceholderText:initialSearchString:allowsFreeformResultText:resultTypes:blockFilter:](v7, "initWithPlaceholderText:initialSearchString:allowsFreeformResultText:resultTypes:blockFilter:", v9, 0, 0, 2, v10);
  -[RAPSearchAutocompleteViewController setBoundedMapRegion:](v11, "setBoundedMapRegion:", v6);

  return v11;
}

- (RAPSearchAutocompleteViewController)initWithPlaceholderText:(id)a3 initialSearchString:(id)a4 allowsFreeformResultText:(BOOL)a5 resultTypes:(unint64_t)a6 blockFilter:(id)a7
{
  id v13;
  id v14;
  id v15;
  RAPSearchAutocompleteViewController *v16;
  RAPSearchAutocompleteViewController *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)RAPSearchAutocompleteViewController;
  v16 = -[RAPSearchAutocompleteViewController initWithNibName:bundle:](&v19, "initWithNibName:bundle:", 0, 0);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_placeholderText, a3);
    objc_storeStrong((id *)&v17->_currentSearchString, a4);
    v17->_allowsFreeformResultText = a5;
    v17->_resultTypes = a6;
    objc_storeStrong((id *)&v17->_autocompleteFilter, a7);
  }

  return v17;
}

- (void)setTitleText:(id)a3
{
  id *p_titleText;
  id v6;
  void *v7;
  id v8;

  p_titleText = (id *)&self->_titleText;
  v8 = a3;
  if ((objc_msgSend(*p_titleText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleText, a3);
    v6 = *p_titleText;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v7, "setTitle:", v6);

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UITableView *v5;
  UITableView *tableView;
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
  id v18;
  UISearchController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *currentSearchString;
  void *v25;
  void *v26;
  UISearchController *searchController;
  SearchDataSource *v28;
  SearchDataSource *dataSource;
  SearchDataSource *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
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
  objc_super v46;
  _QWORD v47[4];

  v46.receiver = self;
  v46.super_class = (Class)RAPSearchAutocompleteViewController;
  -[RAPSearchAutocompleteViewController viewDidLoad](&v46, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v5;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
  -[UISearchController setAccessibilityIdentifier:](self->_searchController, "setAccessibilityIdentifier:", CFSTR("RAPAddressSearchBar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController view](self, "view"));
  objc_msgSend(v7, "addSubview:", self->_tableView);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v47[0] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController view](self, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v47[1] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "safeAreaLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v9));
  v47[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v47[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v47, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v16, "setHidesSearchBarWhenScrolling:", 0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController traitCollection](self, "traitCollection"));
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 != (id)5)
  {
    v19 = (UISearchController *)objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
    -[UISearchController setSearchResultsUpdater:](v19, "setSearchResultsUpdater:", self);
    -[UISearchController setObscuresBackgroundDuringPresentation:](v19, "setObscuresBackgroundDuringPresentation:", 0);
    -[UISearchController setHidesNavigationBarDuringPresentation:](v19, "setHidesNavigationBarDuringPresentation:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController placeholderText](self, "placeholderText"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](v19, "searchBar"));
    objc_msgSend(v21, "setPlaceholder:", v20);

    -[UISearchController setActive:](v19, "setActive:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](v19, "searchBar"));
    objc_msgSend(v22, "setReturnKeyType:", 9);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](v19, "searchBar"));
    objc_msgSend(v23, "setDelegate:", self);

    currentSearchString = self->_currentSearchString;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UISearchController searchBar](v19, "searchBar"));
    objc_msgSend(v25, "setText:", currentSearchString);

    -[UISearchController setAutomaticallyShowsCancelButton:](v19, "setAutomaticallyShowsCancelButton:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v26, "setSearchController:", v19);

    searchController = self->_searchController;
    self->_searchController = v19;

  }
  v28 = -[SearchDataSource initWithTableView:]([SearchDataSource alloc], "initWithTableView:", self->_tableView);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", v28);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", v28);
  -[SearchDataSource setResultTypes:](v28, "setResultTypes:", self->_resultTypes);
  -[DataSource setDelegate:](v28, "setDelegate:", self);
  dataSource = self->_dataSource;
  self->_dataSource = v28;
  v30 = v28;

  v31 = objc_alloc((Class)UIBarButtonItem);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("RAPCategory_Cancel"), CFSTR("localized string not found"), 0));
  v34 = objc_msgSend(v31, "initWithTitle:style:target:action:", v33, 0, self, "_cancelTapped");

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v35, "setRightBarButtonItem:", v34);

}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPSearchAutocompleteViewController;
  -[RAPSearchAutocompleteViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100941FF4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_cancelTapped
{
  RAPSearchAutocompleteDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "rapSearchAutocompleteViewControllerDidCancel:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "rapSearchAutocompleteViewControllerDidCancel:", self);

  }
  -[RAPSearchAutocompleteViewController _dismissViewController](self, "_dismissViewController");
}

- (void)_dismissViewController
{
  void *v3;
  id v4;
  id v5;
  id v6;

  -[UISearchController setActive:](self->_searchController, "setActive:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController navigationController](self, "navigationController"));
    v5 = objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
  else
  {
    -[RAPSearchAutocompleteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "defaultTraits"));

    objc_msgSend(v11, "setSource:", 23);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "queryLine"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoCompletionItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ticketForSearchQuery:completionItem:traits:searchSessionData:", v13, v14, v11, 0));

    objc_initWeak(&location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100942364;
    v16[3] = &unk_1011B2AD8;
    v16[4] = self;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v15, "submitWithHandler:networkActivity:", v16, 0);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
}

- (void)dataSourceUpdated:(id)a3
{
  -[UITableView reloadData](self->_tableView, "reloadData", a3);
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  return -[RAPSearchAutocompleteBlockFilter shouldFilterItem:](self->_autocompleteFilter, "shouldFilterItem:", a4);
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  -[RAPSearchAutocompleteViewController _updateWithInputText:](self, "_updateWithInputText:", v4);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  RAPSearchAutocompleteResult *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[RAPSearchAutocompleteViewController allowsFreeformResultText](self, "allowsFreeformResultText"))
  {
    v4 = objc_alloc_init(RAPSearchAutocompleteResult);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    -[RAPSearchAutocompleteResult setSearchBarText:](v4, "setSearchBarText:", v5);

    -[RAPSearchAutocompleteResult setSelectedMapItem:](v4, "setSelectedMapItem:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController delegate](self, "delegate"));
    objc_msgSend(v6, "rapSearchAutocompleteViewController:finishedPickingAutocompleteResult:isAutocompleteResult:", self, v4, 0);

    -[RAPSearchAutocompleteViewController _dismissViewController](self, "_dismissViewController");
  }
  else
  {
    objc_msgSend(v7, "resignFirstResponder");
  }

}

- (void)_updateWithInputText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *currentSearchString;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultTraits"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController boundedMapRegion](self, "boundedMapRegion"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchAutocompleteViewController boundedMapRegion](self, "boundedMapRegion"));
    objc_msgSend(v10, "setMapRegion:", v7);

  }
  -[SearchDataSource setActive:](self->_dataSource, "setActive:", objc_msgSend(v4, "length") != 0);
  if (!-[DataSource active](self->_dataSource, "active"))
    -[SearchDataSource clearAutocompleteResults](self->_dataSource, "clearAutocompleteResults");
  currentSearchString = self->_currentSearchString;
  self->_currentSearchString = (NSString *)v4;
  v9 = v4;

  -[SearchDataSource setInputText:traits:source:](self->_dataSource, "setInputText:traits:source:", self->_currentSearchString, v10, 11);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[RAPSearchAutocompleteViewController _updateWithInputText:](self, "_updateWithInputText:", a4);
}

- (RAPSearchAutocompleteDelegate)delegate
{
  return (RAPSearchAutocompleteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)titleText
{
  return self->_titleText;
}

- (int)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(int)a3
{
  self->_entryPoint = a3;
}

- (GEOMapRegion)boundedMapRegion
{
  return self->_boundedMapRegion;
}

- (void)setBoundedMapRegion:(id)a3
{
  objc_storeStrong((id *)&self->_boundedMapRegion, a3);
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderText, a3);
}

- (BOOL)allowsFreeformResultText
{
  return self->_allowsFreeformResultText;
}

- (void)setAllowsFreeformResultText:(BOOL)a3
{
  self->_allowsFreeformResultText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_boundedMapRegion, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_autocompleteFilter, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
