@implementation MapsAppTestCapture

- (BOOL)runTest
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  NSLog(CFSTR("capture is %@"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = objc_msgSend(v4, "_mapstest_hasLatitudeAndLongitude");

  if (v5)
  {
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v6, "_mapstest_jumpPoint");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v13, "_mapstest_pitch");
    v15 = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    objc_msgSend(v16, "_mapstest_yaw");
    v18 = v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    objc_msgSend(v19, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, v8, v10, v12, v15, v18);

    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1003CABE8;
    v21[3] = &unk_1011AD260;
    objc_copyWeak(&v22, &location);
    -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)_didFinishJumpingForCapture
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003CAC88;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end
