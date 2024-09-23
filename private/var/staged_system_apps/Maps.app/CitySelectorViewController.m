@implementation CitySelectorViewController

- (CitySelectorViewController)initWithSourceGuideLocation:(id)a3
{
  id v4;
  CitySelectorViewController *v5;
  CitySelectorViewController *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CitySelectorAnalyticsManager *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CitySelectorViewController;
  v5 = -[CitySelectorViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    v7 = sub_1002A8AA0(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    v9 = v8;
    if (v7 == 5)
    {
      objc_msgSend(v8, "setAllowResizeInFloatingStyle:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
      objc_msgSend(v10, "setDefaultContaineeLayout:", 3);
    }
    else
    {
      objc_msgSend(v8, "setPresentedModally:", 1);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
      objc_msgSend(v10, "setTakesAvailableHeight:", 1);
    }

    v11 = objc_alloc_init(CitySelectorAnalyticsManager);
    -[CitySelectorViewController setAnalyticsManager:](v6, "setAnalyticsManager:", v11);

    -[CitySelectorViewController setSourceGuideLocation:](v6, "setSourceGuideLocation:", v4);
  }

  return v6;
}

- (void)viewDidLoad
{
  CitySelectorAPIController *v3;
  void *v4;
  CitySelectorAPIController *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CitySelectorViewController;
  -[ContaineeViewController viewDidLoad](&v10, "viewDidLoad");
  -[CitySelectorViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CitySelectorView"));
  objc_initWeak(&location, self);
  v3 = [CitySelectorAPIController alloc];
  objc_copyWeak(&v8, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController traits](self, "traits", _NSConcreteStackBlock, 3221225472, sub_10050C1B8, &unk_1011B9C58));
  v5 = -[CitySelectorAPIController initWithStateChangeHandler:usingTraits:](v3, "initWithStateChangeHandler:usingTraits:", &v7, v4);
  -[CitySelectorViewController setApiController:](self, "setApiController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
  objc_msgSend(v6, "fetchCitySelectorView:", &stru_1011B9C78);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CitySelectorViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10050C2C4;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &stru_1011B9C98);

}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CitySelectorViewController;
  -[ContaineeViewController didChangeLayout:](&v6, "didChangeLayout:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));

  if (v4)
  {
    -[CitySelectorViewController resetCollectionViewLayout](self, "resetCollectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "setContentOffset:", CGPointZero.x, CGPointZero.y);

  }
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
  objc_msgSend(v5, "cancelFetchingCitySelectorView");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController dataSource](self, "dataSource"));
  objc_msgSend(v6, "dismissedCitySelector");

  v7.receiver = self;
  v7.super_class = (Class)CitySelectorViewController;
  -[ContaineeViewController handleDismissAction:](&v7, "handleDismissAction:", v4);

}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5;
  double result;
  objc_super v7;

  v5 = sub_1002A8AA0(self);
  if (a3 != 1 || (result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)CitySelectorViewController;
    -[ContaineeViewController heightForLayout:](&v7, "heightForLayout:", a3);
  }
  return result;
}

- (void)routeToGuideLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showGuidesHome:", self, v4);

}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  v7 = sub_10050C5E8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = sub_10050C5E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DisplayingCitySelectorView", ", v14, 2u);
  }

  if (a3 == 3)
  {
    if (a4 != 1)
      return;
    -[CitySelectorViewController removeErrorView](self, "removeErrorView");
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    if (a4 == 3)
    {
      -[CitySelectorViewController removeLoadingView](self, "removeLoadingView");
      -[CitySelectorViewController removeCollectionView](self, "removeCollectionView");
      -[CitySelectorViewController addErrorView](self, "addErrorView");
    }
    else if (a4 == 2)
    {
      -[CitySelectorViewController removeLoadingView](self, "removeLoadingView");
      -[CitySelectorViewController addAllCollectionsView](self, "addAllCollectionsView");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
      -[CitySelectorViewController activateConstraintsForViewPinnedBelowHeader:](self, "activateConstraintsForViewPinnedBelowHeader:", v13);

    }
  }
  else if (!a3 && a4 == 1)
  {
    -[CitySelectorViewController addHeaderView](self, "addHeaderView");
    -[CitySelectorViewController activateHeaderConstraints](self, "activateHeaderConstraints");
LABEL_11:
    -[CitySelectorViewController addLoadingView](self, "addLoadingView");
  }
}

- (void)initializeSections
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController sections](self, "sections"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = objc_alloc((Class)NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "citySelectorSections"));
    v8 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v7, "count"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "citySelectorSections"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10050C74C;
    v12[3] = &unk_1011B23E8;
    v12[4] = self;
    v13 = v8;
    v11 = v8;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

    -[CitySelectorViewController setSections:](self, "setSections:", v11);
  }
}

- (void)initializeDataSource
{
  void *v3;
  CitySelectorDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CitySelectorDataSource *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController dataSource](self, "dataSource"));

  if (!v3)
  {
    v4 = [CitySelectorDataSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "citySelectorResult"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController sections](self, "sections"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController apiController](self, "apiController"));
    v11 = objc_msgSend(v10, "batchSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController sourceGuideLocation](self, "sourceGuideLocation"));
    v13 = -[CitySelectorDataSource initWithCollectionView:result:sections:routingDelegate:usingCollectionFetcher:usingBatchSize:selectedGuideLocation:](v4, "initWithCollectionView:result:sections:routingDelegate:usingCollectionFetcher:usingBatchSize:selectedGuideLocation:", v5, v7, v8, self, v9, v11, v12);
    -[CitySelectorViewController setDataSource:](self, "setDataSource:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController dataSource](self, "dataSource"));
    objc_msgSend(v14, "setDelegate:", self);

    v15 = (id)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController analyticsManager](self, "analyticsManager"));
    objc_msgSend(v15, "citySelectorRevealed");

  }
}

- (void)addHeaderView
{
  void *v3;
  ContainerHeaderView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));

  if (!v3)
  {
    v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[CitySelectorViewController setTitleHeaderView:](self, "setTitleHeaderView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    v6 = sub_1002A8AA0(v5);

    if (v6 == 5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle3, 1024));
      objc_msgSend(v7, "setCustomTitleFont:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    LODWORD(v11) = 1148846080;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Cities [City Selector View]"), CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v14, "setTitle:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v15, "setDelegate:", self);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v16, "setHairLineAlpha:", 0.0);

    v17 = sub_1002A8AA0(self) != 5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v18, "setHeaderSize:", v17);

    v20 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v20, "addSubview:", v19);

  }
}

- (void)activateHeaderConstraints
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
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController titleHeaderView](self, "titleHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)addAllCollectionsView
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  id v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));

  if (!v3)
  {
    v4 = objc_alloc((Class)UICollectionView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = objc_alloc_init((Class)UICollectionViewLayout);
    v15 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v14, v7, v9, v11, v13);
    -[CitySelectorViewController setCollectionView:](self, "setCollectionView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v18, "setBackgroundColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v19, "setBounces:", 1);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v20, "setAlwaysBounceVertical:", 1);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v21, "addSubview:", v22);

  }
  -[CitySelectorViewController initializeSections](self, "initializeSections");
  -[CitySelectorViewController initializeDataSource](self, "initializeDataSource");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v24, "frame");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController createLayoutUsingWidth:](self, "createLayoutUsingWidth:", v25));
  objc_msgSend(v23, "setCollectionViewLayout:", v26);

  v27 = (id)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController dataSource](self, "dataSource"));
  objc_msgSend(v27, "displayCitySelectorData");

}

- (void)removeCollectionView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[CitySelectorViewController setCollectionView:](self, "setCollectionView:", 0);
    -[CitySelectorViewController setDataSource:](self, "setDataSource:", 0);
  }
}

- (id)createLayoutUsingWidth:(double)a3
{
  id v5;
  id v6;
  _QWORD v8[6];

  v5 = objc_alloc_init((Class)UICollectionViewCompositionalLayoutConfiguration);
  objc_msgSend(v5, "setInterSectionSpacing:", 6.0);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10050D16C;
  v8[3] = &unk_1011B9CC0;
  v8[4] = self;
  *(double *)&v8[5] = a3;
  v6 = objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:configuration:", v8, v5);

  return v6;
}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  _QWORD v22[4];

  v4 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v22[0] = v18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v22[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v8));
  v22[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
  v22[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

}

- (void)resetCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v4, "invalidateLayout");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v5, "frame");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController createLayoutUsingWidth:](self, "createLayoutUsingWidth:", v6));
  objc_msgSend(v8, "setCollectionViewLayout:", v7);

}

- (void)addLoadingView
{
  dispatch_time_t v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10050D540;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController loadingView](self, "loadingView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController loadingView](self, "loadingView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[CitySelectorViewController setLoadingView:](self, "setLoadingView:", 0);
  }
}

- (void)addErrorView
{
  void *v3;
  ErrorModeView *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));

  if (!v3)
  {
    v4 = objc_alloc_init(ErrorModeView);
    -[CitySelectorViewController setErrorView:](self, "setErrorView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("[City Selector] Error Mode title"), CFSTR("localized string not found"), 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[City Selector] Error Mode message"), CFSTR("localized string not found"), 0));

    v11 = MKCurrentNetworkConnectionFailureDiagnosis(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));
    v13 = v12;
    if (v11)
    {
      objc_msgSend(v12, "setTitle:andMessage:", v6, v8);

      objc_initWeak(&location, self);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
      v22 = _NSConcreteStackBlock;
      v23 = 3221225472;
      v24 = sub_10050D98C;
      v25 = &unk_1011B4EB8;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v14, "setButtonTitle:glyphName:backgroundColor:handler:", CFSTR("Try Again"), CFSTR("arrow.clockwise"), v15, &v22);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead));
      objc_msgSend(v13, "setTitleLabelFont:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));
      objc_msgSend(v17, "setTitle:andMessage:", v6, 0);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView", v22, v23, v24, v25));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));
    objc_msgSend(v19, "addSubview:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));
    -[CitySelectorViewController activateConstraintsForViewPinnedBelowHeader:](self, "activateConstraintsForViewPinnedBelowHeader:", v21);

  }
}

- (void)removeErrorView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController errorView](self, "errorView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[CitySelectorViewController setErrorView:](self, "setErrorView:", 0);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  unsigned int v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CitySelectorViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v9, "scrollViewDidScroll:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CitySelectorViewController collectionView](self, "collectionView"));
  v5 = objc_msgSend(v4, "_maps_shouldShowTopHairline");

  v6 = 0.0;
  if (v5)
    v6 = 1.0;
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10050DB30;
  v8[3] = &unk_1011B22D8;
  v8[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10050DB44;
  v7[3] = &unk_1011B2300;
  +[UIScrollView _maps_updateTopHairlineAlpha:animated:getter:setter:](UIScrollView, "_maps_updateTopHairlineAlpha:animated:getter:setter:", 1, v8, v7, v6);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (CitySelectorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (UICollectionViewCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (CitySelectorAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (CitySelectorAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (GEOGuideLocation)sourceGuideLocation
{
  return self->_sourceGuideLocation;
}

- (void)setSourceGuideLocation:(id)a3
{
  objc_storeStrong((id *)&self->_sourceGuideLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceGuideLocation, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
