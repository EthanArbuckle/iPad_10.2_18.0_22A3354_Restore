@implementation WiFiHotspotInterface

- (WiFiHotspotInterface)init
{
  WiFiHotspotInterface *v2;
  id v3;
  void *v4;
  uint64_t v5;
  NSSet *networks;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiHotspotInterface;
  v2 = -[WiFiHotspotInterface init](&v11, "init");
  if (!v2)
  {
LABEL_10:
    v4 = 0;
LABEL_5:

    v2 = 0;
    goto LABEL_6;
  }
  v3 = objc_alloc_init((Class)SFRemoteHotspotSession);
  if (!v3)
  {
    v10 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "failed to create SFRemoteHotspotSession");
    objc_autoreleasePoolPop(v10);
    goto LABEL_10;
  }
  v4 = v3;
  objc_msgSend(v3, "setDelegate:", v2);
  objc_storeStrong((id *)&v2->_hotspotSession, v4);
  v5 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  networks = v2->_networks;
  v2->_networks = (NSSet *)v5;

  if (!v2->_networks)
    goto LABEL_5;
  v7 = dispatch_queue_create(0, 0);
  internalQueue = v2->_internalQueue;
  v2->_internalQueue = (OS_dispatch_queue *)v7;

  if (!v2->_internalQueue)
    goto LABEL_5;
LABEL_6:

  return v2;
}

- (void)updateNetworksWithHotspots:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "signalStrength"));
        v13 = objc_msgSend(v12, "integerValue");

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface networks](self, "networks"));
  v15 = objc_msgSend(v5, "isEqualToSet:", v14);

  if ((v15 & 1) != 0)
  {
    v16 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Instant HS scan finished-> No new networks found.");
  }
  else
  {
    -[WiFiHotspotInterface setNetworks:](self, "setNetworks:", v5);
    v16 = objc_autoreleasePoolPush();
    v17 = (void *)qword_10026DD20;
    if (qword_10026DD20)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface networks](self, "networks"));
      objc_msgSend(v17, "WFLog:message:", 3, "networks found %@\n", v18);

    }
  }
  objc_autoreleasePoolPop(v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface hotspotUpdateNetworkcallback](self, "hotspotUpdateNetworkcallback"));

  if (v19)
  {
    v20 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface hotspotUpdateNetworkcallback](self, "hotspotUpdateNetworkcallback"));
    ((void (**)(_QWORD, uint64_t, void *))v20)[2](v20, 1, -[WiFiHotspotInterface callbackContext](self, "callbackContext"));

  }
}

- (id)copySortedHotspotDevicesByAutoPreferences
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:comparator:", CFSTR("self"), 0, &stru_1002330E8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface networks](self, "networks"));
  v9 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingDescriptors:", v5));

  v7 = objc_msgSend(v6, "copy");
  return v7;
}

- (id)newHotspot:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  dispatch_semaphore_t v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  NSErrorUserInfoKey v42;
  const __CFString *v43;

  v6 = a3;
  if (v6)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = sub_10002FB08;
    v40 = sub_10002F9E8;
    v41 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = sub_10002FB08;
    v34 = sub_10002F9E8;
    v35 = 0;
    v7 = objc_alloc_init((Class)NSMutableDictionary);
    v8 = dispatch_semaphore_create(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiHotspotInterface hotspotSession](self, "hotspotSession"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100166478;
    v26[3] = &unk_100233110;
    v28 = &v30;
    v29 = &v36;
    v10 = v8;
    v27 = v10;
    objc_msgSend(v9, "enableRemoteHotspotForDevice:withCompletionHandler:", v6, v26);

    v11 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      v12 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "%s: Enable Remote Hotspot Timeout", "-[WiFiHotspotInterface newHotspot:error:]");
      objc_autoreleasePoolPop(v12);
      v13 = objc_alloc((Class)NSError);
      v42 = NSLocalizedDescriptionKey;
      v43 = CFSTR("Enable Remote Hotspot Timeout");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1));
      v15 = objc_msgSend(v13, "initWithDomain:code:userInfo:", NSPOSIXErrorDomain, -6722, v14);
      v16 = (void *)v31[5];
      v31[5] = (uint64_t)v15;

    }
    if (a4 && (v17 = (void *)v31[5]) != 0)
    {
      *a4 = objc_msgSend(v17, "copy");
    }
    else
    {
      v20 = (void *)v37[5];
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("ssid"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37[5], "password"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("password"));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37[5], "channel"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("channel"));

      }
      v24 = objc_autoreleasePoolPush();
      if (qword_10026DD20)
        objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Started Hotspot");
      objc_autoreleasePoolPop(v24);
    }
    v19 = objc_msgSend(v7, "copy");

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);

  }
  else
  {
    v18 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Cannot enable hotspot, missing SFRemoteHotspotDevice");
    objc_autoreleasePoolPop(v18);
    v19 = 0;
  }

  return v19;
}

- (BOOL)isScanning
{
  NSObject *internalQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  internalQueue = self->_internalQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100166594;
  v5[3] = &unk_100232960;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)startBrowsing
{
  void *v3;
  NSObject *internalQueue;
  _QWORD block[5];

  if (!-[WiFiHotspotInterface isScanning](self, "isScanning"))
  {
    v3 = objc_autoreleasePoolPush();
    if (qword_10026DD20)
      objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Starting hotspot browsing");
    objc_autoreleasePoolPop(v3);
    internalQueue = self->_internalQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100166640;
    block[3] = &unk_10022E8F8;
    block[4] = self;
    dispatch_sync(internalQueue, block);
  }
}

- (void)stopBrowsing
{
  -[WiFiHotspotInterface _stopBrowsingRemoveCache:](self, "_stopBrowsingRemoveCache:", 1);
}

- (void)pauseBrowsing
{
  -[WiFiHotspotInterface _stopBrowsingRemoveCache:](self, "_stopBrowsingRemoveCache:", 0);
}

- (void)_stopBrowsingRemoveCache:(BOOL)a3
{
  NSObject *internalQueue;
  _QWORD v4[5];
  BOOL v5;

  internalQueue = self->_internalQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001666E8;
  v4[3] = &unk_100233138;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(internalQueue, v4);
}

- (id)getHotspotDeviceName:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
  v5 = objc_msgSend(v4, "length");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deviceName"));
  if ((unint64_t)v5 >= 0x21)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", 30));

    v6 = (void *)v7;
  }
  return v6;
}

- (id)getHotspotDeviceIdentifier:(id)a3
{
  return objc_msgSend(a3, "deviceIdentifier");
}

- (unsigned)isEqualHotspotDevices:(id)a3 compareTo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceName"));
  if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "deviceIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deviceIdentifier"));
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (unsigned)isEqualHotspotDevicesName:(id)a3 compareTo:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "deviceName"));
  v7 = objc_msgSend(v6, "isEqualToString:", v5);

  return v7;
}

- (unsigned)isFamilyHotspot:(id)a3
{
  return objc_msgSend(a3, "group") == (id)2;
}

- (unsigned)isHotspotDeviceSupportADHS:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("iPad3,4"), CFSTR("iPad3,5"), CFSTR("iPad3,6"), CFSTR("iPad4,1"), CFSTR("iPad4,2"), CFSTR("iPad4,3"), CFSTR("iPad4,4"), CFSTR("iPad4,5"), CFSTR("iPad4,6"), CFSTR("iPad4,7"), CFSTR("iPad4,8"), CFSTR("iPad4,9"), CFSTR("iPad5,1"), CFSTR("iPad5,2"), CFSTR("iPad5,3"), CFSTR("iPad5,4"),
                   CFSTR("iPad6,11"),
                   CFSTR("iPad6,11"),
                   CFSTR("iPad6,12"),
                   CFSTR("iPad6,12"),
                   CFSTR("iPad6,3"),
                   CFSTR("iPad6,4"),
                   CFSTR("iPad6,7"),
                   CFSTR("iPad6,8"),
                   CFSTR("iPad7,1"),
                   CFSTR("iPad7,10"),
                   CFSTR("iPad7,11"),
                   CFSTR("iPad7,12"),
                   CFSTR("iPad7,2"),
                   CFSTR("iPad7,3"),
                   CFSTR("iPad7,4"),
                   CFSTR("iPad7,5"),
                   CFSTR("iPad7,6"),
                   CFSTR("iPad7,7"),
                   CFSTR("iPad7,8"),
                   CFSTR("iPad7,9"),
                   CFSTR("iPad11,6"),
                   CFSTR("iPad11,7"),
                   CFSTR("iPad12,1"),
                   CFSTR("iPad12,2"),
                   CFSTR("iPhone5,1"),
                   CFSTR("iPhone5,2"),
                   CFSTR("iPhone5,3"),
                   CFSTR("iPhone5,4"),
                   CFSTR("iPhone6,1"),
                   CFSTR("iPhone6,2"),
                   CFSTR("iPhone7,1"),
                   CFSTR("iPhone7,2"),
                   CFSTR("iPhone8,1"),
                   CFSTR("iPhone8,1"),
                   CFSTR("iPhone8,2"),
                   CFSTR("iPhone8,2"),
                   CFSTR("iPhone8,4"),
                   CFSTR("iPhone8,4"),
                   CFSTR("iPhone9,1"),
                   CFSTR("iPhone9,2"),
                   CFSTR("iPhone9,3"),
                   CFSTR("iPhone9,4"),
                   0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v3, "osSupportsAutoHotspot");

  if ((v6 & 1) == 0)
    goto LABEL_5;
  v7 = 1;
LABEL_6:

  return v7;
}

- (void)registerHotspotInterfaceUpdateNetworkCallback:(id)a3 withCallbackContext:(void *)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = objc_autoreleasePoolPush();
  v7 = (void *)qword_10026DD20;
  if (qword_10026DD20)
  {
    v8 = objc_retainBlock(v9);
    objc_msgSend(v7, "WFLog:message:", 3, "%s: callback %@, context %@", "-[WiFiHotspotInterface registerHotspotInterfaceUpdateNetworkCallback:withCallbackContext:]", v8, a4);

  }
  objc_autoreleasePoolPop(v6);
  -[WiFiHotspotInterface setHotspotUpdateNetworkcallback:](self, "setHotspotUpdateNetworkcallback:", v9);
  -[WiFiHotspotInterface setCallbackContext:](self, "setCallbackContext:", a4);

}

- (void)session:(id)a3 updatedFoundDevices:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_autoreleasePoolPush();
  if (qword_10026DD20)
    objc_msgSend((id)qword_10026DD20, "WFLog:message:", 3, "Found hotspots %@", v6, v9);
  objc_autoreleasePoolPop(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v8, "addObjectsFromArray:", v6);
  -[WiFiHotspotInterface updateNetworksWithHotspots:](self, "updateNetworksWithHotspots:", v8);

}

- (NSSet)networks
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNetworks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setScanning:(BOOL)a3
{
  self->_scanning = a3;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (SFRemoteHotspotSession)hotspotSession
{
  return (SFRemoteHotspotSession *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHotspotSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)callbackContext
{
  return self->_callbackContext;
}

- (void)setCallbackContext:(void *)a3
{
  self->_callbackContext = a3;
}

- (id)hotspotUpdateNetworkcallback
{
  return self->_hotspotUpdateNetworkcallback;
}

- (void)setHotspotUpdateNetworkcallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hotspotUpdateNetworkcallback, 0);
  objc_storeStrong((id *)&self->_hotspotSession, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_networks, 0);
}

@end
