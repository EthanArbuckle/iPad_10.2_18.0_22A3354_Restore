@implementation MapsAppTestStaticFrame

- (MapsAppTestStaticFrame)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestStaticFrame *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  double v22;
  void *v23;
  objc_super v25;

  v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MapsAppTestStaticFrame;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v25, "initWithApplication:testName:options:", a3, a4, v8);
  if (v9)
  {
    objc_msgSend(v8, "_mapstest_pitch");
    v9->_pitch = v10;
    objc_msgSend(v8, "_mapstest_yaw");
    v9->_yaw = v11;
    objc_msgSend(v8, "_mapstest_jumpPoint");
    v9->_location.latitude = v12;
    v9->_location.longitude = v13;
    v9->_location.altitude = v14;
    v9->_altitudeIsRegionSize = 1;
    v9->_requiresViewSetup = 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("renderingDuration")));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("renderingDuration")));
      v9->_renderingDuration = objc_msgSend(v18, "intValue");

    }
    else
    {
      v9->_renderingDuration = 10;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
    v20 = objc_msgSend(v19, "_mapstest_hasAltitude");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
      objc_msgSend(v21, "_mapstest_altitude");
      v9->_location.altitude = v22;

      v9->_altitudeIsRegionSize = 0;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](v9, "options"));
    v9->_waitSecondsForMapViewSetup = (int)objc_msgSend(v23, "_mapstest_waitSecondsForMapViewSetup");

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
      goto LABEL_14;
    }
    v7 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100275494;
  v16[3] = &unk_1011AD518;
  v16[4] = self;
  v16[5] = v7;
  v11 = objc_retainBlock(v16);
  if (self->_requiresViewSetup)
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
LABEL_14:

  return v14;
}

- (void)didFinishJumping
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v3, "disableTestStatistics");
  objc_msgSend(v3, "disableTileStatistics");
  objc_msgSend(v3, "resetTestStatistics");
  objc_msgSend(v3, "resetTileStatistics");
  v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002756D4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)startRendering
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v3, "setNeedsDisplay");
  objc_msgSend(v3, "enableTestStatistics");
  objc_msgSend(v3, "enableTileStatistics");
  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("staticFrame"));
  -[MapsAppTestStaticFrame performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "finishedRendering", 0, (double)self->_renderingDuration);

}

- (void)finishedRendering
{
  _BOOL8 savedDebugDrawContinuously;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("staticFrame"));
  savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v4, "setLayoutContinuously:", savedDebugDrawContinuously);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v5, "disableTestStatistics");
  objc_msgSend(v5, "disableTileStatistics");
  v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "testStatistics"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:staticFrame:%@"), v11));
        objc_msgSend(v13, "setObject:forKey:", v12, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  objc_msgSend(v15, "resetTestStatistics");
  objc_msgSend(v15, "resetTileStatistics");
  -[MapsAppTest finishedTest](self, "finishedTest");

}

- ($1AB5FA073B851C12C2339EC22442E995)location
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_location.latitude;
  longitude = self->_location.longitude;
  altitude = self->_location.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLocation:(id)a3
{
  self->_location = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
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

@end
