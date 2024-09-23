@implementation MapsAppTestPanZoom

- (MapsAppTestPanZoom)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  int v17;
  MapsPanTestPoint *v18;
  MapsPanTestPoint *v19;
  MapsPanTestPoint *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  objc_super v31;

  v8 = a4;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MapsAppTestPanZoom;
  v10 = -[MapsAppTest initWithApplication:testName:options:](&v31, "initWithApplication:testName:options:", a3, v8, v9);
  if (v10)
  {
    *((_WORD *)v10 + 32) = objc_msgSend(v8, "rangeOfString:", CFSTR("pan")) != 0;
    if (v9)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v12 = objc_msgSend(v11, "containsObject:", CFSTR("isSubTest"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("isSubTest")));
        *((_BYTE *)v10 + 64) = objc_msgSend(v13, "BOOLValue");

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allKeys"));
      v15 = objc_msgSend(v14, "containsObject:", CFSTR("styleZoom"));

      if (v15)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("styleZoom")));
        objc_msgSend(v16, "floatValue");
        *((_DWORD *)v10 + 17) = v17;
        *((_BYTE *)v10 + 65) = 1;

      }
    }
    v18 = objc_alloc_init(MapsPanTestPoint);
    v19 = objc_alloc_init(MapsPanTestPoint);
    objc_msgSend(v9, "_mapstest_startPoint");
    -[MapsPanTestPoint setTestPoint:](v18, "setTestPoint:");
    objc_msgSend(v9, "_mapstest_animationDurationWithDefault:", 1.0);
    -[MapsPanTestPoint setTimeToNextPoint:](v18, "setTimeToNextPoint:");
    objc_msgSend(v9, "_mapstest_endPoint");
    -[MapsPanTestPoint setTestPoint:](v19, "setTestPoint:");
    objc_msgSend(v9, "_mapstest_animationDurationWithDefault:", 1.0);
    -[MapsPanTestPoint setTimeToNextPoint:](v19, "setTimeToNextPoint:");
    if (objc_msgSend(v9, "_mapstest_hasMidPoint"))
    {
      v20 = objc_alloc_init(MapsPanTestPoint);
      objc_msgSend(v9, "_mapstest_midPoint");
      -[MapsPanTestPoint setTestPoint:](v20, "setTestPoint:");
      objc_msgSend(v9, "_mapstest_animationDurationWithDefault:", 1.0);
      -[MapsPanTestPoint setTimeToNextPoint:](v20, "setTimeToNextPoint:");
      v21 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v18, v20, v19, 0);
      v22 = (void *)*((_QWORD *)v10 + 9);
      *((_QWORD *)v10 + 9) = v21;

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "testName"));
      v24 = objc_msgSend(v23, "rangeOfString:", CFSTR("zoom"));

      v25 = objc_alloc((Class)NSArray);
      if (v24)
        v26 = objc_msgSend(v25, "initWithObjects:", v18, v19, 0, v30);
      else
        v26 = objc_msgSend(v25, "initWithObjects:", v18, v19, v18, 0);
      v20 = (MapsPanTestPoint *)*((_QWORD *)v10 + 9);
      *((_QWORD *)v10 + 9) = v26;
    }

    objc_msgSend(v9, "_mapstest_pitch");
    *((_QWORD *)v10 + 10) = v27;
    objc_msgSend(v9, "_mapstest_yaw");
    *((_QWORD *)v10 + 11) = v28;

  }
  return (MapsAppTestPanZoom *)v10;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double MidX;
  double MidY;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id location;
  CGRect v20;
  CGRect v21;

  if (!self->_isSubTest)
    -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_msgSend(v3, "_setLocationPulseEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  -[MapsAppTest switchToMapType:](self, "switchToMapType:", objc_msgSend(v5, "_mapstest_mapType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
  objc_msgSend(v7, "testPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:"));

  -[MapsAppTestPanZoom pitch](self, "pitch");
  v10 = v9;
  -[MapsAppTestPanZoom yaw](self, "yaw");
  objc_msgSend(v4, "setMapRegion:pitch:yaw:", v8, v10, v11);
  if (self->_shouldUseStyleZoom)
  {
    objc_msgSend(v4, "bounds");
    MidX = CGRectGetMidX(v20);
    objc_msgSend(v4, "bounds");
    MidY = CGRectGetMidY(v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraDelegate"));
    objc_msgSend(v14, "mapLayerWillChangeRegionAnimated:", 0);

    objc_msgSend(v4, "zoomToLevel:withFocusPoint:", self->_styleZoom, MidX, MidY);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraDelegate"));
    objc_msgSend(v15, "mapLayerDidChangeRegionAnimated:", 0);

  }
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10044A884;
  v17[3] = &unk_1011AD260;
  objc_copyWeak(&v18, &location);
  -[MapsAppTestPanZoom addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 1;
}

- (void)panToTestPoint:(unsigned int)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
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
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  _QWORD v37[5];
  unsigned int v38;
  _QWORD v39[5];
  unsigned int v40;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    -[MapsAppTestPanZoom panLoadCompleted](self, "panLoadCompleted");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", a3));
    objc_msgSend(v9, "testPoint");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:"));

    if (self->_shouldUseStyleZoom)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", a3));
      objc_msgSend(v36, "testPoint");
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", a3));
      objc_msgSend(v16, "testPoint");
      v18 = VKLocationCoordinate2DMake(v14, v17);
      v20 = v19;
      objc_msgSend(v7, "altitude");
      v22 = v21;
      -[MapsAppTestPanZoom yaw](self, "yaw");
      v24 = v23;
      -[MapsAppTestPanZoom pitch](self, "pitch");
      v26 = v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
      v28 = v10;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndex:", a3 - 1));
      objc_msgSend(v29, "timeToNextPoint");
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10044AB98;
      v39[3] = &unk_1011B71C8;
      v39[4] = self;
      v40 = a3;
      objc_msgSend(v11, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", 0, v39, v18, v20, v22, v24, v26, v30);

      v10 = v28;
    }
    else
    {
      -[MapsAppTestPanZoom pitch](self, "pitch");
      v32 = v31;
      -[MapsAppTestPanZoom yaw](self, "yaw");
      v34 = v33;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTestPanZoom testPoints](self, "testPoints"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", a3 - 1));
      objc_msgSend(v12, "timeToNextPoint");
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10044AC10;
      v37[3] = &unk_1011B71C8;
      v37[4] = self;
      v38 = a3;
      objc_msgSend(v7, "setMapRegion:pitch:yaw:duration:completion:", v10, v37, v32, v34, v35);
    }

  }
}

- (void)panLoadFinished
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10044ACFC;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)panLoadCompleted
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
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v3, "disableTestStatistics");
  objc_msgSend(v3, "disableTileStatistics");
  v15 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "testStatistics"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v9));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sub:pan/zoom:%@"), v9));
        objc_msgSend(v11, "setObject:forKey:", v10, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tileStatistics"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest results](self, "results"));
    objc_msgSend(v14, "addEntriesFromDictionary:", v13);

  }
  objc_msgSend(v15, "resetTestStatistics");
  objc_msgSend(v15, "resetTileStatistics");
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
  block[2] = sub_10044AFEC;
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

- (NSArray)testPoints
{
  return self->_testPoints;
}

- (void)setTestPoints:(id)a3
{
  objc_storeStrong((id *)&self->_testPoints, a3);
}

- (float)styleZoom
{
  return self->_styleZoom;
}

- (void)setStyleZoom:(float)a3
{
  self->_styleZoom = a3;
}

- (BOOL)shouldUseStyleZoom
{
  return self->_shouldUseStyleZoom;
}

- (void)setShouldUseStyleZoom:(BOOL)a3
{
  self->_shouldUseStyleZoom = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testPoints, 0);
}

@end
