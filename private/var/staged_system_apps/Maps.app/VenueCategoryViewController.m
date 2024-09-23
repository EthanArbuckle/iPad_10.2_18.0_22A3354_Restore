@implementation VenueCategoryViewController

- (VenueCategoryViewController)initWithSearchCategory:(id)a3
{
  id v4;
  VenueCategoryViewController *v5;
  UITableView *v6;
  UITableView *tableView;
  VenueCategoryDataSource *v8;
  VenueCategoryDataSource *dataSource;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VenueCategoryViewController;
  v5 = -[VenueCategoryViewController initWithNibName:bundle:](&v15, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = (UITableView *)objc_alloc_init((Class)UITableView);
    tableView = v5->_tableView;
    v5->_tableView = v6;

    v8 = -[VenueCategoryDataSource initWithTableView:searchCategory:]([VenueCategoryDataSource alloc], "initWithTableView:searchCategory:", v5->_tableView, v4);
    dataSource = v5->_dataSource;
    v5->_dataSource = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](v5, "dataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchCategory"));
    if (objc_msgSend(v11, "displayMode") == 2)
      v12 = 3;
    else
      v12 = 2;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    objc_msgSend(v13, "setDefaultContaineeLayout:", v12);

  }
  return v5;
}

- (VenueCategoryViewController)initWithCategoryCardItem:(id)a3
{
  id v4;
  void *v5;
  VenueCategoryViewController *v6;
  VenueCategoryViewController *v7;
  void *v8;
  VenueCategoryContentDownloader *v9;
  VenueCategoryContentDownloader *contentDownloader;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueSearchCategory"));
  v6 = -[VenueCategoryViewController initWithSearchCategory:](self, "initWithSearchCategory:", v5);
  v7 = v6;
  if (v6)
  {
    v6->_isAutoComplete = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subcategories"));
    -[VenueCategoryDataSource setSubcategories:](v7->_dataSource, "setSubcategories:", v8);

    -[VenueCategoryDataSource setSubcategoriesType:](v7->_dataSource, "setSubcategoriesType:", objc_msgSend(v5, "subCategoryType"));
    v9 = -[VenueCategoryContentDownloader initWithDelegate:venueCategoryCardItem:]([VenueCategoryContentDownloader alloc], "initWithDelegate:venueCategoryCardItem:", v7, v4);
    contentDownloader = v7->_contentDownloader;
    v7->_contentDownloader = v9;

  }
  return v7;
}

- (VenueCategoryViewController)initWithAutoCompleteCategoryCardItem:(id)a3
{
  id v4;
  void *v5;
  VenueCategoryViewController *v6;
  VenueCategoryContentDownloader *v7;
  VenueCategoryContentDownloader *contentDownloader;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "venueSearchCategory"));
  v6 = -[VenueCategoryViewController initWithSearchCategory:](self, "initWithSearchCategory:", v5);

  if (v6)
  {
    v6->_isAutoComplete = 1;
    v7 = -[VenueCategoryContentDownloader initWithDelegate:venueAutoCompleteCategoryCardItem:]([VenueCategoryContentDownloader alloc], "initWithDelegate:venueAutoCompleteCategoryCardItem:", v6, v4);
    contentDownloader = v6->_contentDownloader;
    v6->_contentDownloader = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](v6, "dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "searchCategory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shortDisplayString"));
    -[VenueCategoryViewController setHeaderTitle:](v6, "setHeaderTitle:", v11);

  }
  return v6;
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  unsigned __int8 v6;
  NSString *v7;
  NSString *headerTitle;
  UILabel *headerLabel;
  NSString *v10;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_headerTitle != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      headerTitle = self->_headerTitle;
      self->_headerTitle = v7;

      v5 = v10;
      headerLabel = self->_headerLabel;
      if (headerLabel)
      {
        -[UILabel setText:](headerLabel, "setText:", self->_headerTitle);
        v5 = v10;
      }
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  if (-[VenueCategoryViewController isAutoComplete](self, "isAutoComplete"))
    v4 = -[VenueCategoryViewController didFinishAutoCompleteSearchRequest](self, "didFinishAutoCompleteSearchRequest") ^ 1;
  else
    v4 = 0;
  -[VenueCategoryViewController setShowsLoading:](self, "setShowsLoading:", v4);
}

- (void)venueCategoryContentDownloaderDidStart:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C376FC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)venueCategoryContentDownloader:(id)a3 didChangeMapItem:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100C37784;
  v5[3] = &unk_1011AC8B0;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

- (void)venueCategoryContentDownloader:(id)a3 didFailToFetchMapItemWithError:(id)a4
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "VenueCategoryContentDownloaderLogCategory");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "VenueCategoryContentDownloader failed to download MKMapItem with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)venueCategoryContentDownloaderDidFail:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C37984;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)venueCategoryContentDownloaderDidCancel:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C37A0C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveEVChargerUpdates:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  objc_msgSend(v6, "refreshEVChargers:", v5);

}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveSearchResults:(id)a4 shouldSwitchToBestFloor:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  BOOL v16;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController _buildingAtIndex:](self, "_buildingAtIndex:", objc_msgSend(v8, "selectedIndex")));

  v10 = objc_msgSend(v9, "describesParentVenue");
  v11 = 1;
  v13[0] = _NSConcreteStackBlock;
  if (v10)
    v11 = 2;
  v13[1] = 3221225472;
  v13[2] = sub_100C37B68;
  v13[3] = &unk_1011BBFE0;
  v13[4] = self;
  v14 = v7;
  v15 = v11;
  v16 = a5;
  v12 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

}

- (void)venueCategoryContentDownloader:(id)a3 didReceiveAutoCompleteSubcategories:(id)a4 subcategoriesType:(int)a5
{
  id v5;
  _QWORD block[5];
  id v7;
  int v8;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C37C80;
  block[3] = &unk_1011AE308;
  v8 = a5;
  block[4] = self;
  v7 = a4;
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController viewDidLoad](&v4, "viewDidLoad");
  -[VenueCategoryViewController configureTableView](self, "configureTableView");
  -[VenueCategoryViewController configureHeader](self, "configureHeader");
  -[VenueCategoryViewController updateFooterVisibility](self, "updateFooterVisibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  -[ControlContaineeViewController setDelegate:](&v4, "setDelegate:", a3);
  -[VenueCategoryViewController performInitialSearchIfNecessary](self, "performInitialSearchIfNecessary");
}

- (void)performInitialSearchIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (!-[VenueCategoryViewController isAutoComplete](self, "isAutoComplete"))
  {
    v3 = objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    if (v3)
    {
      v4 = (void *)v3;
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));

      if (v6)
      {
        v15 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController contentDownloader](self, "contentDownloader"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "searchCategory"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
        v10 = objc_msgSend(v9, "subcategoriesType");
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "buildings"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v15, "performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:", v8, v10, v13, 0, v14);

      }
    }
  }
}

- (void)updateFilterBar
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filterBarTitles"));

  v4 = objc_msgSend(v8, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v6 = v5;
  if ((unint64_t)v4 > 1)
  {
    v7 = objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setSubCategories:selectedIndex:", v7, 0);

    -[VenueCategoryViewController updateFooterVisibility](self, "updateFooterVisibility");
  }
  else
  {
    objc_msgSend(v5, "resetData");

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  -[VenueCategoryViewController viewSafeAreaInsetsDidChange](&v4, "viewSafeAreaInsetsDidChange");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C38048;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setShowsLoading:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_showsLoading != a3)
  {
    v3 = a3;
    self->_showsLoading = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
    objc_msgSend(v5, "setHidden:", v3);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
    objc_msgSend(v6, "setHidden:", v3 ^ 1);

  }
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VenueCategoryViewController;
  -[VenueCategoryViewController viewWillLayoutSubviews](&v3, "viewWillLayoutSubviews");
  -[VenueCategoryViewController displayIndexListIfNecessary](self, "displayIndexListIfNecessary");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v4, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  -[VenueCategoryViewController setShouldDisplayFilterView:](self, "setShouldDisplayFilterView:", (unint64_t)objc_msgSend(v3, "containeeLayout") > 1);

}

- (void)displayIndexListIfNecessary
{
  void *v3;
  unsigned int v4;
  void *v5;
  double Height;
  double v7;
  double v8;
  void *v9;
  id v10;
  unint64_t UInteger;
  int v13;
  void *v14;
  id v15;
  CGRect v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v4 = objc_msgSend(v3, "isIndexHidden");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController view](self, "view"));
  objc_msgSend(v5, "frame");
  Height = CGRectGetHeight(v16);
  -[ContaineeViewController heightForLayout:](self, "heightForLayout:", 3);
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v10 = objc_msgSend(v9, "numberOfSectionsNotEmpty");
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_VenuesMinimumSectionsNumberForDisplayIndexList[0], GeoServicesConfig_VenuesMinimumSectionsNumberForDisplayIndexList[1]);

  v13 = Height >= v8 && (unint64_t)v10 >= UInteger;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setIndexHidden:animated:", v13 ^ 1u, 1);

  if (v4 == v13)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
    objc_msgSend(v15, "reloadData");

  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabelFont](self, "headerLabelFont", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v4, "setFont:", v5);

}

- (void)applyAlphaToContent:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", a3);
}

- (id)headerLabelFont
{
  return +[UIFont system22Bold](UIFont, "system22Bold");
}

- (void)configureHeader
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *headerTitle;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ContainerHeaderView *v19;
  void *v20;
  ContainerHeaderView *v21;
  ContainerHeaderView *containerHeaderView;
  ContainerHeaderView *v23;
  void *v24;
  ContainerHeaderView *v25;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _QWORD v79[13];

  v3 = objc_alloc_init((Class)UIView);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_alloc_init((Class)UIImageView);
  -[VenueCategoryViewController setHeaderImageView:](self, "setHeaderImageView:", v4);

  -[VenueCategoryViewController updateHeaderImageView](self, "updateHeaderImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  objc_msgSend(v3, "addSubview:", v6);

  v7 = objc_alloc_init((Class)UILabel);
  -[VenueCategoryViewController setHeaderLabel:](self, "setHeaderLabel:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v10, "setBackgroundColor:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v11, "setNumberOfLines:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabelFont](self, "headerLabelFont"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v13, "setFont:", v12);

  headerTitle = self->_headerTitle;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v15, "setText:", headerTitle);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v17, "setTextColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  objc_msgSend(v3, "addSubview:", v18);

  v19 = [ContainerHeaderView alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController view](self, "view"));
  objc_msgSend(v20, "_contentMargin");
  v21 = -[ContainerHeaderView initWithHairlineMargin:](v19, "initWithHairlineMargin:");

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setTitleView:](v21, "setTitleView:", v3);
  -[ContainerHeaderView setDelegate:](v21, "setDelegate:", self);
  -[ContainerHeaderView setVerticalAlignmentOffset:](v21, "setVerticalAlignmentOffset:", 11.0);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v21;
  v23 = v21;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v24, "addSubview:", v23);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView heightAnchor](v23, "heightAnchor"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintGreaterThanOrEqualToConstant:", 80.0));
  v79[0] = v77;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:constant:", v74, 16.0));
  v79[1] = v73;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "widthAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToConstant:", 40.0));
  v79[2] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "heightAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToConstant:", 40.0));
  v79[3] = v67;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "topAnchor"));
  v65 = v3;
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63, 20.0));
  v79[4] = v62;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:constant:", v58, 10.0));
  v79[5] = v57;
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v79[6] = v53;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerYAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "centerYAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v49));
  v79[7] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerLabel](self, "headerLabel"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "topAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "topAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, 13.0));
  v79[8] = v43;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](v23, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v79[9] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v25 = v23;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](v23, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v79[10] = v35;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](v23, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
  v79[11] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](v25, "bottomAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
  v79[12] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 13));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

}

- (void)updateHeaderImageView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchCategory"));
  v5 = v4;
  if (v4)
  {
    v16 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subcategories"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "styleAttributes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "nativeScale");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController traitCollection](self, "traitCollection"));
  LOBYTE(v15) = objc_msgSend(v12, "userInterfaceStyle") == (id)2;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:](MKIconManager, "imageForStyle:size:forScale:format:transparent:transitMode:isCarplay:nightMode:", v8, 4, 1, 0, 0, 0, v11, v15));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController headerImageView](self, "headerImageView"));
  objc_msgSend(v14, "setImage:", v13);

}

- (NSDictionary)searchResultCountInVenue
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = objc_opt_new(NSMutableDictionary);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "content"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objects"));

  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v6);
        v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "venueAreaIdentifiers"));
        v11 = (void *)v10;
        v12 = &__NSArray0__struct;
        if (v10)
          v12 = (void *)v10;
        v13 = v12;

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v15; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
              v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v18));
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v19, "unsignedIntegerValue") + 1));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v20, v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v15);
        }

      }
      v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

  return (NSDictionary *)v3;
}

- (void)didUpdateResults
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0));
    objc_msgSend(v6, "scrollToRowAtIndexPath:atScrollPosition:animated:", v7, 1, 0);

  }
  -[VenueCategoryViewController displayIndexListIfNecessary](self, "displayIndexListIfNecessary");
}

- (void)notifyVenuesManagerAndSwitchToBestFloor:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "venuesManager"));
  objc_msgSend(v6, "venuesControlCoordinatingDidChangeSearchResultCount:", self);

  if (v3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "venuesManager"));
    objc_msgSend(v7, "updateFocusedVenueFloor");

  }
}

- (void)configureTableView
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
  FilterCategoriesView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LoadingModeView *v18;
  void *v19;
  void *v20;
  LoadingModeView *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  _QWORD v91[12];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setSectionIndexBackgroundColor:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v7, "addSubview:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setPreservesSuperviewLayoutMargins:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  objc_msgSend(v11, "setDelegate:", self);

  v12 = -[FilterCategoriesView initWithFrame:]([FilterCategoriesView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[VenueCategoryViewController setFilterView:](self, "setFilterView:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  objc_msgSend(v14, "setDelegate:", self);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  objc_msgSend(v15, "setLastButtonTrailingPadding:", 20.0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  objc_msgSend(v16, "addSubview:", v17);

  v18 = [LoadingModeView alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
  v21 = -[LoadingModeView initWithTitle:](v18, "initWithTitle:", v20);
  -[VenueCategoryViewController setLoadingModeView:](self, "setLoadingModeView:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  LODWORD(v24) = 0;
  objc_msgSend(v23, "setContentHuggingPriority:forAxis:", 1, v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  objc_msgSend(v25, "setHidden:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));

  LODWORD(v33) = 1140457472;
  v76 = v32;
  objc_msgSend(v32, "setPriority:", v33);
  v90 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "constraintEqualToAnchor:", v87));
  v91[0] = v86;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "leadingAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController view](self, "view"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "constraintEqualToAnchor:", v82));
  v91[1] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "trailingAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController view](self, "view"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "constraintEqualToAnchor:", v77));
  v91[2] = v75;
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController view](self, "view"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:", v71));
  v91[3] = v70;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:", v66));
  v91[4] = v65;
  v91[5] = v32;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
  v91[6] = v60;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v56));
  v91[7] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v91[8] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v91[9] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v36));
  v91[10] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v41));
  v91[11] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 12));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v43);

}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 4, -[VenueCategoryViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v6.receiver = self;
  v6.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController handleDismissAction:](&v6, "handleDismissAction:", v4);

}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VenueCategoryViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v9, "willChangeContainerStyle:");
  if (a3 == 6)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "setDefaultContaineeLayout:", 4);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchCategory"));
    if (objc_msgSend(v6, "displayMode") == 2)
      v7 = 3;
    else
      v7 = 2;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "setDefaultContaineeLayout:", v7);

  }
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  VenueCategoryDataSource *dataSource;
  id v6;

  v6 = a3;
  dataSource = self->_dataSource;
  if (dataSource)
    -[VenueCategoryDataSource resetCache](dataSource, "resetCache");
  -[VenueCategoryViewController handleDismissAction:](self, "handleDismissAction:", v6);

}

- (void)setFilterViewHidden:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100C39B8C;
  v3[3] = &unk_1011ACE58;
  v3[4] = self;
  v4 = a3;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v3, 0.25);
}

- (void)setShouldDisplayFilterView:(BOOL)a3
{
  self->_shouldDisplayFilterView = a3;
  -[VenueCategoryViewController updateFooterVisibility](self, "updateFooterVisibility");
}

- (void)filterView:(id)a3 indexSelected:(unint64_t)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v6, "wantsLayout:", 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v8 = objc_msgSend(v7, "subcategoriesType");

  if (v8 >= 2)
  {
    if (v8 == 2)
      -[VenueCategoryViewController filterView:didSelectBuildingWithIndex:](self, "filterView:didSelectBuildingWithIndex:", v9, a4);
  }
  else
  {
    -[VenueCategoryViewController filterView:didSelectSubcategoryWithIndex:](self, "filterView:didSelectSubcategoryWithIndex:", v9, a4);
  }

}

- (void)filterView:(id)a3 didSelectSubcategoryWithIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subcategories"));

  if (v7 && (unint64_t)objc_msgSend(v7, "count") > a4)
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a4));
  else
    v11 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController contentDownloader](self, "contentDownloader"));
  v9 = objc_msgSend(v11, "isSubCategorySameAsTopLevel") ^ 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v8, "performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:", v11, 1, 0, v9, v10);

}

- (void)filterView:(id)a3 didSelectBuildingWithIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController _buildingAtIndex:](self, "_buildingAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController contentDownloader](self, "contentDownloader"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchCategory"));
  v8 = objc_msgSend(v10, "describesParentVenue") ^ 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "performSearchWithSearchCategory:subcategoriesType:filter:shouldFrameMapViewport:actionCoordination:", v7, 2, v10, v8, v9);

}

- (void)updateFooterVisibility
{
  void *v3;
  void *v4;
  unsigned int v5;
  double Height;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;
  CGRect v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subCategories"));
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[VenueCategoryViewController shouldDisplayFilterView](self, "shouldDisplayFilterView");

    -[VenueCategoryViewController setFilterViewHidden:](self, "setFilterViewHidden:", v5 ^ 1);
    Height = 0.0;
    if (((v5 ^ 1) & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
      objc_msgSend(v7, "frame");
      Height = CGRectGetHeight(v17);

    }
  }
  else
  {

    -[VenueCategoryViewController setFilterViewHidden:](self, "setFilterViewHidden:", 1);
    Height = 0.0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v8, "contentInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController tableView](self, "tableView"));
  objc_msgSend(v15, "setContentInset:", v10, v12, Height, v14);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController loadingModeView](self, "loadingModeView"));
  objc_msgSend(v16, "setBottomInset:", Height);

}

- (NSString)refineSearchText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subCategories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v5, "selectedIndex")));

  return (NSString *)v6;
}

- (int)refineSearchSessionType
{
  return 2;
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id lastItemTapped;
  id v9;

  v9 = a4;
  v5 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
  {
    v6 = v9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v7, "viewController:focusSearchResult:", self, v6);

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
  id v6;
  void *v7;
  id lastItemTapped;
  id v9;

  v9 = a4;
  v5 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
  {
    v6 = v9;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v7, "viewController:selectVenueSearchResult:source:", self, v6, 2);

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = v6;

  }
}

- (id)_headerLabelTextFromMapItem:(id)a3 searchCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = &stru_1011EB268;
  if (v6 && v7)
  {
    if (self->_isAutoComplete)
    {
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "shortDisplayString"));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("category_at_venue_format_key"), CFSTR("localized string not found"), 0));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController _venueShortNameForMapItem:](self, "_venueShortNameForMapItem:", v6));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDisplayString"));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v13, v12));

    }
  }

  return v9;
}

- (void)headerViewTapped:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  objc_msgSend(v3, "wantsExpandLayout");

}

- (id)_venueShortNameForMapItem:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "_venueFeatureType") == (id)1)
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "venueLabelWithContext:", 0));
  else
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  v5 = (void *)v4;

  return v5;
}

- (id)_buildingAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buildings"));

  if (v5 && (unint64_t)objc_msgSend(v5, "count") > a3)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));
  else
    v6 = 0;

  return v6;
}

- (int)currentUITargetForAnalytics
{
  return 106;
}

- (int)currentMapViewTargetForAnalytics
{
  return 503;
}

- (void)selectSubcategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subcategories"));
  v7 = objc_msgSend(v6, "indexOfObject:", v4);

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("VenueBrowseDidFailToSelectSubcategory"), 0);
  }
  else
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[VenueCategoryViewController filterView](self, "filterView"));
    -[VenueCategoryViewController filterView:indexSelected:](self, "filterView:indexSelected:");
  }

}

- (signed)currentSelectedFloorOrdinal
{
  return self->_currentSelectedFloorOrdinal;
}

- (void)setCurrentSelectedFloorOrdinal:(signed __int16)a3
{
  self->_currentSelectedFloorOrdinal = a3;
}

- (VenueCategoryContentDownloader)contentDownloader
{
  return self->_contentDownloader;
}

- (void)setContentDownloader:(id)a3
{
  objc_storeStrong((id *)&self->_contentDownloader, a3);
}

- (UIImageView)headerImageView
{
  return self->_headerImageView;
}

- (void)setHeaderImageView:(id)a3
{
  objc_storeStrong((id *)&self->_headerImageView, a3);
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (BOOL)shouldDisplayFilterView
{
  return self->_shouldDisplayFilterView;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (FilterCategoriesView)filterView
{
  return self->_filterView;
}

- (void)setFilterView:(id)a3
{
  objc_storeStrong((id *)&self->_filterView, a3);
}

- (LoadingModeView)loadingModeView
{
  return self->_loadingModeView;
}

- (void)setLoadingModeView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingModeView, a3);
}

- (VenueCategoryDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (VKVenueFeatureMarker)venueWithFocus
{
  return (VKVenueFeatureMarker *)objc_loadWeakRetained((id *)&self->_venueWithFocus);
}

- (void)setVenueWithFocus:(id)a3
{
  objc_storeWeak((id *)&self->_venueWithFocus, a3);
}

- (BOOL)showsLoading
{
  return self->_showsLoading;
}

- (BOOL)isAutoComplete
{
  return self->_isAutoComplete;
}

- (void)setIsAutoComplete:(BOOL)a3
{
  self->_isAutoComplete = a3;
}

- (BOOL)didFinishAutoCompleteSearchRequest
{
  return self->_didFinishAutoCompleteSearchRequest;
}

- (void)setDidFinishAutoCompleteSearchRequest:(BOOL)a3
{
  self->_didFinishAutoCompleteSearchRequest = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (id)lastItemTapped
{
  return self->_lastItemTapped;
}

- (void)setLastItemTapped:(id)a3
{
  objc_storeStrong(&self->_lastItemTapped, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_venueWithFocus);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_headerImageView, 0);
  objc_storeStrong((id *)&self->_contentDownloader, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end
