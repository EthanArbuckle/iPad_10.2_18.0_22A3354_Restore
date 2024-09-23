@implementation NavdLocationLeecher

+ (id)sharedLeecher
{
  if (qword_1014D1DC8 != -1)
    dispatch_once(&qword_1014D1DC8, &stru_1011AD2F0);
  return (id)qword_1014D1DC0;
}

- (NavdLocationLeecher)init
{
  NavdLocationLeecher *v2;
  GEOLocationShifter *v3;
  GEOLocationShifter *locationShifter;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serialQueue;
  NSMutableArray *v9;
  NSMutableArray *observers;
  uint64_t v11;
  NavdLocationProvider *locationProvider;
  id v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *leechedLocations;
  uint64_t v17;
  NSDate *lastRecordDate;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NavdLocationLeecher;
  v2 = -[NavdLocationLeecher init](&v20, "init");
  if (v2)
  {
    v3 = (GEOLocationShifter *)objc_alloc_init((Class)GEOLocationShifter);
    locationShifter = v2->_locationShifter;
    v2->_locationShifter = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("NavdLocationLeecher", v6);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    observers = v2->_observers;
    v2->_observers = v9;

    v11 = objc_claimAutoreleasedReturnValue(+[MNHybridLocationProvider navdInstance](MNHybridLocationProvider, "navdInstance"));
    locationProvider = v2->_locationProvider;
    v2->_locationProvider = (NavdLocationProvider *)v11;

    -[NavdLocationProvider setDelegate:](v2->_locationProvider, "setDelegate:", v2);
    v13 = objc_alloc((Class)NSMutableArray);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEONavdDefaults sharedInstance](GEONavdDefaults, "sharedInstance"));
    v15 = (NSMutableArray *)objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "maximumNumberOfLeechedLocations"));
    leechedLocations = v2->_leechedLocations;
    v2->_leechedLocations = v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastRecordDate = v2->_lastRecordDate;
    v2->_lastRecordDate = (NSDate *)v17;

    v2->_maxLeechingTimeInterval = GEOConfigGetDouble(NavigationConfig_LeechingThrottleTimeout[0], NavigationConfig_LeechingThrottleTimeout[1]);
  }
  return v2;
}

- (void)startLeeching
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230834;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)pauseLeeching
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230920;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)resumeLeeching
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230A04;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)stopLeeching
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230AE4;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (void)_pruneLeachedLocations
{
  uint64_t v3;
  unint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  char *v13;
  unint64_t v14;

  v3 = 0;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (char *)-[NSMutableArray count](self->_leechedLocations, "count");
    if (v4 < (unint64_t)v6)
    {
      v7 = v6;
      v5 = (char *)v4;
      while (1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_leechedLocations, "objectAtIndexedSubscript:", v5));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timestamp"));
        objc_msgSend(v9, "timeIntervalSinceNow");
        v11 = -v10;
        v12 = dbl_100E34788[2 * v3];

        if (v12 <= v11)
          break;
        if (v7 == ++v5)
        {
          v5 = v7;
          break;
        }
      }
    }
    v13 = *(char **)&dbl_100E34788[2 * v3 + 1];
    v14 = (unint64_t)&v5[-v4];
    if (&v5[-v4] > v13)
    {
      do
      {
        -[NSMutableArray removeObjectAtIndex:](self->_leechedLocations, "removeObjectAtIndex:", v4);
        --v14;
      }
      while (v14 > (unint64_t)v13);
      v5 = &v13[v4];
    }
    ++v3;
    v4 = (unint64_t)v5;
  }
  while (v3 != 5);
}

- (void)_clearLeachedLocations
{
  -[NSMutableArray removeAllObjects](self->_leechedLocations, "removeAllObjects");
}

- (void)_recordLeechedLocation:(id)a3
{
  id v5;
  NavdLocationLeecher *v6;
  NSObject *serialQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  NavdLocationLeecher *v11;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_lastLeechedLocation, a3);
  objc_sync_exit(v6);

  serialQueue = v6->_serialQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100230D2C;
  v9[3] = &unk_1011AC8B0;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(serialQueue, v9);

}

- (id)lastLeechedLocation
{
  NavdLocationLeecher *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CLLocation copy](v2->_lastLeechedLocation, "copy");
  objc_sync_exit(v2);

  return v3;
}

- (NSArray)leechedLocations
{
  NSObject *serialQueue;
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
  v9 = sub_100230ECC;
  v10 = sub_100230EDC;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100230EE4;
  v5[3] = &unk_1011AD318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (BOOL)coarseModeEnabled
{
  return -[NavdLocationProvider coarseModeEnabled](self->_locationProvider, "coarseModeEnabled");
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230FA8;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100231030;
  block[3] = &unk_1011AC8B0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (void)_notifyObserversAboutLocation:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "locationLeecher:receivedLocation:", self, v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_notifyObserversAboutError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_observers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "locationLeecher:errorLeechingLocation:", self, v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_notifyObserversAboutPrecision
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "locationLeecher:didChangeCoarseMode:") & 1) != 0)
          objc_msgSend(v8, "locationLeecher:didChangeCoarseMode:", self, -[NavdLocationLeecher coarseModeEnabled](self, "coarseModeEnabled", (_QWORD)v9));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_handleLeechedLocation:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  GEOLocationShifter *locationShifter;
  double v10;
  double v11;
  _QWORD v12[6];
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  v32 = 0u;
  memset(v33, 0, 28);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  if (v4)
    objc_msgSend(v4, "clientLocation");
  objc_initWeak(&location, self);
  locationShifter = self->_locationShifter;
  objc_msgSend(v4, "horizontalAccuracy");
  v11 = v10;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100231528;
  v13[3] = &unk_1011AD340;
  objc_copyWeak(&v14, &location);
  v21 = v31;
  v22 = v32;
  v23[0] = v33[0];
  *(_OWORD *)((char *)v23 + 12) = *(_OWORD *)((char *)v33 + 12);
  v17 = v27;
  v18 = v28;
  v19 = v29;
  v20 = v30;
  v15 = v25;
  v16 = v26;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002315BC;
  v12[3] = &unk_1011AD360;
  *(double *)&v12[4] = v6;
  *(double *)&v12[5] = v8;
  -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](locationShifter, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v13, 0, v12, self->_serialQueue, v6, v8, v11);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_handleShiftedCoordinate:(id)a3 fromClientLocation:(id *)a4
{
  double var1;
  double var0;
  uint64_t Log;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  id v17;
  _BYTE v18[32];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  $F24F406B2B787EFB06265DBA3D28CBD5 v24;
  _OWORD v25[2];

  var1 = a3.var1;
  var0 = a3.var0;
  if (vabdd_f64(a3.var0, *(double *)(&a4->var0 + 1)) >= 0.00000000999999994
    || vabdd_f64(a3.var1, *(double *)((char *)&a4->var1.var0 + 4)) >= 0.00000000999999994)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavdLocationManager");
    v9 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(&a4->var0 + 1);
      v11 = *(_QWORD *)((char *)&a4->var1.var0 + 4);
      *(_DWORD *)v18 = 134284289;
      *(double *)&v18[4] = var0;
      *(_WORD *)&v18[12] = 2049;
      *(double *)&v18[14] = var1;
      *(_WORD *)&v18[22] = 2049;
      *(_QWORD *)&v18[24] = v10;
      LOWORD(v19) = 2049;
      *(_QWORD *)((char *)&v19 + 2) = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "NavdLocationLeecher notifying observers with shifted location:%{private}f, %{private}f. Original location was: %{private}f, %{private}f.", v18, 0x2Au);
    }

  }
  v12 = objc_alloc((Class)CLLocation);
  var13 = a4->var13;
  v23 = *(_OWORD *)&a4->var11;
  v24 = var13;
  v25[0] = *(_OWORD *)&a4->var14;
  *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)&a4->var16;
  v14 = *(_OWORD *)&a4->var5;
  v19 = *(_OWORD *)&a4->var3;
  v20 = v14;
  v15 = *(_OWORD *)&a4->var9;
  v21 = *(_OWORD *)&a4->var7;
  v22 = v15;
  v16 = *(_OWORD *)&a4->var1.var1;
  *(_OWORD *)v18 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&v18[16] = v16;
  v17 = objc_msgSend(v12, "initWithClientLocation:", v18);
  -[NavdLocationLeecher _recordLeechedLocation:](self, "_recordLeechedLocation:", v17);
  if (!self->_leechingPaused)
    -[NavdLocationLeecher _notifyObserversAboutLocation:](self, "_notifyObserversAboutLocation:", v17);

}

- (void)locationProvider:(id)a3 didUpdateLocation:(id)a4
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double Double;
  NSDate *v15;
  NSDate *lastRecordDate;
  NSObject *serialQueue;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  double v24;

  v5 = a4;
  if (-[NavdLocationLeecher coarseModeEnabled](self, "coarseModeEnabled"))
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavdLocationManager");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "Dropping location since coarse mode is enabled";
      v9 = v7;
      v10 = 2;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v8, buf, v10);
    }
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->_lastRecordDate, "timeIntervalSinceNow");
    v12 = -v11;
    if (self->_maxLeechingTimeInterval <= -v11)
    {
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      lastRecordDate = self->_lastRecordDate;
      self->_lastRecordDate = v15;

      objc_initWeak((id *)buf, self);
      serialQueue = self->_serialQueue;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100231A24;
      v18[3] = &unk_1011AD1E8;
      objc_copyWeak(&v20, (id *)buf);
      v19 = v5;
      dispatch_async(serialQueue, v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
      goto LABEL_10;
    }
    v13 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavdLocationManager");
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      Double = GEOConfigGetDouble(NavigationConfig_LeechingThrottleTimeout[0], NavigationConfig_LeechingThrottleTimeout[1]);
      *(_DWORD *)buf = 134218240;
      v22 = v12;
      v23 = 2048;
      v24 = Double;
      v8 = "Dropping location since time elapsed since last leeched location is %f < %f";
      v9 = v7;
      v10 = 22;
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (void)locationProvider:(id)a3 didReceiveError:(id)a4
{
  id v6;
  id v7;
  uint64_t Log;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSObject *serialQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavdLocationManager");
  v9 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (objc_class *)objc_opt_class(v6);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    *(_DWORD *)buf = 138478083;
    v19 = v12;
    v20 = 2113;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{private}@ failed while leeching with error: %{private}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100231BE4;
  v15[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v7;
  v14 = v7;
  dispatch_async(serialQueue, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

- (void)locationProvider:(id)a3 didChangeCoarseMode:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t Log;
  NSObject *v8;
  objc_class *v9;
  NSString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  NSObject *serialQueue;
  _QWORD v15[4];
  id v16;
  BOOL v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;

  v4 = a4;
  v6 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "NavdLocationManager");
  v8 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class(v6);
    v10 = NSStringFromClass(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)v11;
    v13 = CFSTR("disabled");
    if (v4)
      v13 = CFSTR("enabled");
    *(_DWORD *)buf = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ coarse mode is now %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  serialQueue = self->_serialQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100231DA4;
  v15[3] = &unk_1011AD388;
  v17 = v4;
  objc_copyWeak(&v16, (id *)buf);
  dispatch_async(serialQueue, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecordDate, 0);
  objc_storeStrong((id *)&self->_leechedLocations, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lastLeechedLocation, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
}

@end
