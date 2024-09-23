@implementation MapsAppTestTapPOI

- (MapsAppTestTapPOI)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  MapsAppTestTapPOI *v11;
  MapsAppTestTapPOI *v12;
  uint64_t v13;
  NSString *poiLabel;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  GEOMapRegion *region;
  double v23;
  double v24;
  double v25;
  objc_super v27;

  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MapsAppTestTapPOI;
  v11 = -[MapsAppTest initWithApplication:testName:options:](&v27, "initWithApplication:testName:options:", a3, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_testName, a4);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("poi_label")));
    poiLabel = v12->_poiLabel;
    v12->_poiLabel = (NSString *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("waitForWebModule")));
    v12->_waitForWebModule = objc_msgSend(v15, "BOOLValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shouldTestPlaceEnrichment")));
    v12->_shouldTestPlaceEnrichment = objc_msgSend(v16, "BOOLValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shouldScrollPlacecard")));
    v12->_shouldScrollPlacecard = objc_msgSend(v17, "BOOLValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("shouldSkipPanningMap")));
    v12->_shouldSkipPanningMap = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v10, "_mapstest_pitch");
    v12->_pitch = v19;
    objc_msgSend(v10, "_mapstest_yaw");
    v12->_yaw = v20;
    if (objc_msgSend(v10, "_mapstest_hasMapRegion"))
    {
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_mapstest_mapRegion"));
      region = v12->_region;
      v12->_region = (GEOMapRegion *)v21;

    }
    else
    {
      objc_msgSend(v10, "_mapstest_jumpPoint");
      v12->_vkJumpPointCoordinate.latitude = v23;
      v12->_vkJumpPointCoordinate.longitude = v24;
      v12->_vkJumpPointCoordinate.altitude = v25;
    }
  }

  return v12;
}

- (BOOL)runTest
{
  void *v3;
  id v4;
  GEOMapRegion *region;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  -[MapsAppTest startedTest](self, "startedTest");
  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("loadingScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest options](self, "options"));
  v4 = objc_msgSend(v3, "_mapstest_mapType");

  -[MapsAppTest switchToMapType:](self, "switchToMapType:", v4);
  region = self->_region;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v7 = v6;
  if (region)
    objc_msgSend(v6, "setMapRegion:pitch:yaw:", self->_region, 0.0, 0.0);
  else
    objc_msgSend(v6, "_mapstest_jumpToCoords:pitch:yaw:altitudeIsRegionSize:", 1, self->_vkJumpPointCoordinate.latitude, self->_vkJumpPointCoordinate.longitude, self->_vkJumpPointCoordinate.altitude, self->_pitch, self->_yaw);

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008D905C;
  v9[3] = &unk_1011AD260;
  objc_copyWeak(&v10, &location);
  -[MapsAppTest addFullyDrawnCallback:](self, "addFullyDrawnCallback:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return 1;
}

- (void)didFinishJumping
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("loadingScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008D9150;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setLabelsDidLayoutCallback:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

- (void)tapPOI
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSString *poiLabel;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id location;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
  objc_msgSend(v3, "_setLabelsDidLayoutCallback:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainVKMapView](self, "mainVKMapView"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "labelMarkers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
      v10 = objc_msgSend(v9, "isEqual:", self->_poiLabel);

      if ((v10 & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v11 = v8;

    if (!v11)
      goto LABEL_13;
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("tapPOI"));
    objc_initWeak(&location, self);
    if (self->_shouldTestPlaceEnrichment)
    {
      -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("fetchPlaceEnrichment"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1008D9550;
      v20[3] = &unk_1011B9578;
      v20[4] = self;
      objc_copyWeak(&v21, &location);
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MKPlaceViewControllerDidShowNotification, 0, v20);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1008D95B4;
      v19[3] = &unk_1011AD1C0;
      v19[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MUPlaceEnrichmentSectionControllerDidFetchEnrichmentNotification, 0, v19);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1008D95EC;
      v18[3] = &unk_1011AD1C0;
      v18[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MUPlaceEnrichmentSectionControllerDidFinishLoadingNotification, 0, v18);
      objc_destroyWeak(&v21);
    }
    else
    {
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1008D95FC;
      v16[3] = &unk_1011AD288;
      objc_copyWeak(&v17, &location);
      +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", MKPlaceViewControllerDidShowNotification, 0, v16);
      objc_destroyWeak(&v17);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest mainMKMapView](self, "mainMKMapView"));
    objc_msgSend(v14, "_selectLabelMarker:animated:", v11, 1);

    objc_destroyWeak(&location);
  }
  else
  {
LABEL_9:

LABEL_13:
    poiLabel = self->_poiLabel;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapRegion"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Could not find POI named \"%@\" in map region: %@"), poiLabel, v11));
    -[MapsAppTest failedTestWithReason:](self, "failedTestWithReason:", v13);

  }
}

- (void)didShowPlaceCard
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("tapPOI"));
  if (-[MapsAppTestTapPOI waitForWebModule](self, "waitForWebModule"))
  {
    -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("loadWebModule"));
    objc_initWeak(&location, self);
    v3 = MUWebContentViewControllerDidFinishLoadingNotification;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1008D9734;
    v4[3] = &unk_1011AD288;
    objc_copyWeak(&v5, &location);
    +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v3, 0, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    -[MapsAppTest finishedTest](self, "finishedTest");
  }
}

- (void)didShowWebModule
{
  id WeakRetained;
  dispatch_time_t v4;
  _QWORD block[5];

  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("loadWebModule"));
  if (-[MapsAppTestTapPOI shouldTestPlaceEnrichment](self, "shouldTestPlaceEnrichment")
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewController), WeakRetained,
                                                                                 WeakRetained))
  {
    v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008D981C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    -[MapsAppTest finishedTest](self, "finishedTest");
  }
}

- (void)scrollPlacecardTest
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  id location;
  id v25;

  -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("scrollingPlacecard"));
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "view"));
  v5 = objc_opt_class(UIScrollView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "subviews"));
  v7 = objc_msgSend(v6, "mutableCopy");

  if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
      if ((objc_opt_isKindOfClass(v9, v5) & 1) != 0)
        break;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews"));
      v11 = objc_msgSend(v10, "count") == 0;

      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews"));
        objc_msgSend(v7, "addObjectsFromArray:", v12);

      }
      if (++v8 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v9 = 0;
  }

  v13 = RPTContentSizeInDirection(v9, 1);
  v14 = RPTGetBoundsForView(v9);
  v18 = objc_msgSend(objc_alloc((Class)RPTScrollViewTestParameters), "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", CFSTR("scrollingPlacecard"), 1, &stru_1011DB318, v14, v15, v16, v17, v13);
  v25 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1008D9BC4;
  v21[3] = &unk_1011AD1E8;
  objc_copyWeak(&v23, &location);
  v22 = CFSTR("scrollingPlacecard");
  v20 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", CFSTR("scrollingPlacecard"), v19, v21);

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_storeStrong((id *)&self->_testName, a3);
}

- (NSString)poiLabel
{
  return self->_poiLabel;
}

- (void)setPoiLabel:(id)a3
{
  objc_storeStrong((id *)&self->_poiLabel, a3);
}

- (BOOL)waitForWebModule
{
  return self->_waitForWebModule;
}

- (void)setWaitForWebModule:(BOOL)a3
{
  self->_waitForWebModule = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- ($1AB5FA073B851C12C2339EC22442E995)vkJumpPointCoordinate
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_vkJumpPointCoordinate.latitude;
  longitude = self->_vkJumpPointCoordinate.longitude;
  altitude = self->_vkJumpPointCoordinate.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setVkJumpPointCoordinate:(id)a3
{
  self->_vkJumpPointCoordinate = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
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

- (BOOL)shouldTestPlaceEnrichment
{
  return self->_shouldTestPlaceEnrichment;
}

- (void)setShouldTestPlaceEnrichment:(BOOL)a3
{
  self->_shouldTestPlaceEnrichment = a3;
}

- (BOOL)shouldScrollPlacecard
{
  return self->_shouldScrollPlacecard;
}

- (void)setShouldScrollPlacecard:(BOOL)a3
{
  self->_shouldScrollPlacecard = a3;
}

- (BOOL)shouldSkipPanningMap
{
  return self->_shouldSkipPanningMap;
}

- (void)setShouldSkipPanningMap:(BOOL)a3
{
  self->_shouldSkipPanningMap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_poiLabel, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_destroyWeak((id *)&self->_placeViewController);
}

@end
