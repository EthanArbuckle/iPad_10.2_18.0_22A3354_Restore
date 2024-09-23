@implementation PersistenceManager

+ (id)sharedManager
{
  if (qword_1014D2518 != -1)
    dispatch_once(&qword_1014D2518, &stru_1011B5E68);
  return (id)qword_1014D2510;
}

- (PersistenceManager)initWithPersistenceData:(id)a3
{
  id v5;
  PersistenceManager *v6;
  PersistenceManager *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PersistenceManager;
  v6 = -[PersistenceManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locations, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, "_syncDirectionsCacheIfNeeded", UIApplicationProtectedDataDidBecomeAvailable, 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v9, "addTileGroupObserver:queue:", v7, &_dispatch_main_q);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)PersistenceManager;
  -[PersistenceManager dealloc](&v5, "dealloc");
}

- (id)readPins
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths pinsSettingsPath](self->_locations, "pinsSettingsPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PinsKey")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc((Class)MSPPinStorage);
        v13 = objc_msgSend(v12, "initWithData:", v11, (_QWORD)v16);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  return v14;
}

- (BOOL)writePins:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "arrayByApplyingSelector:", "data"));
  v13[0] = CFSTR("PinsKey");
  v13[1] = CFSTR("PinsVersion");
  v14[0] = v6;
  v14[1] = &off_10126D390;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths pinsSettingsPath](self->_locations, "pinsSettingsPath"));
  v12 = 0;
  v9 = objc_msgSend(v7, "_maps_writeBinaryPlist:error:", v8, &v12);
  v10 = v12;

  if (*a4)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

- (id)readRoutingAppLaunchRecord
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  RoutingAppLaunchRecord *v8;
  id v9;
  void *v10;
  id v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths routingAppLaunchRecordPath](self->_locations, "routingAppLaunchRecordPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (!v5)
  {
    v6 = 0;
    goto LABEL_8;
  }
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v3, 1, &v13));
  if (v13)
    -[PersistenceManager deleteRoutingAppLaunchRecord](self, "deleteRoutingAppLaunchRecord");
  if (!v6)
    goto LABEL_8;
  v12 = 0;
  v7 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(RoutingAppLaunchRecord), v6, &v12);
  v8 = (RoutingAppLaunchRecord *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v12;
  if (v9)
  {
    v10 = v9;

LABEL_8:
    v8 = objc_alloc_init(RoutingAppLaunchRecord);
  }

  return v8;
}

- (BOOL)writeRoutingAppLaunchRecord:(id)a3 error:(id *)a4
{
  MSPMapsPaths *locations;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  id v14;

  locations = self->_locations;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths routingAppLaunchRecordPath](locations, "routingAppLaunchRecordPath"));
  -[PersistenceManager deleteRoutingAppLaunchRecord](self, "deleteRoutingAppLaunchRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0));

  if (v9)
  {
    v14 = 0;
    v10 = 1;
    objc_msgSend(v9, "writeToFile:options:error:", v8, 1, &v14);
    v11 = v14;
    v12 = v11;
    if (v11)
    {
      if (*a4)
      {
        v10 = 0;
        *a4 = objc_retainAutorelease(v11);
      }
      else
      {
        v10 = 1;
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)deleteRoutingAppLaunchRecord
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths routingAppLaunchRecordPath](self->_locations, "routingAppLaunchRecordPath"));
  if (objc_msgSend(v5, "fileExistsAtPath:", v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    objc_msgSend(v4, "removeItemAtPath:error:", v3, 0);

  }
}

- (id)cacheKeyForWaypoints:(id)a3
{
  id v3;
  id v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  void *i;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = CFSTR("T");
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isCurrentLocation"))
        {
          v10 = v6;
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("|C")));
        }
        else
        {
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "locationForWaypoint"));
          if (!v11)
          {

            v17 = 0;
            goto LABEL_16;
          }
          v10 = v11;
          -[__CFString lat](v11, "lat");
          v13 = v12;
          -[__CFString lng](v10, "lng");
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("|%f%f"), v13, v14, (_QWORD)v19));
          v16 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v15));

          v6 = (__CFString *)v16;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = CFSTR("T");
  }

  v6 = v6;
  v17 = v6;
LABEL_16:

  return v17;
}

- (BOOL)addDataToDirectionsCache:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *directionsCache;
  NSDictionary *v19;
  _QWORD v21[2];
  _QWORD v22[2];

  v8 = a3;
  v9 = a4;
  -[PersistenceManager _cleanDirectionsCache](self, "_cleanDirectionsCache");
  v10 = objc_msgSend(v8, "count");
  if (v9)
    v11 = v10 == (id)2;
  else
    v11 = 0;
  v12 = v11;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PersistenceManager directionsCache](self, "directionsCache"));
    v14 = objc_msgSend(v13, "mutableCopy");

    v21[0] = CFSTR("d");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v21[1] = CFSTR("a");
    v22[0] = v15;
    v22[1] = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 2));

    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, v9);
    if (-[PersistenceManager _writeDirectionsCache:error:](self, "_writeDirectionsCache:error:", v14, a5))
    {
      v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v14));
      directionsCache = self->_directionsCache;
      self->_directionsCache = v17;
    }
    else
    {
      objc_storeStrong((id *)&self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, a4);
      v19 = v16;
      directionsCache = self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
      self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = v19;
    }

  }
  return v12;
}

- (id)directionsCacheDataArrayForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PersistenceManager _cleanDirectionsCache](self, "_cleanDirectionsCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PersistenceManager directionsCache](self, "directionsCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("a")));
  else
    v7 = 0;

  return v7;
}

- (id)directionsCache
{
  NSDictionary *directionsCache;
  NSDictionary *v3;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *v20;
  NSDictionary *v22;
  NSDictionary *v23;
  NSDictionary *v24;
  uint64_t v25;

  directionsCache = self->_directionsCache;
  if (directionsCache)
  {
    v3 = directionsCache;
LABEL_8:
    v20 = v3;
    return v20;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = objc_msgSend(v5, "isProtectedDataAvailable");

  if ((v6 & 1) == 0)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths directionsCachePath](self->_locations, "directionsCachePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if (v9)
  {
    v25 = 0;
    v10 = objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v7, 1, &v25));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_opt_class(NSDictionary);
      v13 = objc_opt_class(NSString);
      v14 = objc_opt_class(NSDate);
      v15 = objc_opt_class(NSArray);
      v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, v15, objc_opt_class(NSData), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v17, v11, 0));
      v19 = self->_directionsCache;
      self->_directionsCache = v18;

    }
    else
    {
      -[PersistenceManager _deleteDirectionsCacheFile](self, "_deleteDirectionsCacheFile");
    }
  }
  v22 = self->_directionsCache;
  if (!v22)
  {
    v23 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    v24 = self->_directionsCache;
    self->_directionsCache = v23;

    v22 = self->_directionsCache;
  }
  v20 = v22;

  return v20;
}

- (void)_syncDirectionsCacheIfNeeded
{
  void *v3;
  id v4;
  unsigned int v5;
  id v6;
  NSDictionary *directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
  NSString *directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
  id v9;

  if (self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PersistenceManager directionsCache](self, "directionsCache"));
    v4 = objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked);
    v9 = 0;
    v5 = -[PersistenceManager _writeDirectionsCache:error:](self, "_writeDirectionsCache:error:", v4, &v9);
    v6 = v9;
    if (v5)
    {
      directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
      self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = 0;

      directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked;
      self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked = 0;

    }
  }
}

- (BOOL)_writeDirectionsCache:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  id v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v8 = objc_msgSend(v7, "isProtectedDataAvailable");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths directionsCachePath](self->_locations, "directionsCachePath"));
    -[PersistenceManager _deleteDirectionsCacheFile](self, "_deleteDirectionsCacheFile");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0));
    v11 = v10;
    if (v10)
    {
      v16 = 0;
      objc_msgSend(v10, "writeToFile:options:error:", v9, 536870913, &v16);
      v12 = v16;
      v13 = v12;
      if (v12 && *a4)
      {
        v14 = 0;
        *a4 = objc_retainAutorelease(v12);
      }
      else
      {
        v14 = 1;
      }

    }
    else
    {
      v14 = 0;
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 256, 0));
    }

  }
  else
  {
    v14 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 257, 0));
  }

  return v14;
}

- (void)_cleanDirectionsCache
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSDate *v13;
  void *v14;
  id v15;
  NSDictionary *v16;
  NSDictionary *directionsCache;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  if (self->_directionsCache)
  {
    v3 = objc_alloc((Class)NSMutableDictionary);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PersistenceManager directionsCache](self, "directionsCache"));
    v18 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[PersistenceManager directionsCache](self, "directionsCache"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v21;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[PersistenceManager directionsCache](self, "directionsCache", v18));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("d")));
          v13 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -GEOConfigGetDouble(MapsConfig_DirectionsCacheInterval, off_1014B3028));
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          v15 = objc_msgSend(v12, "compare:", v14);

          if (v15 == (id)1)
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, v9);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v18));
    directionsCache = self->_directionsCache;
    self->_directionsCache = v16;

  }
}

- (void)_deleteDirectionsCacheFile
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSPMapsPaths directionsCachePath](self->_locations, "directionsCachePath"));
  if (objc_msgSend(v3, "fileExistsAtPath:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v6 = 0;
    objc_msgSend(v5, "removeItemAtPath:error:", v4, &v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsCacheKeyThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, 0);
  objc_storeStrong((id *)&self->_directionsCacheObjectThatFailedToBeWrittenBecauseTheDeviceWasLockedLastTimeWeChecked, 0);
  objc_storeStrong((id *)&self->_directionsCache, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
