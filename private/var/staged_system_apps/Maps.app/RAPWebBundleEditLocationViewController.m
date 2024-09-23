@implementation RAPWebBundleEditLocationViewController

- (RAPWebBundleEditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 mapType:(unint64_t)a5 isShowingTraffic:(BOOL)a6 analyticsTarget:(int)a7 markerViewAttributes:(id)a8 showAnnotationTitle:(BOOL)a9 searchResultTypes:(unint64_t)a10 selectionHandler:(id)a11 cancelSelectionHandler:(id)a12
{
  uint64_t v15;
  double var1;
  double var0;
  double v19;
  double v20;
  double longitude;
  double latitude;
  id v24;
  id v25;
  id v26;
  RAPCorrectableEntryPoints *v27;
  RAPWebBundleEditLocationViewController *v28;
  _BOOL4 v30;
  objc_super v31;

  v15 = *(_QWORD *)&a7;
  v30 = a6;
  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v19 = a4.var0.var1;
  v20 = a4.var0.var0;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v24 = a12;
  v25 = a11;
  v26 = a8;
  v27 = -[RAPCorrectableEntryPoints initWithGEORoadAccessPoints:]([RAPCorrectableEntryPoints alloc], "initWithGEORoadAccessPoints:", &__NSArray0__struct);
  v31.receiver = self;
  v31.super_class = (Class)RAPWebBundleEditLocationViewController;
  v28 = -[RAPEditLocationViewController initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:](&v31, "initWithInitialCoordinates:inMapRect:analyticsTarget:markerViewAttributes:allowEditingEntryPoints:correctableEntryPoints:selectionHandler:cancelSelectionHandler:", v15, v26, 0, v27, v25, v24, latitude, longitude, v20, v19, var0, var1);

  if (v28)
  {
    v28->_showAnnotationTitle = a9;
    v28->_resultTypes = a10;
    -[EditLocationViewController setMapType:](v28, "setMapType:", a5);
    -[EditLocationViewController setIsShowingTraffic:](v28, "setIsShowingTraffic:", v30);
  }
  return v28;
}

- (void)setPromptText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setPrompt:", v4);

}

- (NSString)promptText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController navigationItem](self, "navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "prompt"));

  return (NSString *)v3;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  if (sub_1002A8AA0(self) != 5)
    -[RAPWebBundleEditLocationViewController _setupFloatingConrols](self, "_setupFloatingConrols");
  v4.receiver = self;
  v4.super_class = (Class)RAPWebBundleEditLocationViewController;
  -[RAPEditLocationViewController viewDidLoad](&v4, "viewDidLoad");
  -[RAPWebBundleEditLocationViewController _setupSearch](self, "_setupSearch");
  if (sub_1002A8AA0(self) != 5)
    -[RAPWebBundleEditLocationViewController _setupFloatingControlsAfterMapInitialized](self, "_setupFloatingControlsAfterMapInitialized");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v3, "setPrompt:", &stru_1011EB268);

}

- (void)_setupFloatingConrols
{
  IOSFloatingControlsViewController *v3;
  IOSFloatingControlsViewController *floatingControlsViewController;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(IOSFloatingControlsViewController);
  floatingControlsViewController = self->_floatingControlsViewController;
  self->_floatingControlsViewController = v3;

  -[FloatingControlsViewController setOpenSettingsDelegate:](self->_floatingControlsViewController, "setOpenSettingsDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self->_floatingControlsViewController, "view"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[RAPWebBundleEditLocationViewController addChildViewController:](self, "addChildViewController:", self->_floatingControlsViewController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self->_floatingControlsViewController, "view"));
  objc_msgSend(v6, "addSubview:", v7);

  -[PassThroughViewController didMoveToParentViewController:](self->_floatingControlsViewController, "didMoveToParentViewController:", self);
}

- (void)_setupFloatingControlsAfterMapInitialized
{
  void *v3;
  IOSFloatingControlsViewController *floatingControlsViewController;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  -[FloatingControlsViewController setMapViewProviding:](self->_floatingControlsViewController, "setMapViewProviding:", v3);

  floatingControlsViewController = self->_floatingControlsViewController;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));
  -[IOSFloatingControlsViewController mapView:regionDidChangeAnimated:](floatingControlsViewController, "mapView:regionDidChangeAnimated:", v6, 0);

  -[IOSFloatingControlsViewController showControlsIfNeeded:animated:](self->_floatingControlsViewController, "showControlsIfNeeded:animated:", 3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self->_floatingControlsViewController, "view"));
  objc_msgSend(v7, "bringSubviewToFront:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  objc_msgSend(v9, "bringSubviewToFront:", self->_tableView);

}

- (void)_setupSearch
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITableView *v10;
  UITableView *tableView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SearchDataSource *v21;
  SearchDataSource *dataSource;
  SearchDataSource *v23;
  RAPSearchAutocompleteBlockFilter *v24;
  RAPSearchAutocompleteBlockFilter *autocompleteFilter;
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
  _QWORD v38[4];

  v3 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
  objc_msgSend(v3, "setDelegate:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("[Report an Issue Map] Search"), CFSTR("localized string not found"), 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v6, "setPlaceholder:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v7, "setReturnKeyType:", 9);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v8, "setDelegate:", self);

  objc_msgSend(v3, "setObscuresBackgroundDuringPresentation:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setSearchController:", v3);

  objc_storeStrong((id *)&self->_searchController, v3);
  v10 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  tableView = self->_tableView;
  self->_tableView = v10;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setKeyboardDismissMode:](self->_tableView, "setKeyboardDismissMode:", 1);
  -[UITableView setRowHeight:](self->_tableView, "setRowHeight:", UITableViewAutomaticDimension);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  objc_msgSend(v12, "addSubview:", self->_tableView);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v38[0] = v34;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v38[1] = v30;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView topAnchor](self->_tableView, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "safeAreaLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v13));
  v38[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "safeAreaLayoutGuide"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v18));
  v38[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

  v21 = -[SearchDataSource initWithTableView:]([SearchDataSource alloc], "initWithTableView:", self->_tableView);
  -[SearchDataSource setResultTypes:](v21, "setResultTypes:", self->_resultTypes);
  -[DataSource setDelegate:](v21, "setDelegate:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", v21);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", v21);
  -[UITableView setHidden:](self->_tableView, "setHidden:", 1);
  dataSource = self->_dataSource;
  self->_dataSource = v21;
  v23 = v21;

  if ((self->_resultTypes & 4) != 0)
    v24 = (RAPSearchAutocompleteBlockFilter *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteBlockFilter poiAutocompleteFilterWithExcludedMUIDs:](RAPSearchAutocompleteBlockFilter, "poiAutocompleteFilterWithExcludedMUIDs:", &__NSArray0__struct));
  else
    v24 = (RAPSearchAutocompleteBlockFilter *)objc_claimAutoreleasedReturnValue(+[RAPSearchAutocompleteBlockFilter addressAutocompleteFilter](RAPSearchAutocompleteBlockFilter, "addressAutocompleteFilter"));
  autocompleteFilter = self->_autocompleteFilter;
  self->_autocompleteFilter = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v26, "setHideAllSuplementaryViews:", 1);

}

- (void)setupConstraints
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
  objc_super v14;
  _QWORD v15[2];

  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleEditLocationViewController;
  -[RAPEditLocationViewController setupConstraints](&v14, "setupConstraints");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self->_floatingControlsViewController, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 16.0));
  v15[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IOSFloatingControlsViewController view](self->_floatingControlsViewController, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, -16.0));
  v15[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;
  objc_super v8;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPWebBundleEditLocationViewController;
  -[RAPEditLocationViewController editLocationMapView:didChangeCenterCoordinate:](&v8, "editLocationMapView:didChangeCenterCoordinate:", v7, latitude, longitude);
  if (self->_showAnnotationTitle)
    objc_msgSend(v7, "updateAnnotationTitleWithCenterCoordinate:", latitude, longitude);

}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  if (-[RAPEditLocationViewController _isInEditLocationMode](self, "_isInEditLocationMode"))
  {
    v8.receiver = self;
    v8.super_class = (Class)RAPWebBundleEditLocationViewController;
    -[RAPEditLocationViewController editLocationMapView:didChangeViewMode:](&v8, "editLocationMapView:didChangeViewMode:", v6, a4);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v7, "setHideAllSuplementaryViews:", 1);

}

- (void)editLocationMapViewFinishedRenderingMap:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (self->_showAnnotationTitle)
  {
    v4 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapView"));
    objc_msgSend(v5, "centerCoordinate");
    objc_msgSend(v4, "updateAnnotationTitleWithCenterCoordinate:");

  }
}

- (void)willPresentSearchController:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController navigationItem](self, "navigationItem", a3));
  objc_msgSend(v4, "setPrompt:", 0);

  -[UITableView setHidden:](self->_tableView, "setHidden:", 0);
}

- (void)willDismissSearchController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController promptText](self, "promptText", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleEditLocationViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "setPrompt:", v4);

  -[UITableView setHidden:](self->_tableView, "setHidden:", 1);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  -[RAPWebBundleEditLocationViewController _updateWithInputText:](self, "_updateWithInputText:", a4);
}

- (void)_updateWithInputText:(id)a3
{
  id v4;
  void *v5;
  NSString *currentSearchString;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultTraits"));

  -[SearchDataSource setActive:](self->_dataSource, "setActive:", objc_msgSend(v4, "length") != 0);
  if (!-[DataSource active](self->_dataSource, "active"))
    -[SearchDataSource clearAutocompleteResults](self->_dataSource, "clearAutocompleteResults");
  currentSearchString = self->_currentSearchString;
  self->_currentSearchString = (NSString *)v4;
  v7 = v4;

  -[SearchDataSource setInputText:traits:source:](self->_dataSource, "setInputText:traits:source:", self->_currentSearchString, v8, 11);
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
  _QWORD v16[4];
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
    v16[2] = sub_1002541E4;
    v16[3] = &unk_1011AD9D0;
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

- (void)viewControllerOpenSettings:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView", a3));
  objc_msgSend(v4, "setHideAllSuplementaryViews:", 0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v5, "setPrompt:", &stru_1011EB268);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingControlsViewController, 0);
  objc_storeStrong((id *)&self->_autocompleteFilter, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
}

@end
