@implementation DMDEventStreamDispatcher

- (DMDEventStreamDispatcher)initWithListeners:(id)a3
{
  DMDEventStreamDispatcher *v4;
  uint64_t v5;
  NSPointerArray *alarmListeners;
  NSMutableDictionary *v7;
  NSMutableDictionary *distributedNotificationNameToListenersMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *notifyMatchingNotificationToListenersMap;
  NSMutableDictionary *v11;
  NSMutableDictionary *managedSettingsGroupsToListenersMap;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSPointerArray *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];

  v22 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DMDEventStreamDispatcher;
  v4 = -[DMDEventStreamDispatcher init](&v28, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
    alarmListeners = v4->_alarmListeners;
    v4->_alarmListeners = (NSPointerArray *)v5;

    v7 = objc_opt_new(NSMutableDictionary);
    distributedNotificationNameToListenersMap = v4->_distributedNotificationNameToListenersMap;
    v4->_distributedNotificationNameToListenersMap = v7;

    v9 = objc_opt_new(NSMutableDictionary);
    notifyMatchingNotificationToListenersMap = v4->_notifyMatchingNotificationToListenersMap;
    v4->_notifyMatchingNotificationToListenersMap = v9;

    v11 = objc_opt_new(NSMutableDictionary);
    managedSettingsGroupsToListenersMap = v4->_managedSettingsGroupsToListenersMap;
    v4->_managedSettingsGroupsToListenersMap = v11;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    obj = v22;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v16, "alarms") & 1) != 0 && objc_msgSend(v16, "alarms"))
          {
            v17 = v4->_alarmListeners;
            objc_sync_enter(v17);
            -[NSPointerArray addPointer:](v4->_alarmListeners, "addPointer:", v16);
            objc_sync_exit(v17);

          }
          if ((objc_opt_respondsToSelector(v16, "distributedNotificationNames") & 1) != 0)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "distributedNotificationNames"));
            -[DMDEventStreamDispatcher _registerListener:forKeys:inMap:](v4, "_registerListener:forKeys:inMap:", v16, v18, v4->_distributedNotificationNameToListenersMap);

          }
          if ((objc_opt_respondsToSelector(v16, "notifyMatchingNotifications") & 1) != 0)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "notifyMatchingNotifications"));
            -[DMDEventStreamDispatcher _registerListener:forKeys:inMap:](v4, "_registerListener:forKeys:inMap:", v16, v19, v4->_notifyMatchingNotificationToListenersMap);

          }
          if ((objc_opt_respondsToSelector(v16, "managedSettingsGroups") & 1) != 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "managedSettingsGroups"));
            -[DMDEventStreamDispatcher _registerListener:forKeys:inMap:](v4, "_registerListener:forKeys:inMap:", v16, v20, v4->_managedSettingsGroupsToListenersMap);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v13);
    }

    -[DMDEventStreamDispatcher _registerEventStreamHandlers](v4, "_registerEventStreamHandlers");
  }

  return v4;
}

- (void)_registerEventStreamHandlers
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000421AC;
  block[3] = &unk_1000BA4B0;
  block[4] = self;
  if (qword_1000EB890 != -1)
    dispatch_once(&qword_1000EB890, block);
}

- (void)_registerListener:(id)a3 forKeys:(id)a4 inMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        v15 = v9;
        objc_sync_enter(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v14, (_QWORD)v17));
        if (!v16)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v14);
        }
        objc_msgSend(v16, "addPointer:", v7);

        objc_sync_exit(v15);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)_dispatchToListenerForKey:(id)a3 inMap:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  if (v7)
  {
    v10 = v8;
    objc_sync_enter(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v7));
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects", 0));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          if (v9)
            v9[2](v9, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15));
          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v13);
    }

    objc_sync_exit(v10);
  }

}

- (NSPointerArray)alarmListeners
{
  return self->_alarmListeners;
}

- (NSMutableDictionary)distributedNotificationNameToListenersMap
{
  return self->_distributedNotificationNameToListenersMap;
}

- (NSMutableDictionary)notifyMatchingNotificationToListenersMap
{
  return self->_notifyMatchingNotificationToListenersMap;
}

- (NSMutableDictionary)managedSettingsGroupsToListenersMap
{
  return self->_managedSettingsGroupsToListenersMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedSettingsGroupsToListenersMap, 0);
  objc_storeStrong((id *)&self->_notifyMatchingNotificationToListenersMap, 0);
  objc_storeStrong((id *)&self->_distributedNotificationNameToListenersMap, 0);
  objc_storeStrong((id *)&self->_alarmListeners, 0);
}

@end
