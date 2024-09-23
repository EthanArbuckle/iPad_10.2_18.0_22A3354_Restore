@implementation CarSearchResultsCardViewController

- (CarSearchResultsCardViewController)initWithSearchResults:(id)a3 cellStyle:(int64_t)a4 delegate:(id)a5
{
  id v9;
  id v10;
  CarSearchResultsCardViewController *v11;
  CarSearchResultsCardViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CarSearchResultsCardViewController;
  v11 = -[CarBaseSearchViewController initWithDisabledETAUpdates:](&v14, "initWithDisabledETAUpdates:", 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_searchResults, a3);
    v12->_cellStyle = a4;
    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *loadingIndicatorView;
  id v6;
  double y;
  double width;
  double height;
  UILabel *v10;
  UILabel *loadingLabel;
  double v12;
  void *v13;
  void *v14;
  id v15;
  UILabel *v16;
  void *v17;
  UIStackView *v18;
  UIStackView *loadingStackView;
  UILabel *v20;
  UILabel *errorLabel;
  double v22;
  void *v23;
  void *v24;
  CarTableView *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;
  _QWORD v38[2];

  v37.receiver = self;
  v37.super_class = (Class)CarSearchResultsCardViewController;
  -[CarSearchResultsCardViewController viewDidLoad](&v37, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarSearchResultsCard"));

  v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  loadingIndicatorView = self->_loadingIndicatorView;
  self->_loadingIndicatorView = v4;

  -[UIActivityIndicatorView setAccessibilityIdentifier:](self->_loadingIndicatorView, "setAccessibilityIdentifier:", CFSTR("CarSearchResultsCardLoadingIndicator"));
  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingIndicatorView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc((Class)UILabel);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v10 = (UILabel *)objc_msgSend(v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v10;

  -[UILabel setAccessibilityIdentifier:](self->_loadingLabel, "setAccessibilityIdentifier:", CFSTR("CarSearchResultsCardLoadingLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v12) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_loadingLabel, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  -[UILabel setTextColor:](self->_loadingLabel, "setTextColor:", v13);

  -[UILabel setNumberOfLines:](self->_loadingLabel, "setNumberOfLines:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
  -[UILabel setFont:](self->_loadingLabel, "setFont:", v14);

  -[UILabel setTextAlignment:](self->_loadingLabel, "setTextAlignment:", 1);
  v15 = objc_alloc((Class)UIStackView);
  v16 = self->_loadingLabel;
  v38[0] = self->_loadingIndicatorView;
  v38[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 2));
  v18 = (UIStackView *)objc_msgSend(v15, "initWithArrangedSubviews:", v17);
  loadingStackView = self->_loadingStackView;
  self->_loadingStackView = v18;

  -[UIStackView setAccessibilityIdentifier:](self->_loadingStackView, "setAccessibilityIdentifier:", CFSTR("CarSearchResultsCardLoadingStackView"));
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_loadingStackView, "setAxis:", 1);
  -[UIStackView setSpacing:](self->_loadingStackView, "setSpacing:", 4.0);
  v20 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  errorLabel = self->_errorLabel;
  self->_errorLabel = v20;

  -[UILabel setAccessibilityIdentifier:](self->_errorLabel, "setAccessibilityIdentifier:", CFSTR("CarSearchResultsCardErrorLabel"));
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_errorLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v22) = 1148829696;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_errorLabel, "setContentCompressionResistancePriority:forAxis:", 0, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemSecondaryColor](UIColor, "_carSystemSecondaryColor"));
  -[UILabel setTextColor:](self->_errorLabel, "setTextColor:", v23);

  -[UILabel setNumberOfLines:](self->_errorLabel, "setNumberOfLines:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", UIFontTextStyleCaption1, UIFontWeightRegular));
  -[UILabel setFont:](self->_errorLabel, "setFont:", v24);

  -[UILabel setTextAlignment:](self->_errorLabel, "setTextAlignment:", 1);
  v25 = objc_alloc_init(CarTableView);
  -[CarBaseSearchViewController setTableView:](self, "setTableView:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v26, "setAccessibilityIdentifier:", CFSTR("CarSearchResultsCardTableView"));

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v29, "setBackgroundColor:", v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v31 = objc_opt_class(CarSearchItemCell);
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  objc_msgSend(v30, "registerClass:forCellReuseIdentifier:", v31, v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v33, "addSubview:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v35, "setDataSource:", self);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v36, "setDelegate:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarSearchResultsCardViewController;
  -[CarBaseSearchViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[CarSearchResultsCardViewController _reloadViewsAnimated:](self, "_reloadViewsAnimated:", 0);
}

- (void)setSearchResults:(id)a3
{
  NSArray *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD block[5];
  id v9;
  id location;

  v5 = (NSArray *)a3;
  if (self->_searchResults != v5)
  {
    objc_storeStrong((id *)&self->_searchResults, a3);
    -[CarBaseSearchViewController prepareQuickRouteETAs](self, "prepareQuickRouteETAs");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");

    -[CarBaseSearchViewController continueQuickRouteETAs](self, "continueQuickRouteETAs");
    -[CarSearchResultsCardViewController reloadSearchStateAnimated:](self, "reloadSearchStateAnimated:", 1);
    -[CarSearchResultsCardViewController _captureAnalytics](self, "_captureAnalytics");
    if (self->_state == 1)
    {
      objc_initWeak(&location, self);
      v7 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100AC2CD8;
      block[3] = &unk_1011AD1E8;
      objc_copyWeak(&v9, &location);
      block[4] = self;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }

}

- (void)setState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_state != a3)
  {
    self->_state = a3;
    -[CarSearchResultsCardViewController _reloadViewsAnimated:](self, "_reloadViewsAnimated:", a4);
  }
}

- (void)reloadSearchStateAnimated:(BOOL)a3
{
  -[CarSearchResultsCardViewController setState:animated:](self, "setState:animated:", -[CarSearchResultsCardViewController _searchResultsStateForCurrentSession](self, "_searchResultsStateForCurrentSession"), a3);
}

- (unint64_t)_searchResultsStateForCurrentSession
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  int v12;
  unint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchSession"));

  if (v4)
  {
    if ((objc_msgSend(v4, "isLoading") & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastError"));

      if (v8)
      {
        v5 = 3;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResults"));
        if (objc_msgSend(v9, "count"))
          v5 = 1;
        else
          v5 = 2;

      }
    }
    v10 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = v5;
      goto LABEL_17;
    }
  }
  else
  {
    if (-[NSArray count](self->_searchResults, "count"))
      v5 = 1;
    else
      v5 = 2;
    v6 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = v5;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "SearchResultsCard: state for current search session is: %lu.", (uint8_t *)&v12, 0xCu);
    }
  }

  return v5;
}

- (void)_reloadViewsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t state;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  UIActivityIndicatorView *loadingIndicatorView;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[6];

  v3 = a3;
  if (-[CarSearchResultsCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100AC3220;
    v36[3] = &unk_1011E1AD8;
    v36[4] = self;
    v5 = objc_retainBlock(v36);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100AC3284;
    v35[3] = &unk_1011E1B00;
    v35[4] = self;
    v6 = objc_retainBlock(v35);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100AC33A4;
    v34[3] = &unk_1011E1B00;
    v34[4] = self;
    v7 = objc_retainBlock(v34);
    state = self->_state;
    v27 = v5;
    v9 = ((uint64_t (*)(_QWORD *, unint64_t))v5[2])(v5, state);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v26 = v6;
    v11 = ((uint64_t (*)(_QWORD *, unint64_t))v6[2])(v6, state);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = ((uint64_t (*)(_QWORD *, unint64_t))v7[2])(v7, state);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100AC3708;
    v31[3] = &unk_1011AC8B0;
    v15 = v10;
    v32 = v15;
    v16 = v12;
    v33 = v16;
    v17 = objc_retainBlock(v31);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100AC3748;
    v28[3] = &unk_1011C4ED8;
    v28[4] = self;
    v30 = state;
    v18 = v16;
    v29 = v18;
    v19 = objc_retainBlock(v28);
    loadingIndicatorView = self->_loadingIndicatorView;
    if (state)
      -[UIActivityIndicatorView stopAnimating](loadingIndicatorView, "stopAnimating");
    else
      -[UIActivityIndicatorView startAnimating](loadingIndicatorView, "startAnimating");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController _loadingString](self, "_loadingString"));
    -[UILabel setText:](self->_loadingLabel, "setText:", v21);

    if (state == 2)
      v22 = objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController _noResultsString](self, "_noResultsString"));
    else
      v22 = objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController _errorString](self, "_errorString"));
    v23 = (void *)v22;
    -[UILabel setText:](self->_errorLabel, "setText:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController view](self, "view"));
    objc_msgSend(v24, "addSubview:", v15);

    objc_msgSend(v15, "setAlpha:", 0.0);
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController view](self, "view"));
    objc_msgSend(v25, "layoutIfNeeded");

    if (v3)
    {
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v17, v19, 0.25);
    }
    else
    {
      ((void (*)(_QWORD *))v17[2])(v17);
      ((void (*)(_QWORD *, uint64_t))v19[2])(v19, 1);
    }

  }
}

- (id)_loadingString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchFieldItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchCategory"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Searching for  ... [Search Category]"), CFSTR("localized string not found"), 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortDisplayString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v9));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Searching... [Search Query]"), CFSTR("localized string not found"), 0));
  }

  return v10;
}

- (id)_errorString
{
  CarSearchResultsCardViewController *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  v2 = self;
  switch(MKCurrentNetworkConnectionFailureDiagnosis(self, a2))
  {
    case 0:
    case 4:
      v2 = (CarSearchResultsCardViewController *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController _noResultsString](v2, "_noResultsString"));
      return v2;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("NoSearchResults_AirplaneMode_iPhone");
      goto LABEL_6;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("NoSearchResults_CellDataDisabled");
      goto LABEL_6;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("NoSearchResults_NoNetworkConnection_iPhone");
LABEL_6:
      v2 = (CarSearchResultsCardViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      return v2;
  }
  return v2;
}

- (id)_noResultsString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("no_result_key"), CFSTR("localized string not found"), 0));

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController searchResults](self, "searchResults", a3, a4));
  v5 = objc_msgSend(v4, "count");

  return (int64_t)v5;
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextFocusedView"));
  v10 = objc_opt_class(CarSearchItemCell);
  isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  if ((isKindOfClass & 1) != 0)
  {
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextFocusedView"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForCell:", v20));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_searchResults, "objectAtIndexedSubscript:", objc_msgSend(v12, "row")));
    objc_msgSend(v13, "searchResultsCard:didFocusSearchResult:atIndexPath:", self, v14, v12);

LABEL_8:
    goto LABEL_9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previouslyFocusedView"));

  v16 = objc_opt_class(CarSearchItemCell);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    v17 = v15;
  else
    v17 = 0;
  v18 = v17;

  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForCell:", v18));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController lastSelectedIndexPath](self, "lastSelectedIndexPath"));
  LOBYTE(v18) = objc_msgSend(v20, "isEqual:", v19);

  if ((v18 & 1) == 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
    objc_msgSend(v12, "searchResultsCard:didFocusSearchResult:atIndexPath:", self, 0, 0);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SearchSessionAnalytics *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController searchResults](self, "searchResults"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chromeViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  objc_msgSend(v11, "captureUserAction:mapItem:atResultIndex:", 2007, v12, objc_msgSend(v6, "row"));

  v13 = objc_alloc_init(SearchSessionAnalytics);
  -[SearchSessionAnalytics setAction:](v13, "setAction:", 2007);
  -[SearchSessionAnalytics setTarget:](v13, "setTarget:", 1011);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
  objc_msgSend(v14, "collectSearchSessionAnalytics:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
  objc_msgSend(v15, "searchResultsCard:didSelectSearchResult:", self, v9);

  v16.receiver = self;
  v16.super_class = (Class)CarSearchResultsCardViewController;
  -[CarBaseSearchViewController tableView:didSelectRowAtIndexPath:](&v16, "tableView:didSelectRowAtIndexPath:", v7, v6);

}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController searchResults](self, "searchResults"));
  v6 = objc_msgSend(v4, "row");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v6));
  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  char v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarSearchResultsCardViewController;
  -[CarBaseSearchViewController tableView:willDisplayCell:forRowAtIndexPath:](&v9, "tableView:willDisplayCell:forRowAtIndexPath:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "searchResultsCardDidUpdateVisibleCells:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
    objc_msgSend(v8, "searchResultsCardDidUpdateVisibleCells:", self);

  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  void *v6;
  char v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate", a3, a4, a5));
  v7 = objc_opt_respondsToSelector(v6, "searchResultsCardDidUpdateVisibleCells:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CarSearchResultsCardViewController delegate](self, "delegate"));
    objc_msgSend(v8, "searchResultsCardDidUpdateVisibleCells:", self);

  }
}

- (void)_captureAnalytics
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (-[NSArray count](self->_searchResults, "count"))
  {
    v3 = sub_10039DCD4(self->_searchResults, &stru_1011E1BA0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", ")));

  }
  else
  {
    v8 = 0;
  }
  if (-[NSArray count](self->_searchResults, "count"))
    v5 = 2015;
  else
    v5 = 8011;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  objc_msgSend(v7, "captureUserAction:eventValue:", v5, v8);

}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;

  if (-[CarSearchResultsCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_car_visibleCells"));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v6;

  if (!-[CarSearchResultsCardViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return (NSArray *)v4;
}

- (int64_t)cellStyle
{
  return self->_cellStyle;
}

- (CarSearchResultsCardDelegate)delegate
{
  return (CarSearchResultsCardDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingStackView, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
}

@end
