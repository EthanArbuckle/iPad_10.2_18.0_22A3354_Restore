@implementation AllCollectionsViewController

- (AllCollectionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  AllCollectionsViewController *v4;
  AllCollectionsViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AllCollectionsViewController;
  v4 = -[AllCollectionsViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  v5 = v4;
  if (v4)
  {
    v6 = sub_1002A8AA0(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
    v8 = v7;
    if (v6 == 5)
    {
      objc_msgSend(v7, "setAllowResizeInFloatingStyle:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
      objc_msgSend(v9, "setDefaultContaineeLayout:", 3);
    }
    else
    {
      objc_msgSend(v7, "setPresentedModally:", 1);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v5, "cardPresentationController"));
      objc_msgSend(v9, "setTakesAvailableHeight:", 1);
    }

  }
  return v5;
}

- (void)viewDidLoad
{
  AllCollectionsAPIController *v3;
  void *v4;
  AllCollectionsAPIController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AllCollectionsViewController;
  -[ContaineeViewController viewDidLoad](&v11, "viewDidLoad");
  objc_initWeak(&location, self);
  v3 = [AllCollectionsAPIController alloc];
  objc_copyWeak(&v9, &location);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController traits](self, "traits", _NSConcreteStackBlock, 3221225472, sub_100880DE8, &unk_1011B9C58));
  v5 = -[AllCollectionsAPIController initWithOnStateChangeHandler:usingTraits:](v3, "initWithOnStateChangeHandler:usingTraits:", &v8, v4);
  -[AllCollectionsViewController setApiController:](self, "setApiController:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController view](self, "view"));
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("AllCollections"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
  objc_msgSend(v7, "fetchAllCollectionsViewForKeywordFilter:addressFilter:onCompletion:", 0, 0, &stru_1011D9CA0);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AllCollectionsViewController;
  -[ContaineeViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
  objc_msgSend(v4, "cancelFetchingAllCollections");

}

- (void)didChangeLayout:(unint64_t)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AllCollectionsViewController;
  -[ContaineeViewController didChangeLayout:](&v6, "didChangeLayout:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));

  if (v4)
  {
    -[AllCollectionsViewController resetCollectionViewLayout](self, "resetCollectionViewLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
  objc_msgSend(v5, "cancelFetchingAllCollections");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
  objc_msgSend(v6, "dismissedCollections");

  v7.receiver = self;
  v7.super_class = (Class)AllCollectionsViewController;
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
    v7.super_class = (Class)AllCollectionsViewController;
    -[ContaineeViewController heightForLayout:](&v7, "heightForLayout:", a3);
  }
  return result;
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
  id v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v7 = sub_1008811C8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = sub_1008811C8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DisplayingAllCollectionsView", ", buf, 2u);
  }

  switch(a3)
  {
    case 0:
      if (a4 == 1)
      {
        -[AllCollectionsViewController addHeaderView](self, "addHeaderView");
        -[AllCollectionsViewController activateHeaderConstraints](self, "activateHeaderConstraints");
        goto LABEL_14;
      }
      break;
    case 1:
      if (a4 == 3)
      {
        -[AllCollectionsViewController removeLoadingView](self, "removeLoadingView");
        -[AllCollectionsViewController removeCollectionView](self, "removeCollectionView");
        -[AllCollectionsViewController addErrorView](self, "addErrorView");
      }
      else if (a4 == 2)
      {
        -[AllCollectionsViewController removeLoadingView](self, "removeLoadingView");
        -[AllCollectionsViewController addAllCollectionsView](self, "addAllCollectionsView");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
        -[AllCollectionsViewController activateConstraintsForViewPinnedBelowHeader:](self, "activateConstraintsForViewPinnedBelowHeader:", v13);

      }
      break;
    case 2:
      if (a4 == 1)
        goto LABEL_14;
      break;
    case 3:
      if (a4 == 1)
      {
        -[AllCollectionsViewController removeErrorView](self, "removeErrorView");
LABEL_14:
        -[AllCollectionsViewController addLoadingView](self, "addLoadingView");
      }
      break;
    default:
      break;
  }
  v14 = sub_1008811C8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, v9, "DisplayingAllCollectionsView", ", v17, 2u);
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
  void *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));

  if (!v3)
  {
    v4 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[AllCollectionsViewController setTitleHeaderView:](self, "setTitleHeaderView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    v6 = sub_1002A8AA0(v5);

    if (v6 == 5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle3, 1024));
      objc_msgSend(v7, "setCustomTitleFont:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    LODWORD(v11) = 1148846080;
    objc_msgSend(v10, "setContentCompressionResistancePriority:forAxis:", 1, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("All Collections [All Collections View]"), CFSTR("localized string not found"), 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v14, "setTitle:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v15, "setDelegate:", self);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v16, "setHairLineAlpha:", 0.0);

    v17 = sub_1002A8AA0(self) != 5;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v18, "setHeaderSize:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v19, "setAccessibilityIdentifier:", CFSTR("AllCollectionsTitleHeaderView"));

    v21 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v21, "addSubview:", v20);

  }
}

- (void)initializeSections
{
  void *v3;
  id v4;
  AllCollectionsSection *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  AllCollectionsSection *v10;
  AllCollectionsSection *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  AllCollectionsSection *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController sections](self, "sections"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    v5 = [AllCollectionsSection alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v6, "frame");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    v10 = -[AllCollectionsSection initWithSectionIndex:usingMaxWidth:usingTraitEnvironment:](v5, "initWithSectionIndex:usingMaxWidth:usingTraitEnvironment:", 0, v9, v8);
    objc_msgSend(v17, "addObject:", v10);

    v11 = [AllCollectionsSection alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v12, "frame");
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    v16 = -[AllCollectionsSection initWithSectionIndex:usingMaxWidth:usingTraitEnvironment:](v11, "initWithSectionIndex:usingMaxWidth:usingTraitEnvironment:", 1, v15, v14);
    objc_msgSend(v17, "addObject:", v16);

    -[AllCollectionsViewController setSections:](self, "setSections:", v17);
  }
}

- (void)initializeDataSource
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AllCollectionsDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  AllCollectionsDataSource *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionResults"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100881794;
  v18[3] = &unk_1011C9BF8;
  v17 = v3;
  v19 = v17;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v18);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allCollectionViewIdentifiers"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
    objc_msgSend(v9, "updateCollections:usingBatchIdentifiers:", v17, v7);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allCollectionViewFilters"));

    v11 = [AllCollectionsDataSource alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController sections](self, "sections"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController apiController](self, "apiController"));
    v15 = -[AllCollectionsDataSource initWithCollectionView:usingCuratedCollections:usingPlaceCollectionIds:withResultFilters:sections:usingAPIController:withRoutingDelegate:](v11, "initWithCollectionView:usingCuratedCollections:usingPlaceCollectionIds:withResultFilters:sections:usingAPIController:withRoutingDelegate:", v12, v17, v7, v9, v13, v14, self);
    -[AllCollectionsViewController setDataSource:](self, "setDataSource:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
    objc_msgSend(v16, "setDelegate:", self);

  }
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
  void *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));

  if (!v3)
  {
    v4 = objc_alloc((Class)UICollectionView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v14, "frame");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController createLayoutUsingWidth:](self, "createLayoutUsingWidth:", v15));
    v17 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v16, v7, v9, v11, v13);
    -[AllCollectionsViewController setCollectionView:](self, "setCollectionView:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v20, "setBackgroundColor:", v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v21, "setBounces:", 1);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v22, "setAlwaysBounceVertical:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v23, "setAccessibilityIdentifier:", CFSTR("AllCollectionsCollectionView"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v24, "addSubview:", v25);

  }
  -[AllCollectionsViewController initializeSections](self, "initializeSections");
  -[AllCollectionsViewController initializeDataSource](self, "initializeDataSource");
  v26 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
  objc_msgSend(v26, "displayAllCollectionsData");

}

- (void)removeCollectionView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[AllCollectionsViewController setCollectionView:](self, "setCollectionView:", 0);
    -[AllCollectionsViewController setDataSource:](self, "setDataSource:", 0);
  }
}

- (id)createLayoutUsingWidth:(double)a3
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100881AB4;
  v4[3] = &unk_1011B9CC0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  return objc_msgSend(objc_alloc((Class)UICollectionViewCompositionalLayout), "initWithSectionProvider:", v4);
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

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController titleHeaderView](self, "titleHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

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

- (void)addLoadingView
{
  dispatch_time_t v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100882060;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController loadingView](self, "loadingView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController loadingView](self, "loadingView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[AllCollectionsViewController setLoadingView:](self, "setLoadingView:", 0);
  }
}

- (void)addErrorView
{
  void *v3;
  void *v4;
  ErrorModeView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
    objc_msgSend(v4, "clearAllCollectionsData");

    v5 = objc_alloc_init(ErrorModeView);
    -[AllCollectionsViewController setErrorView:](self, "setErrorView:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Error Mode title"), CFSTR("localized string not found"), 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Error Mode message"), CFSTR("localized string not found"), 0));

    v12 = MKCurrentNetworkConnectionFailureDiagnosis(v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "setTitle:andMessage:", v7, v9);

      objc_initWeak(&location, self);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
      v24 = _NSConcreteStackBlock;
      v25 = 3221225472;
      v26 = sub_100882508;
      v27 = &unk_1011B4EB8;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v15, "setButtonTitle:glyphName:backgroundColor:handler:", CFSTR("Try Again"), CFSTR("arrow.clockwise"), v16, &v24);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead));
      objc_msgSend(v14, "setTitleLabelFont:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
      objc_msgSend(v18, "setTitle:andMessage:", v7, 0);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView", v24, v25, v26, v27));
    objc_msgSend(v19, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
    objc_msgSend(v20, "setAccessibilityIdentifier:", CFSTR("AllCollectionsErrorView"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
    objc_msgSend(v21, "addSubview:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
    -[AllCollectionsViewController activateConstraintsForViewPinnedBelowHeader:](self, "activateConstraintsForViewPinnedBelowHeader:", v23);

  }
}

- (void)removeErrorView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController errorView](self, "errorView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[AllCollectionsViewController setErrorView:](self, "setErrorView:", 0);
  }
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
  v9.super_class = (Class)AllCollectionsViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008826A8;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &stru_1011D9CE0);

}

- (void)resetCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v4, "invalidateLayout");

  v8 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v5, "frame");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController createLayoutUsingWidth:](self, "createLayoutUsingWidth:", v6));
  objc_msgSend(v8, "setCollectionViewLayout:", v7);

}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

}

- (void)pptPresentFirstCollection
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[AllCollectionsViewController dataSource](self, "dataSource"));
  objc_msgSend(v2, "presentFirstCollection");

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

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (UICollectionViewCompositionalLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (AllCollectionsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (NSDiffableDataSourceSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)setSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_snapshot, a3);
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

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (AllCollectionsAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_layout, 0);
}

@end
