@implementation MapsAppTestRPT

- (MapsAppTestRPT)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  MapsAppTestRPT *v10;
  MapsAppTestRPT *v11;
  $5B2A0FEE2A1717E36A90D599307F83D1 *p_startPoint;
  objc_class *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  NSArray *testActions;
  double v20;
  objc_super v22;

  v8 = a4;
  v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MapsAppTestRPT;
  v10 = -[MapsAppTest initWithApplication:testName:options:](&v22, "initWithApplication:testName:options:", a3, v8, v9);
  v11 = v10;
  if (v10)
  {
    p_startPoint = &v10->_startPoint;
    objc_msgSend(v9, "_mapstest_startPoint");
    *(_QWORD *)&p_startPoint->latitude = v13;
    v11->_startPoint.longitude = v14;
    v11->_startPoint.altitude = v15;
    objc_msgSend(v9, "_mapstest_pitch");
    v11->_pitch = v16;
    objc_msgSend(v9, "_mapstest_yaw");
    v11->_yaw = v17;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_mapstest_rptTestActions"));
    testActions = v11->_testActions;
    v11->_testActions = (NSArray *)v18;

    objc_msgSend(v9, "_mapstest_animationDurationWithDefault:", 2.0);
    v11->_actionDuration = v20;
    v11->_isLookAroundTest = objc_msgSend(v8, "rangeOfString:", CFSTR("LookAround")) == (id)3;
  }

  return v11;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  if (!-[MapsAppTest isRunningOnCarPlay](self, "isRunningOnCarPlay"))
    -[MapsAppTest switchToMapType:](self, "switchToMapType:", objc_msgSend(v3, "_mapstest_mapType"));
  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_msgSend(v4, "_setLocationPulseEnabled:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v5, "setDisableTransitLines:", 0);
  -[MapsAppTestRPT startPoint](self, "startPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:"));
  -[MapsAppTestRPT pitch](self, "pitch");
  v8 = v7;
  -[MapsAppTestRPT yaw](self, "yaw");
  objc_msgSend(v5, "setMapRegion:pitch:yaw:", v6, v8, v9);
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100522734;
  v11[3] = &unk_1011AD260;
  objc_copyWeak(&v12, &location);
  -[MapsAppTestRPT addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return 1;
}

- (void)initialLoadComplete
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005227D4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)rptTestCompleted
{
  void *v3;
  _BOOL8 savedDebugDrawContinuously;
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
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  if (self->_isLookAroundTest)
  {
    savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
    objc_msgSend(v5, "setLayoutContinuously:", savedDebugDrawContinuously);

  }
  objc_msgSend(v3, "disableTestStatistics");
  objc_msgSend(v3, "disableTileStatistics");
  v17 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "testStatistics"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:rpt:%@"), v11));
        objc_msgSend(v13, "setObject:forKey:", v12, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tileStatistics"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
    objc_msgSend(v16, "addEntriesFromDictionary:", v15);

  }
  objc_msgSend(v17, "resetTestStatistics");
  objc_msgSend(v17, "resetTileStatistics");
  -[MapsAppTest finishedTest](self, "finishedTest");

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
  block[2] = sub_100522CC8;
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

- (void)onLookAroundView:(id)a3 didBecomeAdequatelyDrawnCallback:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if ((objc_msgSend(v5, "adequatelyDrawn") & 1) != 0)
  {
    v7 = sub_100431B9C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = (objc_class *)objc_opt_class(v5);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412546;
      v16 = v11;
      v17 = 2048;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "<%@:%p> is already adequately drawn", buf, 0x16u);

    }
    if (v6)
      v6[2](v6);
  }
  else
  {
    v12 = MKLookAroundViewDidBecomeAdequatelyDrawnNotification;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100523028;
    v13[3] = &unk_1011B5B38;
    v14 = v6;
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v12, v5, v13);

  }
}

- (void)onLookAroundView:(id)a3 didCompletionPostTransitionAnimation:(id)a4
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  v5 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100523134;
  block[3] = &unk_1011ADA00;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)expandLookAroundToFullscreen:(BOOL)a3 withLookAroundView:(id)a4 mapItem:(id)a5 completionBlock:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100523268;
  v15[3] = &unk_1011B5C00;
  v15[4] = self;
  v16 = a4;
  v17 = a6;
  v10 = v17;
  v11 = v16;
  v12 = a5;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("PPTLookAroundContainerViewControllerDidTransitionToFullscreen"), 0, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v14, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v13, v11, v8);

}

- (void)enterLookAroundForTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  self->_savedDebugDrawContinuously = objc_msgSend(v5, "layoutContinuously");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VKDebugSettings sharedSettings](VKDebugSettings, "sharedSettings"));
  objc_msgSend(v6, "setLayoutContinuously:", 1);

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("lookAroundEnter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  v8 = objc_alloc((Class)MKPlacemark);
  objc_msgSend(v7, "centerCoordinate");
  v9 = objc_msgSend(v8, "initWithCoordinate:");
  v10 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithPlacemark:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKLookAroundEntryPoint entryPointWithMapItem:](MKLookAroundEntryPoint, "entryPointWithMapItem:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v12, "pptTestEnterLookAroundWithEntryPoint:lookAroundView:showsFullScreen:", v11, 0, 0);

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005234F0;
  v15[3] = &unk_1011B5C00;
  v15[4] = self;
  v16 = v10;
  v17 = v4;
  v13 = v4;
  v14 = v10;
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", CFSTR("LookAroundTrayContaineeViewControllerDidAppear"), 0, v15);

}

- ($1AB5FA073B851C12C2339EC22442E995)startPoint
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_startPoint.latitude;
  longitude = self->_startPoint.longitude;
  altitude = self->_startPoint.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setStartPoint:(id)a3
{
  self->_startPoint = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
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

- (NSArray)testActions
{
  return self->_testActions;
}

- (double)actionDuration
{
  return self->_actionDuration;
}

- (void)setActionDuration:(double)a3
{
  self->_actionDuration = a3;
}

- (BOOL)savedDebugDrawContinuously
{
  return self->_savedDebugDrawContinuously;
}

- (void)setSavedDebugDrawContinuously:(BOOL)a3
{
  self->_savedDebugDrawContinuously = a3;
}

- (BOOL)isLookAroundTest
{
  return self->_isLookAroundTest;
}

- (void)setIsLookAroundTest:(BOOL)a3
{
  self->_isLookAroundTest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testActions, 0);
}

@end
