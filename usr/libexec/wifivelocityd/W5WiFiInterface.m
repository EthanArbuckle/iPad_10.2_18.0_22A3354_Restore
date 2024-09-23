@implementation W5WiFiInterface

- (W5WiFiInterface)initWithCoreWiFiInterface:(id)a3
{
  W5WiFiInterface *v4;
  W5WiFiInterface *v5;
  CWFInterface *v6;
  NSString *v7;
  __CFString *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  SCDynamicStoreRef v11;
  const char *v13;
  _Apple80211 *v14;
  objc_super v15;
  uint8_t buf[4];
  const char *v17;

  v15.receiver = self;
  v15.super_class = (Class)W5WiFiInterface;
  v4 = -[W5WiFiInterface init](&v15, "init");
  v5 = v4;
  if (!a3)
    goto LABEL_15;
  if (!v4)
    goto LABEL_15;
  v6 = (CWFInterface *)a3;
  v5->_corewifi = v6;
  v7 = (NSString *)objc_msgSend(-[CWFInterface interfaceName](v6, "interfaceName"), "copy");
  v5->_interfaceName = v7;
  if (!v7)
    goto LABEL_15;
  v14 = 0;
  if (Apple80211Open(&v14))
    goto LABEL_15;
  v5->_a11Ref = v14;
  if (Apple80211BindToInterface())
    goto LABEL_15;
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.wifivelocityd.wifi-%@"), v5->_interfaceName);
  v9 = dispatch_queue_create((const char *)-[__CFString UTF8String](v8, "UTF8String"), 0);
  v5->_queue = (OS_dispatch_queue *)v9;
  if (!v9)
    goto LABEL_15;
  dispatch_queue_set_specific(v9, &v5->_queue, (void *)1, 0);
  v10 = dispatch_queue_create((const char *)objc_msgSend(-[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR(".event")), "UTF8String"), 0);
  v5->_eventQueue = (OS_dispatch_queue *)v10;
  if (!v10
    || (v5->_linkQualityUpdates = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray),
        v5->_cachedPreferredNetworksListUUIDMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary),
        v5->_lastAssociatedSSID = (NSData *)objc_msgSend(-[CWFInterface SSID](v5->_corewifi, "SSID"), "copy"),
        v5->_lastAssociatedSSIDString = (NSString *)objc_msgSend(-[CWFInterface networkName](v5->_corewifi, "networkName"), "copy"), v11 = SCDynamicStoreCreate(kCFAllocatorDefault, v8, 0, 0), (v5->_storeRef = v11) == 0))
  {
LABEL_15:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v13 = -[NSString UTF8String](v5->_interfaceName, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to initialize Wi-Fi interface (%{public}s)", buf, 0xCu);
    }

    return 0;
  }
  return v5;
}

- (W5WiFiInterface)init
{
  objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-[W5WiFiInterface init] unavailable"), 0));
}

- (void)setUpdatedWiFiInterfaceCallback:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];

  if (dispatch_get_specific(&self->_queue))
  {

    self->_updatedWiFiCallback = objc_msgSend(a3, "copy");
  }
  else
  {
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004D478;
    v6[3] = &unk_1000D5C20;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(queue, v6);
  }
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *eventQueue;
  __SCDynamicStore *storeRef;
  objc_super v6;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  eventQueue = self->_eventQueue;
  if (eventQueue)
    dispatch_release(eventQueue);
  storeRef = self->_storeRef;
  if (storeRef)
    CFRelease(storeRef);
  if (self->_a11Ref)
    Apple80211Close();

  v6.receiver = self;
  v6.super_class = (Class)W5WiFiInterface;
  -[W5WiFiInterface dealloc](&v6, "dealloc");
}

- (int)role
{
  return -[CWFInterface virtualInterfaceRole](self->_corewifi, "virtualInterfaceRole");
}

- (id)preferredNetworksList
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = -[CWFInterface knownNetworkProfilesWithProperties:](self->_corewifi, "knownNetworkProfilesWithProperties:", +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E8010));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (!v5)
          v5 = +[NSMutableArray array](NSMutableArray, "array");
        objc_msgSend(v5, "addObject:", sub_10004D6A8(v8));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(v5, "copy");
}

- (void)__startEventMonitoring
{
  CWFInterface *corewifi;
  _QWORD v4[5];

  corewifi = self->_corewifi;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004DAFC;
  v4[3] = &unk_1000D6B00;
  v4[4] = self;
  -[CWFInterface setEventHandler:eventID:](corewifi, "setEventHandler:eventID:", v4, +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 0, 0));
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 1, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 2, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 3, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 4, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 6, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 8, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 7, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 14, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 15, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 16, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 17, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 23, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 18, 0), 0);
  -[CWFInterface startMonitoringEvent:error:](self->_corewifi, "startMonitoringEvent:error:", +[CWFEventID eventIDWithType:interfaceName:](CWFEventID, "eventIDWithType:interfaceName:", 24, 0), 0);
  Apple80211EventMonitoringInit2(self->_a11Ref, sub_10004E04C, self, self->_eventQueue);
  Apple80211StartMonitoringEvent(self->_a11Ref, 20);
  Apple80211StartMonitoringEvent(self->_a11Ref, 34);
  Apple80211StartMonitoringEvent(self->_a11Ref, 49);
  Apple80211StartMonitoringEvent(self->_a11Ref, 55);
  Apple80211StartMonitoringEvent(self->_a11Ref, 54);
}

- (void)startEventMonitoring
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E214;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

- (void)__stopEventMonitoring
{
  -[CWFInterface stopMonitoringAllEvents](self->_corewifi, "stopMonitoringAllEvents");
  Apple80211StopMonitoringEvent(self->_a11Ref, 34);
  Apple80211StopMonitoringEvent(self->_a11Ref, 49);
  Apple80211StopMonitoringEvent(self->_a11Ref, 55);
  Apple80211StopMonitoringEvent(self->_a11Ref, 54);
  Apple80211EventMonitoringHalt(self->_a11Ref);
}

- (void)stopEventMonitoring
{
  NSObject *eventQueue;
  _QWORD block[5];

  eventQueue = self->_eventQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E310;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(eventQueue, block);
}

- (void)__updateAWDLRealTimeMode:(BOOL)a3
{
  NSObject *queue;
  _QWORD v4[5];
  BOOL v5;

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E3B4;
  v4[3] = &unk_1000D6B28;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)__updateLastAssociatedSSID
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E438;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__clearLinkQualityUpdates
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004E500;
  block[3] = &unk_1000D5C98;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)__addlinkQualityUpdate:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004E58C;
  v4[3] = &unk_1000D5C48;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (id)linkQualityUpdates
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10004E6A8;
  v10 = sub_10004E6B8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E6C4;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)supportedChannels
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = -[CWFInterface supportedChannelsWithCountryCode:](self->_corewifi, "supportedChannelsWithCountryCode:", 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (!v5)
          v5 = +[NSMutableArray array](NSMutableArray, "array");
        objc_msgSend(v5, "addObject:", sub_10004E830(v8));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(v5, "copy");
}

- (id)lastAssociatedSSID
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10004E6A8;
  v10 = sub_10004E6B8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004E954;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)lastAssociatedSSIDString
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_10004E6A8;
  v10 = sub_10004E6B8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004EA58;
  v5[3] = &unk_1000D5998;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)channel
{
  return sub_10004E830(-[CWFInterface channel](self->_corewifi, "channel"));
}

- (id)performScanOnChannels:(id)a3 translate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(a3);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if (!v8)
          v8 = +[NSMutableArray array](NSMutableArray, "array");
        v12 = objc_alloc_init((Class)CWFChannel);
        objc_msgSend(v12, "setChannel:", objc_msgSend(v11, "channel"));
        objc_msgSend(v12, "setFlags:", objc_msgSend(v11, "flags"));
        objc_msgSend(v8, "addObject:", v12);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v13 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v13, "setIncludeHiddenNetworks:", 1);
  objc_msgSend(v13, "setMergeScanResults:", 0);
  objc_msgSend(v13, "setChannels:", v8);
  objc_msgSend(v13, "setIncludeProperties:", +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E8028));
  v14 = -[CWFInterface performScanWithParameters:error:](self->_corewifi, "performScanWithParameters:error:", v13, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (!v15)
  {
    v17 = 0;
    return objc_msgSend(v17, "copy");
  }
  v16 = v15;
  v17 = 0;
  v18 = *(_QWORD *)v25;
  do
  {
    v19 = 0;
    do
    {
      if (*(_QWORD *)v25 != v18)
        objc_enumerationMutation(v14);
      v20 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v19);
      if (v17)
      {
        if (!v4)
          goto LABEL_20;
LABEL_19:
        v20 = sub_10004ED40(v20);
        goto LABEL_20;
      }
      v17 = +[NSMutableArray array](NSMutableArray, "array");
      if (v4)
        goto LABEL_19;
LABEL_20:
      objc_msgSend(v17, "addObject:", v20);
      v19 = (char *)v19 + 1;
    }
    while (v16 != v19);
    v21 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    v16 = v21;
  }
  while (v21);
  return objc_msgSend(v17, "copy");
}

- (void)disassociate
{
  -[CWFInterface disassociateWithReason:](self->_corewifi, "disassociateWithReason:", 1);
}

- (BOOL)setChannel:(id)a3
{
  id v5;
  uint64_t v7;

  v5 = objc_alloc_init((Class)CWFChannel);
  objc_msgSend(v5, "setChannel:", objc_msgSend(a3, "channel"));
  objc_msgSend(v5, "setFlags:", objc_msgSend(a3, "flags"));
  v7 = 0;
  -[CWFInterface setChannel:error:](self->_corewifi, "setChannel:error:", v5, &v7);
  return v7 == 0;
}

- (id)scanCache:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = a3;
  v5 = objc_alloc_init((Class)CWFScanParameters);
  objc_msgSend(v5, "setCacheOnly:", 1);
  objc_msgSend(v5, "setIncludeHiddenNetworks:", 1);
  objc_msgSend(v5, "setMergeScanResults:", 0);
  objc_msgSend(v5, "setIncludeProperties:", +[NSSet setWithArray:](NSSet, "setWithArray:", &off_1000E8040));
  v6 = -[CWFInterface performScanWithParameters:error:](self->_corewifi, "performScanWithParameters:error:", v5, 0);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
  {
    v9 = 0;
    return objc_msgSend(v9, "copy");
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v16;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v6);
      v12 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
      if (v9)
      {
        if (!v3)
          goto LABEL_9;
LABEL_8:
        v12 = sub_10004ED40(v12);
        goto LABEL_9;
      }
      v9 = +[NSMutableArray array](NSMutableArray, "array");
      if (v3)
        goto LABEL_8;
LABEL_9:
      objc_msgSend(v9, "addObject:", v12);
      v11 = (char *)v11 + 1;
    }
    while (v8 != v11);
    v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    v8 = v13;
  }
  while (v13);
  return objc_msgSend(v9, "copy");
}

- (int64_t)security
{
  return sub_10004F454((uint64_t)-[CWFInterface securityType](self->_corewifi, "securityType"), (uint64_t)-[CWFInterface WEPSubtype](self->_corewifi, "WEPSubtype"), (uint64_t)-[CWFInterface WAPISubtype](self->_corewifi, "WAPISubtype"));
}

- (id)currentNetwork
{
  return sub_10004ED40(-[CWFInterface currentScanResult](self->_corewifi, "currentScanResult"));
}

- (id)currentPreferredNetwork
{
  return sub_10004D6A8(-[CWFInterface currentKnownNetworkProfile](self->_corewifi, "currentKnownNetworkProfile"));
}

- (id)cachedPreferredNetworksListWithUUID:(id)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_10004E6A8;
  v11 = sub_10004E6B8;
  v12 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F5DC;
  block[3] = &unk_1000D6AB0;
  block[4] = a3;
  block[5] = self;
  block[6] = &v7;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)clearCachedPreferredNetworksListWithUUID:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004F6B4;
  v4[3] = &unk_1000D5C48;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (id)__ipv4StateConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv4);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__ipv6StateConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetIPv6);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__ipv4SetupConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetIPv4);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__ipv6SetupConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetIPv6);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__dnsStateConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v3, kSCEntNetDNS);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__dnsSetupConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetDNS);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (id)__proxiesSetupConfig
{
  const __CFString *v3;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  id v8;

  v3 = (const __CFString *)-[CWFInterface networkServiceID](self->_corewifi, "networkServiceID");
  if (!v3)
    return 0;
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, v3, kSCEntNetProxies);
  if (!NetworkServiceEntity)
    return 0;
  v5 = NetworkServiceEntity;
  v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "copy");
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v5);
  return v8;
}

- (int64_t)ipv6ConfigMethod
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004FC18;
  v5[3] = &unk_1000D5D48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (int64_t)ipv4ConfigMethod
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004FDC0;
  v5[3] = &unk_1000D5D48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingCustomDNSSettings
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004FFB8;
  v5[3] = &unk_1000D5D48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isUsingCustomProxySetting
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100050090;
  v5[3] = &unk_1000D5D48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)smartCCADesenseSupported
{
  return 0;
}

- (BOOL)smartCCADesenseUSBPresence
{
  return 0;
}

- (BOOL)isSnifferSupported
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[CWFInterface capabilities](self->_corewifi, "capabilities", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "unsignedIntValue") == 11)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (BOOL)setSTBCEnabled:(BOOL)a3
{
  _BOOL4 v4;
  NSString *v5;
  NSObject *v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  BOOL v11;
  NSObject *v12;
  unsigned int v13;
  NSObject *v15;
  const char *v16;
  int v17;
  uint64_t v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  _BYTE v31[245182];
  __int128 v32;
  __int128 v33;
  uint64_t *v34;

  v18 = 0;
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  v4 = !a3;
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stbc_disable=%d"), !a3);
  __strlcpy_chk(&v32, objc_msgSend(-[CWFInterface interfaceName](self->_corewifi, "interfaceName"), "UTF8String"), 16, 16);
  LODWORD(v33) = 157;
  bzero(&v30, 0x3BDC0uLL);
  v29 = 0x1000000000001;
  v30 = 1;
  __strlcpy_chk(v31, -[NSString UTF8String](v5, "UTF8String"), 128, 128);
  *(_OWORD *)&v31[1446] = xmmword_1000A87F0;
  DWORD2(v33) = 245192;
  v34 = &v29;
  -[CWFInterface setUserAutoJoinDisabled:error:](self->_corewifi, "setUserAutoJoinDisabled:error:", 1, &v18);
  v6 = sub_10008F56C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[CWFInterface userAutoJoinDisabled](self->_corewifi, "userAutoJoinDisabled");
    v19 = 136316162;
    v20 = "-[W5WiFiInterface setSTBCEnabled:]";
    v21 = 2080;
    v22 = "W5WiFiInterface.m";
    v23 = 1024;
    v24 = 1628;
    v25 = 1024;
    v26 = v7;
    v27 = 2114;
    v28 = v18;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v6, 0, "[wifivelocity] %s (%s:%u) Disabled User Auto Join Disabled, status: %d, error: %{public}@", &v19, 44);
  }
  if (v18)
  {
    v15 = sub_10008F56C();
    v11 = 0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315650;
      v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      v21 = 2080;
      v22 = "W5WiFiInterface.m";
      v23 = 1024;
      v24 = 1629;
      LODWORD(v16) = 28;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v15, 0, "[wifivelocity] %s (%s:%u) Unable to disable User Auto Join", &v19, v16);
LABEL_7:
      v11 = 0;
    }
  }
  else
  {
    v8 = Apple80211RawSet(self->_a11Ref, &v32);
    v9 = sub_10008F56C();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v19 = 136316162;
        v20 = "-[W5WiFiInterface setSTBCEnabled:]";
        v21 = 2080;
        v22 = "W5WiFiInterface.m";
        v23 = 1024;
        v24 = 1637;
        v25 = 1024;
        v26 = v4;
        v27 = 1024;
        LODWORD(v28) = v8;
        LODWORD(v16) = 40;
        _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) Failed to set STBC Disable to: %d, error: %d", &v19, v16);
      }
      goto LABEL_7;
    }
    if (v10)
    {
      v19 = 136315906;
      v20 = "-[W5WiFiInterface setSTBCEnabled:]";
      v21 = 2080;
      v22 = "W5WiFiInterface.m";
      v23 = 1024;
      v24 = 1633;
      v25 = 1024;
      v26 = v4;
      LODWORD(v16) = 34;
      _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v9, 0, "[wifivelocity] %s (%s:%u) Successfully set STBC Disable to: %d", (const char *)&v19, v16, v17, v18);
    }
    sub_10008F048((uint64_t)CFSTR("disable_stbc=1"), v4);
    v11 = 1;
  }
  -[CWFInterface setUserAutoJoinDisabled:error:](self->_corewifi, "setUserAutoJoinDisabled:error:", 0, &v18);
  v12 = sub_10008F56C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = -[CWFInterface userAutoJoinDisabled](self->_corewifi, "userAutoJoinDisabled");
    v19 = 136316162;
    v20 = "-[W5WiFiInterface setSTBCEnabled:]";
    v21 = 2080;
    v22 = "W5WiFiInterface.m";
    v23 = 1024;
    v24 = 1643;
    v25 = 1024;
    v26 = v13;
    v27 = 2114;
    v28 = v18;
    LODWORD(v16) = 44;
    _os_log_send_and_compose_impl(1, 0, 0, 0, &_mh_execute_header, v12, 0, "[wifivelocity] %s (%s:%u) Enabled User Auto Join, status: %d, error: %{public}@", &v19, v16);
  }
  return v11;
}

- (id)updatedWiFiCallback
{
  return self->_updatedWiFiCallback;
}

- (void)setUpdatedWiFiCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)isAWDLRealTimeMode
{
  return self->_isAWDLRealTimeMode;
}

@end
