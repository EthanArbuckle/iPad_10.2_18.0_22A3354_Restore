@implementation POIShapeUserLocation

- (POIShapeUserLocation)initWithMapView:(id)a3 coordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v7;
  POIShapeUserLocation *v8;
  POIShapeUserLocation *v9;
  POIShapeUserLocation *v10;
  objc_super v12;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POIShapeUserLocation;
  v8 = -[POIShapeUserLocation init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mapView, v7);
    v9->_coordinate.latitude = latitude;
    v9->_coordinate.longitude = longitude;
    v10 = v9;
  }

  return v9;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CLLocationCoordinate2D v11;
  CLLocationCoordinate2D result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  v11.latitude = latitude;
  v11.longitude = longitude;
  if (!CLLocationCoordinate2DIsValid(v11))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "coordinate");
      latitude = v7;
      longitude = v8;
    }

  }
  v9 = latitude;
  v10 = longitude;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (CGRect)currentFrameInMapView
{
  double latitude;
  double longitude;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CLLocationCoordinate2D v34;
  CGRect result;

  -[POIShapeUserLocation centerCoordinate](self, "centerCoordinate");
  latitude = v34.latitude;
  longitude = v34.longitude;
  if (CLLocationCoordinate2DIsValid(v34))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeUserLocation mapView](self, "mapView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeUserLocation mapView](self, "mapView"));
    objc_msgSend(v5, "convertCoordinate:toPointToView:", v6, latitude, longitude);
    v8 = v7;
    v10 = v9;

    -[POIShapeUserLocation _size](self, "_size");
    v12 = v11;
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeUserLocation mapView](self, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "screen"));
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "window"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
      objc_msgSend(v19, "nativeScale");
      v21 = v20;

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v18, "nativeScale");
      v21 = v26;
    }

    x = UIRectCenteredAboutPointScale(0.0, 0.0, v12, v14, v8, v10, v21);
    y = v27;
    width = v28;
    height = v29;

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGSize)_size
{
  double v2;
  double v3;
  CGSize result;

  +[_MKPuckAnnotationView baseDiameter](_MKPuckAnnotationView, "baseDiameter");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
}

@end
