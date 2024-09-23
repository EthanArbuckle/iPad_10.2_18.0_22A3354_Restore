@implementation NavigationDebugAnnotationsProvider

- (NavigationDebugAnnotationsProvider)initWithMapView:(id)a3
{
  id v5;
  NavigationDebugAnnotationsProvider *v6;
  NavigationDebugAnnotationsProvider *v7;
  NSMutableArray *v8;
  NSMutableArray *userLocationHistory;
  NSMutableArray *v10;
  NSMutableArray *rawUserLocationHistory;
  NSMutableArray *v12;
  NSMutableArray *matchedUserLocationHistory;
  void ***v14;
  uint64_t v15;
  NSMutableArray *arrivalRegionChangedListeners;
  NSMutableArray *v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  void *v29;
  NSMutableArray *v30;
  uint64_t v31;
  void *v32;
  NSMutableArray *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  void *v38;
  NSMutableArray *v39;
  uint64_t v40;
  void *v41;
  NSMutableArray *v42;
  uint64_t v43;
  void *v44;
  void **v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  id v50;
  id location;
  objc_super v52;

  v5 = a3;
  v52.receiver = self;
  v52.super_class = (Class)NavigationDebugAnnotationsProvider;
  v6 = -[NavigationDebugAnnotationsProvider init](&v52, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mapView, a3);
    v8 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
    userLocationHistory = v7->_userLocationHistory;
    v7->_userLocationHistory = v8;

    v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
    rawUserLocationHistory = v7->_rawUserLocationHistory;
    v7->_rawUserLocationHistory = v10;

    v12 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
    matchedUserLocationHistory = v7->_matchedUserLocationHistory;
    v7->_matchedUserLocationHistory = v12;

    objc_initWeak(&location, v7);
    v46 = _NSConcreteStackBlock;
    v47 = 3221225472;
    v48 = sub_1009C07F8;
    v49 = &unk_1011B98E0;
    objc_copyWeak(&v50, &location);
    v14 = objc_retainBlock(&v46);
    v15 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v46, v47, v48, v49));
    arrivalRegionChangedListeners = v7->_arrivalRegionChangedListeners;
    v7->_arrivalRegionChangedListeners = (NSMutableArray *)v15;

    v17 = v7->_arrivalRegionChangedListeners;
    v18 = &_dispatch_main_q;
    v19 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_EndOfRoute, off_1014B3938, &_dispatch_main_q, v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[NSMutableArray addObject:](v17, "addObject:", v20);

    v21 = v7->_arrivalRegionChangedListeners;
    v22 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_ArrivalPoints, off_1014B3948, &_dispatch_main_q, v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableArray addObject:](v21, "addObject:", v23);

    v24 = v7->_arrivalRegionChangedListeners;
    v25 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_ISSUE_ARRIVAL, off_1014B3958, &_dispatch_main_q, v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    -[NSMutableArray addObject:](v24, "addObject:", v26);

    v27 = v7->_arrivalRegionChangedListeners;
    v28 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_ISSUE_ARRIVAL_OFF_ROUTE, off_1014B3968, &_dispatch_main_q, v14);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[NSMutableArray addObject:](v27, "addObject:", v29);

    v30 = v7->_arrivalRegionChangedListeners;
    v31 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_END_NAVIGATION_TIMEOUT, off_1014B3978, &_dispatch_main_q, v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[NSMutableArray addObject:](v30, "addObject:", v32);

    v33 = v7->_arrivalRegionChangedListeners;
    v34 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_PRE_ARRIVAL_MODE, off_1014B3988, &_dispatch_main_q, v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    -[NSMutableArray addObject:](v33, "addObject:", v35);

    v36 = v7->_arrivalRegionChangedListeners;
    v37 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_PARKING_SUGGEST_WALKING, off_1014B3998, &_dispatch_main_q, v14);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    -[NSMutableArray addObject:](v36, "addObject:", v38);

    v39 = v7->_arrivalRegionChangedListeners;
    v40 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_INITIATE_APPROACHING, off_1014B39A8, &_dispatch_main_q, v14);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    -[NSMutableArray addObject:](v39, "addObject:", v41);

    v42 = v7->_arrivalRegionChangedListeners;
    v43 = _GEOConfigAddBlockListenerForKey(MapsConfig_Navigation_VisualizeArrivalRegion_PREPARE_TO_PARK, off_1014B39B8, &_dispatch_main_q, v14);
    v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
    -[NSMutableArray addObject:](v42, "addObject:", v44);

    objc_destroyWeak(&v50);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSMutableArray *arrivalRegionChangedListeners;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_arrivalRegionChangedListeners;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        GEOConfigRemoveBlockListener(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), v5);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  arrivalRegionChangedListeners = self->_arrivalRegionChangedListeners;
  self->_arrivalRegionChangedListeners = 0;

  v10.receiver = self;
  v10.super_class = (Class)NavigationDebugAnnotationsProvider;
  -[NavigationDebugAnnotationsProvider dealloc](&v10, "dealloc");
}

- (void)updateWithLocation:(id)a3
{
  -[NavigationDebugAnnotationsProvider _addDebugLocationAnnotationMatchedLocation:](self, "_addDebugLocationAnnotationMatchedLocation:", a3);
}

- (void)updateWithRoute:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_route, a3);
  v5 = a3;
  -[NavigationDebugAnnotationsProvider _updateArrivalOverlaysWithRoute:](self, "_updateArrivalOverlaysWithRoute:", v5);
  -[NavigationDebugAnnotationsProvider _updateStepAndManeuverOverlaysWithRoute:](self, "_updateStepAndManeuverOverlaysWithRoute:", v5);

}

- (void)clearAllAnnotationsAndOverlays
{
  MKMapView *mapView;
  void *v4;
  void *v5;
  NSMapTable *renderersForOverlays;

  -[NavigationDebugAnnotationsProvider _clearAllDebugAnnotations](self, "_clearAllDebugAnnotations");
  -[NavigationDebugAnnotationsProvider _clearStepAndManeuverOverlays](self, "_clearStepAndManeuverOverlays");
  mapView = self->_mapView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_renderersForOverlays, "keyEnumerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  -[MKMapView removeOverlays:](mapView, "removeOverlays:", v5);

  renderersForOverlays = self->_renderersForOverlays;
  self->_renderersForOverlays = 0;

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  MKMapView *v6;
  id v7;
  DistanceCircleAnnotationView *v8;
  uint64_t v9;
  id v10;
  double v11;
  uint64_t v12;
  id v13;
  DistanceCircleAnnotationView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  v6 = (MKMapView *)a3;
  v7 = a4;
  if (self->_mapView != v6)
    goto LABEL_2;
  v9 = objc_opt_class(CircleAnnotation);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    v10 = v7;
    objc_msgSend(v10, "radius");
    if (v11 <= 0.0)
    {
      v8 = (DistanceCircleAnnotationView *)objc_claimAutoreleasedReturnValue(-[MKMapView dequeueReusableAnnotationViewWithIdentifier:](v6, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("NavCircle")));
      if (!v8)
        v8 = -[CircleAnnotationView initWithAnnotation:reuseIdentifier:]([CircleAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v10, CFSTR("NavCircle"));
    }
    else
    {
      v8 = (DistanceCircleAnnotationView *)objc_claimAutoreleasedReturnValue(-[MKMapView dequeueReusableAnnotationViewWithIdentifier:](v6, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("NavDistanceCircle")));
      if (!v8)
        v8 = -[CircleAnnotationView initWithAnnotation:reuseIdentifier:]([DistanceCircleAnnotationView alloc], "initWithAnnotation:reuseIdentifier:", v10, CFSTR("NavDistanceCircle"));
      objc_msgSend(v10, "radius");
      -[DistanceCircleAnnotationView setDistanceRadius:](v8, "setDistanceRadius:");
    }
    objc_msgSend(v10, "red");
    v16 = v15;
    objc_msgSend(v10, "green");
    v18 = v17;
    objc_msgSend(v10, "blue");
    v20 = v19;
    objc_msgSend(v10, "alpha");
    -[CircleAnnotationView setColorRed:green:blue:alpha:](v8, "setColorRed:green:blue:alpha:", v16, v18, v20, v21);
    goto LABEL_14;
  }
  v12 = objc_opt_class(DebugLocationAnnotation);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
  {
    v13 = v7;
    v14 = (DistanceCircleAnnotationView *)objc_claimAutoreleasedReturnValue(-[MKMapView dequeueReusableAnnotationViewWithIdentifier:](v6, "dequeueReusableAnnotationViewWithIdentifier:", CFSTR("NavDebugLocation")));
    if (v14)
    {
      v8 = v14;
      -[DistanceCircleAnnotationView setDebugLocationAnnotation:](v14, "setDebugLocationAnnotation:", v13);
    }
    else
    {
      v8 = -[DebugLocationAnnotationView initWithAnnotation:debugLocationAnnotation:reuseIdentifier:]([DebugLocationAnnotationView alloc], "initWithAnnotation:debugLocationAnnotation:reuseIdentifier:", v13, v13, CFSTR("NavDebugLocation"));
    }
LABEL_14:

    goto LABEL_15;
  }
LABEL_2:
  v8 = 0;
LABEL_15:

  return v8;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  if (self->_mapView == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_renderersForOverlays, "objectForKey:", v6));
    if (!v8)
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_stepAndManeuverOverlays, "objectForKey:", v6));
    v7 = v8;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_addDebugLocationAnnotationMatchedLocation:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  GEOLocationShifter *v7;
  GEOLocationShifter *locationShifter;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  DebugLocationAnnotation *v14;
  void *v15;
  unsigned int v16;
  DebugLocationAnnotation *v17;
  void *v18;
  NSMutableArray *rawUserLocationHistory;
  NSMutableArray *v20;
  NSMutableArray *v21;
  NSMutableArray *userLocationHistory;
  NSMutableArray *v23;
  NSMutableArray *v24;
  void *v25;
  unsigned int v26;
  DebugLocationAnnotation *v27;
  NSMutableArray *matchedUserLocationHistory;
  NSMutableArray *v29;
  NSMutableArray *v30;
  _OWORD v31[8];
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[4];
  __int128 v40;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("NavigationShowRawGPSTrail"));

  if (v6)
  {
    if (!self->_locationShifter)
    {
      v7 = (GEOLocationShifter *)objc_alloc_init((Class)GEOLocationShifter);
      locationShifter = self->_locationShifter;
      self->_locationShifter = v7;

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawLocation"));
    objc_msgSend(v4, "rawCoordinate");
    if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
    {
      v10 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rawCoordinate"));
      v40 = 0uLL;
      if (-[GEOLocationShifter shiftLatLng:accuracy:shiftedCoordinate:shiftedAccuracy:](self->_locationShifter, "shiftLatLng:accuracy:shiftedCoordinate:shiftedAccuracy:", v11, &v40, 0, 0.0))
      {
        v38 = 0u;
        memset(v39, 0, 60);
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v33 = 0u;
        if (v9)
          objc_msgSend(v9, "clientLocation");
        *(_OWORD *)((char *)v39 + 4) = v40;
        v12 = objc_alloc((Class)CLLocation);
        v31[6] = v39[0];
        v31[7] = v39[1];
        v32[0] = v39[2];
        *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)((char *)&v39[2] + 12);
        v31[2] = v35;
        v31[3] = v36;
        v31[4] = v37;
        v31[5] = v38;
        v31[0] = v33;
        v31[1] = v34;
        v13 = objc_msgSend(v12, "initWithClientLocation:", v31);

      }
      else
      {

        v13 = 0;
      }

      v9 = v13;
    }
    if (v9)
    {
      v14 = objc_alloc_init(DebugLocationAnnotation);
      -[DebugLocationAnnotation setLocation:](v14, "setLocation:", v9);
      -[DebugLocationAnnotation setLocationType:](v14, "setLocationType:", objc_msgSend(v4, "isProjected"));
      -[DebugLocationAnnotation setNavType:](v14, "setNavType:", self->_userLocationMarkerMode);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawLocation"));
      v16 = objc_msgSend(v15, "_navigation_hasMatch");

      if (v16)
      {
        v17 = objc_alloc_init(DebugLocationAnnotation);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rawLocation"));
        -[DebugLocationAnnotation setLocation:](v17, "setLocation:", v18);

        -[DebugLocationAnnotation setLocationType:](v17, "setLocationType:", 3);
        -[DebugLocationAnnotation setNavType:](v17, "setNavType:", self->_userLocationMarkerMode);
      }
      else
      {
        v17 = 0;
      }
      rawUserLocationHistory = self->_rawUserLocationHistory;
      if (!rawUserLocationHistory)
      {
        v20 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
        v21 = self->_rawUserLocationHistory;
        self->_rawUserLocationHistory = v20;

        rawUserLocationHistory = self->_rawUserLocationHistory;
      }
      -[NavigationDebugAnnotationsProvider _addLocationAnnotation:history:](self, "_addLocationAnnotation:history:", v14, rawUserLocationHistory);
      userLocationHistory = self->_userLocationHistory;
      if (!userLocationHistory)
      {
        v23 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
        v24 = self->_userLocationHistory;
        self->_userLocationHistory = v23;

        userLocationHistory = self->_userLocationHistory;
      }
      -[NavigationDebugAnnotationsProvider _addLocationAnnotation:history:](self, "_addLocationAnnotation:history:", v17, userLocationHistory);

    }
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v26 = objc_msgSend(v25, "BOOLForKey:", CFSTR("NavigationShowMatchedLocationTrail"));

  if (v26)
  {
    v27 = objc_alloc_init(DebugLocationAnnotation);
    -[DebugLocationAnnotation setLocation:](v27, "setLocation:", v4);
    -[DebugLocationAnnotation setLocationType:](v27, "setLocationType:", 2);
    -[DebugLocationAnnotation setNavType:](v27, "setNavType:", self->_userLocationMarkerMode);
    matchedUserLocationHistory = self->_matchedUserLocationHistory;
    if (!matchedUserLocationHistory)
    {
      v29 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 3);
      v30 = self->_matchedUserLocationHistory;
      self->_matchedUserLocationHistory = v29;

      matchedUserLocationHistory = self->_matchedUserLocationHistory;
    }
    -[NavigationDebugAnnotationsProvider _addLocationAnnotation:history:](self, "_addLocationAnnotation:history:", v27, matchedUserLocationHistory);

  }
}

- (void)_addLocationAnnotation:(id)a3 history:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == (id)3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = objc_opt_class(DebugLocationAnnotation);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", v7);
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
  if (v11)
  {
    objc_msgSend(v6, "addObject:", v11);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v6, "addObject:", v9);

  }
  v10 = objc_opt_class(DebugLocationAnnotation);
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0)
    -[MKMapView addAnnotation:](self->_mapView, "addAnnotation:", v11);

}

- (void)_clearAllDebugAnnotations
{
  -[NavigationDebugAnnotationsProvider _clearDebugHistoryAnnotations](self, "_clearDebugHistoryAnnotations");
}

- (void)_clearDebugHistoryAnnotations
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v3 = self->_userLocationHistory;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(DebugLocationAnnotation);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
          -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_userLocationHistory, "removeAllObjects");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = self->_rawUserLocationHistory;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v14);
        v16 = objc_opt_class(DebugLocationAnnotation);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", v15);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v12);
  }

  -[NSMutableArray removeAllObjects](self->_rawUserLocationHistory, "removeAllObjects");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_matchedUserLocationHistory;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v21);
        v23 = objc_opt_class(DebugLocationAnnotation);
        if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
          -[MKMapView removeAnnotation:](self->_mapView, "removeAnnotation:", v22, (_QWORD)v24);
        v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v19);
  }

  -[NSMutableArray removeAllObjects](self->_matchedUserLocationHistory, "removeAllObjects");
}

- (void)_updateStepAndManeuverOverlaysWithRoute:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSMapTable *v7;
  NSMapTable *stepAndManeuverOverlays;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id obj;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v4 = a3;
  -[NavigationDebugAnnotationsProvider _clearStepAndManeuverOverlays](self, "_clearStepAndManeuverOverlays");
  if (self->_mapView)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("NavigationDrawManeuverPoints"));

    if (v6)
    {
      if (!self->_stepAndManeuverOverlays)
      {
        v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
        stepAndManeuverOverlays = self->_stepAndManeuverOverlays;
        self->_stepAndManeuverOverlays = v7;

      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "steps"));
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v40 = *(_QWORD *)v42;
        v12 = *(void **)GEOPolylineCoordinateInvalid;
        do
        {
          v13 = 0;
          v14 = v11;
          do
          {
            if (*(_QWORD *)v42 != v40)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v13);
            v16 = v12;
            if (v14)
              v16 = objc_msgSend(v14, "endRouteCoordinate");
            v17 = objc_msgSend(v15, "startRouteCoordinate");
            if ((GEOPolylineCoordinateEqual(v16, v17) & 1) == 0)
            {
              objc_msgSend(v4, "pointAtRouteCoordinate:", v17);
              v19 = v18;
              v21 = v20;
              v23 = v22;
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
              -[NavigationDebugAnnotationsProvider _addStepOrManeuverOverlayForCoordinate:color:](self, "_addStepOrManeuverOverlayForCoordinate:color:", v24, v19, v21, v23);

            }
            objc_msgSend(v4, "pointAtRouteCoordinate:", objc_msgSend(v15, "maneuverStartRouteCoordinate"));
            v26 = v25;
            v28 = v27;
            v30 = v29;
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
            -[NavigationDebugAnnotationsProvider _addStepOrManeuverOverlayForCoordinate:color:](self, "_addStepOrManeuverOverlayForCoordinate:color:", v31, v26, v28, v30);

            objc_msgSend(v4, "pointAtRouteCoordinate:", objc_msgSend(v15, "endRouteCoordinate"));
            v33 = v32;
            v35 = v34;
            v37 = v36;
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
            -[NavigationDebugAnnotationsProvider _addStepOrManeuverOverlayForCoordinate:color:](self, "_addStepOrManeuverOverlayForCoordinate:color:", v38, v33, v35, v37);

            v11 = v15;
            v13 = (char *)v13 + 1;
            v14 = v11;
          }
          while (v10 != v13);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v10);

      }
    }
  }

}

- (void)_addStepOrManeuverOverlayForCoordinate:(id)a3 color:(id)a4
{
  double var1;
  double var0;
  id v7;
  CLLocationCoordinate2D v8;
  id v9;
  id v10;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = a4;
  v8 = CLLocationCoordinate2DMake(var0, var1);
  v10 = (id)objc_claimAutoreleasedReturnValue(+[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v8.latitude, v8.longitude, 2.0));
  v9 = objc_msgSend(objc_alloc((Class)MKCircleRenderer), "initWithCircle:", v10);
  objc_msgSend(v9, "setFillColor:", v7);

  -[NSMapTable setObject:forKey:](self->_stepAndManeuverOverlays, "setObject:forKey:", v9, v10);
  -[MKMapView addOverlay:](self->_mapView, "addOverlay:", v10);

}

- (void)_clearStepAndManeuverOverlays
{
  MKMapView *mapView;
  void *v4;
  void *v5;
  NSMapTable *stepAndManeuverOverlays;

  mapView = self->_mapView;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_stepAndManeuverOverlays, "keyEnumerator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  -[MKMapView removeOverlays:](mapView, "removeOverlays:", v5);

  stepAndManeuverOverlays = self->_stepAndManeuverOverlays;
  self->_stepAndManeuverOverlays = 0;

}

- (void)_updateArrivalOverlaysWithRoute:(id)a3
{
  id v4;
  MKMapView *mapView;
  void *v6;
  void *v7;
  NSMapTable *renderersForOverlays;
  void *i;
  void *v10;
  NSMapTable *v11;
  NSMapTable *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id obj;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];

  v4 = a3;
  mapView = self->_mapView;
  if (mapView)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_renderersForOverlays, "keyEnumerator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    -[MKMapView removeOverlays:](mapView, "removeOverlays:", v7);

    renderersForOverlays = self->_renderersForOverlays;
    self->_renderersForOverlays = 0;

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    if (v54)
    {
      v53 = *(_QWORD *)v66;
      v51 = v4;
      do
      {
        for (i = 0; i != v54; i = (char *)i + 1)
        {
          if (*(_QWORD *)v66 != v53)
            objc_enumerationMutation(obj);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i), "arrivalParameters", v51));
          if (v10)
          {
            if (!self->_renderersForOverlays)
            {
              v11 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 512));
              v12 = self->_renderersForOverlays;
              self->_renderersForOverlays = v11;

            }
            v56 = i;
            if (GEOConfigGetBOOL(MapsConfig_Navigation_VisualizeArrivalRegion_EndOfRoute, off_1014B3938)
              && objc_msgSend(v4, "pointCount")
              && objc_msgSend(v10, "endOfRouteDistanceThreshold"))
            {
              objc_msgSend(v4, "pointAtRouteCoordinate:", objc_msgSend(v4, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v4, "pointCount") - 1, (double)objc_msgSend(v10, "endOfRouteDistanceThreshold")));
              v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:"));
              v14 = objc_msgSend(objc_alloc((Class)MKCircleRenderer), "initWithCircle:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "colorWithAlphaComponent:", 0.8));
              objc_msgSend(v14, "setFillColor:", v16);

              -[NSMapTable setObject:forKey:](self->_renderersForOverlays, "setObject:forKey:", v14, v13);
              -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", v13, 0);

            }
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            v55 = v10;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "arrivalMapRegions"));
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v62;
LABEL_16:
              v21 = 0;
              while (2)
              {
                if (*(_QWORD *)v62 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v21);
                switch(objc_msgSend(v22, "arrivalRegionAction"))
                {
                  case 2u:
                    v23 = &MapsConfig_Navigation_VisualizeArrivalRegion_ISSUE_ARRIVAL;
                    goto LABEL_28;
                  case 3u:
                    v23 = &MapsConfig_Navigation_VisualizeArrivalRegion_ISSUE_ARRIVAL_OFF_ROUTE;
LABEL_28:
                    if (!GEOConfigGetBOOL(*v23, v23[1]))
                      goto LABEL_37;
                    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "colorWithAlphaComponent:", 0.2));

                    v32 = objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
                    goto LABEL_30;
                  case 4u:
                    if (!GEOConfigGetBOOL(MapsConfig_Navigation_VisualizeArrivalRegion_END_NAVIGATION_TIMEOUT, off_1014B3978))goto LABEL_37;
                    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "colorWithAlphaComponent:", 0.2));

                    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
                    v30 = 0.0;
                    goto LABEL_36;
                  case 5u:
                    if (!GEOConfigGetBOOL(MapsConfig_Navigation_VisualizeArrivalRegion_PRE_ARRIVAL_MODE, off_1014B3988))goto LABEL_37;
                    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](UIColor, "cyanColor"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "colorWithAlphaComponent:", 0.2));

                    v32 = objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
LABEL_30:
                    v29 = (void *)v32;
                    v30 = 2.0;
                    goto LABEL_36;
                  case 6u:
                    if (!GEOConfigGetBOOL(MapsConfig_Navigation_VisualizeArrivalRegion_PARKING_SUGGEST_WALKING, off_1014B3998))goto LABEL_37;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
                    v25 = v24;
                    v26 = 0.15;
                    goto LABEL_35;
                  case 7u:
                    v34 = &MapsConfig_Navigation_VisualizeArrivalRegion_INITIATE_APPROACHING;
                    goto LABEL_33;
                  case 8u:
                    v34 = &MapsConfig_Navigation_VisualizeArrivalRegion_PREPARE_TO_PARK;
LABEL_33:
                    if (!GEOConfigGetBOOL(*v34, v34[1]))
                      goto LABEL_37;
                    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor magentaColor](UIColor, "magentaColor"));
                    v25 = v24;
                    v26 = 0.3;
LABEL_35:
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", v26));

                    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
                    v30 = 3.0;
LABEL_36:
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "arrivalRegion"));
                    -[NavigationDebugAnnotationsProvider _addArrivalRegionOverlay:fillColor:strokeColor:lineWidth:](self, "_addArrivalRegionOverlay:fillColor:strokeColor:lineWidth:", v35, v28, v29, v30);

LABEL_37:
                    if (v19 != (id)++v21)
                      continue;
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
                    if (!v19)
                      goto LABEL_39;
                    goto LABEL_16;
                  default:
                    goto LABEL_37;
                }
              }
            }
LABEL_39:

            v10 = v55;
            i = v56;
            if (GEOConfigGetBOOL(MapsConfig_Navigation_VisualizeArrivalRegion_ArrivalPoints, off_1014B3948))
            {
              v59 = 0u;
              v60 = 0u;
              v57 = 0u;
              v58 = 0u;
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "arrivalPoints"));
              v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
              if (v37)
              {
                v38 = v37;
                v39 = *(_QWORD *)v58;
                do
                {
                  for (j = 0; j != v38; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v58 != v39)
                      objc_enumerationMutation(v36);
                    v41 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j);
                    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "point"));
                    objc_msgSend(v42, "coordinate");

                    v44 = CLLocationCoordinate2DFromGEOLocationCoordinate2D(v43);
                    v46 = (void *)objc_claimAutoreleasedReturnValue(+[MKCircle circleWithCenterCoordinate:radius:](MKCircle, "circleWithCenterCoordinate:radius:", v44, v45, (double)objc_msgSend(v41, "radius")));
                    v47 = objc_msgSend(objc_alloc((Class)MKCircleRenderer), "initWithCircle:", v46);
                    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
                    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "colorWithAlphaComponent:", 0.3));
                    objc_msgSend(v47, "setFillColor:", v49);

                    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
                    objc_msgSend(v47, "setStrokeColor:", v50);

                    objc_msgSend(v47, "setLineWidth:", 2.0);
                    -[NSMapTable setObject:forKey:](self->_renderersForOverlays, "setObject:forKey:", v47, v46);
                    -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", v46, 0);

                  }
                  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
                }
                while (v38);
              }

              v4 = v51;
              v10 = v55;
              i = v56;
            }
          }

        }
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
      }
      while (v54);
    }

  }
}

- (void)_addArrivalRegionOverlay:(id)a3 fillColor:(id)a4 strokeColor:(id)a5 lineWidth:(double)a6
{
  id v10;
  void *v11;
  _QWORD *v12;
  unint64_t v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;

  v21 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "coordinates"));
  v12 = malloc_type_malloc(16 * (_QWORD)objc_msgSend(v11, "count"), 0x1000040451B5BE8uLL);
  if (objc_msgSend(v11, "count"))
  {
    v13 = 0;
    v14 = v12 + 1;
    do
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v13));
      objc_msgSend(v15, "lat");
      v17 = v16;
      objc_msgSend(v15, "lng");
      *(v14 - 1) = v17;
      *v14 = v18;

      ++v13;
      v14 += 2;
    }
    while (v13 < (unint64_t)objc_msgSend(v11, "count"));
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKPolygon polygonWithCoordinates:count:](MKPolygon, "polygonWithCoordinates:count:", v12, objc_msgSend(v11, "count")));
  free(v12);
  v20 = objc_msgSend(objc_alloc((Class)MKPolygonRenderer), "initWithPolygon:", v19);
  objc_msgSend(v20, "setFillColor:", v21);
  objc_msgSend(v20, "setStrokeColor:", v10);
  objc_msgSend(v20, "setLineWidth:", a6);
  -[NSMapTable setObject:forKey:](self->_renderersForOverlays, "setObject:forKey:", v20, v19);
  -[MKMapView addOverlay:level:](self->_mapView, "addOverlay:level:", v19, 0);

}

- (int64_t)userLocationMarkerMode
{
  return self->_userLocationMarkerMode;
}

- (void)setUserLocationMarkerMode:(int64_t)a3
{
  self->_userLocationMarkerMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrivalRegionChangedListeners, 0);
  objc_storeStrong((id *)&self->_matchedUserLocationHistory, 0);
  objc_storeStrong((id *)&self->_rawUserLocationHistory, 0);
  objc_storeStrong((id *)&self->_userLocationHistory, 0);
  objc_storeStrong((id *)&self->_stepAndManeuverOverlays, 0);
  objc_storeStrong((id *)&self->_renderersForOverlays, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
