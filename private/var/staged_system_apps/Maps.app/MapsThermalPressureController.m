@implementation MapsThermalPressureController

+ (MapsThermalPressureController)sharedController
{
  if (qword_1014D3AC8 != -1)
    dispatch_once(&qword_1014D3AC8, &stru_1011DCF40);
  return (MapsThermalPressureController *)(id)qword_1014D3AC0;
}

+ (NSDictionary)mitigations
{
  if (qword_1014D3AD8 != -1)
    dispatch_once(&qword_1014D3AD8, &stru_1011DCF60);
  return (NSDictionary *)(id)qword_1014D3AD0;
}

- (MapsThermalPressureController)init
{
  id v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  id *v22;
  _QWORD *handler;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[16];
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  _BYTE v33[128];

  v32.receiver = self;
  v32.super_class = (Class)MapsThermalPressureController;
  v2 = -[MapsThermalPressureController init](&v32, "init");
  if (!v2)
    return (MapsThermalPressureController *)v2;
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.Maps.MapsThermalPressureController.isolation", v4);
  v6 = (void *)*((_QWORD *)v2 + 5);
  *((_QWORD *)v2 + 5) = v5;

  v7 = objc_opt_new(NSMutableDictionary);
  v8 = (void *)*((_QWORD *)v2 + 1);
  *((_QWORD *)v2 + 1) = v7;

  v9 = objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___ThermalPressureObserver, *((_QWORD *)v2 + 5));
  v10 = (void *)*((_QWORD *)v2 + 2);
  *((_QWORD *)v2 + 2) = v9;

  objc_initWeak(&location, v2);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100971744;
  v29[3] = &unk_1011BCB28;
  v22 = &v30;
  objc_copyWeak(&v30, &location);
  handler = objc_retainBlock(v29);
  if (notify_register_dispatch(kOSThermalNotificationPressureLevelName, (int *)v2 + 7, *((dispatch_queue_t *)v2 + 5), handler))
  {
    v11 = sub_100971770();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to register for thermal pressure notifications", buf, 2u);
    }
  }
  else
  {
    if (!notify_get_state(*((_DWORD *)v2 + 7), (uint64_t *)v2 + 4))
    {
      *((_BYTE *)v2 + 24) = 1;
      goto LABEL_11;
    }
    v13 = sub_100971770();
    v12 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to initialize thermal pressure state", buf, 2u);
    }
  }

LABEL_11:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = objc_msgSend((id)objc_opt_class(v2), "mitigations");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("NavigationDisableLockScreen"), v22, handler, (_QWORD)v24))
        {
          _GEOConfigAddDelegateListenerForKey(MapsConfig_LockscreenThermalMitigationThreshold, off_1014B5128, *((_QWORD *)v2 + 5), v2);
        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          objc_msgSend(v20, "addObserver:forKeyPath:options:context:", v2, v19, 0, &off_1011DCF80);

        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v16);
  }

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  return (MapsThermalPressureController *)v2;
}

- (void)dealloc
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(self), "mitigations");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NavigationDisableLockScreen")) & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          objc_msgSend(v10, "removeObserver:forKeyPath:context:", self, v9, &off_1011DCF80);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  GEOConfigRemoveDelegateListenerForAllKeys(self, v11);
  notify_cancel(self->_token);
  v12.receiver = self;
  v12.super_class = (Class)MapsThermalPressureController;
  -[MapsThermalPressureController dealloc](&v12, "dealloc");
}

- (int)currentThermalPressureLevel
{
  OS_dispatch_queue *isolationQueue;
  NSObject *v3;
  _QWORD *v4;
  const char *label;
  const char *v6;
  void *v7;
  int v8;
  _QWORD v10[2];
  uint64_t (*v11)(uint64_t);
  void *v12;
  MapsThermalPressureController *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  isolationQueue = self->_isolationQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v11 = sub_100971A40;
  v12 = &unk_1011ADF48;
  v13 = self;
  v14 = &v15;
  v3 = isolationQueue;
  v4 = v10;
  label = dispatch_queue_get_label(v3);
  v6 = dispatch_queue_get_label(0);
  if (label == v6 || label && v6 && !strcmp(label, v6))
  {
    v7 = objc_autoreleasePoolPush();
    v11((uint64_t)v4);
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    dispatch_sync(v3, v4);
  }

  v8 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);
  return v8;
}

- (void)addObserver:(id)a3 forMitigationNamed:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100971B2C;
  v11[3] = &unk_1011C1418;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_copyWeak(&v14, &location);
  dispatch_async(isolationQueue, v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3 forMitigationNamed:(id)a4
{
  id v6;
  id v7;
  NSObject *isolationQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100971CE8;
  v11[3] = &unk_1011C1418;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_copyWeak(&v14, &location);
  dispatch_async(isolationQueue, v11);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)addThermalPressureObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *isolationQueue;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  const char *label;
  const char *v10;
  BOOL v11;
  void *v12;
  _QWORD v13[2];
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  MapsThermalPressureController *v17;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_100971EC4;
  v15 = &unk_1011AC8B0;
  v6 = v4;
  v16 = v6;
  v17 = self;
  v7 = isolationQueue;
  v8 = v13;
  label = dispatch_queue_get_label(v7);
  v10 = dispatch_queue_get_label(0);
  if (label == v10 || (label ? (v11 = v10 == 0) : (v11 = 1), !v11 && !strcmp(label, v10)))
  {
    v12 = objc_autoreleasePoolPush();
    v14((uint64_t)v8);
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    dispatch_sync(v7, v8);
  }

}

- (void)removeThermalPressureObserver:(id)a3
{
  id v4;
  OS_dispatch_queue *isolationQueue;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  const char *label;
  const char *v10;
  BOOL v11;
  void *v12;
  _QWORD v13[2];
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  MapsThermalPressureController *v17;

  v4 = a3;
  isolationQueue = self->_isolationQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_10097206C;
  v15 = &unk_1011AC8B0;
  v6 = v4;
  v16 = v6;
  v17 = self;
  v7 = isolationQueue;
  v8 = v13;
  label = dispatch_queue_get_label(v7);
  v10 = dispatch_queue_get_label(0);
  if (label == v10 || (label ? (v11 = v10 == 0) : (v11 = 1), !v11 && !strcmp(label, v10)))
  {
    v12 = objc_autoreleasePoolPush();
    v14((uint64_t)v8);
    objc_autoreleasePoolPop(v12);
  }
  else
  {
    dispatch_sync(v7, v8);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  NSObject *isolationQueue;
  objc_super v18;
  _QWORD block[4];
  id v20;
  id v21;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &off_1011DCF80
    && (v13 = objc_msgSend((id)objc_opt_class(self), "mitigations"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13),
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allKeys")),
        v16 = objc_msgSend(v15, "containsObject:", v10),
        v15,
        v14,
        v16))
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10097227C;
    block[3] = &unk_1011AEAA0;
    v20 = v10;
    objc_copyWeak(&v21, &location);
    dispatch_async(isolationQueue, block);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)MapsThermalPressureController;
    -[MapsThermalPressureController observeValueForKeyPath:ofObject:change:context:](&v18, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (BOOL)shouldActivateMitigationNamed:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *isolationQueue;
  NSObject *v7;
  _QWORD *v8;
  const char *label;
  const char *v10;
  BOOL v11;
  void *v12;
  _QWORD v14[2];
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  MapsThermalPressureController *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  v5 = v4;
  if (self->_notifyInitialized)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    isolationQueue = self->_isolationQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v15 = sub_100972490;
    v16 = &unk_1011AE630;
    v18 = self;
    v19 = &v20;
    v17 = v4;
    v7 = isolationQueue;
    v8 = v14;
    label = dispatch_queue_get_label(v7);
    v10 = dispatch_queue_get_label(0);
    if (label == v10 || label && v10 && !strcmp(label, v10))
    {
      v12 = objc_autoreleasePoolPush();
      v15((uint64_t)v8);
      objc_autoreleasePoolPop(v12);
    }
    else
    {
      dispatch_sync(v7, v8);
    }

    v11 = *((_BYTE *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_observersOfMitigationNamed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_mitigationObservers, "objectForKeyedSubscript:", v4));
  if (!v5)
  {
    v5 = objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___ThermalPressureObserver, self->_isolationQueue);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mitigationObservers, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)_handleNotifyCallback
{
  uint32_t state;
  id v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t currentThermalPressureLevel;
  int v8;
  unint64_t v9;

  state = notify_get_state(self->_token, &self->_currentThermalPressureLevel);
  v4 = sub_100971770();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (state)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to retrieve thermal pressure level", (uint8_t *)&v8, 2u);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      currentThermalPressureLevel = self->_currentThermalPressureLevel;
      v8 = 134217984;
      v9 = currentThermalPressureLevel;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Updated _currentThermalPressureLevel to %llu", (uint8_t *)&v8, 0xCu);
    }

    -[MapsThermalPressureController _updateAllObservers](self, "_updateAllObservers");
  }
}

- (void)_updateObserversOfMitigationNamed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsThermalPressureController _observersOfMitigationNamed:](self, "_observersOfMitigationNamed:", v4));
  objc_msgSend(v5, "didUpdateMitigationNamed:", v4);

}

- (void)_updateAllObservers
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_mitigationObservers;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThermalPressureController _observersOfMitigationNamed:](self, "_observersOfMitigationNamed:", v8, (_QWORD)v10));
        objc_msgSend(v9, "didUpdateMitigationNamed:", v8);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[GEOObserverHashTable didUpdateThermalPressureLevel:](self->_thermalPressureObservers, "didUpdateThermalPressureLevel:", LODWORD(self->_currentThermalPressureLevel));
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  if (a3.var0 == (_DWORD)MapsConfig_LockscreenThermalMitigationThreshold && a3.var1 == off_1014B5128)
  {
    v5 = sub_100971770();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Mitigation changed: NavigationDisableLockScreen", v7, 2u);
    }

    -[MapsThermalPressureController _updateObserversOfMitigationNamed:](self, "_updateObserversOfMitigationNamed:", CFSTR("NavigationDisableLockScreen"));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_thermalPressureObservers, 0);
  objc_storeStrong((id *)&self->_mitigationObservers, 0);
}

@end
