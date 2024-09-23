@implementation VirtualGaragePersister

- (VirtualGaragePersister)init
{
  VirtualGaragePersister *v2;
  VirtualGaragePersister *v3;
  NSString *v4;
  id v5;
  const char *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  void *v11;
  uint64_t v12;
  NSArray *storeSubscriptionTypes;
  objc_super v15;
  uint64_t v16;

  v15.receiver = self;
  v15.super_class = (Class)VirtualGaragePersister;
  v2 = -[VirtualGaragePersister init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.Navigation.persister.%@.%p"), objc_opt_class(v2), v2);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v4));
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create(v6, v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncStore sharedStore](_TtC8MapsSync13MapsSyncStore, "sharedStore"));
    objc_msgSend(v11, "subscribe:", v3);

    v16 = objc_opt_class(MSVehicle);
    v12 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    storeSubscriptionTypes = v3->storeSubscriptionTypes;
    v3->storeSubscriptionTypes = (NSArray *)v12;

  }
  return v3;
}

- (void)loadVehiclesWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc_init((Class)MSVehicleRequest);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003380F8;
  v7[3] = &unk_1011B21F8;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "fetchWithCompletionHandler:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)addVehicle:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.VirtualGaragePersister");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Trying to add vehicle: %@", buf, 0xCu);
  }

  v7 = objc_msgSend(v4, "copy");
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100338444;
  v10[3] = &unk_1011AD1E8;
  objc_copyWeak(&v12, (id *)buf);
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)removeVehicle:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  id v7;
  NSObject *queue;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.VirtualGaragePersister");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Trying to remove vehicle: %@", buf, 0xCu);
  }

  v7 = objc_msgSend(v4, "copy");
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003385D8;
  v10[3] = &unk_1011AEAA0;
  v11 = v7;
  v9 = v7;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_async(queue, v10);
  objc_destroyWeak(&v12);

  objc_destroyWeak((id *)buf);
}

- (void)_removeSyncVehicle:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  NSObject *v7;
  uint64_t Log;
  void *v9;
  _QWORD block[4];
  NSObject *v11;
  uint8_t buf[4];
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10033897C;
    block[3] = &unk_1011AC860;
    v11 = v4;
    dispatch_async(queue, block);
    v7 = v11;
  }
  else
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.VirtualGaragePersister");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "identifier"));
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Vehicle: %@ not found in MapsSync storage. Ignoring the call.", buf, 0xCu);

    }
  }

}

- (void)saveVehicle:(id)a3 syncAcrossDevices:(BOOL)a4
{
  id v6;
  uint64_t Log;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  NSObject *queue;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.VirtualGaragePersister");
  v8 = objc_claimAutoreleasedReturnValue(Log);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Trying to save vehicle: %@", buf, 0xCu);
    }

    v10 = objc_msgSend(v6, "copy");
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100338D40;
    v12[3] = &unk_1011AD1E8;
    objc_copyWeak(&v14, (id *)buf);
    v6 = v10;
    v13 = v6;
    dispatch_async(queue, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Persister won't save vehicle, as we don't want it to sync: %@", buf, 0xCu);
    }

  }
}

- (id)persistedVehicleForVehicle:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_lastPersistedVehicles;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier", (_QWORD)v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setSelectedVehicleIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setObject:forKey:", v3, CFSTR("VGVirtualGarageSelectedVehicleStorageKey"));

}

- (NSString)selectedVehicleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("VGVirtualGarageSelectedVehicleStorageKey")));

  return (NSString *)v3;
}

- (void)_addOrEditVehicle:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id location;
  void *v18;
  uint8_t buf[4];
  id v20;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "com.apple.Maps.VirtualGaragePersister");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Trying to add or edit vehicle: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v18 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSyncQueryPredicate queryPredicateWithFormat:argumentArray:](_TtC8MapsSync22MapsSyncQueryPredicate, "queryPredicateWithFormat:argumentArray:", CFSTR("vehicleIdentifier == %@"), v8));

  v10 = objc_msgSend(objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions), "initWithPredicate:sortDescriptors:range:", v9, 0, 0);
  v11 = objc_alloc_init((Class)MSVehicleRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1003391C0;
  v13[3] = &unk_1011B22B0;
  objc_copyWeak(&v15, (id *)buf);
  objc_copyWeak(&v16, &location);
  v12 = v4;
  v14 = v12;
  objc_msgSend(v11, "fetchWithOptions:completionHandler:", v10, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

- (id)_processUpdatedSyncVehicles:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *v12;
  void *v13;
  uint64_t Log;
  NSObject *v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  NSMutableArray *v26;
  _BYTE v27[128];

  v4 = a3;
  v20 = objc_opt_new(NSMutableArray);
  v5 = objc_opt_new(NSMutableSet);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  v8 = DefaultLoggingSubsystem;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(NSMutableArray **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray vehicleIdentifier](v12, "vehicleIdentifier"));
        if (v13 && (-[NSMutableSet containsObject:](v5, "containsObject:", v13) & 1) == 0)
        {
          -[NSMutableSet addObject:](v5, "addObject:", v13);
          v16 = objc_msgSend(objc_alloc((Class)VGVehicle), "initWithMapsSyncVehicle:", v12);
          -[NSMutableArray addObject:](v20, "addObject:", v16);

        }
        else
        {
          Log = GEOFindOrCreateLog(v8, "com.apple.Maps.VirtualGaragePersister");
          v15 = objc_claimAutoreleasedReturnValue(Log);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Discard duplicate vehicle: %@", buf, 0xCu);
          }

          -[VirtualGaragePersister _removeSyncVehicle:](self, "_removeSyncVehicle:", v12);
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  v17 = GEOFindOrCreateLog(v8, "com.apple.Maps.VirtualGaragePersister");
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Loaded vehicles: %@", buf, 0xCu);
  }

  return v20;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10033A070;
  v5[3] = &unk_1011AD9D0;
  objc_copyWeak(&v6, &location);
  -[VirtualGaragePersister loadVehiclesWithCompletion:](self, "loadVehiclesWithCompletion:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

- (VGVirtualGaragePersistingDelegate)delegate
{
  return (VGVirtualGaragePersistingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastPersistedVehicles, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
