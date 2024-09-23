@implementation MapsAppTestStepZoom

- (MapsAppTestStepZoom)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8;
  MapsAppTestStepZoom *v9;
  MapsAppTestStepZoom *v10;
  $AB5116BA7E623E054F959CECB034F4E7 *p_focusPoint;
  objc_class *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  objc_super v19;

  v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MapsAppTestStepZoom;
  v9 = -[MapsAppTest initWithApplication:testName:options:](&v19, "initWithApplication:testName:options:", a3, a4, v8);
  v10 = v9;
  if (v9)
  {
    p_focusPoint = &v9->_focusPoint;
    objc_msgSend(v8, "_mapstest_VKLocationCoordinate2D");
    *(_QWORD *)&p_focusPoint->latitude = v12;
    v10->_focusPoint.longitude = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zoomStart")));
    v10->_zoomStart = (int64_t)objc_msgSend(v14, "integerValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zoomEnd")));
    v10->_zoomEnd = (int64_t)objc_msgSend(v15, "integerValue");

    objc_msgSend(v8, "_mapstest_animationDurationWithDefault:", 0.0);
    v10->_stepAnimationDuration = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("clearCachesOnZoom")));
    v10->_clearCacheOnZoom = objc_msgSend(v17, "BOOLValue");

  }
  return v10;
}

- (double)_regionSizeForZoom:(double)a3
{
  return 1.0 / exp2(a3 + -9.0);
}

- (int64_t)_zoomAmount
{
  if (self->_zoomStart < self->_zoomEnd)
    return 1;
  else
    return -1;
}

- (BOOL)runTest
{
  void *v3;
  void *v4;
  void *v5;
  double latitude;
  double longitude;
  id v8;
  double v9;
  id v10;
  void *v11;
  double zoomStart;
  _QWORD v14[4];
  id v15[2];
  id location;

  -[MapsAppTest setupForVKTest](self, "setupForVKTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_msgSend(v3, "_setLocationPulseEnabled:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  -[MapsAppTest switchToMapType:](self, "switchToMapType:", objc_msgSend(v5, "_mapstest_mapType"));
  latitude = self->_focusPoint.latitude;
  longitude = self->_focusPoint.longitude;
  v8 = -[MapsAppTestStepZoom _regionSizeForZoom:](self, "_regionSizeForZoom:", (double)self->_zoomStart);
  v10 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", VKLocationCoordinate3DMake(v8, latitude, longitude, v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v4, "setMapRegion:pitch:yaw:", v11, 0.0, 0.0);
  objc_initWeak(&location, self);
  zoomStart = (double)self->_zoomStart;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009B581C;
  v14[3] = &unk_1011B72B0;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&zoomStart;
  -[MapsAppTestStepZoom addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v14);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);

  return 1;
}

- (void)runStepZoomTest:(double)a3
{
  void *v5;
  dispatch_time_t v6;
  _QWORD v7[6];

  if ((double)self->_zoomEnd == a3)
  {
    -[MapsAppTest finishedTest](self, "finishedTest");
  }
  else
  {
    if (-[MapsAppTestStepZoom clearCacheOnZoom](self, "clearCacheOnZoom"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOTileLoader modernLoader](GEOTileLoader, "modernLoader"));
      objc_msgSend(v5, "shrinkDiskCacheToSize:callbackQ:finished:", 0, &_dispatch_main_q, &stru_1011DDC80);

    }
    v6 = dispatch_time(0, 500000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1009B59D0;
    v7[3] = &unk_1011AD518;
    *(double *)&v7[5] = a3;
    v7[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)stepLoadCompleted:(id)a3
{
  id v4;
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  objc_msgSend(v5, "disableTileStatistics");
  v15 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tileStatistics"));
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
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:%@"), v4, v11));
        objc_msgSend(v13, "setObject:forKey:", v12, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }
  objc_msgSend(v15, "resetTileStatistics");
  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", v4);

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
  block[2] = sub_1009B5EEC;
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

- ($F24F406B2B787EFB06265DBA3D28CBD5)focusPoint
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_focusPoint.latitude;
  longitude = self->_focusPoint.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setFocusPoint:(id)a3
{
  self->_focusPoint = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)zoomStart
{
  return self->_zoomStart;
}

- (void)setZoomStart:(int64_t)a3
{
  self->_zoomStart = a3;
}

- (int64_t)zoomEnd
{
  return self->_zoomEnd;
}

- (void)setZoomEnd:(int64_t)a3
{
  self->_zoomEnd = a3;
}

- (double)stepAnimationDuration
{
  return self->_stepAnimationDuration;
}

- (void)setStepAnimationDuration:(double)a3
{
  self->_stepAnimationDuration = a3;
}

- (BOOL)clearCacheOnZoom
{
  return self->_clearCacheOnZoom;
}

- (void)setClearCacheOnZoom:(BOOL)a3
{
  self->_clearCacheOnZoom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCirclePan, 0);
}

@end
