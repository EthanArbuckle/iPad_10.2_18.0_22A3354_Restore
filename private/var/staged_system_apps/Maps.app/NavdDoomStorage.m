@implementation NavdDoomStorage

- (NavdDoomStorage)init
{
  NavdDoomStorage *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dict;
  NavdDoomStorage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavdDoomStorage;
  v2 = -[NavdDoomStorage init](&v7, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 12);
    dict = v2->_dict;
    v2->_dict = v3;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_dict, "setObject:forKeyedSubscript:", &off_1012709D8, CFSTR("NavdDoomStorageKeyVersion"));
    v5 = v2;
  }

  return v2;
}

- (id)_readObjectFromKey:(unint64_t)a3
{
  NavdDoomStorage *v4;
  const __CFString *v5;
  void *v6;

  v4 = self;
  objc_sync_enter(v4);
  if (a3 - 1 > 0x12)
    v5 = CFSTR("NavdDoomStorageKeyUnknown");
  else
    v5 = *(&off_1011E6E78 + a3 - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_dict, "objectForKeyedSubscript:", v5));
  objc_sync_exit(v4);

  return v6;
}

- (void)_writeObject:(id)a3 toKey:(unint64_t)a4 updateModTime:(BOOL)a5
{
  _BOOL4 v5;
  NavdDoomStorage *v8;
  id v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v5 = a5;
  v14 = a3;
  v8 = self;
  objc_sync_enter(v8);
  v9 = objc_msgSend(v14, "copy");
  if (a4 - 1 > 0x12)
    v10 = CFSTR("NavdDoomStorageKeyUnknown");
  else
    v10 = *(&off_1011E6E78 + a4 - 1);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_dict, "setObject:forKeyedSubscript:", v9, v10);

  if (v5)
  {
    v11 = MapsSuggestionsNow();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v12, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_dict, "setObject:forKeyedSubscript:", v13, CFSTR("NavdDoomStorageKeyMostRecentModification"));

  }
  objc_sync_exit(v8);

}

- (unint64_t)version
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 1));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (NSDate)mostRecentStart
{
  return (NSDate *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 2);
}

- (void)setMostRecentStart:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 2, 0);
}

- (NSDate)mostRecentModification
{
  return (NSDate *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 3);
}

- (unint64_t)status
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentAlert](self, "mostRecentAlert"));

  if (v3)
    return 5;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentRoutesPerDestination](self, "mostRecentRoutesPerDestination"));

  if (v5)
    return 4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDestinations](self, "mostRecentDestinations"));

  if (v6)
    return 3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));

  if (v7)
    return 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentExitTime](self, "mostRecentExitTime"));
  v4 = v8 != 0;

  return v4;
}

- (CLLocation)mostRecentLocation
{
  return (CLLocation *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 5);
}

- (void)setMostRecentLocation:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 5, 1);
}

- (NSDate)mostRecentExitTime
{
  return (NSDate *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 6);
}

- (void)setMostRecentExitTime:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 6, 1);
}

- (NSDateInterval)mostRecentDoomWindow
{
  return (NSDateInterval *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 7);
}

- (void)setMostRecentDoomWindow:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 7, 1);
}

- (NSArray)mostRecentDestinations
{
  return (NSArray *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 8);
}

- (void)setMostRecentDestinations:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 8, 1);
}

- (NSDictionary)mostRecentRoutesPerDestination
{
  return (NSDictionary *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 9);
}

- (void)setMostRecentRoutesPerDestination:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 9, 1);
}

- (NSSet)cachedIncidents
{
  return (NSSet *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 18);
}

- (void)setCachedIncidents:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 18, 1);
}

- (NSDate)nextAllowedRequestTime
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 19));
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = MapsSuggestionsNow();
    v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }
  v6 = v4;

  return (NSDate *)v6;
}

- (void)setNextAllowedRequestTime:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 19, 0);
}

- (NSDate)mostRecentAlert
{
  return (NSDate *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 10);
}

- (void)setMostRecentAlert:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 10, 1);
}

- (NSDate)nextWakeup
{
  return (NSDate *)-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 11);
}

- (void)setNextWakeup:(id)a3
{
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:", a3, 11, 1);
}

- (unint64_t)numberOfUpdatesToExitTime
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 12));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setNumberOfUpdatesToExitTime:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");

}

- (unint64_t)numberOfUpdatesToDestinations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 13));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setNumberOfUpdatesToDestinations:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");

}

- (unint64_t)numberOfUpdatesToRoutesPerDestination
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 14));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setNumberOfUpdatesToRoutesPerDestination:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");

}

- (unint64_t)numberOfDirectionRequests
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 15));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setNumberOfDirectionRequests:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");

}

- (unint64_t)numberOfAlertableRoutes
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 16));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setNumberOfAlertableRoutes:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");

}

- (unint64_t)reasonForEnd
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage _readObjectFromKey:](self, "_readObjectFromKey:", 17));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (void)setReasonForEnd:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  -[NavdDoomStorage _writeObject:toKey:updateModTime:](self, "_writeObject:toKey:updateModTime:");

}

- (void)completeWindowBecause:(unint64_t)a3
{
  uint64_t Log;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint8_t v24[24];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomStorage");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = CFSTR("NavdDoomStorageReasonUnknown");
    if (a3 == 1)
      v7 = CFSTR("NavdDoomStorageReasonWindowExpired");
    if (a3 == 2)
      v7 = CFSTR("NavdDoomStorageReasonNewLOI");
    *(_DWORD *)v24 = 138412290;
    *(_QWORD *)&v24[4] = v7;
    v8 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "completeWindowBecause:%@", v24, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));
  v10 = v9 == 0;

  if (!v10)
  {
    v11 = objc_alloc((Class)NSDateInterval);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startDate"));
    v15 = MapsSuggestionsNow(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "earlierDate:", v16));
    v18 = objc_msgSend(v17, "copy");
    v20 = MapsSuggestionsNow(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_msgSend(v21, "copy");
    v23 = objc_msgSend(v11, "initWithStartDate:endDate:", v18, v22);
    -[NavdDoomStorage setMostRecentDoomWindow:](self, "setMostRecentDoomWindow:", v23);

  }
  -[NavdDoomStorage setReasonForEnd:](self, "setReasonForEnd:", a3, *(_OWORD *)v24);
}

- (NSString)statusString
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;

  switch(-[NavdDoomStorage status](self, "status"))
  {
    case 1uLL:
      v3 = &stru_1011EB268;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));

      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" (DoomWindow = %@)"), v5));

      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentExitTime](self, "mostRecentExitTime"));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DOoM ExitTime := %@%@"), v6, v3));

      goto LABEL_11;
    case 2uLL:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DOoM DoomWindow := %@"), v3));
      goto LABEL_10;
    case 3uLL:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDestinations](self, "mostRecentDestinations"));
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DOoM Destinations := %@"), v3));
      goto LABEL_10;
    case 4uLL:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentRoutesPerDestination](self, "mostRecentRoutesPerDestination"));
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DOoM Routes := %@"), v3));
      goto LABEL_10;
    case 5uLL:
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentAlert](self, "mostRecentAlert"));
      v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DOoM Alert := %@"), v3));
LABEL_10:
      v7 = (__CFString *)v8;
LABEL_11:

      break;
    default:
      v7 = CFSTR("DOoM Initialized");
      break;
  }
  return (NSString *)v7;
}

- (void)clear
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NavdDoomStorage *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage cachedIncidents](obj, "cachedIncidents"));
  v3 = objc_msgSend(v2, "copy");

  v4 = -[NSMutableDictionary removeAllObjects](obj->_dict, "removeAllObjects");
  v6 = MapsSuggestionsNow(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](obj->_dict, "setObject:forKeyedSubscript:", v8, CFSTR("NavdDoomStorageKeyMostRecentStart"));

  v11 = MapsSuggestionsNow(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](obj->_dict, "setObject:forKeyedSubscript:", v13, CFSTR("NavdDoomStorageKeyMostRecentModification"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](obj->_dict, "setObject:forKeyedSubscript:", v3, CFSTR("NavdDoomStorageKeyCachedIncidents"));
  objc_sync_exit(obj);

}

- (NSString)JSONString
{
  NavdDoomStorage *v2;
  void *v3;
  id v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v2->_dict, 0, 0));
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (void)updateWithIncidents:(id)a3
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v20 = a3;
  v4 = objc_opt_new(NSMutableSet);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage cachedIncidents](self, "cachedIncidents"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "expiryDate"));
        v11 = MapsSuggestionsIsInTheFuture();

        if (v11)
          -[NSMutableSet addObject:](v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v20;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "expiryDate"));
        if (MapsSuggestionsIsInTheFuture())
        {
          v18 = -[NSMutableSet containsObject:](v4, "containsObject:", v16);

          if ((v18 & 1) == 0)
            -[NSMutableSet addObject:](v4, "addObject:", v16);
        }
        else
        {

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  v19 = -[NSMutableSet copy](v4, "copy");
  -[NavdDoomStorage setCachedIncidents:](self, "setCachedIncidents:", v19);

}

- (id)newIncidentsForDestination:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  uint64_t Log;
  NSObject *v13;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage cachedIncidents](self, "cachedIncidents"));
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("shouldSuppress == 0 AND destinationID = %@"), v7));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage cachedIncidents](self, "cachedIncidents"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredSetUsingPredicate:", v8));
      v11 = (NSSet *)objc_msgSend(v10, "copy");

    }
    else
    {
      v11 = objc_opt_new(NSSet);
    }
  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomStorage");
    v13 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomStorage.mm";
      v17 = 1024;
      v18 = 485;
      v19 = 2082;
      v20 = "-[NavdDoomStorage newIncidentsForDestination:]";
      v21 = 2082;
      v22 = "destination == nil";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Destination must not be nil", buf, 0x26u);
    }

    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NavdDoomStorage)initWithCoder:(id)a3
{
  NavdDoomStorage *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *dict;
  NavdDoomStorage *v21;
  uint64_t Log;
  NSObject *v23;
  uint64_t v25;
  id v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  int v30;

  v26 = a3;
  v4 = -[NavdDoomStorage init](self, "init");
  if (v4)
  {
    v25 = objc_opt_class(NSDictionary);
    v5 = objc_opt_class(NSArray);
    v6 = objc_opt_class(NSSet);
    v7 = objc_opt_class(NSString);
    v8 = objc_opt_class(NSDate);
    v9 = objc_opt_class(NSNumber);
    v10 = objc_opt_class(CLLocation);
    v11 = objc_opt_class(NSDateInterval);
    v12 = objc_opt_class(MapsSuggestionsEntry);
    v13 = objc_opt_class(GEOWaypointRoute);
    v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(NavdDoomIncident), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "decodeObjectOfClasses:forKey:", v15, CFSTR("navdDoomStorageDict")));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_dict, "objectForKeyedSubscript:", CFSTR("NavdDoomStorageKeyVersion")));
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (v18 == (id)1)
    {
      v19 = (NSMutableDictionary *)objc_msgSend(v16, "mutableCopy");
      dict = v4->_dict;
      v4->_dict = v19;

    }
    else
    {
      Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "NavdDoomStorage");
      v23 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v28 = (int)v18;
        v29 = 1024;
        v30 = 1;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Read old version %u, which is not current %u", buf, 0xEu);
      }

      v4 = -[NavdDoomStorage init](v4, "init");
    }
    v21 = v4;

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NavdDoomStorage *v4;
  id v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[NSMutableDictionary copy](v4->_dict, "copy");
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("navdDoomStorageDict"));

  objc_sync_exit(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NavdDoomStorage *v3;
  NavdDoomStorage *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *dict;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = self;
  objc_sync_enter(v3);
  v4 = objc_alloc_init(NavdDoomStorage);
  v5 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", -[NSMutableDictionary count](v3->_dict, "count"));
  dict = v4->_dict;
  v4->_dict = v5;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v3->_dict;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v3->_dict, "objectForKeyedSubscript:", v11, (_QWORD)v15));
        v13 = objc_msgSend(v12, "copy");
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_dict, "setObject:forKeyedSubscript:", v13, v11);

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  objc_sync_exit(v3);
  return v4;
}

- (id)nameForJSON
{
  return objc_msgSend((id)objc_opt_class(self), "description");
}

- (id)objectForJSON
{
  uint64_t v2;
  uint64_t v3;
  MSg *v4;
  NSDate *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  MSg *v9;
  CLLocation *v10;
  uint64_t v11;
  void *v12;
  MSg *v13;
  NSDate *v14;
  uint64_t v15;
  void *v16;
  MSg *v17;
  NSDate *v18;
  uint64_t v19;
  void *v20;
  char *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  MSg *v25;
  NSDate *v26;
  uint64_t v27;
  void *v28;
  MSg *v29;
  NSDateInterval *v30;
  uint64_t v31;
  void *v32;
  unint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  id v62;
  void *j;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *v83;
  id v84;
  void *v85;
  unsigned int v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  BOOL v92;
  uint64_t v93;
  void *v94;
  MSg *v95;
  NSDate *v96;
  uint64_t v97;
  void *v98;
  MSg *v99;
  NSDate *v100;
  uint64_t v101;
  void *v102;
  MSg *v103;
  NSDate *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  id v122;
  uint64_t v123;
  void *v124;
  id v126;
  id v128;
  uint64_t v129;
  void *v130;
  id v131;
  id obj;
  void *v133;
  void *v134;
  void *i;
  id v136;
  id v137;
  uint64_t v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[2];
  _QWORD v154[2];
  _BYTE v155[128];
  _QWORD v156[16];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  _QWORD v161[4];
  void *v162;
  void *v163;
  void *v164;
  void *v165;

  v128 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = MapsSuggestionsNow(v128, v2);
  v4 = (MSg *)objc_claimAutoreleasedReturnValue(v3);
  v6 = MSg::jsonFor(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v7, CFSTR("currentTime"));

  v8 = MapsSuggestionsMostRecentLocation();
  v9 = (MSg *)objc_claimAutoreleasedReturnValue(v8);
  v11 = MSg::jsonFor(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v12, CFSTR("currentLocation"));

  v13 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentStart](self, "mostRecentStart"));
  v15 = MSg::jsonFor(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v16, CFSTR("lastRun"));

  v17 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentModification](self, "mostRecentModification"));
  v19 = MSg::jsonFor(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v20, CFSTR("mtime"));

  v21 = (char *)-[NavdDoomStorage status](self, "status") - 1;
  if ((unint64_t)v21 > 4)
    v22 = CFSTR("Init");
  else
    v22 = *(&off_1011E6F10 + (_QWORD)v21);
  v23 = MSg::jsonFor(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v24, CFSTR("status"));

  v25 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentExitTime](self, "mostRecentExitTime"));
  v27 = MSg::jsonFor(v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v28, CFSTR("exitTime"));

  v29 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDoomWindow](self, "mostRecentDoomWindow"));
  v31 = MSg::jsonFor(v29, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v32, CFSTR("doomWindow"));

  v33 = -[NavdDoomStorage reasonForEnd](self, "reasonForEnd");
  v34 = CFSTR("NavdDoomStorageReasonUnknown");
  if (v33 == 1)
    v34 = CFSTR("NavdDoomStorageReasonWindowExpired");
  if (v33 == 2)
    v35 = CFSTR("NavdDoomStorageReasonNewLOI");
  else
    v35 = v34;
  v36 = MSg::jsonFor(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v37, CFSTR("endReason"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentDestinations](self, "mostRecentDestinations"));
  v39 = MSg::jsonFor();
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v40, CFSTR("destinations"));

  v126 = (id)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentRoutesPerDestination](self, "mostRecentRoutesPerDestination"));
  if (v126)
  {
    v41 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v126, "count"));
    v151 = 0u;
    v152 = 0u;
    v149 = 0u;
    v150 = 0u;
    obj = v126;
    v130 = v41;
    v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v155, 16);
    if (v131)
    {
      v129 = *(_QWORD *)v150;
      do
      {
        for (i = 0; i != v131; i = (char *)i + 1)
        {
          if (*(_QWORD *)v150 != v129)
            objc_enumerationMutation(obj);
          v42 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)i);
          v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", v42));
          v153[0] = CFSTR("destination");
          v43 = v42;
          v44 = v43;
          if (v43)
          {
            *(_QWORD *)&v157 = CFSTR("type");
            v45 = NSStringFromMapsSuggestionsEntryType(objc_msgSend(v43, "type"));
            v147 = (void *)objc_claimAutoreleasedReturnValue(v45);
            v46 = MSg::jsonFor(v147);
            v145 = (void *)objc_claimAutoreleasedReturnValue(v46);
            v156[0] = v145;
            *((_QWORD *)&v157 + 1) = CFSTR("title");
            v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "title"));
            v47 = MSg::jsonFor(v143);
            v141 = (void *)objc_claimAutoreleasedReturnValue(v47);
            v156[1] = v141;
            *(_QWORD *)&v158 = CFSTR("subtitle");
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "subtitle"));
            v49 = MSg::jsonFor(v48);
            v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
            v156[2] = v50;
            *((_QWORD *)&v158 + 1) = CFSTR("location");
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "numberForKey:", CFSTR("MapsSuggestionsLatitudeKey")));
            v52 = MSg::jsonFor(v51);
            v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
            v162 = v53;
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "numberForKey:", CFSTR("MapsSuggestionsLongitudeKey")));
            v55 = MSg::jsonFor(v54);
            v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
            v163 = v56;
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v162, 2));
            v156[3] = v57;
            *(_QWORD *)&v159 = CFSTR("address");
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringForKey:", CFSTR("MapsSuggestionsDestinationAddressKey")));
            v59 = MSg::jsonFor(v58);
            v60 = (void *)objc_claimAutoreleasedReturnValue(v59);
            v156[4] = v60;
            v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v156, &v157, 5));

          }
          else
          {
            v134 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          }

          v153[1] = CFSTR("routes");
          v154[0] = v134;
          v136 = v133;
          if (v136)
          {
            v61 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v136, "count"));
            v159 = 0u;
            v160 = 0u;
            v157 = 0u;
            v158 = 0u;
            v137 = v136;
            v139 = v61;
            v62 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v157, v156, 16);
            if (v62)
            {
              v138 = *(_QWORD *)v158;
              do
              {
                v140 = v62;
                for (j = 0; j != v140; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v158 != v138)
                    objc_enumerationMutation(v137);
                  v64 = *(id *)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)j);
                  v148 = v64;
                  if (v64)
                  {
                    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "outOfMapsAlertsInfo"));
                    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "alertNonRecommendedRouteText"));
                    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "responseAlertSecondary"));

                    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "outOfMapsAlertsInfo"));
                    v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "alertNonRecommendedRouteText"));
                    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v68, "responseAlertSecondary"));

                    v161[0] = CFSTR("name");
                    v69 = v148;
                    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "names"));
                    LOBYTE(v68) = objc_msgSend(v70, "count") == 0;

                    if ((v68 & 1) != 0)
                    {
                      v146 = 0;
                    }
                    else
                    {
                      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "names"));
                      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "firstObject"));
                      v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "name"));

                    }
                    v74 = MSg::jsonFor(v146);
                    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
                    v162 = v75;
                    v161[1] = CFSTR("alert1");
                    v76 = v144;
                    if (v76)
                    {
                      v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v76));
                      v78 = MSg::jsonFor(v77);
                      v79 = (void *)objc_claimAutoreleasedReturnValue(v78);

                    }
                    else
                    {
                      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                    }

                    v163 = v79;
                    v161[2] = CFSTR("alert2");
                    v80 = v142;
                    if (v80)
                    {
                      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringForServerFormattedString:](NSString, "_navigation_stringForServerFormattedString:", v80));
                      v82 = MSg::jsonFor(v81);
                      v83 = (void *)objc_claimAutoreleasedReturnValue(v82);

                    }
                    else
                    {
                      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                    }

                    v164 = v83;
                    v161[3] = CFSTR("expectedTime");
                    v84 = v69;
                    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "traversalTimes"));
                    v86 = objc_msgSend(v85, "estimatedSeconds");

                    v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v86));
                    v88 = MSg::jsonFor(v87);
                    v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
                    v165 = v89;
                    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v162, v161, 4));

                  }
                  else
                  {
                    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
                  }

                  objc_msgSend(v139, "addObject:", v73);
                }
                v62 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v157, v156, 16);
              }
              while (v62);
            }

          }
          else
          {
            v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          }

          v154[1] = v139;
          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v154, v153, 2));

          objc_msgSend(v130, "addObject:", v90);
        }
        v131 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v155, 16);
      }
      while (v131);
    }

  }
  else
  {
    v130 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  }

  objc_msgSend(v128, "setObject:forKeyedSubscript:", v130, CFSTR("routes"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage cachedIncidents](self, "cachedIncidents"));
  v93 = MSg::jsonFor((MSg *)(v91 != 0), v92);
  v94 = (void *)objc_claimAutoreleasedReturnValue(v93);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v94, CFSTR("cachedIncidents"));

  v95 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage mostRecentAlert](self, "mostRecentAlert"));
  v97 = MSg::jsonFor(v95, v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue(v97);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v98, CFSTR("alert"));

  v99 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage nextWakeup](self, "nextWakeup"));
  v101 = MSg::jsonFor(v99, v100);
  v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v102, CFSTR("nextWakeup"));

  v103 = (MSg *)objc_claimAutoreleasedReturnValue(-[NavdDoomStorage nextAllowedRequestTime](self, "nextAllowedRequestTime"));
  v105 = MSg::jsonFor(v103, v104);
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v106, CFSTR("nextAllowedRequestTime"));

  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavdDoomStorage numberOfUpdatesToExitTime](self, "numberOfUpdatesToExitTime")));
  v108 = MSg::jsonFor(v107);
  v109 = (void *)objc_claimAutoreleasedReturnValue(v108);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v109, CFSTR("numberOfUpdatesToExitTime"));

  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavdDoomStorage numberOfUpdatesToDestinations](self, "numberOfUpdatesToDestinations")));
  v111 = MSg::jsonFor(v110);
  v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v112, CFSTR("numberOfUpdatesToDestinations"));

  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavdDoomStorage numberOfUpdatesToRoutes](self, "numberOfUpdatesToRoutes")));
  v114 = MSg::jsonFor(v113);
  v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v115, CFSTR("numberOfUpdatesToRoutes"));

  v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavdDoomStorage numberOfDirectionRequests](self, "numberOfDirectionRequests")));
  v117 = MSg::jsonFor(v116);
  v118 = (void *)objc_claimAutoreleasedReturnValue(v117);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v118, CFSTR("numberOfDirectionRequests"));

  v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NavdDoomStorage numberOfAlertableRoutes](self, "numberOfAlertableRoutes")));
  v120 = MSg::jsonFor(v119);
  v121 = (void *)objc_claimAutoreleasedReturnValue(v120);
  objc_msgSend(v128, "setObject:forKeyedSubscript:", v121, CFSTR("numberOfAlertableRoutes"));

  v122 = objc_msgSend(v128, "copy");
  v123 = MSg::jsonFor();
  v124 = (void *)objc_claimAutoreleasedReturnValue(v123);

  return v124;
}

- (unint64_t)numberOfUpdatesToRoutes
{
  return self->_numberOfUpdatesToRoutes;
}

- (void)setNumberOfUpdatesToRoutes:(unint64_t)a3
{
  self->_numberOfUpdatesToRoutes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
}

@end
