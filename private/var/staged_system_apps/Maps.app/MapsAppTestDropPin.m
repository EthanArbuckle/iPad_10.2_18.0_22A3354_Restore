@implementation MapsAppTestDropPin

- (MapsAppTestDropPin)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestDropPin *v9;
  void *v10;
  double v11;
  CLLocationDegrees v12;
  void *v13;
  double v14;
  CLLocationDegrees v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v22;

  v8 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MapsAppTestDropPin;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v22, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pin_latitude")));
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pin_longitude")));
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    v9->_pinCoordinate = CLLocationCoordinate2DMake(v12, v15);
    objc_msgSend(v8, "_mapstest_pitch");
    v9->_pitch = v16;
    objc_msgSend(v8, "_mapstest_yaw");
    v9->_yaw = v17;
    objc_msgSend(v8, "_mapstest_jumpPoint");
    v9->_region.latitude = v18;
    v9->_region.longitude = v19;
    v9->_region.altitude = v20;
  }

  return v9;
}

- (BOOL)runTest
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("loadingScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v3, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, self->_region.latitude, self->_region.longitude, self->_region.altitude, self->_pitch, self->_yaw);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10099345C;
  v5[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return 1;
}

- (void)didFinishJumping
{
  void *v3;
  uint64_t v4;
  void *v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("loadingScene"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("showPin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SearchResult customSearchResultWithCoordinate:floorOrdinal:](SearchResult, "customSearchResultWithCoordinate:floorOrdinal:", 0x7FFFFFFFLL, self->_pinCoordinate.latitude, self->_pinCoordinate.longitude));
  objc_msgSend(v3, "setType:", 3);
  objc_msgSend(v3, "setHasIncompleteMetadata:", 1);
  objc_initWeak(&location, self);
  v4 = MKPlaceViewControllerDidShowNotification;
  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_1009935DC;
  v9 = &unk_1011AD288;
  objc_copyWeak(&v10, &location);
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v4, 0, &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator", v6, v7, v8, v9));
  objc_msgSend(v5, "pptTestPresentPlaceCardForSearchResult:animated:", v3, 1);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)didShowPlaceCard
{
  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("showPin"));
  -[MapsAppTest finishedTest](self, "finishedTest");
}

- (CLLocationCoordinate2D)pinCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_pinCoordinate.latitude;
  longitude = self->_pinCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setPinCoordinate:(CLLocationCoordinate2D)a3
{
  self->_pinCoordinate = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)region
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_region.latitude;
  longitude = self->_region.longitude;
  altitude = self->_region.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setRegion:(id)a3
{
  self->_region = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

@end
