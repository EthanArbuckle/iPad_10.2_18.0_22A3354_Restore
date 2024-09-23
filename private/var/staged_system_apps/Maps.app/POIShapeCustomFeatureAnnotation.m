@implementation POIShapeCustomFeatureAnnotation

- (POIShapeCustomFeatureAnnotation)initWithMapView:(id)a3 customFeatureAnnotation:(id)a4
{
  id v6;
  id v7;
  POIShapeCustomFeatureAnnotation *v8;
  POIShapeCustomFeatureAnnotation *v9;
  POIShapeCustomFeatureAnnotation *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)POIShapeCustomFeatureAnnotation;
  v8 = -[POIShapeCustomFeatureAnnotation init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_mapView, v6);
    objc_storeStrong((id *)&v9->_customFeatureAnnotation, a4);
    v10 = v9;
  }

  return v9;
}

- (CLLocationCoordinate2D)centerCoordinate
{
  void *v3;
  double v4;
  CLLocationDegrees v5;
  void *v6;
  CLLocationDegrees v7;
  CLLocationCoordinate2D v8;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation customFeatureAnnotation](self, "customFeatureAnnotation"));
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation customFeatureAnnotation](self, "customFeatureAnnotation"));
  objc_msgSend(v6, "coordinate");
  v8 = CLLocationCoordinate2DMake(v5, v7);

  latitude = v8.latitude;
  longitude = v8.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (CGRect)currentFrameInMapView
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation _labelMarker](self, "_labelMarker"));
  if (objc_msgSend(v3, "isVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation mapView](self, "mapView"));
    objc_msgSend(v3, "screenCollisionBounds");
    objc_msgSend(v4, "convertRect:fromView:", 0);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation mapView](self, "mapView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "screen"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "window"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "screen"));
      objc_msgSend(v17, "nativeScale");
      v19 = v18;

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v16, "nativeScale");
      v19 = v24;
    }

    x = UIRectIntegralWithScale(v6, v8, v10, v12, v19);
    y = v25;
    width = v26;
    height = v27;

  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (CGSize)estimatedSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation _labelMarker](self, "_labelMarker"));
  if (objc_msgSend(v2, "isVisible"))
  {
    objc_msgSend(v2, "screenCollisionBounds");
    v4 = v3;
    v6 = v5;
  }
  else
  {
    v4 = 0x404E000000000000;
    v6 = 0x404E000000000000;
  }

  v7 = *(double *)&v4;
  v8 = *(double *)&v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)_labelMarker
{
  void *v3;
  void *v4;
  void *v5;
  VKLabelMarker *v6;
  VKLabelMarker *labelMarker;

  if (!self->_labelMarker)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VKCustomFeatureAnnotation feature](self->_customFeatureAnnotation, "feature"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[POIShapeCustomFeatureAnnotation mapView](self, "mapView"));
      v6 = (VKLabelMarker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_labelMarkerForCustomFeatureAnnotation:", self->_customFeatureAnnotation));
      labelMarker = self->_labelMarker;
      self->_labelMarker = v6;

    }
  }
  return self->_labelMarker;
}

- (VKCustomFeatureAnnotation)customFeatureAnnotation
{
  return self->_customFeatureAnnotation;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_customFeatureAnnotation, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
}

@end
