@implementation ResultsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateTheme
{
  UITableView *contentTableView;
  void *v3;
  id v4;

  contentTableView = self->_contentTableView;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ResultsViewController theme](self, "theme"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hairlineColor"));
  -[UITableView setSeparatorColor:](contentTableView, "setSeparatorColor:", v3);

}

- (BOOL)hasResults
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentResults"));
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)refreshCurrentSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchFieldItem"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", &off_101274908));
  if (-[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("kAddStopFromWaypointEditor"));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultRefinementGroup"));

  if (v7)
  {
    v8 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
    objc_msgSend(v8, "setResultRefinementOriginType:", self->_lastRefinementOriginType);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultRefinementGroup"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "refinementSessionState"));
    objc_msgSend(v8, "setRefinementSessionState:", v10);

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultRefinementGroup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "resultRefinementBar"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resultRefinements"));

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v17), "convertToGEOPDResultRefinement"));
          objc_msgSend(v8, "addRefinement:", v18);

          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultRefinementGroup", 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resultRefinementView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sections"));

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v29;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v29 != v24)
            objc_enumerationMutation(v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v25), "convertToGEOPDResultRefinementSection"));
          objc_msgSend(v8, "addRefinementSection:", v26);

          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v23);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v27, "viewController:doSearchItem:withUserInfo:refinementsQuery:", self, v4, v6, v8);

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v8, "viewController:doSearchItem:withUserInfo:", self, v4, v6);
  }

}

- (BOOL)shouldShowSearchOverlay
{
  if (MapsFeature_IsEnabled_SearchAndDiscovery(self))
    return -[ResultsViewController hasResults](self, "hasResults");
  else
    return self->_hasViewAppeared;
}

- (id)loadingModeView
{
  LoadingModeView *loadingModeView;
  LoadingModeView *v4;
  void *v5;
  void *v6;
  LoadingModeView *v7;
  LoadingModeView *v8;

  loadingModeView = self->_loadingModeView;
  if (!loadingModeView)
  {
    v4 = [LoadingModeView alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
    v7 = -[LoadingModeView initWithTitle:](v4, "initWithTitle:", v6);
    v8 = self->_loadingModeView;
    self->_loadingModeView = v7;

    loadingModeView = self->_loadingModeView;
  }
  return loadingModeView;
}

- (id)errorModeView
{
  ErrorModeView *errorModeView;
  ErrorModeView *v4;
  ErrorModeView *v5;

  errorModeView = self->_errorModeView;
  if (!errorModeView)
  {
    v4 = objc_alloc_init(ErrorModeView);
    v5 = self->_errorModeView;
    self->_errorModeView = v4;

    -[ErrorModeView setSpacing:](self->_errorModeView, "setSpacing:", 0.0);
    errorModeView = self->_errorModeView;
  }
  return errorModeView;
}

- (id)contentTableView
{
  UITableView *contentTableView;
  MapsThemeTableView *v4;
  UITableView *v5;
  void *v6;
  void *v7;

  contentTableView = self->_contentTableView;
  if (!contentTableView)
  {
    v4 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_contentTableView;
    self->_contentTableView = &v4->super;

    -[UITableView setAccessibilityIdentifier:](self->_contentTableView, "setAccessibilityIdentifier:", CFSTR("ResultsViewTable"));
    -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentTableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setBackgroundColor:](self->_contentTableView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITableView setSectionIndexBackgroundColor:](self->_contentTableView, "setSectionIndexBackgroundColor:", v7);

    -[UITableView _setHeaderAndFooterViewsFloat:](self->_contentTableView, "_setHeaderAndFooterViewsFloat:", 0);
    -[UITableView setSectionHeaderTopPadding:](self->_contentTableView, "setSectionHeaderTopPadding:", 0.0);
    -[UITableView setPreservesSuperviewLayoutMargins:](self->_contentTableView, "setPreservesSuperviewLayoutMargins:", 1);
    contentTableView = self->_contentTableView;
  }
  return contentTableView;
}

- (id)localSearchViewController
{
  LocalSearchViewController *localSearchViewController;
  LocalSearchViewController *v4;
  LocalSearchViewController *v5;
  void *v6;
  void *v7;

  localSearchViewController = self->_localSearchViewController;
  if (!localSearchViewController)
  {
    v4 = -[LocalSearchViewController initAsButton:]([LocalSearchViewController alloc], "initAsButton:", 0);
    v5 = self->_localSearchViewController;
    self->_localSearchViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController view](self->_localSearchViewController, "view"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    -[LocalSearchViewController setEnable:](self->_localSearchViewController, "setEnable:", objc_msgSend(v7, "containerStyle") != (id)6);

    -[LocalSearchViewController setDelegate:](self->_localSearchViewController, "setDelegate:", self);
    localSearchViewController = self->_localSearchViewController;
  }
  return localSearchViewController;
}

- (id)noResultString
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  switch(MKCurrentNetworkConnectionFailureDiagnosis(self, a2))
  {
    case 0:
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("no_result_key");
      goto LABEL_6;
    case 1:
      switch(MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0))
      {
        case 1u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_AirplaneMode_iPhone");
          break;
        case 2u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_AirplaneMode_iPod");
          break;
        case 3u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_AirplaneMode_iPad");
          break;
        case 6u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_AirplaneMode_Watch");
          break;
        default:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_AirplaneMode_Device");
          break;
      }
      goto LABEL_6;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("NoSearchResults_CellDataDisabled");
      goto LABEL_6;
    case 3:
      switch(MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0))
      {
        case 1u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_NoNetworkConnection_iPhone");
          break;
        case 2u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_NoNetworkConnection_iPod");
          break;
        case 3u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_NoNetworkConnection_iPad");
          break;
        case 6u:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_NoNetworkConnection_Watch");
          break;
        default:
          v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v4 = v3;
          v5 = CFSTR("NoSearchResults_NoNetworkConnection_Device");
          break;
      }
LABEL_6:
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      return v2;
  }
  return v2;
}

- (SearchSession)searchSession
{
  void *v3;
  SearchSession *searchSession;
  SearchSession *v5;
  SearchSession *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  searchSession = (SearchSession *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSearchSession"));
  v5 = searchSession;
  if (!searchSession)
    searchSession = self->_searchSession;
  v6 = searchSession;

  return v6;
}

- (void)setSearchSession:(id)a3
{
  SearchSession *v5;
  SearchSession *v6;

  v5 = (SearchSession *)a3;
  if (self->_searchSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_searchSession, a3);
    -[ResultsViewController updateSearchSession](self, "updateSearchSession");
    v5 = v6;
  }

}

- (id)originalSearchInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchInfo"));

  return v3;
}

- (void)refreshEVChargers:(id)a3
{
  SearchResultsDataSource *searchResultsDataSource;

  searchResultsDataSource = self->_searchResultsDataSource;
  if (searchResultsDataSource)
    -[SearchResultsDataSource refreshEVChargers:](searchResultsDataSource, "refreshEVChargers:", a3);
}

- (void)updateSearchSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;

  v42 = (id)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "lastError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refreshSearchHereBusinessController"));
  objc_msgSend(v6, "setSearchSession:", v42);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
  if (!v7)
    goto LABEL_41;
  v8 = -[ResultsViewController isWaitingForResults](self, "isWaitingForResults");
  v9 = objc_msgSend(v42, "isResultRefinementsBarSearch") ^ 1;
  v10 = v9 & v8;
  if ((v9 & 1) == 0)
  {
    v11 = v42;
    if (!v8)
      goto LABEL_6;
    v10 = objc_msgSend((id)objc_opt_class(self), "isReloadingRefinementsWithSearchSession:", v42) ^ 1;
  }
  v11 = v42;
LABEL_6:
  if (objc_msgSend(v11, "isSpotlightPunchInSearch"))
  {
    -[ResultsViewController setHideHeader:](self, "setHideHeader:", 1);
  }
  else
  {
    -[ResultsViewController setHideHeader:](self, "setHideHeader:", v10);
    -[ResultsViewController setHeaderContentWithSearchSession:](self, "setHeaderContentWithSearchSession:", v42);
  }
  v12 = -[ResultsViewController isWaitingForResults](self, "isWaitingForResults");
  v13 = objc_msgSend(v42, "isResultRefinementsBarSearch");
  if (v12)
  {
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RefinementsBarUIView viewModel](self->_refinementsBar, "viewModel"));
      objc_msgSend(v14, "setTapInteractionEnabled:", 0);

    }
    -[ResultsViewController waitingData](self, "waitingData");
    goto LABEL_42;
  }
  if (v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RefinementsBarUIView viewModel](self->_refinementsBar, "viewModel"));
    objc_msgSend(v15, "setTapInteractionEnabled:", 1);

  }
  if (!v4
    || objc_msgSend(v42, "isRedoOrAutoRedoSearchType")
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "currentResults")),
        v17 = objc_msgSend(v16, "count"),
        v16,
        v17))
  {
    if (!v3)
    {
      -[ResultsViewController setResultsList:](self, "setResultsList:", 0);
LABEL_41:
      -[ResultsViewController logNoSearchResult](self, "logNoSearchResult");
      goto LABEL_42;
    }
    if (objc_msgSend(v3, "searchResultType") == 1)
    {
      if (!objc_msgSend(v42, "isSpotlightPunchInSearch")
        || (objc_msgSend(v42, "spotlightMatchingResultFound") & 1) == 0)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "currentResults"));
        -[ResultsViewController setResultsList:](self, "setResultsList:", v18);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
      v20 = objc_msgSend(v19, "count");

      if (v20)
        goto LABEL_41;
    }
    else
    {
      if (objc_msgSend(v3, "searchResultType") != 2)
      {
        if (objc_msgSend(v3, "searchResultType") == 3)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "currentResults"));
          -[ResultsViewController setResultsList:](self, "setResultsList:", v37);
        }
        else
        {
          if (objc_msgSend(v3, "searchResultType") != 4)
            goto LABEL_41;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "currentResults"));
          -[ResultsViewController setResultsList:](self, "setResultsList:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "results"));
          v41 = objc_msgSend(v40, "count");

          if (v41)
            goto LABEL_41;
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController noResultString](self, "noResultString"));
          -[ResultsViewController showError:hideRefinementsBar:](self, "showError:hideRefinementsBar:", v37, 0);
        }
        goto LABEL_40;
      }
      -[ResultsViewController setResultsList:](self, "setResultsList:", 0);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultDisplayHeader"));
    v35 = v34;
    if (v34)
      v36 = v34;
    else
      v36 = (id)objc_claimAutoreleasedReturnValue(-[ResultsViewController noResultString](self, "noResultString"));
    v37 = v36;

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultDisplayHeader"));
    -[ResultsViewController showError:hideRefinementsBar:](self, "showError:hideRefinementsBar:", v37, v38 != 0);

LABEL_40:
    goto LABEL_41;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController noResultString](self, "noResultString"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v23 = objc_msgSend(v22, "isUsingOfflineMaps");

  if (v23)
  {
    -[ResultsViewController _showOfflineErrorView](self, "_showOfflineErrorView");
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastError"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "domain"));
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("SearchFindMy"));

    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Location Update] Unable to Refresh for person"), CFSTR("localized string not found"), 0));

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "searchFieldItem"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "title"));
      v33 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v29, v32));

      -[ResultsViewController setHideHeader:](self, "setHideHeader:", 1);
      v21 = (void *)v33;
    }
    -[ResultsViewController showError:hideRefinementsBar:](self, "showError:hideRefinementsBar:", v21, 0);
    -[LoadingModeView setHidden:](self->_loadingModeView, "setHidden:", 1);
    -[ResultsViewController _updateResultRefinementBarFromSearchInfo:](self, "_updateResultRefinementBarFromSearchInfo:", v3);
  }
  -[ResultsViewController logNoSearchResult](self, "logNoSearchResult");

LABEL_42:
}

- (void)logNoSearchResult
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  if (objc_msgSend(v6, "isLoading"))
  {

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentResults"));
    v5 = objc_msgSend(v4, "count");

    if (!v5)
      +[SearchResultsAnalyticsManager logNoSearchResults:](SearchResultsAnalyticsManager, "logNoSearchResults:", -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));
  }
}

- (void)setResultsList:(id)a3
{
  id *p_resultsList;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SearchResultsDataSource **p_searchResultsDataSource;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  AlphabeticallyOrderedDataSource *v20;
  void *v21;
  void *v22;
  id v23;
  SearchListOrderedDataSource *v24;
  id v25;
  void *v26;
  SearchResultsDataSourceContent *v27;
  SearchResultsDataSource *v28;
  void *v29;
  IdenticallyOrderedDataSource *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;

  p_resultsList = (id *)&self->_resultsList;
  v38 = a3;
  if (*p_resultsList != v38)
  {
    self->_didTriggerAutoRedoSearch = 0;
    objc_storeStrong((id *)&self->_resultsList, a3);
    if (!-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
      -[ResultsViewController setHideHeader:](self, "setHideHeader:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
    objc_msgSend(v7, "setSessionIdentifier:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentResultsSearchInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchText"));
      if (v11)
      {
        p_searchResultsDataSource = &self->_searchResultsDataSource;
        -[SearchResultsDataSource setSearchQuery:](self->_searchResultsDataSource, "setSearchQuery:", v11);
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchFieldItem"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
        p_searchResultsDataSource = &self->_searchResultsDataSource;
        -[SearchResultsDataSource setSearchQuery:](self->_searchResultsDataSource, "setSearchQuery:", v14);

      }
      -[SearchResultsDataSource setDisplaysAsChainResult:](*p_searchResultsDataSource, "setDisplaysAsChainResult:", objc_msgSend(v10, "isChainResults"));
      -[SearchResultsDataSource setPrefersAddressOverCategory:](*p_searchResultsDataSource, "setPrefersAddressOverCategory:", objc_msgSend(v10, "prefersAddressOverCategory"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchFieldItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchCategory"));
      -[SearchResultsDataSource setSearchCategory:](*p_searchResultsDataSource, "setSearchCategory:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "placeSummaryMetadata"));
      -[SearchResultsDataSource setPlaceSummaryMetadata:](*p_searchResultsDataSource, "setPlaceSummaryMetadata:", v17);

      -[SearchResultsDataSource setEnableStructuredRAPAffordance:](*p_searchResultsDataSource, "setEnableStructuredRAPAffordance:", objc_msgSend(v10, "enableStructuredRAPAffordance"));
      -[SearchResultsDataSource setIsPresentingAddStopResultsFromWaypointEditor:](*p_searchResultsDataSource, "setIsPresentingAddStopResultsFromWaypointEditor:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sessionIdentifier"));
      -[SearchResultsDataSource setImpressionsSessionIdentifier:](*p_searchResultsDataSource, "setImpressionsSessionIdentifier:", v19);

      if (objc_msgSend(v10, "sortOrder") == (id)1)
      {
        v20 = -[AlphabeticallyOrderedDataSource initWithAlphabeticallySortableObject:]([AlphabeticallyOrderedDataSource alloc], "initWithAlphabeticallySortableObject:", v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource sectionIndexTitles](v20, "sectionIndexTitles"));
        -[SearchResultsDataSource setSectionIndexTitles:](*p_searchResultsDataSource, "setSectionIndexTitles:", v21);

      }
      else
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchSectionList"));
        if (v22)
        {
          v23 = *p_resultsList;

          if (v23)
          {
            v24 = [SearchListOrderedDataSource alloc];
            v25 = *p_resultsList;
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchSectionList"));
            v20 = -[SearchListOrderedDataSource initWithObjects:searchSectionList:](v24, "initWithObjects:searchSectionList:", v25, v26);

            -[SearchResultsDataSource setSectionIndexTitles:](*p_searchResultsDataSource, "setSectionIndexTitles:", 0);
            v27 = -[SearchResultsDataSourceContent initWithOrderedDataSource:]([SearchResultsDataSourceContent alloc], "initWithOrderedDataSource:", v20);
            v28 = *p_searchResultsDataSource;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "openAt"));
            -[SearchResultsDataSource setContent:openAt:](v28, "setContent:openAt:", v27, v29);

            goto LABEL_18;
          }
        }
        v30 = [IdenticallyOrderedDataSource alloc];
        if (*p_resultsList)
          v31 = *p_resultsList;
        else
          v31 = &__NSArray0__struct;
        v20 = -[IdenticallyOrderedDataSource initWithObjects:](v30, "initWithObjects:", v31);
        -[SearchResultsDataSource setSectionIndexTitles:](*p_searchResultsDataSource, "setSectionIndexTitles:", 0);
      }
      v27 = -[SearchResultsDataSourceContent initWithOrderedDataSource:]([SearchResultsDataSourceContent alloc], "initWithOrderedDataSource:", v20);
      -[SearchResultsDataSource setContent:](*p_searchResultsDataSource, "setContent:", v27);
LABEL_18:

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "venuesManager"));
      objc_msgSend(v33, "venuesControlCoordinatingDidChangeSearchResultCount:", self);

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "venuesManager"));
      objc_msgSend(v35, "updateFocusedVenueFloor");

      -[LoadingModeView setHidden:](self->_loadingModeView, "setHidden:", 1);
      if (*p_resultsList)
      {
        if (objc_msgSend(*p_resultsList, "count")
          || (v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "suggestions")),
              v37 = objc_msgSend(v36, "count"),
              v36,
              v37))
        {
          -[ResultsViewController showError:](self, "showError:", 0);
          -[UITableView setHidden:](self->_contentTableView, "setHidden:", 0);
        }
      }
      -[ResultsViewController _updateResultRefinementBarFromSearchInfo:](self, "_updateResultRefinementBarFromSearchInfo:", v10);

    }
  }

}

- (void)setDataSource:(id)a3
{
  DataSource *v5;
  DataSource *currentDataSource;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DataSource *v13;

  v5 = (DataSource *)a3;
  currentDataSource = self->_currentDataSource;
  if (currentDataSource != v5)
  {
    v13 = v5;
    -[DataSource setActive:](currentDataSource, "setActive:", 0);
    objc_storeStrong((id *)&self->_currentDataSource, a3);
    -[UITableView setDelegate:](self->_contentTableView, "setDelegate:", v13);
    -[UITableView setDataSource:](self->_contentTableView, "setDataSource:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsDragAndDropManager sharedManager](MapsDragAndDropManager, "sharedManager"));
    v8 = objc_msgSend(v7, "deviceSupportsDragAndDrop");

    if (v8)
      -[UITableView setDragDelegate:](self->_contentTableView, "setDragDelegate:", v13);
    -[DataSource setActive:](self->_currentDataSource, "setActive:", 1);
    -[UITableView reloadData](self->_contentTableView, "reloadData");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venuesManager"));
    objc_msgSend(v10, "venuesControlCoordinatingDidChangeSearchResultCount:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venuesManager"));
    objc_msgSend(v12, "updateFocusedVenueFloor");

    v5 = v13;
  }

}

- (void)showError:(id)a3
{
  -[ResultsViewController showError:hideRefinementsBar:](self, "showError:hideRefinementsBar:", a3, a3 != 0);
}

- (void)_showOfflineErrorView
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  ErrorModeView *errorModeView;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No results found in your offline map. Connect to the internet for more search results."), CFSTR("localized string not found"), CFSTR("Offline")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v6 = objc_msgSend(v5, "isUsingForcedOfflineMaps");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = v7;
  if (v6)
    v9 = CFSTR("Using Offline Maps");
  else
    v9 = CFSTR("You’re Offline");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), CFSTR("Offline")));

  -[ResultsViewController showError:hideRefinementsBar:](self, "showError:hideRefinementsBar:", v4, 0);
  -[ErrorModeView setTitle:andMessage:](self->_errorModeView, "setTitle:andMessage:", v10, v4);
  -[ErrorModeView insertErrorIcon:atIndex:](self->_errorModeView, "insertErrorIcon:atIndex:", CFSTR("icloud.slash"), 0);
  if (v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Turn Off"), CFSTR("localized string not found"), CFSTR("Offline")));

    objc_initWeak(&location, self);
    errorModeView = self->_errorModeView;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100A0A740;
    v14[3] = &unk_1011B4EB8;
    objc_copyWeak(&v15, &location);
    -[ErrorModeView setButtonTitle:handler:](errorModeView, "setButtonTitle:handler:", v12, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
}

- (void)showError:(id)a3 hideRefinementsBar:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ErrorModeView *errorModeView;
  void *v13;
  void *v14;
  ErrorModeView *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[UITableView setHidden:](self->_contentTableView, "setHidden:", 1);
    -[LoadingModeView setHidden:](self->_loadingModeView, "setHidden:", 1);
    if (v4)
      -[ResultsViewController setHideRefinementsBar:](self, "setHideRefinementsBar:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController errorModeView](self, "errorModeView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v7, "insertSubview:belowSubview:", v8, v9);

    -[ResultsViewController _updateLoadingErrorFrames](self, "_updateLoadingErrorFrames");
    -[ErrorModeView setTitle:andMessage:](self->_errorModeView, "setTitle:andMessage:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentResultsSearchInfo"));
    LODWORD(v9) = objc_msgSend(v11, "enableStructuredRAPAffordance");

    if ((_DWORD)v9)
    {
      objc_initWeak(&location, self);
      errorModeView = self->_errorModeView;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Add a Missing Place"), CFSTR("localized string not found"), 0));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100A0A9C4;
      v16[3] = &unk_1011B4EB8;
      objc_copyWeak(&v17, &location);
      -[ErrorModeView setButtonTitle:handler:](errorModeView, "setButtonTitle:handler:", v14, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[ErrorModeView removeFromSuperview](self->_errorModeView, "removeFromSuperview");
    v15 = self->_errorModeView;
    self->_errorModeView = 0;

  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  ResultRefinementsAnalyticsManager *v14;
  ResultRefinementsAnalyticsManager *analyticsManager;
  SearchResultsDataSource *v16;
  SearchResultsDataSource *searchResultsDataSource;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)ResultsViewController;
  -[ContaineeViewController viewDidLoad](&v20, "viewDidLoad");
  -[ResultsViewController configureHeader](self, "configureHeader");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController contentTableView](self, "contentTableView"));
  objc_msgSend(v3, "addSubview:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController loadingModeView](self, "loadingModeView"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController errorModeView](self, "errorModeView"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
  v10 = (objc_class *)objc_opt_class(self);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Controller"), &stru_1011EB268));
  objc_msgSend(v9, "setAccessibilityIdentifier:", v13);

  -[ResultsViewController setupConstraints](self, "setupConstraints");
  v14 = -[ResultRefinementsAnalyticsManager initWithRefinementsFromWaypointEditor:]([ResultRefinementsAnalyticsManager alloc], "initWithRefinementsFromWaypointEditor:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"));
  analyticsManager = self->_analyticsManager;
  self->_analyticsManager = v14;

  v16 = -[SearchResultsDataSource initWithTableView:]([SearchResultsDataSource alloc], "initWithTableView:", self->_contentTableView);
  searchResultsDataSource = self->_searchResultsDataSource;
  self->_searchResultsDataSource = v16;

  -[DataSource setDelegate:](self->_searchResultsDataSource, "setDelegate:", self);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "appCoordinator"));
  -[SearchResultsDataSource setShareDelegate:](self->_searchResultsDataSource, "setShareDelegate:", v19);

  -[SearchResultsDataSource setCollectionCarouselRoutingDelegate:](self->_searchResultsDataSource, "setCollectionCarouselRoutingDelegate:", self);
  -[SearchResultsDataSource setUsePlaceSummary:](self->_searchResultsDataSource, "setUsePlaceSummary:", sub_1008974F8());
  -[SearchResultsDataSource setIsPresentingAddStopResultsFromWaypointEditor:](self->_searchResultsDataSource, "setIsPresentingAddStopResultsFromWaypointEditor:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"));
  -[ResultsViewController setDataSource:](self, "setDataSource:", self->_searchResultsDataSource);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  NSObject *v5;
  SearchResultQuickActionMenuPresenter *v6;
  SearchResultQuickActionMenuPresenter *quickActionMenuPresenter;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  ResultsViewController *v11;
  __int16 v12;
  const char *v13;

  v9.receiver = self;
  v9.super_class = (Class)ResultsViewController;
  -[ContaineeViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v11 = self;
    v12 = 2080;
    v13 = "-[ResultsViewController viewWillAppear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  if (!self->_quickActionMenuPresenter)
  {
    v6 = -[SearchResultQuickActionMenuPresenter initWithTableView:]([SearchResultQuickActionMenuPresenter alloc], "initWithTableView:", self->_contentTableView);
    quickActionMenuPresenter = self->_quickActionMenuPresenter;
    self->_quickActionMenuPresenter = v6;

    -[QuickActionMenuPresenter setDelegate:](self->_quickActionMenuPresenter, "setDelegate:", self);
  }
  if ((-[MUScrollViewImpressionsCalculator isActive](self->_impressionsCalculator, "isActive") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
    objc_msgSend(v8, "setActive:", 1);

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  ResultsViewController *v10;
  __int16 v11;
  const char *v12;

  v3 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = "-[ResultsViewController viewWillDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)ResultsViewController;
  -[ContaineeViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v7, "setActive:", 0);

}

- (void)willBecomeCurrent:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  ResultsViewController *v24;
  __int16 v25;
  const char *v26;

  v22.receiver = self;
  v22.super_class = (Class)ResultsViewController;
  -[ContaineeViewController willBecomeCurrent:](&v22, "willBecomeCurrent:", a3);
  v4 = sub_10043222C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v24 = self;
    v25 = 2080;
    v26 = "-[ResultsViewController willBecomeCurrent:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  if ((-[MUScrollViewImpressionsCalculator isActive](self->_impressionsCalculator, "isActive") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
    objc_msgSend(v6, "setActive:", 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentResults"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    if ((objc_msgSend(v9, "isSpotlightPunchInSearch") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
      v11 = objc_msgSend(v10, "spotlightMatchingResultFound");

      if (!v11)
        goto LABEL_11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
      -[ResultsViewController setHeaderContentWithSearchSession:](self, "setHeaderContentWithSearchSession:", v12);

      -[ResultsViewController setHideHeader:](self, "setHideHeader:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentResults"));
      -[ResultsViewController setResultsList:](self, "setResultsList:", v8);
    }
    else
    {

    }
  }

LABEL_11:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController resultsList](self, "resultsList"));
  if (objc_msgSend(v13, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController resultsList](self, "resultsList"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "searchPinsManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allSearchResults"));
    v18 = objc_msgSend(v14, "isEqualToArray:", v17);

    if ((v18 & 1) != 0)
      return;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController resultsList](self, "resultsList"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v19));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "searchPinsManager"));
    objc_msgSend(v21, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v13, 0, 0, 0, 0);

  }
}

- (void)didResignCurrent
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  ResultsViewController *v8;
  __int16 v9;
  const char *v10;

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v8 = self;
    v9 = 2080;
    v10 = "-[ResultsViewController didResignCurrent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  self->_hasViewAppeared = 0;
  v6.receiver = self;
  v6.super_class = (Class)ResultsViewController;
  -[ContaineeViewController didResignCurrent](&v6, "didResignCurrent");
  -[ResultsViewController _hideSearchHereControl](self, "_hideSearchHereControl");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v5, "setActive:", 0);

}

- (void)didBecomeCurrent
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v8;
  uint8_t buf[4];
  ResultsViewController *v10;
  __int16 v11;
  const char *v12;

  v8.receiver = self;
  v8.super_class = (Class)ResultsViewController;
  -[ContaineeViewController didBecomeCurrent](&v8, "didBecomeCurrent");
  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = "-[ResultsViewController didBecomeCurrent]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%p] %s", buf, 0x16u);
  }

  self->_hasViewAppeared = 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[ResultsViewController setContaineeLayout:](self, "setContaineeLayout:", objc_msgSend(v5, "containeeLayout"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  v7 = objc_msgSend(v6, "hasImpressionElements");

  if ((v7 & 1) == 0)
    -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ResultsViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[ResultsViewController _updateLoadingErrorFrames](self, "_updateLoadingErrorFrames");
  -[ResultsViewController updateLocalSearchViewInsets](self, "updateLocalSearchViewInsets");
  -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
}

- (void)_updateLoadingErrorFrames
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  if (self->_hideHeader)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
    objc_msgSend(v3, "bounds");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v3, "frame");
  }
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;

  -[LoadingModeView setFrame:](self->_loadingModeView, "setFrame:", v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController view](self, "view"));
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v11 - v13;

  -[ErrorModeView setFrame:](self->_errorModeView, "setFrame:", v8, v9, v10, v14);
}

- (void)setupConstraints
{
  NSDictionary *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = _NSDictionaryOfVariableBindings(CFSTR("_contentTableView"), self->_contentTableView, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[_contentTableView]-0-|"), 0, 0, v6));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[_contentTableView]-0-|"), 0, 0, v6));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v3);
}

- (void)applyAlphaToContent:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  unsigned int v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ResultsViewController;
  -[ContaineeViewController applyAlphaToContent:](&v10, "applyAlphaToContent:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containerStyle");

  v7 = 0.0;
  if (!self->_hideHeader)
  {
    if (v6 == (id)6)
      v8 = 1.0;
    else
      v8 = a3;
    v9 = -[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar");
    v7 = 0.0;
    if (!v9)
      v7 = v8;
  }
  -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", v7);
  -[ErrorModeView setAlpha:](self->_errorModeView, "setAlpha:", a3);
}

- (GEOLocation)currentLocation
{
  return -[DataSource currentLocation](self->_searchResultsDataSource, "currentLocation");
}

- (id)impressionsCalculator
{
  MUScrollViewImpressionsCalculator *impressionsCalculator;
  SearchResultsImpressionsLogger *v4;
  id v5;
  UITableView *contentTableView;
  id v7;
  id v8;
  MUScrollViewImpressionsCalculator *v9;
  MUScrollViewImpressionsCalculator *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void **v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  if (MapsFeature_IsEnabled_SearchResultsImpressions(self, a2))
  {
    impressionsCalculator = self->_impressionsCalculator;
    if (impressionsCalculator)
      return impressionsCalculator;
    v4 = objc_alloc_init(SearchResultsImpressionsLogger);
    objc_initWeak(&location, self);
    v5 = objc_alloc((Class)MUImpressionsCalculatorConfiguration);
    contentTableView = self->_contentTableView;
    v15 = _NSConcreteStackBlock;
    v16 = 3221225472;
    v17 = sub_100A0B838;
    v18 = &unk_1011BFFB0;
    objc_copyWeak(&v19, &location);
    v7 = objc_msgSend(v5, "initWithLogger:contentScrollView:containerViewProvider:", v4, contentTableView, &v15);
    v8 = objc_alloc((Class)MUScrollViewImpressionsCalculator);
    v9 = (MUScrollViewImpressionsCalculator *)objc_msgSend(v8, "initWithConfiguration:visibleItemsProvider:", v7, self->_searchResultsDataSource, v15, v16, v17, v18);
    v10 = self->_impressionsCalculator;
    self->_impressionsCalculator = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    if (objc_msgSend(v11, "isInternalInstall"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("EnableSearchResultsImpressionLoggingVisualization"));

      if (!v13)
      {
LABEL_8:

        objc_destroyWeak(&v19);
        objc_destroyWeak(&location);

        impressionsCalculator = self->_impressionsCalculator;
        return impressionsCalculator;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsImpressionsSearchResultsFloatingDebugViewController sharedInstance](MapsImpressionsSearchResultsFloatingDebugViewController, "sharedInstance"));
      objc_msgSend(v11, "setCalculator:", self->_impressionsCalculator);
      if ((objc_msgSend(v11, "isAttached") & 1) == 0)
        objc_msgSend(v11, "attach");
    }

    goto LABEL_8;
  }
  return 0;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 4, -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "clearSearch");

  -[ResultsViewController setResultsList:](self, "setResultsList:", 0);
  -[ErrorModeView removeErrorIconImageView](self->_errorModeView, "removeErrorIconImageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
  objc_msgSend(v7, "resetRedoSearchController");

  v8.receiver = self;
  v8.super_class = (Class)ResultsViewController;
  -[ContaineeViewController handleDismissAction:](&v8, "handleDismissAction:", v4);

}

- (unint64_t)preferredPresentationStyle
{
  return 1;
}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  ResultsViewController *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;

  v5 = a3;
  v6 = sub_10043222C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11.receiver = self;
    v11.super_class = (Class)ResultsViewController;
    v8 = -[ResultsViewController class](&v11, "class");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    *(_DWORD *)buf = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Header view close button tapped. Self : %@, Super class: %@ delegate: %@", buf, 0x20u);

  }
  -[ResultsViewController handleDismissAction:](self, "handleDismissAction:", v5);

}

- (void)relatedSearchSuggestionViewControllerDidScrollLeft:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2022, -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)relatedSearchSuggestionViewControllerDidScrollRight:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v4, "captureUserAction:onTarget:eventValue:", 2023, -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

}

- (void)relatedSearchSuggestionViewControllerDidTapActionButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pdSuggestion"));
  -[ResultsViewController _searchWithSuggestion:](self, "_searchWithSuggestion:", v4);

}

- (void)relatedSearchSuggestionViewController:(id)a3 didDismissWithReason:(unint64_t)a4
{
  __CFString *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a4 >= 3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %lu)"), a4, v8));
  else
    v6 = off_1011DF940[a4];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 2021, -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), v6);

}

- (void)waitingData
{
  LoadingModeView *loadingModeView;
  void *v4;

  -[ResultsViewController showError:](self, "showError:", 0);
  loadingModeView = self->_loadingModeView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController loadingString](self, "loadingString"));
  -[LoadingModeView setTitle:](loadingModeView, "setTitle:", v4);

  -[LoadingModeView setHidden:](self->_loadingModeView, "setHidden:", 0);
  -[UITableView setHidden:](self->_contentTableView, "setHidden:", 1);
  -[UITableView setContentOffset:](self->_contentTableView, "setContentOffset:", CGPointZero.x, CGPointZero.y);
}

- (id)loadingString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringToDisplay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchFieldItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchCategory"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Searching for  ... [Search Category]"), CFSTR("localized string not found"), 0));
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3);
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(v8);

    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "autocompletePerson"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "handle"));

  if (v10)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Location Update] Refreshing Location"), CFSTR("localized string not found"), 0));
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v17);
    goto LABEL_5;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapItem"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v15;
  if (v14)
    v16 = CFSTR("Loading ...");
  else
    v16 = CFSTR("Searching... [Search Query]");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", v16, CFSTR("localized string not found"), 0));
LABEL_6:

  return v11;
}

- (BOOL)isWaitingForResults
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v3 = objc_msgSend(v2, "isSingleResultToShowAsPlacecard");
  if ((objc_msgSend(v2, "isRedoOrAutoRedoSearchType") & 1) == 0
    && (objc_msgSend(v2, "isLoading") & 1) != 0)
  {
    v3 = 1;
  }

  return v3;
}

+ (BOOL)isReloadingRefinementsWithSearchSession:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "isResultRefinementsBarSearch"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentResults"));
    v5 = objc_msgSend(v4, "count") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)searchDidCancel:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  ResultsViewController *v12;
  __int16 v13;
  const char *v14;

  v3 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11 = 134218242;
    v12 = self;
    v13 = 2080;
    v14 = "-[ResultsViewController searchDidCancel:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%p] %s", (uint8_t *)&v11, 0x16u);
  }

  -[LoadingModeView setHidden:](self->_loadingModeView, "setHidden:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController impressionsCalculator](self, "impressionsCalculator"));
  objc_msgSend(v7, "setActive:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v8, "clearSearch");

  -[ResultsViewController setResultsList:](self, "setResultsList:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
  objc_msgSend(v9, "resetRedoSearchController");

  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v10, "viewControllerClosed:animated:", self, 1);

  }
}

- (void)_searchWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SearchFieldItem *v9;

  if (a3)
  {
    v4 = a3;
    v9 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSuggestion:](v9, "setSuggestion:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:doSearchItem:withUserInfo:", self, v9, 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchBarDisplayToken"));

    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2020, v7, v8);
  }
}

- (void)increasResultRefinementsSelectionSequenceNumber
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ResultsViewController refinementsSelectionSequenceNumber](self, "refinementsSelectionSequenceNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v4, "intValue") + 1));
  -[ResultsViewController setRefinementsSelectionSequenceNumber:](self, "setRefinementsSelectionSequenceNumber:", v3);

}

- (void)resultRefinementsBarDidUpdateViewModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _BYTE v39[128];
  _BYTE v40[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
  objc_msgSend(v5, "resetRedoSearchController");

  self->_lastRefinementOriginType = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
  v7 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
  objc_msgSend(v7, "setResultRefinementOriginType:", self->_lastRefinementOriginType);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultRefinementGroup"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refinementSessionState"));
  objc_msgSend(v7, "setRefinementSessionState:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEORefinementsFactory barResultRefinementsWith:](_TtC4Maps21GEORefinementsFactory, "barResultRefinementsWith:", v4));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v14), "convertToGEOPDResultRefinement"));
        objc_msgSend(v7, "addRefinement:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v12);
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resultRefinementGroup", 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "resultRefinementView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sections"));

  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v22), "convertToGEOPDResultRefinementSection"));
        objc_msgSend(v7, "addRefinementSection:", v23);

        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "searchFieldItem"));
  v37[0] = CFSTR("ResultRefinementsBarSearch");
  v37[1] = CFSTR("kAddStopFromWaypointEditor");
  v38[0] = &__kCFBooleanTrue;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor")));
  v38[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));
  objc_msgSend(v24, "viewController:doSearchItem:withUserInfo:refinementsQuery:", self, v26, v28, v7);

}

- (void)resultRefinementsBarDidTapOnSeeAllRefinements:(id)a3
{
  id v4;
  AllRefinementsViewController *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AllRefinementsViewController *v13;

  v4 = a3;
  v5 = [AllRefinementsViewController alloc];
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController refinementsSelectionSequenceNumber](self, "refinementsSelectionSequenceNumber"));
  v8 = objc_msgSend(v7, "copy");
  v13 = -[AllRefinementsViewController initWithViewModel:selectionSequenceNumber:resultRefinementsAnalyticsDelegate:](v5, "initWithViewModel:selectionSequenceNumber:resultRefinementsAnalyticsDelegate:", v6, v8, self->_analyticsManager);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  -[ContaineeViewController setContaineeDelegate:](v13, "setContaineeDelegate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  -[ControlContaineeViewController setDelegate:](v13, "setDelegate:", v10);

  -[AllRefinementsViewController setAllRefinementsDelegate:](v13, "setAllRefinementsDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerViewController"));
  objc_msgSend(v12, "presentController:animated:", v13, 1);

  -[ResultRefinementsAnalyticsManager logRefinementsEvent:fromSource:](self->_analyticsManager, "logRefinementsEvent:fromSource:", 2, 0);
}

- (void)resultRefinementsBarDidTapOnMultiSelect:(id)a3 tappedAtIndex:(int64_t)a4
{
  AllRefinementsViewController *v5;
  void *v6;
  id v7;
  AllRefinementsViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = (id)objc_claimAutoreleasedReturnValue(+[RefinementsViewModelFactory multiSelectRefinementsViewModelWith:tappedAtIndex:](_TtC4Maps27RefinementsViewModelFactory, "multiSelectRefinementsViewModelWith:tappedAtIndex:", a3, a4));
  v5 = [AllRefinementsViewController alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController refinementsSelectionSequenceNumber](self, "refinementsSelectionSequenceNumber"));
  v7 = objc_msgSend(v6, "copy");
  v8 = -[AllRefinementsViewController initWithViewModel:selectionSequenceNumber:resultRefinementsAnalyticsDelegate:](v5, "initWithViewModel:selectionSequenceNumber:resultRefinementsAnalyticsDelegate:", v13, v7, self->_analyticsManager);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
  -[ContaineeViewController setContaineeDelegate:](v8, "setContaineeDelegate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  -[ControlContaineeViewController setDelegate:](v8, "setDelegate:", v10);

  -[AllRefinementsViewController setAllRefinementsDelegate:](v8, "setAllRefinementsDelegate:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containerViewController"));
  objc_msgSend(v12, "presentController:animated:", v8, 1);

  -[ResultRefinementsAnalyticsManager logRefinementsEvent:fromSource:](self->_analyticsManager, "logRefinementsEvent:fromSource:", 3, 0);
}

- (void)resultRefinementsBarDidTapOnToggle:(id)a3 isSelected:(BOOL)a4
{
  _BOOL8 v4;
  ResultRefinementsAnalyticsManager *analyticsManager;
  id v6;

  v4 = a4;
  analyticsManager = self->_analyticsManager;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "refinementKey"));
  -[ResultRefinementsAnalyticsManager resultRefinementTappedWithKey:source:refinementType:isSelected:](analyticsManager, "resultRefinementTappedWithKey:source:refinementType:isSelected:", v6, 0, 0, v4);

}

- (void)resultRefinementsBarDidTapOnOpenOptions:(id)a3 tappedAtIndex:(int64_t)a4
{
  void *v6;
  AllRefinementsViewController *v7;
  void *v8;
  id v9;
  AllRefinementsViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v15))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RefinementsViewModelFactory openOptionsRefinementsViewModelWith:tappedAtIndex:](_TtC4Maps27RefinementsViewModelFactory, "openOptionsRefinementsViewModelWith:tappedAtIndex:", v15, a4));
    v7 = [AllRefinementsViewController alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController refinementsSelectionSequenceNumber](self, "refinementsSelectionSequenceNumber"));
    v9 = objc_msgSend(v8, "copy");
    v10 = -[AllRefinementsViewController initWithViewModel:selectionSequenceNumber:resultRefinementsAnalyticsDelegate:](v7, "initWithViewModel:selectionSequenceNumber:resultRefinementsAnalyticsDelegate:", v6, v9, self->_analyticsManager);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController containeeDelegate](self, "containeeDelegate"));
    -[ContaineeViewController setContaineeDelegate:](v10, "setContaineeDelegate:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    -[ControlContaineeViewController setDelegate:](v10, "setDelegate:", v12);

    -[AllRefinementsViewController setAllRefinementsDelegate:](v10, "setAllRefinementsDelegate:", self);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "containerViewController"));
    objc_msgSend(v14, "presentController:animated:", v10, 1);

    -[ResultRefinementsAnalyticsManager logRefinementsEvent:fromSource:](self->_analyticsManager, "logRefinementsEvent:fromSource:", 3, 0);
  }

}

- (void)allRefinementsApplyViewModel:(id)a3 selectionSequenceNumber:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const __CFString *v44;
  void *v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v6 = a3;
  -[ResultsViewController setRefinementsSelectionSequenceNumber:](self, "setRefinementsSelectionSequenceNumber:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tappedBarButtonIndex"));

  if (!v7)
    goto LABEL_9;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sections"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  v10 = objc_msgSend(v9, "type");
  if (v10)
  {
    if (v10 == (id)2)
    {
      v13 = v9;
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tappedBarButtonIndex"));
      -[ResultsViewController resultRefinementsBarApplyOpenOptionViewModel:atIndex:](self, "resultRefinementsBarApplyOpenOptionViewModel:atIndex:", v13, v12);
      goto LABEL_7;
    }
    if (v10 == (id)1)
    {
      v11 = v9;
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tappedBarButtonIndex"));
      -[ResultsViewController resultRefinementsBarApplyMultiSelectViewModel:atIndex:](self, "resultRefinementsBarApplyMultiSelectViewModel:atIndex:", v11, v12);
LABEL_7:

LABEL_24:
      goto LABEL_25;
    }

LABEL_9:
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
    objc_msgSend(v14, "resetRedoSearchController");

    self->_lastRefinementOriginType = 2;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
    v12 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
    objc_msgSend(v12, "setResultRefinementOriginType:", self->_lastRefinementOriginType);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "refinementSessionState"));
    objc_msgSend(v12, "setRefinementSessionState:", v16);

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resultRefinementBar"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "resultRefinements"));

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v23), "convertToGEOPDResultRefinement"));
          objc_msgSend(v12, "addRefinement:", v24);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v21);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[GEORefinementsFactory allRefinementsSectionsWith:](_TtC4Maps21GEORefinementsFactory, "allRefinementsSectionsWith:", v6));
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v29), "convertToGEOPDResultRefinementSection"));
          objc_msgSend(v12, "addRefinementSection:", v30);

          v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v27);
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "searchFieldItem"));
    v44 = CFSTR("kAddStopFromWaypointEditor");
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor")));
    v45 = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    objc_msgSend(v31, "viewController:doSearchItem:withUserInfo:refinementsQuery:", self, v33, v35, v12);

    goto LABEL_24;
  }
LABEL_25:

}

- (void)resultRefinementsBarApplyMultiSelectViewModel:(id)a3 atIndex:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  const __CFString *v40;
  void *v41;
  _BYTE v42[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
  objc_msgSend(v8, "resetRedoSearchController");

  self->_lastRefinementOriginType = 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
  v10 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
  objc_msgSend(v10, "setResultRefinementOriginType:", self->_lastRefinementOriginType);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refinementSessionState"));
  objc_msgSend(v10, "setRefinementSessionState:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resultRefinementBar"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultRefinements"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100A0D054;
  v36[3] = &unk_1011DF8F8;
  v16 = v7;
  v37 = v16;
  v17 = v6;
  v38 = v17;
  v18 = v10;
  v39 = v18;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v36);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup", 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resultRefinementView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "sections"));

  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v25), "convertToGEOPDResultRefinementSection"));
        objc_msgSend(v18, "addRefinementSection:", v26);

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v23);
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "searchFieldItem"));
  v40 = CFSTR("kAddStopFromWaypointEditor");
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor")));
  v41 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
  objc_msgSend(v27, "viewController:doSearchItem:withUserInfo:refinementsQuery:", self, v29, v31, v18);

}

- (void)resultRefinementsBarApplyOpenOptionViewModel:(id)a3 atIndex:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  const __CFString *v38;
  void *v39;
  _BYTE v40[128];

  v6 = a3;
  v7 = a4;
  if (MapsFeature_IsEnabled_SearchAndDiscovery(v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LocalSearchViewController refreshSearchHereBusinessController](self->_localSearchViewController, "refreshSearchHereBusinessController"));
    objc_msgSend(v8, "resetRedoSearchController");

    self->_lastRefinementOriginType = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
    v10 = objc_alloc_init((Class)GEOPDResultRefinementQuery);
    objc_msgSend(v10, "setResultRefinementOriginType:", self->_lastRefinementOriginType);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "refinementSessionState"));
    objc_msgSend(v10, "setRefinementSessionState:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resultRefinementBar"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "resultRefinements"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100A0D444;
    v34[3] = &unk_1011DF8F8;
    v35 = v7;
    v36 = v6;
    v16 = v10;
    v37 = v16;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v34);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "resultRefinementGroup", 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "resultRefinementView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sections"));

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v23), "convertToGEOPDResultRefinementSection"));
          objc_msgSend(v16, "addRefinementSection:", v24);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v21);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "searchFieldItem"));
    v38 = CFSTR("kAddStopFromWaypointEditor");
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor")));
    v39 = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
    objc_msgSend(v25, "viewController:doSearchItem:withUserInfo:refinementsQuery:", self, v27, v29, v16);

  }
}

- (void)setHeaderContentWithSearchSession:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  __objc2_prot *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  unsigned __int8 v20;
  double v21;
  unsigned int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;

  v59 = a3;
  v4 = objc_msgSend((id)objc_opt_class(self), "isReloadingRefinementsWithSearchSession:", v59);
  v5 = v59;
  if ((v4 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "searchFieldItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "searchInfo"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "originalSearchString"));
    v58 = v7;
    if (!v8)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "historyItem"));
      v10 = &OBJC_PROTOCOL___MSPHistoryEntrySearch;
      v11 = objc_opt_class(HistoryEntryRecentsItem);
      v8 = v9;
      if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
        v12 = v8;
      else
        v12 = 0;
      v13 = v12;

      if (v13
        && (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "historyEntry")),
            v15 = objc_msgSend(v14, "conformsToProtocol:", v10),
            v14,
            v15))
      {
        v16 = v8;
      }
      else
      {
        v16 = 0;
      }

      if (!v16)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "completion"));
        v53 = objc_msgSend(v52, "_type");

        if (v53)
        {
          v18 = 1;
          goto LABEL_20;
        }
LABEL_13:
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchCategory"));
        if (v17)
        {
          v18 = 1;
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCategoryItem"));
          v18 = v19
             || -[ResultsViewController isWaitingForResults](self, "isWaitingForResults")
             || -[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar");

        }
LABEL_20:
        -[ResultsTitleView setEditButtonHidden:](self->_resultsTitleView, "setEditButtonHidden:", v18);
        v20 = -[ResultsViewController isWaitingForResults](self, "isWaitingForResults");
        v21 = 0.0;
        if ((v20 & 1) == 0)
        {
          v22 = -[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar", 0.0);
          v21 = 1.0;
          if (v22)
            v21 = 0.0;
        }
        -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "headerDisplayName"));
        v24 = v23;
        if (v23)
          v25 = v23;
        else
          v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
        v26 = v25;

        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subHeaderDisplayName"));
        if (v27
          && (v28 = (void *)v27,
              v29 = objc_msgSend(v59, "isRedoOrAutoRedoSearchType"),
              v28,
              (v29 & 1) == 0))
        {
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subHeaderDisplayName"));
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "currentResults"));

          if (v30)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("[Results] subtitle"), CFSTR("localized string not found"), 0));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "currentResults"));
            v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, objc_msgSend(v33, "count")));

          }
          else
          {
            v34 = &stru_1011EB268;
          }
        }
        if (-[__CFString length](v34, "length"))
          v35 = v18;
        else
          v35 = 1;
        if ((v35 & 1) == 0)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR(" · [List view details separator]"), CFSTR("localized string not found"), 0));

          v38 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v34, "stringByAppendingString:", v37));
          v34 = (__CFString *)v38;
        }
        -[ResultsTitleView setTitle:](self->_resultsTitleView, "setTitle:", v26);
        -[ResultsTitleView setSubtitle:](self->_resultsTitleView, "setSubtitle:", v34);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchCategory"));
        v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "styleAttributes"));
        if (v40)
        {
          v41 = (void *)v40;

        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeCategoryItem"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "searchCategory"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "styleAttributes"));

          if (!v41)
          {
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));

            if (!v54)
            {
              v45 = 0;
              v51 = 0;
              goto LABEL_42;
            }
            v55 = objc_alloc((Class)GEOFeatureStyleAttributes);
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));
            v44 = objc_msgSend(v55, "initWithGEOStyleAttributes:", v56);

            v45 = 0;
            v51 = 0;
            if (!v44)
              goto LABEL_42;
LABEL_41:
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
            objc_msgSend(v46, "nativeScale");
            v48 = v47;
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController traitCollection](self, "traitCollection"));
            LOBYTE(v57) = objc_msgSend(v49, "userInterfaceStyle") == (id)2;
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v44, 4, 1, 0, 0, 0, v48, v57));

            v51 = v44;
            if (v50)
            {
LABEL_43:
              -[ResultsTitleView setHeaderImage:](self->_resultsTitleView, "setHeaderImage:", v50);

              v5 = v59;
              goto LABEL_44;
            }
LABEL_42:
            v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("search")));
            v44 = v51;
            goto LABEL_43;
          }
        }
        v44 = v41;
        v45 = v44;
        goto LABEL_41;
      }

    }
    goto LABEL_13;
  }
LABEL_44:

}

- (void)dataSourceUpdated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_currentDataSource == a3)
  {
    -[LoadingModeView setHidden:](self->_loadingModeView, "setHidden:", 1);
    -[UITableView setHidden:](self->_contentTableView, "setHidden:", 0);
    -[UITableView reloadData](self->_contentTableView, "reloadData");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
    objc_msgSend(v5, "venuesControlCoordinatingDidChangeSearchResultCount:", self);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "venuesManager"));
    objc_msgSend(v6, "updateFocusedVenueFloor");

  }
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  uint64_t v5;
  void *v6;
  id lastItemTapped;
  id v8;

  v8 = a4;
  v5 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v8, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v6, "viewController:focusSearchResult:", self, v8);

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = 0;
LABEL_5:

    goto LABEL_6;
  }
  if (!self->_lastItemTapped)
  {
    lastItemTapped = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(lastItemTapped, "viewControllerRemoveSearchResultFocus:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id lastItemTapped;
  id v17;

  v17 = a4;
  v5 = objc_opt_class(SearchResult);
  isKindOfClass = objc_opt_isKindOfClass(v17, v5);
  v7 = v17;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v17;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
    v10 = objc_msgSend(v9, "_hasHikeInfo");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appCoordinator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
      objc_msgSend(v12, "enterRouteCreationWithMapItem:completion:", v13, 0);

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeCollection"));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v11 = v15;
      if (v14)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "placeCollection"));
        objc_msgSend(v11, "viewController:showCuratedCollection:", self, v12);
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapSelectionManager"));
        objc_msgSend(v12, "selectSearchResult:animated:", v8, 1);
      }
    }

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = v8;

    v7 = v17;
  }

}

- (void)didTapOnAddAPlace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  ReportASearchAutocompleteResult *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchFieldItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ResultsTitleView title](self->_resultsTitleView, "title"));
  v14 = v8;

  v9 = -[ReportASearchAutocompleteResult initWithTitle:]([ReportASearchAutocompleteResult alloc], "initWithTitle:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rapPresenter"));
  objc_msgSend(v11, "presentAddToMapsFromSearchEntryPoint:result:completion:", -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), v9, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentResults"));
  +[SearchResultsAnalyticsManager addAPlaceTappedWithNumberOfResults:target:](SearchResultsAnalyticsManager, "addAPlaceTappedWithNumberOfResults:target:", objc_msgSend(v13, "count"), -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));

}

- (int)refineSearchSessionType
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchFieldItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchCategory"));

  if (v4)
    v5 = 1;
  else
    v5 = 2;

  return v5;
}

- (id)refineSearchText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchText"));

  return v3;
}

- (int)listForDataSource:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchFieldItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchCategory"));

  if (v5)
    v6 = 3;
  else
    v6 = 5;

  return v6;
}

- (void)searchDataSource:(id)a3 didTapOnPlaceContextWithViewModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  v5 = objc_msgSend(v9, "type");
  if (v5 == (id)3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userGeneratedCollection"));
    objc_msgSend(v6, "viewController:showCollection:", self, v7);
    goto LABEL_7;
  }
  if (v5 == (id)2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollections"));
    objc_msgSend(v6, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", self, v7, 0, 0, 0);
    goto LABEL_7;
  }
  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "placeCollections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    objc_msgSend(v6, "viewController:showCuratedCollection:", self, v8);

LABEL_7:
  }

}

- (void)didTapOnUserGeneratedGuide:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCollection:", self, v4);

  +[SearchResultsAnalyticsManager userGeneratedGuideUnitTapped](SearchResultsAnalyticsManager, "userGeneratedGuideUnitTapped");
}

- (void)didTapOnCuratedGuide:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

  +[SearchResultsAnalyticsManager curatedGuidesUnitTapped](SearchResultsAnalyticsManager, "curatedGuidesUnitTapped");
}

- (void)didTapOnCuratedGuides:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollectionsList:usingTitle:usingCollectionIds:completion:", self, v4, 0, 0, 0);

  +[SearchResultsAnalyticsManager curatedGuidesUnitTapped](SearchResultsAnalyticsManager, "curatedGuidesUnitTapped");
}

- (void)didTapOnDirectionsWithSearchResult:(id)a3
{
  id v4;
  SearchFieldItem *v5;
  void *v6;
  void *v7;
  DirectionItem *v8;
  void *v9;
  DirectionItem *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _UNKNOWN **v15;
  _QWORD v16[2];

  v4 = a3;
  v5 = objc_alloc_init(SearchFieldItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
  -[SearchFieldItem setSearchResult:](v5, "setSearchResult:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v4));
  v8 = [DirectionItem alloc];
  v16[0] = v5;
  v16[1] = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
  v10 = -[DirectionItem initWithItems:ignoreMapType:transportType:](v8, "initWithItems:ignoreMapType:transportType:", v9, 0, 0);

  v14 = CFSTR("DirectionsSessionInitiatorKey");
  v15 = &off_101270348;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v12, "viewController:doDirectionItem:withUserInfo:", 0, v10, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  +[SearchResultsAnalyticsManager directionsButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "directionsButtonTappedOnSearchResultWithMuid:", objc_msgSend(v13, "_muid"));

}

- (void)didTapOnLookAroundWithSearchResult:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
  if (objc_msgSend(v4, "_hasLookAroundStorefront"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:wantsCloseUpView:](MKLookAroundEntryPoint, "entryPointWithMapItem:wantsCloseUpView:", v4, 1));
    objc_msgSend(v5, "enterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:originFrame:", v6, 0, 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
  +[SearchResultsAnalyticsManager lookAroundButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "lookAroundButtonTappedOnSearchResultWithMuid:", objc_msgSend(v7, "_muid"));

}

- (void)didTapOnCallWithSearchResult:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "phoneNumber"));
    objc_msgSend(v6, "callPhoneNumber:completion:", v7, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItem"));
  +[SearchResultsAnalyticsManager callButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "callButtonTappedOnSearchResultWithMuid:", objc_msgSend(v8, "_muid"));

}

- (void)didTapOnWebsiteWithSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "url"));
  objc_msgSend(v5, "viewController:openURL:", self, v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  +[SearchResultsAnalyticsManager websiteButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "websiteButtonTappedOnSearchResultWithMuid:", objc_msgSend(v8, "_muid"));

}

- (void)didTapOnFlyoverWithSearchResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  objc_msgSend(v5, "viewController:enterFlyoverForMapItem:", self, v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));
  +[SearchResultsAnalyticsManager flyoverButtonTappedOnSearchResultWithMuid:](SearchResultsAnalyticsManager, "flyoverButtonTappedOnSearchResultWithMuid:", objc_msgSend(v7, "_muid"));

}

- (void)didTapOnContainmentParentMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchResult *v10;

  v4 = a3;
  v10 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController resultsList](self, "resultsList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObject:", v10));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchPinsManager"));
  objc_msgSend(v8, "setSearchPins:selectedPin:animated:", v6, v10, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v10, "mapItem"));
  +[SearchResultsAnalyticsManager containmentParentUnitTappedWithMuid:](SearchResultsAnalyticsManager, "containmentParentUnitTappedWithMuid:", objc_msgSend(v9, "_muid"));

}

- (void)didTapOnTappableEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SearchResult *v10;

  v4 = a3;
  v10 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController resultsList](self, "resultsList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObject:", v10));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchPinsManager"));
  objc_msgSend(v8, "setSearchPins:selectedPin:animated:", v6, v10, 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](v10, "mapItem"));
  +[SearchResultsAnalyticsManager tappableEntryUnitTappedWithMuid:](SearchResultsAnalyticsManager, "tappableEntryUnitTappedWithMuid:", objc_msgSend(v9, "_muid"));

}

- (void)didTapOnAddStopWithSearchResult:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _UNKNOWN **v12;

  v11 = CFSTR("DirectionsSessionInitiatorKey");
  v12 = &off_101270348;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v9, "viewController:addStopForSearchResult:withUserInfo:", self, v7, v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  +[SearchResultsAnalyticsManager didTapOnAddStopForSearchResultWithMapItem:indexPath:](SearchResultsAnalyticsManager, "didTapOnAddStopForSearchResultWithMapItem:indexPath:", v10, v6);

}

- (void)didTapOnUserLibraryMapItem:(id)a3
{
  id v4;
  _QWORD v5[5];

  if (objc_msgSend(a3, "_hasHikeInfo"))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100A0E978;
    v5[3] = &unk_1011DF920;
    v5[4] = self;
    +[MapsSavedRoutesManager fetchSavedRoutesWithType:completion:](MapsSavedRoutesManager, "fetchSavedRoutesWithType:completion:", 1, v5);
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v4, "viewControllerShowLibraryPlacesView:", self);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedDirectionsTo:(id)a4
{
  void *v5;
  SearchFieldItem *v6;
  void *v7;
  SearchFieldItem *v8;
  DirectionItem *v9;
  void *v10;
  DirectionItem *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _UNKNOWN **v15;
  _QWORD v16[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v5)
  {
    if (-[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"))
    {
      -[ResultsViewController didTapOnAddStopWithSearchResult:atIndexPath:](self, "didTapOnAddStopWithSearchResult:atIndexPath:", v5, 0);
    }
    else
    {
      v6 = objc_alloc_init(SearchFieldItem);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult currentLocationSearchResult](SearchResult, "currentLocationSearchResult"));
      -[SearchFieldItem setSearchResult:](v6, "setSearchResult:", v7);

      v8 = objc_alloc_init(SearchFieldItem);
      -[SearchFieldItem setSearchResult:](v8, "setSearchResult:", v5);
      v9 = [DirectionItem alloc];
      v16[0] = v6;
      v16[1] = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
      v11 = -[DirectionItem initWithItems:transportType:](v9, "initWithItems:transportType:", v10, 0);

      v14 = CFSTR("DirectionsSessionInitiatorKey");
      v15 = &off_101270348;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v13, "viewController:doDirectionItem:withUserInfo:", 0, v11, v12);

    }
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedCall:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:doAudioCallToSearchResult:", 0, v6);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedViewWebsiteFor:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:openWebsiteForSearchResult:", 0, v6);

  }
}

- (void)quickActionMenuPresenter:(id)a3 selectedShareLocationOf:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "searchResult", a3));
  if (v5)
  {
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactForSharingToMessages"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[ShareItem shareItemWithSearchResult:contact:includePrintActivity:](ShareItem, "shareItemWithSearchResult:contact:includePrintActivity:", v9, v6, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v8, "viewController:doShareSheetForShareItem:completion:", 0, v7, 0);

    v5 = v9;
  }

}

- (void)quickActionMenuPresenter:(id)a3 selectedShowPlaceCard:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultQuickActionMenuPresenter indexPath](self->_quickActionMenuPresenter, "indexPath", a3, a4));
  if (v5)
  {
    v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource objectAtIndexPath:](self->_currentDataSource, "objectAtIndexPath:", v5));
    -[ResultsViewController dataSource:itemTapped:](self, "dataSource:itemTapped:", self->_currentDataSource, v6);

    v5 = v7;
  }

}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 presentAtLocation:(CGPoint)a4 inView:(id)a5
{
  return 1;
}

- (BOOL)quickActionMenuPresenter:(id)a3 isPopularNearbyAtIndexPath:(id)a4
{
  return 0;
}

- (int)uiTargetForQuickActionMenu
{
  return 2;
}

- (id)mapServiceTraitsForQuickActionPresenter:(id)a3
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  v4 = objc_msgSend(v3, "newTraits");

  return v4;
}

- (void)quickActionMenuPresenter:(id)a3 selectedRemoveDroppedPinOf:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewController:removeDroppedPin:", 0, v5);

}

- (BOOL)shouldQuickActionMenuPresenter:(id)a3 showDirectionsToPlace:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "venuesManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

  LOBYTE(v5) = objc_msgSend(v7, "isUserAtSameVenueAsMapItem:", v8) ^ 1;
  return (char)v5;
}

- (int)currentUITargetForAnalytics
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchFieldItem"));
  if (-[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"))
  {
    v5 = 58;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchCategory"));

    if (v6)
      v5 = 102;
    else
      v5 = 101;
  }

  return v5;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)didCachePlaceSummaryTemplates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  SearchResultsDataSource *searchResultsDataSource;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController originalSearchInfo](self, "originalSearchInfo"));
  if (v3)
  {
    v11 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchText"));
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchFieldItem"));
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));

    }
    searchResultsDataSource = self->_searchResultsDataSource;
    v9 = -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MUScrollViewImpressionsCalculator sessionIdentifier](self->_impressionsCalculator, "sessionIdentifier"));
    +[SearchResultsAnalyticsManager didShowSearchResultsWithDataSource:target:query:impressionsSessionIdentifier:](SearchResultsAnalyticsManager, "didShowSearchResultsWithDataSource:target:query:impressionsSessionIdentifier:", searchResultsDataSource, v9, v6, v10);

    v3 = v11;
  }

}

- (void)_updateResultRefinementBarFromSearchInfo:(id)a3
{
  void *v4;
  void *v5;
  _TtC4Maps27ResultRefinementsController *v6;
  _TtC4Maps27ResultRefinementsController *refinementsController;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resultRefinementGroup"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController refinementsSelectionSequenceNumber](self, "refinementsSelectionSequenceNumber"));

    if (!v5)
      -[ResultsViewController setRefinementsSelectionSequenceNumber:](self, "setRefinementsSelectionSequenceNumber:", &off_101270360);
    if (!self->_refinementsController)
    {
      v6 = objc_alloc_init(_TtC4Maps27ResultRefinementsController);
      refinementsController = self->_refinementsController;
      self->_refinementsController = v6;

      -[ResultRefinementsController setDelegate:](self->_refinementsController, "setDelegate:", self);
      -[RefinementsBarUIView setDelegate:](self->_refinementsBar, "setDelegate:", self->_refinementsController);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resultRefinementGroup"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RefinementsViewModelFactory barViewModelWith:](_TtC4Maps27RefinementsViewModelFactory, "barViewModelWith:", v8));

    -[RefinementsBarUIView setViewModel:](self->_refinementsBar, "setViewModel:", v9);
    -[ResultsViewController setHideRefinementsBar:](self, "setHideRefinementsBar:", 0);
    if (!self->_lastRefinementOriginType)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
      v11 = objc_msgSend(v10, "source");

      if (v11 == 7)
      {
        self->_lastRefinementOriginType = 3;
        -[ResultsViewController setRefinementsSelectionSequenceNumber:](self, "setRefinementsSelectionSequenceNumber:", &off_101270378);
      }
    }

  }
  else
  {
    -[ResultsViewController setHideRefinementsBar:](self, "setHideRefinementsBar:", 1);
  }

}

- (BOOL)isShowingOmnipresentSearchBar
{
  int IsEnabled_SearchAndDiscovery;

  IsEnabled_SearchAndDiscovery = MapsFeature_IsEnabled_SearchAndDiscovery(self);
  if (IsEnabled_SearchAndDiscovery)
    LOBYTE(IsEnabled_SearchAndDiscovery) = !-[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor");
  return IsEnabled_SearchAndDiscovery;
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_contentTableView;
}

- (NSDictionary)searchResultCountInVenue
{
  void *v3;

  if (-[DataSource conformsToProtocol:](self->_currentDataSource, "conformsToProtocol:", &OBJC_PROTOCOL___VenueItemDataSource)&& (objc_opt_respondsToSelector(self->_currentDataSource, "itemCountInVenue") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataSource itemCountInVenue](self->_currentDataSource, "itemCountInVenue"));
  }
  else
  {
    v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ResultsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v5, "willChangeContainerStyle:");
  -[LocalSearchViewController setEnable:](self->_localSearchViewController, "setEnable:", a3 != 6);
}

- (void)didChangeLayout:(unint64_t)a3
{
  SearchSessionAnalytics *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ResultsViewController;
  -[ContaineeViewController didChangeLayout:](&v11, "didChangeLayout:");
  -[ResultsViewController _updateLoadingErrorFrames](self, "_updateLoadingErrorFrames");
  if (-[ResultsViewController containeeLayout](self, "containeeLayout") != a3)
  {
    v5 = objc_alloc_init(SearchSessionAnalytics);
    -[SearchSessionAnalytics setTarget:](v5, "setTarget:", -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));
    v6 = -[ResultsViewController containeeLayout](self, "containeeLayout");
    if (v6 && v6 < a3)
    {
      v7 = 1;
    }
    else
    {
      v8 = -[ResultsViewController containeeLayout](self, "containeeLayout");
      if (!a3 || v8 <= a3)
        goto LABEL_9;
      v7 = 2;
    }
    -[SearchSessionAnalytics setAction:](v5, "setAction:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", -[SearchSessionAnalytics action](v5, "action"), -[SearchSessionAnalytics target](v5, "target"), 0);

LABEL_9:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
    objc_msgSend(v10, "collectSearchSessionAnalytics:", v5);

    -[ResultsViewController setContaineeLayout:](self, "setContaineeLayout:", a3);
  }
  -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
}

- (double)heightForLayout:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double result;
  double v11;

  if (a3 == 2)
  {
    sub_1005EC2E4();
  }
  else
  {
    if (a3 == 1)
    {
      -[ContaineeViewController headerHeight](self, "headerHeight");
      v4 = 82.0;
      if (v5 > 82.0)
      {
        -[ContaineeViewController headerHeight](self, "headerHeight");
        v4 = v6;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v7, "bottomSafeOffset");
      v9 = v4 + v8;
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v7, "availableHeight");
      v9 = v11;
    }

    return v9;
  }
  return result;
}

- (void)_hideSearchHereControl
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerViewController"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "chromeViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "redoSearchOverlay"));
  objc_msgSend(v4, "shouldHideFloatingControl:animated:", 1, 0);

}

- (void)showSearchingHereIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;

  v3 = a3;
  if (!-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentSearchSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchInfo"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerViewController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chromeViewController"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "redoSearchOverlay"));
      objc_msgSend(v11, "setHidden:", 0);

      if (v3)
      {
        v12 = sub_10043222C();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentSearchSession"));
          v27 = 138412290;
          v28 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[ResultsVC] Trigerred auto-redo search: %@", (uint8_t *)&v27, 0xCu);

        }
        objc_msgSend(v10, "setNeedsUpdateComponent:animated:", CFSTR("redoSearchButton"), 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "redoSearchOverlay"));
        objc_msgSend(v16, "updateSearchOverlayWithState:", 0);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "redoSearchOverlay"));
        objc_msgSend(v17, "shouldHideFloatingControl:animated:", 0, 1);

        self->_didTriggerAutoRedoSearch = 1;
        -[ResultsViewController refreshCurrentSearch](self, "refreshCurrentSearch");
      }
      else
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "refreshSearchHereBusinessController"));
        v20 = objc_msgSend(v19, "shouldShowManualRedoButton");

        if (MapsFeature_IsEnabled_SearchAndDiscovery(v21) && v20)
        {
          v22 = sub_100432AEC();
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "currentSearchSession"));
            v27 = 138412290;
            v28 = v25;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "[SearchVC] Showing search here button as we did not trigger Auto-Redo: %@", (uint8_t *)&v27, 0xCu);

          }
          objc_msgSend(v10, "setNeedsUpdateComponent:animated:", CFSTR("redoSearchButton"), 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "redoSearchOverlay"));
          objc_msgSend(v26, "updateSearchOverlayWithState:", 1);

        }
      }

    }
  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  if (self->_tappedTrackingButton)
  {
    self->_tappedTrackingButton = 0;
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refreshSearchHereBusinessController"));
    v8 = objc_msgSend(v7, "didStopRespondingToGesture:", v5);

    -[ResultsViewController showSearchingHereIfNeeded:](self, "showSearchingHereIfNeeded:", v8);
  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "refreshSearchHereBusinessController"));
    objc_msgSend(v7, "didStartRespondingToGesture:", v8);

  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  if (!-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "refreshSearchHereBusinessController"));
    v11 = objc_msgSend(v10, "didStopRespondingToGesture:", v12);

    -[ResultsViewController showSearchingHereIfNeeded:](self, "showSearchingHereIfNeeded:", v11);
  }

}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  id v10;

  v6 = a6;
  v10 = a3;
  if (!-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar") && v6)
  {
    self->_tappedTrackingButton = 1;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "refreshSearchHereBusinessController"));
    objc_msgSend(v9, "didStartRespondingToGesture:", v10);

  }
}

- (int64_t)floatingControlsOptions
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v3 = objc_msgSend(v2, "containerStyle");

  if (v3 == (id)6)
    return 191;
  else
    return 187;
}

- (void)setHideHeader:(BOOL)a3
{
  double v4;
  double v5;

  if (self->_hideHeader != a3)
  {
    self->_hideHeader = a3;
    if (a3)
      v4 = 0.0;
    else
      v4 = 1.0;
    -[ResultsTitleView setAlpha:](self->_resultsTitleView, "setAlpha:", v4);
    if (-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
      v5 = 0.0;
    else
      v5 = v4;
    -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", v5);
    -[RefinementsBarUIView setAlpha:](self->_refinementsBar, "setAlpha:", v4);
    -[ResultsViewController _updateLoadingErrorFrames](self, "_updateLoadingErrorFrames");
  }
}

- (void)setHideRefinementsBar:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *refinementsBarZeroHeight;

  v3 = a3;
  -[RefinementsBarUIView setHidden:](self->_refinementsBar, "setHidden:");
  if (v3)
  {
    self->_lastRefinementOriginType = 0;
    -[ResultsViewController resetRefinementsSequenceNumber](self, "resetRefinementsSequenceNumber");
    -[RefinementsBarUIView setViewModel:](self->_refinementsBar, "setViewModel:", 0);
    refinementsBarZeroHeight = self->_refinementsBarZeroHeight;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &refinementsBarZeroHeight, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5);
  }
  else
  {
    v7 = self->_refinementsBarZeroHeight;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v5);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "updateHeightForCurrentLayout");

}

- (void)resetRefinementsSequenceNumber
{
  -[ResultsViewController setRefinementsSelectionSequenceNumber:](self, "setRefinementsSelectionSequenceNumber:", &off_101270360);
}

- (void)configureHeader
{
  ContainerHeaderView *v3;
  double y;
  double width;
  double height;
  ContainerHeaderView *v7;
  ContainerHeaderView *containerHeaderView;
  ResultsTitleView *v9;
  ResultsTitleView *resultsTitleView;
  _TtC4Maps20RefinementsBarUIView *v11;
  _TtC4Maps20RefinementsBarUIView *refinementsBar;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *refinementsBarZeroHeight;
  id v16;
  unsigned int v17;
  ContainerHeaderView *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
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
  _QWORD v45[6];

  v3 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[ContainerHeaderView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v7;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
  if (!-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
  {
    v9 = -[ResultsTitleView initWithFrame:]([ResultsTitleView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    resultsTitleView = self->_resultsTitleView;
    self->_resultsTitleView = v9;

    -[ResultsTitleView setTranslatesAutoresizingMaskIntoConstraints:](self->_resultsTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ResultsTitleView setDelegate:](self->_resultsTitleView, "setDelegate:", self);
  }
  v11 = objc_alloc_init(_TtC4Maps20RefinementsBarUIView);
  refinementsBar = self->_refinementsBar;
  self->_refinementsBar = v11;

  -[RefinementsBarUIView setTranslatesAutoresizingMaskIntoConstraints:](self->_refinementsBar, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RefinementsBarUIView heightAnchor](self->_refinementsBar, "heightAnchor"));
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", 0.0));
  refinementsBarZeroHeight = self->_refinementsBarZeroHeight;
  self->_refinementsBarZeroHeight = v14;

  -[ResultsViewController setHideRefinementsBar:](self, "setHideRefinementsBar:", 1);
  v16 = objc_alloc_init((Class)NSMutableArray);
  v17 = -[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar");
  v18 = self->_containerHeaderView;
  v44 = v16;
  if (v17)
  {
    -[ContainerHeaderView setButtonHidden:](v18, "setButtonHidden:", 1);
    -[ContainerHeaderView setTitleView:](self->_containerHeaderView, "setTitleView:", self->_refinementsBar);
    -[ContainerHeaderView setTitleViewIgnoresButton:](self->_containerHeaderView, "setTitleViewIgnoresButton:", 1);
    -[ContainerHeaderView setTitleViewInsets:](self->_containerHeaderView, "setTitleViewInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RefinementsBarUIView trailingAnchor](self->_refinementsBar, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
    objc_msgSend(v16, "addObject:", v21);

  }
  else
  {
    -[ContainerHeaderView setTitleView:subtitleView:verticalSpaceBetweenViews:](v18, "setTitleView:subtitleView:verticalSpaceBetweenViews:", self->_resultsTitleView, self->_refinementsBar, -4.0);
  }
  if (-[ResultsViewController isShowingOmnipresentSearchBar](self, "isShowingOmnipresentSearchBar"))
    v22 = 0.0;
  else
    v22 = 82.0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v23, "addSubview:", self->_containerHeaderView);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView heightAnchor](self->_containerHeaderView, "heightAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintGreaterThanOrEqualToConstant:", v22));
  v45[0] = v42;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_containerHeaderView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v45[1] = v38;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "trailingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v35));
  v45[2] = v34;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_containerHeaderView, "topAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));
  v45[3] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));
  v32 = self->_refinementsBarZeroHeight;
  v45[4] = v31;
  v45[5] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 6));
  objc_msgSend(v44, "addObjectsFromArray:", v33);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);
}

- (void)editSearchButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  if (-[ResultsViewController isPresentingAddStopResultsFromWaypointEditor](self, "isPresentingAddStopResultsFromWaypointEditor"))
  {
    -[ResultsViewController handleDismissAction:](self, "handleDismissAction:", 0);
  }
  else
  {
    -[ResultsViewController setResultsList:](self, "setResultsList:", 0);
    -[ResultsViewController resetRefinementsSequenceNumber](self, "resetRefinementsSequenceNumber");
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ResultsViewController searchSession](self, "searchSession"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchFieldItem"));
    objc_msgSend(v3, "presentSearchAndRestoreSearchItem:", v4);

  }
}

- (VKVenueFeatureMarker)venueWithFocus
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "venuesManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueWithFocus"));

  return (VKVenueFeatureMarker *)v4;
}

- (void)localSearchViewControllerDidSelectRefreshSearchHere:(id)a3
{
  void *v4;
  ResultsViewController *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  v5 = (ResultsViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentViewController"));

  if (v5 == self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 2011, -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v7, "refreshCurrentSearch");

  }
}

- (void)viewControllerDidSelectBrowseVenue:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venuesManager"));
  objc_msgSend(v3, "presentPlaceCardForVenueWithFocusAndAddToHistory:source:centeringOnVenue:", 1, 7, 0);

}

- (void)localSearchViewShouldBeVisibleDidChange:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = (unint64_t)objc_msgSend(v4, "containerStyle");

  -[ResultsViewController updateLocalSearchViewInsets](self, "updateLocalSearchViewInsets");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResultsViewController localSearchViewController](self, "localSearchViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  if (v5 <= 5 && ((0x3Au >> v5) & 1) != 0 && !v8)
  {
    -[ResultsViewController addChildViewController:](self, "addChildViewController:", self->_localSearchViewController);
    -[LocalSearchViewController didMoveToParentViewController:](self->_localSearchViewController, "didMoveToParentViewController:", self);
  }
  -[ResultsViewController _localSearchViewControllerDidChange:](self, "_localSearchViewControllerDidChange:", v9);

}

- (void)localSearchViewControllerSizeDidChange:(id)a3
{
  id v4;

  v4 = a3;
  -[ResultsViewController updateLocalSearchViewInsets](self, "updateLocalSearchViewInsets");
  -[ResultsViewController _localSearchViewControllerDidChange:](self, "_localSearchViewControllerDidChange:", v4);

}

- (void)_localSearchViewControllerDidChange:(id)a3
{
  if (objc_msgSend(a3, "shouldBeVisible"))
    -[ResultsViewController showError:](self, "showError:", 0);
}

- (void)updateLocalSearchViewInsets
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "bottomSafeOffset");
  -[LocalSearchViewController setBottomInset:](self->_localSearchViewController, "setBottomInset:");

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  SearchSessionAnalytics *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;

  y = a4.y;
  v11.receiver = self;
  v11.super_class = (Class)ResultsViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x);
  v7 = objc_alloc_init(SearchSessionAnalytics);
  -[SearchSessionAnalytics setTarget:](v7, "setTarget:", -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"));
  if (y <= 0.0)
    v8 = 7;
  else
    v8 = 8;
  -[SearchSessionAnalytics setAction:](v7, "setAction:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", v8, -[ResultsViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchSessionAnalyticsAggregator sharedAggregator](SearchSessionAnalyticsAggregator, "sharedAggregator"));
  objc_msgSend(v10, "collectSearchSessionAnalytics:", v7);

}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ResultsViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[MUScrollViewImpressionsCalculator logImpressions](self->_impressionsCalculator, "logImpressions");
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

}

- (ResultsViewControllerDelegate)resultsDelegate
{
  return (ResultsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_resultsDelegate);
}

- (void)setResultsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_resultsDelegate, a3);
}

- (BOOL)isPresentingAddStopResultsFromWaypointEditor
{
  return self->_isPresentingAddStopResultsFromWaypointEditor;
}

- (void)setIsPresentingAddStopResultsFromWaypointEditor:(BOOL)a3
{
  self->_isPresentingAddStopResultsFromWaypointEditor = a3;
}

- (NSArray)resultsList
{
  return self->_resultsList;
}

- (BOOL)hideHeader
{
  return self->_hideHeader;
}

- (NSNumber)refinementsSelectionSequenceNumber
{
  return self->_refinementsSelectionSequenceNumber;
}

- (void)setRefinementsSelectionSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_refinementsSelectionSequenceNumber, a3);
}

- (unint64_t)containeeLayout
{
  return self->_containeeLayout;
}

- (void)setContaineeLayout:(unint64_t)a3
{
  self->_containeeLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refinementsSelectionSequenceNumber, 0);
  objc_storeStrong((id *)&self->_resultsList, 0);
  objc_destroyWeak((id *)&self->_resultsDelegate);
  objc_storeStrong((id *)&self->_searchSession, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_impressionsCalculator, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_localSearchViewController, 0);
  objc_storeStrong((id *)&self->_imageTitleView, 0);
  objc_storeStrong((id *)&self->_resultsTitleView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
  objc_storeStrong((id *)&self->_quickActionMenuPresenter, 0);
  objc_storeStrong((id *)&self->_searchResultsDataSource, 0);
  objc_storeStrong((id *)&self->_refinementsBarZeroHeight, 0);
  objc_storeStrong((id *)&self->_refinementsBar, 0);
  objc_storeStrong((id *)&self->_refinementsController, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_contentTableView, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
}

@end
