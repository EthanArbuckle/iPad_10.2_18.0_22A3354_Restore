@implementation MapsAppTestSwitch

- (BOOL)runTest
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  NSLog(CFSTR("test is %@"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v5 = objc_msgSend(v4, "_mapstest_mapTypeWithDefaultType:", 0);
  self->_switchToType = (unint64_t)v5;
  v6 = 1;
  if (!(_DWORD)v5)
    v6 = 1;
  if ((_DWORD)v5 == 1)
    v6 = 0;
  if ((_DWORD)v5 == 104)
    v7 = 0;
  else
    v7 = v6;
  self->_switchFromType = v7;
  -[MapsAppTest switchToMapType:](self, "switchToMapType:");
  -[MapsAppTestJump endPoint](self, "endPoint");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  -[MapsAppTestJump pitch](self, "pitch");
  v16 = v15;
  -[MapsAppTestJump yaw](self, "yaw");
  objc_msgSend(v14, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", -[MapsAppTestJump altitudeIsRegionSize](self, "altitudeIsRegionSize"), v9, v11, v13, v16, v17);

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10098B184;
  v19[3] = &unk_1011AD260;
  objc_copyWeak(&v20, &location);
  -[MapsAppTestSwitch addFullyDrawnCallback:delayInSeconds:](self, "addFullyDrawnCallback:delayInSeconds:", v19, 0.1);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

- (void)didFinishJumping
{
  _QWORD v3[4];
  id v4;
  id location;

  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("switch"));
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("extendedSwitch"));
  -[MapsAppTest switchToMapType:](self, "switchToMapType:", self->_switchToType);
  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("switch"));
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10098B2A8;
  v3[3] = &unk_1011AD260;
  objc_copyWeak(&v4, &location);
  -[MapsAppTestSwitch addFullyDrawnCallback:delayInSeconds:](self, "addFullyDrawnCallback:delayInSeconds:", v3, 0.1);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)addFullyDrawnCallback:(id)a3
{
  -[MapsAppTestSwitch addFullyDrawnCallback:delayInSeconds:](self, "addFullyDrawnCallback:delayInSeconds:", a3, 0.0);
}

- (void)addFullyDrawnCallback:(id)a3 delayInSeconds:(double)a4
{
  id v6;
  dispatch_time_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  if (a4 <= 0.0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest fullyDrawnCallbacks](self, "fullyDrawnCallbacks"));
    v9 = objc_msgSend(v6, "copy");
    v10 = objc_retainBlock(v9);
    objc_msgSend(v8, "addObject:", v10);

    -[MapsAppTest setupFullyDrawnNotification:](self, "setupFullyDrawnNotification:", "onFullyDrawn:");
  }
  else
  {
    v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10098B400;
    v11[3] = &unk_1011AE240;
    v11[4] = self;
    v12 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v11);

  }
}

- (void)onFullyDrawn:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD);
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasFailedTiles")));
  v6 = objc_msgSend(v5, "BOOLValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object"));
  if (!v7
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "object")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView")),
        v5 == v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    v10 = objc_msgSend(v9, "isFullyDrawn") & (v6 ^ 1);

    if (v7)
    {

      if ((v10 & 1) == 0)
        goto LABEL_11;
    }
    else if (!v10)
    {
      goto LABEL_11;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "removeObserver:name:object:", self, VKMapViewDidBecomeFullyDrawnNotification, 0);

    while (1)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest fullyDrawnCallbacks](self, "fullyDrawnCallbacks"));
      v13 = objc_msgSend(v12, "count");

      if (!v13)
        break;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest fullyDrawnCallbacks](self, "fullyDrawnCallbacks"));
      v15 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest fullyDrawnCallbacks](self, "fullyDrawnCallbacks"));
      objc_msgSend(v16, "removeObjectAtIndex:", 0);

      v15[2](v15);
    }
  }
  else
  {

  }
LABEL_11:

}

@end
