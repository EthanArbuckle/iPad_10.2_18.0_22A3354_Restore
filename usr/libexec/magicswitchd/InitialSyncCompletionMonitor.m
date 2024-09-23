@implementation InitialSyncCompletionMonitor

- (InitialSyncCompletionMonitor)init
{
  NSObject *v2;
  NSMutableSet *v3;
  NSMutableSet *pendingRequests;
  uint64_t v5;
  NSMapTable *observers;
  NSMutableDictionary *v7;
  NSMutableDictionary *cachedInitialSyncStateByPairingID;
  PSYInitialSyncStateObserver *v9;
  PSYInitialSyncStateObserver *initialSyncCompletionObserver;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  InitialSyncCompletionMonitor *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  _QWORD v27[2];
  uint8_t buf[4];
  InitialSyncCompletionMonitor *v29;

  v25.receiver = self;
  v25.super_class = (Class)InitialSyncCompletionMonitor;
  v20 = -[InitialSyncCompletionMonitor init](&v25, "init");
  if (v20)
  {
    v2 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = v20;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Initializing (%p)", buf, 0xCu);
    }
    v3 = objc_opt_new(NSMutableSet);
    pendingRequests = v20->_pendingRequests;
    v20->_pendingRequests = v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    observers = v20->_observers;
    v20->_observers = (NSMapTable *)v5;

    v7 = objc_opt_new(NSMutableDictionary);
    cachedInitialSyncStateByPairingID = v20->_cachedInitialSyncStateByPairingID;
    v20->_cachedInitialSyncStateByPairingID = v7;

    v9 = (PSYInitialSyncStateObserver *)objc_msgSend(objc_alloc((Class)PSYInitialSyncStateObserver), "initWithDelegate:", v20);
    initialSyncCompletionObserver = v20->_initialSyncCompletionObserver;
    v20->_initialSyncCompletionObserver = v9;

    v27[0] = NRPairedDeviceRegistryDeviceDidUnpairNotification;
    v27[1] = NRPairedDeviceRegistryDeviceDidFailToPairNotification;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
          objc_msgSend(v17, "addObserver:selector:name:object:", v20, "handleNanoRegistryNotificationDeviceDidUnpair:", v16, v18);

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v13);
    }

  }
  return v20;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  InitialSyncCompletionMonitor *v7;

  v3 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Deallocating (%p)", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)InitialSyncCompletionMonitor;
  -[InitialSyncCompletionMonitor dealloc](&v5, "dealloc");
}

- (void)registerObserver:(id)a3 device:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForProperty:", NRDevicePropertyPairingID));
  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8));
    if (!v7)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 1);
      -[NSMapTable setObject:forKey:](self->_observers, "setObject:forKey:", v7, v8);
    }
    objc_msgSend(v7, "addObject:", v6);
    -[InitialSyncCompletionMonitor requestInitialSyncStateForPairingID:](self, "requestInitialSyncStateForPairingID:", v6);

  }
}

- (void)unregisterObserver:(id)a3 device:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForProperty:", NRDevicePropertyPairingID));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v9));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "removeObject:", v6);
      if (!objc_msgSend(v8, "count"))
        -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", v9);
    }

  }
}

- (void)unregisterObserver:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (BOOL)hasCachedInitialSyncCompletionStateForDevice:(id)a3 state:(BOOL *)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForProperty:", NRDevicePropertyPairingID));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_cachedInitialSyncStateByPairingID, "objectForKey:", v6))) != 0)
  {
    v8 = v7;
    if (a4)
      *a4 = objc_msgSend(v7, "BOOLValue");

    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)requestInitialSyncStateForPairingID:(id)a3
{
  id v4;
  NSObject *v5;
  PSYInitialSyncStateObserver *initialSyncCompletionObserver;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_pendingRequests, "containsObject:", v4) & 1) == 0)
  {
    -[NSMutableSet addObject:](self->_pendingRequests, "addObject:", v4);
    v5 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Requesting initial sync state for pairingID: (%@)", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    initialSyncCompletionObserver = self->_initialSyncCompletionObserver;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008864;
    v7[3] = &unk_1000185D8;
    objc_copyWeak(&v9, (id *)buf);
    v8 = v4;
    -[PSYInitialSyncStateObserver requestInitialNonMigrationSyncStateForPairingIdentifier:completion:](initialSyncCompletionObserver, "requestInitialNonMigrationSyncStateForPairingIdentifier:completion:", v8, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }

}

- (void)handleInitialSyncStateForPairingID:(id)a3 hasCompleted:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSMutableDictionary *cachedInitialSyncStateByPairingID;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109634;
    v13[1] = v6;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Received initial sync state (%d) for pairingID: (%@); error: (%@)",
      (uint8_t *)v13,
      0x1Cu);
  }
  if (!v9)
  {
    -[NSMutableSet removeObject:](self->_pendingRequests, "removeObject:", v8);
    cachedInitialSyncStateByPairingID = self->_cachedInitialSyncStateByPairingID;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    -[NSMutableDictionary setObject:forKey:](cachedInitialSyncStateByPairingID, "setObject:forKey:", v12, v8);

    if (v6)
      -[InitialSyncCompletionMonitor notifyObserversInitialSyncDidCompleteForPairingID:](self, "notifyObserversInitialSyncDidCompleteForPairingID:", v8);
  }

}

- (void)retryPendingRequests
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];

  if (-[NSMutableSet count](self->_pendingRequests, "count"))
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Retrying pending Initial Sync completion requests", buf, 2u);
    }
    v4 = -[NSMutableSet copy](self->_pendingRequests, "copy");
    -[NSMutableSet removeAllObjects](self->_pendingRequests, "removeAllObjects");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
          -[InitialSyncCompletionMonitor requestInitialSyncStateForPairingID:](self, "requestInitialSyncStateForPairingID:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)notifyObserversInitialSyncDidCompleteForPairingID:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMapTable *v14;
  NSMapTable *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  void *v21;
  NSMapTable *observers;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = a3;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = -[NSMapTable copy](self->_observers, "copy");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v10));
        if (objc_msgSend(v11, "containsObject:", v4))
        {
          objc_msgSend(v11, "removeObject:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "deviceForPairingID:", v4));

          if (v13)
            objc_msgSend(v10, "initialSyncDidCompleteForDevice:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

  v14 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_observers;
  v16 = -[NSMapTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v20, (_QWORD)v23));
        if (objc_msgSend(v21, "count"))
          -[NSMapTable setObject:forKey:](v14, "setObject:forKey:", v21, v20);

      }
      v17 = -[NSMapTable countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v17);
  }

  observers = self->_observers;
  self->_observers = v14;

}

- (void)forgetPairingID:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  NSMapTable *observers;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  -[NSMutableSet removeObject:](self->_pendingRequests, "removeObject:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_cachedInitialSyncStateByPairingID, "removeObjectForKey:", v4);
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_observers;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v11, (_QWORD)v14));
        if (objc_msgSend(v12, "containsObject:", v4))
        {
          objc_msgSend(v12, "removeObject:", v4);
          if (objc_msgSend(v12, "count"))
            -[NSMapTable setObject:forKey:](v5, "setObject:forKey:", v12, v11);
        }

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  observers = self->_observers;
  self->_observers = v5;

}

- (void)handleNanoRegistryNotificationDeviceDidUnpair:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Received notification: %@", buf, 0xCu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", NRPairedDeviceRegistryDevice));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", NRDevicePropertyPairingID));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "workQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000915C;
    v13[3] = &unk_100018600;
    v13[4] = self;
    v14 = v10;
    dispatch_async(v12, v13);

  }
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009270;
  block[3] = &unk_100018628;
  objc_copyWeak(&v13, &location);
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)initialSyncStateObserverClientCanRetryFailedRequests:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000943C;
  v7[3] = &unk_1000184D0;
  objc_copyWeak(&v8, &location);
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (NSMutableSet)pendingRequests
{
  return self->_pendingRequests;
}

- (void)setPendingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequests, a3);
}

- (NSMutableDictionary)cachedInitialSyncStateByPairingID
{
  return self->_cachedInitialSyncStateByPairingID;
}

- (void)setCachedInitialSyncStateByPairingID:(id)a3
{
  objc_storeStrong((id *)&self->_cachedInitialSyncStateByPairingID, a3);
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (PSYInitialSyncStateObserver)initialSyncCompletionObserver
{
  return self->_initialSyncCompletionObserver;
}

- (void)setInitialSyncCompletionObserver:(id)a3
{
  objc_storeStrong((id *)&self->_initialSyncCompletionObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSyncCompletionObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cachedInitialSyncStateByPairingID, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
