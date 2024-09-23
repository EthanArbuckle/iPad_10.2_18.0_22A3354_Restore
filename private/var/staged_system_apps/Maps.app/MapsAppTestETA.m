@implementation MapsAppTestETA

- (BOOL)runTest
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  dispatch_time_t v10;
  _QWORD block[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v4, "pptTestResetForLaunchURL");

  objc_msgSend(v3, "_mapstest_locationCoordinate2D");
  v6 = v5;
  v8 = v7;
  -[MapsAppTest registerGEOManifestSubtests](self, "registerGEOManifestSubtests");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v9, "addObserver:selector:name:object:", self, "finishedTest", MapsButtonETAUpdatedNotification, 0);

  -[MapsAppTest switchToMapType:](self, "switchToMapType:", objc_msgSend(v3, "_mapstest_mapTypeWithDefaultType:", -[MapsAppTestETA defaultMapType](self, "defaultMapType")));
  v10 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A45FE4;
  block[3] = &unk_1011AED30;
  block[4] = self;
  block[5] = v6;
  block[6] = v8;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (void)startAtLocation:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[7];

  longitude = a3.longitude;
  latitude = a3.latitude;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionWithCenterLatitude:longitude:size:](GEOMapRegion, "_mapstest_mapRegionWithCenterLatitude:longitude:size:", a3.latitude, a3.longitude, 0.01));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v7, "setMapRegion:pitch:yaw:", v6, 0.0, 0.0);

  v8 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A460C8;
  block[3] = &unk_1011AED30;
  block[4] = self;
  *(CLLocationDegrees *)&block[5] = latitude;
  *(CLLocationDegrees *)&block[6] = longitude;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (unint64_t)defaultMapType
{
  return 104;
}

- (void)doAfterStartedTestAtLocation:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_msgSend(v5, "convertCoordinate:toPointToView:", v5, latitude, longitude);
  objc_msgSend(v5, "_handleSelectionAtPoint:");

}

@end
