@implementation MyRecentsViewController

- (id)initIncludingRecentSearches:(BOOL)a3
{
  MyRecentsViewController *v4;
  MyRecentsViewController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MyRecentsViewController;
  v4 = -[MyRecentsViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v4, "cardPresentationController"));
    objc_msgSend(v6, "setPresentedModally:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v7, "setTakesAvailableHeight:", 1);

    v5->_includeRecentSearches = a3;
  }
  return v5;
}

- (id)keyCommands
{
  void *v3;
  id v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  objc_super v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsViewController presentedViewController](self, "presentedViewController"));

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)MyRecentsViewController;
    v4 = -[ContaineeViewController keyCommands](&v10, "keyCommands");
    return (id)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)MyRecentsViewController;
    v6 = -[ContaineeViewController keyCommands](&v11, "keyCommands");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource keyCommands](self->_recentsDataSource, "keyCommands"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8));

    return v9;
  }
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  MyRecentsDataSource *v9;
  id v10;
  MyRecentsDataSource *v11;
  objc_super v13;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsDataSource keyCommands](self->_recentsDataSource, "keyCommands"));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8)
  {
    v9 = self->_recentsDataSource;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)MyRecentsViewController;
    v10 = -[MyRecentsViewController targetForAction:withSender:](&v13, "targetForAction:withSender:", a3, v6);
    v9 = (MyRecentsDataSource *)objc_claimAutoreleasedReturnValue(v10);
  }
  v11 = v9;

  return v11;
}

- (id)preferredFocusEnvironments
{
  MapsThemeTableView *tableView;

  tableView = self->_tableView;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &tableView, 1));
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ContainerHeaderView *v7;
  double y;
  double width;
  double height;
  ContainerHeaderView *v11;
  void *v12;
  void *v13;
  ContainerHeaderView *titleHeaderView;
  ContainerHeaderView *v15;
  MapsThemeTableView *v16;
  void *v17;
  MapsThemeTableView *tableView;
  MapsThemeTableView *v19;
  ContainerHeaderView *v20;
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
  void *v46;
  void *v47;
  MyRecentsViewController *v48;
  objc_super v49;
  _QWORD v50[8];

  v49.receiver = self;
  v49.super_class = (Class)MyRecentsViewController;
  -[ContaineeViewController viewDidLoad](&v49, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MyRecentsViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v7 = [ContainerHeaderView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[ContainerHeaderView initWithFrame:](v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](v11, "setDelegate:", self);
  -[ContainerHeaderView setHeaderSize:](v11, "setHeaderSize:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[RecentlyViewed] Recents"), CFSTR("localized string not found"), 0));
  -[ContainerHeaderView setTitle:](v11, "setTitle:", v13);

  objc_msgSend(v5, "addSubview:", v11);
  titleHeaderView = self->_titleHeaderView;
  self->_titleHeaderView = v11;
  v15 = v11;

  v16 = -[MapsThemeTableView initWithFrame:style:]([MapsThemeTableView alloc], "initWithFrame:style:", 2, CGRectZero.origin.x, y, width, height);
  -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeTableView setBackgroundColor:](v16, "setBackgroundColor:", v17);

  -[MapsThemeTableView _setHeaderAndFooterViewsFloat:](v16, "_setHeaderAndFooterViewsFloat:", 0);
  -[MapsThemeTableView setPreservesSuperviewLayoutMargins:](v16, "setPreservesSuperviewLayoutMargins:", 1);
  objc_msgSend(v6, "addSubview:", v16);
  v48 = self;
  tableView = self->_tableView;
  self->_tableView = v16;
  v19 = v16;

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](v15, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v50[0] = v45;
  v20 = v15;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](v15, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v42));
  v50[1] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](v15, "trailingAnchor"));
  v43 = v5;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v50[2] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](v15, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v50[3] = v35;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](v19, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v32));
  v50[4] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](v19, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v50[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](v19, "trailingAnchor"));
  v34 = v6;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v50[6] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](v19, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  v50[7] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v28);

  -[MyRecentsViewController _updateHeaderHairlineAnimated:](v48, "_updateHeaderHairlineAnimated:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyRecentsViewController;
  -[ContaineeViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MyRecentsViewController loadDataSource](self, "loadDataSource");
  -[MyRecentsViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyRecentsViewController;
  -[MyRecentsViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTMyRecentsViewControllerDidAppearNotification"), self, 0);
}

- (void)_updateHeaderHairlineAnimated:(BOOL)a3
{
  _BOOL4 v3;
  unsigned int v5;
  _BOOL8 v6;
  double v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a3;
  v5 = -[MapsThemeTableView _maps_shouldShowTopHairline](self->_tableView, "_maps_shouldShowTopHairline");
  v6 = v3 && -[MapsThemeTableView style](self->_tableView, "style") == (id)2;
  v7 = 0.0;
  if (v5)
    v7 = 1.0;
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003CF260;
  v9[3] = &unk_1011B22D8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003CF274;
  v8[3] = &unk_1011B2300;
  +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", v6, v9, v8, v7);
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MyRecentsViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v4, "scrollViewDidScroll:", a3);
  -[MyRecentsViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 1);
}

- (void)loadDataSource
{
  MyRecentsDataSource *v3;
  MyRecentsDataSource *recentsDataSource;
  void *v5;
  void *v6;

  v3 = -[MyRecentsDataSource initWithTableView:updateLocation:includeRecentSearches:]([MyRecentsDataSource alloc], "initWithTableView:updateLocation:includeRecentSearches:", self->_tableView, 0, self->_includeRecentSearches);
  recentsDataSource = self->_recentsDataSource;
  self->_recentsDataSource = v3;

  -[DataSource setDelegate:](self->_recentsDataSource, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appCoordinator"));
  -[MyRecentsDataSource setShareDelegate:](self->_recentsDataSource, "setShareDelegate:", v6);

  -[MapsThemeTableView setDelegate:](self->_tableView, "setDelegate:", self->_recentsDataSource);
  -[MapsThemeTableView setDataSource:](self->_tableView, "setDataSource:", self->_recentsDataSource);
  -[DataSource setActive:](self->_recentsDataSource, "setActive:", 1);
}

- (void)dataSourceUpdated:(id)a3
{
  if (self->_recentsDataSource == a3)
  {
    -[MapsThemeTableView reloadData](self->_tableView, "reloadData");
    -[MyRecentsViewController _updateHeaderHairlineAnimated:](self, "_updateHeaderHairlineAnimated:", 0);
  }
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  __objc2_prot *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  id v16;
  __objc2_prot *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  char isKindOfClass;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  unsigned int v34;
  uint64_t v35;
  id v36;
  __objc2_prot *v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  unsigned int v43;
  id v44;
  id v45;
  id v46;
  __objc2_prot *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  unsigned int v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  __objc2_prot *v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  unsigned int v65;
  id v66;
  id v67;
  __objc2_prot *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  unsigned int v74;
  DirectionItem *v75;
  DrivePreferences *v76;
  void *v77;
  void *v78;
  DrivePreferences *v79;
  TransitPreferences *v80;
  void *v81;
  void *v82;
  TransitPreferences *v83;
  WalkPreferences *v84;
  void *v85;
  void *v86;
  WalkPreferences *v87;
  CyclePreferences *v88;
  void *v89;
  void *v90;
  CyclePreferences *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD v99[2];
  _QWORD v100[2];

  v5 = a4;
  v6 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
    goto LABEL_68;
  v7 = v5;
  v8 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  v9 = objc_opt_class(HistoryEntryRecentsItem);
  v10 = v7;
  if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "historyEntry")),
        v14 = objc_msgSend(v13, "conformsToProtocol:", v8),
        v13,
        v14))
  {
    v15 = v10;
  }
  else
  {
    v15 = 0;
  }

  if (!v15)
  {
    v36 = v10;
    v37 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
    v38 = objc_opt_class(HistoryEntryRecentsItem);
    v39 = v36;
    if ((objc_opt_isKindOfClass(v39, v38) & 1) != 0)
      v40 = v39;
    else
      v40 = 0;
    v41 = v40;

    if (v41
      && (v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "historyEntry")),
          v43 = objc_msgSend(v42, "conformsToProtocol:", v37),
          v42,
          v43))
    {
      v44 = v39;
    }
    else
    {
      v44 = 0;
    }

    if (v44)
    {
      v46 = v39;
      v47 = &OBJC_PROTOCOL___MSPHistoryEntryTransitLineItem;
      v48 = objc_opt_class(HistoryEntryRecentsItem);
      v49 = v46;
      if ((objc_opt_isKindOfClass(v49, v48) & 1) != 0)
        v50 = v49;
      else
        v50 = 0;
      v51 = v50;

      if (v51
        && (v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "historyEntry")),
            v53 = objc_msgSend(v52, "conformsToProtocol:", v47),
            v52,
            v53))
      {
        v54 = v49;
      }
      else
      {
        v54 = 0;
      }

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "historyEntry"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lineItem"));
      objc_msgSend(v55, "viewController:selectTransitLineItem:zoomToMapRegion:", self, v57, 1);
    }
    else
    {
      v58 = v39;
      v59 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
      v60 = objc_opt_class(HistoryEntryRecentsItem);
      v61 = v58;
      if ((objc_opt_isKindOfClass(v61, v60) & 1) != 0)
        v62 = v61;
      else
        v62 = 0;
      v63 = v62;

      if (v63
        && (v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "historyEntry")),
            v65 = objc_msgSend(v64, "conformsToProtocol:", v59),
            v64,
            v65))
      {
        v66 = v61;
      }
      else
      {
        v66 = 0;
      }

      if (!v66)
      {
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v61));
        if (v97)
        {
          v98 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
          objc_msgSend(v98, "viewController:doSearchItem:withUserInfo:", self, v97, &off_1012744F8);

        }
        goto LABEL_68;
      }
      v67 = v61;
      v68 = &OBJC_PROTOCOL___CuratedCollectionHistoryEntry;
      v69 = objc_opt_class(HistoryEntryRecentsItem);
      v70 = v67;
      if ((objc_opt_isKindOfClass(v70, v69) & 1) != 0)
        v71 = v70;
      else
        v71 = 0;
      v72 = v71;

      if (v72
        && (v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "historyEntry")),
            v74 = objc_msgSend(v73, "conformsToProtocol:", v68),
            v73,
            v74))
      {
        v54 = v70;
      }
      else
      {
        v54 = 0;
      }

      v55 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "historyEntry"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "placeCollection"));
      objc_msgSend(v55, "viewController:showCuratedCollection:", self, v57);
    }

LABEL_68:
    v35 = 2064;
    goto LABEL_69;
  }
  v16 = v10;
  v17 = &OBJC_PROTOCOL___MSPHistoryEntryRoute;
  v18 = objc_opt_class(HistoryEntryRecentsItem);
  v19 = v16;
  if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v21 = v20;

  if (v21
    && (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "historyEntry")),
        v23 = objc_msgSend(v22, "conformsToProtocol:", v17),
        v22,
        v23))
  {
    v24 = v19;
  }
  else
  {
    v24 = 0;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "historyEntry"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endWaypoint"));
  v27 = objc_opt_class(GEOComposedWaypointToRoute);
  isKindOfClass = objc_opt_isKindOfClass(v26, v27);

  if ((isKindOfClass & 1) != 0)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "endWaypoint"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "route"));
    objc_msgSend(v30, "viewController:enterRouteCreationWithRoute:withUserInfo:", self, v31, 0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "route"));
    v33 = objc_msgSend(v32, "source");

    if (v33 == (id)3)
      v34 = 468;
    else
      v34 = 2064;
    if (v33 == (id)2)
      v35 = 462;
    else
      v35 = v34;
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemsForRouteHistoryEntry:](SearchFieldItem, "searchFieldItemsForRouteHistoryEntry:", v25));
    if ((objc_msgSend(v25, "navigationWasInterrupted") & 1) != 0
      || (unint64_t)objc_msgSend(v29, "count") >= 3)
    {
      v45 = objc_msgSend(v25, "transportType");
    }
    else
    {
      v45 = 0;
    }
    v75 = -[DirectionItem initWithItems:transportType:]([DirectionItem alloc], "initWithItems:transportType:", v29, v45);
    if (objc_msgSend(v25, "navigationWasInterrupted"))
    {
      v76 = [DrivePreferences alloc];
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "automobileOptions"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v79 = -[DrivePreferences initWithAutomobileOptions:defaults:](v76, "initWithAutomobileOptions:defaults:", v77, v78);
      -[DirectionItem setDrivePreferences:](v75, "setDrivePreferences:", v79);

      v80 = [TransitPreferences alloc];
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "transitOptions"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v83 = -[TransitPreferences initWithTransitOptions:defaults:](v80, "initWithTransitOptions:defaults:", v81, v82);
      -[DirectionItem setTransitPreferences:](v75, "setTransitPreferences:", v83);

      v84 = [WalkPreferences alloc];
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "walkingOptions"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v87 = -[WalkPreferences initWithWalkingOptions:defaults:](v84, "initWithWalkingOptions:defaults:", v85, v86);
      -[DirectionItem setWalkPreferences:](v75, "setWalkPreferences:", v87);

      v88 = [CyclePreferences alloc];
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "cyclingOptions"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v91 = -[CyclePreferences initWithCyclingOptions:defaults:](v88, "initWithCyclingOptions:defaults:", v89, v90);
      -[DirectionItem setCyclePreferences:](v75, "setCyclePreferences:", v91);

    }
    v99[0] = CFSTR("DirectionsSessionInitiatorKey");
    v99[1] = CFSTR("DirectionsRouteUUIDKey");
    v100[0] = &off_10126CFE8;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
    v100[1] = v92;
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v100, v99, 2));

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v94, "viewController:doDirectionItem:withUserInfo:", self, v75, v93);

    if ((unint64_t)objc_msgSend(v29, "count") > 2)
      v35 = 302;
    else
      v35 = 303;

  }
LABEL_69:
  v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MyRecentsDataSource indexOfItem:](self->_recentsDataSource, "indexOfItem:", v5)));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "stringValue"));
  +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v35, 257, v96);

}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentsDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
}

@end
