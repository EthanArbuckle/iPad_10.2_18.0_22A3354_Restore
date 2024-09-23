@implementation MapsAppTestJump

- (MapsAppTestJump)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestJump *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  double v21;
  void *v22;
  objc_super v24;

  v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MapsAppTestJump;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v24, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "_mapstest_pitch");
    v9->_pitch = v10;
    objc_msgSend(v8, "_mapstest_yaw");
    v9->_yaw = v11;
    objc_msgSend(v8, "_mapstest_jumpPoint");
    v9->_endPoint.latitude = v12;
    v9->_endPoint.longitude = v13;
    v9->_endPoint.altitude = v14;
    v9->_altitudeIsRegionSize = 1;
    if (v8)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
      v16 = objc_msgSend(v15, "containsObject:", CFSTR("requiresSubTest"));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("requiresSubTest")));
        v9->_requiresSubTest = objc_msgSend(v17, "BOOLValue");

      }
      else
      {
        v9->_requiresSubTest = 1;
      }
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
    v19 = objc_msgSend(v18, "_mapstest_hasAltitude");

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
      objc_msgSend(v20, "_mapstest_altitude");
      v9->_endPoint.altitude = v21;

      v9->_altitudeIsRegionSize = 0;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
    v9->_waitSecondsForMapViewSetup = (int)objc_msgSend(v22, "_mapstest_waitSecondsForMapViewSetup");

  }
  return v9;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  id v5;
  NSString *v6;
  SEL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  unint64_t waitSecondsForMapViewSetup;
  dispatch_time_t v13;
  BOOL v14;
  _QWORD v16[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  NSLog(CFSTR("test is %@"), v3);
  v5 = objc_msgSend(v3, "rangeOfString:", CFSTR("-"));
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    v5 = objc_msgSend(v3, "length");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", v5));
  v7 = NSSelectorFromString(v6);
  if ((objc_opt_respondsToSelector(self, v7) & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude")));
    if (!v8
      || (v9 = (void *)v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"))),
          v10,
          v9,
          !v10))
    {
      v14 = 0;
      goto LABEL_12;
    }
    v7 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10098A62C;
  v16[3] = &unk_1011AD518;
  v16[4] = self;
  v16[5] = v7;
  v11 = objc_retainBlock(v16);
  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  waitSecondsForMapViewSetup = self->_waitSecondsForMapViewSetup;
  if (waitSecondsForMapViewSetup)
  {
    v13 = dispatch_time(0, 1000000000 * waitSecondsForMapViewSetup);
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
  else
  {
    ((void (*)(_QWORD *))v11[2])(v11);
  }

  v14 = 1;
LABEL_12:

  return v14;
}

- (void)jumpToBayArea
{
  $5B2A0FEE2A1717E36A90D599307F83D1 *p_endPoint;
  double v3;
  double v4;
  double v5;
  id v6;

  p_endPoint = &self->_endPoint;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v6, "_mapstest_jumpToBayArea");
  p_endPoint->latitude = v3;
  p_endPoint->longitude = v4;
  p_endPoint->altitude = v5;

}

- (void)jumpToCupertino
{
  $5B2A0FEE2A1717E36A90D599307F83D1 *p_endPoint;
  double v3;
  double v4;
  double v5;
  id v6;

  p_endPoint = &self->_endPoint;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v6, "_mapstest_jumpToCupertino");
  p_endPoint->latitude = v3;
  p_endPoint->longitude = v4;
  p_endPoint->altitude = v5;

}

- (void)didFinishJumping
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("loadingScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v3, "disableTestStatistics");
  objc_msgSend(v3, "disableTileStatistics");
  v16 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "testStatistics"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:loadingScene:%@"), v9));
        objc_msgSend(v11, "setObject:forKey:", v10, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  objc_msgSend(v16, "resetTestStatistics");
  if (objc_msgSend(v16, "mapType") != 3 && objc_msgSend(v16, "mapType") != 4)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "tileStatistics"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
      objc_msgSend(v14, "addEntriesFromDictionary:", v13);

    }
  }
  objc_msgSend(v16, "resetTileStatistics");
  v15 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10098AA7C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)startTimingFps
{
  void *v3;
  void *v4;
  id v5;

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("timingFPS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  self->_savedDebugDrawContinuously = objc_msgSend(v3, "layoutContinuously");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v4, "setLayoutContinuously:", 1);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v5, "setNeedsDisplay");
  objc_msgSend(v5, "enableTestStatistics");
  objc_msgSend(v5, "enableTileStatistics");
  -[MapsAppTestJump performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "finishedFps", 0, 3.0);

}

- (void)finishedFps
{
  _BOOL8 savedDebugDrawContinuously;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  MapsAppTestCirclePan *v13;
  void *v14;
  void *v15;
  MapsAppTestCirclePan *v16;
  MapsAppTestCirclePan *subTest;
  MapsAppTestCirclePan *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v4, "setLayoutContinuously:", savedDebugDrawContinuously);

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("timingFPS"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v20, "disableTestStatistics");
  objc_msgSend(v20, "disableTileStatistics");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "testStatistics"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:timingFPS:%@"), v9));
        objc_msgSend(v11, "setObject:forKey:", v10, v12);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v6);
  }

  objc_msgSend(v20, "resetTestStatistics");
  objc_msgSend(v20, "resetTileStatistics");
  if (self->_requiresSubTest)
  {
    v13 = [MapsAppTestCirclePan alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest app](self, "app"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testName](self, "testName"));
    v16 = -[MapsAppTestCirclePan initWithApplication:testName:options:](v13, "initWithApplication:testName:options:", v14, v15, 0);
    subTest = self->_subTest;
    self->_subTest = v16;

    -[MapsAppTestCirclePan setEndPoint:](self->_subTest, "setEndPoint:", self->_endPoint.latitude, self->_endPoint.longitude, self->_endPoint.altitude);
    -[MapsAppTestCirclePan setPitch:](self->_subTest, "setPitch:", self->_pitch);
    -[MapsAppTestCirclePan setYaw:](self->_subTest, "setYaw:", self->_yaw);
    -[MapsAppTestCirclePan setAltitudeIsRegionSize:](self->_subTest, "setAltitudeIsRegionSize:", self->_altitudeIsRegionSize);
    objc_initWeak(&location, self);
    v18 = self->_subTest;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10098AEBC;
    v21[3] = &unk_1011AD260;
    objc_copyWeak(&v22, &location);
    -[MapsAppTestCirclePan setTestFinshdCallback:](v18, "setTestFinshdCallback:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
    -[MapsAppTest setResults:](self->_subTest, "setResults:", v19);

    -[MapsAppTestCirclePan runTest](self->_subTest, "runTest");
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MapsAppTest finishedTest](self, "finishedTest");
  }

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

- (unint64_t)waitSecondsForMapViewSetup
{
  return self->_waitSecondsForMapViewSetup;
}

- (void)setWaitSecondsForMapViewSetup:(unint64_t)a3
{
  self->_waitSecondsForMapViewSetup = a3;
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

- (BOOL)savedDebugDrawContinuously
{
  return self->_savedDebugDrawContinuously;
}

- (void)setSavedDebugDrawContinuously:(BOOL)a3
{
  self->_savedDebugDrawContinuously = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTest, 0);
}

@end
