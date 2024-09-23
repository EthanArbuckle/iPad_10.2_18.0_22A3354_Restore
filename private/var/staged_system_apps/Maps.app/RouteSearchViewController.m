@implementation RouteSearchViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RouteSearchViewController)initWithDelegate:(id)a3 dataCoordinator:(id)a4
{
  id v6;
  id v7;
  RouteSearchViewController *v8;
  RouteWaypointSuggestionsTableViewController *v9;
  RouteWaypointSuggestionsTableViewController *suggestionsTableViewController;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RouteSearchViewController;
  v8 = -[RouteSearchViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = -[RouteWaypointSuggestionsTableViewController initWithNibName:bundle:]([RouteWaypointSuggestionsTableViewController alloc], "initWithNibName:bundle:", 0, 0);
    suggestionsTableViewController = v8->_suggestionsTableViewController;
    v8->_suggestionsTableViewController = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v11, "setPresentedModally:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v8, "cardPresentationController"));
    objc_msgSend(v12, "setTakesAvailableHeight:", 1);

    -[RouteSearchViewController setExitRoutePlanningOnCancel:](v8, "setExitRoutePlanningOnCancel:", 0);
    -[RouteSearchViewController setDelegate:](v8, "setDelegate:", v6);
    -[RouteSearchViewController setDataCoordinator:](v8, "setDataCoordinator:", v7);
    -[RouteWaypointSuggestionsTableViewController setDelegate:](v8->_suggestionsTableViewController, "setDelegate:", v8);
  }

  return v8;
}

- (RouteSearchViewController)initWithDelegate:(id)a3 items:(id)a4 waypointIndex:(unint64_t)a5 selectionHandler:(id)a6
{
  id v11;
  id v12;
  RouteSearchViewController *v13;
  RouteSearchViewController *v14;
  id v15;
  id selectionHandler;

  v11 = a4;
  v12 = a6;
  v13 = -[RouteSearchViewController initWithDelegate:dataCoordinator:](self, "initWithDelegate:dataCoordinator:", a3, 0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cachedItems, a4);
    v14->_waypointIndex = a5;
    v15 = objc_msgSend(v12, "copy");
    selectionHandler = v14->_selectionHandler;
    v14->_selectionHandler = v15;

  }
  return v14;
}

- (RouteSearchViewController)initWithWaypointEditor:(id)a3 suggestionsTableView:(id)a4 delegate:(id)a5 dataCoordinator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  RouteSearchViewController *v15;
  void *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)RouteSearchViewController;
  v15 = -[RouteSearchViewController init](&v18, "init");
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v15->_wasLocationServicesApproved = objc_msgSend(v16, "isLocationServicesApproved");
    v15->_wasAuthorizedForPreciseLocation = objc_msgSend(v16, "isAuthorizedForPreciseLocation");
    objc_storeStrong((id *)&v15->_fieldsViewController, a3);
    -[RoutePlanningWaypointEditorViewController setDelegate:](v15->_fieldsViewController, "setDelegate:", v15);
    objc_storeStrong((id *)&v15->_suggestionsTableViewController, a4);
    -[RouteSearchViewController setDelegate:](v15, "setDelegate:", v13);
    -[RouteSearchViewController setDataCoordinator:](v15, "setDataCoordinator:", v14);
    -[RouteWaypointSuggestionsTableViewController setDelegate:](v15->_suggestionsTableViewController, "setDelegate:", v15);

  }
  return v15;
}

- (RouteWaypointSearchFields)routeSearchFields
{
  void *fieldsViewController;

  fieldsViewController = self->_fieldsViewController;
  if (!fieldsViewController)
    fieldsViewController = self->_searchFieldView;
  return (RouteWaypointSearchFields *)fieldsViewController;
}

- (void)updateFieldsWithCurrentDirectionItem
{
  void *v3;
  void *v4;
  id v5;

  -[RouteSearchViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "directionItemForCurrentSession"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  -[RouteSearchViewController updateWithItems:](self, "updateWithItems:", v4);

}

- (void)updateWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  objc_msgSend(v5, "setItems:", v4);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  v7 = objc_msgSend(v6, "hasInput");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  objc_msgSend(v9, "updateDataSourceHasInput:isEditing:", v7, objc_msgSend(v8, "isEditingAnySearchField"));

}

- (void)setHeaderTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[RouteSearchViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (void)selectFieldIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));

  if (v5)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    objc_msgSend(v8, "selectFieldAtIndex:", a3);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v7 = objc_msgSend(v6, "isUsingOfflineMaps");

    if (v7)
    {
      self->_isWaitingForTextSearchSupport = 1;
      self->_editIndex = a3;
      self->_waypointIndex = a3;
    }
    else
    {
      -[RouteSearchViewController _selectFieldAtIndex:](self, "_selectFieldAtIndex:", a3);
    }
  }
}

- (void)_selectFieldAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *cachedItems;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t waypointIndex;
  _BOOL8 v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;

  if (!self->_selectionHandler)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "directionItemForCurrentSession"));
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
    cachedItems = self->_cachedItems;
    self->_cachedItems = v7;

    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = a3;
    self->_waypointIndex = v9;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
    a3 = 0;
    goto LABEL_15;
  }
  if (a3 == -1)
  {
    a3 = objc_claimAutoreleasedReturnValue(-[NSArray lastObject](self->_cachedItems, "lastObject"));
    v10 = 0;
    goto LABEL_15;
  }
  if (-[NSArray count](self->_cachedItems, "count") <= a3)
  {
    v10 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_cachedItems, "objectAtIndexedSubscript:", a3));
  if (a3)
  {
LABEL_14:
    v20 = v10;
    a3 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_cachedItems, "objectAtIndexedSubscript:", a3 - 1));
    v10 = v20;
  }
LABEL_15:
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waypointName"));
  -[RouteSearchViewController setUsingExistingWaypointNameForAutocomplete:](self, "setUsingExistingWaypointNameForAutocomplete:", objc_msgSend(v11, "length") != 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  objc_msgSend(v12, "setSearchFieldItem:", v21);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  objc_msgSend(v13, "setPreviousSearchFieldItem:", a3);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  objc_msgSend(v14, "beginEditingNextSearchField");

  -[RouteSearchViewController _updateTitle](self, "_updateTitle");
  waypointIndex = self->_waypointIndex;
  v16 = waypointIndex == 0x7FFFFFFFFFFFFFFFLL || waypointIndex >= -[NSArray count](self->_cachedItems, "count");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v18 = objc_msgSend(v17, "isUsingOfflineMaps");

  if (!v18 || self->_supportsFullTextSearch)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
    objc_msgSend(v19, "updateTableViewHeader:", v16);

  }
}

- (BOOL)canDeleteCurrentFieldIndex
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  v3 = objc_msgSend(v2, "canDeleteCurrentFieldIndex");

  return v3;
}

- (void)deleteCurrentFieldIndex
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  objc_msgSend(v2, "deleteCurrentFieldIndex");

}

- (void)replaceSelectedFieldWithItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  objc_msgSend(v5, "updateSearchFieldsFromIndex:withItem:", 0x7FFFFFFFFFFFFFFFLL, v4);

}

- (void)setPauseSelectionUpdates:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  objc_msgSend(v4, "setPauseSelectionUpdates:", v3);

}

- (void)makeAFieldFirstResponderIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    v5 = objc_msgSend(v4, "_currentlySelectedIndexForAddStop");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    v9 = v6;
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_9;
    objc_msgSend(v6, "selectFieldAtIndex:", v5);
  }
  else
  {
    if (self->_supportsFullTextSearch
      || (v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper")),
          v8 = objc_msgSend(v7, "isUsingOfflineMaps"),
          v7,
          !v8))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
      v9 = v6;
LABEL_9:
      objc_msgSend(v6, "beginEditingNextSearchField");
      goto LABEL_10;
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
    objc_msgSend(v9, "updateCategoryDataSource:", self->_supportsFullTextSearch);
  }
LABEL_10:

}

- (void)setDelegate:(id)a3
{
  id v4;

  objc_storeWeak((id *)&self->_delegate, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  objc_msgSend(v4, "reconfigureDataSources");

}

- (void)setDataCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_dataCoordinator, a3);
  -[RouteSearchViewController updateFieldsWithCurrentDirectionItem](self, "updateFieldsWithCurrentDirectionItem");
}

- (unint64_t)_currentlySelectedIndexForAddStop
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    v5 = objc_msgSend(v4, "_currentlySelectedIndexForAddStop");

    return (unint64_t)v5;
  }
  else if (self->_waypointIndex == -1)
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    return self->_waypointIndex;
  }
}

- (id)latLngFromSearchFieldItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "latLng"));
  v5 = v4;
  if (v4)
    v6 = v4;
  else

  return v5;
}

- (id)selectedSearchFieldItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchFieldItem"));

  return v3;
}

- (BOOL)hasInputsInSearchField
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  v3 = objc_msgSend(v2, "hasInput");

  return v3;
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)RouteSearchViewController;
  -[ContaineeViewController viewDidLoad](&v26, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    LODWORD(v5) = 1148846080;
    objc_msgSend(v4, "setContentHuggingPriority:forAxis:", 1, v5);

    v6 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:adaptiveFont:](UIFont, "_maps_boldSystemFontWithFixedSize:adaptiveFont:", 1, 17.0));
    objc_msgSend(v6, "setFont:", v7);

    LODWORD(v8) = 1148846080;
    objc_msgSend(v6, "setContentHuggingPriority:forAxis:", 1, v8);
    LODWORD(v9) = 1144750080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 0, v9);
    LODWORD(v10) = 1148846080;
    objc_msgSend(v6, "setContentCompressionResistancePriority:forAxis:", 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v11, "addSubview:", v6);

    -[RouteSearchViewController setTitleLabel:](self, "setTitleLabel:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:adaptiveFont:](UIFont, "_maps_systemFontWithFixedSize:adaptiveFont:", 1, 17.0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleLabel"));
    objc_msgSend(v14, "setFont:", v13);

    v15 = sub_1009A98D8();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    objc_msgSend(v12, "setTitle:forState:", v16, 0);

    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_cancelTapped:", 64);
    LODWORD(v17) = 1148846080;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 1, v17);
    LODWORD(v18) = 1148846080;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    objc_msgSend(v19, "addSubview:", v12);

    -[RouteSearchViewController setCloseButton:](self, "setCloseButton:", v12);
    -[RouteSearchViewController _setupHeaderContentViewConstraints](self, "_setupHeaderContentViewConstraints");
    -[RouteSearchViewController _updateTitle](self, "_updateTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    LODWORD(v14) = objc_msgSend(v20, "isUsingOfflineMaps");

    if ((_DWORD)v14)
      -[RouteSearchViewController _initOfflinePlaceHolderWithTicket](self, "_initOfflinePlaceHolderWithTicket");
    else
      -[RouteSearchViewController _addSubViewsWithTextSearchSupport:](self, "_addSubViewsWithTextSearchSupport:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController view](self, "view"));
    v22 = (objc_class *)objc_opt_class(self);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Controller"), &stru_1011EB268));
    objc_msgSend(v21, "setAccessibilityIdentifier:", v25);

    +[KeyboardAvoidingView startObservingKeyboard](KeyboardAvoidingView, "startObservingKeyboard");
  }
}

- (void)_addSubViewsWithTextSearchSupport:(BOOL)a3
{
  _BOOL8 v3;
  RouteWaypointSearchFieldView *v5;
  RouteWaypointSearchFieldView *searchFieldView;
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

  v3 = a3;
  if (a3)
  {
    v5 = -[RouteWaypointSearchFieldView initWithDelegate:]([RouteWaypointSearchFieldView alloc], "initWithDelegate:", self);
    searchFieldView = self->_searchFieldView;
    self->_searchFieldView = v5;

    -[RouteWaypointSearchFieldView setTranslatesAutoresizingMaskIntoConstraints:](self->_searchFieldView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_searchFieldView);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  -[RouteSearchViewController addChildViewController:](self, "addChildViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
  objc_msgSend(v11, "addSubview:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  objc_msgSend(v14, "didMoveToParentViewController:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  LODWORD(v12) = objc_msgSend(v15, "isUsingOfflineMaps");

  if ((_DWORD)v12 && !v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
    objc_msgSend(v16, "endEditingFields");

  }
  -[RouteSearchViewController _setupConstraints:](self, "_setupConstraints:", v3);
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RouteSearchViewController;
  v4 = a3;
  -[RouteSearchViewController setTitle:](&v6, "setTitle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel", v6.receiver, v6.super_class));
  objc_msgSend(v5, "setText:", v4);

}

- (void)_updateTitle
{
  void *v3;
  id v4;
  void *v5;
  unint64_t waypointIndex;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController title](self, "title"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController title](self, "title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v5, "setText:", v10);
  }
  else
  {
    waypointIndex = self->_waypointIndex;
    if (waypointIndex == 0x7FFFFFFFFFFFFFFFLL || waypointIndex >= -[NSArray count](self->_cachedItems, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = CFSTR("Add Stop");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = CFSTR("Change Stop");
    }
    v10 = v7;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
    objc_msgSend(v9, "setText:", v5);

  }
}

- (void)handleDismissAction:(id)a3
{
  -[RouteSearchViewController _cancelTapped:](self, "_cancelTapped:", a3);
}

- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly
{
  -[RouteSearchViewController _cancelTapped:](self, "_cancelTapped:", 0);
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
  -[RouteSearchViewController _cancelTapped:](self, "_cancelTapped:", 0);
}

- (void)didDismissByGesture
{
  _QWORD v2[5];
  unsigned __int8 v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100C785F8;
  v2[3] = &unk_1011ACE58;
  v2[4] = self;
  v3 = -[RouteSearchViewController exitRoutePlanningOnCancel](self, "exitRoutePlanningOnCancel");
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

- (void)_setupHeaderContentViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  id v34;
  id v35;
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
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD v57[10];

  v34 = objc_alloc((Class)NSMutableArray);
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController closeButton](self, "closeButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "topAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintGreaterThanOrEqualToAnchor:constant:", v53, 16.0));
  v57[0] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController closeButton](self, "closeButton"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "centerYAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "centerYAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v57[1] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController closeButton](self, "closeButton"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintGreaterThanOrEqualToAnchor:constant:", v43, 16.0));
  v57[2] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController closeButton](self, "closeButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 16.0));
  v57[3] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 16.0));
  v57[4] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v57[5] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v21, 16.0));
  v57[6] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController closeButton](self, "closeButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintGreaterThanOrEqualToAnchor:constant:", v16, 4.0));
  v57[7] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerXAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  LODWORD(v6) = 1144750080;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:priority:", v5, 0.0, v6));
  v57[8] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:constant:", v11, 16.0));
  v57[9] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 10));
  v35 = objc_msgSend(v34, "initWithArray:", v13);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);
}

- (void)_setupConstraints:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  uint64_t v15;
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
  id v46;
  _QWORD v47[4];
  _QWORD v48[3];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));

  if (!v5)
  {
    v46 = objc_alloc_init((Class)NSMutableArray);
    if (v3)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView leadingAnchor](self->_searchFieldView, "leadingAnchor"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v40));
      v48[0] = v38;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView trailingAnchor](self->_searchFieldView, "trailingAnchor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v7));
      v48[1] = v8;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView topAnchor](self->_searchFieldView, "topAnchor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
      v48[2] = v12;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
      objc_msgSend(v46, "addObjectsFromArray:", v13);

      v14 = MKPlaceCollectionsLogicController_ptr;
      v15 = objc_claimAutoreleasedReturnValue(-[RouteWaypointSearchFieldView bottomAnchor](self->_searchFieldView, "bottomAnchor"));
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController titleLabel](self, "titleLabel"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));

      v14 = MKPlaceCollectionsLogicController_ptr;
    }
    v32 = (void *)v15;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v37));
    v47[0] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "view"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
    v47[1] = v28;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v15, 16.0));
    v47[2] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v47[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14[304], "arrayWithObjects:count:", v47, 4));
    objc_msgSend(v46, "addObjectsFromArray:", v25);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
  }
}

- (void)willBecomeCurrent:(BOOL)a3
{
  void *v4;
  uint64_t IsEnabled_Maps420;
  uint64_t v6;
  uint64_t v7;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  uint64_t IsEnabled_Maps182;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RouteSearchViewController;
  -[ContaineeViewController willBecomeCurrent:](&v14, "willBecomeCurrent:", a3);
  -[RouteSearchViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
  IsEnabled_Maps420 = (uint64_t)objc_msgSend(v4, "desiredTransportType");
  v7 = 0;
  switch(IsEnabled_Maps420)
  {
    case 0:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v6);
      if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
      {
        IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
        if ((IsEnabled_Maps420 & 1) == 0)
          goto LABEL_5;
      }
      v7 = 1;
      break;
    case 1:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v6);
      goto LABEL_8;
    case 2:
LABEL_5:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
      goto LABEL_8;
    case 5:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
LABEL_8:
      v7 = IsEnabled_Maps182;
      break;
    default:
      break;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  objc_msgSend(v10, "setMprEnabled:", v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  v12 = objc_opt_respondsToSelector(v11, "willBecomeCurrent:");

  if ((v12 & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    objc_msgSend(v13, "willBecomeCurrent");

  }
}

- (void)didResignCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RouteSearchViewController;
  -[ContaineeViewController didResignCurrent](&v3, "didResignCurrent");
  -[RouteSearchViewController _cleanUpOnDismiss](self, "_cleanUpOnDismiss");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteSearchViewController;
  -[RouteSearchViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("RouteSearchViewControllerDidAppear"), 0);

}

- (void)_cleanUpOnDismiss
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  objc_msgSend(v3, "clear");

  -[RouteSearchViewController setExitRoutePlanningOnCancel:](self, "setExitRoutePlanningOnCancel:", 0);
}

- (id)_itemsForRouteRequest
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t waypointIndex;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemsForRouteRequest"));
  v6 = v5;
  if (v3)
  {
    v7 = v4;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directionItemForCurrentSession"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "items"));
    v6 = objc_msgSend(v10, "mutableCopy");

    waypointIndex = self->_waypointIndex;
    if (waypointIndex >= (unint64_t)objc_msgSend(v6, "count"))
      objc_msgSend(v6, "addObject:", v7);
    else
      objc_msgSend(v6, "replaceObjectAtIndex:withObject:", self->_waypointIndex, v7);
  }

  return v6;
}

- (BOOL)_isReadyToRoute
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  unsigned int v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController _itemsForRouteRequest](self, "_itemsForRouteRequest"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "waypoint", (_QWORD)v11));
        v8 = objc_msgSend(v7, "isValid");

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)_requestRoute
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController _itemsForRouteRequest](self, "_itemsForRouteRequest"));
  -[RouteSearchViewController _requestRouteWithItems:](self, "_requestRouteWithItems:", v3);

}

- (void)_requestRouteWithItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  DirectionItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _UNKNOWN **v33;
  void *v34;
  id v35;
  const __CFString *v36;
  _UNKNOWN **v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  objc_msgSend(v5, "endEditingFields");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  objc_msgSend(v6, "updateDataSourceHasInput:isEditing:", 0, objc_msgSend(v7, "isEditingAnySearchField"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  objc_msgSend(v8, "reloadData");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v9, "captureUserAction:onTarget:eventValue:", 6003, -[RouteSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
  v11 = objc_msgSend(v10, "desiredTransportType");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentDirectionItemForRouteSearchViewController:", self));

  if (!v11)
  {
    if (objc_msgSend(v13, "editRequired:", 0))
      v11 = objc_msgSend(v13, "transportType");
    else
      v11 = 0;
  }
  v14 = self->_wasLocationServicesApproved && self->_wasAuthorizedForPreciseLocation;
  v15 = -[DirectionItem initWithItems:ignoreMapType:transportType:]([DirectionItem alloc], "initWithItems:ignoreMapType:transportType:", v4, v14, v11);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "drivePreferences"));
    -[DirectionItem setDrivePreferences:](v15, "setDrivePreferences:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "transitPreferences"));
    -[DirectionItem setTransitPreferences:](v15, "setTransitPreferences:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "cyclePreferences"));
    -[DirectionItem setCyclePreferences:](v15, "setCyclePreferences:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "timing"));
    -[DirectionItem setTiming:](v15, "setTiming:", v24);

  }
  v25 = objc_alloc((Class)NSMutableDictionary);
  v36 = CFSTR("DirectionsSessionInitiatorKey");
  v37 = &off_101271548;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
  v27 = objc_msgSend(v25, "initWithDictionary:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "originalHistoryEntryIdentifier"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, CFSTR("DirectionsRouteUUIDKey"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController dataCoordinator](self, "dataCoordinator"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "automaticSharingContacts"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("DirectionsPreviousContactsForTripSharing"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  LODWORD(v31) = objc_msgSend(v32, "hasInput");

  if ((_DWORD)v31)
    v33 = &off_101271560;
  else
    v33 = &off_101271578;
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("GEOMapServiceTraits_Source"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate"));
  v35 = objc_msgSend(v27, "copy");
  objc_msgSend(v34, "routeSearchViewController:wantsToRequestRoutesWithItem:allowToPromptEditing:userInfo:", self, v15, 1, v35);

}

- (void)routeSearchFieldsDidBeginEditing:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v5 = objc_msgSend(v4, "hasInput");
  v6 = objc_msgSend(v4, "isEditingAnySearchField");

  objc_msgSend(v7, "updateDataSourceHasInput:isEditing:", v5, v6);
}

- (void)routeSearchFieldsDidUpdateItemsForRouteRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 v10;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  objc_msgSend(v5, "reset");

  if (self->_selectionHandler)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemsForRouteRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    (*((void (**)(void))self->_selectionHandler + 2))();
    goto LABEL_3;
  }
  if (sub_1002A8AA0(self) == 5)
  {
    if (!-[RouteSearchViewController _isReadyToRoute](self, "_isReadyToRoute"))
      goto LABEL_3;
LABEL_9:
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100C799EC;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    goto LABEL_3;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = -[RouteSearchViewController _isReadyToRoute](self, "_isReadyToRoute");

    if ((v10 & 1) != 0)
      goto LABEL_9;
  }
LABEL_3:

}

- (void)routeSearch:(id)a3 didUpdateInputText:(id)a4 atIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t waypointIndex;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v11 = objc_msgSend(v8, "length") != 0;
  v12 = objc_msgSend(v9, "isEditingAnySearchField");

  objc_msgSend(v10, "updateDataSourceHasInput:isEditing:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController traitsForRouteSearchTableViewController:](self, "traitsForRouteSearchTableViewController:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController _itemsForRouteRequest](self, "_itemsForRouteRequest"));
    v17 = v16;
    if (a5)
    {
      if ((unint64_t)objc_msgSend(v16, "count") > a5)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", a5 - 1));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "items"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndex:", a5));

        waypointIndex = 1;
        goto LABEL_6;
      }
      waypointIndex = 1;
    }
    else
    {
      waypointIndex = 0;
    }

    v18 = 0;
    v21 = 0;
    goto LABEL_19;
  }
  waypointIndex = self->_waypointIndex;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "previousSearchFieldItem"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchFieldItem"));
LABEL_6:

  if (v18)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController latLngFromSearchFieldItem:](self, "latLngFromSearchFieldItem:", v18));
    objc_msgSend(v24, "lat");
    v26 = v25;
    objc_msgSend(v24, "lng");
    if (v27 < -180.0 || v27 > 180.0 || v26 < -90.0 || v26 > 90.0)
    {
      v28 = sub_10043214C();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v33 = 138412290;
        v34 = v18;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Previous location in Route Planning has invalid coordinate. SearchFieldItem: %@", (uint8_t *)&v33, 0xCu);
      }

    }
    else
    {
      objc_msgSend(v14, "setAutocompleteOriginationPreviousLatlng:", v24);
    }

  }
LABEL_19:
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "composedWaypoint"));
  objc_msgSend(v14, "setAutocompleteOriginationEditingServerWaypoints:", objc_msgSend(v30, "isServerProvidedWaypoint"));

  -[RouteSearchViewController setUsingExistingWaypointNameForAutocomplete:](self, "setUsingExistingWaypointNameForAutocomplete:", 0);
  if (waypointIndex)
    v31 = 14;
  else
    v31 = 13;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  objc_msgSend(v32, "updateInputText:traits:source:", v8, v14, v31);

}

- (void)routeSearch:(id)a3 didSearchForItem:(id)a4 previousSearchItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  if (v9)
  {
    v10 = v7;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchFieldItem"));

  }
  v20[0] = CFSTR("kAddStopFromWaypointEditor");
  v20[1] = CFSTR("IsServerProvidedWaypoint");
  v21[0] = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "composedWaypoint"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v12, "isServerProvidedWaypoint")));
  v21[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController latLngFromSearchFieldItem:](self, "latLngFromSearchFieldItem:", v8));
  if (v8 && v16)
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("kAddStopPreviousLocationLatLng"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v17, "captureUserAction:onTarget:eventValue:", 2014, -[RouteSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate"));
  v19 = objc_msgSend(v15, "copy");
  objc_msgSend(v18, "routeSearchViewController:wantsToPerformSearchWithItem:userInfo:", self, v7, v19);

}

- (void)routeSearchFields:(id)a3 didClearInputTextForWaypointAtIndex:(unint64_t)waypointIndex
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (waypointIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    if (v6)
    {

      waypointIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (self->_waypointIndex == -1)
    {
      waypointIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      waypointIndex = self->_waypointIndex;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = -[RouteSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
  if ((~waypointIndex & 0x7FFFFFFFFFFFFFFFLL) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", waypointIndex));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
    objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 278, v8, v10);

  }
  else
  {
    objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 278, v8, 0);
  }

}

- (id)personalizedItemManagerForRouteSearchTableViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personalizedItemManagerForRouteSearchViewController:", self));

  return v5;
}

- (id)userLocationSearchResultForRouteSearchTableViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userLocationSearchResultForRouteSearchViewController:", self));

  return v5;
}

- (id)latLngForRouteSearchTableViewController:(id)a3
{
  void *v4;
  void *v5;
  char *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController", a3));

  if (!v4)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "previousSearchFieldItem"));
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController latLngFromSearchFieldItem:](self, "latLngFromSearchFieldItem:", v13));

LABEL_9:
    v7 = v7;
    v11 = v7;
    goto LABEL_10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  v6 = (char *)objc_msgSend(v5, "_currentlySelectedIndexForAddStop");

  v7 = 0;
  if (v6 && v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v6 - 1));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "latLng"));

  }
  v11 = 0;
  if (v6 && v6 != (char *)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_9;
LABEL_10:

  return v11;
}

- (id)traitsForRouteSearchTableViewController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t IsEnabled_HikingiOS;
  uint64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitsForRouteSearchViewController:", self));

  IsEnabled_HikingiOS = MapsFeature_IsEnabled_HikingiOS();
  if ((IsEnabled_HikingiOS & 1) != 0)
  {
    v7 = 35;
  }
  else if (MapsFeature_IsEnabled_SearchAndDiscovery(IsEnabled_HikingiOS))
  {
    v7 = 31;
  }
  else
  {
    v7 = 28;
  }
  objc_msgSend(v5, "setPlaceSummaryRevision:", v7);
  objc_msgSend(v5, "addSupportedPlaceSummaryFormatType:", 1);
  objc_msgSend(v5, "addSupportedPlaceSummaryFormatType:", 2);
  objc_msgSend(v5, "addSupportedPlaceSummaryFormatType:", 3);
  objc_msgSend(v5, "setSupportClientRankingFeatureMetadata:", 1);
  objc_msgSend(v5, "setSupportClientRankingCompositeFeatures:", 1);
  objc_msgSend(v5, "setIsRoutePlanningEditStopFillRequest:", -[RouteSearchViewController isUsingExistingWaypointNameForAutocomplete](self, "isUsingExistingWaypointNameForAutocomplete"));
  objc_msgSend(v5, "addSupportedAutocompleteListType:", 2);
  return v5;
}

- (BOOL)routeSearchController:(id)a3 waypointsIncludeObject:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  v7 = objc_msgSend(v6, "containsWaypointForItem:", v5);

  return v7;
}

- (BOOL)waypointsIncludeCurrentLocationForRouteSearchTableViewController:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields", a3));
  v4 = objc_msgSend(v3, "containsCurrentLocationItem");

  return v4;
}

- (void)routeSearchController:(id)a3 didSelectItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:](SearchFieldItem, "searchFieldItemWithObject:expandRecentsItem:preserveContact:", v5, 1, 1));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
    objc_msgSend(v7, "updateSearchFieldsFromIndex:withItem:", 0x7FFFFFFFFFFFFFFFLL, v6);

  }
  else
  {
    v8 = objc_opt_class(HistoryEntryRecentsItem);
    v9 = v5;
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "historyEntry"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100C7A49C;
    v16[3] = &unk_1011EA6D8;
    v16[4] = self;
    objc_msgSend(v12, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", 0, v16, 0, 0);

  }
  v13 = objc_opt_class(AddressBookAddress);
  if ((objc_opt_isKindOfClass(v5, v13) & 1) == 0)
  {
    v14 = objc_opt_class(HistoryEntryRecentsItem);
    if ((objc_opt_isKindOfClass(v5, v14) & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", 2025, -[RouteSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

    }
  }

}

- (void)routeSearchController:(id)a3 doSearchItem:(id)a4 userInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController suggestionsTableViewController](self, "suggestionsTableViewController"));
  objc_msgSend(v9, "reset");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate"));
  objc_msgSend(v10, "routeSearchViewController:wantsToPerformSearchWithItem:userInfo:", self, v8, v7);

}

- (void)didTapOnQueryAcceleratorWithItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController searchFieldView](self, "searchFieldView"));
  objc_msgSend(v5, "shouldReplaceTextWithCompletion:", v4);

}

- (void)_cancelTapped:(id)a3
{
  id v4;

  v4 = a3;
  -[RouteSearchViewController _cancelTapped:exitRoutePlanning:](self, "_cancelTapped:exitRoutePlanning:", v4, -[RouteSearchViewController exitRoutePlanningOnCancel](self, "exitRoutePlanningOnCancel"));

}

- (void)_cancelTapped:(id)a3 exitRoutePlanning:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void (**selectionHandler)(id, _QWORD);
  id v9;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService", a3));
  objc_msgSend(v6, "captureUserAction:onTarget:eventValue:", 18, -[RouteSearchViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController routeSearchFields](self, "routeSearchFields"));
  objc_msgSend(v7, "endEditingFields");

  selectionHandler = (void (**)(id, _QWORD))self->_selectionHandler;
  if (selectionHandler)
  {
    selectionHandler[2](selectionHandler, 0);
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController delegate](self, "delegate"));
    objc_msgSend(v9, "routeSearchViewControllerDidDismiss:shouldExitRoutePlanning:", self, v4);

  }
}

- (int)currentUITargetForAnalytics
{
  return 607;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (int)searchFieldTypeForAnalytics
{
  void *v3;
  unsigned int v4;
  void *v5;
  int v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___GEOLogContextDelegate);

  if (!v4)
    return 2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteSearchViewController fieldsViewController](self, "fieldsViewController"));
  if ((objc_opt_respondsToSelector(v5, "searchFieldTypeForAnalytics") & 1) != 0)
    v6 = objc_msgSend(v5, "searchFieldTypeForAnalytics");
  else
    v6 = 2;

  return v6;
}

- (void)_initOfflinePlaceHolderWithTicket
{
  NSObject *offlineTextSearchSupportQueue;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;
  _QWORD block[5];
  id v9;
  id location;

  objc_initWeak(&location, self);
  offlineTextSearchSupportQueue = self->_offlineTextSearchSupportQueue;
  if (!offlineTextSearchSupportQueue)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Maps.text.search.support.queue", v5);
    v7 = self->_offlineTextSearchSupportQueue;
    self->_offlineTextSearchSupportQueue = v6;

    offlineTextSearchSupportQueue = self->_offlineTextSearchSupportQueue;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C7A874;
  block[3] = &unk_1011AEAA0;
  block[4] = self;
  objc_copyWeak(&v9, &location);
  dispatch_async(offlineTextSearchSupportQueue, block);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (RoutePlanningDataCoordination)dataCoordinator
{
  return (RoutePlanningDataCoordination *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (RouteSearchViewControllerDelegate)delegate
{
  return (RouteSearchViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)exitRoutePlanningOnCancel
{
  return self->_exitRoutePlanningOnCancel;
}

- (void)setExitRoutePlanningOnCancel:(BOOL)a3
{
  self->_exitRoutePlanningOnCancel = a3;
}

- (BOOL)isUsingExistingWaypointNameForAutocomplete
{
  return self->_usingExistingWaypointNameForAutocomplete;
}

- (void)setUsingExistingWaypointNameForAutocomplete:(BOOL)a3
{
  self->_usingExistingWaypointNameForAutocomplete = a3;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (RouteWaypointSuggestionsTableViewController)suggestionsTableViewController
{
  return self->_suggestionsTableViewController;
}

- (void)setSuggestionsTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsTableViewController, a3);
}

- (RouteWaypointSearchFieldView)searchFieldView
{
  return self->_searchFieldView;
}

- (void)setSearchFieldView:(id)a3
{
  objc_storeStrong((id *)&self->_searchFieldView, a3);
}

- (RoutePlanningWaypointEditorViewController)fieldsViewController
{
  return self->_fieldsViewController;
}

- (void)setFieldsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fieldsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldsViewController, 0);
  objc_storeStrong((id *)&self->_searchFieldView, 0);
  objc_storeStrong((id *)&self->_suggestionsTableViewController, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_offlineTextSearchSupportQueue, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_cachedItems, 0);
  objc_storeStrong((id *)&self->_headerHeightConstraint, 0);
}

@end
