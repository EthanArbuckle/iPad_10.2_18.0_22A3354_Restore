@implementation NavigationCustomFeaturesSource

- (NavigationCustomFeaturesSource)initWithPointsFramer:(id)a3
{
  id v5;
  NavigationCustomFeaturesSource *v6;
  NavigationCustomFeaturesSource *v7;
  dispatch_queue_attr_t v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *lockQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NavigationCustomFeaturesSource;
  v6 = -[NavigationCustomFeaturesSource init](&v13, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pointsFramer, a3);
    v7->_framingMode = 0;
    v7->_overriddenPointToFrame = kCLLocationCoordinate2DInvalid;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = dispatch_queue_create("NavigationCustomFeaturesSource.lock", v9);
    lockQueue = v7->_lockQueue;
    v7->_lockQueue = (OS_dispatch_queue *)v10;

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NavigationCustomFeaturesPointsFraming setSearchAlongTheRoutePoints:](self->_pointsFramer, "setSearchAlongTheRoutePoints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v3, "stopLocationUpdateWithObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NavigationCustomFeaturesSource;
  -[NavigationCustomFeaturesSource dealloc](&v4, "dealloc");
}

- (void)setItems:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *lockQueue;
  id v8;
  _QWORD block[4];
  id v10;
  NavigationCustomFeaturesSource *v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR: setting items: %@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v14 = 0x2020000000;
  v15 = 0;
  lockQueue = self->_lockQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100378B9C;
  block[3] = &unk_1011B31D8;
  v8 = v4;
  v10 = v8;
  v11 = self;
  p_buf = &buf;
  dispatch_sync(lockQueue, block);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    -[NavigationCustomFeaturesSource _updateFraming](self, "_updateFraming");
    -[PersonalizedItemSource _notifyObserversItemsDidChange](self, "_notifyObserversItemsDidChange");
  }

  _Block_object_dispose(&buf, 8);
}

- (void)setOverriddenPointToFrame:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  CLLocationCoordinate2D *p_overriddenPointToFrame;
  id v7;
  NSObject *v8;
  int v9;
  CLLocationDegrees v10;
  __int16 v11;
  CLLocationDegrees v12;

  longitude = a3.longitude;
  latitude = a3.latitude;
  p_overriddenPointToFrame = &self->_overriddenPointToFrame;
  if (self->_overriddenPointToFrame.latitude != a3.latitude || self->_overriddenPointToFrame.longitude != a3.longitude)
  {
    v7 = sub_10043222C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 134218240;
      v10 = latitude;
      v11 = 2048;
      v12 = longitude;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "SAR: setting overriddenPointToFrame. Lat: %f. Lng: %f", (uint8_t *)&v9, 0x16u);
    }

    p_overriddenPointToFrame->latitude = latitude;
    p_overriddenPointToFrame->longitude = longitude;
    -[NavigationCustomFeaturesSource _updateCoalesced](self, "_updateCoalesced");
  }
}

- (void)_updateCoalesced
{
  dispatch_time_t v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (!-[NavigationCustomFeaturesSource isUpdatingCoalesced](self, "isUpdatingCoalesced"))
  {
    -[NavigationCustomFeaturesSource setUpdatingCoalesced:](self, "setUpdatingCoalesced:", 1);
    objc_initWeak(&location, self);
    v3 = dispatch_time(0, 100000001);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100378DBC;
    v4[3] = &unk_1011AD260;
    objc_copyWeak(&v5, &location);
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)_updateFraming
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *lockQueue;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  int64_t v27;
  NSMutableArray *v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD block[6];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  _BYTE v54[128];
  void *v55;
  _BYTE buf[24];
  void *v57;
  double v58;
  double v59;
  CLLocationCoordinate2D v60;

  v2 = sub_10043222C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeaturesSource items](self, "items"));
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SAR: _updateFraming for items: %@", buf, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  v10 = v9;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  -[NavigationCustomFeaturesSource setLastUpdateTimestamp:](self, "setLastUpdateTimestamp:");
  -[NavigationCustomFeaturesSource setLastUpdateLocation:](self, "setLastUpdateLocation:", v8, v10);
  -[NavigationCustomFeaturesSource _updateLocationManager](self, "_updateLocationManager");
  -[NavigationCustomFeaturesSource overriddenPointToFrame](self, "overriddenPointToFrame");
  if (CLLocationCoordinate2DIsValid(v60))
  {
    v11 = sub_10043222C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SAR: framing single point only", buf, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeaturesSource pointsFramer](self, "pointsFramer"));
    -[NavigationCustomFeaturesSource overriddenPointToFrame](self, "overriddenPointToFrame");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithMKCoordinate:](NSValue, "valueWithMKCoordinate:"));
    v55 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));
    objc_msgSend(v13, "setSearchAlongTheRoutePoints:", v15);

  }
  else
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = sub_1003793C8;
    v52 = sub_1003793D8;
    v53 = 0;
    lockQueue = self->_lockQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003793E0;
    block[3] = &unk_1011ADF48;
    block[4] = self;
    block[5] = &v48;
    dispatch_sync(lockQueue, block);
    if (objc_msgSend((id)v49[5], "count"))
    {
      v17 = -[NavigationCustomFeaturesSource framingMode](self, "framingMode");
      if (v17)
      {
        if (v17 == 1)
        {
          v18 = (void *)v49[5];
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_100379B6C;
          v57 = &unk_1011B31F8;
          v58 = v8;
          v59 = v10;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sortedArrayUsingComparator:", buf));
          if ((unint64_t)objc_msgSend(v19, "count") > 2)
            v20 = 3;
          else
            v20 = (uint64_t)objc_msgSend(v19, "count");
          v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "subarrayWithRange:", 0, v20));

        }
        else
        {
          v24 = 0;
        }
      }
      else
      {
        v24 = (id)v49[5];
      }
      v25 = sub_10043222C();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = -[NavigationCustomFeaturesSource framingMode](self, "framingMode");
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "SAR: items to frame: %@ framingMode: %ld", buf, 0x16u);
      }

      v28 = objc_opt_new(NSMutableArray);
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v23 = v24;
      v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v29)
      {
        v30 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v23);
            v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            v33 = sub_10043222C();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
            {
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "mapItem"));
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "name"));
              objc_msgSend(v32, "coordinate");
              v38 = v37;
              objc_msgSend(v32, "coordinate");
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v36;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v38;
              *(_WORD *)&buf[22] = 2048;
              v57 = v39;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "SAR: Adding point for Item: %@. Lat: %f. Lng: %f. ", buf, 0x20u);

            }
            objc_msgSend(v32, "coordinate");
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithMKCoordinate:](NSValue, "valueWithMKCoordinate:"));
            -[NSMutableArray addObject:](v28, "addObject:", v40);

          }
          v29 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
        }
        while (v29);
      }

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeaturesSource pointsFramer](self, "pointsFramer"));
      objc_msgSend(v41, "setSearchAlongTheRoutePoints:", v28);

    }
    else
    {
      v21 = sub_10043222C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "SAR: Not framing any SAR items as no items are set.", buf, 2u);
      }

      v23 = (id)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeaturesSource pointsFramer](self, "pointsFramer"));
      objc_msgSend(v23, "setSearchAlongTheRoutePoints:", 0);
    }

    _Block_object_dispose(&v48, 8);
  }
}

- (void)_updateFramingWithNewLocationIfNeeded
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[2];
  CLLocationCoordinate2D v14;

  if ((id)-[NavigationCustomFeaturesSource framingMode](self, "framingMode") == (id)1)
  {
    -[NavigationCustomFeaturesSource overriddenPointToFrame](self, "overriddenPointToFrame");
    if (!CLLocationCoordinate2DIsValid(v14))
    {
      +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
      v4 = v3;
      -[NavigationCustomFeaturesSource lastUpdateTimestamp](self, "lastUpdateTimestamp");
      if (v4 - v5 >= 10.0)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastLocation"));
        objc_msgSend(v7, "coordinate");
        v13[0] = v8;
        v13[1] = v9;

        -[NavigationCustomFeaturesSource lastUpdateLocation](self, "lastUpdateLocation");
        v12[0] = v10;
        v12[1] = v11;
        if (CLLocationCoordinate2DGetDistanceFrom(v13, v12) >= 100.0)
          -[NavigationCustomFeaturesSource _updateFraming](self, "_updateFraming");
      }
    }
  }
}

- (void)_updateLocationManager
{
  NSObject *lockQueue;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  CLLocationCoordinate2D v10;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100379618;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  if ((id)-[NavigationCustomFeaturesSource framingMode](self, "framingMode") == (id)1
    && *((_BYTE *)v7 + 24)
    && (-[NavigationCustomFeaturesSource overriddenPointToFrame](self, "overriddenPointToFrame"),
        !CLLocationCoordinate2DIsValid(v10)))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v4, "startLocationUpdateWithObserver:", self);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v4, "stopLocationUpdateWithObserver:", self);
  }

  _Block_object_dispose(&v6, 8);
}

- (void)setFramingMode:(int64_t)a3
{
  if (self->_framingMode != a3)
  {
    self->_framingMode = a3;
    -[NavigationCustomFeaturesSource _updateFraming](self, "_updateFraming");
  }
}

- (id)allItems
{
  NSObject *lockQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1003793C8;
  v10 = sub_1003793D8;
  v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100379744;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)displayMapItems:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NavigationCustomFeatureItem *v14;
  NavigationCustomFeatureItem *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  id v22;

  v4 = a3;
  v5 = sub_10043222C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SAR: displayMapItems: %@", buf, 0xCu);
  }

  v7 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
        v14 = [NavigationCustomFeatureItem alloc];
        v15 = -[NavigationCustomFeatureItem initWithMapItem:](v14, "initWithMapItem:", v13, (_QWORD)v16);
        -[NSMutableArray addObject:](v7, "addObject:", v15);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[NavigationCustomFeaturesSource setItems:](self, "setItems:", v7);
}

- (void)removeMapItems
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = sub_10043222C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationCustomFeaturesSource items](self, "items"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SAR: removeMapItems: %@", (uint8_t *)&v6, 0xCu);

  }
  -[NavigationCustomFeaturesSource setItems:](self, "setItems:", 0);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  -[NavigationCustomFeaturesSource _updateFramingWithNewLocationIfNeeded](self, "_updateFramingWithNewLocationIfNeeded", a3);
}

- (void)locationManagerDidReset:(id)a3
{
  -[NavigationCustomFeaturesSource _updateFramingWithNewLocationIfNeeded](self, "_updateFramingWithNewLocationIfNeeded", a3);
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (NavigationCustomFeaturesPointsFraming)pointsFramer
{
  return self->_pointsFramer;
}

- (void)setPointsFramer:(id)a3
{
  objc_storeStrong((id *)&self->_pointsFramer, a3);
}

- (int64_t)framingMode
{
  return self->_framingMode;
}

- (CLLocationCoordinate2D)overriddenPointToFrame
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_overriddenPointToFrame.latitude;
  longitude = self->_overriddenPointToFrame.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (NSArray)items
{
  return self->_items;
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockQueue, a3);
}

- (BOOL)shouldUseDebugAttributes
{
  return self->_shouldUseDebugAttributes;
}

- (void)setShouldUseDebugAttributes:(BOOL)a3
{
  self->_shouldUseDebugAttributes = a3;
}

- (CLLocationCoordinate2D)lastUpdateLocation
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_lastUpdateLocation.latitude;
  longitude = self->_lastUpdateLocation.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setLastUpdateLocation:(CLLocationCoordinate2D)a3
{
  self->_lastUpdateLocation = a3;
}

- (double)lastUpdateTimestamp
{
  return self->_lastUpdateTimestamp;
}

- (void)setLastUpdateTimestamp:(double)a3
{
  self->_lastUpdateTimestamp = a3;
}

- (BOOL)isUpdatingCoalesced
{
  return self->_updatingCoalesced;
}

- (void)setUpdatingCoalesced:(BOOL)a3
{
  self->_updatingCoalesced = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockQueue, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_pointsFramer, 0);
}

@end
