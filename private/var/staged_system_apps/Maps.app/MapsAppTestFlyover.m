@implementation MapsAppTestFlyover

- (BOOL)runTest
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  NSLog(CFSTR("test is %@"), v3);

  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  -[MapsAppTest runSerialSubTestAtIndex:](self, "runSerialSubTestAtIndex:", 0);
  return 1;
}

- (void)setCenterCoordinateFull:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;

  v5 = a3;
  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subTestName")));
  if (!v6)
  {
    v7 = NSStringFromSelector(a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  if (objc_msgSend(v6, "hasSuffix:", CFSTR(":")))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (char *)objc_msgSend(v6, "length") - 1));

    v6 = (void *)v8;
  }
  objc_initWeak(&location, self);
  objc_msgSend(v5, "_mapstest_VKLocationCoordinate2D");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "_mapstest_altitude");
  v14 = v13;
  objc_msgSend(v5, "_mapstest_yaw");
  v16 = v15;
  objc_msgSend(v5, "_mapstest_pitch");
  v18 = v17;
  objc_msgSend(v5, "_mapstest_duration");
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v22 = VKAnimationCurveEaseInOut;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100AC0874;
  v24[3] = &unk_1011AC888;
  objc_copyWeak(&v26, &location);
  v23 = v6;
  v25 = v23;
  objc_msgSend(v21, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", v22, v24, v10, v12, v14, v16, v18, v20);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

@end
