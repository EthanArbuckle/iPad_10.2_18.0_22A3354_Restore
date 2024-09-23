@implementation RAPEditLocationMapView

- (RAPEditLocationMapView)initWithMapRect:(id)a3 viewMode:(int64_t)a4 markerViewAttributes:(id)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  id v11;
  RAPEditLocationMapView *v12;
  MapViewModeSelector *v13;
  MapViewModeSelector *mapModeSegmentedControl;
  id v15;
  uint64_t v16;
  UIView *floatingControlsView;
  id v18;
  double y;
  double width;
  double height;
  MKMapView *v22;
  MKMapView *mapView;
  void *v24;
  void *v25;
  void *v26;
  MKMapView *v27;
  uint64_t v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  int64_t v32;
  uint64_t v33;
  id v34;
  MKMapView *v35;
  uint64_t v36;
  int64x2_t v37;
  void *v38;
  unsigned int v39;
  WatermarkView *v40;
  WatermarkView *watermarkView;
  RAPMKMarkerAnnotationView *v42;
  RAPMKMarkerAnnotationView *crosshairAnnotationView;
  void *v44;
  void *v45;
  BlurredBackgroundLabel *v46;
  BlurredBackgroundLabel *descriptionView;
  objc_class *v48;
  NSString *v49;
  void *v50;
  int64x2_t v52;
  int64x2_t v53;
  __int128 v54;
  uint64_t v55;
  objc_super v56;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v8 = a3.var0.var1;
  v9 = a3.var0.var0;
  v11 = a5;
  v56.receiver = self;
  v56.super_class = (Class)RAPEditLocationMapView;
  v12 = -[RAPEditLocationMapView init](&v56, "init");
  if (v12)
  {
    v13 = -[MapViewModeSelector initWithDesiredViewModes:]([MapViewModeSelector alloc], "initWithDesiredViewModes:", &off_101273368);
    mapModeSegmentedControl = v12->_mapModeSegmentedControl;
    v12->_mapModeSegmentedControl = v13;

    -[MapViewModeSelector setSelectedViewMode:](v12->_mapModeSegmentedControl, "setSelectedViewMode:", a4);
    -[MapViewModeSelector addTarget:action:forControlEvents:](v12->_mapModeSegmentedControl, "addTarget:action:forControlEvents:", v12, "selectedMapModeDidChange:", 4096);
    v15 = sub_100485870(v12->_mapModeSegmentedControl);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    floatingControlsView = v12->_floatingControlsView;
    v12->_floatingControlsView = (UIView *)v16;

    v18 = objc_alloc((Class)MKMapView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v22 = (MKMapView *)objc_msgSend(v18, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    mapView = v12->_mapView;
    v12->_mapView = v22;

    -[MKMapView setShowsUserLocation:](v12->_mapView, "setShowsUserLocation:", 1);
    -[MKMapView _setShowsVenues:](v12->_mapView, "_setShowsVenues:", 1);
    -[MKMapView setShowsAttribution:](v12->_mapView, "setShowsAttribution:", 0);
    -[MKMapView setShowsCompass:](v12->_mapView, "setShowsCompass:", 0);
    -[MKMapView _setEdgeInsets:](v12->_mapView, "_setEdgeInsets:", 40.0, 0.0, 0.0, 0.0);
    -[MKMapView setDelegate:](v12->_mapView, "setDelegate:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](v12->_mapView, "_mapLayer"));
    objc_msgSend(v24, "setStaysCenteredDuringPinch:", 1);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](v12->_mapView, "_mapLayer"));
    objc_msgSend(v25, "setStaysCenteredDuringRotation:", 1);

    if (sub_1002A8AA0(v12) == 5)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      -[MKMapView setTintColor:](v12->_mapView, "setTintColor:", v26);

    }
    v27 = v12->_mapView;
    v28 = objc_opt_class(MKMarkerAnnotationView);
    v29 = (objc_class *)objc_opt_class(MKMarkerAnnotationView);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    -[MKMapView registerClass:forAnnotationViewWithReuseIdentifier:](v27, "registerClass:forAnnotationViewWithReuseIdentifier:", v28, v31);

    -[MKMapView setBackdropViewQualityChangingDisabled:](v12->_mapView, "setBackdropViewQualityChangingDisabled:", 1);
    v32 = a4 - 1;
    if ((unint64_t)(a4 - 1) > 6)
      v33 = 0;
    else
      v33 = qword_100E37488[v32];
    -[MKMapView setMapType:](v12->_mapView, "setMapType:", v33);
    v34 = -[MKMapView setShowsTraffic:](v12->_mapView, "setShowsTraffic:", a4 == 7);
    if (v9 != MKMapRectNull.origin.x || v8 != MKMapRectNull.origin.y)
      v34 = -[MKMapView setVisibleMapRect:](v12->_mapView, "setVisibleMapRect:", v9, v8, var0, var1);
    v35 = v12->_mapView;
    v55 = 0;
    v53 = 0u;
    v54 = 0u;
    v52 = 0u;
    _MKCartographicConfigurationDefault(&v52, v34);
    v53 = vdupq_n_s64(1uLL);
    *(_QWORD *)&v54 = 0;
    switch(v32)
    {
      case 0:
        v52 = vdupq_n_s64(1uLL);
        v53.i64[0] = 0;
        break;
      case 1:
        v53.i64[0] = 0;
        v52 = (int64x2_t)1uLL;
        break;
      case 2:
        v36 = 4;
        goto LABEL_18;
      case 4:
        v37 = vdupq_n_s64(1uLL);
        goto LABEL_16;
      case 5:
        v37 = (int64x2_t)xmmword_100E2D550;
LABEL_16:
        v52 = v37;
        break;
      case 6:
        v36 = 2;
LABEL_18:
        v52.i64[1] = v36;
        break;
      default:
        break;
    }
    -[MKMapView _setCartographicConfiguration:animated:](v35, "_setCartographicConfiguration:animated:", &v52, 0);
    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](v12->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RAPEditLocationMapView addSubview:](v12, "addSubview:", v12->_mapView);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
    v39 = objc_msgSend(v38, "isInternalInstall");

    if (v39)
    {
      v40 = -[WatermarkView initWithFrame:]([WatermarkView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      watermarkView = v12->_watermarkView;
      v12->_watermarkView = v40;

      -[WatermarkView setTranslatesAutoresizingMaskIntoConstraints:](v12->_watermarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[RAPEditLocationMapView addSubview:](v12, "addSubview:", v12->_watermarkView);
    }
    -[RAPEditLocationMapView addSubview:](v12, "addSubview:", v12->_floatingControlsView, *(_OWORD *)&v52, *(_OWORD *)&v53, (_QWORD)v54);
    v42 = objc_alloc_init(RAPMKMarkerAnnotationView);
    crosshairAnnotationView = v12->_crosshairAnnotationView;
    v12->_crosshairAnnotationView = v42;

    -[RAPMKMarkerAnnotationView setSelected:](v12->_crosshairAnnotationView, "setSelected:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "styleAttributes"));
    -[RAPMKMarkerAnnotationView _setStyleAttributes:](v12->_crosshairAnnotationView, "_setStyleAttributes:", v44);

    -[RAPMKMarkerAnnotationView setAlpha:](v12->_crosshairAnnotationView, "setAlpha:", 0.0);
    -[RAPMKMarkerAnnotationView setHidden:](v12->_crosshairAnnotationView, "setHidden:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](v12, "mapView"));
    objc_msgSend(v45, "addSubview:", v12->_crosshairAnnotationView);

    v46 = -[BlurredBackgroundLabel initWithFrame:]([BlurredBackgroundLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    descriptionView = v12->_descriptionView;
    v12->_descriptionView = v46;

    v48 = (objc_class *)objc_opt_class(v12);
    v49 = NSStringFromClass(v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    -[BlurredBackgroundLabel setGroupName:](v12->_descriptionView, "setGroupName:", v50);

    -[BlurredBackgroundLabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_descriptionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKMapView addSubview:](v12->_mapView, "addSubview:", v12->_descriptionView);
    -[RAPEditLocationMapView setupConstraints](v12, "setupConstraints");
  }

  return v12;
}

- (void)setupDescriptionViewAndAdditionalConstraints
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
  _QWORD v19[3];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "topAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v19[0] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v19[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v19[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)setupConstraints
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
  double v13;
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
  _QWORD v40[7];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView leadingAnchor](self, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v37));
  v40[0] = v36;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView trailingAnchor](self, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v40[1] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView topAnchor](self, "topAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v29));
  v40[2] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView bottomAnchor](self, "bottomAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v40[3] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v40[4] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v3));
  v40[5] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9, -8.0));
  v40[6] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  LODWORD(v7) = objc_msgSend(v12, "isInternalInstall");

  if ((_DWORD)v7)
  {
    LODWORD(v13) = 1148846080;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[WatermarkView _maps_constraintsEqualToEdgesOfView:priority:](self->_watermarkView, "_maps_constraintsEqualToEdgesOfView:priority:", self, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

  }
  -[RAPEditLocationMapView setupDescriptionViewAndAdditionalConstraints](self, "setupDescriptionViewAndAdditionalConstraints");
  -[RAPEditLocationMapView updateCrosshairPosition](self, "updateCrosshairPosition");
}

- (void)updateCrosshairPosition
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView crosshairAnnotationView](self, "crosshairAnnotationView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    objc_msgSend(v5, "centerCoordinate");
    v7 = v6;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    objc_msgSend(v4, "convertCoordinate:toPointToView:", v10, v7, v9);
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    objc_msgSend(v16, "center");
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));
    objc_msgSend(v15, "convertPoint:fromView:", v22, v18, v20);
    v24 = v23;
    v26 = v25;

    -[RAPMKMarkerAnnotationView centerOffset](self->_crosshairAnnotationView, "centerOffset");
    if (vabdd_f64(v12, v24) != INFINITY)
    {
      v28 = v14 - v26 + v27 + 1.5;
      if (fabs(v28) != INFINITY)
        -[RAPMKMarkerAnnotationView setCenter:](self->_crosshairAnnotationView, "setCenter:", v24 + v12 - v24, v26 + v28);
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RAPEditLocationMapView;
  -[RAPEditLocationMapView layoutSubviews](&v3, "layoutSubviews");
  -[RAPEditLocationMapView updateCrosshairPosition](self, "updateCrosshairPosition");
  -[RAPEditLocationMapView updateAttributionInsets](self, "updateAttributionInsets");
}

- (void)updateAttributionInsets
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  MKMapView *mapView;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[UIView systemLayoutSizeFittingSize:](self->_floatingControlsView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3 + 8.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView superview](self, "superview"));
  objc_msgSend(v5, "safeAreaInsets");
  v7 = v4 + v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  mapView = self->_mapView;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView superview](self, "superview"));
  objc_msgSend(v15, "safeAreaInsets");
  v13 = v12 + 8.0;
  if (v9 == (id)1)
  {
    v14 = 0.0;
  }
  else
  {
    v13 = 0.0;
    v14 = v11 + 8.0;
  }
  -[MKMapView _setAttributionInsets:](mapView, "_setAttributionInsets:", 0.0, v13, v7, v14);

}

- (void)selectedMapModeDidChange:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapModeSegmentedControl](self, "mapModeSegmentedControl", a3));
  v5 = objc_msgSend(v4, "selectedViewMode");

  if (v5 == (id)2)
    v6 = 1;
  else
    v6 = (uint64_t)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v8 = v7;
  if ((unint64_t)(v6 - 1) > 6)
    v9 = 0;
  else
    v9 = qword_100E37488[v6 - 1];
  objc_msgSend(v7, "setMapType:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  objc_msgSend(v10, "setShowsTraffic:", v6 == 7);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView delegate](self, "delegate"));
  objc_msgSend(v11, "editLocationMapView:didChangeViewMode:", self, v6);

}

- (void)setCrosshairEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  self->_crosshairEnabled = a3;
  v3 = !a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView crosshairAnnotationView](self, "crosshairAnnotationView"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)mapViewDidFinishRenderingMap:(id)a3 fullyRendered:(BOOL)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView crosshairAnnotationView](self, "crosshairAnnotationView", a3, a4));
  objc_msgSend(v5, "setAlpha:", 1.0);

  -[RAPEditLocationMapView updateCrosshairPosition](self, "updateCrosshairPosition");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "editLocationMapViewFinishedRenderingMap:");

  if ((v7 & 1) != 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView delegate](self, "delegate"));
    objc_msgSend(v8, "editLocationMapViewFinishedRenderingMap:", self);

  }
}

- (void)setCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  objc_msgSend(v5, "setCenterCoordinate:", latitude, longitude);

}

- (CLLocationCoordinate2D)centerCoordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  objc_msgSend(v2, "centerCoordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (void)setPrompt:(id)a3
{
  NSString *v4;
  NSString *prompt;
  id v6;

  v6 = a3;
  -[BlurredBackgroundLabel setHidden:](self->_descriptionView, "setHidden:", objc_msgSend(v6, "length") == 0);
  if (!-[NSString isEqualToString:](self->_prompt, "isEqualToString:", v6))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    prompt = self->_prompt;
    self->_prompt = v4;

    -[BlurredBackgroundLabel setText:](self->_descriptionView, "setText:", v6);
  }

}

- (void)setAnnotationTitle:(id)a3
{
  NSString *v4;
  NSString *annotationTitle;
  void *v6;
  id v7;

  v7 = a3;
  if ((-[NSString isEqual:](self->_annotationTitle, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v7, "copy");
    annotationTitle = self->_annotationTitle;
    self->_annotationTitle = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView crosshairAnnotationView](self, "crosshairAnnotationView"));
    objc_msgSend(v6, "setAnnotationTitle:", v7);

  }
}

- (void)setViewMode:(int64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapModeSegmentedControl](self, "mapModeSegmentedControl"));
  v6 = objc_msgSend(v5, "selectedViewMode");

  if (v6 != (id)a3)
  {
    if ((unint64_t)(a3 - 1) > 6)
      v7 = 0;
    else
      v7 = qword_100E37488[a3 - 1];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    objc_msgSend(v8, "setMapType:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapModeSegmentedControl](self, "mapModeSegmentedControl"));
    objc_msgSend(v9, "setSelectedViewMode:", a3);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "editLocationMapView:didChangeViewMode:", self, a3);

  }
}

- (int64_t)viewMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapModeSegmentedControl](self, "mapModeSegmentedControl"));
  v3 = objc_msgSend(v2, "selectedViewMode");

  return (int64_t)v3;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(RAPEntryPoint);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = (objc_class *)objc_opt_class(MKMarkerAnnotationView);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableAnnotationViewWithIdentifier:", v11));

    objc_msgSend(v12, "setAnnotation:", v7);
    LODWORD(v13) = 1148846080;
    objc_msgSend(v12, "setDisplayPriority:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RAPEntryPoint entryPointStyleAttributes](RAPEntryPoint, "entryPointStyleAttributes"));
    v15 = objc_msgSend(v14, "copy");
    objc_msgSend(v12, "_setStyleAttributes:", v15);

  }
  else
  {
    v16 = objc_opt_class(MKPointAnnotation);
    if ((objc_opt_isKindOfClass(v7, v16) & 1) == 0)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v17 = (objc_class *)objc_opt_class(MKMarkerAnnotationView);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableAnnotationViewWithIdentifier:", v19));

    objc_msgSend(v12, "setAnnotation:", v7);
    LODWORD(v20) = 1148846080;
    objc_msgSend(v12, "setDisplayPriority:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView crosshairAnnotationView](self, "crosshairAnnotationView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_styleAttributes"));
    v23 = objc_msgSend(v22, "copy");
    objc_msgSend(v12, "_setStyleAttributes:", v23);

    objc_msgSend(v12, "setSelected:", 0);
  }
  objc_msgSend(v12, "setSubtitleVisibility:", 2);
LABEL_7:

  return v12;
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotation"));
  objc_msgSend(v6, "deselectAnnotation:animated:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "annotation"));
  v9 = objc_opt_class(RAPEntryPoint);
  LOBYTE(v7) = objc_opt_isKindOfClass(v8, v9);

  if ((v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView delegate](self, "delegate"));
    objc_msgSend(v10, "editLocationMapView:didSelectAnnotationView:", self, v11);

  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  if (self->_userInteracted)
  {
    v5 = a3;
    v10 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView delegate](self, "delegate"));
    objc_msgSend(v5, "centerCoordinate");
    v7 = v6;
    v9 = v8;

    objc_msgSend(v10, "editLocationMapView:didChangeCenterCoordinate:", self, v7, v9);
  }
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  self->_userInteracted = 1;
}

- (CGPoint)mapView:(id)a3 focusPointForPoint:(CGPoint)a4 gesture:(int64_t)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat x;
  double v15;
  CGFloat y;
  double v17;
  double v18;
  CGPoint result;

  if (a5 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView", a3, a4.x, a4.y));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    objc_msgSend(v7, "centerCoordinate");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
    objc_msgSend(v6, "convertCoordinate:toPointToView:", v12, v9, v11);
    x = v13;
    y = v15;

  }
  else
  {
    y = a4.y;
    x = a4.x;
  }
  v17 = x;
  v18 = y;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v11;
  id v12;
  id WeakRetained;
  id v14;

  v11 = a3;
  if (a4 == 1)
  {
    v14 = v11;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = WeakRetained;
    if (a5 == 1)
      objc_msgSend(WeakRetained, "editLocationMapViewFinishedZoomingIn:", self);
    else
      objc_msgSend(WeakRetained, "editLocationMapViewFinishedZoomingOut:", self);
    goto LABEL_7;
  }
  if (!a4)
  {
    v14 = v11;
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "editLocationMapViewFinishedPanning:", self);
LABEL_7:

    v11 = v14;
  }

}

- (NSLayoutYAxisAnchor)bottomContentGuide
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "topAnchor"));

  return (NSLayoutYAxisAnchor *)v3;
}

- (NSLayoutAnchor)leadingContentGuide
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "leadingAnchor"));

  return (NSLayoutAnchor *)v3;
}

- (NSLayoutAnchor)trailingContentGuide
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "trailingAnchor"));

  return (NSLayoutAnchor *)v3;
}

- (void)setHideAllSuplementaryViews:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  self->_hideAllSuplementaryViews = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView floatingControlsView](self, "floatingControlsView"));
  objc_msgSend(v5, "setHidden:", v3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView descriptionView](self, "descriptionView"));
  objc_msgSend(v6, "setHidden:", v3);

}

- (void)updateAnnotationTitleWithCenterCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPEditLocationMapView mapView](self, "mapView"));
  objc_msgSend(v8, "convertCoordinate:toPointToView:", self, latitude, longitude);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rapMarkerAtPoint:"));

  -[RAPEditLocationMapView setAnnotationTitle:](self, "setAnnotationTitle:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "featureHandles", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "featureType") == 1)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
          -[RAPEditLocationMapView setAnnotationTitle:](self, "setAnnotationTitle:", v15);

          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (BOOL)crosshairEnabled
{
  return self->_crosshairEnabled;
}

- (NSString)prompt
{
  return self->_prompt;
}

- (NSString)annotationTitle
{
  return self->_annotationTitle;
}

- (RAPEditLocationMapViewDelegate)delegate
{
  return (RAPEditLocationMapViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hideAllSuplementaryViews
{
  return self->_hideAllSuplementaryViews;
}

- (MapViewModeSelector)mapModeSegmentedControl
{
  return self->_mapModeSegmentedControl;
}

- (void)setMapModeSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_mapModeSegmentedControl, a3);
}

- (UIView)floatingControlsView
{
  return self->_floatingControlsView;
}

- (void)setFloatingControlsView:(id)a3
{
  objc_storeStrong((id *)&self->_floatingControlsView, a3);
}

- (BlurredBackgroundLabel)descriptionView
{
  return self->_descriptionView;
}

- (void)setDescriptionView:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionView, a3);
}

- (RAPMKMarkerAnnotationView)crosshairAnnotationView
{
  return self->_crosshairAnnotationView;
}

- (void)setCrosshairAnnotationView:(id)a3
{
  objc_storeStrong((id *)&self->_crosshairAnnotationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crosshairAnnotationView, 0);
  objc_storeStrong((id *)&self->_descriptionView, 0);
  objc_storeStrong((id *)&self->_floatingControlsView, 0);
  objc_storeStrong((id *)&self->_mapModeSegmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_annotationTitle, 0);
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_watermarkView, 0);
}

@end
