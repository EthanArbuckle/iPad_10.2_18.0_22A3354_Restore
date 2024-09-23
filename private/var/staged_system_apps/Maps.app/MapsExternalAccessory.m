@implementation MapsExternalAccessory

+ (id)sharedInstance
{
  if (qword_1014D3180 != -1)
    dispatch_once(&qword_1014D3180, &stru_1011C5C20);
  return (id)qword_1014D3178;
}

- (MapsExternalAccessory)init
{
  MapsExternalAccessory *v2;
  id v3;
  NSObject *v4;
  MapsExternalAccessory *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *notificationObservers;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  objc_super v42;
  _BYTE v43[128];
  _QWORD v44[4];
  uint8_t buf[4];
  void *v46;

  v42.receiver = self;
  v42.super_class = (Class)MapsExternalAccessory;
  v2 = -[MapsExternalAccessory init](&v42, "init");
  v2->_initialising = 1;
  v3 = sub_100761100();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v2;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_7;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_7:

    *(_DWORD *)buf = 138543362;
    v46 = v11;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] registering for EAAccessory notifications", buf, 0xCu);

  }
  objc_initWeak((id *)buf, v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100761DE8;
  v40[3] = &unk_1011AD288;
  objc_copyWeak(&v41, (id *)buf);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", EAAccessoryDidConnectNotification, 0, v29, v40));
  v44[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100761E30;
  v38[3] = &unk_1011AD288;
  objc_copyWeak(&v39, (id *)buf);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", EAAccessoryVehicleDataUpdateNotification, 0, v14, v38));
  v44[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100761E78;
  v36[3] = &unk_1011AD288;
  objc_copyWeak(&v37, (id *)buf);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", EAAccessoryUpdateNotification, 0, v16, v36));
  v44[2] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100761EC0;
  v34[3] = &unk_1011AD288;
  objc_copyWeak(&v35, (id *)buf);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", EAAccessoryDidDisconnectNotification, 0, v18, v34));
  v44[3] = v19;
  v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 4));
  notificationObservers = v2->_notificationObservers;
  v2->_notificationObservers = (NSArray *)v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  objc_msgSend(v22, "registerForLocalNotifications");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "connectedAccessories"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v27, "supportsCarPlay"))
        {
          -[MapsExternalAccessory setAccessory:](v2, "setAccessory:", v27);
          goto LABEL_18;
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v43, 16);
      if (v24)
        continue;
      break;
    }
  }
LABEL_18:

  -[MapsExternalAccessory _startListenForDebugTestNotifications](v2, "_startListenForDebugTestNotifications");
  v2->_initialising = 0;

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);

  objc_destroyWeak((id *)buf);
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSArray *notificationObservers;
  objc_super v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"));
  objc_msgSend(v4, "unregisterForLocalNotifications");

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_notificationObservers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v11, "removeObserver:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  notificationObservers = self->_notificationObservers;
  self->_notificationObservers = 0;

  -[MapsExternalAccessory _stopListenForDebugTestNotifications](self, "_stopListenForDebugTestNotifications");
  v13.receiver = self;
  v13.super_class = (Class)MapsExternalAccessory;
  -[MapsExternalAccessory dealloc](&v13, "dealloc");
}

- (BOOL)isConnected
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory accessory](self, "accessory"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sendDestinationInformation:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory accessory](self, "accessory"));
  objc_msgSend(v8, "sendDestinationInformation:identifier:", v7, v6);

}

- (void)_startListenForDebugTestNotifications
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  const __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (qword_1014D3190 != -1)
    dispatch_once(&qword_1014D3190, &stru_1011C5C40);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)qword_1014D3188;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        v8 = *(const __CFString **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1007624B4, v8, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_stopListenForDebugTestNotifications
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (id)qword_1014D3188;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(const __CFString **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v8, 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_handleFake:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  NSNumber *v9;
  void *v10;
  void *v11;
  void *v12;
  NSNumber *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSNumber *v18;
  void *v19;
  _UNKNOWN **v20;
  void *v21;
  void *v22;
  NSNumber *v23;
  void *v24;
  void *v25;
  void *v26;
  NSNumber *v27;
  id v28;

  v28 = a3;
  +[MapsCarEngineState prepareForUse](MapsCarEngineState, "prepareForUse");
  if (qword_1014D3198 != -1)
    dispatch_once(&qword_1014D3198, &stru_1011C5C60);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(".")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));

  if (objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.maps.FakeExternalAccessory.engine.type")))
  {
    v6 = EAVehicleInfoEngineTypeBitmaskKey;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D31A0, "objectForKeyedSubscript:", EAVehicleInfoEngineTypeBitmaskKey));
    v8 = objc_msgSend(v7, "longLongValue");

    v9 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_100760144(v5) | v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend((id)qword_1014D31A0, "setObject:forKeyedSubscript:", v10, v6);
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.maps.FakeExternalAccessory.engine.low")))
  {
    v11 = (void *)qword_1014D31A0;
    v12 = (void *)qword_1014D3160;
    v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_100760144(v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v14));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v15);

    v16 = (void *)qword_1014D31A0;
    v17 = (void *)qword_1014D3158;
    v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_100760144(v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v10));
    v20 = &off_10126EC20;
LABEL_9:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, v19);

    goto LABEL_10;
  }
  if (objc_msgSend(v28, "hasPrefix:", CFSTR("com.apple.maps.FakeExternalAccessory.engine.full")))
  {
    v21 = (void *)qword_1014D31A0;
    v22 = (void *)qword_1014D3160;
    v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_100760144(v5));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v24));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v25);

    v16 = (void *)qword_1014D31A0;
    v26 = (void *)qword_1014D3158;
    v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", sub_100760144(v5));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v10));
    v20 = &off_10126EC38;
    goto LABEL_9;
  }
LABEL_11:
  -[MapsExternalAccessory _updateFromNotificationName:userInfo:](self, "_updateFromNotificationName:userInfo:", CFSTR("Fake Update"), qword_1014D31A0);

}

- (void)_accessoryDidConnect:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  -[MapsExternalAccessory _updateFromNotificationName:userInfo:](self, "_updateFromNotificationName:userInfo:", v6, v5);
}

- (void)_accessoryDidUpdateVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  -[MapsExternalAccessory _updateFromNotificationName:userInfo:](self, "_updateFromNotificationName:userInfo:", v6, v5);
}

- (void)_accessoryDidUpdate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));

  -[MapsExternalAccessory _updateFromNotificationName:userInfo:](self, "_updateFromNotificationName:userInfo:", v6, v5);
}

- (void)_accessoryDidDisconnect:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", EAAccessoryKey));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory accessory](self, "accessory"));
  if (v5 == v8)
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory accessory](self, "accessory"));
    v7 = objc_msgSend(v6, "isEqual:", v8);

    if (!v7)
      goto LABEL_6;
  }
  -[MapsExternalAccessory _disconnectFromVehicle](self, "_disconnectFromVehicle");
LABEL_6:

}

- (id)identifier
{
  __CFString *v3;

  if ((GEOConfigGetBOOL(VirtualGarageConfig_EVRoutingUseCarDisplaySimIdentifier[0], VirtualGarageConfig_EVRoutingUseCarDisplaySimIdentifier[1]) & 1) != 0)v3 = CFSTR("CarDisplaySim");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[EAAccessory serialNumber](self->_accessory, "serialNumber"));
  return v3;
}

- (void)setAccessory:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  MapsExternalAccessoryState *v8;
  int v9;
  id v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_accessory, a3);
  v6 = sub_100761100();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "updating accessory: %@", (uint8_t *)&v9, 0xCu);
  }

  if (v5)
  {
    v8 = -[MapsExternalAccessoryState initWithAccessory:]([MapsExternalAccessoryState alloc], "initWithAccessory:", v5);
    -[MapsExternalAccessory setCurrentState:](self, "setCurrentState:", v8);

  }
  else
  {
    -[MapsExternalAccessory setCurrentState:](self, "setCurrentState:", 0);
  }

}

- (void)setCurrentState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  objc_storeStrong((id *)&self->_currentState, a3);
  v4 = sub_100761100();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory accessory](self, "accessory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "state updated for accessory: %@\n currentState=%@", (uint8_t *)&v8, 0x16u);

  }
  -[MapsExternalAccessory _postNotificationIfNeeded](self, "_postNotificationIfNeeded");
}

- (BOOL)hasEngineType
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
  v3 = objc_msgSend(v2, "engineType") != 0;

  return v3;
}

- (BOOL)needsFuel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if ((-[MapsExternalAccessory lowRangeWarning](self, "lowRangeWarning") & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "engineStates"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectEnumerator"));

    v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "lowRangeWarning") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return (char)v3;
}

- (BOOL)isHybridEngineType
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory engineStates](self, "engineStates"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (int)primaryEngineType
{
  if ((-[MapsExternalAccessory engineTypes](self, "engineTypes") & 1) != 0)
    return 1;
  if ((-[MapsExternalAccessory engineTypes](self, "engineTypes") & 0x100) != 0)
    return 2;
  if ((-[MapsExternalAccessory engineTypes](self, "engineTypes") & 0x1000000) != 0)
    return 8;
  return (-[MapsExternalAccessory engineTypes](self, "engineTypes") >> 14) & 4;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(MapsExternalAccessoryState), "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
    objc_msgSend(v4, "invokeWithTarget:", v5);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MapsExternalAccessory;
    -[MapsExternalAccessory forwardInvocation:](&v6, "forwardInvocation:", v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  return objc_msgSend((id)objc_opt_class(self), "instanceMethodSignatureForSelector:", a3);
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  id v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___MapsExternalAccessory;
  v4 = objc_msgSendSuper2(&v8, "instanceMethodSignatureForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5)
  {
    v6 = objc_msgSend((id)objc_opt_class(MapsExternalAccessoryState), "instanceMethodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  return v5;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "instanceMethodSignatureForSelector:", a3));
  v4 = v3 != 0;

  return v4;
}

- (void)_updateFromNotificationName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = sub_100761100();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory accessory](self, "accessory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    v15 = 138412802;
    v16 = v11;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "notified of update to accessory: %@ notification=%@ userInfo=%@", (uint8_t *)&v15, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", EAAccessoryKey));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", EAAccessoryKey));
    if (objc_msgSend(v13, "supportsCarPlay"))
      -[MapsExternalAccessory setAccessory:](self, "setAccessory:", v13);

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
    objc_msgSend(v14, "updateWithInfo:", v7);

    -[MapsExternalAccessory _postNotificationIfNeeded](self, "_postNotificationIfNeeded");
  }

}

- (BOOL)_isCurrentStateEqualLastPostedState
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory lastPostedState](self, "lastPostedState"));
  v4 = objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
  if (v3 | v4)
    v5 = objc_msgSend((id)v3, "isEqual:", v4);
  else
    v5 = 1;

  return v5;
}

- (void)_postNotificationIfNeeded
{
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  void *v25;

  if (self->_initialising)
  {
    v3 = sub_100761100();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "suppressing notification while initialising MapsExternalAccessory", buf, 2u);
    }
    goto LABEL_17;
  }
  v5 = -[MapsExternalAccessory _isCurrentStateEqualLastPostedState](self, "_isCurrentStateEqualLastPostedState");
  v6 = sub_100761100();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (!v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory lastPostedState](self, "lastPostedState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
      *(_DWORD *)buf = 138412546;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "posting notification\n lastPostedState=%@\n currentState=%@", buf, 0x16u);

    }
    v11 = sub_100761100();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory lastPostedState](self, "lastPostedState"));
      if (v13)
      {
        v14 = (void *)v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));

        if (!v15)
        {
LABEL_16:
          v4 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
          -[NSObject postNotificationName:object:userInfo:](v4, "postNotificationName:object:userInfo:", CFSTR("MapsExternalAccessoryUpdatedNotification"), self, 0);
LABEL_17:

          v8 = objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
          v20 = -[NSObject copy](v8, "copy");
          -[MapsExternalAccessory setLastPostedState:](self, "setLastPostedState:", v20);

          goto LABEL_18;
        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory currentState](self, "currentState"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalAccessory lastPostedState](self, "lastPostedState"));
        v21 = 0;
        objc_msgSend(v16, "isEqualToState:changedKeys:", v17, &v21);
        v12 = v21;

        v18 = sub_100761100();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "changedKeys=%@", buf, 0xCu);
        }

      }
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "no need to post notification (no change)", buf, 2u);
  }
LABEL_18:

}

- (void)_disconnectFromVehicle
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100761100();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "disconnecting from vehicle", v5, 2u);
  }

  -[MapsExternalAccessory setAccessory:](self, "setAccessory:", 0);
}

- (EAAccessory)accessory
{
  return self->_accessory;
}

- (MapsExternalAccessoryState)currentState
{
  return self->_currentState;
}

- (MapsExternalAccessoryState)lastPostedState
{
  return self->_lastPostedState;
}

- (void)setLastPostedState:(id)a3
{
  objc_storeStrong((id *)&self->_lastPostedState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPostedState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_notificationObservers, 0);
}

@end
