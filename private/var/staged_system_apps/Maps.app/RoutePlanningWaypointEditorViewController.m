@implementation RoutePlanningWaypointEditorViewController

- (RoutePlanningWaypointEditorViewController)initWithWaypointInfoProvider:(id)a3
{
  id v4;
  RoutePlanningWaypointEditorViewController *v5;
  RoutePlanningWaypointEditorViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointEditorViewController;
  v5 = -[RoutePlanningWaypointEditorViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_waypointInfoProvider, v4);

  return v6;
}

- (void)viewDidLoad
{
  RoutePlanningWaypointListView *v3;
  id WeakRetained;
  RoutePlanningWaypointListView *v5;
  RoutePlanningWaypointListView *waypointListView;
  double v7;
  double v8;
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
  objc_super v27;
  _QWORD v28[4];

  v27.receiver = self;
  v27.super_class = (Class)RoutePlanningWaypointEditorViewController;
  -[RoutePlanningWaypointEditorViewController viewDidLoad](&v27, "viewDidLoad");
  v3 = [RoutePlanningWaypointListView alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
  v5 = -[RoutePlanningWaypointListView initWithWaypoints:editingMode:delegate:waypointInfoProvider:](v3, "initWithWaypoints:editingMode:delegate:waypointInfoProvider:", &__NSArray0__struct, 2, self, WeakRetained);
  waypointListView = self->_waypointListView;
  self->_waypointListView = v5;

  -[RoutePlanningWaypointListView setTranslatesAutoresizingMaskIntoConstraints:](self->_waypointListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (sub_1002A8AA0(self) == 5)
  {
    LODWORD(v7) = 1148846080;
    -[RoutePlanningWaypointListView setContentCompressionResistancePriority:forAxis:](self->_waypointListView, "setContentCompressionResistancePriority:forAxis:", 1, v7);
    LODWORD(v8) = 1148846080;
    -[RoutePlanningWaypointListView setContentHuggingPriority:forAxis:](self->_waypointListView, "setContentHuggingPriority:forAxis:", 1, v8);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_waypointListView);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView leadingAnchor](self->_waypointListView, "leadingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v28[0] = v23;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView trailingAnchor](self->_waypointListView, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v28[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView topAnchor](self->_waypointListView, "topAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController view](self, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  v28[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView bottomAnchor](self->_waypointListView, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bottomAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, -4.0));
  v28[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningWaypointEditorViewController;
  -[RoutePlanningWaypointEditorViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[RoutePlanningWaypointListView collapseStopsIfNeeded](self->_waypointListView, "collapseStopsIfNeeded");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointEditorViewController;
  v4 = a3;
  -[RoutePlanningWaypointEditorViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "verticalSizeClass", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "verticalSizeClass");

  if (v5 != v7)
    -[RoutePlanningWaypointEditorViewController _invalidateIntrinsicContentSize](self, "_invalidateIntrinsicContentSize");
}

- (void)willBecomeCurrent
{
  self->_didInteractWithFields = 0;
  -[RoutePlanningWaypointListView deselectAllRows](self->_waypointListView, "deselectAllRows");
}

- (void)_invalidateIntrinsicContentSize
{
  void *v3;
  void (**v4)(void);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController intrinsicContentSizeInvalidationHandler](self, "intrinsicContentSizeInvalidationHandler"));

  if (v3)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController intrinsicContentSizeInvalidationHandler](self, "intrinsicContentSizeInvalidationHandler"));
    v4[2]();

  }
}

- (UILayoutGuide)layoutGuideForCurrentlyEditingField
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layoutGuideForCurrentlyEditingField"));

  return (UILayoutGuide *)v3;
}

- (NSString)focusGroupIdentifierForCurrentlyEditingField
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "focusGroupIdentifierForCurrentlyEditingField"));

  return (NSString *)v3;
}

- (BOOL)containsCurrentLocationItem
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  unsigned __int8 v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController items](self, "items", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "searchResult"));
        v7 = objc_msgSend(v6, "isDynamicCurrentLocation");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)selectFromField
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v2, "selectRowIndex:", 0);

}

- (void)selectToField
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypoints"));
  objc_msgSend(v5, "selectRowIndex:", (char *)objc_msgSend(v4, "count") - 1);

}

- (void)selectFieldAtIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v4, "selectRowIndex:", a3);

}

- (BOOL)canDeleteCurrentFieldIndex
{
  void *v3;
  id v4;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v4 = objc_msgSend(v3, "selectedIndex");

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v7 = objc_msgSend(v6, "canDeleteWaypointForCellAtIndex:", v4);

  return v7;
}

- (void)deleteCurrentFieldIndex
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v4 = objc_msgSend(v3, "selectedIndex");

  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
    objc_msgSend(v5, "performDeleteAtIndex:", v4);

  }
}

- (NSArray)items
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "waypoints"));

  return (NSArray *)v3;
}

- (void)setItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v5, "setWaypoints:", v4);

}

- (NSArray)itemsForRouteRequest
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController items](self, "items"));
  v3 = sub_10039DCD4(v2, &stru_1011E6E38);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSArray *)v4;
}

- (void)clear
{
  -[RoutePlanningWaypointEditorViewController setItems:](self, "setItems:", &__NSArray0__struct);
}

- (void)setMprEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v4, "setMprEnabled:", v3);

}

- (BOOL)mprEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = objc_msgSend(v2, "mprEnabled");

  return v3;
}

- (void)beginEditingNextSearchField
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v19;
  uint64_t v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v4 = objc_msgSend(v3, "selectedIndex");

  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypoints"));

    v7 = (char *)objc_msgSend(v6, "count");
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = v7 - 1;
      while (1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waypointName"));
        v13 = objc_msgSend(v12, "length");

        if (!v13)
          break;
        if (v8 == (char *)++v9)
        {
          v9 = (uint64_t)v10;
          break;
        }
      }
    }
    else
    {
      v9 = -1;
    }
    v16 = sub_100B67808();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v19 = 134217984;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Begin editing at index %lu", (uint8_t *)&v19, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
    objc_msgSend(v18, "selectRowIndex:", v9);

  }
  else
  {
    v14 = sub_100B67808();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Begin editing next field", (uint8_t *)&v19, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
    objc_msgSend(v6, "selectNextSearchField");
  }

}

- (void)endEditingFields
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100B67808();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "End all editing", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v5, "deselectAllRows");

}

- (void)updateSearchFieldsFromIndex:(unint64_t)a3 withItem:(id)a4
{
  char *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v6 = (char *)a4;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  a3 = (unint64_t)objc_msgSend(v7, "selectedIndex");

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v9 = objc_msgSend(v8, "addStop");

  if (!v9)
    goto LABEL_7;
  v10 = sub_100B67808();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Adding waypoint cell to accommodate new item", (uint8_t *)&v22, 2u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "waypoints"));
  a3 = (unint64_t)objc_msgSend(v13, "count") - 1;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    v14 = sub_1004318FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315650;
      v23 = "-[RoutePlanningWaypointEditorViewController updateSearchFieldsFromIndex:withItem:]";
      v24 = 2080;
      v25 = "RoutePlanningWaypointEditorViewController.m";
      v26 = 1024;
      v27 = 228;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v22, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v22 = 138412290;
        v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v22, 0xCu);

      }
    }
    v19 = sub_100B67808();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Didn't have a selected cell when applying item %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
LABEL_15:
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
    objc_msgSend(v21, "replaceWaypointAtIndex:withWaypoint:", a3, v6);

    v20 = objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
    -[NSObject routeSearchFieldsDidUpdateItemsForRouteRequest:](v20, "routeSearchFieldsDidUpdateItemsForRouteRequest:", self);
  }

}

- (BOOL)containsWaypointForItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v6 = v4,
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager")), v8 = objc_msgSend(v7, "isLocationServicesApproved"), v9 = objc_msgSend(v7, "isAuthorizedForPreciseLocation"), v10 = objc_msgSend(v6, "isDynamicCurrentLocation"), v6, v7, v10)&& (v8 & v9) == 0)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:expandRecentsItem:preserveContact:](SearchFieldItem, "searchFieldItemWithObject:expandRecentsItem:preserveContact:", v4, 1, 1));
    if (v12)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController items](self, "items", 0));
      v11 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v14 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(v12, "isEquivalentAsWaypointToSearchFieldItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i)) & 1) != 0)
            {
              LOBYTE(v11) = 1;
              goto LABEL_16;
            }
          }
          v11 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v11)
            continue;
          break;
        }
      }
LABEL_16:

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  return (char)v11;
}

- (BOOL)isEditingAnySearchField
{
  BOOL v3;
  void *v4;

  if (!self->_didInteractWithFields && sub_1002A8AA0(self) == 5)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = objc_msgSend(v4, "selectedIndex") != (id)0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (BOOL)hasInput
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellForIndex:", objc_msgSend(v4, "selectedIndex")));

  v6 = objc_opt_class(RoutePlanningWaypointCell);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentText"));
    v8 = objc_msgSend(v7, "length") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)contentHeight
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3;

  return v4;
}

- (unint64_t)_currentlySelectedIndexForAddStop
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v3 = objc_msgSend(v2, "selectedIndex");

  return (unint64_t)v3;
}

- (void)waypointListViewDidSelectAddStop:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = sub_100B67808();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did select Add Stop", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v6, "addStop");

  -[RoutePlanningWaypointEditorViewController _invalidateIntrinsicContentSize](self, "_invalidateIntrinsicContentSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 6097, 607, 0);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B67FB4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waypointListView:(id)a3 didStartEditingWaypointAtIndex:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;

  v5 = sub_100B67808();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 134217984;
    v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Did start editing waypoint at index %lu", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 277, 607, v9);

}

- (void)waypointListView:(id)a3 didMoveWaypoint:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;

  v9 = sub_100B67808();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v15 = 134218240;
    v16 = a5;
    v17 = 2048;
    v18 = a6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Did move waypoint from index %lu at %lu", (uint8_t *)&v15, 0x16u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
  objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 279, 607, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
  objc_msgSend(v14, "routeSearchFieldsDidUpdateItemsForRouteRequest:", self);

}

- (void)waypointListView:(id)a3 didDeleteWaypointAtIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;

  v6 = sub_100B67808();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v12 = 134217984;
    v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did delete waypoint at index %lu", (uint8_t *)&v12, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  objc_msgSend(v8, "captureUserAction:onTarget:eventValue:", 280, 607, v10);

  -[RoutePlanningWaypointEditorViewController _invalidateIntrinsicContentSize](self, "_invalidateIntrinsicContentSize");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
  objc_msgSend(v11, "routeSearchFieldsDidUpdateItemsForRouteRequest:", self);

}

- (void)waypointListView:(id)a3 didClearInputTextForWaypointAtIndex:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  unint64_t v12;

  v6 = sub_100B67808();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Did clear input text for field at index %lu", (uint8_t *)&v11, 0xCu);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "routeSearchFields:didClearInputTextForWaypointAtIndex:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
    objc_msgSend(v10, "routeSearchFields:didClearInputTextForWaypointAtIndex:", self, a4);

  }
}

- (void)waypointListView:(id)a3 didSelectCollapsedWaypoints:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v6 = a4;
  v7 = a3;
  v8 = sub_100B67808();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Did select collapsed waypoints", v14, 2u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v11 = objc_msgSend(v6, "count");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
  objc_msgSend(v10, "captureUserAction:onTarget:eventValue:", 31, 607, v13);

  objc_msgSend(v7, "expandStopsIfNeeded");
  -[RoutePlanningWaypointEditorViewController _invalidateIntrinsicContentSize](self, "_invalidateIntrinsicContentSize");
}

- (void)updateAutoCompleteWithText:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  objc_msgSend(v6, "routeSearch:didUpdateInputText:atIndex:", self, v4, objc_msgSend(v5, "selectedIndex"));

}

- (void)invokeSearchWithText:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  SearchFieldItem *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  char *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v4 = a3;
  if (sub_1002A8AA0(self) == 5)
  {
    v5 = sub_100B67808();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Invoking search by triggering route request", (uint8_t *)&v23, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
    objc_msgSend(v7, "deselectAllRows");

    v8 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
    -[SearchFieldItem routeSearchFieldsDidUpdateItemsForRouteRequest:](v8, "routeSearchFieldsDidUpdateItemsForRouteRequest:", self);
LABEL_20:

    goto LABEL_21;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController waypointListView](self, "waypointListView"));
  v10 = (const char *)objc_msgSend(v9, "selectedIndex");

  if (v10)
    v11 = (uint64_t)(v10 - 1);
  else
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController items](self, "items"));
  v13 = (const char *)objc_msgSend(v12, "count");

  if (v10 < v13)
  {
    v14 = sub_100B67808();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v23 = 134217984;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Invoking search for index %lu", (uint8_t *)&v23, 0xCu);
    }

    v8 = objc_alloc_init(SearchFieldItem);
    -[SearchFieldItem setSearchString:](v8, "setSearchString:", v4);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 0;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController items](self, "items"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndex:", v11));

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointEditorViewController delegate](self, "delegate"));
    objc_msgSend(v22, "routeSearch:didSearchForItem:previousSearchItem:", self, v8, v16);

    goto LABEL_20;
  }
  v17 = sub_1004318FC();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v23 = 136315650;
    v24 = "-[RoutePlanningWaypointEditorViewController invokeSearchWithText:]";
    v25 = 2080;
    v26 = "RoutePlanningWaypointEditorViewController.m";
    v27 = 1024;
    v28 = 358;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v23, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v19 = sub_1004318FC();
    v8 = (SearchFieldItem *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(&v8->super, OS_LOG_TYPE_ERROR))
    {
      v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v23 = 138412290;
      v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, &v8->super, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

    }
    goto LABEL_20;
  }
LABEL_21:

}

- (void)didInteractWithWaypointFields
{
  self->_didInteractWithFields = 1;
}

- (void)waypointListView:(id)a3 didReceiveItem:(id)a4
{
  -[RoutePlanningWaypointEditorViewController updateSearchFieldsFromIndex:withItem:](self, "updateSearchFieldsFromIndex:withItem:", 0x7FFFFFFFFFFFFFFFLL, a4);
}

- (RouteWaypointSearchFieldsDelegate)delegate
{
  return (RouteWaypointSearchFieldsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)pauseSelectionUpdates
{
  return self->_pauseSelectionUpdates;
}

- (void)setPauseSelectionUpdates:(BOOL)a3
{
  self->_pauseSelectionUpdates = a3;
}

- (int)currentListInteractionSession
{
  return self->_currentListInteractionSession;
}

- (id)intrinsicContentSizeInvalidationHandler
{
  return self->_intrinsicContentSizeInvalidationHandler;
}

- (void)setIntrinsicContentSizeInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (RoutePlanningWaypointListView)waypointListView
{
  return self->_waypointListView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointListView, 0);
  objc_storeStrong(&self->_intrinsicContentSizeInvalidationHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_waypointInfoProvider);
  objc_storeStrong((id *)&self->_layoutGuideConstraints, 0);
}

@end
