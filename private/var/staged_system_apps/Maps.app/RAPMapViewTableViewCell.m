@implementation RAPMapViewTableViewCell

- (RAPMapViewTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 viewModel:(id)a5
{
  id v9;
  RAPMapViewTableViewCell *v10;
  RAPMapViewTableViewCell *v11;
  id *p_viewModel;
  MKMapView *v13;
  MKMapView *mapView;
  id v15;
  void *v16;
  void *v17;
  objc_super v19;

  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPMapViewTableViewCell;
  v10 = -[RAPMapViewTableViewCell initWithStyle:reuseIdentifier:](&v19, "initWithStyle:reuseIdentifier:", a3, a4);
  v11 = v10;
  if (v10)
  {
    p_viewModel = (id *)&v10->_viewModel;
    objc_storeStrong((id *)&v10->_viewModel, a5);
    v13 = (MKMapView *)objc_alloc_init((Class)MKMapView);
    mapView = v11->_mapView;
    v11->_mapView = v13;

    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](v11->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*p_viewModel, "setMapView:", v11->_mapView);
    v15 = objc_msgSend(objc_alloc((Class)MKMarkerAnnotationView), "initWithAnnotation:reuseIdentifier:", 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes homeStyleAttributes](GEOFeatureStyleAttributes, "homeStyleAttributes"));
    objc_msgSend(v15, "_setStyleAttributes:", v16);

    -[RAPMapViewTableViewCell setupSubviews](v11, "setupSubviews");
    -[RAPMapViewTableViewCell setupConstraints](v11, "setupConstraints");
    -[RAPMapViewTableViewCell setSelectionStyle:](v11, "setSelectionStyle:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_viewModel, "instructionalText"));
    -[RAPMapViewTableViewCell setAccessibilityLabel:](v11, "setAccessibilityLabel:", v17);

  }
  return v11;
}

- (void)setupSubviews
{
  void *v3;
  BlurredBackgroundLabel *v4;
  BlurredBackgroundLabel *descriptionBackgroundView;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  CLLocationCoordinate2D v11;
  MKCoordinateRegion v12;

  -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "addSubview:", self->_mapView);

  -[RAPInlineMapViewModel selectedCoordinate](self->_viewModel, "selectedCoordinate");
  v12 = MKCoordinateRegionMakeWithDistance(v11, 200.0, 200.0);
  -[MKMapView setRegion:animated:](self->_mapView, "setRegion:animated:", 1, v12.center.latitude, v12.center.longitude, v12.span.latitudeDelta, v12.span.longitudeDelta);
  -[MKMapView setShowsUserLocation:](self->_mapView, "setShowsUserLocation:", 1);
  -[MKMapView setUserTrackingMode:animated:](self->_mapView, "setUserTrackingMode:animated:", 1, 1);
  v4 = -[BlurredBackgroundLabel initWithFrame:]([BlurredBackgroundLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  descriptionBackgroundView = self->_descriptionBackgroundView;
  self->_descriptionBackgroundView = v4;

  v6 = (objc_class *)objc_opt_class(self);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[BlurredBackgroundLabel setGroupName:](self->_descriptionBackgroundView, "setGroupName:", v8);

  -[BlurredBackgroundLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInlineMapViewModel instructionalText](self->_viewModel, "instructionalText"));
  -[BlurredBackgroundLabel setText:](self->_descriptionBackgroundView, "setText:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_mapView);

  -[MKMapView addSubview:](self->_mapView, "addSubview:", self->_descriptionBackgroundView);
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
  unsigned int v11;
  BlurredBackgroundLabel *descriptionBackgroundView;
  void *v13;
  uint64_t v14;
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
  _QWORD v34[5];
  _QWORD v35[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel leadingAnchor](self->_descriptionBackgroundView, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  v35[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel trailingAnchor](self->_descriptionBackgroundView, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell trailingAnchor](self, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v35[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));

  v11 = -[RAPInlineMapViewModel allowsEditing](self->_viewModel, "allowsEditing");
  descriptionBackgroundView = self->_descriptionBackgroundView;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel topAnchor](descriptionBackgroundView, "topAnchor"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel bottomAnchor](descriptionBackgroundView, "bottomAnchor"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  }
  v15 = (void *)v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrayByAddingObject:", v16));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView topAnchor](self->_mapView, "topAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v34[0] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView bottomAnchor](self->_mapView, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
  v34[1] = v27;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView leadingAnchor](self->_mapView, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell leadingAnchor](self, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v17));
  v34[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView trailingAnchor](self->_mapView, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMapViewTableViewCell trailingAnchor](self, "trailingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v34[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[BlurredBackgroundLabel heightAnchor](self->_descriptionBackgroundView, "heightAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, 235.0));
  v34[4] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 5));

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  id v6;
  MKMapView *mapView;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RAPMapViewTableViewCell;
  -[RAPMapViewTableViewCell layoutSubviews](&v12, "layoutSubviews");
  -[BlurredBackgroundLabel systemLayoutSizeFittingSize:](self->_descriptionBackgroundView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "userInterfaceLayoutDirection");

  mapView = self->_mapView;
  -[RAPMapViewTableViewCell safeAreaInsets](self, "safeAreaInsets");
  v9 = v8;
  if (v6 == (id)1)
  {
    v9 = v8 + 8.0;
    -[RAPMapViewTableViewCell safeAreaInsets](self, "safeAreaInsets");
  }
  else
  {
    -[RAPMapViewTableViewCell safeAreaInsets](self, "safeAreaInsets");
    v10 = v11 + 8.0;
  }
  -[MKMapView _setAttributionInsets:](mapView, "_setAttributionInsets:", 0.0, v9, v4, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_descriptionBackgroundView, 0);
}

@end
