@implementation FMDTrackedLocationsStore

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD block[4];
  id v12;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10022AC28(self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimer](self, "locationPurgeTimer"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimer](self, "locationPurgeTimer"));
    -[FMDTrackedLocationsStore setLocationPurgeTimer:](self, "setLocationPurgeTimer:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007B2C8;
    block[3] = &unk_1002C1328;
    v12 = v6;
    v7 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimerXPCTransactionName](self, "locationPurgeTimerXPCTransactionName"));
    objc_msgSend(v8, "endTransaction:", v9);

  }
  v10.receiver = self;
  v10.super_class = (Class)FMDTrackedLocationsStore;
  -[FMDTrackedLocationsStore dealloc](&v10, "dealloc");
}

- (FMDTrackedLocationsStore)initWithLocationTracker:(id)a3
{
  id v4;
  FMDTrackedLocationsStore *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  dispatch_queue_t v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)FMDTrackedLocationsStore;
  v5 = -[FMDTrackedLocationsStore init](&v21, "init");
  if (v5)
  {
    v6 = objc_alloc((Class)FMDataArchiver);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore _trackedLocationsCacheFileURL](v5, "_trackedLocationsCacheFileURL"));
    v8 = objc_msgSend(v6, "initWithFileURL:", v7);
    -[FMDTrackedLocationsStore setDataArchiver:](v5, "setDataArchiver:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore dataArchiver](v5, "dataArchiver"));
    objc_msgSend(v9, "setDataProtectionClass:", 4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore dataArchiver](v5, "dataArchiver"));
    objc_msgSend(v10, "setBackedUp:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore dataArchiver](v5, "dataArchiver"));
    objc_msgSend(v11, "setCreateDirectories:", 1);

    -[FMDTrackedLocationsStore setLocationTracker:](v5, "setLocationTracker:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMDTrackedLocationsStore setTrackedLocations:](v5, "setTrackedLocations:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore _serialQueue_readTrackedLocationsCache](v5, "_serialQueue_readTrackedLocationsCache"));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](v5, "trackedLocations"));
      objc_msgSend(v14, "addObjectsFromArray:", v13);

    }
    v15 = off_1003052E8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", objc_msgSend(v4, "locationTrackerType")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v15, v16));

    v18 = objc_retainAutorelease(v17);
    v19 = dispatch_queue_create((const char *)objc_msgSend(v18, "cStringUsingEncoding:", 4), 0);
    -[FMDTrackedLocationsStore setStore_ops_queue:](v5, "setStore_ops_queue:", v19);

    -[FMDTrackedLocationsStore _serialQueue_scheduleLocationPurgeTimer](v5, "_serialQueue_scheduleLocationPurgeTimer");
  }

  return v5;
}

- (void)_serialQueue_updateTrackedLocationsCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore dataArchiver](self, "dataArchiver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "saveArray:", v4));

  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100228A90();

  }
}

- (id)_trackedLocationsCacheFileURL
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;

  v3 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Preferences")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v6, 1, 0));

  }
  else
  {
    v8 = sub_1000031B8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      sub_10022AD04();

    v7 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore _locationCacheFileName](self, "_locationCacheFileName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v10, 0));

  v12 = sub_1000031B8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10022ACA0();

  return v11;
}

- (id)_serialQueue_readTrackedLocationsCache
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore dataArchiver](self, "dataArchiver"));
  v4 = objc_opt_class(FMDLocation, v3);
  v6 = objc_opt_class(FMDVolatileMetaDataRecord, v5);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v6, objc_opt_class(FMDBatteryInfo, v7), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "readArrayAndClasses:error:", v9, &v21));
  v11 = v21;

  if ((objc_msgSend(v11, "fm_isFileNotFoundError") & 1) != 0)
    goto LABEL_9;
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 0;
  if (!v12)
  {
    v13 = sub_1000031B8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10022AE20();

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerGeneral sharedInstance](FMDEventLoggerGeneral, "sharedInstance"));
    objc_msgSend(v15, "sendError:forEventName:", v11, CFSTR("FMDTrackedLocationsStoreFailedReadEventName"));

LABEL_9:
    if (!v10)
      goto LABEL_15;
  }
  v16 = sub_1000031B8();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_10022ADB4(v10);

  v18 = sub_1000031B8();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    sub_10022AD3C(v10);

LABEL_15:
  return v10;
}

- (void)_serialQueue_deleteTrackedLocationsCache
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore _trackedLocationsCacheFileURL](self, "_trackedLocationsCacheFileURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if (v6)
  {
    v7 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_10022AE80(self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v13 = 0;
    objc_msgSend(v9, "removeItemAtURL:error:", v3, &v13);
    v10 = v13;

    if (v10 && (objc_msgSend(v10, "fm_isFileNotFoundError") & 1) == 0)
    {
      v11 = sub_1000031B8();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to delete tracked locations file (%@): %@", buf, 0x16u);
      }

    }
  }

}

- (id)_locationCacheFileName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationTracker](self, "locationTracker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMDLocationTracker stringForLocationTrackerType:](FMDLocationTracker, "stringForLocationTrackerType:", objc_msgSend(v2, "locationTrackerType")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v3, off_1003052E0));

  return v4;
}

- (void)recordLocation:(id)a3 ofType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  FMDLocation *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  FMDBatteryInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id location;
  const __CFString *v26;
  void *v27;

  v4 = a4;
  v6 = a3;
  v7 = -[FMDLocation initWithLocation:eventType:positionType:]([FMDLocation alloc], "initWithLocation:eventType:positionType:", v6, 5, v4);
  -[FMDTrackedLocationsStore logLocation:](self, "logLocation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "horizontalAccuracy"));
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationTracker](self, "locationTracker"));
  objc_msgSend(v11, "minSLCAccuracyThreshold");
  v13 = v12;

  if (v10 <= v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v14, "fm_safelySetObject:forKey:", v7, CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation"));
    v15 = objc_alloc_init(FMDBatteryInfo);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDLocation metaDataRecord](v7, "metaDataRecord"));
    v26 = CFSTR("kFMDTrackedLocationsStoreTrackFMDBatteryInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDBatteryInfo dictionaryValue](v15, "dictionaryValue"));
    v27 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    objc_msgSend(v16, "appendMetaData:", v18);

    objc_msgSend(v14, "fm_safelySetObject:forKey:", v15, CFSTR("kFMDTrackedLocationsStoreTrackFMDBatteryInfo"));
    objc_initWeak(&location, self);
    v19 = objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore store_ops_queue](self, "store_ops_queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007BC74;
    block[3] = &unk_1002C21C8;
    objc_copyWeak(&v24, &location);
    v22 = v14;
    v23 = v6;
    v20 = v14;
    dispatch_async(v19, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
}

- (void)logLocation:(id)a3
{
  id v3;
  FMDEventLoggerEventLocate *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v3 = a3;
  v4 = -[FMDEventLoggerEventLocate initWithEventName:]([FMDEventLoggerEventLocate alloc], "initWithEventName:", CFSTR("FMDLocatorLocateEvent"));
  -[FMDEventLoggerEventLocate setLocation:reason:](v4, "setLocation:reason:", v3, &stru_1002CD590);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLogger sharedLogger](FMDEventLogger, "sharedLogger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityOnDiskStats facilityName](FMDEventLoggerFacilityOnDiskStats, "facilityName"));
  v9[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMDEventLoggerFacilityOnDisk facilityName](FMDEventLoggerFacilityOnDisk, "facilityName"));
  v9[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
  objc_msgSend(v5, "logEvent:toFacilitiesNamed:", v4, v8);

}

- (void)deleteAllTrackedLocations
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore store_ops_queue](self, "store_ops_queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007BF58;
  v4[3] = &unk_1002C1378;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)actOnTrackedLocationsUsingBlock:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v20;
  id obj;
  _QWORD block[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v20 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
  v4 = objc_msgSend(v3, "copy");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDBatteryInfo")));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dictionaryValue"));
        objc_msgSend(v11, "addEntriesFromDictionary:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dictionaryValue"));
        objc_msgSend(v11, "addEntriesFromDictionary:", v15);

        objc_msgSend(v5, "fm_safeAddObject:", v11);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v7);
  }

  v16 = objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore store_ops_queue](self, "store_ops_queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007C200;
  block[3] = &unk_1002C16D8;
  v23 = v5;
  v24 = v20;
  v17 = v5;
  v18 = v20;
  dispatch_async(v16, block);

}

- (id)lastLocation
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10007C2F0;
  v11 = sub_10007C300;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore store_ops_queue](self, "store_ops_queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10007C308;
  v6[3] = &unk_1002C3DC8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)_serialQueue_scheduleLocationPurgeTimer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimer](self, "locationPurgeTimer"));

  -[FMDTrackedLocationsStore _serialQueue_scheduleLocationPurgeTimer_internal](self, "_serialQueue_scheduleLocationPurgeTimer_internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimer](self, "locationPurgeTimer"));

  if (v4)
  {
    if (v3)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimerXPCTransactionName](self, "locationPurgeTimerXPCTransactionName"));
    objc_msgSend(v6, "beginTransaction:", v5);
  }
  else
  {
    if (!v3)
      return;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimerXPCTransactionName](self, "locationPurgeTimerXPCTransactionName"));
    objc_msgSend(v6, "endTransaction:", v5);
  }

}

- (void)_serialQueue_scheduleLocationPurgeTimer_internal
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  id v27;
  id v28;
  NSObject *v29;
  id vala;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id location;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD block[4];
  id v41;
  _BYTE v42[128];

  v2 = sub_1000031B8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_10022AFB4();

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimer](self, "locationPurgeTimer"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationPurgeTimer](self, "locationPurgeTimer"));
    -[FMDTrackedLocationsStore setLocationPurgeTimer:](self, "setLocationPurgeTimer:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10007C878;
    block[3] = &unk_1002C1328;
    v41 = v5;
    v6 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations", self));
  v8 = objc_msgSend(v7, "count") == 0;

  if (v8)
  {
    v28 = sub_1000031B8();
    v13 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10022AEF8();
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(vala, "locationTracker"));
    objc_msgSend(v9, "keepAlive");
    v11 = v10;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(vala, "trackedLocations"));
    v13 = 0;
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v37;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v16), "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation")));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "timeStamp"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dateByAddingTimeInterval:", v11));
          v20 = v19;
          if (v13)
          {
            v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "earlierDate:", v13));

            v13 = v21;
          }
          else
          {
            v13 = v19;
          }

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v14);
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v23 = -[NSObject compare:](v13, "compare:", v22) == (id)-1;

    v24 = sub_1000031B8();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
    if (v23)
    {
      if (v26)
        sub_10022AF24();

      objc_initWeak(&location, vala);
      v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(vala, "store_ops_queue"));
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10007C880;
      v33[3] = &unk_1002C1378;
      objc_copyWeak(&v34, &location);
      dispatch_async(v29, v33);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
    }
    else
    {
      if (v26)
        sub_10022AF50();

      v27 = objc_msgSend(objc_alloc((Class)PCPersistentTimer), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v13, CFSTR("com.apple.icloud.findmydeviced.trackedLocationsPurgeTimer"), vala, "_serialQueue_purgeOldTrackedLocationsNow", 0);
      objc_msgSend(vala, "setLocationPurgeTimer:", v27);

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10007C8D4;
      v32[3] = &unk_1002C1328;
      v32[4] = vala;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v32);
    }
  }

}

- (id)locationPurgeTimerXPCTransactionName
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("TrackingLocationPurgeTimer-%lX"), self);
}

- (void)_serialQueue_purgeOldTrackedLocationsNow
{
  id v3;
  NSObject *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  FMDTrackedLocationsStore *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10022AFE0();

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore locationTracker](self, "locationTracker"));
  objc_msgSend(v5, "keepAlive");
  v7 = v6;
  v26 = v5;
  v25 = objc_msgSend(v5, "maxLocations");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v27 = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation")));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeStamp"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateByAddingTimeInterval:", v7));
        if (objc_msgSend(v17, "compare:", v8) == (id)1)
        {
          objc_msgSend(v28, "addObject:", v14);
        }
        else
        {
          v18 = sub_1000031B8();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v16;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Purging location with timestamp %@ since it was very old", buf, 0xCu);
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v11);
  }

  while ((uint64_t)objc_msgSend(v28, "count") > (uint64_t)v25)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "timeStamp"));
    v23 = sub_1000031B8();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Purging location with timestamp %@ since there were too many locations", buf, 0xCu);
    }

    objc_msgSend(v28, "removeObjectAtIndex:", 0);
  }
  -[FMDTrackedLocationsStore setTrackedLocations:](v27, "setTrackedLocations:", v28);
  -[FMDTrackedLocationsStore _serialQueue_scheduleLocationPurgeTimer](v27, "_serialQueue_scheduleLocationPurgeTimer");

}

- (void)_serialQueue_addTrackedLocationNow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  FMDLocation *v14;
  FMDLocation *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint8_t v22[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));

  v11 = sub_1000031B8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9 == v10)
  {
    if (v13)
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New location does not have a better accuracy. Copying the new timestamp to the last location...", v22, 2u);
    }

    v15 = [FMDLocation alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
    v14 = -[FMDLocation initWithLocation:eventType:positionType:](v15, "initWithLocation:eventType:positionType:", v16, objc_msgSend(v7, "eventType"), objc_msgSend(v7, "positionType"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));
    v19 = objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, CFSTR("kFMDTrackedLocationsStoreTrackFMDLocation"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
    objc_msgSend(v20, "removeLastObject");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
    objc_msgSend(v21, "addObject:", v19);

  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New location. Recording this location...", buf, 2u);
    }

    v14 = (FMDLocation *)objc_claimAutoreleasedReturnValue(-[FMDTrackedLocationsStore trackedLocations](self, "trackedLocations"));
    -[FMDLocation addObject:](v14, "addObject:", v4);
  }

}

- (FMDLocationTracker)locationTracker
{
  return (FMDLocationTracker *)objc_loadWeakRetained((id *)&self->_locationTracker);
}

- (void)setLocationTracker:(id)a3
{
  objc_storeWeak((id *)&self->_locationTracker, a3);
}

- (NSMutableArray)trackedLocations
{
  return self->_trackedLocations;
}

- (void)setTrackedLocations:(id)a3
{
  objc_storeStrong((id *)&self->_trackedLocations, a3);
}

- (OS_dispatch_queue)store_ops_queue
{
  return self->_store_ops_queue;
}

- (void)setStore_ops_queue:(id)a3
{
  objc_storeStrong((id *)&self->_store_ops_queue, a3);
}

- (PCPersistentTimer)locationPurgeTimer
{
  return self->_locationPurgeTimer;
}

- (void)setLocationPurgeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_locationPurgeTimer, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_locationPurgeTimer, 0);
  objc_storeStrong((id *)&self->_store_ops_queue, 0);
  objc_storeStrong((id *)&self->_trackedLocations, 0);
  objc_destroyWeak((id *)&self->_locationTracker);
}

@end
