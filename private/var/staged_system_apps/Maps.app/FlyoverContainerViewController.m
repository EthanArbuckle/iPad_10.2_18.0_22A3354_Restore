@implementation FlyoverContainerViewController

- (FlyoverContainerViewController)initWithMapItem:(id)a3
{
  id v5;
  FlyoverContainerViewController *v6;
  FlyoverActionCoordinator *v7;
  FlyoverActionCoordinator *flyoverActionCoordinator;
  NSMutableDictionary *v9;
  NSMutableDictionary *trackingStateAndReasonChangesBegan;
  OverlayContainerDimmingController *v11;
  DimmingBehaviour *v12;
  void *v13;
  OverlayContainerDimmingController *v14;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FlyoverContainerViewController;
  v6 = -[ContainerViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  if (v6)
  {
    v7 = -[FlyoverActionCoordinator initWithContainerViewController:]([FlyoverActionCoordinator alloc], "initWithContainerViewController:", v6);
    flyoverActionCoordinator = v6->_flyoverActionCoordinator;
    v6->_flyoverActionCoordinator = v7;

    v6->_initialOrientation = 0;
    objc_storeStrong((id *)&v6->_mapItem, a3);
    v6->_sessionInterruptedReason = 0;
    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    trackingStateAndReasonChangesBegan = v6->_trackingStateAndReasonChangesBegan;
    v6->_trackingStateAndReasonChangesBegan = v9;

    v11 = [OverlayContainerDimmingController alloc];
    v12 = sub_10075C278();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = -[OverlayContainerDimmingController initWithDimmingBehaviour:customBehaviours:](v11, "initWithDimmingBehaviour:customBehaviours:", v13, 0);
    -[OverlayContainerViewController setDimmingBehaviour:](v6, "setDimmingBehaviour:", v14);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillResignActiveNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  -[FlyoverContainerViewController dealloc](&v4, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  -[OverlayContainerViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v3, "setHidden:", 1);

  -[FlyoverContainerViewController _setupViews](self, "_setupViews");
  -[FlyoverContainerViewController _setupConstraints](self, "_setupConstraints");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  -[OverlayContainerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[FlyoverContainerViewController hideChrome:animated:](self, "hideChrome:animated:", 1, 0);
}

- (int64_t)preferredUserInterfaceStyle
{
  return 2;
}

- (void)_setupViews
{
  void *v3;
  void *v4;
  unsigned int v5;
  FlyoverStatusView *v6;
  FlyoverStatusView *statusView;
  void *v8;
  void *v9;
  id v10;
  FlyoverBannerView *v11;
  _QWORD *p_flyoverBannerView;
  FlyoverBannerView *flyoverBannerView;
  void *v14;
  UILabel *v15;
  UILabel *tourLabel;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("FlyoverContainerView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  v5 = objc_msgSend(v4, "supportsARMode");

  if (v5)
  {
    v6 = -[FlyoverStatusView initWithFrame:]([FlyoverStatusView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    statusView = self->_statusView;
    self->_statusView = v6;

    -[FlyoverStatusView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
    objc_msgSend(v8, "addSubview:", self->_statusView);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController traitCollection](self, "traitCollection"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10 == (id)5)
  {
    v11 = -[FlyoverBannerView initWithDelegate:]([FlyoverBannerView alloc], "initWithDelegate:", self);
    p_flyoverBannerView = &self->_flyoverBannerView;
    flyoverBannerView = self->_flyoverBannerView;
    self->_flyoverBannerView = v11;

    -[FlyoverBannerView setTranslatesAutoresizingMaskIntoConstraints:](self->_flyoverBannerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FlyoverBannerView setAlpha:](self->_flyoverBannerView, "setAlpha:", 0.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
  }
  else
  {
    v15 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    p_flyoverBannerView = &self->_tourLabel;
    tourLabel = self->_tourLabel;
    self->_tourLabel = v15;

    -[UILabel setAlpha:](self->_tourLabel, "setAlpha:", 0.0);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_tourLabel, "setAdjustsFontSizeToFitWidth:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 22.0));
    -[UILabel setFont:](self->_tourLabel, "setFont:", v17);

    -[UILabel setMinimumScaleFactor:](self->_tourLabel, "setMinimumScaleFactor:", 0.5);
    -[UILabel setNumberOfLines:](self->_tourLabel, "setNumberOfLines:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "colorWithAlphaComponent:", 0.5));
    -[UILabel setShadowColor:](self->_tourLabel, "setShadowColor:", v19);

    -[UILabel setShadowOffset:](self->_tourLabel, "setShadowOffset:", -1.0, 1.0);
    -[UILabel setTextAlignment:](self->_tourLabel, "setTextAlignment:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_tourLabel, "setTextColor:", v20);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_tourLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](self->_tourLabel, "setAccessibilityIdentifier:", CFSTR("FlyoverTourLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  }
  v21 = v14;
  objc_msgSend(v14, "addSubview:", *p_flyoverBannerView);

}

- (void)_setupConstraints
{
  void *v3;
  unsigned int v4;
  _UNKNOWN **v5;
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
  id v16;
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
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  _QWORD v42[2];
  _QWORD v43[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  v4 = objc_msgSend(v3, "supportsARMode");

  v5 = MKPlaceCollectionsLogicController_ptr;
  if (v4)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusView topAnchor](self->_statusView, "topAnchor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "safeAreaLayoutGuide"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:constant:", v8, 6.0));
    v43[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusView centerXAnchor](self->_statusView, "centerXAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
    v43[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

    v5 = MKPlaceCollectionsLogicController_ptr;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController traitCollection](self, "traitCollection"));
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if (v16 == (id)5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView bottomAnchor](self->_flyoverBannerView, "bottomAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, -8.0));
    v42[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverBannerView centerXAnchor](self->_flyoverBannerView, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerXAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
    v42[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[304], "arrayWithObjects:count:", v42, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_tourLabel, "leadingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:", v37));
    v41[0] = v36;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_tourLabel, "trailingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintLessThanOrEqualToAnchor:", v23));
    v41[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_tourLabel, "centerXAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "centerXAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v41[2] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_tourLabel, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v30, -15.0));
    v41[3] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5[304], "arrayWithObjects:count:", v41, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

    v21 = v33;
    v20 = (void *)v36;

    v22 = v35;
    v19 = (void *)v37;

    v18 = v39;
    v17 = v38;

  }
}

- (double)compassDiameter
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController mapView](self, "mapView"));
  objc_msgSend(v2, "_compassDiameter");
  v4 = v3;

  return v4;
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform", a3));
  if (objc_msgSend(v3, "supportsARMode"))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (objc_msgSend(v7, "conformsToProtocol:", &OBJC_PROTOCOL___MapViewResponderHandling))
    objc_msgSend(v7, "didTapMapView:atPoint:", v10, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
  v9 = objc_msgSend(v8, "isFlyoverRunning");

  if (v9)
    -[FlyoverContainerViewController hideChrome:animated:](self, "hideChrome:animated:", -[ContainerViewController chromeHidden](self, "chromeHidden") ^ 1, 1);

}

- (void)hideChrome:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v4 = a4;
  v5 = a3;
  if (-[ContainerViewController chromeHidden](self, "chromeHidden") != a3)
  {
    -[ContainerViewController setChromeHidden:](self, "setChromeHidden:", v5);
    if (-[ContainerViewController delaysFirstCardPresentation]_0())
    {
      -[ContainerViewController setContaineesHidden:](self, "setContaineesHidden:", v5);
    }
    else
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100450220;
      v13[3] = &unk_1011AC8B0;
      v13[4] = self;
      v7 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController visibleCardViews](self, "visibleCardViews"));
      v14 = v7;
      v8 = objc_retainBlock(v13);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1004503F4;
      v12[3] = &unk_1011AE8F8;
      v12[4] = self;
      v9 = objc_retainBlock(v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
      objc_msgSend(v10, "endEditing:", 1);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
      objc_msgSend(v11, "setUserInteractionEnabled:", 0);

      if (v4)
      {
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v9, 0.25);
      }
      else
      {
        ((void (*)(_QWORD *))v8[2])(v8);
        ((void (*)(_QWORD *, uint64_t))v9[2])(v9, 1);
      }

    }
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  objc_super v4;

  if (-[ContainerViewController chromeHidden](self, "chromeHidden"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)FlyoverContainerViewController;
  return -[FlyoverContainerViewController prefersStatusBarHidden](&v4, "prefersStatusBarHidden");
}

- (void)updateMapEdgeInsets
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1004504EC;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v2, &stru_1011B7340, 0.25);
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (void)mapViewWillEnterAR:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_mapLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
  v8 = (unint64_t)objc_msgSend(v7, "interfaceOrientation") - 1;
  if (v8 > 3)
    v9 = 0;
  else
    v9 = qword_100E37378[v8];
  objc_msgSend(v10, "setARInterfaceOrientation:", v9);

}

- (void)mapViewWillStartFlyoverTour:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = objc_msgSend(v4, "_currentFlyoverAnimationID");

  objc_msgSend(v5, "captureUserAction:flyoverAnimationID:", 17028, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  if ((objc_msgSend(v7, "supportsARMode") & 1) == 0)
  {

    goto LABEL_5;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController mapView](self, "mapView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapLayer"));
  v10 = objc_msgSend(v9, "isFlyoverUnificationEnabled");

  if (v10)
  {
LABEL_5:
    -[FlyoverContainerViewController _enterFlyover](self, "_enterFlyover");
    v11 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverDelegate](self, "flyoverDelegate"));
    objc_msgSend(v11, "viewControllerDidStartFlyover:", self);

  }
}

- (void)mapViewDidEnterAR:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  uint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSTimer *v21;
  NSTimer *flyoverIntroTimer;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapRegion"));
  objc_msgSend(v4, "_zoomLevel");
  v8 = v7;
  v9 = objc_msgSend(v4, "mapType");
  v10 = 1;
  switch((unint64_t)v9)
  {
    case 0uLL:
      break;
    case 1uLL:
    case 3uLL:
      v10 = 2;
      break;
    case 2uLL:
    case 4uLL:
      v10 = 3;
      break;
    default:
      if (v9 == (id)104)
        v11 = 4;
      else
        v11 = 0;
      if (v9 == (id)102)
        v10 = 1;
      else
        v10 = v11;
      break;
  }
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:mapRegion:zoomLevel:mapType:", 33, 646, 0, v6, v10, v8);

  -[FlyoverContainerViewController _enterFlyover](self, "_enterFlyover");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_mapLayer"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "windowScene"));
  v17 = (char *)objc_msgSend(v16, "interfaceOrientation");
  v18 = 0;
  if ((unint64_t)(v17 - 1) <= 3)
    v18 = qword_100E37378[(_QWORD)(v17 - 1)];
  objc_msgSend(v12, "setARInterfaceOrientation:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
  if (v19)
  {
    objc_initWeak(&location, self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100450968;
    v27 = &unk_1011ADF20;
    objc_copyWeak(&v28, &location);
    v21 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer _maps_scheduledTimerWithFireDate:block:](NSTimer, "_maps_scheduledTimerWithFireDate:block:", v20, &v24));
    flyoverIntroTimer = self->_flyoverIntroTimer;
    self->_flyoverIntroTimer = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverDelegate](self, "flyoverDelegate", v24, v25, v26, v27));
    objc_msgSend(v23, "viewControllerDidStartFlyover:", self);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

- (void)mapViewDidExitAR:(id)a3
{
  NSTimer *flyoverIntroTimer;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  unint64_t currentTrackingState;
  uint64_t v10;
  unint64_t currentTrackingStateReason;
  uint64_t v12;
  id v13;

  -[NSTimer invalidate](self->_flyoverIntroTimer, "invalidate", a3);
  flyoverIntroTimer = self->_flyoverIntroTimer;
  self->_flyoverIntroTimer = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  if (!objc_msgSend(v5, "supportsARMode"))
  {
LABEL_10:

    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController mapView](self, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
  v8 = objc_msgSend(v7, "isFlyoverUnificationEnabled");

  if ((v8 & 1) == 0)
  {
    currentTrackingState = self->_currentTrackingState;
    if (currentTrackingState >= 3)
      v10 = 0;
    else
      v10 = (currentTrackingState + 4011);
    -[FlyoverContainerViewController _captureTelemetricEventWithOldKey:newKey:](self, "_captureTelemetricEventWithOldKey:newKey:", v10, 0);
    currentTrackingStateReason = self->_currentTrackingStateReason;
    if (currentTrackingStateReason >= 5)
      v12 = 0;
    else
      v12 = (currentTrackingStateReason + 4021);
    -[FlyoverContainerViewController _captureTelemetricEventWithOldKey:newKey:](self, "_captureTelemetricEventWithOldKey:newKey:", v12, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 34, 646, 0);
    goto LABEL_10;
  }
LABEL_11:
  v13 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverDelegate](self, "flyoverDelegate"));
  objc_msgSend(v13, "viewControllerDidEndFlyover:", self);

}

- (void)cleanupFlyover
{
  void *v3;
  int64_t v4;
  int64_t v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v3, "setMapsIsShowingTour:", 0);

  v4 = -[FlyoverContainerViewController startViewMode](self, "startViewMode");
  if (v4 != 6)
  {
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
    objc_msgSend(v6, "updateViewMode:animated:", v5, 1);

  }
}

- (void)mapView:(id)a3 didEncounterARError:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator", a3, a4));
  objc_msgSend(v5, "viewControllerEndFlyover:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appCoordinator"));
  objc_msgSend(v6, "exitFlyover");

}

- (void)mapView:(id)a3 arSessionWasInterrupted:(unint64_t)a4
{
  FlyoverStatusView *statusView;
  id v7;
  unint64_t currentTrackingStateReason;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;

  if (a4 != 2 && !self->_flyoverMode)
  {
    statusView = self->_statusView;
    v7 = a3;
    -[FlyoverStatusView setTrackingStateReason:](statusView, "setTrackingStateReason:", 4);
    currentTrackingStateReason = self->_currentTrackingStateReason;
    if (currentTrackingStateReason >= 5)
      v9 = 0;
    else
      v9 = (currentTrackingStateReason + 4021);
    -[FlyoverContainerViewController _captureTelemetricEventWithOldKey:newKey:](self, "_captureTelemetricEventWithOldKey:newKey:", v9, 4025);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_mapLayer"));

    objc_msgSend(v10, "setFlyoverMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
    v12 = objc_msgSend(v11, "isFlyoverRunning");

    if (v12)
      -[FlyoverContainerViewController hideChrome:animated:](self, "hideChrome:animated:", 0, 1);
  }
  self->_sessionInterruptedReason = a4;
}

- (void)mapViewARSessionInterruptionEnded:(id)a3
{
  void *v4;

  self->_sessionInterruptedReason = 0;
  if (self->_flyoverMode != 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_mapLayer"));
    objc_msgSend(v4, "setFlyoverMode:", 0);

    -[FlyoverStatusView setTrackingStateReason:](self->_statusView, "setTrackingStateReason:", 0);
    -[FlyoverContainerViewController _captureTelemetricEventWithOldKey:newKey:](self, "_captureTelemetricEventWithOldKey:newKey:", 4025, 4021);
  }
}

- (void)mapView:(id)a3 arTrackingStateDidChange:(unint64_t)a4 reason:(unint64_t)a5
{
  unint64_t currentTrackingState;
  uint64_t v9;
  uint64_t v10;
  unint64_t currentTrackingStateReason;
  uint64_t v12;
  uint64_t v13;

  -[FlyoverStatusView setTrackingStateReason:](self->_statusView, "setTrackingStateReason:", a5);
  +[GEOAPPortal captureTelemetricEntityCountForEventKey:eventValue:eventDetail:](GEOAPPortal, "captureTelemetricEntityCountForEventKey:eventValue:eventDetail:", 4001, a4, 0);
  +[GEOAPPortal captureTelemetricEntityCountForEventKey:eventValue:eventDetail:](GEOAPPortal, "captureTelemetricEntityCountForEventKey:eventValue:eventDetail:", 4002, a5, 0);
  currentTrackingState = self->_currentTrackingState;
  if (currentTrackingState != a4)
  {
    if (currentTrackingState >= 3)
      v9 = 0;
    else
      v9 = (currentTrackingState + 4011);
    if (a4 >= 3)
      v10 = 0;
    else
      v10 = (a4 + 4011);
    -[FlyoverContainerViewController _captureTelemetricEventWithOldKey:newKey:](self, "_captureTelemetricEventWithOldKey:newKey:", v9, v10);
  }
  currentTrackingStateReason = self->_currentTrackingStateReason;
  if (currentTrackingStateReason != a5)
  {
    if (currentTrackingStateReason >= 5)
      v12 = 0;
    else
      v12 = (currentTrackingStateReason + 4021);
    if (a5 >= 5)
      v13 = 0;
    else
      v13 = (a5 + 4021);
    -[FlyoverContainerViewController _captureTelemetricEventWithOldKey:newKey:](self, "_captureTelemetricEventWithOldKey:newKey:", v12, v13);
  }
  self->_currentTrackingState = a4;
  self->_currentTrackingStateReason = a5;
}

- (void)mapView:(id)a3 didStopFlyoverTourCompleted:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "_currentFlyoverAnimationID");
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v8, "captureUserAction:flyoverAnimationID:", 17025, v7);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v9, "captureUserAction:flyoverAnimationID:", 17026, v7);

  objc_msgSend(v6, "_setCurrentFlyoverAnimationID:", 0);
  -[FlyoverContainerViewController cleanupFlyover](self, "cleanupFlyover");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  if ((objc_msgSend(v10, "supportsARMode") & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController mapView](self, "mapView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_mapLayer"));
    v13 = objc_msgSend(v12, "isFlyoverUnificationEnabled");

    if (!v13 && v4)
    {
      -[FlyoverActionCoordinator flyoverTourCompleted](self->_flyoverActionCoordinator, "flyoverTourCompleted");
      return;
    }
  }
  else
  {

  }
  -[FlyoverActionCoordinator viewControllerEndFlyover:](self->_flyoverActionCoordinator, "viewControllerEndFlyover:", self);
  v14 = (id)objc_claimAutoreleasedReturnValue(-[FlyoverActionCoordinator appCoordinator](self->_flyoverActionCoordinator, "appCoordinator"));
  objc_msgSend(v14, "exitFlyover");

}

- (void)mapView:(id)a3 flyoverModeDidChange:(int)a4
{
  NSString *savedTourLabelText;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *v13;
  id v14;

  v14 = a3;
  if (a4 == 1)
  {
    if (self->_savedTourLabelText)
    {
      -[FlyoverContainerViewController mapView:flyoverTourLabelDidChange:](self, "mapView:flyoverTourLabelDidChange:", v14);
      savedTourLabelText = self->_savedTourLabelText;
      self->_savedTourLabelText = 0;

    }
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController tourLabel](self, "tourLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "text"));
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController tourLabel](self, "tourLabel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
      v12 = (NSString *)objc_msgSend(v11, "copy");
      v13 = self->_savedTourLabelText;
      self->_savedTourLabelText = v12;

      -[FlyoverContainerViewController mapView:flyoverTourLabelDidChange:](self, "mapView:flyoverTourLabelDidChange:", v14, &stru_1011EB268);
    }
  }
  -[FlyoverStatusView setHidden:](self->_statusView, "setHidden:", a4 == 1);
  self->_flyoverMode = a4;

}

- (void)mapView:(id)a3 flyoverTourLabelDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == (id)5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverBannerView](self, "flyoverBannerView"));
    objc_msgSend(v8, "setLocationString:", v5);
  }
  else
  {
    v9 = objc_msgSend(v5, "length");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController tourLabel](self, "tourLabel"));
    v8 = v10;
    if (v9)
    {
      objc_msgSend(v10, "setText:", v5);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100451258;
      v17[3] = &unk_1011AC860;
      v11 = &v18;
      v18 = v8;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v17, 1.0);
    }
    else
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100451264;
      v15[3] = &unk_1011AC860;
      v11 = &v16;
      v16 = v10;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100451270;
      v12[3] = &unk_1011ACCB8;
      v13 = v16;
      v14 = v5;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v15, v12, 1.0);

    }
  }

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  return 0;
}

- (UIView)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return (UIView *)v3;
}

- (id)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return v3;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FlyoverContainerViewController;
  -[OverlayContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100451420;
  v10[3] = &unk_1011B7368;
  objc_copyWeak(&v11, &location);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10045151C;
  v8[3] = &unk_1011B7368;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_captureTelemetricEventWithOldKey:(int)a3 newKey:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *trackingStateAndReasonChangesBegan;
  void *v8;
  double Current;
  double v10;
  NSMutableDictionary *v11;
  void *v12;
  NSNumber *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  trackingStateAndReasonChangesBegan = self->_trackingStateAndReasonChangesBegan;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
  v17 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](trackingStateAndReasonChangesBegan, "objectForKeyedSubscript:", v8));

  if (v17)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v17, "doubleValue");
    +[GEOAPPortal captureTelemetricEntityCountForEventKey:eventValue:eventDetail:](GEOAPPortal, "captureTelemetricEntityCountForEventKey:eventValue:eventDetail:", v5, (unint64_t)((Current - v10) * 1000.0), 0);
    v11 = self->_trackingStateAndReasonChangesBegan;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0, v12);

  }
  v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = self->_trackingStateAndReasonChangesBegan;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

}

- (void)_enterFlyover
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v3, "setMapsIsShowingTour:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
  -[FlyoverContainerViewController setStartViewMode:](self, "setStartViewMode:", objc_msgSend(v4, "displayedViewMode"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VKPlatform sharedPlatform](VKPlatform, "sharedPlatform"));
  if (objc_msgSend(v5, "supportsARMode"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController mapView](self, "mapView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
    if (objc_msgSend(v7, "isFlyoverUnificationEnabled"))
      v8 = 6;
    else
      v8 = 5;

  }
  else
  {
    v8 = 6;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
  objc_msgSend(v9, "updateViewMode:animated:", v8, 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController view](self, "view"));
  if (v10)
  {
    -[FlyoverContainerViewController hideChrome:animated:](self, "hideChrome:animated:", 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
    objc_msgSend(v11, "viewControllerPresentTray:", self);

    if (sub_1002A8AA0(self) == 5)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1004518EC;
      v12[3] = &unk_1011AC860;
      v12[4] = self;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 3, v12, 0, 1.0, 0.5);
    }
  }
}

- (int64_t)initialOrientation
{
  int64_t result;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  result = self->_initialOrientation;
  if (!result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));
    self->_initialOrientation = (int64_t)objc_msgSend(v7, "interfaceOrientation");

    return self->_initialOrientation;
  }
  return result;
}

- (void)stopFlyoverRequestedByBanner:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverContainerViewController flyoverActionCoordinator](self, "flyoverActionCoordinator"));
  objc_msgSend(v5, "flyoverTourCompleted");

  -[FlyoverContainerViewController cleanupFlyover](self, "cleanupFlyover");
  v7[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100451A80;
  v8[3] = &unk_1011AC860;
  v9 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100451A8C;
  v7[3] = &unk_1011AE8F8;
  v6 = v4;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v7, 0.2);

}

- (FlyoverContainerViewControllerDelegate)flyoverDelegate
{
  return (FlyoverContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_flyoverDelegate);
}

- (void)setFlyoverDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_flyoverDelegate, a3);
}

- (FlyoverActionCoordinator)flyoverActionCoordinator
{
  return self->_flyoverActionCoordinator;
}

- (void)setFlyoverActionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_flyoverActionCoordinator, a3);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (unint64_t)sessionInterruptedReason
{
  return self->_sessionInterruptedReason;
}

- (int64_t)startViewMode
{
  return self->_startViewMode;
}

- (void)setStartViewMode:(int64_t)a3
{
  self->_startViewMode = a3;
}

- (BOOL)flyoverIntroCompleted
{
  return self->_flyoverIntroCompleted;
}

- (void)setFlyoverIntroCompleted:(BOOL)a3
{
  self->_flyoverIntroCompleted = a3;
}

- (FlyoverStatusView)statusView
{
  return self->_statusView;
}

- (void)setStatusView:(id)a3
{
  objc_storeStrong((id *)&self->_statusView, a3);
}

- (NSTimer)flyoverIntroTimer
{
  return self->_flyoverIntroTimer;
}

- (void)setFlyoverIntroTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flyoverIntroTimer, a3);
}

- (UILabel)tourLabel
{
  return self->_tourLabel;
}

- (void)setTourLabel:(id)a3
{
  objc_storeStrong((id *)&self->_tourLabel, a3);
}

- (FlyoverBannerView)flyoverBannerView
{
  return self->_flyoverBannerView;
}

- (void)setFlyoverBannerView:(id)a3
{
  objc_storeStrong((id *)&self->_flyoverBannerView, a3);
}

- (NSString)savedTourLabelText
{
  return self->_savedTourLabelText;
}

- (void)setSavedTourLabelText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (int)flyoverMode
{
  return self->_flyoverMode;
}

- (void)setFlyoverMode:(int)a3
{
  self->_flyoverMode = a3;
}

- (unint64_t)currentTrackingState
{
  return self->_currentTrackingState;
}

- (void)setCurrentTrackingState:(unint64_t)a3
{
  self->_currentTrackingState = a3;
}

- (unint64_t)currentTrackingStateReason
{
  return self->_currentTrackingStateReason;
}

- (void)setCurrentTrackingStateReason:(unint64_t)a3
{
  self->_currentTrackingStateReason = a3;
}

- (NSMutableDictionary)trackingStateAndReasonChangesBegan
{
  return self->_trackingStateAndReasonChangesBegan;
}

- (void)setTrackingStateAndReasonChangesBegan:(id)a3
{
  objc_storeStrong((id *)&self->_trackingStateAndReasonChangesBegan, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingStateAndReasonChangesBegan, 0);
  objc_storeStrong((id *)&self->_savedTourLabelText, 0);
  objc_storeStrong((id *)&self->_flyoverBannerView, 0);
  objc_storeStrong((id *)&self->_tourLabel, 0);
  objc_storeStrong((id *)&self->_flyoverIntroTimer, 0);
  objc_storeStrong((id *)&self->_statusView, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_flyoverActionCoordinator, 0);
  objc_destroyWeak((id *)&self->_flyoverDelegate);
}

@end
