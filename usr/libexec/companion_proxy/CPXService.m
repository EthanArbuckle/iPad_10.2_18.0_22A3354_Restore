@implementation CPXService

- (CPXService)initWithLockdownContext:(_lockdown_connection *)a3
{
  CPXService *v4;
  CPXService *v5;
  int socket;
  id v7;
  uint64_t v8;
  NSString *clientHostIPAddress;
  NSString *v10;
  const __CFString *v11;
  CPXService *v12;
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  __int16 v17;
  const __CFString *v18;

  v14.receiver = self;
  v14.super_class = (Class)CPXService;
  v4 = -[CPXService init](&v14, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_conn = a3;
      socket = lockdown_get_socket(a3);
      v7 = sub_10000B238(socket, (char *)&v5->_ipV6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      clientHostIPAddress = v5->_clientHostIPAddress;
      v5->_clientHostIPAddress = (NSString *)v8;

      if (v5->_clientHostIPAddress)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v5->_clientHostIPAddress;
          v11 = CFSTR("(ipV6)");
          if (!v5->_ipV6)
            v11 = CFSTR("(ipV4)");
          *(_DWORD *)buf = 138412546;
          v16 = v10;
          v17 = 2112;
          v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Initialized connection to listen for gizmos. Host: %@ %@", buf, 0x16u);
        }
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid connection.", buf, 2u);
    }
    v12 = 0;
    goto LABEL_12;
  }
LABEL_8:
  v12 = v5;
LABEL_12:

  return v12;
}

- (void)handlePairingNotification:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  int v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v4 = a3;
  v15 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  v6 = objc_msgSend(v5, "isEqualToString:", NRPairedDeviceRegistryDeviceDidPairNotification);

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("GizmoPaired");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    v9 = objc_msgSend(v8, "isEqualToString:", NRPairedDeviceRegistryDeviceDidUnpairNotification);

    if (v9)
      v7 = CFSTR("GizmoUnpaired");
    else
      v7 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NRPairedDeviceRegistryDevice")));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForProperty:", NRDevicePropertyUDID));
  v13 = (void *)v12;
  v14 = 0;
  if (v11)
  {
    if (v12)
    {
      v20[0] = CFSTR("GizmoUDIDKey");
      v20[1] = CFSTR("Command");
      v21[0] = v12;
      v21[1] = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      if (v14)
      {
        if (!sub_10000B14C((uint64_t)-[CPXService conn](self, "conn"), (uint64_t)v14, &v15)
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v7;
          v18 = 1024;
          v19 = v15;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send %@ message: 0x%08x", buf, 0x12u);
        }
      }
    }
  }

}

- (void)startService
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  unsigned int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id buf;
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];

  if (!-[CPXService serviceStarted](self, "serviceStarted"))
  {
    xpc_transaction_begin();
    v3 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.companionproxy"));
    -[CPXService setService:](self, "setService:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService service](self, "service"));
    objc_msgSend(v4, "addDelegate:queue:", self, &_dispatch_main_q);

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getPairedDevices"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v44;
      v10 = NRDevicePropertyUDID;
      *(_QWORD *)&v8 = 67109120;
      v32 = v8;
      do
      {
        v11 = 0;
        v33 = v7;
        do
        {
          if (*(_QWORD *)v44 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v11);
          v42 = 0;
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", v10, v32));
          v14 = (void *)v13;
          if (v12)
            v15 = v13 == 0;
          else
            v15 = 1;
          if (v15)
          {
            v16 = 0;
          }
          else
          {
            v48[0] = CFSTR("GizmoUDIDKey");
            v48[1] = CFSTR("Command");
            v49[0] = v13;
            v49[1] = CFSTR("GizmoPaired");
            v17 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 2));
            v16 = (void *)v17;
            if (v17 && !sub_10000B14C((uint64_t)-[CPXService conn](self, "conn"), v17, &v42))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                buf = (id)__PAIR64__(v42, v32);
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send paired message: 0x%08x", (uint8_t *)&buf, 8u);
              }
              v7 = v33;
            }
          }

          v11 = (char *)v11 + 1;
        }
        while (v7 != v11);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v7);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService service](self, "service"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "devices"));
    -[CPXService checkNearbyDevices:](self, "checkNearbyDevices:", v19);

    objc_initWeak(&buf, self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100007898;
    v40[3] = &unk_1000145B8;
    objc_copyWeak(&v41, &buf);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", NRPairedDeviceRegistryDeviceDidPairNotification, 0, v21, v40));
    -[CPXService setPairObserver:](self, "setPairObserver:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000079A4;
    v38[3] = &unk_1000145B8;
    objc_copyWeak(&v39, &buf);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "addObserverForName:object:queue:usingBlock:", NRPairedDeviceRegistryDeviceDidUnpairNotification, 0, v24, v38));
    -[CPXService setUnpairObserver:](self, "setUnpairObserver:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100007A40;
    v36[3] = &unk_1000145B8;
    objc_copyWeak(&v37, &buf);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "addObserverForName:object:queue:usingBlock:", NRPairedDeviceRegistryDeviceDidBecomeActive, 0, v27, v36));
    -[CPXService setActiveObserver:](self, "setActiveObserver:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100007AD0;
    v34[3] = &unk_1000145B8;
    objc_copyWeak(&v35, &buf);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "addObserverForName:object:queue:usingBlock:", NRPairedDeviceRegistryDeviceDidBecomeInactive, 0, v30, v34));
    -[CPXService setInactiveObserver:](self, "setInactiveObserver:", v31);

    -[CPXService setServiceStarted:](self, "setServiceStarted:", 1);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak(&buf);
  }
}

- (void)stopService
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NRDevice *device;
  void *v8;
  _QWORD v9[2];

  if (-[CPXService serviceStarted](self, "serviceStarted"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "removeObserver:", self->_pairObserver);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:", self->_unpairObserver);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:", self->_activeObserver);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:", self->_inactiveObserver);

    device = self->_device;
    v9[0] = NRDevicePropertyName;
    v9[1] = NRDevicePropertyUDID;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
    -[NRDevice removePropertyObserver:forPropertyChanges:](device, "removePropertyObserver:forPropertyChanges:", self, v8);

    -[IDSService removeDelegate:](self->_service, "removeDelegate:", self);
    if (self->_conn)
      lockdown_disconnect();
    xpc_transaction_end();
    -[CPXService setServiceStarted:](self, "setServiceStarted:", 0);
  }
}

- (id)receiveMessageWithError:(int *)a3
{
  return sub_10000B0CC((uint64_t)-[CPXService conn](self, "conn"), a3);
}

- (void)checkNearbyDevices:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  uint8_t buf[4];
  int v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];

  v35 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService device](self, "device", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService device](self, "device"));
    v6 = objc_claimAutoreleasedReturnValue(-[CPXService udid](self, "udid"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getActivePairedDevice"));

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForProperty:", NRDevicePropertyUDID));
  }
  v8 = (void *)v6;
  if (v5 && v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService service](self, "service"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "devices"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceForNRDevice:fromIDSDevices:", v5, v11));

    if (objc_msgSend(v12, "isNearby"))
      v13 = objc_msgSend(v12, "isActive");
    else
      v13 = 0;
    if (!-[CPXService nearby](self, "nearby") || (v13 & 1) != 0)
    {
      v24 = 0;
      if (-[CPXService nearby](self, "nearby") || ((v13 ^ 1) & 1) != 0)
        goto LABEL_30;
      -[CPXService setNearby:](self, "setNearby:", 1);
      -[CPXService setDevice:](self, "setDevice:", v5);
      -[CPXService setUdid:](self, "setUdid:", v8);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10000D97C(self);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService device](self, "device"));
      v40[0] = NRDevicePropertyName;
      v40[1] = NRDevicePropertyUDID;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v40, 2));
      objc_msgSend(v27, "addPropertyObserver:forPropertyChanges:", self, v28);

      v38[0] = CFSTR("GizmoUDIDKey");
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService udid](self, "udid"));
      v38[1] = CFSTR("Command");
      v39[0] = v29;
      v39[1] = CFSTR("GizmoAttach");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v30));

      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService device](self, "device"));
      LODWORD(v30) = NRWatchOSVersionForRemoteDevice();

      if (v30 >= 0x20000)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion](CPXIDSRelayCompanion, "defaultCPXIDSRelayCompanion"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService clientHostIPAddress](self, "clientHostIPAddress"));
        v34 = objc_msgSend(v32, "copyLockdownPortNumWithRequireHostIP:ipV6:", v33, -[CPXService ipV6](self, "ipV6"));
        objc_msgSend(v24, "setObject:forKey:", v34, CFSTR("CompanionLockdownProxyPort"));

      }
    }
    else
    {
      -[CPXService setNearby:](self, "setNearby:", 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10000DA0C(self);
      v42[0] = CFSTR("GizmoUDIDKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService udid](self, "udid"));
      v42[1] = CFSTR("Command");
      v43[0] = v22;
      v43[1] = CFSTR("GizmoDetach");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v23));

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService device](self, "device"));
      v41[0] = NRDevicePropertyName;
      v41[1] = NRDevicePropertyUDID;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 2));
      objc_msgSend(v25, "removePropertyObserver:forPropertyChanges:", self, v26);

      -[CPXService setDevice:](self, "setDevice:", 0);
      -[CPXService setUdid:](self, "setUdid:", 0);
    }
    if (v24
      && !sub_10000B14C((uint64_t)-[CPXService conn](self, "conn"), (uint64_t)v24, &v35)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v37 = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send attach/detach message: 0x%08x", buf, 8u);
    }
  }
  else
  {
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v14)
        sub_10000DA98(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else if (v14)
    {
      sub_10000DAD0(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    v24 = 0;
    v12 = 0;
  }
LABEL_30:

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  -[CPXService checkNearbyDevices:](self, "checkNearbyDevices:", a4);
}

- (void)service:(id)a3 nearbyDevicesChanged:(id)a4
{
  -[CPXService checkNearbyDevices:](self, "checkNearbyDevices:", a4);
}

- (void)device:(id)a3 propertyDidChange:(id)a4 fromValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = NRDevicePropertyName;
  if (objc_msgSend(v9, "isEqualToString:", NRDevicePropertyName))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", v11));
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watch Name changed from: %@ to %@", (uint8_t *)&v18, 0x16u);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobile.lockdown.paired_device_name_changed"), CFSTR("com.apple.mobile.lockdown.paired_device_name_changed"), 0, 1u);
  }
  else
  {
    v14 = NRDevicePropertyUDID;
    if (objc_msgSend(v9, "isEqualToString:", NRDevicePropertyUDID))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", v14));
        v18 = 138412546;
        v19 = v10;
        v20 = 2112;
        v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Watch UDID changed from: %@ to %@", (uint8_t *)&v18, 0x16u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPXService service](self, "service"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "devices"));
      -[CPXService checkNearbyDevices:](self, "checkNearbyDevices:", v17);

    }
  }

}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)ipV6
{
  return self->_ipV6;
}

- (void)setIpV6:(BOOL)a3
{
  self->_ipV6 = a3;
}

- (BOOL)serviceStarted
{
  return self->_serviceStarted;
}

- (void)setServiceStarted:(BOOL)a3
{
  self->_serviceStarted = a3;
}

- (BOOL)nearby
{
  return self->_nearby;
}

- (void)setNearby:(BOOL)a3
{
  self->_nearby = a3;
}

- (_lockdown_connection)conn
{
  return self->_conn;
}

- (void)setConn:(_lockdown_connection *)a3
{
  self->_conn = a3;
}

- (NSString)clientHostIPAddress
{
  return self->_clientHostIPAddress;
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  objc_storeStrong((id *)&self->_udid, a3);
}

- (id)pairObserver
{
  return self->_pairObserver;
}

- (void)setPairObserver:(id)a3
{
  objc_storeStrong(&self->_pairObserver, a3);
}

- (id)unpairObserver
{
  return self->_unpairObserver;
}

- (void)setUnpairObserver:(id)a3
{
  objc_storeStrong(&self->_unpairObserver, a3);
}

- (id)activeObserver
{
  return self->_activeObserver;
}

- (void)setActiveObserver:(id)a3
{
  objc_storeStrong(&self->_activeObserver, a3);
}

- (id)inactiveObserver
{
  return self->_inactiveObserver;
}

- (void)setInactiveObserver:(id)a3
{
  objc_storeStrong(&self->_inactiveObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inactiveObserver, 0);
  objc_storeStrong(&self->_activeObserver, 0);
  objc_storeStrong(&self->_unpairObserver, 0);
  objc_storeStrong(&self->_pairObserver, 0);
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_clientHostIPAddress, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
