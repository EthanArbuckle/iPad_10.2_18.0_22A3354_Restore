@implementation CuratedCollectionViewController

- (CuratedCollectionViewController)initWithCuratedCollectionIdentifier:(id)a3
{
  id v4;
  CuratedCollectionViewController *v5;
  MapsThemeTableView *v6;
  MapsThemeTableView *tableView;
  CuratedCollectionProvider *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CuratedCollectionViewController;
  v5 = -[CuratedCollectionViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v5->_tableView;
    v5->_tableView = v6;

    -[MapsThemeTableView setAccessibilityIdentifier:](v5->_tableView, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionTableView"));
    v8 = -[CuratedCollectionProvider initWithTableView:curatedCollectionIdentifier:]([CuratedCollectionProvider alloc], "initWithTableView:curatedCollectionIdentifier:", v5->_tableView, v4);
    -[CuratedCollectionViewController _commonInitWithCuratedCollectionProvider:identifier:](v5, "_commonInitWithCuratedCollectionProvider:identifier:", v8, v4);

  }
  return v5;
}

- (CuratedCollectionViewController)initWithFullyClientizedPlaceCollection:(id)a3
{
  id v4;
  CuratedCollectionViewController *v5;
  MapsThemeTableView *v6;
  MapsThemeTableView *tableView;
  CuratedCollectionProvider *v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CuratedCollectionViewController;
  v5 = -[CuratedCollectionViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", 0, 0);
  if (v5)
  {
    v6 = -[MapsThemeTableView initWithFrame:]([MapsThemeTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tableView = v5->_tableView;
    v5->_tableView = v6;

    v8 = -[CuratedCollectionProvider initWithTableView:fullyClientizedCuratedCollection:]([CuratedCollectionProvider alloc], "initWithTableView:fullyClientizedCuratedCollection:", v5->_tableView, v4);
    v9 = objc_alloc((Class)MKMapItemIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionIdentifier"));
    v11 = objc_msgSend(v9, "initWithGEOMapItemIdentifier:", v10);

    -[CuratedCollectionViewController _commonInitWithCuratedCollectionProvider:identifier:](v5, "_commonInitWithCuratedCollectionProvider:identifier:", v8, v11);
    -[CuratedCollectionViewAnalyticsController updateWithPlaceCollection:](v5->_analyticsController, "updateWithPlaceCollection:", v4);

  }
  return v5;
}

- (void)_commonInitWithCuratedCollectionProvider:(id)a3 identifier:(id)a4
{
  id v7;
  ContainerHeaderView *v8;
  ContainerHeaderView *fakeHeaderView;
  CuratedCollectionHeaderView *v10;
  CuratedCollectionHeaderView *cardHeaderView;
  CuratedCollectionViewAnalyticsController *v12;
  CuratedCollectionViewAnalyticsController *analyticsController;
  void *v14;
  void *v15;
  void *v16;
  LoadingModeView *v17;
  void *v18;
  void *v19;
  LoadingModeView *v20;
  LoadingModeView *loadingView;
  id v22;

  v22 = a3;
  objc_storeStrong((id *)&self->_collectionProvider, a3);
  v7 = a4;
  -[DataSource setDelegate:](self->_collectionProvider, "setDelegate:", self);
  -[MapsThemeTableView setPreservesSuperviewLayoutMargins:](self->_tableView, "setPreservesSuperviewLayoutMargins:", 1);
  v8 = -[ContainerHeaderView initWithFrame:]([ContainerHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  fakeHeaderView = self->_fakeHeaderView;
  self->_fakeHeaderView = v8;

  v10 = -[CuratedCollectionHeaderView initWithDelegate:]([CuratedCollectionHeaderView alloc], "initWithDelegate:", self);
  cardHeaderView = self->_cardHeaderView;
  self->_cardHeaderView = v10;

  v12 = -[CuratedCollectionViewAnalyticsController initWithCollectionIdentifier:]([CuratedCollectionViewAnalyticsController alloc], "initWithCollectionIdentifier:", v7);
  analyticsController = self->_analyticsController;
  self->_analyticsController = v12;

  -[CuratedCollectionViewAnalyticsController logRevealCuratedCollectionView](self->_analyticsController, "logRevealCuratedCollectionView");
  -[CuratedCollectionProvider setAnalyticsController:](self->_collectionProvider, "setAnalyticsController:", self->_analyticsController);
  if (sub_1002A8AA0(self) == 5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v14, "setAllowResizeInFloatingStyle:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v15, "setDefaultContaineeLayout:", 3);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v16, "setGrabberBlurEnabled:", 1);

  v17 = [LoadingModeView alloc];
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
  v20 = -[LoadingModeView initWithTitle:](v17, "initWithTitle:", v19);
  loadingView = self->_loadingView;
  self->_loadingView = v20;

  -[LoadingModeView setTranslatesAutoresizingMaskIntoConstraints:](self->_loadingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
}

- (id)keyCommands
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionViewController;
  v3 = -[ContaineeViewController keyCommands](&v11, "keyCommands");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController presentedViewController](self, "presentedViewController"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyCommands"));
    objc_msgSend(v5, "addObjectsFromArray:", v8);

  }
  v9 = objc_msgSend(v5, "copy");

  return v9;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyCommands"));
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CuratedCollectionViewController;
    v11 = -[CuratedCollectionViewController targetForAction:withSender:](&v14, "targetForAction:withSender:", a3, v6);
    v10 = objc_claimAutoreleasedReturnValue(v11);
  }
  v12 = (void *)v10;

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
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
  id v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t spid;
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
  unint64_t v43;
  uint8_t buf[16];
  objc_super v45;
  _QWORD v46[4];

  v45.receiver = self;
  v45.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController viewDidLoad](&v45, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CuratedCollectionView"));

  v4 = sub_1004DB2EC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_signpost_id_generate(v5);

  v7 = sub_1004DB2EC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  v43 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "DisplayingCuratedCollectionsView", ", buf, 2u);
  }
  spid = v6;

  -[MapsThemeTableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MapsThemeTableView setBackgroundColor:](self->_tableView, "setBackgroundColor:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView layer](self->_tableView, "layer"));
  objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  objc_msgSend(v13, "setDelegate:", self);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  objc_msgSend(v14, "setHairLineAlpha:", 0.0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  objc_msgSend(v15, "addSubview:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "topAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v39));
  v46[0] = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v46[1] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v19));
  v46[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v24));
  v46[3] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v46, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  -[CuratedCollectionViewController _attachLoadingView](self, "_attachLoadingView");
  -[CuratedCollectionProvider startResolvingCollection](self->_collectionProvider, "startResolvingCollection");
  v27 = sub_1004DB2EC();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, spid, "DisplayingCuratedCollectionsView", ", buf, 2u);
  }

}

- (void)_attachLoadingView
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004DB3A0;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionViewController;
  -[CuratedCollectionViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  if (((-[CuratedCollectionViewController isMovingFromParentViewController](self, "isMovingFromParentViewController") & 1) != 0|| sub_1002A8AA0(self) == 5)&& self->_wantsInsertInHistoryOnDismiss)
  {
    -[CuratedCollectionViewController _insertInHistory](self, "_insertInHistory");
  }
}

- (void)didBecomeCurrent
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController didBecomeCurrent](&v5, "didBecomeCurrent");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController updateContentInjection](self, "updateContentInjection"));

  if (v3)
  {
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController updateContentInjection](self, "updateContentInjection"));
    ((void (**)(_QWORD, CuratedCollectionViewController *))v4)[2](v4, self);

  }
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  unint64_t v13;
  _BOOL4 v15;
  objc_super v16;

  if (self->_layout != a3)
  {
    self->_layout = a3;
    self->_isChangingLayout = 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  v16.receiver = self;
  v16.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController willChangeLayout:](&v16, "willChangeLayout:", a3);
  if (a3 >= 2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v8 = objc_msgSend(v7, "containeeLayout");

    if ((unint64_t)v8 < a3)
      -[CuratedCollectionViewAnalyticsController logPullUpCuratedCollectionView](self->_analyticsController, "logPullUpCuratedCollectionView");
  }
  -[CuratedCollectionViewController _updateHeaderTransition](self, "_updateHeaderTransition");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  objc_msgSend(v10, "frame");
  objc_msgSend(v9, "setVerticalAdjustment:", -v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v13 = (unint64_t)objc_msgSend(v12, "containerStyle");

  v15 = v13 - 1 < 2 || (v13 & 0xFFFFFFFFFFFFFFFELL) == 4;
  if (a3 - 3 <= 1 && v15)
  {
    if (v6)
      -[CuratedCollectionViewController _setWantsInsertInHistory](self, "_setWantsInsertInHistory");
  }
}

- (void)didChangeLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController didChangeLayout:](&v4, "didChangeLayout:", a3);
  self->_isChangingLayout = 0;
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
  v9.super_class = (Class)CuratedCollectionViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1004DB9A4;
  v8[3] = &unk_1011AEDC8;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, &stru_1011B9008);

}

- (double)heightForLayout:(unint64_t)a3
{
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  if (a3 == 2)
  {
    if (sub_1002A8AA0(self) == 5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
      objc_msgSend(v6, "unscrolledHeightForLayout:transitionFraction:", 4, 0.0);
      v5 = v8 + 6.0;
      goto LABEL_7;
    }
LABEL_8:
    v11.receiver = self;
    v11.super_class = (Class)CuratedCollectionViewController;
    -[ContaineeViewController heightForLayout:](&v11, "heightForLayout:", a3);
    return v9;
  }
  if (a3 != 1)
    goto LABEL_8;
  v5 = -1.0;
  if (sub_1002A8AA0(self) != 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
    objc_msgSend(v6, "unscrolledHeightForLayout:transitionFraction:", 0, 0.0);
    v5 = v7;
LABEL_7:

  }
  return v5;
}

- (void)applyAlphaToContent:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController applyAlphaToContent:](&v5, "applyAlphaToContent:");
  -[MapsThemeTableView setAlpha:](self->_tableView, "setAlpha:", a3);
}

- (void)setCuratedCollection:(id)a3
{
  GEOPlaceCollection *v5;
  GEOPlaceCollection **p_curatedCollection;
  void *v7;
  void *v8;
  void *v9;
  GEOPlaceCollection *v10;

  v5 = (GEOPlaceCollection *)a3;
  p_curatedCollection = &self->_curatedCollection;
  if (self->_curatedCollection != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    -[CuratedCollectionViewAnalyticsController updateWithPlaceCollection:](self->_analyticsController, "updateWithPlaceCollection:", *p_curatedCollection);
    if ((-[GEOPlaceCollection isSuppressed](*p_curatedCollection, "isSuppressed") & 1) != 0
      || -[GEOPlaceCollection isBlocked](*p_curatedCollection, "isBlocked"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
      objc_msgSend(v7, "removeFromSuperview");

      -[MapsThemeTableView removeFromSuperview](self->_tableView, "removeFromSuperview");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v8, "wantsLayout:", 2);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOPlaceCollection collectionTitle](*p_curatedCollection, "collectionTitle"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
      objc_msgSend(v9, "setTitle:", v8);

    }
    v5 = v10;
  }

}

- (void)_updateHeaderAndTableViewValues
{
  double v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL4 hasBeenInFullLayout;
  _BOOL4 v12;
  double v13;
  double v14;
  void *v15;
  CGRect v16;

  if (!self->_hasFinishedResolving)
    return;
  -[CuratedCollectionHeaderView unscrolledHeightForCurrentLayout](self->_cardHeaderView, "unscrolledHeightForCurrentLayout");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "availableHeight");
  if (v4 >= v6 + -10.0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "availableHeight");
    v4 = v8 + -10.0;

  }
  v9 = -[CuratedCollectionHeaderView layout](self->_cardHeaderView, "layout");
  if (v9 < 3)
  {
    v10 = 0;
LABEL_11:
    self->_hasBeenInFullLayout = 0;
    v12 = 1;
    goto LABEL_13;
  }
  if (v9 == 3)
  {
    v10 = (uint64_t)-[MapsThemeTableView isScrollEnabled](self->_tableView, "isScrollEnabled");
    goto LABEL_11;
  }
  if (v9 == 4)
  {
    hasBeenInFullLayout = self->_hasBeenInFullLayout;
    v10 = 1;
    self->_hasBeenInFullLayout = 1;
    v12 = !hasBeenInFullLayout;
  }
  else
  {
    v12 = 0;
    v10 = 1;
  }
LABEL_13:
  -[MapsThemeTableView setScrollEnabled:](self->_tableView, "setScrollEnabled:", v10);
  -[CuratedCollectionProvider subheaderFrame](self->_collectionProvider, "subheaderFrame");
  -[CuratedCollectionHeaderView setTableViewSubheaderContentHeight:](self->_cardHeaderView, "setTableViewSubheaderContentHeight:", CGRectGetMaxY(v16));
  -[MapsThemeTableView contentOffset](self->_tableView, "contentOffset");
  if (v12)
    v14 = -v4;
  else
    v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  objc_msgSend(v15, "safeAreaInsets");
  -[MapsThemeTableView setContentInset:](self->_tableView, "setContentInset:", v4, 0.0);

  if (v12)
    -[MapsThemeTableView setContentOffset:](self->_tableView, "setContentOffset:", 0.0, v14);
  -[CuratedCollectionHeaderView setTableViewContentOffset:](self->_cardHeaderView, "setTableViewContentOffset:", v14);
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CuratedCollectionViewController;
  -[CuratedCollectionViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[CuratedCollectionViewController _updateHeaderAndTableViewValues](self, "_updateHeaderAndTableViewValues");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double MaxY;
  void *v5;
  objc_super v6;
  CGRect v7;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
    -[CuratedCollectionViewController _updateHeaderTransition](self, "_updateHeaderTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v3, "bounds");
  MaxY = CGRectGetMaxY(v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  objc_msgSend(v5, "safeAreaInsets");
  -[MapsThemeTableView setScrollIndicatorInsets:](self->_tableView, "setScrollIndicatorInsets:", MaxY, 0.0);

}

- (void)handleDismissAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  if (!objc_msgSend(v5, "isSuppressed"))
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  v8 = objc_msgSend(v6, "collectionIsSaved:", v7);

  if (v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
    objc_msgSend(v5, "removeSavedCuratedCollection:completion:", v9, 0);

LABEL_4:
  }
  v11.receiver = self;
  v11.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController handleDismissAction:](&v11, "handleDismissAction:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v10, "logClose");

}

- (void)_updateHeaderTransition
{
  double v3;
  double v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;

  v3 = 1.0;
  v4 = 0.0;
  if (sub_1002A8AA0(self) == 5
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController")),
        v6 = objc_msgSend(v5, "containerStyle"),
        v5,
        v6 == (id)6))
  {
    v7 = 4;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v9, "transitionProgressFromLayout:toLayout:", 2, 3);
    v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v12, "transitionProgressFromLayout:toLayout:", 1, 2);
    v4 = v13;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    v15 = objc_msgSend(v14, "containerStyle");

    if (v15 == (id)4)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v16, "transitionProgressFromLayout:toLayout:", 1, 3);
      v18 = v17;

      if (v18 < 0.5)
        v11 = 0.0;
      else
        v11 = v18 + -0.5 + v18 + -0.5;
      if (v18 < 0.5)
        v4 = v18 + v18;
      else
        v4 = 1.0;
    }
    v3 = 0.0;
    if (v11 == 0.0 && v4 == 0.0)
    {
      v7 = 0;
      v4 = 0.0;
    }
    else if (v11 == 0.0 && v4 < 1.0)
    {
      v7 = 1;
    }
    else if (v11 > 0.0 && v11 < 1.0 && v4 == 1.0)
    {
      v7 = 3;
      v4 = v11;
      v3 = v11;
    }
    else
    {
      v4 = 0.0;
      if (v11 == 1.0)
        v3 = 1.0;
      else
        v3 = 0.0;
      if (v11 == 1.0)
        v7 = 4;
      else
        v7 = 2;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v8, "setLayout:transitionFraction:", v7, v4);

  -[CuratedCollectionViewController _updateHeaderAndTableViewValues](self, "_updateHeaderAndTableViewValues");
  -[CuratedCollectionProvider setSubheaderTransitionFraction:](self->_collectionProvider, "setSubheaderTransitionFraction:", v3);
}

- (void)_setWantsInsertInHistory
{
  if (sub_1002A8AA0(self) == 5)
    self->_wantsInsertInHistoryOnDismiss = 1;
  else
    -[CuratedCollectionViewController _insertInHistory](self, "_insertInHistory");
}

- (void)_insertInHistory
{
  void *v3;

  if (!self->_didInsertInHistory && self->_hasFinishedResolving)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
    +[HistoryEntryRecentsItem saveCuratedCollection:completion:](HistoryEntryRecentsItem, "saveCuratedCollection:completion:", v3, &stru_1011B9028);

    self->_didInsertInHistory = 1;
  }
}

- (id)menuForQuickActionButton
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
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  void *v42;
  void *v43;
  _QWORD v44[2];
  void *v45;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  if (+[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Save_Curated_Collection_Library_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Save_Curated_Collection_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1004DC9F0;
  v39[3] = &unk_1011AF8A0;
  objc_copyWeak(&v40, &location);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v30, 0, 0, v39));
  v45 = v28;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v5));

  objc_msgSend(v3, "addObject:", v29);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("See_Publishers_Guides_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1004DCA1C;
  v37[3] = &unk_1011AF8A0;
  objc_copyWeak(&v38, &location);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v7, 0, 0, v37));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("See_All_Guides_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1004DCA48;
  v35[3] = &unk_1011AF8A0;
  objc_copyWeak(&v36, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v10, 0, 0, v35));

  v44[0] = v8;
  v44[1] = v11;
  v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v12));

  objc_msgSend(v3, "addObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController _websiteURL](self, "_websiteURL"));
  LOBYTE(v12) = v14 == 0;

  if ((v12 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Collections_Website_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1004DCA74;
    v33[3] = &unk_1011AF8A0;
    objc_copyWeak(&v34, &location);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v33));

    v43 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v43, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v18));

    objc_msgSend(v3, "addObject:", v19);
    objc_destroyWeak(&v34);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MapsMenuBuilder sendToDeviceAndShareMenuWithSendToDeviceEnabled:](MapsMenuBuilder, "sendToDeviceAndShareMenuWithSendToDeviceEnabled:", 1));
  objc_msgSend(v3, "addObject:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Report_an_Issue_Mac_Menu_Item"), CFSTR("localized string not found"), 0));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1004DCAA0;
  v31[3] = &unk_1011AF8A0;
  objc_copyWeak(&v32, &location);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v22, 0, 0, v31));

  v42 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v42, 1));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v24));

  objc_msgSend(v3, "addObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithChildren:](UIMenu, "menuWithChildren:", v3));

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&location);
  return v26;
}

- (id)_websiteURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisherCollectionURL"));

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisher"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "publisherAttribution"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "websiteURL"));

    if (v5)
      v9 = v5;

  }
  return v5;
}

- (void)headerViewBrickTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v2, "wantsExpandLayout");

}

- (void)headerViewPublisherLogoTapped
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v3, "logDiscoverMoreFromPublisher");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisher"));
  objc_msgSend(v6, "viewControllerShowPublisher:", v5);

}

- (void)websiteMenuButtonTapped
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController _websiteURL](self, "_websiteURL"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v3, "viewController:openURL:", self, v4);

    -[CuratedCollectionViewAnalyticsController logOpenWebsite](self->_analyticsController, "logOpenWebsite");
  }

}

- (void)seeAllGuidesMenuButtonTapped
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v2, "viewControllerShowAllCollections");

}

- (void)reportAnIssueMenuButtonTapped
{
  -[CuratedCollectionViewController presentRAPWithSourceView:](self, "presentRAPWithSourceView:", self->_cardHeaderView);
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController scrollViewDidScroll:](&v6, "scrollViewDidScroll:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
  v5 = objc_msgSend(v4, "isApplyingSnapshot");

  if ((v5 & 1) == 0)
    -[CuratedCollectionViewController _updateHeaderAndTableViewValues](self, "_updateHeaderAndTableViewValues");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  -[CuratedCollectionHeaderView minimumScrolledHeight](self->_cardHeaderView, "minimumScrolledHeight");
  if (a5->y < -v10)
  {
    if (y >= 0.0)
    {
      if (y <= 0.0)
        goto LABEL_7;
      v12 = 1.0 - v10;
    }
    else
    {
      objc_msgSend(v9, "contentInset");
      v12 = -v11;
    }
    a5->y = v12;
  }
LABEL_7:
  v14.receiver = self;
  v14.super_class = (Class)CuratedCollectionViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v14, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
  if (y > 0.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
    objc_msgSend(v13, "logScrollDown");
LABEL_11:

    goto LABEL_12;
  }
  if (y < 0.0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
    objc_msgSend(v13, "logScrollUp");
    goto LABEL_11;
  }
LABEL_12:
  -[CuratedCollectionViewController _setWantsInsertInHistory](self, "_setWantsInsertInHistory");

}

- (id)_searchResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SearchResult *v11;
  void *v12;
  SearchResult *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
        v11 = [SearchResult alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
        v13 = -[SearchResult initWithMapItem:](v11, "initWithMapItem:", v12);

        -[SearchResultRepr setHasIncompleteMetadata:](v13, "setHasIncompleteMetadata:", 1);
        objc_msgSend(v3, "addObject:", v13);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v14 = objc_msgSend(v3, "copy");
  return v14;
}

- (void)addContentToMapView
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v3 = sub_1004DB2EC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v6 = sub_1004DB2EC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v5, "AddingContentToMapView", ", buf, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController _searchResults](self, "_searchResults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SearchInfo searchInfoWithResults:](SearchInfo, "searchInfoWithResults:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "searchPinsManager"));
  objc_msgSend(v12, "setSearchPinsFromSearchInfo:scrollToResults:displayPlaceCardForResult:animated:completion:", v10, 1, 0, 1, 0);

  v13 = sub_1004DB2EC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = v14;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, v5, "AddingContentToMapView", ", v16, 2u);
  }

}

- (void)removeContentFromMapView
{
  void *v3;
  id v4;

  if (-[CuratedCollectionViewController shouldClearSearchPins](self, "shouldClearSearchPins"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchPinsManager"));
    objc_msgSend(v3, "clearSearchPins");

  }
}

- (BOOL)shouldClearSearchPins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allSearchResults"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController _searchResults](self, "_searchResults"));
  LOBYTE(v3) = objc_msgSend(v5, "isEqualToArray:", v6);

  return (char)v3;
}

- (void)dataSourceUpdated:(id)a3
{
  if (!self->_hasFinishedResolving)
  {
    self->_hasFinishedResolving = 1;
    -[CuratedCollectionViewController _didFinishResolving](self, "_didFinishResolving", a3);
  }
}

- (void)_didFinishResolving
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
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
  GEOPlaceCollection *curatedCollection;
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
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "curatedCollection"));
  -[CuratedCollectionViewController setCuratedCollection:](self, "setCuratedCollection:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController updateContentInjection](self, "updateContentInjection"));
  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController updateContentInjection](self, "updateContentInjection"));
    ((void (**)(_QWORD, CuratedCollectionViewController *))v6)[2](v6, self);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController loadingView](self, "loadingView"));
  objc_msgSend(v7, "removeFromSuperview");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  objc_msgSend(v8, "removeFromSuperview");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  objc_msgSend(v9, "addSubview:", self->_tableView);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v10, "addSubview:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController fakeHeaderView](self, "fakeHeaderView"));
  objc_msgSend(v12, "setAlpha:", 1.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v13, "setAlpha:", 0.0);

  -[MapsThemeTableView setAlpha:](self->_tableView, "setAlpha:", 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tableViewBackgroundView"));
  -[MapsThemeTableView setBackgroundView:](self->_tableView, "setBackgroundView:", v15);

  -[MapsThemeTableView setContentInsetAdjustmentBehavior:](self->_tableView, "setContentInsetAdjustmentBehavior:", 2);
  -[MapsThemeTableView setAutomaticallyAdjustsScrollIndicatorInsets:](self->_tableView, "setAutomaticallyAdjustsScrollIndicatorInsets:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "topAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
  v54[0] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v43));
  v54[1] = v42;
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "trailingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v54[2] = v37;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView topAnchor](self->_tableView, "topAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v54[3] = v33;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView leadingAnchor](self->_tableView, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v30));
  v54[4] = v29;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView trailingAnchor](self->_tableView, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v54[5] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeTableView bottomAnchor](self->_tableView, "bottomAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bottomAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));
  v54[6] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController view](self, "view"));
  objc_msgSend(v25, "layoutIfNeeded");

  curatedCollection = self->_curatedCollection;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v27, "setCuratedCollection:", curatedCollection);

  -[CuratedCollectionViewController _updateHeaderTransition](self, "_updateHeaderTransition");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v28, "updateHeightForCurrentLayout");

  -[CuratedCollectionViewController _updateHeaderAndTableViewValues](self, "_updateHeaderAndTableViewValues");
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_1004DD834;
  v53[3] = &unk_1011AC860;
  v53[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v53);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1004DD874;
  v52[3] = &unk_1011AC860;
  v52[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v52, 0, 0.3, 0.0);
}

- (void)dataSource:(id)a3 itemFocused:(id)a4
{
  uint64_t v5;
  id v6;
  SearchResult *v7;
  void *v8;
  SearchResult *v9;
  void *v10;
  id lastItemTapped;
  id v12;

  v12 = a4;
  v5 = objc_opt_class(MKPlaceCollectionMapItem);
  if ((objc_opt_isKindOfClass(v12, v5) & 1) != 0)
  {
    v6 = v12;
    v7 = [SearchResult alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));

    v9 = -[SearchResult initWithMapItem:](v7, "initWithMapItem:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v10, "viewController:focusSearchResult:", self, v9);

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = 0;

LABEL_5:
    goto LABEL_6;
  }
  if (!self->_lastItemTapped)
  {
    v9 = (SearchResult *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    -[SearchResult viewControllerRemoveSearchResultFocus:](v9, "viewControllerRemoveSearchResultFocus:", self);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  SearchResult *v10;
  void *v11;
  SearchResult *v12;
  void *v13;
  void *v14;
  id lastItemTapped;
  id v16;

  v16 = a4;
  v5 = objc_opt_class(MKPlaceCollectionMapItem);
  if ((objc_opt_isKindOfClass(v16, v5) & 1) != 0)
  {
    v6 = v16;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionProvider collectionItems](self->_collectionProvider, "collectionItems"));
    v8 = objc_msgSend(v7, "indexOfObject:", v6);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
    objc_msgSend(v9, "logTapCollectionItem:atIndex:", v6, v8);

    v10 = [SearchResult alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
    v12 = -[SearchResult initWithMapItem:](v10, "initWithMapItem:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mapSelectionManager"));
    objc_msgSend(v14, "selectSearchResult:animated:", v12, 1);

    lastItemTapped = self->_lastItemTapped;
    self->_lastItemTapped = v6;

  }
}

- (void)dataSource:(id)a3 addPlaceToLibraryUsingCoordinator:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "initialMapItem"));
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", objc_msgSend(v6, "_muid"), 1, 259);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "initialMapItem"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004DDBD4;
  v9[3] = &unk_1011AE168;
  v10 = v5;
  v8 = v5;
  -[CuratedCollectionViewController _refineMapItem:completionHandler:](self, "_refineMapItem:completionHandler:", v7, v9);

}

- (void)dataSource:(id)a3 removePlaceFromLibraryUsingCoordinator:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "initialMapItem"));
  +[LibraryAnalytics captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:](_TtC4Maps16LibraryAnalytics, "captureAddOrRemoveFromLibraryWithPlaceMUID:captureAdd:target:", objc_msgSend(v5, "_muid"), 0, 259);

  objc_msgSend(v6, "deletePlaceFromLibraryWithViewControllerForPresentingAlert:", self);
}

- (void)dataSource:(id)a3 addToUserCollection:(id)a4 forMapItem:(id)a5 sourceView:(id)a6 onSaveCompletion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  CuratedCollectionViewController *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v17, "logSavePlaceItemToCuratedCollectionWithMUID:", objc_msgSend(v14, "_muid"));

  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1004DDEA4;
  v21[3] = &unk_1011B9050;
  v18 = v13;
  v22 = v18;
  v19 = v16;
  v25 = v19;
  v23 = self;
  objc_copyWeak(&v26, &location);
  v20 = v15;
  v24 = v20;
  -[CuratedCollectionViewController _refineMapItem:completionHandler:](self, "_refineMapItem:completionHandler:", v14, v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

- (void)dataSource:(id)a3 didFailWithErrorState:(unint64_t)a4
{
  void *v6;
  ErrorModeView *v7;
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
  void *v34;
  void *v35;
  id v36;
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
  _QWORD v56[4];
  id v57;
  id location;
  _QWORD v59[5];

  v36 = a3;
  self->_hasFinishedResolving = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));

  if (!v6)
  {
    v7 = objc_alloc_init(ErrorModeView);
    -[CuratedCollectionViewController setErrorView:](self, "setErrorView:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  }
  switch(a4)
  {
    case 0uLL:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead));
      objc_msgSend(v9, "setTitleLabelFont:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Generic Guide Error Title"), CFSTR("localized string not found"), 0));
      goto LABEL_9;
    case 1uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead));
      objc_msgSend(v20, "setTitleLabelFont:", v21);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Blocked Guide Error Title"), CFSTR("localized string not found"), 0));
      goto LABEL_9;
    case 2uLL:
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubhead));
      objc_msgSend(v12, "setTitleLabelFont:", v13);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Suppressed Guide Error"), CFSTR("localized string not found"), 0));
LABEL_9:

      v37 = 0;
      break;
    case 3uLL:
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Unable to Open Guide"), CFSTR("localized string not found"), 0));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("[Brooklyn] Internet Guide Error Title"), CFSTR("localized string not found"), 0));

      objc_initWeak(&location, self);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Try Again [Brooklyn]"), CFSTR("localized string not found"), 0));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray5Color](UIColor, "systemGray5Color"));
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1004DEA38;
      v56[3] = &unk_1011B4EB8;
      objc_copyWeak(&v57, &location);
      objc_msgSend(v16, "setButtonTitle:glyphName:backgroundColor:handler:", v18, CFSTR("arrow.clockwise"), v19, v56);

      objc_destroyWeak(&v57);
      objc_destroyWeak(&location);
      break;
    default:
      v37 = 0;
      v38 = 0;
      break;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController loadingView](self, "loadingView"));
  objc_msgSend(v22, "removeFromSuperview");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController cardHeaderView](self, "cardHeaderView"));
  objc_msgSend(v23, "removeFromSuperview");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  objc_msgSend(v24, "addSubview:", v25);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v59[0] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:", v47));
  v59[1] = v46;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v59[2] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v27));
  v59[3] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "heightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v32));
  v59[4] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController errorView](self, "errorView"));
  objc_msgSend(v35, "setTitle:andMessage:", v37, v38);

}

- (void)dataSource:(id)a3 willPunchOuToPublisherWebpageForPlaceCollectionItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionItems"));
  v8 = objc_msgSend(v7, "indexOfObject:", v5);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v9, "logPunchOutToPublisherReviewWithIndex:", v8);

}

- (void)dataSource:(id)a3 didExpandCellAnimated:(BOOL)a4
{
  double v4;
  _QWORD v5[5];

  v4 = 0.3;
  if (!a4)
    v4 = 0.0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1004DEBE0;
  v5[3] = &unk_1011AC860;
  v5[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, v4);
}

- (void)presentRAPWithSourceView:(id)a3
{
  id v4;
  RAPCuratedCollectionContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RAPCuratedCollectionContext *v12;

  v4 = a3;
  v5 = [RAPCuratedCollectionContext alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionItems"));
  v12 = -[RAPCuratedCollectionContext initWithCuratedCollection:placeCollectionMapItems:](v5, "initWithCuratedCollection:placeCollectionMapItems:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapPresenter"));
  objc_msgSend(v10, "presentCuratedCollectionRAPWithContext:sourceView:completion:", v12, v4, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v11, "logReportAProblem");

}

- (void)showPublisherView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v5, "logDiscoverMoreFromPublisher");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewControllerShowPublisher:", v4);

}

- (void)dataSource:(id)a3 openAppClip:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appClipURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v7, "logOpenAppClipWithURL:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKClipServices sharedInstance](MKClipServices, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004DEE4C;
  v10[3] = &unk_1011ACF90;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "requestAppClip:completion:", v5, v10);

}

- (void)_refineMapItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v11 = objc_msgSend(v8, "newTraits");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "ticketForMapItemToRefine:traits:", v7, v11));

  objc_msgSend(v10, "submitWithHandler:networkActivity:", v6, 0);
}

- (void)didSelectSaveCollection
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v3, "logSaveCuratedCollection");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  objc_msgSend(v5, "addSavedCuratedCollection:completion:", v4, 0);

}

- (void)didSelectRemoveFromSavedCollection
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v3, "logRemoveCuratedCollection");

  v5 = (id)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  objc_msgSend(v5, "removeSavedCuratedCollection:completion:", v4, 0);

}

- (NSArray)mapItems
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController collectionProvider](self, "collectionProvider", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionItems"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "mapItem"));
        objc_msgSend(v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (void)didSelectShareFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController analyticsController](self, "analyticsController"));
  objc_msgSend(v5, "logShareCuratedCollection");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "appCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController mapItems](self, "mapItems"));
  v9 = objc_msgSend(v8, "copy");
  objc_msgSend(v6, "shareCuratedCollection:withRefinedMapItems:sourceView:completion:", v7, v9, v4, 0);

}

- (void)didSelectOpenHomePage
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CuratedCollectionViewController curatedCollection](self, "curatedCollection"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "publisherCollectionURL"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v4, "viewController:openURL:", self, v5);

  -[CuratedCollectionViewAnalyticsController logOpenWebsite](self->_analyticsController, "logOpenWebsite");
}

- (UIScrollView)pptTestScrollView
{
  return (UIScrollView *)self->_tableView;
}

- (id)updateContentInjection
{
  return self->_updateContentInjection;
}

- (void)setUpdateContentInjection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (CuratedCollectionProvider)collectionProvider
{
  return self->_collectionProvider;
}

- (void)setCollectionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_collectionProvider, a3);
}

- (ContainerHeaderView)fakeHeaderView
{
  return self->_fakeHeaderView;
}

- (void)setFakeHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_fakeHeaderView, a3);
}

- (CuratedCollectionHeaderView)cardHeaderView
{
  return self->_cardHeaderView;
}

- (void)setCardHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_cardHeaderView, a3);
}

- (CuratedCollectionViewAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (void)setAnalyticsController:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsController, a3);
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_cardHeaderView, 0);
  objc_storeStrong((id *)&self->_fakeHeaderView, 0);
  objc_storeStrong((id *)&self->_collectionProvider, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong(&self->_updateContentInjection, 0);
  objc_storeStrong(&self->_lastItemTapped, 0);
  objc_storeStrong((id *)&self->_collectionEditSession, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
