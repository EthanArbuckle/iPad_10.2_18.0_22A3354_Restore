@implementation MapsAppTestDrivingRoute

- (BOOL)runTest
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id location;

  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  -[MapsAppTestRoute registerGEOSubtestsForRouting](self, "registerGEOSubtestsForRouting");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v3, "_mapstest_jumpPoint");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v10, "_mapstest_pitch");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  objc_msgSend(v13, "_mapstest_yaw");
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v17 = objc_msgSend(v16, "_mapstest_mapType");

  -[MapsAppTest switchToMapType:](self, "switchToMapType:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v18, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v5, v7, v9, v12, v15);

  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10022F44C;
  v20[3] = &unk_1011AD260;
  objc_copyWeak(&v21, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v20);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return 1;
}

@end
