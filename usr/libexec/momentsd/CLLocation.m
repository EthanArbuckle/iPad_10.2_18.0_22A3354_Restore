@implementation CLLocation

- (CLLocation)initWithRTLocation:(id)a3
{
  id v5;
  void *v6;
  double v7;
  CLLocationDegrees v8;
  CLLocationDegrees v9;
  CLLocationCoordinate2D v10;
  double v11;
  double v12;
  void *v13;
  CLLocation *v14;
  id os_log;
  NSObject *v16;
  void *v17;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "latitude");
    v8 = v7;
    objc_msgSend(v6, "longitude");
    v10 = CLLocationCoordinate2DMake(v8, v9);
    objc_msgSend(v6, "horizontalUncertainty");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "date"));
    self = -[CLLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:](self, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v13, v10.latitude, v10.longitude, 0.0, v12, -1.0);

    v14 = self;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CLLocation(RTExtensions) initWithRTLocation:].cold.1(v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLLocation+MOExtensions.m"), 20, CFSTR("Invalid parameter not satisfying: location"));

    v14 = 0;
  }

  return v14;
}

@end
