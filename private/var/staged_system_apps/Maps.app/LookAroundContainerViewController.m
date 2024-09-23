@implementation LookAroundContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_commonInit
{
  LookAroundActionCoordinator *v3;
  LookAroundActionCoordinator *actionCoordinator;
  OverlayContainerDimmingController *v5;
  DimmingBehaviour *v6;
  void *v7;
  OverlayContainerDimmingController *v8;
  id v9;

  self->_showsLabels = 1;
  self->_currentDragRatio = 0.0;
  self->_currentDragScale = 1.0;
  self->_displayState = 0;
  self->_locationState = 0;
  v3 = -[LookAroundActionCoordinator initWithContainerViewController:]([LookAroundActionCoordinator alloc], "initWithContainerViewController:", self);
  actionCoordinator = self->_actionCoordinator;
  self->_actionCoordinator = v3;

  v5 = [OverlayContainerDimmingController alloc];
  v6 = sub_10075C278();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[OverlayContainerDimmingController initWithDimmingBehaviour:customBehaviours:](v5, "initWithDimmingBehaviour:customBehaviours:", v7, 0);
  -[OverlayContainerViewController setDimmingBehaviour:](self, "setDimmingBehaviour:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, CFSTR("__internal__HideTapToRadarInMunin"), 1, off_1014B0728);

}

- (id)_createOrReuseLookAroundView:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id);
  id v8;
  id v9;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = v6;
  v9 = v8;
  if (!v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)MKLookAroundView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v9, "setCompassHidden:", 1);
    objc_msgSend(v9, "setShowsPointLabels:", self->_showsLabels);
    objc_msgSend(v9, "setShowsRoadLabels:", self->_showsLabels);
    if (!v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v7)
LABEL_3:
    v7[2](v7, v9);
LABEL_4:

  return v9;
}

- (LookAroundContainerViewController)initWithEntryPoint:(id)a3 lookAroundView:(id)a4 showsFullScreen:(BOOL)a5
{
  id v9;
  id v10;
  LookAroundContainerViewController *v11;
  LookAroundContainerViewController *v12;
  LookAroundActionCoordinator *v13;
  LookAroundActionCoordinator *actionCoordinator;
  OverlayContainerDimmingController *v15;
  DimmingBehaviour *v16;
  void *v17;
  OverlayContainerDimmingController *v18;
  uint64_t v19;
  MKLookAroundView *lookAroundView;
  uint64_t v21;
  UIView *lookAroundViewOriginalSuperview;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v28.receiver = self;
  v28.super_class = (Class)LookAroundContainerViewController;
  v11 = -[ContainerViewController initWithNibName:bundle:](&v28, "initWithNibName:bundle:", 0, 0);
  v12 = v11;
  if (v11)
  {
    -[LookAroundContainerViewController _commonInit](v11, "_commonInit");
    objc_storeStrong((id *)&v12->_entryPoint, a3);
    v12->_showsFullScreen = a5;
    v13 = -[LookAroundActionCoordinator initWithContainerViewController:]([LookAroundActionCoordinator alloc], "initWithContainerViewController:", v12);
    actionCoordinator = v12->_actionCoordinator;
    v12->_actionCoordinator = v13;

    v15 = [OverlayContainerDimmingController alloc];
    v16 = sub_10075C278();
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = -[OverlayContainerDimmingController initWithDimmingBehaviour:customBehaviours:](v15, "initWithDimmingBehaviour:customBehaviours:", v17, 0);
    -[OverlayContainerViewController setDimmingBehaviour:](v12, "setDimmingBehaviour:", v18);

    objc_initWeak(&location, v12);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1006CE574;
    v24[3] = &unk_1011C06E8;
    objc_copyWeak(&v26, &location);
    v25 = v9;
    v19 = objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController _createOrReuseLookAroundView:completion:](v12, "_createOrReuseLookAroundView:completion:", v10, v24));
    lookAroundView = v12->_lookAroundView;
    v12->_lookAroundView = (MKLookAroundView *)v19;

    v21 = objc_claimAutoreleasedReturnValue(-[MKLookAroundView superview](v12->_lookAroundView, "superview"));
    lookAroundViewOriginalSuperview = v12->_lookAroundViewOriginalSuperview;
    v12->_lookAroundViewOriginalSuperview = (UIView *)v21;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("__internal__HideTapToRadarInMunin"), off_1014B0728);

  v4.receiver = self;
  v4.super_class = (Class)LookAroundContainerViewController;
  -[LookAroundContainerViewController dealloc](&v4, "dealloc");
}

- (BOOL)isDisplayingLookAroundFullScreen
{
  return self->_displayState == 1;
}

- (BOOL)isDisplayingLookAroundPIP
{
  return self->_displayState == 2;
}

- (MKMapItem)currentMapItem
{
  MKLookAroundView **p_lookAroundView;

  p_lookAroundView = &self->_lookAroundView;
  if ((-[MKLookAroundView hasEnteredLookAround](self->_lookAroundView, "hasEnteredLookAround") & 1) == 0)
    p_lookAroundView = &self->_entryPoint;
  return (MKMapItem *)(id)objc_claimAutoreleasedReturnValue(-[MKLookAroundView mapItem](*p_lookAroundView, "mapItem"));
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  return -[LookAroundActionCoordinator dataCoordinator](self->_actionCoordinator, "dataCoordinator");
}

- (id)puckViewController
{
  LookAroundPuckViewController *puckViewController;
  LookAroundPuckViewController *v4;
  LookAroundPuckViewController *v5;
  void *v6;
  void *v7;

  puckViewController = self->_puckViewController;
  if (!puckViewController)
  {
    v4 = objc_alloc_init(LookAroundPuckViewController);
    v5 = self->_puckViewController;
    self->_puckViewController = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPuckViewController view](self->_puckViewController, "view"));
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v7, "addObserver:", self->_puckViewController);

    puckViewController = self->_puckViewController;
  }
  return puckViewController;
}

- (id)pipViewController
{
  LookAroundPIPViewController *pipViewController;
  LookAroundPIPViewController *v4;
  void *v5;
  LookAroundPIPViewController *v6;
  LookAroundPIPViewController *v7;
  void *v8;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *pipViewTapGestureRecognizer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  pipViewController = self->_pipViewController;
  if (!pipViewController)
  {
    v4 = [LookAroundPIPViewController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    v6 = -[LookAroundPIPViewController initWithDataCoordinator:lookAroundView:](v4, "initWithDataCoordinator:lookAroundView:", v5, self->_lookAroundView);
    v7 = self->_pipViewController;
    self->_pipViewController = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController actionCoordinator](self, "actionCoordinator"));
    -[LookAroundPIPViewController setActionCoordinator:](self->_pipViewController, "setActionCoordinator:", v8);

    v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handlePIPViewTap:");
    pipViewTapGestureRecognizer = self->_pipViewTapGestureRecognizer;
    self->_pipViewTapGestureRecognizer = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self->_pipViewController, "view"));
    objc_msgSend(v11, "addGestureRecognizer:", self->_pipViewTapGestureRecognizer);

    -[ContainerViewController addChildViewController:](self, "addChildViewController:", self->_pipViewController);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self->_pipViewController, "view"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    objc_msgSend(v12, "insertSubview:aboveSubview:", v13, v14);

    -[LookAroundPIPViewController didMoveToParentViewController:](self->_pipViewController, "didMoveToParentViewController:", self);
    pipViewController = self->_pipViewController;
  }
  return pipViewController;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LookAroundContainerViewController;
  -[OverlayContainerViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[LookAroundContainerViewController _updateCompassLayout](self, "_updateCompassLayout");
  -[LookAroundContainerViewController _updatePIPLayout](self, "_updatePIPLayout");
}

- (void)viewDidLoad
{
  void *v3;
  PlaceCardItem *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundContainerViewController;
  -[OverlayContainerViewController viewDidLoad](&v5, "viewDidLoad");
  -[LookAroundActionCoordinator viewControllerPresentTray:showsFullScreen:usingLookAroundView:](self->_actionCoordinator, "viewControllerPresentTray:showsFullScreen:usingLookAroundView:", self, self->_showsFullScreen, self->_lookAroundView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView mapItem](self->_lookAroundView, "mapItem"));
  if (v3)
  {
    v4 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v3);
    -[LookAroundActionCoordinator viewController:presentPlaceCardForItem:animated:](self->_actionCoordinator, "viewController:presentPlaceCardForItem:animated:", self, v4, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LookAroundContainerViewController;
  -[OverlayContainerViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  self->_containerIsVisible = 1;
  if (self->_modeIsCurrent)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
    -[LookAroundContainerViewController _insertPuckViewIntoMapView:](self, "_insertPuckViewIntoMapView:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("LookAroundTrayContaineeViewControllerDidAppear"), self, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundContainerViewController;
  -[ContainerViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  -[LookAroundContainerViewController _showTTRButton:](self, "_showTTRButton:", 0);
  self->_containerIsVisible = 0;
  if (!self->_modeIsCurrent)
    -[LookAroundContainerViewController _removePuckViewFromMapView](self, "_removePuckViewFromMapView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("LookAroundTrayContaineeViewControllerDidDisappear"), self, 0);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)LookAroundContainerViewController;
  v7 = a4;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v8, "pause");

  self->_viewWillTransitionToSize.width = width;
  self->_viewWillTransitionToSize.height = height;
  v9[4] = self;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1006CEC0C;
  v10[3] = &unk_1011AEDC8;
  v10[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006CEC58;
  v9[3] = &unk_1011AEDC8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v9);

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LookAroundContainerViewController;
  v6 = a4;
  -[ContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v10, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v7, "pause");

  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1006CED90;
  v9[3] = &unk_1011AEDC8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006CEDDC;
  v8[3] = &unk_1011AEDC8;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v9, v8);

}

- (UIEdgeInsets)compassInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v28;
  CGRect v29;
  UIEdgeInsets result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  objc_msgSend(v4, "_compassInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (sub_1002A8AA0(self) != 5)
  {
    v6 = 8.0;
    if (sub_1002A8AA0(self) == 5)
      v6 = sub_1005EC29C();
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    objc_msgSend(v13, "safeAreaInsets");
    v12 = v6 + v14;

    if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self->_pipViewController, "view"));
      v16 = UIRectInset(objc_msgSend(v15, "bounds"));
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v23 = -[LookAroundContainerViewController _pipLayout](self, "_pipLayout");
      if (v23)
      {
        if (v23 == 3)
          v12 = 8.0;
      }
      else
      {
        v28.origin.x = v16;
        v28.origin.y = v18;
        v28.size.width = v20;
        v28.size.height = v22;
        v12 = v12 - CGRectGetWidth(v28);
        v29.origin.x = v16;
        v29.origin.y = v18;
        v29.size.width = v20;
        v29.size.height = v22;
        v6 = v6 + CGRectGetHeight(v29);
      }
    }
  }
  v24 = v6;
  v25 = v8;
  v26 = v10;
  v27 = v12;
  result.right = v27;
  result.bottom = v26;
  result.left = v25;
  result.top = v24;
  return result;
}

- (void)_updateCompassLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  MKLookAroundView *v16;

  if (!self->_modeTransition)
  {
    if (self->_pipViewController)
    {
      -[LookAroundContainerViewController compassInsets](self, "compassInsets");
      v4 = v3;
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mapView"));
      objc_msgSend(v12, "_setCompassInsets:", v4, v6, v8, v10);

      v16 = self->_lookAroundView;
      -[MKLookAroundView compassInsets](v16, "compassInsets");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController floatingButtonsView](self->_pipViewController, "floatingButtonsView"));
      objc_msgSend(v13, "frame");
      v15 = v14 + 32.0;

      -[MKLookAroundView setCompassInsets:](v16, "setCompassInsets:", v15, 16.0, 16.0, 16.0);
    }
  }
}

- (void)_updatePIPLayout
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v7;
  CGFloat v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v14;
  CGFloat v15;
  BOOL v16;
  char v17;
  __int128 v18;
  _BOOL8 IsIdentity;
  void *v20;
  CGAffineTransform v21;
  _OWORD v22[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  if (!self->_modeTransition)
  {
    -[LookAroundContainerViewController frameForPIPView](self, "frameForPIPView");
    x = v26.origin.x;
    y = v26.origin.y;
    width = v26.size.width;
    height = v26.size.height;
    v7 = CGRectGetWidth(v26);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v8 = CGRectGetHeight(v27);
    memset(&v25, 0, sizeof(v25));
    -[LookAroundContainerViewController transformForPIPView:](self, "transformForPIPView:", x, y, width, height);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self->_pipViewController, "view"));
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "transform");
    else
      memset(&t1, 0, sizeof(t1));
    t2 = v25;
    v11 = CGAffineTransformEqualToTransform(&t1, &t2);
    objc_msgSend(v10, "bounds");
    v29.origin.x = 0.0;
    v29.origin.y = 0.0;
    v29.size.width = v7;
    v29.size.height = v8;
    v12 = CGRectEqualToRect(v28, v29);
    if (self->_viewWillTransitionToSize.width == CGSizeZero.width
      && self->_viewWillTransitionToSize.height == CGSizeZero.height)
    {
      v16 = 0;
      if (!v10)
      {
LABEL_19:

        return;
      }
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      objc_msgSend(v14, "bounds");
      v16 = v15 > self->_viewWillTransitionToSize.width;

      if (!v10)
        goto LABEL_19;
    }
    v17 = self->_isRespondingToPanGesture || v16;
    if ((v17 & 1) == 0 && (!v11 || !v12 || self->_forceUpdatePIPLayout))
    {
      v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v22[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v22[1] = v18;
      v22[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      objc_msgSend(v10, "setTransform:", v22);
      objc_msgSend(v10, "setFrame:", x, y, width, height);
      v21 = v25;
      objc_msgSend(v10, "setTransform:", &v21);
      -[LookAroundContainerViewController updateMapEdgeInsets](self, "updateMapEdgeInsets");
      t2 = v25;
      IsIdentity = CGAffineTransformIsIdentity(&t2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController lookAroundContainerView](self->_pipViewController, "lookAroundContainerView"));
      objc_msgSend(v20, "setUserInteractionEnabled:", IsIdentity);

      -[UITapGestureRecognizer setEnabled:](self->_pipViewTapGestureRecognizer, "setEnabled:", IsIdentity ^ 1);
    }
    goto LABEL_19;
  }
}

- (CGRect)frameForPIPView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double Height;
  double v14;
  unsigned __int8 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double Width;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double MinX;
  void *v53;
  double v54;
  double v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat rect;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = sub_1005EC29C();
  if (-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen"))
  {
    Height = v11;
    v14 = v7;
  }
  else
  {
    v15 = -[LookAroundContainerViewController _pipHugsLeading](self, "_pipHugsLeading");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    objc_msgSend(v16, "safeAreaInsets");
    v17 = 3.0;
    if (v18 == 0.0)
      v17 = v12;
    v68 = v17;

    if (sub_1002A8AA0(self) == 5)
    {
      v69.origin.x = v5;
      v69.origin.y = v7;
      v69.size.width = v9;
      v69.size.height = v11;
      v19 = ceil(CGRectGetWidth(v69)) / 2.5;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      objc_msgSend(v20, "safeAreaInsets");
      v14 = v12 + v21;

      v22 = v19 * 0.625;
LABEL_7:
      Height = ceil(v22);
    }
    else
    {
      -[ContainerViewController topEdgePadding](self, "topEdgePadding");
      v14 = v23;
      v70.origin.x = v5;
      v70.origin.y = v7;
      v70.size.width = v9;
      v70.size.height = v11;
      Height = CGRectGetHeight(v70);
      switch(-[LookAroundContainerViewController _pipLayout](self, "_pipLayout"))
      {
        case 0uLL:
        case 1uLL:
          v71.origin.x = v5;
          v71.origin.y = v7;
          v71.size.width = v9;
          v71.size.height = v11;
          v19 = fmin(ceil(CGRectGetWidth(v71) * 0.479999989), 630.0);
          v72.origin.x = v5;
          v72.origin.y = v7;
          v72.size.width = v9;
          v72.size.height = v11;
          v24 = CGRectGetHeight(v72) * 0.400000006;
          goto LABEL_19;
        case 2uLL:
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));

          objc_msgSend(v26, "frame");
          v28 = v27;
          v30 = v29;
          v63 = v32;
          v65 = v31;
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
          objc_msgSend(v26, "convertRect:toView:", v33, v28, v30, v65, v63);
          v64 = v35;
          v66 = v34;
          v37 = v36;
          rect = v38;

          v73.origin.x = v5;
          v73.origin.y = v7;
          v73.size.width = v9;
          v73.size.height = v11;
          Width = CGRectGetWidth(v73);
          v74.size.width = v64;
          v74.origin.x = v66;
          v74.origin.y = v37;
          v74.size.height = rect;
          v40 = Width - CGRectGetMaxX(v74) - v12 - v68;
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
          objc_msgSend(v41, "safeAreaInsets");
          v19 = v40 - v42;

          v75.origin.x = v5;
          v75.origin.y = v7;
          v75.size.width = v9;
          v75.size.height = v11;
          Height = ceil(CGRectGetHeight(v75) * 0.400000006);
          goto LABEL_16;
        case 3uLL:
          v76.origin.x = v5;
          v76.origin.y = v7;
          v76.size.width = v9;
          v76.size.height = v11;
          v19 = ceil(CGRectGetWidth(v76) * 0.479999989);
          -[ContainerViewController statusBarHeight](self, "statusBarHeight");
          v67 = Height - (v12 + v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
          objc_msgSend(v44, "safeAreaInsets");
          if (v45 == 0.0)
            v46 = v12;
          else
            v46 = 3.0;

          v26 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
          objc_msgSend(v26, "safeAreaInsets");
          Height = v67 - (v46 + v47);
LABEL_16:

          break;
        case 4uLL:
          v79.origin.x = v5;
          v79.origin.y = v7;
          v79.size.width = v9;
          v79.size.height = v11;
          v19 = CGRectGetWidth(v79);
          v24 = Height * 0.400000006;
LABEL_19:
          Height = fmin(ceil(v24), 390.0);
          break;
        case 5uLL:
          v77.origin.x = v5;
          v77.origin.y = v7;
          v77.size.width = v9;
          v77.size.height = v11;
          v19 = CGRectGetWidth(v77);
          v78.origin.x = v5;
          v78.origin.y = v7;
          v78.size.width = v9;
          v78.size.height = v11;
          v22 = CGRectGetHeight(v78) * 0.349999994;
          goto LABEL_7;
        default:
          v19 = 0.0;
          break;
      }
    }
    v48 = v5;
    v49 = v7;
    v50 = v9;
    v51 = v11;
    if ((v15 & 1) != 0)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v48);
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      objc_msgSend(v53, "safeAreaInsets");
      v55 = MinX + v54;
    }
    else
    {
      v56 = CGRectGetMaxX(*(CGRect *)&v48) - v19;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      objc_msgSend(v53, "safeAreaInsets");
      v55 = v56 - v57;
    }

    v9 = v19 - v12 - v68;
    v5 = v12 + v55;
  }
  v58 = v5;
  v59 = v14;
  v60 = v9;
  v61 = Height;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (unint64_t)_pipLayout
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double Height;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  id v21;
  unint64_t v22;
  CGRect v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  Height = CGRectGetHeight(v24);
  if (sub_1002A8AA0(self))
  {
    v13 = 0;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v14, "horizontalSizeClass") == (id)1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController traitCollection](self, "traitCollection"));
      v13 = objc_msgSend(v15, "verticalSizeClass") == (id)1;

    }
    else
    {
      v13 = 0;
    }

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v18 = objc_opt_class(LookAroundTrayContaineeViewController);
    v19 = objc_opt_isKindOfClass(v17, v18) ^ 1;

  }
  else
  {
    v19 = 0;
  }

  if (v13
    || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController traitCollection](self, "traitCollection")),
        v21 = objc_msgSend(v20, "horizontalSizeClass"),
        v20,
        v21 == (id)2))
  {
    v22 = 2;
    if ((v19 & 1) == 0)
      v22 = 3;
    if (Height > 500.0)
      return v19 & 1;
    else
      return v22;
  }
  else if (Height <= 500.0)
  {
    return 5;
  }
  else
  {
    return 4;
  }
}

- (CGAffineTransform)transformForPIPView:(SEL)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform *result;
  double v11;
  double v12;
  double currentDragScale;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v18 = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v17;
  v16 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&retstr->tx = v16;
  result = (CGAffineTransform *)-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen");
  if ((result & 1) == 0)
  {
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    v11 = CGRectGetWidth(v21);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v12 = CGRectGetHeight(v22);
    currentDragScale = self->_currentDragScale;
    if (currentDragScale < 1.0)
    {
      *(_OWORD *)&v20.a = v18;
      *(_OWORD *)&v20.c = v17;
      *(_OWORD *)&v20.tx = v16;
      CGAffineTransformTranslate(retstr, &v20, (v11 - v11 * currentDragScale) * -0.5, v12 / v11 * ((v11 - v11 * currentDragScale) * -0.5));
      v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v19.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v19.c = v14;
      *(_OWORD *)&v19.tx = *(_OWORD *)&retstr->tx;
      result = CGAffineTransformScale(&v20, &v19, currentDragScale, currentDragScale);
      v15 = *(_OWORD *)&v20.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v20.a;
      *(_OWORD *)&retstr->c = v15;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v20.tx;
    }
  }
  return result;
}

- (void)_updateLayoutWithValue:(double)a3
{
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;

  v9 = 0x3FF0000000000000;
  v10 = 0.0;
  if (-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen"))
  {
    v5 = 0.0;
    v6 = 1.0;
  }
  else
  {
    -[LookAroundContainerViewController _getRatioControls:scale:forContentHeightValue:](self, "_getRatioControls:scale:forContentHeightValue:", &v10, &v9, a3);
    v6 = *(double *)&v9;
    v5 = v10;
  }
  self->_currentDragRatio = v5;
  self->_currentDragScale = v6;
  if (!self->_modeTransition)
  {
    v7 = 1.0 - v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController floatingButtonsView](self->_pipViewController, "floatingButtonsView"));
    objc_msgSend(v8, "setAlpha:", v7);

  }
  -[LookAroundContainerViewController _updatePIPLayout](self, "_updatePIPLayout");
}

- (void)_updateLayoutWithCurrentValue
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));

  if (v4)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
    objc_msgSend(v5, "frame");
    -[LookAroundContainerViewController _updateLayoutWithValue:](self, "_updateLayoutWithValue:", v6);

  }
}

- (BOOL)_getRatioControls:(double *)a3 scale:(double *)a4 forContentHeightValue:(double)a5
{
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v16;
  double v17;
  double v18;

  if ((-[ContainerViewController containerStyle](self, "containerStyle") & 0xFFFFFFFFFFFFFFFBLL) != 1)
    goto LABEL_20;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v9, "heightForLayout:", 1);
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v12, "heightForLayout:", 2);
  v14 = v13;

  if (v14 == v11)
    return 0;
  if (v11 < a5)
  {
    if (v14 >= a5)
      v16 = a5;
    else
      v16 = v14;
    v17 = (v16 - v11) / (v14 - v11);
    if (v17 < 0.0)
      v17 = 0.0;
    if (v17 > 1.0)
      v17 = 1.0;
    if (a3)
      *a3 = v17;
    if (!a4)
      return 1;
    v18 = (1.0 - v17) * 0.699999988 + 0.300000012;
    if (v18 < 0.300000012)
      v18 = 0.300000012;
    if (v18 > 1.0)
      v18 = 1.0;
  }
  else
  {
LABEL_20:
    if (a3)
      *a3 = 0.0;
    v18 = 1.0;
    if (!a4)
      return 1;
  }
  *a4 = v18;
  return 1;
}

- (void)_handlePIPViewTap:(id)a3
{
  -[ContainerViewController setLayoutIfSupported:animated:](self, "setLayoutIfSupported:animated:", 1, 1);
}

- (void)_setupForFullScreen
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (self->_displayState != 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v3, "removeObserver:", self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    objc_msgSend(v5, "setAlpha:", 0.0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v7, "setHidden:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
    objc_msgSend(v8, "setShowsMinimizedButton:", 1);

    -[MKLookAroundView setShowsPointLabels:](self->_lookAroundView, "setShowsPointLabels:", self->_showsLabels);
    -[MKLookAroundView setShowsRoadLabels:](self->_lookAroundView, "setShowsRoadLabels:", self->_showsLabels);
    -[MKLookAroundView setUserInteractionEnabled:](self->_lookAroundView, "setUserInteractionEnabled:", 1);
    v9 = self->_trayContaineeViewController != 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
    objc_msgSend(v10, "setUserInteractionEnabled:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("LookAroundFullScreenView"));

    -[LookAroundTrayContaineeViewController setVisible:animated:](self->_trayContaineeViewController, "setVisible:animated:", 1, 1);
    self->_displayState = 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v13, "setNeedsUserInterfaceAppearanceUpdate");

    -[OverlayContainerViewController updateTheme](self, "updateTheme");
  }
}

- (void)_setupForPIP
{
  void *v3;
  unint64_t v4;
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

  if (self->_displayState != 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v4 = ((unint64_t)objc_msgSend(v3, "displayedViewMode") - 1) & 0xFFFFFFFFFFFFFFFALL;

    if (!v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v5, "updateViewMode:animated:", 0, 0);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v6, "addObserver:", self);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v7, "setNeedsLookAroundAvailabilityUpdate");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "view"));
    objc_msgSend(v9, "setAlpha:", 1.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v11, "setHidden:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
    objc_msgSend(v12, "setShowsMinimizedButton:", 0);

    self->_showsLabels = -[MKLookAroundView showsPointLabels](self->_lookAroundView, "showsPointLabels");
    -[MKLookAroundView setShowsPointLabels:](self->_lookAroundView, "setShowsPointLabels:", 0);
    -[MKLookAroundView setShowsRoadLabels:](self->_lookAroundView, "setShowsRoadLabels:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
    objc_msgSend(v13, "setUserInteractionEnabled:", 0);

    -[LookAroundTrayContaineeViewController setVisible:animated:](self->_trayContaineeViewController, "setVisible:animated:", 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("LookAroundPiPView"));

    self->_displayState = 2;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v16, "setNeedsUserInterfaceAppearanceUpdate");

    -[OverlayContainerViewController updateTheme](self, "updateTheme");
  }
}

- (void)_showTTRButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  LookAroundTTRButtonView *v12;
  LookAroundTTRButtonView *v13;
  LookAroundTTRButtonView *v14;
  LookAroundTTRButtonView *ttrButtonView;
  void *v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  LookAroundTTRButtonView *v29;
  void *v30;
  _QWORD v31[2];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
  v6 = objc_msgSend(v5, "isInternalInstall");

  if (v6)
  {
    if (!v3)
      goto LABEL_5;
    v7 = objc_claimAutoreleasedReturnValue(-[MKLookAroundView window](self->_lookAroundView, "window"));
    if (!v7)
      goto LABEL_5;
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView window](self->_lookAroundView, "window"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));

    if (v9 == v11)
    {
      if (self->_ttrButtonView)
        goto LABEL_8;
      v14 = objc_alloc_init(LookAroundTTRButtonView);
      ttrButtonView = self->_ttrButtonView;
      self->_ttrButtonView = v14;

      -[LookAroundTTRButtonView setDelegate:](self->_ttrButtonView, "setDelegate:", self);
      -[LookAroundTTRButtonView setTranslatesAutoresizingMaskIntoConstraints:](self->_ttrButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[LookAroundTTRButtonView setTag:](self->_ttrButtonView, "setTag:", MKLookAroundTTRButtonTag);
      -[MKLookAroundView addSubview:](self->_lookAroundView, "addSubview:", self->_ttrButtonView);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController traitCollection](self, "traitCollection"));
      v17 = objc_msgSend(v16, "userInterfaceIdiom");

      if (v17 == (id)5)
        v18 = -76.0;
      else
        v18 = -16.0;
      v29 = (LookAroundTTRButtonView *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView bottomAnchor](self->_ttrButtonView, "bottomAnchor", NSLayoutConstraint));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "safeAreaLayoutGuide"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bottomAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView constraintEqualToAnchor:constant:](v29, "constraintEqualToAnchor:constant:", v20, -16.0));
      v31[0] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundTTRButtonView trailingAnchor](self->_ttrButtonView, "trailingAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "safeAreaLayoutGuide"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v25, v18));
      v31[1] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));
      objc_msgSend(v28, "activateConstraints:", v27);

      v13 = v29;
    }
    else
    {
LABEL_5:
      v12 = self->_ttrButtonView;
      if (!v12)
      {
LABEL_8:
        -[LookAroundContainerViewController _updateTTRButtonState](self, "_updateTTRButtonState");
        return;
      }
      -[LookAroundTTRButtonView removeFromSuperview](v12, "removeFromSuperview");
      v13 = self->_ttrButtonView;
      self->_ttrButtonView = 0;
    }

    goto LABEL_8;
  }
}

- (void)animateFromModeTransition:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MKLookAroundView *v13;
  id chromeDeactivationToken;
  MKLookAroundView *v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  _QWORD *v22;
  void *v23;
  _QWORD v24[4];
  _QWORD *v25;
  _QWORD v26[4];
  _QWORD *v27;
  _QWORD v28[4];
  id v29;
  LookAroundContainerViewController *v30;
  id v31;
  _QWORD v32[5];
  MKLookAroundView *v33;
  id v34;
  id v35;
  id v36;

  v4 = a3;
  self->_modeTransition = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v10, "setShouldRasterize:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "floatingButtonsView"));

  v13 = self->_lookAroundView;
  -[MKLookAroundView setCompassHidden:](v13, "setCompassHidden:", 1);
  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = 0;

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1006D05FC;
  v32[3] = &unk_1011B04A8;
  v32[4] = self;
  v15 = v13;
  v33 = v15;
  v16 = v7;
  v34 = v16;
  v17 = v12;
  v35 = v17;
  v18 = v9;
  v36 = v18;
  v19 = objc_retainBlock(v32);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1006D07F4;
  v28[3] = &unk_1011AD238;
  v20 = WeakRetained;
  v29 = v20;
  v30 = self;
  v21 = v4;
  v31 = v21;
  v22 = objc_retainBlock(v28);
  if (objc_msgSend(v21, "isAnimated"))
  {
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.449999988);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", v23);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1006D0838;
    v26[3] = &unk_1011ADA00;
    v27 = v19;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1006D0844;
    v24[3] = &unk_1011B1B90;
    v25 = v22;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v26, v24, 0.449999988);
    +[CATransaction commit](CATransaction, "commit");

  }
  else
  {
    ((void (*)(_QWORD *))v19[2])(v19);
    ((void (*)(_QWORD *))v22[2])(v22);
  }

}

- (void)animateToModeTransition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL showsFullScreen;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  id v30;
  _QWORD *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  _QWORD *v37;
  _QWORD v38[4];
  _QWORD *v39;
  _QWORD v40[4];
  id v41;
  LookAroundContainerViewController *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
  objc_msgSend(v5, "layoutIfNeeded");

  self->_modeTransition = 1;
  if (self->_showsFullScreen)
  {
    -[LookAroundContainerViewController _setupForFullScreen](self, "_setupForFullScreen");
    v6 = 7;
  }
  else
  {
    -[LookAroundContainerViewController _setupForPIP](self, "_setupForPIP");
    v6 = 6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "cardView"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "floatingButtonsView"));

  objc_msgSend(v12, "setAlpha:", 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self->_trayContaineeViewController, "cardPresentationController"));
  objc_msgSend(v13, "setHidden:", 1);

  objc_msgSend(v10, "setLayoutStyle:", 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lookAroundContainerView"));

  showsFullScreen = self->_showsFullScreen;
  -[LookAroundContainerViewController frameForPIPView](self, "frameForPIPView");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1006D0C38;
  v43[3] = &unk_1011C0710;
  v25 = v10;
  v44 = v25;
  v48 = v6;
  v26 = v8;
  v45 = v26;
  v49 = v18;
  v50 = v20;
  v51 = v22;
  v52 = v24;
  v27 = v12;
  v46 = v27;
  v28 = v15;
  v47 = v28;
  v53 = showsFullScreen;
  v29 = objc_retainBlock(v43);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1006D0C98;
  v40[3] = &unk_1011AC8B0;
  v30 = v4;
  v41 = v30;
  v42 = self;
  v31 = objc_retainBlock(v40);
  if (objc_msgSend(v30, "isAnimated"))
  {
    -[LookAroundContainerViewController _sanitizedOriginFrame](self, "_sanitizedOriginFrame");
    objc_msgSend(v26, "setFrame:");
    v32 = 1.0;
    if (!self->_lookAroundViewOriginalSuperview)
      v32 = 0.0;
    objc_msgSend(v26, "setAlpha:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "view"));
    objc_msgSend(v34, "setAlpha:", 0.0);

    objc_msgSend(v26, "layoutIfNeeded");
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", 0.449999988);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", v35);

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1006D0DAC;
    v38[3] = &unk_1011ADA00;
    v39 = v29;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1006D0DB8;
    v36[3] = &unk_1011B1B90;
    v37 = v31;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v38, v36, 0.449999988);
    +[CATransaction commit](CATransaction, "commit");

  }
  else
  {
    ((void (*)(_QWORD *))v29[2])(v29);
    ((void (*)(_QWORD *))v31[2])(v31);
  }

}

- (void)didCompleteModeTransition
{
  -[LookAroundPuckViewController setCanEnterLookAroundPIP](self->_puckViewController, "setCanEnterLookAroundPIP");
}

- (void)_showPuckAnimated
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1006D0E40;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v2, &stru_1011C0730, 0.449999988);
}

- (void)prepareForExitWithCompletion:(id)a3
{
  id chromeDeactivationToken;
  void *v5;
  void *v6;
  unsigned int v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardPresentationController"));
  v7 = objc_msgSend(v6, "usingSheetPresentation");

  if (v7)
  {
    if (v8)
      v8[2]();
  }
  else
  {
    -[LookAroundContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
  }

}

- (void)prepareForExit
{
  -[LookAroundContainerViewController prepareForExitWithCompletion:](self, "prepareForExitWithCompletion:", 0);
}

- (void)animateTransitionToFullScreen:(BOOL)a3
{
  _QWORD *v5;
  void *v6;
  dispatch_time_t v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;
  id location;

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1006D1048;
  v8[3] = &unk_1011B0408;
  v10 = a3;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  v5 = objc_retainBlock(v8);
  v6 = v5;
  if (self->_displayState)
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }
  else
  {
    v7 = dispatch_time(0, 100000000);
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v6);
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LookAroundContainerViewController;
  -[OverlayContainerViewController contentHeightUpdatedWithValue:](&v5, "contentHeightUpdatedWithValue:");
  -[LookAroundContainerViewController _updateLayoutWithValue:](self, "_updateLayoutWithValue:", a3);
}

- (void)snapToLayout:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)LookAroundContainerViewController;
  -[ContainerViewController snapToLayout:](&v4, "snapToLayout:", a3);
  -[LookAroundContainerViewController _updateLayoutWithCurrentValue](self, "_updateLayoutWithCurrentValue");
}

- (BOOL)useBackdrop
{
  return 0;
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4;
  uint64_t v5;
  char isKindOfClass;
  unint64_t v7;
  unint64_t result;
  BOOL v9;

  v4 = a3;
  v5 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0
    || (v7 = -[ContainerViewController containerStyle](self, "containerStyle"), result = 3, v7 <= 7)
    && ((1 << v7) & 0xE3) != 0)
  {
    v9 = self->_locationState < 2;
    if ((v9 || (isKindOfClass & 1) == 0) | -[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))return 1;
    else
      return 2;
  }
  return result;
}

- (void)popLastViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v9.receiver = self;
  v9.super_class = (Class)LookAroundContainerViewController;
  -[ContainerViewController popLastViewControllerAnimated:](&v9, "popLastViewControllerAnimated:", v3);
  v6 = objc_opt_class(PlaceCardViewController);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
    objc_msgSend(v8, "_deselectLabelMarkerAnimated:", 1);

    if (self->_locationState != 2)
      -[MKLookAroundView deselectLabelMarker](self->_lookAroundView, "deselectLabelMarker");
  }

}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a5;
  v6 = a4;
  v9 = a3;
  v10 = objc_opt_class(LookAroundTrayContaineeViewController);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0
    && !-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen"))
  {
    objc_storeStrong((id *)&self->_trayContaineeViewController, a3);
    -[LookAroundTrayContaineeViewController updateLocation](self->_trayContaineeViewController, "updateLocation");
    -[LookAroundTrayContaineeViewController setDelegate:](self->_trayContaineeViewController, "setDelegate:", self);
  }
  else
  {
    v11 = objc_opt_class(LookAroundTrayContaineeViewController);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      v13[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1006D1850;
      v14[3] = &unk_1011AC860;
      v14[4] = self;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1006D189C;
      v13[3] = &unk_1011AE8F8;
      +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 2, v14, v13, 0.0, 0.0);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)LookAroundContainerViewController;
  -[ContainerViewController presentController:animated:useDefaultContaineeLayout:](&v12, "presentController:animated:useDefaultContaineeLayout:", v9, v6, v5);

}

- (BOOL)_pipHugsLeading
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
  v5 = sub_1002A8AA0(v4);
  if (v5 == 5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    if (!objc_msgSend(v2, "effectiveUserInterfaceLayoutDirection"))
    {
      v7 = 1;
LABEL_9:

      goto LABEL_10;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
  if (sub_1002A8AA0(v6) == 5)
  {
    v7 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    v7 = objc_msgSend(v8, "effectiveUserInterfaceLayoutDirection") == (id)1;

  }
  if (v5 == 5)
    goto LABEL_9;
LABEL_10:

  return v7;
}

- (double)topEdgeInset
{
  unsigned int v3;
  double result;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect v16;

  v3 = -[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP");
  result = 0.0;
  if (v3)
  {
    v5 = 8.0;
    if (sub_1002A8AA0(self) == 5)
      v5 = sub_1005EC29C();
    if (-[LookAroundContainerViewController _shouldTakePIPViewHeightIntoAccount](self, "_shouldTakePIPViewHeightIntoAccount")&& -[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
      objc_msgSend(v7, "frame");
      v8 = v5 + CGRectGetMaxY(v15);
      -[ContainerViewController statusBarHeight](self, "statusBarHeight");
      if (v8 <= v9)
      {
        -[ContainerViewController statusBarHeight](self, "statusBarHeight");
        v12 = v14;
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController pipViewController](self, "pipViewController"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
        objc_msgSend(v11, "frame");
        v12 = v5 + CGRectGetMaxY(v16);

      }
    }
    else
    {
      -[ContainerViewController statusBarHeight](self, "statusBarHeight");
      v12 = v13;
    }
    return v12 + 0.0;
  }
  return result;
}

- (double)pipViewWidthIfNeeded
{
  double v3;
  void *v4;
  double v5;
  unint64_t v6;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  void *v10;
  double MaxX;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v3 = 0.0;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self->_pipViewController, "view"));
    v5 = 8.0;
    if (sub_1002A8AA0(self) == 5)
      v5 = sub_1005EC29C();
    v6 = -[ContainerViewController containerStyle](self, "containerStyle");
    v7 = (v6 < 8) & (0xE3u >> v6);
    v8 = -[LookAroundContainerViewController _shouldTakeSidebarIntoAccount](self, "_shouldTakeSidebarIntoAccount");
    v9 = -[LookAroundContainerViewController _shouldTakePIPViewHeightIntoAccount](self, "_shouldTakePIPViewHeightIntoAccount");
    if ((v7 & 1) == 0 && (v8 & 1) == 0 && (v9 & 1) == 0)
    {
      if (-[LookAroundContainerViewController _pipHugsLeading](self, "_pipHugsLeading"))
      {
        objc_msgSend(v4, "frame");
        v3 = v5 + CGRectGetMaxX(v13);
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
        objc_msgSend(v10, "bounds");
        MaxX = CGRectGetMaxX(v14);
        objc_msgSend(v4, "frame");
        v3 = MaxX - (CGRectGetMinX(v15) - v5);

      }
    }

  }
  return v3;
}

- (double)sidebarWidthIfNeeded
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  double MaxX;
  void *v8;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v3 = 0.0;
  if (-[LookAroundContainerViewController _shouldTakeSidebarIntoAccount](self, "_shouldTakeSidebarIntoAccount"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");

    if (v5 == (id)1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      objc_msgSend(v6, "bounds");
      MaxX = CGRectGetMaxX(v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
      objc_msgSend(v8, "frame");
      v3 = MaxX - CGRectGetMinX(v11);

    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController containerView](self, "containerView"));
      objc_msgSend(v6, "frame");
      v3 = CGRectGetMaxX(v12);
    }

  }
  return v3;
}

- (void)updateMapEdgeInsets
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 isRespondingToPanGesture;
  double v7;
  double top;
  double v9;
  double bottom;
  double v11;
  double left;
  double v13;
  double right;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if (!self->_modeTransition)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController viewIfLoaded](self, "viewIfLoaded"));
    if (v3)
    {
      v25 = (id)v3;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
      if (!v5 || -[ContainerViewController preventEdgeInsetsUpdate](self, "preventEdgeInsetsUpdate"))
      {

LABEL_7:
        return;
      }
      isRespondingToPanGesture = self->_isRespondingToPanGesture;

      if (!isRespondingToPanGesture)
      {
        -[LookAroundContainerViewController topEdgeInset](self, "topEdgeInset");
        top = v7;
        -[ContainerViewController bottomEdgeInset](self, "bottomEdgeInset");
        bottom = v9;
        -[ContainerViewController leftSafeOffset](self, "leftSafeOffset");
        left = v11;
        -[ContainerViewController rightSafeOffset](self, "rightSafeOffset");
        right = v13;
        -[LookAroundContainerViewController pipViewWidthIfNeeded](self, "pipViewWidthIfNeeded");
        v16 = v15;
        -[LookAroundContainerViewController sidebarWidthIfNeeded](self, "sidebarWidthIfNeeded");
        v18 = v17;
        if (-[ContainerViewController chromeHidden](self, "chromeHidden"))
        {
          top = UIEdgeInsetsZero.top;
          left = UIEdgeInsetsZero.left;
          bottom = UIEdgeInsetsZero.bottom;
          right = UIEdgeInsetsZero.right;
        }
        else
        {
          if (fabs(v16) > 2.22044605e-16)
          {
            if (-[LookAroundContainerViewController _pipHugsLeading](self, "_pipHugsLeading"))
              left = v16;
            else
              right = v16;
          }
          if (fabs(v18) > 2.22044605e-16)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
            v20 = objc_msgSend(v19, "effectiveUserInterfaceLayoutDirection");

            if (v20 == (id)1)
              right = v18;
            else
              left = v18;
          }
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        -[ContainerViewController statusBarHeight](self, "statusBarHeight");
        objc_msgSend(v21, "setLabelEdgeInsets:");

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        -[ContainerViewController statusBarHeight](self, "statusBarHeight");
        objc_msgSend(v22, "setLabelEdgeWidths:");

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeContext](self, "chromeContext"));
        objc_msgSend(v23, "setMapEdgeInsets:animated:forContext:", 0, v24, top, left, bottom, right);

        v25 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
        objc_msgSend(v25, "synchronizeMapViewIfNeeded");
        goto LABEL_7;
      }
    }
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  int64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (int64_t)objc_msgSend(v6, "userInterfaceStyle");
  if (v7 == 1)
  {
    if (-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen"))
      v7 = 2;
    else
      v7 = 1;
  }

  return v7;
}

- (void)lookAroundPIPDataCoordinatorDidStartPanningMapView:(id)a3
{
  void *v4;
  LookAroundActionCoordinator *actionCoordinator;
  void *v6;
  id v7;

  v7 = a3;
  if (self->_selectingLabelMarker)
  {
    -[MKLookAroundView recordTriggerAction:](self->_lookAroundView, "recordTriggerAction:", 1010);
  }
  else
  {
    self->_locationState = 2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    actionCoordinator = self->_actionCoordinator;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
    -[LookAroundActionCoordinator viewControllerGoPreviousState:withSender:](actionCoordinator, "viewControllerGoPreviousState:withSender:", v4, v6);

    -[MKLookAroundView recordTriggerAction:](self->_lookAroundView, "recordTriggerAction:", 1001);
  }
  self->_selectingLabelMarker = 0;

}

- (void)lookAroundPIPDataCoordinatorDidEndMovingLookAroundView:(id)a3
{
  void *v4;
  PlaceCardItem *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "lookAroundView"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapItem"));

  if (v8)
  {
    v5 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController actionCoordinator](self, "actionCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    objc_msgSend(v6, "viewController:presentPlaceCardForItem:", v7, v5);

  }
}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;

  v5 = a5;
  v9 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    self->_isRespondingToPanGesture = a4 == 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v8, "coordinateMapView:willStartRespondingToGesture:animated:", v9, a4, v5);

  }
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  _BOOL8 v9;
  void *v14;
  id v15;

  v9 = a7;
  v15 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v14, "coordinateMapView:didStopRespondingToGesture:zoomDirection:zoomGestureType:didDecelerate:tiltDirection:", v15, a4, a5, a6, v9, a8);

  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v4, "coordinateMapViewDidStartUserInteraction:", v5);

  }
}

- (void)mapViewDidStopUserInteraction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v4, "coordinateMapViewDidStopUserInteraction:", v5);

    self->_isRespondingToPanGesture = 0;
  }

}

- (void)mapView:(id)a3 willSelectLabelMarker:(id)a4
{
  id v6;
  id v7;
  id v8;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
      self->_selectingLabelMarker = 1;
    v8 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v8, "coordinateMapView:willSelectLabelMarker:", v7, v6);

  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v5, "coordinateMapViewRegionDidChange:", v6);

  }
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v4, "coordinateMapViewDidChangeVisibleRegion:", v8);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapLayer"));
  objc_msgSend(v5, "pitch");
  v7 = v6;

  -[LookAroundPuckViewController setPitch:](self->_puckViewController, "setPitch:", v7);
}

- (void)mapView:(id)a3 didChangeLookAroundAvailability:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v6, "coordinateMapView:didChangeLookAroundAvailability:", v7, a4);

  }
}

- (void)lookAroundTTRButtonView:(id)a3 didTapTTRButton:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController actionCoordinator](self, "actionCoordinator", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  objc_msgSend(v6, "viewControllerPresentTTR:", v5);

}

- (void)lookAroundTrayContaineeViewController:(id)a3 didTapToggleLabelsButton:(id)a4
{
  uint64_t v5;

  if (-[MKLookAroundView showsPointLabels](self->_lookAroundView, "showsPointLabels", a3, a4))
    v5 = -[MKLookAroundView showsRoadLabels](self->_lookAroundView, "showsRoadLabels") ^ 1;
  else
    v5 = 1;
  -[LookAroundContainerViewController _toggleShowingLabels:](self, "_toggleShowingLabels:", v5);
}

- (void)lookAroundTrayContaineeViewController:(id)a3 didTapShareButton:(id)a4
{
  -[LookAroundContainerViewController _shareCurrentLocation:](self, "_shareCurrentLocation:", a4);
}

- (void)lookAroundTrayContaineeViewController:(id)a3 didTapReportAnIssueButton:(id)a4
{
  -[LookAroundContainerViewController _reportAnIssue](self, "_reportAnIssue", a3, a4);
}

- (UIView)passThroughView
{
  void *v3;
  MKLookAroundView *v4;
  MKLookAroundView *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (MKLookAroundView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "passThroughView"));

  if (-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen"))
  {
    v5 = self->_lookAroundView;

    v4 = v5;
  }
  return (UIView *)v4;
}

- (void)lookAroundViewDidStartUserInteraction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v4, "coordinateLookAroundViewDidStartUserInteraction:", v5);

  }
}

- (void)lookAroundViewDidStopUserInteraction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v4, "coordinateLookAroundViewDidStopUserInteraction:", v5);

  }
}

- (void)lookAroundView:(id)a3 didTapLabelMarker:(id)a4
{
  -[LookAroundContainerViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 6072, -[LookAroundContainerViewController _targetForAnalytics](self, "_targetForAnalytics", a3, a4), 0);
}

- (void)lookAroundView:(id)a3 didTapAtPoint:(CGPoint)a4 areaAvailable:(BOOL)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  if (a5)
  {
    v8 = 6072;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v10 = dispatch_time(0, 250000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006D2740;
    block[3] = &unk_1011AD238;
    block[4] = self;
    v13 = v9;
    v14 = v7;
    v11 = v9;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

    v8 = 1061;
  }
  -[LookAroundContainerViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", v8, -[LookAroundContainerViewController _targetForAnalytics](self, "_targetForAnalytics"), 0);

}

- (void)lookAroundView:(id)a3 didZoomWithDirection:(int64_t)a4 type:(int64_t)a5
{
  uint64_t v5;

  if (a4 == 1)
    v5 = 1043;
  else
    v5 = 1044;
  -[LookAroundContainerViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", v5, -[LookAroundContainerViewController _targetForAnalytics](self, "_targetForAnalytics", a3), 0);
}

- (void)lookAroundViewDidPan:(id)a3
{
  -[LookAroundContainerViewController _captureUserAction:onTarget:eventValue:](self, "_captureUserAction:onTarget:eventValue:", 6069, -[LookAroundContainerViewController _targetForAnalytics](self, "_targetForAnalytics", a3), 0);
}

- (void)lookAroundView:(id)a3 didChangeCameraFrame:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  if (-[LookAroundContainerViewController isDisplayingLookAroundPIP](self, "isDisplayingLookAroundPIP"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v5, "coordinateLookAroundViewDidChangeVisibleRegion:", v6);

  }
}

- (void)lookAroundView:(id)a3 didChangeLocationInfo:(id)a4
{
  unint64_t locationState;
  void *v6;

  locationState = self->_locationState;
  if (locationState == 2)
  {
    self->_locationState = 3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate", a3, a4));
    objc_msgSend(v6, "refreshTitle");

  }
  else if (!locationState)
  {
    self->_locationState = 1;
  }
  -[LookAroundTrayContaineeViewController updateLocation](self->_trayContaineeViewController, "updateLocation", a3, a4);
}

- (void)lookAroundView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  id v16;
  PlaceCardItem *v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  LookAroundActionCoordinator *actionCoordinator;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  LookAroundContainerViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  CGRect v36;
  CGRect v37;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431B9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class(v6);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (objc_class *)objc_opt_class(v7);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v26 = 134219010;
    v27 = self;
    v28 = 2112;
    v29 = v12;
    v30 = 2048;
    v31 = v6;
    v32 = 2112;
    v33 = v15;
    v34 = 2048;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "<LookAroundContainerViewController: %p> -lookAroundView:<%@: %p> didSelectLabelMarker:<%@: %p>", (uint8_t *)&v26, 0x34u);

  }
  self->_locationState = 3;
  v16 = objc_msgSend(objc_alloc((Class)MKMapItem), "_initWithLabelMarker:", v7);
  v17 = -[PlaceCardItem initWithMapItem:]([PlaceCardItem alloc], "initWithMapItem:", v16);
  objc_msgSend(v7, "calloutAnchorPointWithSnapToPixels:", 0);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v7, "lateralCalloutAnchorRect");
  v37 = CGRectOffset(v36, v19, v21);
  -[PlaceCardItem setCalloutAnchorRect:](v17, "setCalloutAnchorRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
  actionCoordinator = self->_actionCoordinator;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  -[LookAroundActionCoordinator viewController:presentPlaceCardForItem:](actionCoordinator, "viewController:presentPlaceCardForItem:", v23, v17);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));
  if (objc_msgSend(v24, "isLandmarkPOI"))
    v25 = 6071;
  else
    v25 = 1010;

  -[LookAroundContainerViewController _captureActivityCardAnalyticsForUserAction:onTarget:](self, "_captureActivityCardAnalyticsForUserAction:onTarget:", v25, 1702);
}

- (void)lookAroundView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  dispatch_time_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  LookAroundContainerViewController *v24;
  id v25;
  uint8_t buf[4];
  LookAroundContainerViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v6 = a3;
  v7 = a4;
  v8 = sub_100431B9C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class(v6);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (objc_class *)objc_opt_class(v7);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 134219010;
    v27 = self;
    v28 = 2112;
    v29 = v12;
    v30 = 2048;
    v31 = v6;
    v32 = 2112;
    v33 = v15;
    v34 = 2048;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "<LookAroundContainerViewController: %p> -lookAroundView:<%@: %p> didDeselectLabelMarker:<%@: %p>", buf, 0x34u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v17 = dispatch_time(0, 250000000);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1006D2C64;
  v21[3] = &unk_1011AF1B0;
  v22 = v6;
  v23 = v7;
  v24 = self;
  v25 = v16;
  v18 = v16;
  v19 = v7;
  v20 = v6;
  dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v21);

}

- (void)lookAroundViewWillChangeLocationInfo:(id)a3
{
  id v4;
  id v5;

  self->_locationState = 2;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  -[LookAroundActionCoordinator viewControllerGoPreviousState:withSender:](self->_actionCoordinator, "viewControllerGoPreviousState:withSender:", v5, v4);

}

- (id)urlForMapActivity:(id)a3
{
  return -[MKLookAroundView sharingURL](self->_lookAroundView, "sharingURL", a3);
}

- (id)titleForMapActivity:(id)a3
{
  void *v4;
  MKLookAroundView *lookAroundView;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView mapItem](self->_lookAroundView, "mapItem", a3));

  lookAroundView = self->_lookAroundView;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView mapItem](lookAroundView, "mapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView locationTitle](lookAroundView, "locationTitle"));
  }
  return v7;
}

- (void)_captureActivityCardAnalyticsForUserAction:(int)a3 onTarget:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  unsigned __int8 v23;
  uint64_t v24;
  id v25;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapItem"));
  v9 = objc_msgSend(v8, "_hasMUID");

  v25 = 0;
  if ((_DWORD)v5 != 4 && v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mapItem"));
    v25 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v11, "_muid")));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v12, "centerCoordinate");
  v15 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", v13, v14);
  objc_msgSend(v12, "presentationYaw");
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lookAroundView"));
  objc_msgSend(v18, "trackingZoomScale");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "visiblePlaceMUIDs"));
  v22 = objc_msgSend(v21, "count");
  if ((objc_msgSend(v12, "showsRoadLabels") & 1) != 0)
    v23 = 1;
  else
    v23 = objc_msgSend(v12, "showsPointLabels");
  LOBYTE(v24) = v23;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:", v5, v4, v25, v15, v17, v22, v20, v24);

}

- (void)_toggleShowingLabels:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  if (a3)
    v5 = 6067;
  else
    v5 = 6066;
  -[LookAroundContainerViewController _captureActivityCardAnalyticsForUserAction:onTarget:](self, "_captureActivityCardAnalyticsForUserAction:onTarget:", v5, 1701);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v6, "setShowsPointLabels:", v3);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v7, "setShowsRoadLabels:", v3);

}

- (void)_reportAnIssue
{
  RAPLookAroundContextImpl *v3;
  void *v4;
  void *v5;
  void *v6;
  RAPLookAroundContextImpl *v7;

  -[LookAroundContainerViewController _captureActivityCardAnalyticsForUserAction:onTarget:](self, "_captureActivityCardAnalyticsForUserAction:onTarget:", 5013, 1701);
  v3 = [RAPLookAroundContextImpl alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  v7 = -[RAPLookAroundContextImpl initWithLookAroundView:](v3, "initWithLookAroundView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rapPresenter"));
  objc_msgSend(v6, "presentLookAroundRAPWithContext:completion:", v7, 0);

}

- (CGRect)_sanitizedOriginFrame
{
  double v3;
  double x;
  double v5;
  double y;
  double v7;
  double width;
  double v9;
  double height;
  CGRect *p_originFrame;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat MidX;
  double v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  if (sub_1002A8AA0(self) == 5)
  {
    -[LookAroundContainerViewController frameForPIPView](self, "frameForPIPView");
    x = v3;
    y = v5;
    width = v7;
    height = v9;
  }
  else
  {
    p_originFrame = &self->_originFrame;
    x = self->_originFrame.origin.x;
    y = self->_originFrame.origin.y;
    width = self->_originFrame.size.width;
    height = self->_originFrame.size.height;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    if (CGRectIsEmpty(v35))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;

      v21 = v18 / v20;
      height = 1.0;
      if (v18 / v20 <= 1.0)
      {
        width = 1.0;
        if (v21 > 0.0)
          height = 1.0 / v21;
      }
      else
      {
        width = v18 / v20;
      }
      v36.origin.x = v14;
      v36.origin.y = v16;
      v36.size.width = v18;
      v36.size.height = v20;
      MidX = CGRectGetMidX(v36);
      v23 = v20;
      y = 0.0;
      x = 0.0;
      if (MidX - width * 0.5 > 0.0)
      {
        v24 = v14;
        v25 = v16;
        v26 = v18;
        v27 = CGRectGetMidX(*(CGRect *)(&v23 - 3));
        v23 = v20;
        x = v27 - width * 0.5;
      }
      v28 = v14;
      v29 = v16;
      v30 = v18;
      if (CGRectGetMidY(*(CGRect *)(&v23 - 3)) - height * 0.5 > 0.0)
      {
        v37.origin.x = v14;
        v37.origin.y = v16;
        v37.size.width = v18;
        v37.size.height = v20;
        y = CGRectGetMidY(v37) - height * 0.5;
      }
      p_originFrame->origin.x = x;
      p_originFrame->origin.y = y;
      p_originFrame->size.width = width;
      p_originFrame->size.height = height;
    }
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)_shareCurrentLocation:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  -[LookAroundContainerViewController _captureActivityCardAnalyticsForUserAction:onTarget:](self, "_captureActivityCardAnalyticsForUserAction:onTarget:", 6013, 1701);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController createActivityViewControllerForCurrentContext](self, "createActivityViewControllerForCurrentContext"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController _popoverController](self, "_popoverController"));
      if (v7)
      {

        v8 = 3;
      }
      else if (-[LookAroundContainerViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"))
      {
        v8 = 3;
      }
      else
      {
        v8 = 7;
      }
      objc_msgSend(v4, "setModalPresentationStyle:", v8);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "popoverPresentationController"));
    objc_msgSend(v9, "setPermittedArrowDirections:", 15);
    objc_msgSend(v9, "setSourceView:", v10);
    objc_msgSend(v10, "bounds");
    objc_msgSend(v9, "setSourceRect:");
    -[LookAroundContainerViewController _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v4, 1, 0);

  }
}

- (BOOL)_shouldTakePIPViewHeightIntoAccount
{
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  _BOOL4 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned int v11;
  BOOL v12;
  BOOL result;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  v4 = (v3 > 7) | (0x1Cu >> v3);
  v5 = -[ContainerViewController containerStyle](self, "containerStyle");
  v6 = -[ContainerViewController containerStyle](self, "containerStyle");
  v7 = v6;
  v8 = v6 < 8;
  v9 = -[LookAroundContainerViewController _shouldTakeSidebarIntoAccount](self, "_shouldTakeSidebarIntoAccount");
  v10 = v9;
  v11 = v8 & (0xA3u >> v7);
  if (v5 == 1)
    v12 = 1;
  else
    v12 = v9;
  result = (v4 | v11) & v12;
  if ((v4 & 1) != 0 && (v10 & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController view](self, "view"));
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    if (sub_1002A8AA0(self) == 5)
    {
      v19 = sub_1005EC29C();
      v20 = -2.0;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundPIPViewController view](self->_pipViewController, "view", v19, v20));
    UIRectInset(objc_msgSend(v21, "bounds"));
    v23 = v22;
    v25 = v24;

    result = v12;
    if (v18 * (v16 - v23) * 1.20000005 > v16 * (v18 - v25))
      return 0;
  }
  return result;
}

- (BOOL)_shouldTakeSidebarIntoAccount
{
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  v4 = (v3 < 8) & (0xE3u >> v3);
  v5 = -[ContainerViewController containerStyle](self, "containerStyle");
  v6 = ((v5 > 7) | (0x5Cu >> v5)) & !-[ContainerViewController chromeHidden](self, "chromeHidden");
  if ((v4 & 1) == 0 && v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v8 = objc_opt_class(PlaceCardViewController);
    v6 &= objc_opt_isKindOfClass(v7, v8);

  }
  return v6;
}

- (void)_insertPuckViewIntoMapView:(id)a3
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
  _QWORD v19[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v6, "addChildViewController:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v4, "_insertSubviewBelowAnnotationContainerView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "didMoveToParentViewController:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "centerXAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v11));
  v19[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v19[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)_removePuckViewFromMapView
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController puckViewController](self, "puckViewController"));
  objc_msgSend(v3, "willMoveToParentViewController:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(v3, "removeFromParentViewController");
}

- (void)_setModeDidBecomeCurrent
{
  void *v3;
  id v4;

  self->_modeIsCurrent = 1;
  if (self->_containerIsVisible)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));
    -[LookAroundContainerViewController _insertPuckViewIntoMapView:](self, "_insertPuckViewIntoMapView:", v3);

  }
}

- (void)_setModeDidResignCurrent
{
  self->_modeIsCurrent = 0;
  if (!self->_containerIsVisible)
    -[LookAroundContainerViewController _removePuckViewFromMapView](self, "_removePuckViewFromMapView");
}

- (void)_updateTTRButtonState
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("__internal__HideTapToRadarInMunin"));

  -[LookAroundTTRButtonView setHidden:](self->_ttrButtonView, "setHidden:", v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1014B0728 == a6)
    -[LookAroundContainerViewController _updateTTRButtonState](self, "_updateTTRButtonState", a3, a4, a5);
}

- (void)_captureUserAction:(int)a3 onTarget:(int)a4 eventValue:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  unsigned __int8 v21;
  uint64_t v22;
  id v23;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v23 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController dataCoordinator](self, "dataCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  objc_msgSend(v9, "centerCoordinate");
  v13 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithLatitude:longitude:", v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "camera"));
  objc_msgSend(v14, "heading");
  v16 = v15;
  objc_msgSend(v9, "_zoomLevel");
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "visiblePlaceMUIDs"));
  v20 = objc_msgSend(v19, "count");
  if ((objc_msgSend(v10, "showsRoadLabels") & 1) != 0)
    v21 = 1;
  else
    v21 = objc_msgSend(v10, "showsPointLabels");
  LOBYTE(v22) = v21;
  +[GEOAPPortal captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:](GEOAPPortal, "captureLookAroundUserAction:onTarget:eventValue:location:heading:zoom:numberPoisInView:labelingShown:", v6, v5, v23, v13, v16, v20, v18, v22);

}

- (int)_targetForAnalytics
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  unsigned int v6;
  int v7;
  int v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = objc_opt_class(PlaceCardViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  v6 = -[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen");
  if ((isKindOfClass & 1) != 0)
    v7 = 1706;
  else
    v7 = 1702;
  if ((isKindOfClass & 1) != 0)
    v8 = 1707;
  else
    v8 = 1700;
  if (v6)
    return v7;
  else
    return v8;
}

- (ShareItemSource)currentShareItemSource
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  LookAroundShareItemSource *v9;
  void *v10;
  LookAroundShareItemSource *v11;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  double latitude;
  double longitude;
  id v18;
  CLLocationCoordinate2D v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView muninViewState](self->_lookAroundView, "muninViewState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cameraFrame"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItem"));
  if (v6)
  {
    v7 = (id)v6;

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController lookAroundView](self, "lookAroundView"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "revGeoMapItem"));

    if (!v7)
    {
      objc_msgSend(v4, "latitude");
      v14 = v13;
      objc_msgSend(v4, "longitude");
      v19 = CLLocationCoordinate2DMake(v14, v15);
      latitude = v19.latitude;
      longitude = v19.longitude;
      if (CLLocationCoordinate2DIsValid(v19))
      {
        v18 = objc_msgSend(objc_alloc((Class)MKPlacemark), "initWithCoordinate:addressDictionary:", &__NSDictionary0__struct, latitude, longitude);
        v7 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v18);

        if (v7)
          goto LABEL_4;
      }
      else
      {
        v7 = 0;
      }
      v11 = 0;
      goto LABEL_5;
    }
  }
LABEL_4:
  v9 = [LookAroundShareItemSource alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MKLookAroundView muninViewState](self->_lookAroundView, "muninViewState"));
  v11 = -[LookAroundShareItemSource initWithMapItem:muninViewState:](v9, "initWithMapItem:muninViewState:", v7, v10);

  -[LookAroundShareItemSource setActivityProviderDelegate:](v11, "setActivityProviderDelegate:", self);
LABEL_5:

  return (ShareItemSource *)v11;
}

- (id)createActivityViewControllerForCurrentContext
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LookAroundContainerViewController currentShareItemSource](self, "currentShareItemSource"));
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)MUActivityViewController), "initWithShareItem:", v3);
    objc_msgSend(v4, "setActivityControllerDelegate:", self);
    if (-[LookAroundContainerViewController isDisplayingLookAroundFullScreen](self, "isDisplayingLookAroundFullScreen"))
      objc_msgSend(v4, "setOverrideUserInterfaceStyle:", 2);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (LookAroundContainerViewControllerAnimationDelegate)animationDelegate
{
  return (LookAroundContainerViewControllerAnimationDelegate *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (LookAroundActionCoordinator)actionCoordinator
{
  return self->_actionCoordinator;
}

- (MKLookAroundView)lookAroundView
{
  return self->_lookAroundView;
}

- (CGRect)lookAroundButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_lookAroundButtonFrame.origin.x;
  y = self->_lookAroundButtonFrame.origin.y;
  width = self->_lookAroundButtonFrame.size.width;
  height = self->_lookAroundButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLookAroundButtonFrame:(CGRect)a3
{
  self->_lookAroundButtonFrame = a3;
}

- (CGRect)originFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originFrame.origin.x;
  y = self->_originFrame.origin.y;
  width = self->_originFrame.size.width;
  height = self->_originFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginFrame:(CGRect)a3
{
  self->_originFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_actionCoordinator, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_pipViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_ttrButtonView, 0);
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
  objc_storeStrong((id *)&self->_puckViewController, 0);
  objc_storeStrong((id *)&self->_pipViewController, 0);
  objc_storeStrong((id *)&self->_lookAroundViewOriginalSuperview, 0);
  objc_storeStrong((id *)&self->_entryPoint, 0);
}

@end
