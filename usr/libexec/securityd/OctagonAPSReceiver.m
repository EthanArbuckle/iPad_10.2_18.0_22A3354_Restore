@implementation OctagonAPSReceiver

- (id)registeredPushEnvironments
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
  v10 = sub_1001A46F8;
  v11 = sub_1001A4708;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver apsDeliveryQueue](OctagonAPSReceiver, "apsDeliveryQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001A4710;
  v6[3] = &unk_1002EB140;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (BOOL)haveStalePushes
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver apsDeliveryQueue](OctagonAPSReceiver, "apsDeliveryQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A4678;
  v5[3] = &unk_1002EB140;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(self) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (id)cuttlefishPushTopics
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.security.cuttlefish")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", CFSTR("com.apple.TrustedPeersHelper")));
  v6[0] = v2;
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  return -[OctagonAPSReceiver initWithNamedDelegatePort:apsConnectionClass:stalePushTimeout:](self, "initWithNamedDelegatePort:apsConnectionClass:stalePushTimeout:", a3, a4, 300000000000);
}

- (OctagonAPSReceiver)initWithNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4 stalePushTimeout:(unint64_t)a5
{
  id v9;
  OctagonAPSReceiver *v10;
  OctagonAPSReceiver *v11;
  uint64_t v12;
  NSMutableSet *undeliveredUpdates;
  NSMutableSet *v14;
  NSMutableSet *undeliveredCuttlefishUpdates;
  uint64_t v16;
  NSMutableDictionary *environmentMap;
  uint64_t v18;
  NSMapTable *octagonContainerMap;
  uint64_t v20;
  NSMutableDictionary *zoneUpdateReceiverDictionary;
  void ***v22;
  CKKSNearFutureScheduler *v23;
  CKKSNearFutureScheduler *v24;
  CKKSNearFutureScheduler *clearStalePushNotifications;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id location;
  objc_super v33;

  v9 = a3;
  v33.receiver = self;
  v33.super_class = (Class)OctagonAPSReceiver;
  v10 = -[OctagonAPSReceiver init](&v33, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_apsConnectionClass, a4);
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    undeliveredUpdates = v11->_undeliveredUpdates;
    v11->_undeliveredUpdates = (NSMutableSet *)v12;

    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    undeliveredCuttlefishUpdates = v11->_undeliveredCuttlefishUpdates;
    v11->_undeliveredCuttlefishUpdates = v14;

    objc_storeStrong((id *)&v11->_namedDelegatePort, a3);
    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    environmentMap = v11->_environmentMap;
    v11->_environmentMap = (NSMutableDictionary *)v16;

    v18 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
    octagonContainerMap = v11->_octagonContainerMap;
    v11->_octagonContainerMap = (NSMapTable *)v18;

    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    zoneUpdateReceiverDictionary = v11->_zoneUpdateReceiverDictionary;
    v11->_zoneUpdateReceiverDictionary = (NSMutableDictionary *)v20;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    v27 = _NSConcreteStackBlock;
    v28 = 3221225472;
    v29 = sub_1001A4554;
    v30 = &unk_1002EB598;
    objc_copyWeak(&v31, &location);
    v22 = objc_retainBlock(&v27);
    v23 = [CKKSNearFutureScheduler alloc];
    v24 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:](v23, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:", CFSTR("clearStalePushNotifications"), a5, 0, 0, v22, v27, v28, v29, v30);
    clearStalePushNotifications = v11->_clearStalePushNotifications;
    v11->_clearStalePushNotifications = v24;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)registerForEnvironment:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver apsDeliveryQueue](OctagonAPSReceiver, "apsDeliveryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A440C;
  block[3] = &unk_1002EA8C8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)reportDroppedPushes:(id)a3
{
  id v3;
  uint64_t v4;
  BOOL v5;
  uint8_t v6;
  CFTypeRef v7;
  const __CFString *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  NSObject *v16;
  SecEventMetric *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v3 = a3;
  cf = 0;
  *(_DWORD *)buf = -1431655766;
  v4 = sub_100025F30(dword_1003414E0, buf);
  v5 = sub_10003252C(v4, &cf, CFSTR("aks_get_lock_state failed: %x"), v4);
  v6 = buf[0];
  v7 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v7);
  }
  v23 = 0u;
  v24 = 0u;
  if ((*(_DWORD *)&v5 & ((v6 & 4) >> 2)) != 0)
    v8 = CFSTR("CKKS APNS Push Dropped");
  else
    v8 = CFSTR("CKKS APNS Push Dropped - never unlocked");
  v21 = 0uLL;
  v22 = 0uLL;
  v9 = v3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v14, "ckksPushTracingEnabled"))
        {
          v15 = sub_10000BDF4(CFSTR("apsnotification"), 0);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Submitting initial CKEventMetric due to notification %@", buf, 0xCu);
          }

          v17 = -[SecEventMetric initWithEventName:]([SecEventMetric alloc], "initWithEventName:", CFSTR("APNSPushMetrics"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckksPushTracingUUID"));
          -[SecEventMetric setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, CFSTR("push_token_uuid"));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ckksPushReceivedDate"));
          -[SecEventMetric setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v19, CFSTR("push_received_date"));

          -[SecEventMetric setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v8, CFSTR("push_event_name"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[SecMetrics managerObject](SecMetrics, "managerObject"));
          objc_msgSend(v20, "submitEvent:", v17);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v11);
  }

}

- (id)registerCKKSReceiver:(id)a3 contextID:(id)a4
{
  id v6;
  id v7;
  CKKSCondition *v8;
  NSObject *v9;
  CKKSCondition *v10;
  id v11;
  id v12;
  CKKSCondition *v13;
  CKKSCondition *v14;
  _QWORD block[4];
  id v17;
  id v18;
  CKKSCondition *v19;
  id v20;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(CKKSCondition);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9 = objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver apsDeliveryQueue](OctagonAPSReceiver, "apsDeliveryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A4168;
  block[3] = &unk_1002EAC98;
  objc_copyWeak(&v20, &location);
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, block);

  v13 = v19;
  v14 = v10;

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  return v14;
}

- (id)registerCuttlefishReceiver:(id)a3 forContainerName:(id)a4 contextID:(id)a5
{
  id v8;
  id v9;
  id v10;
  CKKSCondition *v11;
  NSObject *v12;
  CKKSCondition *v13;
  id v14;
  id v15;
  id v16;
  CKKSCondition *v17;
  CKKSCondition *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  CKKSCondition *v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(CKKSCondition);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12 = objc_claimAutoreleasedReturnValue(+[OctagonAPSReceiver apsDeliveryQueue](OctagonAPSReceiver, "apsDeliveryQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001A3FC0;
  v20[3] = &unk_1002EA8F0;
  objc_copyWeak(&v25, &location);
  v21 = v8;
  v22 = v10;
  v23 = v9;
  v13 = v11;
  v24 = v13;
  v14 = v9;
  v15 = v10;
  v16 = v8;
  dispatch_async(v12, v20);

  v17 = v24;
  v18 = v13;

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  return v18;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = sub_10000BDF4(CFSTR("octagonpush"), 0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "OctagonAPSDelegate initiated: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = sub_10000BDF4(CFSTR("octagonpush"), 0);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138413058;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received per-topic push token \"%@\" for topic \"%@\" identifier \"%@\" on connection %@", (uint8_t *)&v15, 0x2Au);
  }

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *j;
  void *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *i;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint8_t v66[128];
  uint8_t buf[4];
  NSObject *v68;
  __int16 v69;
  void *v70;

  v6 = a3;
  v7 = a4;
  v8 = sub_10000BDF4(CFSTR("octagonpush"), 0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topic"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    *(_DWORD *)buf = 138412546;
    v68 = v10;
    v69 = 2112;
    v70 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "OctagonAPSDelegate received a message(%@): %@ ", buf, 0x16u);

  }
  if (objc_msgSend(v7, "isTracingEnabled"))
    objc_msgSend(v6, "confirmReceiptForMessage:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("cf")));
  v14 = v13 == 0;

  if (v14)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v16 = objc_claimAutoreleasedReturnValue(+[CKNotification notificationFromRemoteNotificationDictionary:](CKNotification, "notificationFromRemoteNotificationDictionary:", v35));

    if (-[NSObject notificationType](v16, "notificationType") == (id)2)
    {
      v17 = v16;
      -[NSObject setCkksPushTracingEnabled:](v17, "setCkksPushTracingEnabled:", objc_msgSend(v7, "isTracingEnabled"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracingUUID"));
      if (v36)
      {
        v37 = objc_alloc((Class)NSUUID);
        v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracingUUID")));
        v39 = objc_msgSend(v37, "initWithUUIDBytes:", objc_msgSend(v38, "bytes"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "UUIDString"));
        -[NSObject setCkksPushTracingUUID:](v17, "setCkksPushTracingUUID:", v40);

      }
      else
      {
        -[NSObject setCkksPushTracingUUID:](v17, "setCkksPushTracingUUID:", 0);
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSObject setCkksPushReceivedDate:](v17, "setCkksPushReceivedDate:", v42);

      v43 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v43, "setDateProperty:forKey:", v44, CFSTR("lastCKKSPush"));

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver zoneUpdateReceiverDictionary](self, "zoneUpdateReceiverDictionary"));
      objc_sync_enter(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver zoneUpdateReceiverDictionary](self, "zoneUpdateReceiverDictionary"));
      v47 = objc_msgSend(v46, "count") == 0;

      if (v47)
      {
        v48 = sub_10000BDF4(CFSTR("ckkspush"), 0);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v17;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "received push for unregistered receiver: %@", buf, 0xCu);
        }

        v50 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver undeliveredUpdates](self, "undeliveredUpdates"));
        objc_msgSend(v50, "addObject:", v17);

        v51 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver clearStalePushNotifications](self, "clearStalePushNotifications"));
        objc_msgSend(v51, "trigger");

      }
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver zoneUpdateReceiverDictionary](self, "zoneUpdateReceiverDictionary", 0));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectEnumerator"));

      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v54; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v55)
              objc_enumerationMutation(v53);
            objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i), "notifyZoneChange:", v17);
          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        }
        while (v54);
      }

      objc_sync_exit(v45);
      v16 = v17;
    }
    else
    {
      v41 = sub_10000BDF4(CFSTR("ckkspush"), 0);
      v17 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v68 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "unexpected notification: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("cf")));

    v17 = objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("c")));
    v18 = sub_10000BDF4(CFSTR("octagonpush"), 0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Received a cuttlefish push to container %@", buf, 0xCu);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](CKKSAnalytics, "logger"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v20, "setDateProperty:forKey:", v21, CFSTR("lastOctagonPush"));

    if (v17)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
      objc_sync_enter(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
      v24 = objc_msgSend(v23, "count") == 0;

      if (v24)
      {
        v25 = sub_10000BDF4(CFSTR("octagonpush"), 0);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v68 = v17;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "received cuttlefish push for unregistered container: %@", buf, 0xCu);
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver undeliveredCuttlefishUpdates](self, "undeliveredCuttlefishUpdates"));
        objc_msgSend(v27, "addObject:", v17);

        v28 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver clearStalePushNotifications](self, "clearStalePushNotifications"));
        objc_msgSend(v28, "trigger");

      }
      objc_sync_exit(v22);

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
    objc_sync_enter(v29);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OctagonAPSReceiver octagonContainerMap](self, "octagonContainerMap"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectEnumerator"));

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(_QWORD *)v62 != v33)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j), "notifyContainerChange:", 0);
        }
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v32);
    }

    objc_sync_exit(v29);
  }

}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (OctagonAPSConnection)apsConnection
{
  return (OctagonAPSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApsConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (CKKSNearFutureScheduler)clearStalePushNotifications
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClearStalePushNotifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)namedDelegatePort
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNamedDelegatePort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableDictionary)environmentMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnvironmentMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableSet)undeliveredUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUndeliveredUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)undeliveredCuttlefishUpdates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUndeliveredCuttlefishUpdates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)zoneUpdateReceiverDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setZoneUpdateReceiverDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMapTable)octagonContainerMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOctagonContainerMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_octagonContainerMap, 0);
  objc_storeStrong((id *)&self->_zoneUpdateReceiverDictionary, 0);
  objc_storeStrong((id *)&self->_undeliveredCuttlefishUpdates, 0);
  objc_storeStrong((id *)&self->_undeliveredUpdates, 0);
  objc_storeStrong((id *)&self->_environmentMap, 0);
  objc_storeStrong((id *)&self->_namedDelegatePort, 0);
  objc_storeStrong((id *)&self->_clearStalePushNotifications, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsConnectionClass, 0);
}

+ (id)receiverForNamedDelegatePort:(id)a3 apsConnectionClass:(Class)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  OctagonAPSReceiver *v10;

  v6 = a3;
  v7 = objc_opt_class(a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_sync_enter(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "synchronizedGlobalDelegatePortMap"));
  v10 = (OctagonAPSReceiver *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v6));
  if (!v10)
  {
    v10 = -[OctagonAPSReceiver initWithNamedDelegatePort:apsConnectionClass:]([OctagonAPSReceiver alloc], "initWithNamedDelegatePort:apsConnectionClass:", v6, a4);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, v6);
  }

  objc_sync_exit(v8);
  return v10;
}

+ (void)resetGlobalDelegatePortMap
{
  id v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  v2 = objc_msgSend(obj, "resettableSynchronizedGlobalDelegatePortMap:", 1);
  objc_sync_exit(obj);

}

+ (id)synchronizedGlobalDelegatePortMap
{
  return objc_msgSend(a1, "resettableSynchronizedGlobalDelegatePortMap:", 0);
}

+ (id)resettableSynchronizedGlobalDelegatePortMap:(BOOL)a3
{
  void *v3;
  BOOL v4;
  id v5;
  void *v6;

  v3 = (void *)qword_100341470;
  if (qword_100341470)
    v4 = !a3;
  else
    v4 = 0;
  if (!v4)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)qword_100341470;
    qword_100341470 = (uint64_t)v5;

    v3 = (void *)qword_100341470;
  }
  return v3;
}

+ (id)apsDeliveryQueue
{
  if (qword_100341480 != -1)
    dispatch_once(&qword_100341480, &stru_1002EA8A0);
  return (id)qword_100341478;
}

@end
