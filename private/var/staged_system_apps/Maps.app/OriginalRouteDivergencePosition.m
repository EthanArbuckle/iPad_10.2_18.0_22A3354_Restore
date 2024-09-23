@implementation OriginalRouteDivergencePosition

- (OriginalRouteDivergencePosition)initWithRouteCoordinate:(id)a3 route:(id)a4
{
  id v6;
  OriginalRouteDivergencePosition *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  void *v15;
  GEORouteMatch *v16;
  GEORouteMatch *routeMatch;
  OriginalRouteDivergencePosition *v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)OriginalRouteDivergencePosition;
  v7 = -[OriginalRouteDivergencePosition init](&v20, "init");
  if (v7)
  {
    objc_msgSend(v6, "pointAtRouteCoordinate:", a3);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = objc_alloc((Class)GEORouteMatch);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v16 = (GEORouteMatch *)objc_msgSend(v14, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v6, a3, 0, v15, v9, v11, v13, -1.0);
    routeMatch = v7->_routeMatch;
    v7->_routeMatch = v16;

    v7->_presentationCoordinate.latitude = v9;
    v7->_presentationCoordinate.longitude = v11;
    v18 = v7;
  }

  return v7;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)presentationCoordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_presentationCoordinate.latitude;
  longitude = self->_presentationCoordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setPresentationCoordinate:(id)a3
{
  self->_presentationCoordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (BOOL)tracking
{
  return self->_tracking;
}

- (void)setTracking:(BOOL)a3
{
  self->_tracking = a3;
}

- (BOOL)isAnimatingAccuracy
{
  return self->_animatingAccuracy;
}

- (void)setAnimatingAccuracy:(BOOL)a3
{
  self->_animatingAccuracy = a3;
}

- (double)presentationAccuracy
{
  return self->_presentationAccuracy;
}

- (void)setPresentationAccuracy:(double)a3
{
  self->_presentationAccuracy = a3;
}

- (double)minimumAccuracy
{
  return self->_minimumAccuracy;
}

- (VKEdgeInsets)annotationTrackingEdgeInsets
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_annotationTrackingEdgeInsets.top;
  left = self->_annotationTrackingEdgeInsets.left;
  bottom = self->_annotationTrackingEdgeInsets.bottom;
  right = self->_annotationTrackingEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (void)setRouteMatch:(id)a3
{
  objc_storeStrong((id *)&self->_routeMatch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeMatch, 0);
}

@end
