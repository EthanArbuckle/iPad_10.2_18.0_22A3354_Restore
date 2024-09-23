@implementation NavigationCameraSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NavigationCameraSnapshot)initWithCamera:(id)a3 tracePlaybackTimeFraction:(double)a4 puckLocation:(id)a5
{
  id v8;
  id v9;
  NavigationCameraSnapshot *v10;
  MKMapCamera *v11;
  MKMapCamera *camera;
  NavigationCameraSnapshot *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)NavigationCameraSnapshot;
  v10 = -[NavigationCameraSnapshot init](&v15, "init");
  if (v10)
  {
    v11 = (MKMapCamera *)objc_msgSend(v8, "copy");
    camera = v10->_camera;
    v10->_camera = v11;

    v10->_tracePlaybackTimeFraction = a4;
    objc_storeStrong((id *)&v10->_puckLocation, a5);
    v13 = v10;
  }

  return v10;
}

- (NavigationCameraSnapshot)init
{
  void *v3;
  NavigationCameraSnapshot *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapCamera camera](MKMapCamera, "camera"));
  v4 = -[NavigationCameraSnapshot initWithCamera:tracePlaybackTimeFraction:puckLocation:](self, "initWithCamera:tracePlaybackTimeFraction:puckLocation:", v3, 0, 0.0);

  return v4;
}

- (NavigationCameraSnapshot)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  NavigationCameraSnapshot *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MKMapCamera), CFSTR("NavigationCameraSnapshotCamera"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("NavigationCameraSnapshotTracePlaybackTimeFraction"));
  v8 = v7;
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MNLocation), CFSTR("NavigationCameraSnapshotLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[NavigationCameraSnapshot initWithCamera:tracePlaybackTimeFraction:puckLocation:](self, "initWithCamera:tracePlaybackTimeFraction:puckLocation:", v6, v10, v8);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshot camera](self, "camera"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("NavigationCameraSnapshotCamera"));

  -[NavigationCameraSnapshot tracePlaybackTimeFraction](self, "tracePlaybackTimeFraction");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("NavigationCameraSnapshotTracePlaybackTimeFraction"));
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshot puckLocation](self, "puckLocation"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("NavigationCameraSnapshotLocation"));

}

- (double)puckToCenterX
{
  void *v3;
  double v4;
  CLLocationDegrees v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  CLLocationDegrees v12;
  double v13;
  MKMapPoint v14;
  double x;
  double v16;
  CLLocationCoordinate2D v18;
  CLLocationCoordinate2D v19;
  CLLocationCoordinate2D v20;
  CLLocationCoordinate2D v21;
  MKMapPoint v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshot puckLocation](self, "puckLocation"));
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshot camera](self, "camera"));
  objc_msgSend(v8, "centerCoordinate");
  v10 = v9;
  v12 = v11;

  v18.latitude = v5;
  v18.longitude = v7;
  v13 = 0.0;
  if (CLLocationCoordinate2DIsValid(v18))
  {
    v19.latitude = v10;
    v19.longitude = v12;
    if (CLLocationCoordinate2DIsValid(v19))
    {
      v20.latitude = v5;
      v20.longitude = v7;
      v14 = MKMapPointForCoordinate(v20);
      v21.latitude = v10;
      v21.longitude = v12;
      x = MKMapPointForCoordinate(v21).x;
      v22.x = x;
      v22.y = v14.y;
      v16 = MKMetersBetweenMapPoints(v14, v22);
      if (x <= v14.x)
        return -v16;
      else
        return v16;
    }
  }
  return v13;
}

- (double)puckToCenterY
{
  void *v3;
  double v4;
  CLLocationDegrees v5;
  double v6;
  CLLocationDegrees v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  double v11;
  CLLocationDegrees v12;
  double v13;
  MKMapPoint v14;
  double y;
  double v16;
  CLLocationCoordinate2D v18;
  CLLocationCoordinate2D v19;
  CLLocationCoordinate2D v20;
  CLLocationCoordinate2D v21;
  MKMapPoint v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshot puckLocation](self, "puckLocation"));
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCameraSnapshot camera](self, "camera"));
  objc_msgSend(v8, "centerCoordinate");
  v10 = v9;
  v12 = v11;

  v18.latitude = v5;
  v18.longitude = v7;
  v13 = 0.0;
  if (CLLocationCoordinate2DIsValid(v18))
  {
    v19.latitude = v10;
    v19.longitude = v12;
    if (CLLocationCoordinate2DIsValid(v19))
    {
      v20.latitude = v5;
      v20.longitude = v7;
      v14 = MKMapPointForCoordinate(v20);
      v21.latitude = v10;
      v21.longitude = v12;
      y = MKMapPointForCoordinate(v21).y;
      v22.x = v14.x;
      v22.y = y;
      v16 = MKMetersBetweenMapPoints(v14, v22);
      if (y <= v14.y)
        return -v16;
      else
        return v16;
    }
  }
  return v13;
}

- (MNLocation)puckLocation
{
  return self->_puckLocation;
}

- (MKMapCamera)camera
{
  return self->_camera;
}

- (double)tracePlaybackTimeFraction
{
  return self->_tracePlaybackTimeFraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_puckLocation, 0);
}

@end
