@implementation GuidanceSearchResultsViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (GuidanceSearchResultsViewController)initWithViewModel:(id)a3
{
  id v5;
  GuidanceSearchResultsViewController *v6;
  GuidanceSearchResultsViewController *v7;

  v5 = a3;
  v6 = -[GuidanceSearchResultsViewController init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewModel, a3);
    -[GuidanceSearchResultsViewModel setDelegate:](v7->_viewModel, "setDelegate:", v7);
  }

  return v7;
}

- (GuidanceSearchResultsViewController)init
{
  GuidanceSearchResultsViewController *v2;
  GuidanceSearchResultsViewController *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GuidanceSearchResultsViewController;
  v2 = -[GuidanceSearchResultsViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0, 0);
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v2, "cardPresentationController"));
    objc_msgSend(v4, "setBlurInCardView:", 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:](UIColor, "colorNamed:", CFSTR("NavigationMaterialColor")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v3, "cardPresentationController"));
    objc_msgSend(v6, "setCardColor:", v5);

  }
  return v3;
}

- (void)configureWithViewModel:(id)a3
{
  GuidanceSearchResultsViewModel *v5;
  GuidanceSearchResultsViewModel **p_viewModel;
  GuidanceSearchResultsViewModel *v7;

  v5 = (GuidanceSearchResultsViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[GuidanceSearchResultsViewModel setDelegate:](*p_viewModel, "setDelegate:", self);
    -[GuidanceSearchResultsViewModel loadDataIfNeeded](*p_viewModel, "loadDataIfNeeded");
    v5 = v7;
  }

}

- (void)didChangePersonalItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "results"));
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "results"));
  v9 = v8;
  if (v6 == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    v11 = sub_10043222C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
      v27 = 138412290;
      v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "SAR: didChangePersonalItems. Opening placecard with map Item: %@", (uint8_t *)&v27, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController navContaineeDelegate](self, "navContaineeDelegate"));
    objc_msgSend(v14, "selectMapItem:shouldRemoveResults:", v10, 1);

    goto LABEL_14;
  }
  v15 = objc_msgSend(v8, "count");

  if ((unint64_t)v15 < 2)
    return;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController navContaineeDelegate](self, "navContaineeDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentSearchInfo"));

  if (objc_msgSend(v10, "selectedIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = objc_msgSend(v10, "selectedIndex");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "results"));
    if (v17 >= objc_msgSend(v19, "count"))
    {

LABEL_13:
      goto LABEL_14;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "spotlightMapsIdentifier"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "results"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v10, "selectedIndex")));

      v23 = sub_10043222C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        v27 = 138412290;
        v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "SAR: didChangePersonalItems. Opening placecard with map Item: %@", (uint8_t *)&v27, 0xCu);

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController navContaineeDelegate](self, "navContaineeDelegate"));
      objc_msgSend(v26, "selectMapItem:shouldRemoveResults:", v18, 0);

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)viewDidLoad
{
  void *v3;
  GuidanceSearchResultsView *v4;
  void *v5;
  GuidanceSearchResultsView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  ResultsTitleView *v11;
  double y;
  double width;
  double height;
  ResultsTitleView *v15;
  ResultsTitleView *resultsTitleView;
  void *v17;
  void *v18;
  SearchResultsDataSource *v19;
  void *v20;
  void *v21;
  SearchResultsDataSource *v22;
  void *v23;
  uint64_t v24;
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
  ContainerHeaderView *v36;
  ContainerHeaderView *containerHeaderView;
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
  id v49;
  uint64_t v50;
  char IsEnabled_Maps182;
  char v52;
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
  objc_super v76;
  _QWORD v77[7];

  v76.receiver = self;
  v76.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController viewDidLoad](&v76, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("GuidanceSearchResults"));

  v4 = [GuidanceSearchResultsView alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v6 = -[GuidanceSearchResultsView initWithFrame:](v4, "initWithFrame:");
  -[GuidanceSearchResultsViewController setResultsView:](self, "setResultsView:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  objc_msgSend(v8, "setPreservesSuperviewLayoutMargins:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  objc_msgSend(v9, "addSubview:", v10);

  v11 = [ResultsTitleView alloc];
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v15 = -[ResultsTitleView initWithFrame:](v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  resultsTitleView = self->_resultsTitleView;
  self->_resultsTitleView = v15;

  -[ResultsTitleView setTranslatesAutoresizingMaskIntoConstraints:](self->_resultsTitleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "title"));
  -[ResultsTitleView setTitle:](self->_resultsTitleView, "setTitle:", v18);

  -[ResultsTitleView setEditButtonHidden:](self->_resultsTitleView, "setEditButtonHidden:", 1);
  -[GuidanceSearchResultsViewController setHideHeader:](self, "setHideHeader:", 1);
  v19 = [SearchResultsDataSource alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tableView"));
  v22 = -[SearchResultsDataSource initWithTableView:](v19, "initWithTableView:", v21);
  -[GuidanceSearchResultsViewController setDataSource:](self, "setDataSource:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
  objc_msgSend(v23, "setDelegate:", self);

  v24 = sub_1008974F8();
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
  objc_msgSend(v25, "setUsePlaceSummary:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
  objc_msgSend(v26, "setIsPresentingSearchAlongTheRouteResults:", 1);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
  objc_msgSend(v27, "setSearchAlongTheRouteCellDelegate:", self);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "tableView"));
  objc_msgSend(v30, "setDataSource:", v28);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tableView"));
  objc_msgSend(v33, "setDelegate:", v31);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "tableView"));
  objc_msgSend(v35, "setSectionHeaderTopPadding:", 0.0);

  v36 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  containerHeaderView = self->_containerHeaderView;
  self->_containerHeaderView = v36;

  -[ContainerHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_containerHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[ContainerHeaderView setDelegate:](self->_containerHeaderView, "setDelegate:", self);
  -[ContainerHeaderView setTitleView:](self->_containerHeaderView, "setTitleView:", self->_resultsTitleView);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  objc_msgSend(v38, "addSubview:", self->_containerHeaderView);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView leadingAnchor](self->_containerHeaderView, "leadingAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
  v77[0] = v72;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView trailingAnchor](self->_containerHeaderView, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v77[1] = v68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView topAnchor](self->_containerHeaderView, "topAnchor"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
  v77[2] = v64;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "constraintEqualToAnchor:", v60));
  v77[3] = v59;
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:", v55));
  v77[4] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerHeaderView bottomAnchor](self->_containerHeaderView, "bottomAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
  v77[5] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v45));
  v77[6] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v77, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v49 = objc_msgSend(v48, "navigationTransportType");
  switch((int)v49)
  {
    case 1:
    case 6:

      goto LABEL_7;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      break;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
      break;
    default:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v49, v50);
      break;
  }
  v52 = IsEnabled_Maps182;

  if ((v52 & 1) == 0)
LABEL_7:
    -[GuidanceSearchResultsViewModel loadDataIfNeeded](self->_viewModel, "loadDataIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  objc_msgSend(v4, "clearSelection");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containerStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController traitCollection](self, "traitCollection"));
  -[GuidanceSearchResultsViewController _updateLayoutWithContainerStyle:traitCollection:](self, "_updateLayoutWithContainerStyle:traitCollection:", v6, v7);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GuidanceSearchResultsViewController;
  v6 = a3;
  -[GuidanceSearchResultsViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v8, "willTransitionToTraitCollection:withTransitionCoordinator:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", v8.receiver, v8.super_class));
  -[GuidanceSearchResultsViewController _updateLayoutWithContainerStyle:traitCollection:](self, "_updateLayoutWithContainerStyle:traitCollection:", objc_msgSend(v7, "containerStyle"), v6);

}

- (double)_mediumLayoutHeightInSAR
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screen"));

  if (!v5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  objc_msgSend(v5, "bounds");
  if (v7 == 320.0)
  {
    objc_msgSend(v5, "bounds");
    v10 = UIRoundToScreenScale(v5, v9 * 0.330000013);
  }
  else
  {
    v10 = dbl_100E35190[v8 > 750.0];
  }

  return v10;
}

- (BOOL)_isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  if ((objc_msgSend(v3, "isLoading") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
    v4 = objc_msgSend(v6, "count") == 0;

  }
  return v4;
}

- (void)_updateLayoutWithContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  id v5;

  if (sub_1006E6664(a3, a4))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v5, "wantsLayout:", 1);

  }
}

- (void)applyAlphaToContent:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  if (!-[GuidanceSearchResultsViewController isHeaderHidden](self, "isHeaderHidden"))
    -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", a3);
}

- (id)headerView
{
  return self->_containerHeaderView;
}

- (id)contentView
{
  return self->_resultsView;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController willChangeLayout:](&v7, "willChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController navContaineeDelegate](self, "navContaineeDelegate"));
  v6 = v5;
  if (a3 == 1)
    objc_msgSend(v5, "showJunctionViewIfNeeded");
  else
    objc_msgSend(v5, "hideJunctionViewIfNeeded");

}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController willChangeContainerStyle:](&v6, "willChangeContainerStyle:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController traitCollection](self, "traitCollection"));
  -[GuidanceSearchResultsViewController _updateLayoutWithContainerStyle:traitCollection:](self, "_updateLayoutWithContainerStyle:traitCollection:", a3, v5);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v5;
  double v6;
  _BOOL8 v7;
  double v8;
  double result;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  -[ContainerHeaderView systemLayoutSizeFittingSize:](self->_containerHeaderView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v6 = v5;
  v7 = -[GuidanceSearchResultsViewController _isEmpty](self, "_isEmpty");
  if (v7)
  {
    if (a3 == 2)
      return v6;
    else
      return -1.0;
  }
  if (a3 - 3 < 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v12, "availableHeight");
    v14 = v13;

    return v14;
  }
  else
  {
    if (a3 != 2)
    {
      v8 = -1.0;
      if (a3 == 1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v10, "bottomSafeOffset");
        v8 = v6 + v11;

      }
      return v8;
    }
    if (!MapsFeature_IsEnabled_SearchAndDiscovery(v7))
    {
      v16.receiver = self;
      v16.super_class = (Class)GuidanceSearchResultsViewController;
      -[ContaineeViewController heightForLayout:](&v16, "heightForLayout:", 2);
      return v15;
    }
    -[GuidanceSearchResultsViewController _mediumLayoutHeightInSAR](self, "_mediumLayoutHeightInSAR");
  }
  return result;
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (unint64_t)defaultLayoutForContainerStyle:(unint64_t)a3 traitCollection:(id)a4
{
  return sub_1006E6664(a3, a4);
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  +[SARAnalytics captureCancelSearchResults](SARAnalytics, "captureCancelSearchResults", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  objc_msgSend(v5, "cancelResultsView");

}

- (void)headerViewTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController", a3));
  v5 = objc_msgSend(v4, "containeeLayout");

  if (v5 == (id)1)
  {
    +[SARAnalytics captureListTapToShowTray](SARAnalytics, "captureListTapToShowTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v10 = v6;
    v7 = 2;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v9 = objc_msgSend(v8, "containeeLayout");

    if (v9 != (id)2)
      return;
    +[SARAnalytics captureListTapToHideTray](SARAnalytics, "captureListTapToHideTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v10 = v6;
    v7 = 1;
  }
  objc_msgSend(v6, "wantsLayout:", v7);

}

- (void)setHideHeader:(BOOL)a3
{
  double v4;

  if (self->_hideHeader != a3)
  {
    self->_hideHeader = a3;
    if (a3)
      v4 = 0.0;
    else
      v4 = 1.0;
    -[ResultsTitleView setAlpha:](self->_resultsTitleView, "setAlpha:", v4);
    -[ContainerHeaderView setHairLineAlpha:](self->_containerHeaderView, "setHairLineAlpha:", v4);
  }
}

- (void)dataSourceUpdated:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableView"));
  objc_msgSend(v3, "reloadData");

}

- (int)listForDataSource:(id)a3
{
  return 6;
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForSelectedRow"));
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v10, 1);

  v17 = v5;
  v11 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v17, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "results"));
    v15 = objc_msgSend(v14, "indexOfObject:", v12);

    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
      objc_msgSend(v16, "selectMapItemAtIndex:", v15);

    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  objc_super v6;

  y = a4.y;
  v6.receiver = self;
  v6.super_class = (Class)GuidanceSearchResultsViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v6, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x);
  if (y <= 0.0)
  {
    if (y < 0.0)
      +[SARAnalytics captureListScrollUp](SARAnalytics, "captureListScrollUp");
  }
  else
  {
    +[SARAnalytics captureListScrollDown](SARAnalytics, "captureListScrollDown");
  }
}

- (void)searchResultTableViewCellDidTapActionButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableView"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  objc_msgSend(v7, "navigateToItemAtIndex:", objc_msgSend(v8, "row"));

}

- (void)didTapOnAddStopAtIndex:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  objc_msgSend(v4, "navigateToItemAtIndex:", a3);

}

- (void)viewModelWillStartLoading:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView", a3));
  objc_msgSend(v3, "setLoading:", 1);

}

- (void)viewModelDidFinishLoading:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char IsEnabled_Maps182;
  char v16;
  int IsEnabled_DrivingMultiWaypointRoutes;
  void *v18;
  NSMutableArray *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  SearchResult *v25;
  IdenticallyOrderedDataSource *v26;
  void *v27;
  void *v28;
  SearchResultsDataSourceContent *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  +[SARAnalytics captureShowSearchResults:](SARAnalytics, "captureShowSearchResults:", v6);

  -[GuidanceSearchResultsViewController setHideHeader:](self, "setHideHeader:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController resultsView](self, "resultsView"));
  objc_msgSend(v7, "setLoading:", 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
  -[ResultsTitleView setTitle:](self->_resultsTitleView, "setTitle:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subtitle"));
  -[ResultsTitleView setSubtitle:](self->_resultsTitleView, "setSubtitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v13 = objc_msgSend(v12, "navigationTransportType");
  switch((int)v13)
  {
    case 1:
    case 6:
      goto LABEL_8;
    case 2:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182();
      goto LABEL_4;
    case 3:
      IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420();
LABEL_4:
      v16 = IsEnabled_Maps182;

      if ((v16 & 1) == 0)
        goto LABEL_9;
      goto LABEL_7;
    default:
      IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(v13, v14);

      if (IsEnabled_DrivingMultiWaypointRoutes)
      {
LABEL_7:
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController viewModel](self, "viewModel"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headerImage"));
        -[ResultsTitleView setHeaderImage:](self->_resultsTitleView, "setHeaderImage:", v18);

LABEL_8:
      }
LABEL_9:
      v19 = objc_opt_new(NSMutableArray);
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results", 0));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v35;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v35 != v23)
              objc_enumerationMutation(v20);
            v25 = -[SearchResult initWithMapItem:]([SearchResult alloc], "initWithMapItem:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v24));
            -[NSMutableArray addObject:](v19, "addObject:", v25);

            v24 = (char *)v24 + 1;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v22);
      }

      v26 = -[IdenticallyOrderedDataSource initWithObjects:]([IdenticallyOrderedDataSource alloc], "initWithObjects:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeSummaryMetadata"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
      objc_msgSend(v28, "setPlaceSummaryMetadata:", v27);

      v29 = -[SearchResultsDataSourceContent initWithOrderedDataSource:]([SearchResultsDataSourceContent alloc], "initWithOrderedDataSource:", v26);
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceSearchResultsViewController dataSource](self, "dataSource"));
      objc_msgSend(v30, "setContent:", v29);

      if (-[GuidanceSearchResultsViewController _isEmpty](self, "_isEmpty"))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SaR_NoResults"), CFSTR("localized string not found"), 0));
        -[ResultsTitleView setTitle:](self->_resultsTitleView, "setTitle:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v33, "wantsLayout:", 2);
      }
      else
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v33, "updateHeightForCurrentLayout");
      }

      return;
  }
}

- (int)currentUITargetForAnalytics
{
  return 104;
}

- (int)currentMapViewTargetForAnalytics
{
  return 506;
}

- (NavActionCoordination)navContaineeDelegate
{
  return (NavActionCoordination *)objc_loadWeakRetained((id *)&self->_navContaineeDelegate);
}

- (void)setNavContaineeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navContaineeDelegate, a3);
}

- (GuidanceSearchResultsViewModel)viewModel
{
  return self->_viewModel;
}

- (GuidanceSearchResultsView)resultsView
{
  return self->_resultsView;
}

- (void)setResultsView:(id)a3
{
  objc_storeStrong((id *)&self->_resultsView, a3);
}

- (SearchResultsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (BOOL)isHeaderHidden
{
  return self->_hideHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_resultsView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_navContaineeDelegate);
  objc_storeStrong((id *)&self->_resultsTitleView, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
}

@end
