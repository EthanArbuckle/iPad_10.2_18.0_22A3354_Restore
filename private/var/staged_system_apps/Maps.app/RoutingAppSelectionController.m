@implementation RoutingAppSelectionController

- (RoutingAppSelectionController)initWithTransportType:(int64_t)a3
{
  RoutingAppSelectionController *v4;
  RoutingAppSelectionController *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  RoutingAppSuggestionProvider *v10;
  RoutingAppSuggestionProvider *suggestionProvider;
  _UNKNOWN **v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RoutingAppSelectionController;
  v4 = -[RoutingAppSelectionController initWithStyle:](&v14, "initWithStyle:", 0);
  v5 = v4;
  if (v4)
  {
    v4->_transportType = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController navigationItem](v4, "navigationItem"));
    v7 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, v5, "_cancelRoutingSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Routing Apps"), CFSTR("localized string not found"), 0));
    objc_msgSend(v6, "setTitle:", v9);

    objc_msgSend(v6, "setLeftBarButtonItem:", v7);
    v10 = objc_alloc_init(RoutingAppSuggestionProvider);
    suggestionProvider = v5->_suggestionProvider;
    v5->_suggestionProvider = v10;

    -[RoutingAppSuggestionProvider setDelegate:](v5->_suggestionProvider, "setDelegate:", v5);
    if (-[RoutingAppSuggestionProvider appInstallationDisallowed](v5->_suggestionProvider, "appInstallationDisallowed"))
      v12 = &off_101273C98;
    else
      v12 = &off_101273CB0;
    objc_storeStrong((id *)&v5->_sections, v12);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RoutingAppSelectionController;
  -[RoutingAppSelectionController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController tableView](self, "tableView"));
  objc_msgSend(v3, "setSeparatorStyle:", 1);
  objc_msgSend(v3, "_setMarginWidth:", 15.0);
  objc_msgSend(v3, "setSectionHeaderTopPadding:", 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setBackgroundView:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController theme](self, "theme"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hairlineColor"));
  objc_msgSend(v3, "setSeparatorColor:", v6);

  objc_msgSend(v3, "setRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "setEstimatedRowHeight:", 84.0);
  objc_msgSend(v3, "setSectionHeaderHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v3, "_setHeaderAndFooterViewsFloat:", 0);
  objc_msgSend(v3, "registerClass:forHeaderFooterViewReuseIdentifier:", objc_opt_class(SectionHeaderTableViewHeaderFooterView), CFSTR("Header"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(RoutingAppSelectionCell), CFSTR("AppCell"));
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(RoutingAppSelectionLoadingCell), CFSTR("LoadingCell"));

}

- (void)didReceiveMemoryWarning
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RoutingAppSelectionController;
  -[RoutingAppSelectionController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKAppImageManager sharedImageManager](MKAppImageManager, "sharedImageManager"));
  objc_msgSend(v2, "clearImageCache");

}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)updateForWaypointSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  GEOComposedWaypoint **p_source;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  -[RoutingAppSelectionController setResolvedEndpoints:](self, "setResolvedEndpoints:", 0);
  -[RoutingAppSelectionController setSortedStoreApps:](self, "setSortedStoreApps:", 0);
  -[RoutingAppSelectionController setSortedInstalledApps:](self, "setSortedInstalledApps:", 0);
  -[RoutingAppSelectionController setSuggestedStoreApps:](self, "setSuggestedStoreApps:", 0);
  -[RoutingAppSelectionController setSuggestedInstalledApps:](self, "setSuggestedInstalledApps:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestionProvider](self, "suggestionProvider"));
  objc_msgSend(v5, "reset");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController tableView](self, "tableView"));
  objc_msgSend(v6, "reloadData");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v8 = objc_msgSend(v7, "copy");
  -[RoutingAppSelectionController setSource:](self, "setSource:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v10 = objc_msgSend(v9, "copy");
  -[RoutingAppSelectionController setDestination:](self, "setDestination:", v10);

  p_source = &self->_source;
  if ((-[GEOComposedWaypoint isCurrentLocation](self->_source, "isCurrentLocation") & 1) != 0
    || -[GEOComposedWaypoint isCurrentLocation](self->_destination, "isCurrentLocation"))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100791CF0;
    v15[3] = &unk_1011C6700;
    v15[4] = self;
    v12 = objc_retainBlock(v15);
    if ((-[GEOComposedWaypoint isCurrentLocation](*p_source, "isCurrentLocation") & 1) == 0)
      p_source = &self->_destination;
    v13 = ((uint64_t (*)(_QWORD *, GEOComposedWaypoint *))v12[2])(v12, *p_source);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[RoutingAppSelectionController setLocationLookupOperation:](self, "setLocationLookupOperation:", v14);

  }
  -[RoutingAppSelectionController _updateSuggestions](self, "_updateSuggestions");
}

- (BOOL)_updateSuggestions
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  NSObject *v19;
  GEOComposedWaypoint *destination;
  unint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  BOOL v25;
  uint8_t v27[8];
  _QWORD v28[2];

  if (-[RoutingAppSelectionController hasResolvedEndpoints](self, "hasResolvedEndpoints"))
  {
    v3 = sub_100791ED8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      v5 = "Endpoints are already resolved, ignoring update command.";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, v27, 2u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](self->_source, "latLng"));
  objc_msgSend(v6, "lat");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](self->_source, "latLng"));
  objc_msgSend(v9, "lng");
  v11 = v10;

  if (!self->_source || v11 < -180.0 || v11 > 180.0 || v8 < -90.0 || v8 > 90.0)
  {
    v23 = sub_100791ED8();
    v4 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      v5 = "Can't update suggestions yet. Source coordinate is not yet resolved.";
      goto LABEL_22;
    }
LABEL_23:
    v25 = 0;
    goto LABEL_24;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](self->_destination, "latLng"));
  objc_msgSend(v12, "lat");
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint latLng](self->_destination, "latLng"));
  objc_msgSend(v15, "lng");
  v17 = v16;

  if (!self->_destination || v17 < -180.0 || v17 > 180.0 || v14 < -90.0 || v14 > 90.0)
  {
    v24 = sub_100791ED8();
    v4 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      v5 = "Can't update suggestions yet. Destination coordinate is not yet resolved.";
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  -[RoutingAppSelectionController setResolvedEndpoints:](self, "setResolvedEndpoints:", 1);
  v18 = sub_100791ED8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "We've got the start and end coordinates. Requesting suggestions.", v27, 2u);
  }

  -[RoutingAppSuggestionProvider requestSuggestionsForSource:destination:](self->_suggestionProvider, "requestSuggestionsForSource:destination:", v8, v11, v14, v17);
  destination = self->_destination;
  v28[0] = self->_source;
  v28[1] = destination;
  v4 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
  v21 = (unint64_t)-[RoutingAppSelectionController transportType](self, "transportType") - 1;
  if (v21 > 4)
    v22 = 4;
  else
    v22 = dword_100E3A4C4[v21];
  +[HistoryEntryRecentsItem saveWaypoints:transportType:](HistoryEntryRecentsItem, "saveWaypoints:transportType:", v4, v22);
  v25 = 1;
LABEL_24:

  return v25;
}

- (void)_handleSearchResultError:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v5;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;

  v4 = a3;
  v5 = a4;
  v6 = sub_100791ED8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = CFSTR("Destination");
    if (v4)
      v8 = CFSTR("Source");
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error resolving %{public}@. %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)reset
{
  MKLocationManagerOperation *locationLookupOperation;
  MKLocationManagerOperation *v4;

  locationLookupOperation = self->_locationLookupOperation;
  if (locationLookupOperation)
  {
    -[MKLocationManagerOperation cancel](locationLookupOperation, "cancel");
    v4 = self->_locationLookupOperation;
    self->_locationLookupOperation = 0;

  }
  -[RoutingAppSuggestionProvider reset](self->_suggestionProvider, "reset");
}

- (id)_appDataForStoreRow:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController sortedStoreApps](self, "sortedStoreApps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));

  return v5;
}

- (unint64_t)_sectionAtIndex:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[NSArray count](self->_sections, "count") <= a3)
    return -1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return (unint64_t)v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v5;
  int *v6;
  int64_t result;

  v5 = -[RoutingAppSelectionController _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  if (v5)
  {
    if (v5 != 1)
      return 0;
    v6 = &OBJC_IVAR___RoutingAppSelectionController__sortedStoreApps;
  }
  else
  {
    v6 = &OBJC_IVAR___RoutingAppSelectionController__sortedInstalledApps;
  }
  result = (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *v6), "count");
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;

  v6 = a3;
  v7 = -[RoutingAppSelectionController _sectionAtIndex:](self, "_sectionAtIndex:", a4);
  if (v7)
  {
    if (v7 != 1)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("Header")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("From the App Store");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("Header")));
    switch(MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0))
    {
      case 1u:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("[RoutingApps] Installed Section Header (iPhone)");
        break;
      case 2u:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("[RoutingApps] Installed Section Header (iPod)");
        break;
      case 3u:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("[RoutingApps] Installed Section Header (iPad)");
        break;
      case 6u:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("[RoutingApps] Installed Section Header (watch)");
        break;
      case 9u:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("[RoutingApps] Installed Section Header (mac)");
        break;
      default:
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v10 = v9;
        v11 = CFSTR("[RoutingApps] Installed Section Header (Device)");
        break;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, CFSTR("localized string not found"), 0));
  objc_msgSend(v8, "setTitle:", v12);

  objc_msgSend(v8, "setAccessibilityIdentifiersWithBaseString:", CFSTR("RoutingApps"));
LABEL_8:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = -[RoutingAppSelectionController _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v7, "section"));
  if (v9)
  {
    if (v9 == 1 && !-[NSArray count](self->_sortedStoreApps, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LoadingCell"), v7));
      v11 = objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestedStoreApps](self, "suggestedStoreApps"));
LABEL_11:
      v12 = (void *)v11;
      objc_msgSend(v10, "setMode:", v11 != 0);
      goto LABEL_12;
    }
  }
  else if (!-[NSArray count](self->_sortedInstalledApps, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("LoadingCell"), v7));
    v11 = objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestedInstalledApps](self, "suggestedInstalledApps"));
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AppCell"), v7));
  objc_msgSend(v10, "setDelegate:", self);
  objc_msgSend(v10, "setIntendedTransportType:", self->_transportType);
  if (!objc_msgSend(v7, "section"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_sortedInstalledApps, "objectAtIndexedSubscript:", v8));
    objc_msgSend(v10, "setAppProxy:", v12);
    goto LABEL_12;
  }
  if (objc_msgSend(v7, "section") == (id)1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController _appDataForStoreRow:](self, "_appDataForStoreRow:", v8));
    objc_msgSend(v10, "setAppStoreApp:", v12);
LABEL_12:

  }
  return v10;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == (id)1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (objc_msgSend(v8, "section") == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController tableView](self, "tableView"));
    objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v8, 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController _appDataForStoreRow:](self, "_appDataForStoreRow:", objc_msgSend(v8, "row")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iOSBundleIdentifier"));
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 45, 733, v7);

  }
}

- (void)_cancelRoutingSelection
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routingAppSelectionControllerDidCancel:", self);

}

- (void)_reloadSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[RoutingAppSelectionController isViewLoaded](self, "isViewLoaded")
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController view](self, "view")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window")),
        v6,
        v5,
        v6))
  {
    v8 = objc_msgSend(objc_alloc((Class)NSIndexSet), "initWithIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController tableView](self, "tableView"));
    objc_msgSend(v7, "reloadSections:withRowAnimation:", v8, 100);

  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController tableView](self, "tableView"));
    objc_msgSend(v8, "reloadData");
  }

}

- (void)routingAppSuggestionProvider:(id)a3 didSuggestStoreApps:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_100791ED8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received %lu App Store suggestions", (uint8_t *)&v8, 0xCu);
  }

  -[RoutingAppSelectionController setSuggestedStoreApps:](self, "setSuggestedStoreApps:", v5);
  -[RoutingAppSelectionController _updateSortedAppStoreAppsForTransportType:](self, "_updateSortedAppStoreAppsForTransportType:", self->_transportType);
  -[RoutingAppSelectionController _reloadSection:](self, "_reloadSection:", 1);

}

- (void)routingAppSuggestionProvider:(id)a3 didFailToSuggestStoreApps:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;

  v5 = a4;
  v6 = sub_100791ED8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error fetching store suggestions: %@.", (uint8_t *)&v9, 0xCu);

  }
  -[RoutingAppSelectionController setSuggestedStoreApps:](self, "setSuggestedStoreApps:", &__NSArray0__struct);
  -[RoutingAppSelectionController _reloadSection:](self, "_reloadSection:", 1);

}

- (void)routingAppSuggestionProvider:(id)a3 didSuggestInstalledApps:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a4;
  v6 = sub_100791ED8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Received %lu Installed App suggestions", (uint8_t *)&v8, 0xCu);
  }

  -[RoutingAppSelectionController setSuggestedInstalledApps:](self, "setSuggestedInstalledApps:", v5);
  -[RoutingAppSelectionController _updateSortedInstalledAppsForTransportType:](self, "_updateSortedInstalledAppsForTransportType:", self->_transportType);
  -[RoutingAppSelectionController _reloadSection:](self, "_reloadSection:", 0);

}

- (id)_sanitizedMapItemFromWaypoint:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = a3;
  if (!objc_msgSend(v3, "isCurrentLocation"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_clientAttributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressBookAttributes"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
      objc_msgSend(v8, "coordinate");
      v10 = v9;
      v12 = v11;

      v13 = objc_msgSend(objc_alloc((Class)MKPlacemark), "initWithCoordinate:addressDictionary:", 0, v10, v12);
      v4 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactName"));
      if (v15)
      {
        objc_msgSend(v4, "setName:", v15);
      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
        objc_msgSend(v4, "setName:", v22);

      }
    }
    else
    {
      v16 = objc_alloc((Class)MKMapItem);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
      v4 = objc_msgSend(v16, "initWithGeoMapItem:isPlaceHolderPlace:", v17, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
      objc_msgSend(v4, "setName:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_activityURL"));
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));

      if (!v13)
      {
LABEL_11:

        goto LABEL_12;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
      objc_msgSend(v4, "setUrl:", v14);
    }

    goto LABEL_11;
  }
  v4 = (id)objc_claimAutoreleasedReturnValue(+[MKMapItem mapItemForCurrentLocation](MKMapItem, "mapItemForCurrentLocation"));
LABEL_12:

  return v4;
}

- (void)_useInstalledApp:(id)a3 toRouteFromSource:(id)a4 toDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id WeakRetained;
  void *v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
  v12 = -180.0;
  v13 = -180.0;
  v14 = -180.0;
  if (v11)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geoMapItem"));
    objc_msgSend(v15, "coordinate");
    v13 = v16;
    v14 = v17;

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));
  v19 = -180.0;
  if (v18)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));
    objc_msgSend(v20, "coordinate");
    v12 = v21;
    v19 = v22;

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  +[GEOAPPortal captureTransitAppLaunchSource:destination:bundleIdentifier:](GEOAPPortal, "captureTransitAppLaunchSource:destination:bundleIdentifier:", v23, v13, v14, v12, v19);

  v24 = objc_alloc_init((Class)MKDirectionsRequest);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController _sanitizedMapItemFromWaypoint:](self, "_sanitizedMapItemFromWaypoint:", v9));
  objc_msgSend(v24, "setSource:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController _sanitizedMapItemFromWaypoint:](self, "_sanitizedMapItemFromWaypoint:", v10));
  objc_msgSend(v24, "setDestination:", v26);

  v27 = -[RoutingAppSelectionController transportType](self, "transportType");
  if (v27 > 5)
    v28 = 1;
  else
    v28 = qword_100E3A4D8[v27];
  objc_msgSend(v24, "setTransportType:", v28, v9);
  v29 = NSTemporaryDirectory();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("request")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathExtension:", MKDirectionsRequestFileExtension));

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v32));
  v45 = 0;
  v34 = objc_msgSend(v24, "writeToURL:error:", v33, &v45);
  v35 = v45;
  if ((v34 & 1) == 0)
  {
    v36 = sub_100791ED8();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v33;
      v48 = 2112;
      v49 = v35;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Couldn't write directions request to URL: %@.  Error: %@", buf, 0x16u);
    }

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:userInfo:delegate:", v33, v39, 0, 0, 0));

  objc_msgSend(v40, "start");
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAppsManager defaultManager](RoutingAppsManager, "defaultManager"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  objc_msgSend(v41, "recordAppLaunch:", v42);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "routingAppSelectionControllerDidSelectApp:", self);

}

- (void)_updateSortedInstalledAppsForTransportType:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  RoutingAppSelectionController *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAppSelectionCell _preferredModesForTransportType:](RoutingAppSelectionCell, "_preferredModesForTransportType:"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v6 = objc_msgSend(v11, "count");
  if (a3 && v6)
  {
    v7 = objc_alloc((Class)NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestedInstalledApps](self, "suggestedInstalledApps"));
    v9 = objc_msgSend(v7, "initWithArray:", v8);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1007934AC;
    v12[3] = &unk_1011C6728;
    v13 = v11;
    v14 = self;
    objc_msgSend(v9, "sortUsingComparator:", v12);
    v10 = objc_msgSend(v9, "copy");
    -[RoutingAppSelectionController setSortedInstalledApps:](self, "setSortedInstalledApps:", v10);

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestedInstalledApps](self, "suggestedInstalledApps"));
    -[RoutingAppSelectionController setSortedInstalledApps:](self, "setSortedInstalledApps:", v9);
  }

}

- (void)_updateSortedAppStoreAppsForTransportType:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  RoutingAppSelectionController *v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RoutingAppSelectionCell _preferredModesForTransportType:](RoutingAppSelectionCell, "_preferredModesForTransportType:"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v5));

  v6 = objc_msgSend(v11, "count");
  if (a3 && v6)
  {
    v7 = objc_alloc((Class)NSMutableArray);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestedStoreApps](self, "suggestedStoreApps"));
    v9 = objc_msgSend(v7, "initWithArray:", v8);

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100793768;
    v12[3] = &unk_1011C6750;
    v13 = v11;
    v14 = self;
    objc_msgSend(v9, "sortUsingComparator:", v12);
    v10 = objc_msgSend(v9, "copy");
    -[RoutingAppSelectionController setSortedStoreApps:](self, "setSortedStoreApps:", v10);

  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutingAppSelectionController suggestedStoreApps](self, "suggestedStoreApps"));
    -[RoutingAppSelectionController setSortedStoreApps:](self, "setSortedStoreApps:", v9);
  }

}

- (void)routingAppSelectionCellRoutePressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "appProxy"));
  -[RoutingAppSelectionController _useInstalledApp:toRouteFromSource:toDestination:](self, "_useInstalledApp:toRouteFromSource:toDestination:", v4, self->_source, self->_destination);

}

- (RoutingAppSelectionControllerDelegate)delegate
{
  return (RoutingAppSelectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(int64_t)a3
{
  self->_transportType = a3;
}

- (NSArray)suggestedStoreApps
{
  return self->_suggestedStoreApps;
}

- (void)setSuggestedStoreApps:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedStoreApps, a3);
}

- (NSArray)sortedStoreApps
{
  return self->_sortedStoreApps;
}

- (void)setSortedStoreApps:(id)a3
{
  objc_storeStrong((id *)&self->_sortedStoreApps, a3);
}

- (NSArray)suggestedInstalledApps
{
  return self->_suggestedInstalledApps;
}

- (void)setSuggestedInstalledApps:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedInstalledApps, a3);
}

- (NSArray)sortedInstalledApps
{
  return self->_sortedInstalledApps;
}

- (void)setSortedInstalledApps:(id)a3
{
  objc_storeStrong((id *)&self->_sortedInstalledApps, a3);
}

- (GEOComposedWaypoint)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (MKLocationManagerOperation)locationLookupOperation
{
  return self->_locationLookupOperation;
}

- (void)setLocationLookupOperation:(id)a3
{
  objc_storeStrong((id *)&self->_locationLookupOperation, a3);
}

- (RoutingAppSuggestionProvider)suggestionProvider
{
  return self->_suggestionProvider;
}

- (void)setSuggestionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionProvider, a3);
}

- (BOOL)hasResolvedEndpoints
{
  return self->_resolvedEndpoints;
}

- (void)setResolvedEndpoints:(BOOL)a3
{
  self->_resolvedEndpoints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_locationLookupOperation, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sortedInstalledApps, 0);
  objc_storeStrong((id *)&self->_suggestedInstalledApps, 0);
  objc_storeStrong((id *)&self->_sortedStoreApps, 0);
  objc_storeStrong((id *)&self->_suggestedStoreApps, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
