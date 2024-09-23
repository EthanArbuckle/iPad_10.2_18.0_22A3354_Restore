@implementation RAPRouteStepMapViewCell

- (RAPRouteStepMapViewCell)initWithIdentifier:(id)a3 route:(id)a4 routeStep:(id)a5
{
  id v9;
  id v10;
  RAPRouteStepMapViewCell *v11;
  RAPRouteStepMapViewCell *v12;
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
  objc_super v35;

  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)RAPRouteStepMapViewCell;
  v11 = -[RAPRouteStepMapViewCell initWithStyle:reuseIdentifier:](&v35, "initWithStyle:reuseIdentifier:", 0, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_route, a4);
    objc_storeStrong((id *)&v12->_routeStep, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](v12, "mapView"));
    -[RAPRouteStepMapViewCell addSubview:](v12, "addSubview:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](v12, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell topAnchor](v12, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    objc_msgSend(v14, "addObject:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](v12, "mapView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "widthAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell widthAnchor](v12, "widthAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v14, "addObject:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](v12, "mapView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell leadingAnchor](v12, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    objc_msgSend(v14, "addObject:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](v12, "mapView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell bottomAnchor](v12, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    objc_msgSend(v14, "addObject:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](v12, "mapView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "heightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToConstant:", 110.0));
    objc_msgSend(v14, "addObject:", v33);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
    -[RAPRouteStepMapViewCell _setupRouteAnnotationsController](v12, "_setupRouteAnnotationsController");

  }
  return v12;
}

- (void)_setupRouteAnnotationsController
{
  RouteAnnotationsController *v3;
  RouteAnnotationsController *routeAnnotationsController;
  void *v5;
  RouteAnnotationsConfiguration *v6;

  if (!self->_routeAnnotationsController)
  {
    v3 = objc_alloc_init(RouteAnnotationsController);
    routeAnnotationsController = self->_routeAnnotationsController;
    self->_routeAnnotationsController = v3;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell mapView](self, "mapView"));
    -[RouteAnnotationsController setMapView:](self->_routeAnnotationsController, "setMapView:", v5);

    v6 = -[RouteAnnotationsConfiguration initWithRoute:]([RouteAnnotationsConfiguration alloc], "initWithRoute:", self->_route);
    -[RouteAnnotationsController setConfiguration:](self->_routeAnnotationsController, "setConfiguration:", v6);

  }
}

- (TransitSteppingCameraFramer)cameraFramer
{
  TransitSteppingCameraFramer *cameraFramer;
  TransitSteppingCameraFramer *v4;
  TransitSteppingCameraFramer *v5;

  cameraFramer = self->_cameraFramer;
  if (!cameraFramer)
  {
    v4 = objc_alloc_init(TransitSteppingCameraFramer);
    v5 = self->_cameraFramer;
    self->_cameraFramer = v4;

    cameraFramer = self->_cameraFramer;
  }
  return cameraFramer;
}

- (MKMapView)mapView
{
  MKMapView *mapView;
  MKMapView *v4;
  MKMapView *v5;
  unsigned int v6;
  _QWORD *v7;
  void *v8;
  double v9;
  _QWORD v11[5];
  BOOL v12;

  mapView = self->_mapView;
  if (!mapView)
  {
    v4 = (MKMapView *)objc_msgSend(objc_alloc((Class)MKMapView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_mapView;
    self->_mapView = v4;

    v6 = -[GEOComposedRoute transportType](self->_route, "transportType");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1002C1958;
    v11[3] = &unk_1011AFE98;
    v11[4] = self;
    v12 = v6 == 1;
    v7 = objc_retainBlock(v11);
    if (v6 == 1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPRouteStepMapViewCell cameraFramer](self, "cameraFramer"));
      objc_msgSend(v8, "rectForStep:currentStepIndex:handler:", self->_routeStep, -[GEOComposedRouteStep stepIndex](self->_routeStep, "stepIndex"), v7);

    }
    else
    {
      v9 = sub_100778658(self->_routeStep);
      ((void (*)(_QWORD *, double))v7[2])(v7, v9);
    }
    -[MKMapView setTranslatesAutoresizingMaskIntoConstraints:](self->_mapView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKMapView setUserInteractionEnabled:](self->_mapView, "setUserInteractionEnabled:", 0);
    -[MKMapView setDelegate:](self->_mapView, "setDelegate:", self);

    mapView = self->_mapView;
  }
  return mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void)setCameraFramer:(id)a3
{
  objc_storeStrong((id *)&self->_cameraFramer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraFramer, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_routeStep, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsController, 0);
}

@end
