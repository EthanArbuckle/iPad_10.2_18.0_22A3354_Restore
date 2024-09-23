@implementation POIShapeComposedWaypoint

- (POIShapeComposedWaypoint)initWithMapView:(id)a3 composedWaypoint:(id)a4
{
  id v6;
  id v7;
  POIShapeComposedWaypoint *v8;
  POIShapeComposedWaypoint *v9;
  CGSize size;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)POIShapeComposedWaypoint;
  v8 = -[POIShapeComposedWaypoint init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mapView, v6);
    objc_storeStrong((id *)&v9->_composedWaypoint, a4);
    size = CGRectNull.size;
    v9->_boundingRect.origin = CGRectNull.origin;
    v9->_boundingRect.size = size;
  }

  return v9;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  void *v3;
  void *v4;
  double v5;
  CLLocationDegrees latitude;
  double v7;
  CLLocationDegrees longitude;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint location](self->_composedWaypoint, "location"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint location](self->_composedWaypoint, "location"));
    objc_msgSend(v4, "coordinate");
    latitude = v5;
    longitude = v7;

  }
  else
  {
    latitude = kCLLocationCoordinate2DInvalid.latitude;
    longitude = kCLLocationCoordinate2DInvalid.longitude;
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
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CLLocationCoordinate2D v38;
  CGRect result;

  -[POIShapeComposedWaypoint centerCoordinate](self, "centerCoordinate");
  latitude = v38.latitude;
  longitude = v38.longitude;
  if (CLLocationCoordinate2DIsValid(v38))
  {
    -[POIShapeComposedWaypoint _boundingRect](self, "_boundingRect");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeComposedWaypoint mapView](self, "mapView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeComposedWaypoint mapView](self, "mapView"));
    objc_msgSend(v13, "convertCoordinate:toPointToView:", v14, latitude, longitude);
    v16 = v15;
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeComposedWaypoint mapView](self, "mapView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "screen"));
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "window"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "screen"));
      objc_msgSend(v23, "nativeScale");
      v25 = v24;

    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v22, "nativeScale");
      v25 = v30;
    }

    x = UIRectCenteredAboutPointScale(v6, v8, v10, v12, v16, v18, v25);
    y = v31;
    width = v32;
    height = v33;

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  v34 = x;
  v35 = y;
  v36 = width;
  v37 = height;
  result.size.height = v37;
  result.size.width = v36;
  result.origin.y = v35;
  result.origin.x = v34;
  return result;
}

- (CGSize)estimatedSize
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
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  -[POIShapeComposedWaypoint _boundingRect](self, "_boundingRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeComposedWaypoint mapView](self, "mapView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "screen"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "window"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "screen"));
    objc_msgSend(v15, "nativeScale");
    v17 = v16;

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v14, "nativeScale");
    v17 = v18;
  }

  UIRectIntegralWithScale(v4, v6, v8, v10, v17);
  v20 = v19;
  v22 = v21;

  v23 = v20;
  v24 = v22;
  result.height = v24;
  result.width = v23;
  return result;
}

- (CGRect)_boundingRect
{
  GEOComposedWaypoint *composedWaypoint;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectIsNull(self->_boundingRect))
  {
    composedWaypoint = self->_composedWaypoint;
    v4 = objc_opt_class(GEOComposedRouteAnchorPoint);
    if ((objc_opt_isKindOfClass(composedWaypoint, v4) & 1) != 0)
    {
      if ((char *)-[GEOComposedWaypoint anchorPointType](self->_composedWaypoint, "anchorPointType") - 3 >= (char *)2)
        v5 = 1;
      else
        v5 = 3;
    }
    else
    {
      v5 = 1;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeComposedWaypoint mapView](self, "mapView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "metrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedWaypoint name](self->_composedWaypoint, "name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localeIdentifier"));
    objc_msgSend(v8, "boundingRectForItem:text:locale:", v5, v9, v11);
    self->_boundingRect.origin.x = v12;
    self->_boundingRect.origin.y = v13;
    self->_boundingRect.size.width = v14;
    self->_boundingRect.size.height = v15;

  }
  x = self->_boundingRect.origin.x;
  y = self->_boundingRect.origin.y;
  width = self->_boundingRect.size.width;
  height = self->_boundingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_composedWaypoint, 0);
}

@end
