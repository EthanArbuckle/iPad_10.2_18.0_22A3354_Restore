@implementation EditLocationViewController

- (EditLocationViewController)initWithInitialCoordinates:(CLLocationCoordinate2D)a3 inMapRect:(id)a4 analyticsTarget:(int)a5 markerViewAttributes:(id)a6
{
  double var1;
  double var0;
  double v9;
  double v10;
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v14;
  EditLocationViewController *v15;
  EditLocationViewController *v16;
  RAPMarkerViewAttributes *v17;
  RAPMarkerViewAttributes *attributes;
  objc_super v20;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v9 = a4.var0.var1;
  v10 = a4.var0.var0;
  longitude = a3.longitude;
  latitude = a3.latitude;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)EditLocationViewController;
  v15 = -[EditLocationViewController init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    v15->_mapRect.origin.x = v10;
    v15->_mapRect.origin.y = v9;
    v15->_mapRect.size.width = var0;
    v15->_mapRect.size.height = var1;
    v15->_featureCoordinate.latitude = latitude;
    v15->_featureCoordinate.longitude = longitude;
    v15->_analyticsTarget = a5;
    v17 = (RAPMarkerViewAttributes *)objc_msgSend(v14, "copy");
    attributes = v16->_attributes;
    v16->_attributes = v17;

  }
  return v16;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  RAPEditLocationMapView *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  RAPEditLocationMapView *v9;
  RAPEditLocationMapView *editLocationMapView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)EditLocationViewController;
  -[EditLocationViewController viewDidLoad](&v16, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [RAPEditLocationMapView alloc];
  if (-[EditLocationViewController isShowingTraffic](self, "isShowingTraffic"))
  {
    v6 = 7;
  }
  else
  {
    v7 = -[EditLocationViewController mapType](self, "mapType");
    switch(v7)
    {
      case 1uLL:
        v6 = 2;
        break;
      case 2uLL:
        v6 = 1;
        break;
      case 3uLL:
        v6 = 6;
        break;
      case 4uLL:
        v6 = 5;
        break;
      default:
        v8 = 3;
        if (v7 != 104)
          v8 = 0;
        if (v7 == 103)
          v6 = -1;
        else
          v6 = v8;
        break;
    }
  }
  v9 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:](v5, "initWithMapRect:viewMode:markerViewAttributes:", v6, self->_attributes, self->_mapRect.origin.x, self->_mapRect.origin.y, self->_mapRect.size.width, self->_mapRect.size.height);
  editLocationMapView = self->_editLocationMapView;
  self->_editLocationMapView = v9;

  -[RAPEditLocationMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_editLocationMapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[RAPEditLocationMapView setDelegate:](self->_editLocationMapView, "setDelegate:", self);
  -[RAPEditLocationMapView setCrosshairEnabled:](self->_editLocationMapView, "setCrosshairEnabled:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Pan & zoom map to refine location [Report an Issue]"), CFSTR("localized string not found"), 0));
  -[RAPEditLocationMapView setPrompt:](self->_editLocationMapView, "setPrompt:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController view](self, "view"));
  objc_msgSend(v13, "addSubview:", self->_editLocationMapView);

  -[EditLocationViewController setupConstraints](self, "setupConstraints");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationItem](self, "navigationItem"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rightBarButtonItem"));
  objc_msgSend(v15, "setEnabled:", 0);

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
  _QWORD v25[4];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v25[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "safeAreaLayoutGuide"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v5));
  v25[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController view](self, "view"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v25[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (CLLocationCoordinate2D)selectedCoordinate
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CLLocationCoordinate2D result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController editLocationMapView](self, "editLocationMapView"));
  objc_msgSend(v2, "centerCoordinate");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.longitude = v8;
  result.latitude = v7;
  return result;
}

- (void)_captureUserAction:(int)a3
{
  if (a3)
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", *(_QWORD *)&a3, -[EditLocationViewController analyticsTarget](self, "analyticsTarget"), 0);
}

- (void)editLocationMapView:(id)a3 didChangeCenterCoordinate:(CLLocationCoordinate2D)a4
{
  double longitude;
  double latitude;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(double, double);

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController navigationItem](self, "navigationItem", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rightBarButtonItem"));
  objc_msgSend(v8, "setEnabled:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[EditLocationViewController changeHandler](self, "changeHandler"));
  if (v9)
  {
    v10 = (void (**)(double, double))objc_claimAutoreleasedReturnValue(-[EditLocationViewController changeHandler](self, "changeHandler"));
    v10[2](latitude, longitude);

  }
}

- (void)editLocationMapViewFinishedPanning:(id)a3
{
  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 10141);
}

- (void)editLocationMapViewFinishedZoomingIn:(id)a3
{
  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 10185);
}

- (void)editLocationMapViewFinishedZoomingOut:(id)a3
{
  -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", 10186);
}

- (void)editLocationMapView:(id)a3 didChangeViewMode:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if ((unint64_t)a4 <= 2)
  {
    v7 = v6;
    -[EditLocationViewController _captureUserAction:](self, "_captureUserAction:", dword_100E349CC[a4]);
    v6 = v7;
  }

}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (RAPEditLocationMapView)editLocationMapView
{
  return self->_editLocationMapView;
}

- (void)setEditLocationMapView:(id)a3
{
  objc_storeStrong((id *)&self->_editLocationMapView, a3);
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (CLLocationCoordinate2D)featureCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_featureCoordinate.latitude;
  longitude = self->_featureCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setFeatureCoordinate:(CLLocationCoordinate2D)a3
{
  self->_featureCoordinate = a3;
}

- (RAPMarkerViewAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_attributes, a3);
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (BOOL)isShowingTraffic
{
  return self->_isShowingTraffic;
}

- (void)setIsShowingTraffic:(BOOL)a3
{
  self->_isShowingTraffic = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_editLocationMapView, 0);
  objc_storeStrong(&self->_changeHandler, 0);
}

@end
