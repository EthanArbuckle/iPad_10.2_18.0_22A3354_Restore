@implementation MapsAppTestCirclePan

- (MapsAppTestCirclePan)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  MapsAppTestCirclePan *v10;
  MapsAppTestCirclePan *v11;
  _BOOL4 isSubTest;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  objc_super v37;

  v8 = a4;
  v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)MapsAppTestCirclePan;
  v10 = -[MapsAppTest initWithApplication:testName:options:](&v37, "initWithApplication:testName:options:", a3, v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_requiresPreLoadAnimation = 1;
    isSubTest = objc_msgSend(v8, "rangeOfString:", CFSTR("circle")) != 0;
    v11->_isSubTest = isSubTest;
    if (v9)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v14 = objc_msgSend(v13, "containsObject:", CFSTR("isSubTest"));

      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("isSubTest")));
        v11->_isSubTest = objc_msgSend(v15, "BOOLValue");
        v11->_requiresPreLoadAnimation = 0;

      }
      isSubTest = v11->_isSubTest;
    }
    else
    {
      v14 = 0;
    }
    v11->_circleRadius = 4.0;
    if (!isSubTest)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v11, "options"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("circleDistance")));

      if (v17)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v11, "options"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("circleDistance")));
        objc_msgSend(v19, "doubleValue");
        v11->_circleRadius = v20 * 0.5;

      }
    }
    v11->_iterations = 10;
    v11->_animationDuration = 0.0500000007;
    if (v11->_isSubTest)
    {
      if (v14)
      {
        objc_msgSend(v9, "_mapstest_pointWithKeys:", &off_1012732A8);
        v11->_endPoint.latitude = v21;
        v11->_endPoint.longitude = v22;
        v11->_endPoint.altitude = v23;
        v11->_iterations = (int64_t)objc_msgSend(v9, "_mapstest_integerValueForKey:defaultValue:", CFSTR("iterations"), 10);
        objc_msgSend(v9, "_mapstest_animationDurationWithDefault:", 0.0500000007);
        v11->_animationDuration = v24 * 0.25;
        v11->_altitudeIsRegionSize = 1;
        objc_msgSend(v9, "_mapstest_pitch");
        v11->_pitch = v25;
        objc_msgSend(v9, "_mapstest_yaw");
        v11->_yaw = v26;
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v11, "options"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("circleDistance")));

        if (v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v11, "options"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("circleDistance")));
          objc_msgSend(v30, "doubleValue");
          v11->_circleRadius = v31 * 0.5;

        }
      }
    }
    else
    {
      objc_msgSend(v9, "_mapstest_pointWithKeys:", &off_101273290);
      v11->_endPoint.latitude = v32;
      v11->_endPoint.longitude = v33;
      v11->_endPoint.altitude = v34;
      v11->_iterations = (int64_t)objc_msgSend(v9, "_mapstest_integerValueForKey:defaultValue:", CFSTR("iterations"), 10);
      objc_msgSend(v9, "_mapstest_animationDurationWithDefault:", 0.0500000007);
      v11->_animationDuration = v35 * 0.25;
      v11->_pitch = 0.0;
      v11->_yaw = 0.0;
    }
  }

  return v11;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double latitude;
  double longitude;
  double altitude;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  _QWORD v33[4];
  id v34;
  id location;

  if (!self->_isSubTest)
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_msgSend(v3, "_setLocationPulseEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  if (self->_altitudeIsRegionSize)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", self->_endPoint.latitude, self->_endPoint.longitude, self->_endPoint.altitude));
    objc_msgSend(v4, "setMapRegion:pitch:yaw:", v5, self->_pitch, self->_yaw);

  }
  else
  {
    objc_msgSend(v4, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, 0, VKLocationCoordinate2DMake(self->_endPoint.latitude, self->_endPoint.longitude));
  }
  if (!self->_isSubTest)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("circleDistance")));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("circleDistance")));
      objc_msgSend(v9, "doubleValue");
      self->_circleRadius = v10 * 0.5;

    }
  }
  latitude = self->_endPoint.latitude;
  longitude = self->_endPoint.longitude;
  altitude = self->_endPoint.altitude;
  objc_msgSend(v4, "convertPoint:toCoordinateFromLayer:", v4, 1.0, 0.0);
  v15 = v14;
  v16 = objc_msgSend(v4, "convertPoint:toCoordinateFromLayer:", v4, 0.0, 0.0);
  v18 = self->_circleRadius * (v15 - v17);
  v19 = latitude - v18;
  self->_circlePoints[0].latitude = VKLocationCoordinate3DMake(v16, latitude - v18, longitude - v18, altitude);
  self->_circlePoints[0].longitude = v20;
  self->_circlePoints[0].altitude = v21;
  v22 = latitude + v18;
  self->_circlePoints[1].latitude = VKLocationCoordinate3DMake(v23, v22, longitude - v18, altitude);
  self->_circlePoints[1].longitude = v24;
  self->_circlePoints[1].altitude = v25;
  self->_circlePoints[2].latitude = VKLocationCoordinate3DMake(v26, v22, longitude + v18, altitude);
  self->_circlePoints[2].longitude = v27;
  self->_circlePoints[2].altitude = v28;
  self->_circlePoints[3].latitude = VKLocationCoordinate3DMake(v29, v19, longitude + v18, altitude);
  self->_circlePoints[3].longitude = v30;
  self->_circlePoints[3].altitude = v31;
  objc_initWeak(&location, self);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10044B8D0;
  v33[3] = &unk_1011AD260;
  objc_copyWeak(&v34, &location);
  -[MapsAppTestCirclePan addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v33);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return 1;
}

- (void)circlePanLoadFinished
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10044B950;
  v2[3] = &unk_1011AC860;
  v2[4] = self;
  -[MapsAppTestCirclePan animateCircle:completion:](self, "animateCircle:completion:", 4, v2);
}

- (void)animateCircle:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void (**testFinshdCallback)(void);
  int64_t v9;
  void *v10;
  void *v11;
  double pitch;
  double yaw;
  double animationDuration;
  void *v15;
  $5B2A0FEE2A1717E36A90D599307F83D1 *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double altitude;
  double v23;
  _QWORD v24[5];
  id v25;
  int64_t v26;
  _QWORD v27[5];
  id v28;
  int64_t v29;

  v6 = a4;
  v7 = v6;
  if (self->_requiresPreLoadAnimation)
  {
    if (a3 < 0)
    {
      if (!self->_isSubTest)
        -[MapsAppTest failedTest](self, "failedTest");
      testFinshdCallback = (void (**)(void))self->_testFinshdCallback;
      if (testFinshdCallback)
        testFinshdCallback[2]();
    }
    if (a3 <= 0)
      v9 = -(-a3 & 3);
    else
      v9 = a3 & 3;
    if (self->_altitudeIsRegionSize)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", self->_circlePoints[v9].latitude, self->_circlePoints[v9].longitude, self->_circlePoints[v9].altitude));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
      pitch = self->_pitch;
      yaw = self->_yaw;
      animationDuration = self->_animationDuration;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10044C0C8;
      v27[3] = &unk_1011B7240;
      v29 = a3;
      v27[4] = self;
      v28 = v7;
      objc_msgSend(v11, "setMapRegion:pitch:yaw:duration:completion:", v10, v27, pitch, yaw, animationDuration);

    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
      v16 = &self->_circlePoints[v9];
      v17 = VKLocationCoordinate2DMake(v16->latitude, v16->longitude);
      v19 = v18;
      v20 = self->_yaw;
      v21 = self->_pitch;
      altitude = v16->altitude;
      v23 = self->_animationDuration;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10044C16C;
      v24[3] = &unk_1011B7240;
      v26 = a3;
      v24[4] = self;
      v25 = v7;
      objc_msgSend(v15, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, v24, v17, v19, altitude, v20, v21, v23);

    }
  }
  else
  {
    (*((void (**)(id))v6 + 2))(v6);
  }

}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest fullyDrawnCallbacks](self, "fullyDrawnCallbacks"));
  v6 = objc_msgSend(v4, "copy");

  v7 = objc_retainBlock(v6);
  objc_msgSend(v5, "addObject:", v7);

  v8 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10044C2D8;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
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

- ($1AB5FA073B851C12C2339EC22442E995)endPoint
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_endPoint.latitude;
  longitude = self->_endPoint.longitude;
  altitude = self->_endPoint.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setEndPoint:(id)a3
{
  self->_endPoint = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (BOOL)altitudeIsRegionSize
{
  return self->_altitudeIsRegionSize;
}

- (void)setAltitudeIsRegionSize:(BOOL)a3
{
  self->_altitudeIsRegionSize = a3;
}

- (BOOL)useTestNameInResults
{
  return self->_useTestNameInResults;
}

- (void)setUseTestNameInResults:(BOOL)a3
{
  self->_useTestNameInResults = a3;
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

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (void)setCircleRadius:(double)a3
{
  self->_circleRadius = a3;
}

- (id)testFinshdCallback
{
  return self->_testFinshdCallback;
}

- (void)setTestFinshdCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testFinshdCallback, 0);
}

@end
