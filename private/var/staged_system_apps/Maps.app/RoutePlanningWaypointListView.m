@implementation RoutePlanningWaypointListView

- (RoutePlanningWaypointListView)initWithWaypoints:(id)a3 editingMode:(unint64_t)a4 delegate:(id)a5 waypointInfoProvider:(id)a6
{
  double y;
  double width;
  double height;
  RoutePlanningWaypointListView *v13;
  NSMutableArray *v14;
  NSMutableArray *waypoints;
  RoutePlanningWaypointTableView *v16;
  id *p_tableView;
  RoutePlanningWaypointTableView *tableView;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  _BOOL8 v24;
  uint64_t v25;
  double v26;
  void *v27;
  id *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  UILayoutGuide *v41;
  UILayoutGuide *layoutGuideForCurrentlyEditingField;
  unsigned int v43;
  double v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id location;
  objc_super v57;
  _QWORD v58[4];

  v52 = a3;
  obj = a5;
  v53 = a6;
  v57.receiver = self;
  v57.super_class = (Class)RoutePlanningWaypointListView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v13 = -[RoutePlanningWaypointListView initWithFrame:](&v57, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v13)
  {
    v14 = (NSMutableArray *)objc_msgSend(v52, "mutableCopy");
    waypoints = v13->_waypoints;
    v13->_waypoints = v14;

    v13->_editingMode = a4;
    objc_storeWeak((id *)&v13->_delegate, obj);
    objc_storeWeak((id *)&v13->_waypointInfoProvider, v53);
    v13->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_expandedStops = !-[RoutePlanningWaypointListView _supportsCollapsingStops](v13, "_supportsCollapsingStops");
    -[RoutePlanningWaypointListView setAccessibilityIdentifier:](v13, "setAccessibilityIdentifier:", CFSTR("RoutePlanningWaypointListView"));
    v16 = -[RoutePlanningWaypointTableView initWithFrame:style:]([RoutePlanningWaypointTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
    p_tableView = (id *)&v13->_tableView;
    tableView = v13->_tableView;
    v13->_tableView = v16;

    -[RoutePlanningWaypointTableView setTranslatesAutoresizingMaskIntoConstraints:](v13->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RoutePlanningWaypointTableView setDelegate:](v13->_tableView, "setDelegate:", v13);
    -[RoutePlanningWaypointTableView setDataSource:](v13->_tableView, "setDataSource:", v13);
    -[RoutePlanningWaypointTableView _setTopPadding:](v13->_tableView, "_setTopPadding:", 0.0);
    -[RoutePlanningWaypointTableView _setBottomPadding:](v13->_tableView, "_setBottomPadding:", 0.0);
    -[RoutePlanningWaypointTableView setSectionHeaderHeight:](v13->_tableView, "setSectionHeaderHeight:", 0.0);
    -[RoutePlanningWaypointTableView setSectionFooterHeight:](v13->_tableView, "setSectionFooterHeight:", 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[RoutePlanningWaypointTableView setBackgroundColor:](v13->_tableView, "setBackgroundColor:", v19);

    if (sub_1002A8AA0(v13) == 5)
      v20 = 8.0;
    else
      v20 = 16.0;
    if (sub_1002A8AA0(v13) == 5)
      v21 = 8.0;
    else
      v21 = 16.0;
    objc_msgSend(*p_tableView, "setDirectionalLayoutMargins:", 0.0, v20, 0.0, v21);
    objc_msgSend(*p_tableView, "setSeparatorStyle:", 1);
    v22 = sub_1002A8AA0(v13);
    v24 = a4 == 2 && v22 != 5;
    objc_msgSend(*p_tableView, "setScrollEnabled:", v24);
    objc_msgSend(*p_tableView, "setAlwaysBounceVertical:", 0);
    objc_msgSend(*p_tableView, "setDragInteractionEnabled:", a4 != 0);
    objc_msgSend(*p_tableView, "setAccessibilityIdentifier:", CFSTR("RoutePlanningWaypointListViewTableView"));
    v25 = sub_1002A8AA0(v13);
    v26 = 44.0;
    if (v25 == 5)
      v26 = 28.0;
    objc_msgSend(*p_tableView, "setEstimatedRowHeight:", v26);
    objc_msgSend(*p_tableView, "_setAllowsReorderingWhenNotEditing:", 1);
    if (sub_1002A8AA0(*p_tableView) == 5)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemFillColor](UIColor, "secondarySystemFillColor"));
      -[RoutePlanningWaypointTableView setSeparatorColor:](v13->_tableView, "setSeparatorColor:", v27);

    }
    v28 = (id *)&v13->_tableView;
    -[RoutePlanningWaypointListView addSubview:](v13, "addSubview:", v13->_tableView);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView leadingAnchor](v13->_tableView, "leadingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView leadingAnchor](v13, "leadingAnchor"));
    v29 = sub_1002A8AA0(v13);
    v30 = 0.0;
    if (v29 == 5)
      v30 = -8.0;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, v30));
    v58[0] = v48;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView trailingAnchor](v13, "trailingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v28, "trailingAnchor"));
    v31 = sub_1002A8AA0(v13);
    v32 = 0.0;
    if (v31 == 5)
      v32 = -8.0;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:constant:", v46, v32));
    v58[1] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v28, "topAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView topAnchor](v13, "topAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
    v58[2] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView bottomAnchor](v13, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v28, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));
    v58[3] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

    v41 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    layoutGuideForCurrentlyEditingField = v13->_layoutGuideForCurrentlyEditingField;
    v13->_layoutGuideForCurrentlyEditingField = v41;

    -[UILayoutGuide setIdentifier:](v13->_layoutGuideForCurrentlyEditingField, "setIdentifier:", CFSTR("RoutePlanning.CurrentlyEditingField"));
    -[RoutePlanningWaypointListView addLayoutGuide:](v13, "addLayoutGuide:", v13->_layoutGuideForCurrentlyEditingField);
    v43 = objc_msgSend(*v28, "isScrollEnabled");
    LODWORD(v44) = 1148846080;
    if (v43)
      *(float *)&v44 = 750.0;
    -[RoutePlanningWaypointListView setContentCompressionResistancePriority:forAxis:](v13, "setContentCompressionResistancePriority:forAxis:", 1, v44);
    -[RoutePlanningWaypointListView _reloadAllRows](v13, "_reloadAllRows");
    -[RoutePlanningWaypointListView _updateLayoutGuideForCurrentlyEditingField](v13, "_updateLayoutGuideForCurrentlyEditingField");
    objc_initWeak(&location, v13);
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100851E10;
    v54[3] = &unk_1011AD260;
    objc_copyWeak(&v55, &location);
    objc_msgSend(*v28, "setPostLayoutHandler:", v54);
    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (NSString)focusGroupIdentifierForCurrentlyEditingField
{
  return (NSString *)CFSTR("RoutePlanningWaypointFocusGroup");
}

- (void)_updateLayoutGuideForCurrentlyEditingField
{
  RoutePlanningWaypointTableView *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *layoutGuideConstraints;
  id v15;
  NSObject *v16;
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
  uint8_t buf[4];
  RoutePlanningWaypointTableView *v31;
  _QWORD v32[5];

  if (self->_layoutGuideConstraints)
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  v3 = self->_tableView;
  v4 = -[RoutePlanningWaypointListView selectedIndex](self, "selectedIndex");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView cellForIndex:](self, "cellForIndex:", v4));

    v3 = (RoutePlanningWaypointTableView *)v5;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView layoutGuideForCurrentlyEditingField](self, "layoutGuideForCurrentlyEditingField"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "widthAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView widthAnchor](self->_tableView, "widthAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
  v32[0] = v26;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView layoutGuideForCurrentlyEditingField](self, "layoutGuideForCurrentlyEditingField"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerXAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView centerXAnchor](self->_tableView, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
  v32[1] = v22;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView layoutGuideForCurrentlyEditingField](self, "layoutGuideForCurrentlyEditingField"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "heightAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView heightAnchor](v3, "heightAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v32[2] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView layoutGuideForCurrentlyEditingField](self, "layoutGuideForCurrentlyEditingField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView topAnchor](v3, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  v32[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointTableView bottomAnchor](v3, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView layoutGuideForCurrentlyEditingField](self, "layoutGuideForCurrentlyEditingField"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v32[4] = v12;
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 5));
  layoutGuideConstraints = self->_layoutGuideConstraints;
  self->_layoutGuideConstraints = v13;

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_layoutGuideConstraints);
  v15 = sub_10085218C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Updating layout guide to %@", buf, 0xCu);
  }

}

- (NSArray)waypoints
{
  void *v3;
  void *v4;
  SearchFieldItem *v5;
  SearchFieldItem *v6;
  id v7;
  SearchFieldItem *v8;
  NSMutableArray *v9;
  NSMutableArray *waypoints;

  if ((unint64_t)-[NSMutableArray count](self->_waypoints, "count") <= 1
    && (id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_waypoints, "firstObject"));
    v4 = v3;
    if (v3)
      v5 = v3;
    else
      v5 = objc_opt_new(SearchFieldItem);
    v6 = v5;

    v7 = objc_alloc((Class)NSMutableArray);
    v8 = objc_opt_new(SearchFieldItem);
    v9 = (NSMutableArray *)objc_msgSend(v7, "initWithObjects:", v6, v8, 0);
    waypoints = self->_waypoints;
    self->_waypoints = v9;

  }
  return (NSArray *)self->_waypoints;
}

- (void)setWaypoints:(id)a3
{
  id v4;
  SearchFieldItem *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  NSMutableArray *v14;
  NSMutableArray *waypoints;
  uint8_t v16[16];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "count") == (id)1
    && (id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)2)
  {
    v5 = objc_opt_new(SearchFieldItem);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrayByAddingObject:", v5));

    v7 = sub_10085218C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Inserted additional waypoint to ensure we have a minimum of two", buf, 2u);
    }

    v4 = (id)v6;
  }
  v9 = self->_waypoints;
  v10 = (unint64_t)v4;
  if (v10 | v9)
  {
    v11 = objc_msgSend((id)v9, "isEqual:", v10);

    if ((v11 & 1) == 0)
    {
      v12 = sub_10085218C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Updating waypoints...", v16, 2u);
      }

      v14 = (NSMutableArray *)objc_msgSend((id)v10, "mutableCopy");
      waypoints = self->_waypoints;
      self->_waypoints = v14;

      -[RoutePlanningWaypointListView _reloadAllRows](self, "_reloadAllRows");
    }
  }

}

- (unint64_t)userAddedWaypointCount
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView waypoints](self, "waypoints"));
  v3 = sub_10039E080(v2, &stru_1011D9168);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5;
}

- (void)refreshWaypointDisplay
{
  if (self->_waypoints)
    -[RoutePlanningWaypointListView _reloadAllRows](self, "_reloadAllRows");
}

- (void)_reloadAllRows
{
  NSMutableArray *v3;
  void *v4;
  const char *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  unint64_t UInteger;
  _BOOL4 v10;
  NSMutableArray *rows;
  uint64_t v12;
  unint64_t v13;
  RoutePlanningWaypointCell *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  RoutePlanningWaypointCell *v18;
  RoutePlanningWaypointCell *v19;
  void *v20;
  RoutePlanningWaypointCell *v21;
  RoutePlanningWaypointCell *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  id v26;
  RoutePlanningWaypointCell *v27;
  BOOL v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  RoutePlanningAddStopCell *v32;
  void *v33;
  id v34;
  _BOOL8 v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  unint64_t selectedIndex;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  char *v56;
  _QWORD v57[4];
  NSMutableArray *v58;
  RoutePlanningWaypointListView *v59;
  const char *v60;
  BOOL v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  void *v71;
  void *v72;
  void *v73;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView waypoints](self, "waypoints"));
  v5 = (const char *)objc_msgSend(v4, "count");
  v6 = sub_10085218C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134217984;
      v63 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Reloading all rows for %lu waypoints", buf, 0xCu);
    }

    -[RoutePlanningWaypointListView setHidden:](self, "setHidden:", 0);
    self->_hasCollapsedStops = 0;
    UInteger = GEOConfigGetUInteger(MapsConfig_MPRWaypointLimit, off_1014B4858);
    v10 = 0;
    if (-[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled"))
    {
      if (UInteger)
        v10 = -[RoutePlanningWaypointListView userAddedWaypointCount](self, "userAddedWaypointCount") < UInteger;
      else
        v10 = 1;
    }
    if (self->_expandedStops
      || !-[RoutePlanningWaypointListView _supportsCollapsingStops](self, "_supportsCollapsingStops"))
    {
      goto LABEL_18;
    }
    v12 = sub_1002A8AA0(self);
    v13 = 4;
    if (v12 == 5)
      v13 = 9;
    if ((unint64_t)v5 > v13 && -[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled"))
    {
      self->_hasCollapsedStops = 1;
      v14 = [RoutePlanningWaypointCell alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
      v73 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v73, 1));
      WeakRetained = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
      v18 = -[RoutePlanningWaypointCell initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:](v14, "initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:", v16, &off_10126F8F8, 0, self, WeakRetained, 0);
      -[NSMutableArray addObject:](v3, "addObject:", v18);

      v19 = [RoutePlanningWaypointCell alloc];
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 1, v5 - 2));
      v21 = -[RoutePlanningWaypointCell initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:](v19, "initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:", v20, 0, 0, self, 0, 1);
      -[NSMutableArray addObject:](v3, "addObject:", v21);

      v22 = [RoutePlanningWaypointCell alloc];
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
      v72 = v23;
      v24 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v4, "count") - 1));
      v26 = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
      v27 = -[RoutePlanningWaypointCell initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:](v22, "initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:", v24, v25, 0, self, v26, 2);
      -[NSMutableArray addObject:](v3, "addObject:", v27);

    }
    else
    {
LABEL_18:
      v28 = (id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)2;
      v29 = -[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled");
      v30 = 2;
      if ((unint64_t)v5 < 2)
        v30 = (uint64_t)v5;
      if (!v29)
        v5 = (const char *)v30;
      if ((unint64_t)v5 <= 1)
      {
        v51 = sub_1004318FC();
        v52 = objc_claimAutoreleasedReturnValue(v51);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waypointDisplayCount is %lu, should be >= 2"), 1));
          *(_DWORD *)buf = 136316162;
          v63 = "-[RoutePlanningWaypointListView _reloadAllRows]";
          v64 = 2080;
          v65 = "RoutePlanningWaypointListView.m";
          v66 = 1024;
          v67 = 267;
          v68 = 2080;
          v69 = "waypointDisplayCount >= 2";
          v70 = 2112;
          v71 = v53;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

        }
        if (sub_100A70734())
        {
          v54 = sub_1004318FC();
          v55 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            v56 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v63 = v56;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subarrayWithRange:", 0, v5));
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_100852C60;
      v57[3] = &unk_1011D9190;
      v61 = v28;
      v58 = v3;
      v59 = self;
      v60 = v5;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v57);
      v24 = v58;
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView _findLastEmptyWaypointCell:](self, "_findLastEmptyWaypointCell:", v3));
    objc_storeWeak((id *)&self->_lastEmptyWaypointCell, v31);

    if (v10)
    {
      v32 = objc_opt_new(RoutePlanningAddStopCell);
      -[NSMutableArray addObject:](v3, "addObject:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](v3, "lastObject"));
      objc_storeWeak((id *)&self->_addStopCell, v33);

      v34 = objc_loadWeakRetained((id *)&self->_addStopCell);
      objc_msgSend(v34, "setIconViewTag:", 10101);

      v35 = -[RoutePlanningWaypointListView _shouldEnableAddStopCell](self, "_shouldEnableAddStopCell");
      v36 = objc_loadWeakRetained((id *)&self->_addStopCell);
      objc_msgSend(v36, "setEnabled:", v35);

    }
    -[RoutePlanningWaypointTableView separatorInset](self->_tableView, "separatorInset");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v3, "firstObject"));
    objc_msgSend(v43, "preferredSeparatorInset");
    v45 = v44;

    -[RoutePlanningWaypointTableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", v38, v45, v40, v42);
    selectedIndex = self->_selectedIndex;
    if (selectedIndex == 0x7FFFFFFFFFFFFFFFLL
      || selectedIndex >= (unint64_t)-[NSMutableArray count](v3, "count")
      || ((v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v3, "objectAtIndexedSubscript:", self->_selectedIndex)), v48 = objc_opt_class(RoutePlanningWaypointCell), (objc_opt_isKindOfClass(v47, v48) & 1) == 0)? (v49 = 0): (v49 = v47), v50 = v49, v47, !v50))
    {
      v47 = 0;
      self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
    objc_storeStrong((id *)&self->_rows, v3);
    -[RoutePlanningWaypointListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[RoutePlanningWaypointTableView reloadData](self->_tableView, "reloadData");
    -[RoutePlanningWaypointListView _restoreCurrentlySelectedEditingIfNeeded:](self, "_restoreCurrentlySelectedEditingIfNeeded:", v47);

  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "No waypoints, clear list", buf, 2u);
    }

    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_activelyEditingSelectedField = 0;
    rows = self->_rows;
    self->_rows = 0;

    objc_storeWeak((id *)&self->_addStopCell, 0);
    self->_hasCollapsedStops = 0;
    -[RoutePlanningWaypointListView setHidden:](self, "setHidden:", 1);
    -[RoutePlanningWaypointListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[RoutePlanningWaypointTableView reloadData](self->_tableView, "reloadData");
    -[RoutePlanningWaypointListView _layoutDottedLines](self, "_layoutDottedLines");
    -[RoutePlanningWaypointListView _updateLayoutGuideForCurrentlyEditingField](self, "_updateLayoutGuideForCurrentlyEditingField");
  }

}

- (BOOL)replaceWaypointAtIndex:(unint64_t)a3 withWaypoint:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  RoutePlanningWaypointCell *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  RoutePlanningWaypointCell *v19;
  RoutePlanningWaypointTableView *tableView;
  void *v21;
  void *v22;
  _BOOL4 v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unint64_t v28;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView cellForIndex:](self, "cellForIndex:", a3));
  v8 = objc_opt_class(RoutePlanningWaypointCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = 0;
  if ((id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)2 && v10)
  {
    if (objc_msgSend(v10, "isEditable"))
    {
      v12 = sub_10085218C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v28 = a3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Will replace waypoint at index %lu", buf, 0xCu);
      }

      v24 = (id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)2;
      v14 = [RoutePlanningWaypointCell alloc];
      v26 = v6;
      v11 = 1;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_waypointInfoProvider);
      v19 = -[RoutePlanningWaypointCell initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:](v14, "initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:", v15, v16, v24, v17, WeakRetained, a3);

      objc_msgSend(v10, "prepareForReplacement");
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_rows, "replaceObjectAtIndex:withObject:", a3, v19);
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_waypoints, "replaceObjectAtIndex:withObject:", a3, v6);
      tableView = self->_tableView;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, 0));
      v25 = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
      -[RoutePlanningWaypointTableView reloadRowsAtIndexPaths:withRowAnimation:](tableView, "reloadRowsAtIndexPaths:withRowAnimation:", v22, 5);

      -[RoutePlanningWaypointListView _refreshAddStopCellEnabled](self, "_refreshAddStopCellEnabled");
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)setMprEnabled:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;

  if (self->_mprEnabled != a3)
  {
    v3 = a3;
    v5 = sub_10085218C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = CFSTR("NO");
      if (v3)
        v7 = CFSTR("YES");
      v8 = v7;
      v9 = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Toggling MPR enabled -> %{public}@", (uint8_t *)&v9, 0xCu);

    }
    self->_mprEnabled = v3;
    -[RoutePlanningWaypointListView _reloadAllRows](self, "_reloadAllRows");
  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[RoutePlanningWaypointListView _contentHeight](self, "_contentHeight");
  v4 = v3;
  if (-[RoutePlanningWaypointTableView isScrollEnabled](self->_tableView, "isScrollEnabled")
    && sub_1002A8AA0(self) != 5)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView traitCollection](self, "traitCollection"));
    if (objc_msgSend(v5, "verticalSizeClass") == (id)1)
      v6 = 2;
    else
      v6 = 3;

    WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
    if (WeakRetained)
      v8 = v6 + 1;
    else
      v8 = v6;
    v9 = (double)v8;
    -[RoutePlanningWaypointTableView rowHeight](self->_tableView, "rowHeight");
    if (v4 >= v10 * v9)
    {
      -[RoutePlanningWaypointTableView rowHeight](self->_tableView, "rowHeight");
      v4 = v11 * v9;
    }
  }
  v12 = UIViewNoIntrinsicMetric;
  v13 = v4;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)_rowHeight
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;

  if (sub_1002A8AA0(self) == 5)
  {
    if (sub_1002A8AA0(self) == 5)
      return 28.0;
    else
      return 44.0;
  }
  else
  {
    if (qword_1014D3638 != -1)
      dispatch_once(&qword_1014D3638, &stru_1011D91B0);
    v4 = (void *)qword_1014D3630;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView traitCollection](self, "traitCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_traitCollectionWithMaximumContentSizeCategory:", UIContentSizeCategoryAccessibilityLarge));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", v6));

    objc_msgSend(v7, "_mapkit_lineHeight");
    v9 = v8 + 22.0;
    v10 = sub_1002A8AA0(self);
    v11 = 44.0;
    if (v10 == 5)
      v11 = 28.0;
    if (v9 <= v11)
    {
      if (sub_1002A8AA0(self) == 5)
        v3 = 28.0;
      else
        v3 = 44.0;
    }
    else
    {
      objc_msgSend(v7, "_mapkit_lineHeight");
      v3 = v12 + 22.0;
    }

  }
  return v3;
}

- (double)_contentHeight
{
  double v3;

  -[RoutePlanningWaypointListView _rowHeight](self, "_rowHeight");
  return v3 * (double)(unint64_t)-[NSMutableArray count](self->_rows, "count");
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)selectRowIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView waypoints](self, "waypoints"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    if (!-[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled"))
      return;
    v13 = sub_10085218C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Selected Add Stop index, will add stop", (uint8_t *)&v23, 2u);
    }

    v12 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    objc_msgSend(v12, "waypointListViewDidSelectAddStop:", self);
  }
  else
  {
    v7 = sub_10085218C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v23 = 134217984;
      v24 = (const char *)a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Selecting row at index %lu", (uint8_t *)&v23, 0xCu);
    }

    self->_activelyEditingSelectedField = 0;
    self->_selectedIndex = a3;
    if ((unint64_t)-[NSMutableArray count](self->_rows, "count") <= a3)
    {
      v12 = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3));
      v10 = objc_opt_class(RoutePlanningWaypointCell);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
        v11 = v9;
      else
        v11 = 0;
      v12 = v11;

    }
    v15 = objc_opt_class(RoutePlanningWaypointCell);
    if ((objc_opt_isKindOfClass(v12, v15) & 1) == 0)
    {
      v17 = sub_1004318FC();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can only select waypoint cells")));
        v23 = 136316162;
        v24 = "-[RoutePlanningWaypointListView selectRowIndex:]";
        v25 = 2080;
        v26 = "RoutePlanningWaypointListView.m";
        v27 = 1024;
        v28 = 396;
        v29 = 2080;
        v30 = "[cell isKindOfClass:[RoutePlanningWaypointCell class]]";
        v31 = 2112;
        v32 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v23, 0x30u);

      }
      if (sub_100A70734())
      {
        v20 = sub_1004318FC();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v23 = 138412290;
          v24 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

        }
      }
    }
    if (v12)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
      -[RoutePlanningWaypointListView scrollWaypointCellToVisible:animated:](self, "scrollWaypointCellToVisible:animated:", v12, v16 != 0);

      objc_msgSend(v12, "beginEditing");
    }
  }

}

- (void)selectNextSearchField
{
  unint64_t v3;
  unint64_t v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v3 = -[RoutePlanningWaypointListView selectedIndex](self, "selectedIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (v4 = v3 + 1, v3 + 1 > -[RoutePlanningWaypointListView indexForLastWaypointCell](self, "indexForLastWaypointCell")))
  {
    v5 = sub_10085218C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Found no next field to select, will deselect all", v9, 2u);
    }

    -[RoutePlanningWaypointListView deselectAllRows](self, "deselectAllRows");
  }
  else
  {
    v7 = sub_10085218C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Select next search field", buf, 2u);
    }

    -[RoutePlanningWaypointListView selectRowIndex:](self, "selectRowIndex:", v4);
  }
}

- (void)_restoreCurrentlySelectedEditingIfNeeded:(id)a3
{
  id v4;
  unint64_t selectedIndex;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  NSObject *v23;
  char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;

  v4 = a3;
  selectedIndex = self->_selectedIndex;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (selectedIndex < (unint64_t)-[NSMutableArray count](self->_rows, "count")
      && ((v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", selectedIndex)), v7 = objc_opt_class(RoutePlanningWaypointCell), (objc_opt_isKindOfClass(v6, v7) & 1) == 0)? (v8 = 0): (v8 = v6), v9 = v8, v6, v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypoints"));
      v11 = objc_msgSend(v10, "count");

      if ((unint64_t)v11 < 2)
      {
        v15 = sub_10085218C();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v25 = 134217984;
          v26 = (const char *)selectedIndex;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Restoring editing for currently selected row at index %lu", (uint8_t *)&v25, 0xCu);
        }

        v17 = objc_opt_class(RoutePlanningWaypointCell);
        if ((objc_opt_isKindOfClass(v9, v17) & 1) == 0)
        {
          v19 = sub_1004318FC();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Can only select waypoint cells")));
            v25 = 136316162;
            v26 = "-[RoutePlanningWaypointListView _restoreCurrentlySelectedEditingIfNeeded:]";
            v27 = 2080;
            v28 = "RoutePlanningWaypointListView.m";
            v29 = 1024;
            v30 = 432;
            v31 = 2080;
            v32 = "[cell isKindOfClass:[RoutePlanningWaypointCell class]]";
            v33 = 2112;
            v34 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v25, 0x30u);

          }
          if (sub_100A70734())
          {
            v22 = sub_1004318FC();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              v25 = 138412290;
              v26 = v24;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

            }
          }
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
        -[RoutePlanningWaypointListView scrollWaypointCellToVisible:animated:](self, "scrollWaypointCellToVisible:animated:", v9, v18 != 0);

        objc_msgSend(v9, "beginEditing");
        goto LABEL_13;
      }
      v12 = "cell at index has collapsed waypoints";
    }
    else
    {
      v6 = 0;
      v12 = "cell is nil";
    }
    v13 = sub_10085218C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v25 = 136446210;
      v26 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Clearing previous selection/editing and forcing no autocomplete: %{public}s", (uint8_t *)&v25, 0xCu);
    }

    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_activelyEditingSelectedField = 0;
    -[RoutePlanningWaypointListView cellDidStopEditing:](self, "cellDidStopEditing:", v4);
LABEL_13:

  }
}

- (void)deselectAllRows
{
  id v3;
  NSObject *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];

  v3 = sub_10085218C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Deselect all rows", buf, 2u);
  }

  self->_activelyEditingSelectedField = 0;
  self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_rows;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(RoutePlanningWaypointCell);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          objc_msgSend(v10, "endEditing", (_QWORD)v12);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v7);
  }

}

- (void)scrollWaypointCellToVisible:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  RoutePlanningWaypointTableView *tableView;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;

  v4 = a4;
  v6 = a3;
  v7 = -[NSMutableArray indexOfObject:](self->_rows, "indexOfObject:", v6);
  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    v9 = sub_10085218C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = 134218242;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Scrolling to frame cell at index %lu: %@", (uint8_t *)&v13, 0x16u);
    }

    tableView = self->_tableView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, 0));
    -[RoutePlanningWaypointTableView scrollToRowAtIndexPath:atScrollPosition:animated:](tableView, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 1, v4);

  }
}

- (unint64_t)searchFieldIndexForWaypoints:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  char *v15;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  if (v4)
  {
    if (-[NSMutableArray count](self->_rows, "count"))
    {
      v5 = 0;
      while (1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v5));
        v7 = objc_opt_class(RoutePlanningWaypointCell);
        v8 = (objc_opt_isKindOfClass(v6, v7) & 1) != 0
           ? (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", v5))
           : 0;

        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoints"));
        if (v9 == v4)
          break;
        if (++v5 >= (unint64_t)-[NSMutableArray count](self->_rows, "count"))
          goto LABEL_9;
      }
    }
    else
    {
LABEL_9:
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The waypoints (%@) should be in the list (%@)"), v4, self->_waypoints));
        *(_DWORD *)buf = 136315906;
        v18 = "-[RoutePlanningWaypointListView searchFieldIndexForWaypoints:]";
        v19 = 2080;
        v20 = "RoutePlanningWaypointListView.m";
        v21 = 1024;
        v22 = 469;
        v23 = 2112;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (sub_100A70734())
      {
        v13 = sub_1004318FC();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v18 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v5 = 0;
    }
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (unint64_t)indexForLastWaypointCell
{
  return (unint64_t)-[NSMutableArray indexOfObjectWithOptions:passingTest:](self->_rows, "indexOfObjectWithOptions:passingTest:", 2, &stru_1011D91F0);
}

- (id)cellForIndex:(unint64_t)a3
{
  void *v5;

  if ((unint64_t)-[NSMutableArray count](self->_rows, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3));
  return v5;
}

- (unint64_t)numberOfRows
{
  return (unint64_t)-[NSMutableArray count](self->_rows, "count");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningWaypointListView;
  v4 = a3;
  -[RoutePlanningWaypointListView traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  if (v6 != v7)
    -[RoutePlanningWaypointListView _reloadAllRows](self, "_reloadAllRows");
}

- (void)_layoutDottedLines
{
  char *v3;
  NSMutableArray *i;
  uint64_t v5;
  TransitDirectionsColoredLine *v6;
  void *v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *dottedLines;
  NSMutableArray *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if ((-[RoutePlanningWaypointTableView hasUncommittedUpdates](self->_tableView, "hasUncommittedUpdates") & 1) == 0)
  {
    if (-[NSMutableArray count](self->_rows, "count"))
      v3 = (char *)-[NSMutableArray count](self->_rows, "count") - 1;
    else
      v3 = 0;
    if (v3 != -[NSMutableArray count](self->_dottedLines, "count"))
    {
      for (i = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3);
            v3;
            --v3)
      {
        v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_dottedLines, "lastObject"));
        if (v5)
        {
          v6 = (TransitDirectionsColoredLine *)v5;
          -[NSMutableArray removeLastObject](self->_dottedLines, "removeLastObject");
        }
        else
        {
          v6 = -[TransitDirectionsColoredLine initWithStyle:]([TransitDirectionsColoredLine alloc], "initWithStyle:", 3);
          -[TransitDirectionsColoredLine setAutoresizingMask:](v6, "setAutoresizingMask:", 16);
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
          -[TransitDirectionsColoredLine setLineColor:](v6, "setLineColor:", v7);

          -[RoutePlanningWaypointTableView addSubview:](self->_tableView, "addSubview:", v6);
        }
        -[NSMutableArray addObject:](i, "addObject:", v6);
        -[RoutePlanningWaypointTableView sendSubviewToBack:](self->_tableView, "sendSubviewToBack:", v6);

      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = self->_dottedLines;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12), "removeFromSuperview");
            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      dottedLines = self->_dottedLines;
      self->_dottedLines = i;

    }
    v14 = self->_dottedLines;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100854408;
    v15[3] = &unk_1011D9218;
    v15[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v14, "enumerateObjectsUsingBlock:", v15);
  }
}

- (void)_layoutDottedLineForCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  RoutePlanningWaypointTableView *tableView;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  RoutePlanningWaypointTableView *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  double v50;
  double MaxY;
  double MinY;
  CGFloat v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v63;
  NSObject *v64;
  id v65;
  NSObject *v66;
  char *v67;
  CGFloat rect;
  CGFloat v69;
  CGFloat v70;
  _QWORD v71[4];
  id v72;
  double v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  const char *v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableArray count](self->_dottedLines, "count");
  if (v8 != (char *)-[NSMutableArray count](self->_rows, "count") - 1)
  {
    v63 = sub_1004318FC();
    v64 = objc_claimAutoreleasedReturnValue(v63);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v78 = "-[RoutePlanningWaypointListView _layoutDottedLineForCell:atIndexPath:]";
      v79 = 2080;
      v80 = "RoutePlanningWaypointListView.m";
      v81 = 1024;
      v82 = 550;
      v83 = 2080;
      v84 = "_dottedLines.count == _rows.count - 1";
      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v65 = sub_1004318FC();
      v66 = objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        v67 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v78 = v67;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v9 = (char *)objc_msgSend(v7, "row");
  if (-[NSMutableArray count](self->_rows, "count") != v9 + 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:"));
    objc_msgSend(v6, "layoutIfNeeded");
    objc_msgSend(v10, "layoutIfNeeded");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewWithTag:", 10101));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "viewWithTag:", 10101));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));

      if (v15)
      {
        tableView = self->_tableView;
        objc_msgSend(v11, "frame");
        v18 = v17;
        v20 = v19;
        v22 = v21;
        v24 = v23;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
        -[RoutePlanningWaypointTableView convertRect:fromView:](tableView, "convertRect:fromView:", v25, v18, v20, v22, v24);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;

        v34 = self->_tableView;
        objc_msgSend(v12, "frame");
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superview"));
        -[RoutePlanningWaypointTableView convertRect:fromView:](v34, "convertRect:fromView:", v43, v36, v38, v40, v42);
        v69 = v45;
        v70 = v44;
        rect = v46;
        v48 = v47;

        if (sub_1002A8AA0(v6) == 5)
          v49 = 2.0;
        else
          v49 = 3.0;
        v85.origin.x = v27;
        v85.origin.y = v29;
        v85.size.width = v31;
        v85.size.height = v33;
        v50 = CGRectGetMidX(v85) + v49 * -0.5;
        v86.origin.x = v27;
        v86.origin.y = v29;
        v86.size.width = v31;
        v86.size.height = v33;
        MaxY = CGRectGetMaxY(v86);
        v87.origin.y = v69;
        v87.origin.x = v70;
        v87.size.width = rect;
        v87.size.height = v48;
        MinY = CGRectGetMinY(v87);
        v88.origin.x = v27;
        v88.origin.y = v29;
        v88.size.width = v31;
        v88.size.height = v33;
        v53 = CGRectGetMaxY(v88);
        v54 = UIRectRoundToViewScale(v6, v50, MaxY, v49, MinY - v53);
        v56 = v55;
        v58 = v57;
        v60 = v59;
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_dottedLines, "objectAtIndexedSubscript:", v9));
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_100854914;
        v71[3] = &unk_1011AFFE8;
        v72 = v61;
        v73 = v54;
        v74 = v56;
        v75 = v58;
        v76 = v60;
        v62 = v61;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v71);

      }
    }

  }
}

- (BOOL)addStop
{
  unsigned __int8 v3;
  id v4;
  NSObject *WeakRetained;
  _BOOL4 v6;
  SearchFieldItem *v7;
  _BOOL8 v8;
  RoutePlanningWaypointCell *v9;
  BOOL v10;
  void *v11;
  RoutePlanningWaypointCell *v12;
  char *v13;
  RoutePlanningWaypointTableView *tableView;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  uint8_t v20[8];
  void *v21;
  SearchFieldItem *v22;

  if ((id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") != (id)2)
  {
    v17 = sub_10085218C();
    WeakRetained = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v20 = 0;
      v18 = "Will not add stop, incorrect editing mode";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEBUG, v18, v20, 2u);
    }
LABEL_11:
    v10 = 0;
    goto LABEL_12;
  }
  v3 = -[RoutePlanningWaypointListView _shouldEnableAddStopCell](self, "_shouldEnableAddStopCell");
  v4 = sub_10085218C();
  WeakRetained = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG);
  if ((v3 & 1) == 0)
  {
    if (v6)
    {
      *(_WORD *)v20 = 0;
      v18 = "Will not add stop, row should not be enabled";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (v6)
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, WeakRetained, OS_LOG_TYPE_DEBUG, "Will add stop", v20, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
  v7 = objc_alloc_init(SearchFieldItem);
  v8 = (id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)2;
  v9 = [RoutePlanningWaypointCell alloc];
  v22 = v7;
  v10 = 1;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
  v12 = -[RoutePlanningWaypointCell initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:](v9, "initWithWaypoints:waypointIndex:editable:delegate:waypointInfoProvider:cellIndex:", v11, 0, v8, self, 0, -[NSMutableArray count](self->_rows, "count"));

  v13 = (char *)-[NSMutableArray count](self->_rows, "count") - (WeakRetained != 0);
  -[NSMutableArray insertObject:atIndex:](self->_rows, "insertObject:atIndex:", v12, v13);
  -[NSMutableArray insertObject:atIndex:](self->_waypoints, "insertObject:atIndex:", v7, v13);
  tableView = self->_tableView;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v13, 0));
  v21 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  -[RoutePlanningWaypointTableView insertRowsAtIndexPaths:withRowAnimation:](tableView, "insertRowsAtIndexPaths:withRowAnimation:", v16, 100);

  -[RoutePlanningWaypointListView _refreshAddStopCellEnabled](self, "_refreshAddStopCellEnabled");
  -[RoutePlanningWaypointListView _layoutDottedLines](self, "_layoutDottedLines");
  -[RoutePlanningWaypointListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

LABEL_12:
  return v10;
}

- (BOOL)_shouldEnableAddStopCell
{
  id WeakRetained;
  _BOOL4 v4;
  unint64_t UInteger;

  WeakRetained = objc_loadWeakRetained((id *)&self->_lastEmptyWaypointCell);

  if (WeakRetained)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    UInteger = GEOConfigGetUInteger(MapsConfig_MPRWaypointLimit, off_1014B4858);
    v4 = -[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled");
    if (v4)
    {
      if (UInteger)
        LOBYTE(v4) = -[RoutePlanningWaypointListView userAddedWaypointCount](self, "userAddedWaypointCount") < UInteger;
      else
        LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (id)_findLastEmptyWaypointCell:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_100854D00;
  v11 = sub_100854D10;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100854D18;
  v6[3] = &unk_1011D9240;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_refreshAddStopCellEnabled
{
  void *v3;
  _BOOL8 v4;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView _findLastEmptyWaypointCell:](self, "_findLastEmptyWaypointCell:", self->_rows));
  objc_storeWeak((id *)&self->_lastEmptyWaypointCell, v3);

  v4 = -[RoutePlanningWaypointListView _shouldEnableAddStopCell](self, "_shouldEnableAddStopCell");
  WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
  objc_msgSend(WeakRetained, "setEnabled:", v4);

}

- (BOOL)hasExpandedStops
{
  return self->_expandedStops;
}

- (void)expandStopsIfNeeded
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (!self->_expandedStops)
  {
    v3 = sub_10085218C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will now show all stops", buf, 2u);
    }

    self->_expandedStops = 1;
    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    if (self->_hasCollapsedStops)
    {
      v5 = sub_10085218C();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Reloading rows because we had collapsed stops", v7, 2u);
      }

      -[RoutePlanningWaypointListView _reloadAllRows](self, "_reloadAllRows");
    }
  }
}

- (void)collapseStopsIfNeeded
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (-[RoutePlanningWaypointListView _supportsCollapsingStops](self, "_supportsCollapsingStops")
    && self->_expandedStops)
  {
    self->_expandedStops = 0;
    self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    v3 = sub_10085218C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will now show reduced/collapsed stops", buf, 2u);
    }

    v5 = -[NSMutableArray count](self->_waypoints, "count");
    v6 = sub_1002A8AA0(self);
    v7 = 4;
    if (v6 == 5)
      v7 = 9;
    if ((unint64_t)v5 > v7)
    {
      v8 = sub_10085218C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Reloading because we have enough stops that we should collapse them", v10, 2u);
      }

      -[RoutePlanningWaypointListView _reloadAllRows](self, "_reloadAllRows");
    }
  }
}

- (BOOL)_supportsCollapsingStops
{
  if (-[RoutePlanningWaypointListView editingMode](self, "editingMode") < 2)
    return 1;
  if (sub_1002A8AA0(self) == 5)
    return GEOConfigGetBOOL(MapsConfig_RoutePlanningEnableWaypointCollapseOnMac, off_1014B4AE8);
  return 0;
}

- (void)cellDidStartEditing:(id)a3 withUserInteraction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  unint64_t selectedIndex;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  unint64_t v21;

  v4 = a4;
  v6 = a3;
  self->_selectedIndex = (unint64_t)-[NSMutableArray indexOfObject:](self->_rows, "indexOfObject:", v6);
  v7 = sub_10085218C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    selectedIndex = self->_selectedIndex;
    v20 = 134217984;
    v21 = selectedIndex;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Did start editing field at index %lu", (uint8_t *)&v20, 0xCu);
  }

  -[RoutePlanningWaypointListView _updateLayoutGuideForCurrentlyEditingField](self, "_updateLayoutGuideForCurrentlyEditingField");
  if (self->_activelyEditingSelectedField == v4)
  {
    -[RoutePlanningWaypointListView scrollWaypointCellToVisible:animated:](self, "scrollWaypointCellToVisible:animated:", v6, 1);
    if (!v4)
      goto LABEL_15;
  }
  else
  {
    self->_activelyEditingSelectedField = v4;
    if (!v4)
    {
      -[RoutePlanningWaypointListView scrollWaypointCellToVisible:animated:](self, "scrollWaypointCellToVisible:animated:", v6, 1);
      goto LABEL_15;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "waypointListView:didStartEditingWaypointAtIndex:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      objc_msgSend(v12, "waypointListView:didStartEditingWaypointAtIndex:", self, self->_selectedIndex);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v14 = objc_opt_respondsToSelector(v13, "didInteractWithWaypointFields");

    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      objc_msgSend(v15, "didInteractWithWaypointFields");

    }
    -[RoutePlanningWaypointListView scrollWaypointCellToVisible:animated:](self, "scrollWaypointCellToVisible:animated:", v6, 1);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
  v17 = objc_opt_respondsToSelector(v16, "updateAutoCompleteWithText:");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentText"));
    objc_msgSend(v18, "updateAutoCompleteWithText:", v19);

  }
LABEL_15:

}

- (void)cellDidStopEditing:(id)a3
{
  _BOOL8 v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  unint64_t selectedIndex;
  void *v11;
  int v12;
  unint64_t v13;

  v4 = -[RoutePlanningWaypointListView _shouldEnableAddStopCell](self, "_shouldEnableAddStopCell", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_addStopCell);
  objc_msgSend(WeakRetained, "setEnabled:", v4);

  if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "updateAutoCompleteWithText:");

    if ((v7 & 1) != 0)
    {
      v8 = sub_10085218C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        selectedIndex = self->_selectedIndex;
        v12 = 134217984;
        v13 = selectedIndex;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Did stop editing field at index %lu", (uint8_t *)&v12, 0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      objc_msgSend(v11, "updateAutoCompleteWithText:", 0);

    }
  }
}

- (void)cell:(id)a3 didChangeInputText:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lastEmptyWaypointCell);
  if (WeakRetained == v16 && objc_msgSend(v6, "length"))
  {

LABEL_7:
    -[RoutePlanningWaypointListView _refreshAddStopCellEnabled](self, "_refreshAddStopCellEnabled");
    goto LABEL_9;
  }
  v8 = objc_loadWeakRetained((id *)&self->_lastEmptyWaypointCell);
  if (v8 == v16)
  {

    goto LABEL_9;
  }
  v9 = objc_msgSend(v6, "length");

  if (!v9)
    goto LABEL_7;
LABEL_9:
  if (!self->_activelyEditingSelectedField)
  {
    self->_activelyEditingSelectedField = 1;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v11 = objc_opt_respondsToSelector(v10, "didInteractWithWaypointFields");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      objc_msgSend(v12, "didInteractWithWaypointFields");

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
  v14 = objc_opt_respondsToSelector(v13, "updateAutoCompleteWithText:");

  if ((v14 & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    objc_msgSend(v15, "updateAutoCompleteWithText:", v6);

  }
}

- (void)cell:(id)a3 didReceiveMapItem:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  SearchResult *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  if (!self->_activelyEditingSelectedField)
  {
    self->_activelyEditingSelectedField = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "didInteractWithWaypointFields");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      objc_msgSend(v9, "didInteractWithWaypointFields");

    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "waypointListView:didReceiveItem:");

  if ((v11 & 1) != 0)
  {
    v12 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    objc_msgSend(v14, "waypointListView:didReceiveItem:", self, v13);

  }
}

- (void)cellDidRequestSearch:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "invokeSearchWithText:");

  if ((v6 & 1) != 0)
  {
    v7 = sub_10085218C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will request search", v14, 2u);
    }

    if (!self->_activelyEditingSelectedField)
    {
      self->_activelyEditingSelectedField = 1;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      v10 = objc_opt_respondsToSelector(v9, "didInteractWithWaypointFields");

      if ((v10 & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
        objc_msgSend(v11, "didInteractWithWaypointFields");

      }
    }
    self->_selectedIndex = (unint64_t)-[NSMutableArray indexOfObject:](self->_rows, "indexOfObject:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentText"));
    objc_msgSend(v12, "invokeSearchWithText:", v13);

  }
}

- (void)cellDidClearInputText:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = sub_10085218C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Did clear input text", v10, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "waypointListView:didClearInputTextForWaypointAtIndex:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    objc_msgSend(v9, "waypointListView:didClearInputTextForWaypointAtIndex:", self, -[NSMutableArray indexOfObject:](self->_rows, "indexOfObject:", v4));

  }
}

- (id)contextMenuForCell:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14[2];
  id location;
  void *v16;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_rows, "indexOfObject:", v4);
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL
    || (v6 = v5,
        !-[RoutePlanningWaypointListView canDeleteWaypointForCellAtIndex:](self, "canDeleteWaypointForCellAtIndex:", v5)))
  {
    v11 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning] Delete"), CFSTR("localized string not found"), 0));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100855AD8;
    v13[3] = &unk_1011B8278;
    objc_copyWeak(v14, &location);
    v14[1] = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, 0, 0, v13));

    v16 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v10));

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return (int64_t)-[NSMutableArray count](self->_rows, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
  v7 = objc_opt_class(RoutePlanningWaypointCell);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypoints"));
    if ((unint64_t)objc_msgSend(v10, "count") <= 1)
    {

    }
    else
    {
      v11 = -[RoutePlanningWaypointListView _supportsCollapsingStops](self, "_supportsCollapsingStops");

      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
  }
  if ((id)-[RoutePlanningWaypointListView editingMode](self, "editingMode") == (id)1)
  {
LABEL_10:
    v12 = 1;
    goto LABEL_18;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));
  v14 = objc_opt_class(RoutePlanningAddStopCell);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
    v12 = objc_msgSend(v16, "isEnabled");
  else
    v12 = 0;

LABEL_18:
  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  id v32;
  NSObject *v33;
  id v34;
  char *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  char *v40;
  id v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  char *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  char *v50;
  int v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
  v8 = objc_opt_class(RoutePlanningWaypointCell);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypoints"));
    if ((unint64_t)objc_msgSend(v9, "count") >= 2
      && -[RoutePlanningWaypointListView _supportsCollapsingStops](self, "_supportsCollapsingStops"))
    {
      v10 = sub_10085218C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v51) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Did select collapsed stops", (uint8_t *)&v51, 2u);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      v13 = objc_opt_respondsToSelector(v12, "waypointListView:didSelectCollapsedWaypoints:");

      if ((v13 & 1) == 0)
      {
        v27 = sub_1004318FC();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v51 = 136315906;
          v52 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
          v53 = 2080;
          v54 = "RoutePlanningWaypointListView.m";
          v55 = 1024;
          v56 = 855;
          v57 = 2080;
          v58 = "[self.delegate respondsToSelector:@selector(waypointListView:didSelectCollapsedWaypoints:)]";
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v51, 0x26u);
        }

        if (sub_100A70734())
        {
          v29 = sub_1004318FC();
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v51 = 138412290;
            v52 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v51, 0xCu);

          }
        }
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      objc_msgSend(v14, "waypointListView:didSelectCollapsedWaypoints:", self, v9);
LABEL_23:

LABEL_29:
      goto LABEL_30;
    }
    if (-[RoutePlanningWaypointListView editingMode](self, "editingMode") <= 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      v16 = objc_opt_respondsToSelector(v15, "waypointListView:didSelectWaypoint:atIndex:");

      if ((v16 & 1) != 0)
      {
        v17 = objc_msgSend(v6, "row");
        v18 = (unint64_t)v17;
        if (self->_hasCollapsedStops && v17 == (id)1)
        {
          v32 = sub_1004318FC();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            v51 = 136315906;
            v52 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
            v53 = 2080;
            v54 = "RoutePlanningWaypointListView.m";
            v55 = 1024;
            v56 = 862;
            v57 = 2080;
            v58 = "!_hasCollapsedStops || adjustedIndex != 1";
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v51, 0x26u);
          }

          if (!sub_100A70734())
          {
            v18 = 1;
            goto LABEL_20;
          }
          v34 = sub_1004318FC();
          v19 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v51 = 138412290;
            v52 = v35;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v51, 0xCu);

          }
          v18 = 1;
        }
        else
        {
          if (!self->_hasCollapsedStops || (unint64_t)v17 < 2)
            goto LABEL_20;
          if ((unint64_t)-[NSMutableArray count](self->_rows, "count") < 3
            || (unint64_t)-[NSMutableArray count](self->_rows, "count") >= 5)
          {
            v36 = sub_1004318FC();
            v37 = objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              v51 = 136315906;
              v52 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
              v53 = 2080;
              v54 = "RoutePlanningWaypointListView.m";
              v55 = 1024;
              v56 = 864;
              v57 = 2080;
              v58 = "_rows.count >= 3 && _rows.count <= 4";
              _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v51, 0x26u);
            }

            if (sub_100A70734())
            {
              v38 = sub_1004318FC();
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
              {
                v40 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                v51 = 138412290;
                v52 = v40;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v51, 0xCu);

              }
            }
          }
          v19 = objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject waypoints](v19, "waypoints"));
          if ((unint64_t)objc_msgSend(v20, "count") <= 1)
          {
            v41 = sub_1004318FC();
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              v51 = 136315906;
              v52 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
              v53 = 2080;
              v54 = "RoutePlanningWaypointListView.m";
              v55 = 1024;
              v56 = 867;
              v57 = 2080;
              v58 = "collapsedWaypoints.count > 1";
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v51, 0x26u);
            }

            if (sub_100A70734())
            {
              v43 = sub_1004318FC();
              v44 = objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                v45 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                v51 = 138412290;
                v52 = v45;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v51, 0xCu);

              }
            }
          }
          v18 = (unint64_t)objc_msgSend(v20, "count") + v18 - 1;
          if (v18 >= (unint64_t)-[NSMutableArray count](self->_waypoints, "count"))
          {
            v46 = sub_1004318FC();
            v47 = objc_claimAutoreleasedReturnValue(v46);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v51 = 136315906;
              v52 = "-[RoutePlanningWaypointListView tableView:didSelectRowAtIndexPath:]";
              v53 = 2080;
              v54 = "RoutePlanningWaypointListView.m";
              v55 = 1024;
              v56 = 869;
              v57 = 2080;
              v58 = "adjustedIndex < _waypoints.count";
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v51, 0x26u);
            }

            if (sub_100A70734())
            {
              v48 = sub_1004318FC();
              v49 = objc_claimAutoreleasedReturnValue(v48);
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                v50 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                v51 = 138412290;
                v52 = v50;
                _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v51, 0xCu);

              }
            }
          }

        }
LABEL_20:
        v21 = sub_10085218C();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v51 = 134217984;
          v52 = (const char *)v18;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Did select waypoint at adjusted index %lu", (uint8_t *)&v51, 0xCu);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
        objc_msgSend(v14, "waypointListView:didSelectWaypoint:atIndex:", self, v23, v18);

        goto LABEL_23;
      }
    }

  }
  v24 = objc_opt_class(RoutePlanningAddStopCell);
  if ((objc_opt_isKindOfClass(v7, v24) & 1) != 0)
  {
    v25 = sub_10085218C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v51) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Did select Add Stop", (uint8_t *)&v51, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    objc_msgSend(v9, "waypointListViewDidSelectAddStop:", self);
    goto LABEL_29;
  }
LABEL_30:

}

- (BOOL)_canDeleteWaypoints
{
  id v3;
  void *v4;
  id v5;

  v3 = sub_10039E080(self->_waypoints, &stru_1011D9260);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "count");

  return -[RoutePlanningWaypointListView editingMode](self, "editingMode")
      && -[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled")
      && (unint64_t)v5 >= 3
      && !self->_hasCollapsedStops;
}

- (BOOL)canDeleteWaypointForCellAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  if (!-[RoutePlanningWaypointListView _canDeleteWaypoints](self, "_canDeleteWaypoints")
    || (unint64_t)-[NSMutableArray count](self->_rows, "count") <= a3)
  {
    return 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3));
  v6 = objc_opt_class(RoutePlanningWaypointCell);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoints")),
        v10 = objc_msgSend(v9, "count"),
        v9,
        (unint64_t)v10 <= 1))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypoints"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "composedWaypoint"));
    v15 = objc_msgSend(v14, "isServerProvidedWaypoint");

    v11 = v15 ^ 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16[2];
  id location;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  if (-[RoutePlanningWaypointListView canDeleteWaypointForCellAtIndex:](self, "canDeleteWaypointForCellAtIndex:", v8))
  {
    objc_initWeak(&location, self);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[RoutePlanning] Delete"), CFSTR("localized string not found"), 0));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1008568DC;
    v15[3] = &unk_1011D9288;
    objc_copyWeak(v16, &location);
    v16[1] = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v10, v15));
    v18 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v12));

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)performDeleteAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  RoutePlanningWaypointListView *v24;
  RoutePlanningWaypointListView *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  NSObject *v33;
  id v34;
  char *v35;
  NSMutableArray *rows;
  id v37;
  NSObject *v38;
  const char *v39;
  void *v40;
  id v41;
  char *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  _BYTE v48[14];
  __int16 v49;
  void *v50;

  if (!-[RoutePlanningWaypointListView canDeleteWaypointForCellAtIndex:](self, "canDeleteWaypointForCellAtIndex:"))
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v44 = "-[RoutePlanningWaypointListView performDeleteAtIndex:]";
      v45 = 2080;
      v46 = "RoutePlanningWaypointListView.m";
      v47 = 1024;
      *(_DWORD *)v48 = 954;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v23 = sub_10085218C();
    v8 = objc_claimAutoreleasedReturnValue(v23);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    v24 = self;
    v25 = v24;
    if (!v24)
    {
      v31 = CFSTR("<nil>");
      goto LABEL_36;
    }
    v26 = (objc_class *)objc_opt_class(v24);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_29;
      }

    }
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_29:

LABEL_36:
    rows = v25->_rows;
    *(_DWORD *)buf = 138543874;
    v44 = (const char *)v31;
    v45 = 2048;
    v46 = (const char *)a3;
    v47 = 2112;
    *(_QWORD *)v48 = rows;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Cannot delete stop at index (%lu) with rows %@", buf, 0x20u);

    goto LABEL_37;
  }
  -[RoutePlanningWaypointListView deselectAllRows](self, "deselectAllRows");
  if ((unint64_t)-[NSMutableArray count](self->_rows, "count") > a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", a3));
    v6 = objc_opt_class(RoutePlanningWaypointCell);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    if (-[RoutePlanningWaypointListView editingMode](self, "editingMode")
      && v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject waypoints](v8, "waypoints")),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v10 == (id)1))
    {
      v11 = sub_10085218C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v44 = (const char *)a3;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Deleting waypoint at index %lu", buf, 0xCu);
      }

      if (self->_selectedIndex == a3)
      {
        self->_activelyEditingSelectedField = 0;
        self->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView waypoints](self, "waypoints"));
      v14 = objc_msgSend(v13, "mutableCopy");

      -[NSObject removeObjectAtIndex:](v14, "removeObjectAtIndex:", a3);
      -[RoutePlanningWaypointListView setWaypoints:](self, "setWaypoints:", v14);
      -[RoutePlanningWaypointListView _refreshAddStopCellEnabled](self, "_refreshAddStopCellEnabled");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      v16 = objc_opt_respondsToSelector(v15, "waypointListView:didDeleteWaypointAtIndex:");

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
        objc_msgSend(v17, "waypointListView:didDeleteWaypointAtIndex:", self, a3);

      }
    }
    else
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = "add stop cell";
        if (v8)
          v39 = "collapsed waypoint cell";
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trying to delete %s"), v39));
        *(_DWORD *)buf = 136316162;
        v44 = "-[RoutePlanningWaypointListView performDeleteAtIndex:]";
        v45 = 2080;
        v46 = "RoutePlanningWaypointListView.m";
        v47 = 1024;
        *(_DWORD *)v48 = 968;
        *(_WORD *)&v48[4] = 2080;
        *(_QWORD *)&v48[6] = "validToDelete";
        v49 = 2112;
        v50 = v40;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (!sub_100A70734())
        goto LABEL_37;
      v41 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v42 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v44 = v42;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }

LABEL_37:
    return;
  }
  v32 = sub_1004318FC();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v44 = "-[RoutePlanningWaypointListView performDeleteAtIndex:]";
    v45 = 2080;
    v46 = "RoutePlanningWaypointListView.m";
    v47 = 1024;
    *(_DWORD *)v48 = 962;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v34 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v44 = v35;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    goto LABEL_37;
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  char v7;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v5 = a4;
  if (-[RoutePlanningWaypointListView editingMode](self, "editingMode")
    && (v6 = objc_msgSend(v5, "row"), v6 < -[NSMutableArray count](self->_waypoints, "count"))
    && !self->_hasCollapsedStops)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_waypoints, "objectAtIndexedSubscript:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "composedWaypoint"));
    v11 = objc_msgSend(v10, "isServerProvidedWaypoint");

    v7 = v11 ^ 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  id v12;
  void *v13;

  v6 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_rows, "lastObject"));
  v8 = objc_opt_class(RoutePlanningAddStopCell);
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = (unint64_t)-[NSMutableArray count](self->_rows, "count") - 1;

  v10 = (char *)objc_msgSend(v6, "row");
  if (v9 == 0x7FFFFFFFFFFFFFFFLL
    || (v11 = v10, (unint64_t)v10 < v9)
    || v10 >= -[NSMutableArray count](self->_rows, "count"))
  {
    v12 = v6;
  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11 - 1, objc_msgSend(v6, "section")));
  }
  v13 = v12;

  return v13;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id selectedIndex;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a4;
  v7 = a5;
  v8 = objc_msgSend(v25, "row");
  v9 = objc_msgSend(v7, "row");
  if (v8 != v9)
  {
    v10 = v9;
    if (self->_selectedIndex == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_8;
    v11 = objc_msgSend(v25, "row");
    selectedIndex = (id)self->_selectedIndex;
    if (v11 == selectedIndex)
    {
      selectedIndex = objc_msgSend(v7, "row");
      self->_selectedIndex = (unint64_t)selectedIndex;
    }
    if (selectedIndex == (id)0x7FFFFFFFFFFFFFFFLL || selectedIndex >= -[NSMutableArray count](self->_rows, "count"))
LABEL_8:
      v13 = 0;
    else
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_rows, "objectAtIndexedSubscript:", self->_selectedIndex));
    -[NSMutableArray _maps_moveObjectAtIndex:toIndex:](self->_rows, "_maps_moveObjectAtIndex:toIndex:", v8, v10);
    -[NSMutableArray _maps_moveObjectAtIndex:toIndex:](self->_waypoints, "_maps_moveObjectAtIndex:toIndex:", v8, v10);
    if (v13)
      self->_selectedIndex = (unint64_t)-[NSMutableArray indexOfObject:](self->_rows, "indexOfObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", v8));
    v15 = objc_opt_class(RoutePlanningWaypointCell);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v17, "setCellIndex:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_rows, "objectAtIndex:", v10));
    v19 = objc_opt_class(RoutePlanningWaypointCell);
    if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      v20 = v18;
    else
      v20 = 0;
    v21 = v20;

    objc_msgSend(v21, "setCellIndex:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
    LOBYTE(v21) = objc_opt_respondsToSelector(v22, "waypointListView:didMoveWaypoint:fromIndex:toIndex:");

    if ((v21 & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView delegate](self, "delegate"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_waypoints, "objectAtIndexedSubscript:", v10));
      objc_msgSend(v23, "waypointListView:didMoveWaypoint:fromIndex:toIndex:", self, v24, v8, v10);

    }
  }

}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v7 = a3;
  v8 = a4;
  if (-[RoutePlanningWaypointListView _canDeleteWaypoints](self, "_canDeleteWaypoints"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v8));
    v10 = objc_opt_class(RoutePlanningWaypointCell);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (-[RoutePlanningWaypointListView canDeleteWaypointForCellAtIndex:](self, "canDeleteWaypointForCellAtIndex:", objc_msgSend(v8, "row")))
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1008574D4;
      v16[3] = &unk_1011B7BA8;
      v17 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointListView contextMenuForCell:](self, "contextMenuForCell:", v12));
      v13 = v17;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v16));

    }
    else if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, 0));
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return -[RoutePlanningWaypointListView editingMode](self, "editingMode", a3, a4) != 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v10;
  uint64_t v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  unsigned int v15;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)-[NSMutableArray count](self->_rows, "count") >= 4
    && -[RoutePlanningWaypointListView mprEnabled](self, "mprEnabled")
    && !self->_hasCollapsedStops
    && -[RoutePlanningWaypointListView editingMode](self, "editingMode"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v7));
    v11 = objc_opt_class(RoutePlanningWaypointCell);
    isKindOfClass = objc_opt_isKindOfClass(v10, v11);

    v8 = 0;
    if ((isKindOfClass & 1) != 0 && v10)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_waypoints, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "composedWaypoint"));
      v15 = objc_msgSend(v14, "isServerProvidedWaypoint");

      v8 = v15 ^ 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
    -[RoutePlanningWaypointListView performDeleteAtIndex:](self, "performDeleteAtIndex:", objc_msgSend(a5, "row", a3));
}

- (unint64_t)editingMode
{
  return self->_editingMode;
}

- (BOOL)mprEnabled
{
  return self->_mprEnabled;
}

- (RoutePlanningWaypointListViewDelegate)delegate
{
  return (RoutePlanningWaypointListViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UILayoutGuide)layoutGuideForCurrentlyEditingField
{
  return self->_layoutGuideForCurrentlyEditingField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutGuideForCurrentlyEditingField, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dottedLines, 0);
  objc_destroyWeak((id *)&self->_addStopCell);
  objc_destroyWeak((id *)&self->_lastEmptyWaypointCell);
  objc_storeStrong((id *)&self->_layoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_waypoints, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_waypointInfoProvider);
}

@end
