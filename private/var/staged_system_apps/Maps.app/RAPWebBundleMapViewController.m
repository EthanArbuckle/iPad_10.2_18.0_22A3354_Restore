@implementation RAPWebBundleMapViewController

- (RAPWebBundleMapViewController)initWithReport:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v8;
  RAPWebBundleMapViewController *v9;
  RAPWebBundleMapViewController *v10;
  objc_super v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RAPWebBundleMapViewController;
  v9 = -[RAPWebBundleMapViewController init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_report, a3);
    v10->_originalCoordinate.latitude = latitude;
    v10->_originalCoordinate.longitude = longitude;
    v10->_selectedCoordinate.latitude = latitude;
    v10->_selectedCoordinate.longitude = longitude;
    -[RAPWebBundleMapViewController _setupSubviews](v10, "_setupSubviews");
    -[RAPWebBundleMapViewController _setupConstraints](v10, "_setupConstraints");
  }

  return v10;
}

- (void)setMapViewEnabled:(BOOL)a3
{
  -[RAPEditLocationMapView setUserInteractionEnabled:](self->_editLocationMapView, "setUserInteractionEnabled:", a3);
}

- (BOOL)mapViewEnabled
{
  return -[RAPEditLocationMapView isUserInteractionEnabled](self->_editLocationMapView, "isUserInteractionEnabled");
}

- ($C79183323B9A0D5602617FF3BE5395AC)_coordinatePickingMapRect
{
  double longitude;
  double latitude;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  MKCoordinateRegion v20;
  $C79183323B9A0D5602617FF3BE5395AC result;

  longitude = self->_selectedCoordinate.longitude;
  if (longitude < -180.0
    || longitude > 180.0
    || (latitude = self->_selectedCoordinate.latitude, latitude < -90.0)
    || latitude > 90.0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "reportedPlace"));
    v4 = sub_10043CA64(v12);
    v6 = v13;
    v8 = v14;
    v10 = v15;

  }
  else
  {
    v20 = MKCoordinateRegionMakeWithDistance(*(CLLocationCoordinate2D *)(&longitude - 1), 200.0, 200.0);
    v4 = MKMapRectForCoordinateRegion((__n128)v20.center, *(__n128 *)&v20.center.longitude, (__n128)v20.span, *(__n128 *)&v20.span.longitudeDelta);
    v6 = v5;
    v8 = v7;
    v10 = v9;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.var1.var1 = v19;
  result.var1.var0 = v18;
  result.var0.var1 = v17;
  result.var0.var0 = v16;
  return result;
}

- (void)_setupSubviews
{
  RAPEditLocationMapView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  RAPEditLocationMapView *v19;
  RAPEditLocationMapView *editLocationMapView;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIButton *v26;
  UIButton *alternateButton;
  void *v28;
  void *v29;
  UIButton *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  UIVisualEffectView *v35;
  UIVisualEffectView *backgroundBlurView;
  void *v37;
  id v38;

  v3 = [RAPEditLocationMapView alloc];
  -[RAPWebBundleMapViewController _coordinatePickingMapRect](self, "_coordinatePickingMapRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = 32;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
  v14 = objc_msgSend(v13, "isShowingTraffic");
  if ((v14 & 1) != 0)
  {
    v15 = 7;
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
    v16 = objc_msgSend((id)v12, "mapType");
    switch((unint64_t)v16)
    {
      case 1uLL:
        v15 = 2;
        break;
      case 2uLL:
        v15 = 1;
        break;
      case 3uLL:
        v15 = 6;
        break;
      case 4uLL:
        v15 = 5;
        break;
      default:
        v17 = 3;
        if (v16 != (id)104)
          v17 = 0;
        if (v16 == (id)103)
          v15 = -1;
        else
          v15 = v17;
        break;
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController _viewAttributes](self, "_viewAttributes"));
  v19 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:](v3, "initWithMapRect:viewMode:markerViewAttributes:", v15, v18, v5, v7, v9, v11);
  editLocationMapView = self->_editLocationMapView;
  self->_editLocationMapView = v19;

  if ((v14 & 1) == 0)
  -[RAPEditLocationMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_editLocationMapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RAPEditLocationMapView setDelegate:](self->_editLocationMapView, "setDelegate:", self);
  -[RAPEditLocationMapView setCrosshairEnabled:](self->_editLocationMapView, "setCrosshairEnabled:", 1);
  -[RAPEditLocationMapView setHideAllSuplementaryViews:](self->_editLocationMapView, "setHideAllSuplementaryViews:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self->_editLocationMapView, "mapView"));
  objc_msgSend(v21, "setPitchEnabled:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self->_editLocationMapView, "mapView"));
  objc_msgSend(v22, "setRotateEnabled:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView layer](self->_editLocationMapView, "layer"));
  objc_msgSend(v23, "setCornerRadius:", 10.0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView layer](self->_editLocationMapView, "layer"));
  objc_msgSend(v24, "setMasksToBounds:", 1);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
  objc_msgSend(v25, "addSubview:", self->_editLocationMapView);

  if (sub_1002A8AA0(self) != 5)
  {
    v26 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
    alternateButton = self->_alternateButton;
    self->_alternateButton = v26;

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.left.and.arrow.down.right")));
    v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageWithRenderingMode:", 2));

    -[UIButton setImage:forState:](self->_alternateButton, "setImage:forState:", v38, 0);
    -[UIButton setAdjustsImageWhenHighlighted:](self->_alternateButton, "setAdjustsImageWhenHighlighted:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UIButton setTintColor:](self->_alternateButton, "setTintColor:", v29);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_alternateButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContentEdgeInsets:](self->_alternateButton, "setContentEdgeInsets:", 10.0, 10.0, 10.0, 10.0);
    v30 = self->_alternateButton;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 15.0));
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v30, "setPreferredSymbolConfiguration:forImageInState:", v31, 0);

    -[UIButton addTarget:action:forControlEvents:](self->_alternateButton, "addTarget:action:forControlEvents:", self, "_didTapButton", 64);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
    objc_msgSend(v32, "addSubview:", self->_alternateButton);

    v33 = objc_alloc((Class)UIVisualEffectView);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 16));
    v35 = (UIVisualEffectView *)objc_msgSend(v33, "initWithEffect:", v34);
    backgroundBlurView = self->_backgroundBlurView;
    self->_backgroundBlurView = v35;

    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_backgroundBlurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIVisualEffectView _setCornerRadius:](self->_backgroundBlurView, "_setCornerRadius:", 6.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
    objc_msgSend(v37, "insertSubview:belowSubview:", self->_backgroundBlurView, self->_alternateButton);

  }
}

- (void)_setupConstraints
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
  _QWORD v43[8];
  _QWORD v44[4];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView leadingAnchor](self->_editLocationMapView, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v37));
  v44[0] = v35;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView trailingAnchor](self->_editLocationMapView, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v29));
  v44[1] = v27;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView topAnchor](self->_editLocationMapView, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v44[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView bottomAnchor](self->_editLocationMapView, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  v44[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  if (sub_1002A8AA0(self) != 5)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_alternateButton, "topAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView topAnchor](self->_editLocationMapView, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v40));
    v43[0] = v38;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_alternateButton, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView leadingAnchor](self->_editLocationMapView, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v34));
    v43[1] = v32;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_alternateButton, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:", 40.0));
    v43[2] = v28;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_alternateButton, "widthAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_alternateButton, "heightAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v43[3] = v24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerXAnchor](self->_backgroundBlurView, "centerXAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](self->_alternateButton, "centerXAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
    v43[4] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView centerYAnchor](self->_backgroundBlurView, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](self->_alternateButton, "centerYAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v43[5] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_backgroundBlurView, "heightAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToConstant:", 30.0));
    v43[6] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView widthAnchor](self->_backgroundBlurView, "widthAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView heightAnchor](self->_backgroundBlurView, "heightAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v43[7] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

  }
}

- (void)_didTapButton
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  RAPWebBundleEditLocationViewController *v17;
  RAPWebBundleEditLocationViewController *editLocationViewController;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  RAPWebBundleEditLocationViewController *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location[2];

  v3 = -[RAPWebBundleMapViewController _isStreetRAP](self, "_isStreetRAP");
  objc_initWeak(location, self);
  v26 = [RAPWebBundleEditLocationViewController alloc];
  -[RAPWebBundleMapViewController _coordinatePickingMapRect](self, "_coordinatePickingMapRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
  v25 = objc_msgSend(v12, "mapType");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport _context](self->_report, "_context"));
  v14 = objc_msgSend(v13, "isShowingTraffic");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController _viewAttributes](self, "_viewAttributes"));
  if (v3)
    v16 = 1;
  else
    v16 = 7;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10070DF14;
  v29[3] = &unk_1011C1650;
  objc_copyWeak(&v30, location);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10070DFB8;
  v27[3] = &unk_1011AD260;
  objc_copyWeak(&v28, location);
  v17 = -[RAPWebBundleEditLocationViewController initWithInitialCoordinates:inMapRect:mapType:isShowingTraffic:analyticsTarget:markerViewAttributes:showAnnotationTitle:searchResultTypes:selectionHandler:cancelSelectionHandler:](v26, "initWithInitialCoordinates:inMapRect:mapType:isShowingTraffic:analyticsTarget:markerViewAttributes:showAnnotationTitle:searchResultTypes:selectionHandler:cancelSelectionHandler:", v25, v14, 1158, v15, v3, v16, self->_selectedCoordinate.latitude, self->_selectedCoordinate.longitude, v5, v7, v9, v11, v29, v27);
  editLocationViewController = self->_editLocationViewController;
  self->_editLocationViewController = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController _webBundleQuestion](self, "_webBundleQuestion"));
  v20 = objc_msgSend(v19, "questionType");

  v21 = 0;
  switch((unint64_t)v20)
  {
    case 1uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0x1AuLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[RAP Web Module] Map Footer Correct Location"), CFSTR("localized string not found"), 0));
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[RAP Web Module] Map Footer Add"), CFSTR("localized string not found"), 0));
      goto LABEL_9;
    case 9uLL:
    case 0xCuLL:
    case 0x18uLL:
    case 0x19uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[RAP Web Module] Map Footer Place"), CFSTR("localized string not found"), 0));
      goto LABEL_9;
    case 0x15uLL:
    case 0x16uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[RAP Web Module] Map Footer Street"), CFSTR("localized string not found"), 0));
LABEL_9:
      v21 = (void *)v23;

      break;
    default:
      break;
  }
  v24 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", self->_editLocationViewController);
  objc_msgSend(v24, "setModalPresentationStyle:", 2);
  objc_msgSend(v24, "setModalInPresentation:", 1);
  -[RAPWebBundleEditLocationViewController setPromptText:](self->_editLocationViewController, "setPromptText:", v21);
  -[RAPWebBundleMapViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(location);
}

- (id)_webBundleQuestion
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  v4 = objc_opt_class(RAPWebBundleQuestion);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPReport initialQuestion](self->_report, "initialQuestion"));
  else
    v6 = 0;
  return v6;
}

- (BOOL)_isStreetRAP
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController _webBundleQuestion](self, "_webBundleQuestion"));
  v3 = objc_msgSend(v2, "questionType") == (id)21 || objc_msgSend(v2, "questionType") == (id)22;

  return v3;
}

- (void)_didChangeCenterCoordinate:(CLLocationCoordinate2D)a3 fromEditLocationMapView:(id)a4
{
  double longitude;
  double latitude;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_mapLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mapView"));
  objc_msgSend(v10, "convertCoordinate:toPointToView:", v7, latitude, longitude);
  v12 = v11;
  v14 = v13;

  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rapMarkerAtPoint:", v12, v14));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleMapViewController delegate](self, "delegate"));
  objc_msgSend(v15, "rapWebBundleMapViewController:marker:didUpdateLocationTo:", self, v16, latitude, longitude);

}

- (id)_viewAttributes
{
  RAPMarkerViewAttributes *v2;
  void *v3;
  RAPMarkerViewAttributes *v4;

  v2 = [RAPMarkerViewAttributes alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes RAPLocationStyleAttributes](GEOFeatureStyleAttributes, "RAPLocationStyleAttributes"));
  v4 = -[RAPMarkerViewAttributes initWithTitle:styleAttributes:](v2, "initWithTitle:styleAttributes:", 0, v3);

  return v4;
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  id v7;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  self->_selectedCoordinate.latitude = latitude;
  self->_selectedCoordinate.longitude = longitude;
  if (-[RAPWebBundleMapViewController _isStreetRAP](self, "_isStreetRAP"))
    objc_msgSend(v7, "updateAnnotationTitleWithCenterCoordinate:", latitude, longitude);
  -[RAPWebBundleMapViewController _didChangeCenterCoordinate:fromEditLocationMapView:](self, "_didChangeCenterCoordinate:fromEditLocationMapView:", self->_editLocationMapView, latitude, longitude);

}

- (void)editLocationMapViewFinishedRenderingMap:(id)a3
{
  id v4;

  if (!self->_mapIsInitialized)
  {
    v4 = a3;
    objc_msgSend(v4, "centerCoordinate");
    -[RAPWebBundleMapViewController _didChangeCenterCoordinate:fromEditLocationMapView:](self, "_didChangeCenterCoordinate:fromEditLocationMapView:", v4);

    self->_mapIsInitialized = 1;
  }
}

- (RAPWebBundleMapDelegate)delegate
{
  return (RAPWebBundleMapDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editLocationViewController, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_editLocationMapView, 0);
  objc_storeStrong((id *)&self->_backgroundBlurView, 0);
  objc_storeStrong((id *)&self->_alternateButton, 0);
}

@end
